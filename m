Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8C290356
	for <lists+linux-hwmon@lfdr.de>; Fri, 16 Aug 2019 15:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfHPNnA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 16 Aug 2019 09:43:00 -0400
Received: from enpas.org ([46.38.239.100]:33702 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbfHPNm7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Aug 2019 09:42:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id EF03A100170;
        Fri, 16 Aug 2019 13:42:57 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH v4 2/3] hwmon/ltc2990: Generalise DT to fwnode support
Date:   Fri, 16 Aug 2019 15:43:29 +0200
Message-Id: <20190816134330.7727-2-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190816134330.7727-1-max@enpas.org>
References: <20190816134330.7727-1-max@enpas.org>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ltc2990 will now use device_property_read_u32_array() instead of
of_property_read_u32_array() - allowing the use of software nodes
via fwnode_create_software_node().

This allows code using i2c_new_device() to specify a default
measurement mode for the LTC2990 via fwnode_create_software_node().

Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/hwmon/ltc2990.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
index f9431ad43..53ff50517 100644
--- a/drivers/hwmon/ltc2990.c
+++ b/drivers/hwmon/ltc2990.c
@@ -13,7 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 
 #define LTC2990_STATUS	0x00
 #define LTC2990_CONTROL	0x01
@@ -206,7 +206,6 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
 	int ret;
 	struct device *hwmon_dev;
 	struct ltc2990_data *data;
-	struct device_node *of_node = i2c->dev.of_node;
 
 	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_WORD_DATA))
@@ -218,9 +217,10 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
 
 	data->i2c = i2c;
 
-	if (of_node) {
-		ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
-						 data->mode, 2);
+	if (dev_fwnode(&i2c->dev)) {
+		ret = device_property_read_u32_array(&i2c->dev,
+						     "lltc,meas-mode",
+						     data->mode, 2);
 		if (ret < 0)
 			return ret;
 
-- 
2.11.0

