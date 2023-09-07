Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA4C797BB4
	for <lists+linux-hwmon@lfdr.de>; Thu,  7 Sep 2023 20:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242905AbjIGS0u (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 7 Sep 2023 14:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241126AbjIGS0r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Sep 2023 14:26:47 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CD2710F6;
        Thu,  7 Sep 2023 11:26:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,234,1688396400"; 
   d="scan'208";a="175310394"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2023 16:14:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.56])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0669E4010076;
        Thu,  7 Sep 2023 16:14:13 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v6 2/2] hwmon: tmp513: Simplify tmp51x_read_properties()
Date:   Thu,  7 Sep 2023 08:14:04 +0100
Message-Id: <20230907071404.24334-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230907071404.24334-1-biju.das.jz@bp.renesas.com>
References: <20230907071404.24334-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Simplify tmp51x_read_properties() by replacing 'nfactor' ->'data->nfactor'
in device_property_read_u32_array() and drop the local variable as it is
unused.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Added Rb tag from Geert and Andy.
v3:
 * New patch.
---
 drivers/hwmon/tmp513.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index b336b95298ab..8a7cf08733c6 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -653,7 +653,6 @@ static int tmp51x_pga_gain_to_reg(struct device *dev, struct tmp51x_data *data)
 static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 {
 	int ret;
-	u32 nfactor[3];
 	u32 val;
 
 	ret = device_property_read_u32(dev, "shunt-resistor-micro-ohms", &val);
@@ -671,10 +670,8 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
 	if (ret < 0)
 		return ret;
 
-	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
-					    data->max_channels - 1);
-	if (ret >= 0)
-		memcpy(data->nfactor, nfactor, data->max_channels - 1);
+	device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
+				       data->max_channels - 1);
 
 	// Check if shunt value is compatible with pga-gain
 	if (data->shunt_uohms > data->pga_gain * 40 * 1000 * 1000) {
-- 
2.25.1

