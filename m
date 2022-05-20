Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC2152E975
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 May 2022 11:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347973AbiETJy4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 20 May 2022 05:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348025AbiETJyy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:54 -0400
Received: from smtpo52.interia.pl (smtpo52.interia.pl [217.74.67.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69FB114B657
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:52 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:55 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 8/8] hwmon: (lm90) read the channel's offset from device-tree
Date:   Fri, 20 May 2022 11:32:44 +0200
Message-Id: <20220520093243.2523749-9-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040317;
        bh=EN4hRZxKuHTd81cuBG9n6Zwbmm3nhipzCK7dawab70c=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=q31nKgG0DWNsPxujtR+0SqcRaVpXwQW03DMwORa9XYAydFSju8EcMPkiaiSu0W7lQ
         DLO1pl9+XGM6nv5bqaUzmoH753lrqrgyMRHrjx3CAaUd1Qb9wxHtSfBqsYtB8Og0m5
         ZQeXjyGOYHWsYaxykbHMlPAe2/m+8V7lWnqkNp4k=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Try to read the channel's offset from device-tree. Having offset in
device-tree node is not mandatory. The offset can only be set for remote
channels.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index e81cc21e525f..e4e7b4ddbfb6 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1921,6 +1921,7 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 				      struct lm90_data *data)
 {
 	u32 id;
+	s32 val;
 	int err;
 	struct device *dev = &client->dev;
 
@@ -1944,6 +1945,25 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 	if (data->channel_label[id])
 		data->channel_config[id] |= HWMON_T_LABEL;
 
+	err = of_property_read_s32(child, "offset", &val);
+	if (!err) {
+		if (id == 0) {
+			dev_err(dev, "offset can't be set for internal channel\n");
+			return -EINVAL;
+		}
+
+		if (id == 1)
+			err = lm90_set_temp11(data, REMOTE_OFFSET, val);
+		else
+			err = lm90_set_temp11(data, REMOTE2_OFFSET, val);
+
+		if (err) {
+			dev_err(dev, "can't set offset %d for channel %d (%d)\n",
+				val, id, err);
+			return err;
+		}
+	}
+
 	return 0;
 }
 
@@ -2091,6 +2111,12 @@ static int lm90_probe(struct i2c_client *client)
 				err = lm90_update_confreg(data, data->config | 0x04);
 				if (err)
 					return err;
+
+				/*
+				 * In lm90_parse_dt_channel_info() we might set offset, so we need
+				 * to use correct format indication before that
+				 */
+				data->flags |= LM90_FLAG_ADT7461_EXT;
 			}
 		}
 
-- 
2.36.1

