Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD14226F8B
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Jul 2020 22:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731154AbgGTUOr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Jul 2020 16:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbgGTUOq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jul 2020 16:14:46 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D232AC061794
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2020 13:14:45 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id y9so11099883plr.9
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2020 13:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=WXyRYBH3lUh7Umxi2hQ4QtCTReXFYZYL0z8hscZP+wo=;
        b=AbCwKuR9T/1CW5k9yah+qNwtVfR+CZ+owvkLdgnoW02XcdReVJXFhxPJQdMZ6NBU9s
         6n/Xmm4xRpSFeYJr4hhWiGWItWb3wd0jIwPqWY7/npRaaL3gYa4mK2XwI2UBinbq0Q5j
         R6MCK0ksI09BwxZvNKp6JYUuQH5TiOC9nAXni7luaCYHXqYqIUhgatF6LgBbQjEx0S+l
         KIYRE6zTsmnxP1aODkjtTaoWBfsyoSoWVpzjoyXzEZfNVVhtW8vS6ex+d33sQhZuNNfG
         Bol7OHnyDRq4Ku5WBMfw+kVptxV/rgSFDOLx4ND/GNdcYuseULZwF0h59sswPV8fWcHD
         icDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=WXyRYBH3lUh7Umxi2hQ4QtCTReXFYZYL0z8hscZP+wo=;
        b=SBe2xkEHnJ40jLIprX7VG9hlZcwrNRzlMAOqfq7INKFrfGcf2YqiYIIaSHM7haHWhv
         CSU7f9MZ8OVn7AU9qc3Rp4WE8aQMk6igB/v/LfacICOvxfmqq2/d1SFoJy/e31bEygAH
         MehT6++wr+APJMbShASgcWO23BT+e9YTjHiYM0erdaWriSrQVkshf/YibCGLOTN4rbcg
         UoxbIGFjCNzza27DtcuDdU2ORiwBdsLreYdfNHGfwSP+ONgbK6yyyIS2ygoPMBCS0zDL
         hqr7nOjNud87wok2PU02x9Lz29dMaZmifTZWhz3FVqw+ToDltSiU39Nbze3OnNbLYy+m
         v6uQ==
X-Gm-Message-State: AOAM531vPqHGa2DEIRuXP3YNKZqVkx07lEPnanorW22Ls4iHD7Bm7dkI
        AxyTeX1WUFnf8kK0DmacZJgOas4El0pN6LQT
X-Google-Smtp-Source: ABdhPJzJdB5vVYeTESa4TojPzKbv2IbuTs5hlhZh2o3UdEOdno8ALDzergtCvkt5KWEBkH+J0skw3c4y5QOgwm7Z
X-Received: by 2002:a17:90a:368c:: with SMTP id t12mr1111761pjb.90.1595276085336;
 Mon, 20 Jul 2020 13:14:45 -0700 (PDT)
Date:   Mon, 20 Jul 2020 20:14:41 +0000
Message-Id: <20200720201441.1871285-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v2] hwmon: adm1272: Enable temperature sampling for adm1272 adm1278
From:   Chu Lin <linchuyuan@google.com>
To:     linux@roeck-us.net, jdelvare@suse.com
Cc:     =belgaied@google.com, jasonling@google.com, linchuyuan@google.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqil@google.com
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
	Introducing device tree binding analog-temperature1-enable. If the
flag is set, flip the temp1_en control bit on probing.

Testing:
1). iotools smbus_write16 35 0x10 0xd4 0x0037 // disable the temp1_en
2). recompile the dt to have  analog-temperature1-enable set
3). Probe the driver and make sure tempX shows up in hwmon

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 drivers/hwmon/pmbus/adm1275.c | 36 +++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 19317575d1c6..ae28820b3e31 100644
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
 
+	temp1_en = of_property_read_bool(client->dev.of_node, "analog-temperature1-enable") &&
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
2.28.0.rc0.105.gf9edc3c819-goog

