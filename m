Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FB721AC20
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2020 02:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGJAo0 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 9 Jul 2020 20:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgGJAo0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Jul 2020 20:44:26 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31188C08C5DC
        for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2020 17:44:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id r17so4999764ybj.22
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2020 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=t9i52B1pRW7NNwQem2xtfhHz6MEicsdkhoSgH5EUEqk=;
        b=MYNbUmQAXNqG4ukLS28pTAIVaO2vxHhB9bnpmh9rZrc1N5YX4Lq8dRgGFCrN0ufd09
         piKx95RRMn2xddJjPUsGj/I0esIuVF3VWtnunx3aA5YXBqnS+Ej33vL4rHnkGvk0sAfD
         eaxSIw341JGOx/0diPeyckGAJx2E8P7oqQN58n0pDeuTml8MspBhdSwJQBmh37Dx1sG0
         5UZqPA0csot1jpFpBFolSNsocwlfqHi3aSEppDR6iTFctqW3Nb/BwqlUqVpq1BeSugtI
         bgihtvM852llZCE4toFDe5mFwXN6IGJVtVhlvoazPMtXQrgQwdSrbAz3GFVLrnPPlXV/
         J1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=t9i52B1pRW7NNwQem2xtfhHz6MEicsdkhoSgH5EUEqk=;
        b=fwXiAQzOEv+1nhmo8TpyDqf71fWylBugGmv2jY+Ny1c3dVhfAQphlWPACDBB0Vl9Xr
         MG/mZHzq6eNHIGKsypJYUS4DFEXeeMHdUKrx/jxVvZgT6ZU0Vxb6MxMD8JakWacbkdzD
         QSSwhyh8/6NeHY4gGpP3zmoNLK/reImTuFCPGWRFlQTiekbAOND1tBnyuW6kctH/41/t
         IPrGbDarctsvNPt6khPDp2qNbcZwinM0Wz7CqgPNl9zahXC416UuI/6PQg5IpTzjq+WK
         mOxG1DHOTWLViChX5tdUtSDYkDAYC/6N4yXS6XuLRmXtfjTEdKvkJGCRfGbmsxcvWidk
         9ToQ==
X-Gm-Message-State: AOAM531PAZvCbEvQVAJT8z1XdxGPbi+e25HLoYNmnk+DE4wo2TXh9SHa
        i2R8DyHXTSAXKTJ4aRQ257jOzj9GdgvbhLMa
X-Google-Smtp-Source: ABdhPJx3cXh4hzy135F82CgEDevTpjt3qDsmiQcYtuxGbFeAaepZZSPY/LdQE0FqgKXxYz3NZikYmocTfGCRD8Lh
X-Received: by 2002:a25:b28d:: with SMTP id k13mr18719127ybj.162.1594341865353;
 Thu, 09 Jul 2020 17:44:25 -0700 (PDT)
Date:   Fri, 10 Jul 2020 00:44:22 +0000
Message-Id: <20200710004422.298090-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH] hwmon: adm1272: Enable temperature sampling for adm1272 adm1278
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net
Cc:     belgaied@google.com, jasonling@google.com, jdelvare@suse.com,
        linchuyuan@google.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqil@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Problem:
	adm1272 and adm1278 supports temperature sampling. The
current way of enabling it requires the user manually unbind the device
from the driver, flip the temperature sampling control bit and then bind
the device back to the driver. It would be nice if we can control this in a
better way by reading the dt.

Solution:
	Introducing device tree binding adm1272-adm1278-temp1-en. If the
flag is set, flip the temp1_en control bit on probing.

Testing:
1). iotools smbus_write16 35 0x10 0xd4 0x0037 // disable the temp1_en
2). recompile the dt to have  adm1272-adm1278-temp1-en set
3). Probe the driver and make sure tempX shows up in hwmon

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/pmbus/adm1275.c | 36 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 19317575d1c6..293308875162 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -475,6 +475,7 @@ static int adm1275_probe(struct i2c_client *client,
 	const struct coefficients *coefficients;
 	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
 	int tindex = -1;
+	bool temp1_en;
 	u32 shunt;
 
 	if (!i2c_check_functionality(client->adapter,
@@ -536,6 +537,9 @@ static int adm1275_probe(struct i2c_client *client,
 	if (shunt == 0)
 		return -EINVAL;
 
+	temp1_en = of_property_read_bool(client->dev.of_node, "adm1272-adm1278-temp1-en") &&
+		(mid->driver_data == adm1272 || mid->driver_data == adm1278);
+
 	data->id = mid->driver_data;
 
 	info = &data->info;
@@ -614,16 +618,18 @@ static int adm1275_probe(struct i2c_client *client,
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 
+		ret = config;
+		/* Enable temp if it is instructed by dt (it is disabled by default) */
+		if (temp1_en && !(config & ADM1278_TEMP1_EN))
+			config |= ADM1278_TEMP1_EN;
 		/* Enable VOUT if not enabled (it is disabled by default) */
-		if (!(config & ADM1278_VOUT_EN)) {
+		if (!(config & ADM1278_VOUT_EN))
 			config |= ADM1278_VOUT_EN;
-			ret = i2c_smbus_write_byte_data(client,
-							ADM1275_PMON_CONFIG,
-							config);
+		if (ret != config) {
+			ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, config);
 			if (ret < 0) {
-				dev_err(&client->dev,
-					"Failed to enable VOUT monitoring\n");
-				return -ENODEV;
+				dev_err(&client->dev, "Failed to enable config control bits");
+				return ret;
 			}
 		}
 
@@ -685,16 +691,18 @@ static int adm1275_probe(struct i2c_client *client,
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
 			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 
+		ret = config;
+		/* Enable temp if it is instructed by dt (it is disabled by default) */
+		if (temp1_en && !(config & ADM1278_TEMP1_EN))
+			config |= ADM1278_TEMP1_EN;
 		/* Enable VOUT if not enabled (it is disabled by default) */
-		if (!(config & ADM1278_VOUT_EN)) {
+		if (!(config & ADM1278_VOUT_EN))
 			config |= ADM1278_VOUT_EN;
-			ret = i2c_smbus_write_byte_data(client,
-							ADM1275_PMON_CONFIG,
-							config);
+		if (ret != config) {
+			ret = i2c_smbus_write_word_data(client, ADM1275_PMON_CONFIG, config);
 			if (ret < 0) {
-				dev_err(&client->dev,
-					"Failed to enable VOUT monitoring\n");
-				return -ENODEV;
+				dev_err(&client->dev, "Failed to enable config control bits");
+				return ret;
 			}
 		}
 
-- 
2.27.0.383.g050319c2ae-goog

