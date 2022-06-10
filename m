Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E432C5465F9
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jun 2022 13:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345515AbiFJLry (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 10 Jun 2022 07:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242326AbiFJLru (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Jun 2022 07:47:50 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A42F939C3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jun 2022 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654861669;
  x=1686397669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=thRwgXf/xEpaLsyxQyzXsCTx5N4pg+4iAzeWAe70f4A=;
  b=Gl2918qUOTdbX5IyM9dAvB3EN6WvtioHlY6yxVEOWZldn63+2hWcreU2
   zTg9tNqddQT3xpUzLiwi7aW76rafjYMJgydagyISUoF83xDf3YOjNo+un
   bu/4N70fPjToLrS6JpeZcI/SwDH8z/+74lB+Q06V8+dI1NQ6bYf9cIdPA
   XdOIVWf7w0bpBfCclG/cY8jfgOWGKe8CZ9HgpKR62wHy2eVGto2BgXcPc
   hcpLD4b7W5QXPSS7Rg0xlyGamKbVyn4prdBlgpC1acMLBWn6EEvrNNe4c
   v7v9zW9GDCi2SSskq1YFiROMC+dM9O1zFN9/Tpm6JDAZxv0dO+x6q/DtE
   w==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v2 1/3] hwmon: (pmbus) Introduce and use cached vout margins
Date:   Fri, 10 Jun 2022 13:47:30 +0200
Message-ID: <20220610114732.2370242-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220610114732.2370242-1-marten.lindahl@axis.com>
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When setting a new voltage the voltage boundaries are read every time to
check that the new voltage is within the proper range. Checking these
voltage boundaries consists of reading one of PMBUS_MFR_VOUT_MIN/
PMBUS_VOUT_MARGIN_LOW registers and then PMBUS_MFR_VOUT_MAX/
PMBUS_VOUT_MARGIN_HIGH together with writing the PMBUS_CLEAR_FAULTS
register.

Since these boundaries are never being changed, it can be cached and
thus saving unnecessary smbus transmissions.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 54 +++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 02912022853d..478dda49a45f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -104,6 +104,9 @@ struct pmbus_data {
 
 	s16 currpage;	/* current page, -1 for unknown/unset */
 	s16 currphase;	/* current phase, 0xff for all, -1 for unknown/unset */
+
+	int vout_low[PMBUS_PAGES];	/* voltage low margin */
+	int vout_high[PMBUS_PAGES];	/* voltage high margin */
 };
 
 struct pmbus_debugfs_entry {
@@ -2667,34 +2670,41 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 		.data = -1,
 	};
 	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
-	int low, high;
 
 	*selector = 0;
 
-	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
-	if (s.data < 0) {
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
-		if (s.data < 0)
-			return s.data;
-	}
-	low = pmbus_reg2data(data, &s);
-
-	s.data = -1;
-	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
-	if (s.data < 0) {
-		s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
-		if (s.data < 0)
-			return s.data;
+	if (!data->vout_low[s.page]) {
+		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_MFR_VOUT_MIN);
+		if (s.data < 0) {
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_VOUT_MARGIN_LOW);
+			if (s.data < 0)
+				return s.data;
+		}
+		data->vout_low[s.page] = pmbus_reg2data(data, &s);
+	}
+
+	if (!data->vout_high[s.page]) {
+		s.data = -1;
+		if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_MFR_VOUT_MAX);
+		if (s.data < 0) {
+			s.data = _pmbus_read_word_data(client, s.page, 0xff,
+						       PMBUS_VOUT_MARGIN_HIGH);
+			if (s.data < 0)
+				return s.data;
+		}
+		data->vout_high[s.page] = pmbus_reg2data(data, &s);
 	}
-	high = pmbus_reg2data(data, &s);
 
 	/* Make sure we are within margins */
-	if (low > val)
-		val = low;
-	if (high < val)
-		val = high;
+	if (data->vout_low[s.page] > val)
+		val = data->vout_low[s.page];
+	if (data->vout_high[s.page] < val)
+		val = data->vout_high[s.page];
 
 	val = pmbus_data2reg(data, &s, val);
 
-- 
2.30.2

