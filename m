Return-Path: <linux-hwmon+bounces-2979-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C82B928EDD
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jul 2024 23:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F4D91C22659
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jul 2024 21:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB8817A92C;
	Fri,  5 Jul 2024 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSmMqGUl"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC47178CE2;
	Fri,  5 Jul 2024 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720215370; cv=none; b=kiopyIz8a8CusiJ+p6LxG//td+0a/cM7D00tx3TDJ7hO0LiVvOpGb6vSuFpkgGIJZoRy6yK0KJgCyyFxPTKHzu/Lfr9/q3WBRIMQtpbSSPSl64091A64frHoWcahLrGe0I5PFhuZ/TPQi93CqQ8RvgvxjKfcOnvasOVDxIILytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720215370; c=relaxed/simple;
	bh=/9PpBfF+RArG7cczGRJ3ppTU5wZ+giMRXEw4TGDyCOU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sReSitdzPuDYu2UwGOyMwzNxUud/h1gohgsZ1Wri57d3vDJquFHKiQ17pKiCIjFyeXg9AadApdH/GxsHdQpWa9l/tFzsWvAhiXfeQ8SJeoKTTM10UFZTMiro6TwzOACRWGRl0eYqqdSDoGFFwNmLBBM79LL1xtJkyaTn9MRXKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSmMqGUl; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso1203817a12.0;
        Fri, 05 Jul 2024 14:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720215366; x=1720820166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhdA739oTqOpGzb3rrmVcO8dEMqpQJTflzDG/hQqY/8=;
        b=eSmMqGUlKhvC/GTnNzWS5yp6enC5HXJosjNRyZA4yOjLX8B2DXDIR/e7AY9G/eFyDB
         B77YlqA47bJIY4vnZm3WRkvPA1sTfyI+xIdnU9sez7JX6g+nfXhHawRZmQxo89G6WPXR
         EUpTKEtKbwOHN6uTwTBQohKXir9/lMRksYt9+V5dlR1K1hL+DFtE+MFmWdhtHug9qCM1
         JtffdFCpzB8jgQzrcTvEvkQrdoaaXY2GRzR0Ixu3Nvy6+j6HO1Mvdbm0RB1b7Ry2YGZE
         zPR0ouAkYXswOXTId0+beSSSalfPKS/Oc9ljDvHIQCsYqJloFMAueiPo+I8Fow1IJW5M
         TwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720215366; x=1720820166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhdA739oTqOpGzb3rrmVcO8dEMqpQJTflzDG/hQqY/8=;
        b=YN9/Xe/4JGu4uxXfLkO5qQsUH46EeoBzzL8ktqIOKoY0cJEObT8Ute7MfxKeGfXJNA
         xKV9pSyJ2qTkukjdQCiWoGqnk2U2hkW1DOWOXjk/BAgHOmarfQZv2IkTGj5GRXTPjUbl
         UPpJ4FUIY+tMwYUwRZLn10ZWz6/TQcD6cFhbHprOjO2s6JSvzBo9SKdpnYkbd4M1fExQ
         hdSk7bSw/sO3EgVgeu+8VzCjKrcWGoaeKPpiHbGybsT1gh3d822fSD4ehHn1hRMI+cLh
         REmCa/xGtku+5ptojhh0uClQpUyXCO2gZMiTnW3DWnWDGjD6vNvgHXrrykO2zRILNgPd
         ewPA==
X-Gm-Message-State: AOJu0YwmeqF9yxpodZkMHERDOK0RkJZuTeKEXOvKw6m/2EdHYirpAYAH
	vZEZE6Mcs93qFDphJi0hZWid8C8Nmcaenu5Xm/E9cf0N7RRvMnhTCFCYwA==
X-Google-Smtp-Source: AGHT+IFSp2AWOQn8gM+VryCBbL9u4bZ/Lr8n8k1Xc1JSiTbFnlmQ/DM1b5Whsi0i6sILcfx7f0OjzQ==
X-Received: by 2002:a05:6a20:3cac:b0:1bd:2877:458b with SMTP id adf61e73a8af0-1c0cc73e6e2mr6752881637.15.1720215366179;
        Fri, 05 Jul 2024 14:36:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b515f1sm11627240a12.6.2024.07.05.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 14:36:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 09/11] hwmon: (amc6821) Convert to use regmap
Date: Fri,  5 Jul 2024 14:35:45 -0700
Message-Id: <20240705213547.1155690-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705213547.1155690-1-linux@roeck-us.net>
References: <20240705213547.1155690-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use regmap for register accesses and caching.

While at it, use sysfs_emit() instead of sprintf() to write sysfs
attribute data, and remove spurious debug messages which would only
be seen as result of a bug in the code. Also make sure that error
codes are propagated and not replaced with -EIO.

While at it, introduce rounding of written temperature values and for
internal calculations to reduce deviation from written values and as
much as possible.

No functional change intended except for differences introduced by
rounding.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: Improve function comments
    Better use of BIT(), FIELD_GET(), and FIELD_PREP()
    Use min() instead of clamp_val() in fan_store() since it is already
    known that the value is > 0
    In pwm1_auto_point_pwm_store(), use '0' for unlimited to match
    the original code
    In set_slope_register(), set both temperature limit and
    slope to avoid an extra register write operation when setting the
    limit
    In temp_auto_point_temp_store(), only read the other set of
    temperature registers when writing the PSV temperature

v3: Add more details to patch description
    Cache all attributes
    Introduce rounding when writing attributes and for some calculations
    Always return error codes from regmap operations; never replace with
    -EIO

v2: Drop another spurious debug message in this patch instead of patch 10
    Add missing "select REGMAP_I2C" to Kconfig
    Change misleading variable name from 'mask' to 'mode'.
    Use sysfs_emit instead of sprintf everywhere

 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/amc6821.c | 822 +++++++++++++++++++---------------------
 2 files changed, 381 insertions(+), 442 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e14ae18a973b..a8fa87a96e8f 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2127,6 +2127,7 @@ config SENSORS_ADS7871
 config SENSORS_AMC6821
 	tristate "Texas Instruments AMC6821"
 	depends on I2C
+	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Texas Instruments
 	  AMC6821 hardware monitoring chips.
diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 295a9148779d..90efd6a0dfd3 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -8,15 +8,18 @@
  * Copyright (C) 2007 Hans J. Koch <hjk@hansjkoch.de>
  */
 
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/jiffies.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 /*
@@ -44,6 +47,7 @@ module_param(init, int, 0444);
 #define AMC6821_REG_CONF4		0x04
 #define AMC6821_REG_STAT1		0x02
 #define AMC6821_REG_STAT2		0x03
+#define AMC6821_REG_TEMP_LO		0x06
 #define AMC6821_REG_TDATA_LOW		0x08
 #define AMC6821_REG_TDATA_HI		0x09
 #define AMC6821_REG_LTEMP_HI		0x0A
@@ -61,11 +65,8 @@ module_param(init, int, 0444);
 #define AMC6821_REG_DCY_LOW_TEMP	0x21
 
 #define AMC6821_REG_TACH_LLIMITL	0x10
-#define AMC6821_REG_TACH_LLIMITH	0x11
 #define AMC6821_REG_TACH_HLIMITL	0x12
-#define AMC6821_REG_TACH_HLIMITH	0x13
 #define AMC6821_REG_TACH_SETTINGL	0x1e
-#define AMC6821_REG_TACH_SETTINGH	0x1f
 
 #define AMC6821_CONF1_START		BIT(0)
 #define AMC6821_CONF1_FAN_INT_EN	BIT(1)
@@ -108,6 +109,9 @@ module_param(init, int, 0444);
 #define AMC6821_STAT2_L_THERM		BIT(6)
 #define AMC6821_STAT2_THERM_IN		BIT(7)
 
+#define AMC6821_TEMP_SLOPE_MASK		GENMASK(2, 0)
+#define AMC6821_TEMP_LIMIT_MASK		GENMASK(7, 3)
+
 enum {IDX_TEMP1_INPUT = 0, IDX_TEMP1_MIN, IDX_TEMP1_MAX,
 	IDX_TEMP1_CRIT, IDX_TEMP2_INPUT, IDX_TEMP2_MIN,
 	IDX_TEMP2_MAX, IDX_TEMP2_CRIT,
@@ -130,224 +134,158 @@ static const u8 fan_reg_low[] = {AMC6821_REG_TDATA_LOW,
 			AMC6821_REG_TACH_HLIMITL,
 			AMC6821_REG_TACH_SETTINGL, };
 
-static const u8 fan_reg_hi[] = {AMC6821_REG_TDATA_HI,
-			AMC6821_REG_TACH_LLIMITH,
-			AMC6821_REG_TACH_HLIMITH,
-			AMC6821_REG_TACH_SETTINGH, };
-
 /*
  * Client data (each client gets its own)
  */
 
 struct amc6821_data {
-	struct i2c_client *client;
+	struct regmap *regmap;
 	struct mutex update_lock;
-	bool valid; /* false until following fields are valid */
-	unsigned long last_updated; /* in jiffies */
-
-	/* register values */
-	int temp[TEMP_IDX_LEN];
-
-	u16 fan[FAN1_IDX_LEN];
-	u8 fan1_pulses;
-
-	u8 pwm1;
-	u8 temp1_auto_point_temp[3];
-	u8 temp2_auto_point_temp[3];
-	u8 pwm1_auto_point_pwm[3];
-	u8 pwm1_enable;
-	u8 pwm1_auto_channels_temp;
-
-	u8 stat1;
-	u8 stat2;
 };
 
-static struct amc6821_data *amc6821_update_device(struct device *dev)
+/*
+ * Return 0 on success or negative error code.
+ *
+ * temps returns set of three temperatures, in °C:
+ * temps[0]: Passive cooling temperature, applies to both channels
+ * temps[1]: Low temperature, start slope calculations
+ * temps[2]: High temperature
+ *
+ * Channel 0: local, channel 1: remote.
+ */
+static int amc6821_get_auto_point_temps(struct regmap *regmap, int channel, u8 *temps)
 {
-	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int timeout = HZ;
-	u8 reg;
-	int i;
+	u32 pwm, regval;
+	int err;
 
-	mutex_lock(&data->update_lock);
+	err = regmap_read(regmap, AMC6821_REG_DCY_LOW_TEMP, &pwm);
+	if (err)
+		return err;
 
-	if (time_after(jiffies, data->last_updated + timeout) ||
-			!data->valid) {
+	err = regmap_read(regmap, AMC6821_REG_PSV_TEMP, &regval);
+	if (err)
+		return err;
+	temps[0] = regval;
 
-		for (i = 0; i < TEMP_IDX_LEN; i++)
-			data->temp[i] = (int8_t)i2c_smbus_read_byte_data(
-				client, temp_reg[i]);
+	err = regmap_read(regmap,
+			  channel ? AMC6821_REG_RTEMP_FAN_CTRL : AMC6821_REG_LTEMP_FAN_CTRL,
+			  &regval);
+	if (err)
+		return err;
+	temps[1] = FIELD_GET(AMC6821_TEMP_LIMIT_MASK, regval) * 4;
 
-		data->stat1 = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_STAT1);
-		data->stat2 = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_STAT2);
+	regval = BIT(5) >> FIELD_GET(AMC6821_TEMP_SLOPE_MASK, regval);
+	if (regval)
+		temps[2] = temps[1] + DIV_ROUND_CLOSEST(255 - pwm, regval);
+	else
+		temps[2] = 255;
 
-		data->pwm1 = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_DCY);
-		for (i = 0; i < FAN1_IDX_LEN; i++) {
-			data->fan[i] = i2c_smbus_read_byte_data(
-					client,
-					fan_reg_low[i]);
-			data->fan[i] += i2c_smbus_read_byte_data(
-					client,
-					fan_reg_hi[i]) << 8;
-		}
-		data->fan1_pulses = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_CONF4);
-		data->fan1_pulses = data->fan1_pulses & AMC6821_CONF4_PSPR ? 4 : 2;
-
-		data->pwm1_auto_point_pwm[0] = 0;
-		data->pwm1_auto_point_pwm[2] = 255;
-		data->pwm1_auto_point_pwm[1] = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_DCY_LOW_TEMP);
-
-		data->temp1_auto_point_temp[0] =
-			i2c_smbus_read_byte_data(client,
-					AMC6821_REG_PSV_TEMP);
-		data->temp2_auto_point_temp[0] =
-				data->temp1_auto_point_temp[0];
-		reg = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_LTEMP_FAN_CTRL);
-		data->temp1_auto_point_temp[1] = (reg & 0xF8) >> 1;
-		reg &= 0x07;
-		reg = 0x20 >> reg;
-		if (reg > 0)
-			data->temp1_auto_point_temp[2] =
-				data->temp1_auto_point_temp[1] +
-				(data->pwm1_auto_point_pwm[2] -
-				data->pwm1_auto_point_pwm[1]) / reg;
-		else
-			data->temp1_auto_point_temp[2] = 255;
-
-		reg = i2c_smbus_read_byte_data(client,
-			AMC6821_REG_RTEMP_FAN_CTRL);
-		data->temp2_auto_point_temp[1] = (reg & 0xF8) >> 1;
-		reg &= 0x07;
-		reg = 0x20 >> reg;
-		if (reg > 0)
-			data->temp2_auto_point_temp[2] =
-				data->temp2_auto_point_temp[1] +
-				(data->pwm1_auto_point_pwm[2] -
-				data->pwm1_auto_point_pwm[1]) / reg;
-		else
-			data->temp2_auto_point_temp[2] = 255;
-
-		reg = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF1);
-		reg = (reg >> 5) & 0x3;
-		switch (reg) {
-		case 0: /*open loop: software sets pwm1*/
-			data->pwm1_auto_channels_temp = 0;
-			data->pwm1_enable = 1;
-			break;
-		case 2: /*closed loop: remote T (temp2)*/
-			data->pwm1_auto_channels_temp = 2;
-			data->pwm1_enable = 2;
-			break;
-		case 3: /*closed loop: local and remote T (temp2)*/
-			data->pwm1_auto_channels_temp = 3;
-			data->pwm1_enable = 3;
-			break;
-		case 1: /*
-			 * semi-open loop: software sets rpm, chip controls
-			 * pwm1
-			 */
-			data->pwm1_auto_channels_temp = 0;
-			data->pwm1_enable = 4;
-			break;
-		}
-
-		data->last_updated = jiffies;
-		data->valid = true;
-	}
-	mutex_unlock(&data->update_lock);
-	return data;
+	return 0;
 }
 
 static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
+	struct amc6821_data *data = dev_get_drvdata(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
+	u32 regval;
+	int err;
 
-	return sprintf(buf, "%d\n", data->temp[ix] * 1000);
+	err = regmap_read(data->regmap, temp_reg[ix], &regval);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", sign_extend32(regval, 7) * 1000);
 }
 
 static ssize_t temp_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	int ix = to_sensor_dev_attr(attr)->index;
 	long val;
+	int err;
 
 	int ret = kstrtol(buf, 10, &val);
 	if (ret)
 		return ret;
 	val = clamp_val(val / 1000, -128, 127);
 
-	mutex_lock(&data->update_lock);
-	data->temp[ix] = val;
-	if (i2c_smbus_write_byte_data(client, temp_reg[ix], data->temp[ix])) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
-		count = -EIO;
-	}
-	mutex_unlock(&data->update_lock);
+	err = regmap_write(data->regmap, temp_reg[ix], val);
+	if (err)
+		return err;
+
 	return count;
 }
 
 static ssize_t temp_alarm_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
+	struct amc6821_data *data = dev_get_drvdata(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
-	u8 flag;
+	u32 regval, mask, reg;
+	int err;
 
 	switch (ix) {
 	case IDX_TEMP1_MIN:
-		flag = data->stat1 & AMC6821_STAT1_LTL;
+		reg = AMC6821_REG_STAT1;
+		mask = AMC6821_STAT1_LTL;
 		break;
 	case IDX_TEMP1_MAX:
-		flag = data->stat1 & AMC6821_STAT1_LTH;
+		reg = AMC6821_REG_STAT1;
+		mask = AMC6821_STAT1_LTH;
 		break;
 	case IDX_TEMP1_CRIT:
-		flag = data->stat2 & AMC6821_STAT2_LTC;
+		reg = AMC6821_REG_STAT2;
+		mask = AMC6821_STAT2_LTC;
 		break;
 	case IDX_TEMP2_MIN:
-		flag = data->stat1 & AMC6821_STAT1_RTL;
+		reg = AMC6821_REG_STAT1;
+		mask = AMC6821_STAT1_RTL;
 		break;
 	case IDX_TEMP2_MAX:
-		flag = data->stat1 & AMC6821_STAT1_RTH;
+		reg = AMC6821_REG_STAT1;
+		mask = AMC6821_STAT1_RTH;
 		break;
 	case IDX_TEMP2_CRIT:
-		flag = data->stat2 & AMC6821_STAT2_RTC;
+		reg = AMC6821_REG_STAT2;
+		mask = AMC6821_STAT2_RTC;
 		break;
 	default:
-		dev_dbg(dev, "Unknown attr->index (%d).\n", ix);
 		return -EINVAL;
 	}
-	if (flag)
-		return sprintf(buf, "1");
-	else
-		return sprintf(buf, "0");
+	err = regmap_read(data->regmap, reg, &regval);
+	if (err)
+		return err;
+	return sysfs_emit(buf, "%d\n", !!(regval & mask));
 }
 
 static ssize_t temp2_fault_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	if (data->stat1 & AMC6821_STAT1_RTF)
-		return sprintf(buf, "1");
-	else
-		return sprintf(buf, "0");
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	u32 regval;
+	int err;
+
+	err = regmap_read(data->regmap, AMC6821_REG_STAT1, &regval);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", !!(regval & AMC6821_STAT1_RTF));
 }
 
 static ssize_t pwm1_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	return sprintf(buf, "%d\n", data->pwm1);
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	u32 regval;
+	int err;
+
+	err = regmap_read(data->regmap, AMC6821_REG_DCY, &regval);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", regval);
 }
 
 static ssize_t pwm1_store(struct device *dev,
@@ -355,24 +293,43 @@ static ssize_t pwm1_store(struct device *dev,
 			  size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	u8 val;
 	int ret = kstrtou8(buf, 10, &val);
 	if (ret)
 		return ret;
 
-	mutex_lock(&data->update_lock);
-	data->pwm1 = val;
-	i2c_smbus_write_byte_data(client, AMC6821_REG_DCY, data->pwm1);
-	mutex_unlock(&data->update_lock);
+	ret = regmap_write(data->regmap, AMC6821_REG_DCY, val);
+	if (ret)
+		return ret;
+
 	return count;
 }
 
 static ssize_t pwm1_enable_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	return sprintf(buf, "%d\n", data->pwm1_enable);
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	int err;
+	u32 val;
+
+	err = regmap_read(data->regmap, AMC6821_REG_CONF1, &val);
+	if (err)
+		return err;
+	switch (val & (AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1)) {
+	case 0:
+		val = 1;	/* manual */
+		break;
+	case AMC6821_CONF1_FDRC0:
+		val = 4;	/* target rpm (fan1_target) controlled */
+		break;
+	case AMC6821_CONF1_FDRC1:
+		val = 2;	/* remote temp controlled */
+		break;
+	default:
+		val = 3;	/* max(local, remote) temp controlled */
+		break;
+	}
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t pwm1_enable_store(struct device *dev,
@@ -380,49 +337,37 @@ static ssize_t pwm1_enable_store(struct device *dev,
 				 const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	long val;
-	int config = kstrtol(buf, 10, &val);
-	if (config)
-		return config;
+	u32 mode;
+	int err;
 
-	mutex_lock(&data->update_lock);
-	config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF1);
-	if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-			count = config;
-			goto unlock;
-	}
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
 
 	switch (val) {
 	case 1:
-		config &= ~AMC6821_CONF1_FDRC0;
-		config &= ~AMC6821_CONF1_FDRC1;
+		mode = 0;
 		break;
 	case 2:
-		config &= ~AMC6821_CONF1_FDRC0;
-		config |= AMC6821_CONF1_FDRC1;
+		mode = AMC6821_CONF1_FDRC1;
 		break;
 	case 3:
-		config |= AMC6821_CONF1_FDRC0;
-		config |= AMC6821_CONF1_FDRC1;
+		mode = AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1;
 		break;
 	case 4:
-		config |= AMC6821_CONF1_FDRC0;
-		config &= ~AMC6821_CONF1_FDRC1;
+		mode = AMC6821_CONF1_FDRC0;
 		break;
 	default:
-		count = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
-	if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF1, config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			count = -EIO;
-	}
-unlock:
-	mutex_unlock(&data->update_lock);
+
+	err = regmap_update_bits(data->regmap, AMC6821_REG_CONF1,
+				 AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1,
+				 mode);
+	if (err)
+		return err;
+
 	return count;
 }
 
@@ -430,130 +375,166 @@ static ssize_t pwm1_auto_channels_temp_show(struct device *dev,
 					    struct device_attribute *devattr,
 					    char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	return sprintf(buf, "%d\n", data->pwm1_auto_channels_temp);
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	u32 val;
+	int err;
+
+	err = regmap_read(data->regmap, AMC6821_REG_CONF1, &val);
+	if (err)
+		return err;
+	switch (val & (AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1)) {
+	case 0:
+	case AMC6821_CONF1_FDRC0:
+		val = 0;	/* manual or target rpm controlled */
+		break;
+	case AMC6821_CONF1_FDRC1:
+		val = 2;	/* remote temp controlled */
+		break;
+	default:
+		val = 3;	/* max(local, remote) temp controlled */
+		break;
+	}
+
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static ssize_t temp_auto_point_temp_show(struct device *dev,
 					 struct device_attribute *devattr,
 					 char *buf)
 {
+	struct amc6821_data *data = dev_get_drvdata(dev);
 	int ix = to_sensor_dev_attr_2(devattr)->index;
 	int nr = to_sensor_dev_attr_2(devattr)->nr;
-	struct amc6821_data *data = amc6821_update_device(dev);
-	switch (nr) {
-	case 1:
-		return sprintf(buf, "%d\n",
-			data->temp1_auto_point_temp[ix] * 1000);
-	case 2:
-		return sprintf(buf, "%d\n",
-			data->temp2_auto_point_temp[ix] * 1000);
-	default:
-		dev_dbg(dev, "Unknown attr->nr (%d).\n", nr);
-		return -EINVAL;
-	}
+	u8 temps[3];
+	int err;
+
+	mutex_lock(&data->update_lock);
+	err = amc6821_get_auto_point_temps(data->regmap, nr, temps);
+	mutex_unlock(&data->update_lock);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", temps[ix] * 1000);
 }
 
 static ssize_t pwm1_auto_point_pwm_show(struct device *dev,
 					struct device_attribute *devattr,
 					char *buf)
 {
+	struct amc6821_data *data = dev_get_drvdata(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
-	struct amc6821_data *data = amc6821_update_device(dev);
-	return sprintf(buf, "%d\n", data->pwm1_auto_point_pwm[ix]);
+	u32 val;
+	int err;
+
+	switch (ix) {
+	case 0:
+		val = 0;
+		break;
+	case 1:
+		err = regmap_read(data->regmap, AMC6821_REG_DCY_LOW_TEMP, &val);
+		if (err)
+			return err;
+		break;
+	default:
+		val = 255;
+		break;
+	}
+	return sysfs_emit(buf, "%d\n", val);
 }
 
-static inline ssize_t set_slope_register(struct i2c_client *client,
-		u8 reg,
-		u8 dpwm,
-		u8 *ptemp)
+/*
+ * Set TEMP[0-4] (low temperature) and SLP[0-2] (slope) of local or remote
+ * TEMP-FAN control register.
+ *
+ * Return 0 on success or negative error code.
+ *
+ * Channel 0: local, channel 1: remote
+ */
+static inline int set_slope_register(struct regmap *regmap, int channel, u8 *temps)
 {
-	int dt;
-	u8 tmp;
+	u8 regval = FIELD_PREP(AMC6821_TEMP_LIMIT_MASK, temps[1] / 4);
+	u8 tmp, dpwm;
+	int err, dt;
+	u32 pwm;
 
-	dt = ptemp[2]-ptemp[1];
+	err = regmap_read(regmap, AMC6821_REG_DCY_LOW_TEMP, &pwm);
+	if (err)
+		return err;
+
+	dpwm = 255 - pwm;
+
+	dt = temps[2] - temps[1];
 	for (tmp = 4; tmp > 0; tmp--) {
-		if (dt * (0x20 >> tmp) >= dpwm)
+		if (dt * (BIT(5) >> tmp) >= dpwm)
 			break;
 	}
-	tmp |= (ptemp[1] & 0x7C) << 1;
-	if (i2c_smbus_write_byte_data(client,
-			reg, tmp)) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
-		return -EIO;
-	}
-	return 0;
+	regval |= FIELD_PREP(AMC6821_TEMP_SLOPE_MASK, tmp);
+
+	return regmap_write(regmap,
+			    channel ? AMC6821_REG_RTEMP_FAN_CTRL : AMC6821_REG_LTEMP_FAN_CTRL,
+			    regval);
 }
 
 static ssize_t temp_auto_point_temp_store(struct device *dev,
 					  struct device_attribute *attr,
 					  const char *buf, size_t count)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	struct i2c_client *client = data->client;
+	struct amc6821_data *data = dev_get_drvdata(dev);
 	int ix = to_sensor_dev_attr_2(attr)->index;
 	int nr = to_sensor_dev_attr_2(attr)->nr;
-	u8 *ptemp;
-	u8 reg;
-	int dpwm;
+	struct regmap *regmap = data->regmap;
+	u8 temps[3], otemps[3];
 	long val;
-	int ret = kstrtol(buf, 10, &val);
+	int ret;
+
+	ret = kstrtol(buf, 10, &val);
 	if (ret)
 		return ret;
 
-	switch (nr) {
-	case 1:
-		ptemp = data->temp1_auto_point_temp;
-		reg = AMC6821_REG_LTEMP_FAN_CTRL;
-		break;
-	case 2:
-		ptemp = data->temp2_auto_point_temp;
-		reg = AMC6821_REG_RTEMP_FAN_CTRL;
-		break;
-	default:
-		dev_dbg(dev, "Unknown attr->nr (%d).\n", nr);
-		return -EINVAL;
-	}
-
 	mutex_lock(&data->update_lock);
-	data->valid = false;
+
+	ret = amc6821_get_auto_point_temps(data->regmap, nr, temps);
+	if (ret)
+		goto unlock;
 
 	switch (ix) {
 	case 0:
-		ptemp[0] = clamp_val(val / 1000, 0,
-				     data->temp1_auto_point_temp[1]);
-		ptemp[0] = clamp_val(ptemp[0], 0,
-				     data->temp2_auto_point_temp[1]);
-		ptemp[0] = clamp_val(ptemp[0], 0, 63);
-		if (i2c_smbus_write_byte_data(
-					client,
-					AMC6821_REG_PSV_TEMP,
-					ptemp[0])) {
-				dev_err(&client->dev,
-					"Register write error, aborting.\n");
-				count = -EIO;
-		}
-		goto EXIT;
+		/*
+		 * Passive cooling temperature. Range limit against low limit
+		 * of both channels.
+		 */
+		ret = amc6821_get_auto_point_temps(data->regmap, 1 - nr, otemps);
+		if (ret)
+			goto unlock;
+		val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 63000), 1000);
+		val = clamp_val(val, 0, min(temps[1], otemps[1]));
+		ret = regmap_write(regmap, AMC6821_REG_PSV_TEMP, val);
+		break;
 	case 1:
-		ptemp[1] = clamp_val(val / 1000, (ptemp[0] & 0x7C) + 4, 124);
-		ptemp[1] &= 0x7C;
-		ptemp[2] = clamp_val(ptemp[2], ptemp[1] + 1, 255);
+		/*
+		 * Low limit; must be between passive and high limit,
+		 * and not exceed 124. Step size is 4 degrees C.
+		 */
+		val = clamp_val(val, DIV_ROUND_UP(temps[0], 4) * 4000, 124000);
+		temps[1] = DIV_ROUND_CLOSEST(val, 4000) * 4;
+		val = temps[1] / 4;
+		/* Auto-adjust high limit if necessary */
+		temps[2] = clamp_val(temps[2], temps[1] + 1, 255);
+		ret = set_slope_register(regmap, nr, temps);
 		break;
 	case 2:
-		ptemp[2] = clamp_val(val / 1000, ptemp[1]+1, 255);
+		/* high limit, must be higher than low limit */
+		val = clamp_val(val, (temps[1] + 1) * 1000, 255000);
+		temps[2] = DIV_ROUND_CLOSEST(val, 1000);
+		ret = set_slope_register(regmap, nr, temps);
 		break;
 	default:
-		dev_dbg(dev, "Unknown attr->index (%d).\n", ix);
-		count = -EINVAL;
-		goto EXIT;
+		ret = -EINVAL;
+		break;
 	}
-	dpwm = data->pwm1_auto_point_pwm[2] - data->pwm1_auto_point_pwm[1];
-	if (set_slope_register(client, reg, dpwm, ptemp))
-		count = -EIO;
-
-EXIT:
+unlock:
 	mutex_unlock(&data->update_lock);
-	return count;
+	return ret ? : count;
 }
 
 static ssize_t pwm1_auto_point_pwm_store(struct device *dev,
@@ -561,101 +542,107 @@ static ssize_t pwm1_auto_point_pwm_store(struct device *dev,
 					 const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	int dpwm;
+	struct regmap *regmap = data->regmap;
+	int i, ret;
 	u8 val;
-	int ret;
 
 	ret = kstrtou8(buf, 10, &val);
 	if (ret)
 		return ret;
 
 	mutex_lock(&data->update_lock);
-	data->pwm1_auto_point_pwm[1] = val;
-	if (i2c_smbus_write_byte_data(client, AMC6821_REG_DCY_LOW_TEMP,
-			data->pwm1_auto_point_pwm[1])) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
-		count = -EIO;
-		goto EXIT;
-	}
-	dpwm = data->pwm1_auto_point_pwm[2] - data->pwm1_auto_point_pwm[1];
-	if (set_slope_register(client, AMC6821_REG_LTEMP_FAN_CTRL, dpwm,
-			data->temp1_auto_point_temp)) {
-		count = -EIO;
-		goto EXIT;
-	}
-	if (set_slope_register(client, AMC6821_REG_RTEMP_FAN_CTRL, dpwm,
-			data->temp2_auto_point_temp)) {
-		count = -EIO;
-		goto EXIT;
-	}
+	ret = regmap_write(regmap, AMC6821_REG_DCY_LOW_TEMP, val);
+	if (ret)
+		goto unlock;
 
-EXIT:
-	data->valid = false;
+	for (i = 0; i < 2; i++) {
+		u8 temps[3];
+
+		ret = amc6821_get_auto_point_temps(regmap, i, temps);
+		if (ret)
+			break;
+		ret = set_slope_register(regmap, i, temps);
+		if (ret)
+			break;
+	}
+unlock:
 	mutex_unlock(&data->update_lock);
-	return count;
+	return ret ? : count;
 }
 
 static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
 			char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
+	struct amc6821_data *data = dev_get_drvdata(dev);
 	int ix = to_sensor_dev_attr(devattr)->index;
-	if (0 == data->fan[ix])
-		return sprintf(buf, "0");
-	return sprintf(buf, "%d\n", (int)(6000000 / data->fan[ix]));
+	u32 regval;
+	u8 regs[2];
+	int err;
+
+	err = regmap_bulk_read(data->regmap, fan_reg_low[ix], regs, 2);
+	if (err)
+		return err;
+	regval = (regs[1] << 8) | regs[0];
+
+	return sysfs_emit(buf, "%d\n", regval ? 6000000 / regval : 0);
 }
 
 static ssize_t fan1_fault_show(struct device *dev,
 			       struct device_attribute *devattr, char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	if (data->stat1 & AMC6821_STAT1_FANS)
-		return sprintf(buf, "1");
-	else
-		return sprintf(buf, "0");
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	u32 regval;
+	int err;
+
+	err = regmap_read(data->regmap, AMC6821_REG_STAT1, &regval);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", !!(regval & AMC6821_STAT1_FANS));
 }
 
 static ssize_t fan_store(struct device *dev, struct device_attribute *attr,
 			 const char *buf, size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
-	unsigned long val;
 	int ix = to_sensor_dev_attr(attr)->index;
-	int ret = kstrtoul(buf, 10, &val);
-	if (ret)
-		return ret;
+	unsigned long val;
+	u8 regs[2];
+	int err;
+
+	err = kstrtoul(buf, 10, &val);
+	if (err)
+		return err;
 
 	/* Minimum and target fan speed must not be unlimited (0) */
 	if ((ix == IDX_FAN1_MIN || ix == IDX_FAN1_TARGET) && !val)
 		return -EINVAL;
 
-	val = val > 0 ? 6000000 / clamp_val(val, 1, 6000000) : 0;
+	val = val > 0 ? 6000000 / min(val, 6000000) : 0;
+	val = clamp_val(val, 0, 0xFFFF);
+
+	regs[0] = val & 0xff;
+	regs[1] = val >> 8;
+
+	err = regmap_bulk_write(data->regmap, fan_reg_low[ix], regs, 2);
+	if (err)
+		return err;
 
-	mutex_lock(&data->update_lock);
-	data->fan[ix] = clamp_val(val, 0, 0xFFFF);
-	if (i2c_smbus_write_byte_data(client, fan_reg_low[ix],
-			data->fan[ix] & 0xFF)) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
-		count = -EIO;
-		goto EXIT;
-	}
-	if (i2c_smbus_write_byte_data(client,
-			fan_reg_hi[ix], data->fan[ix] >> 8)) {
-		dev_err(&client->dev, "Register write error, aborting.\n");
-		count = -EIO;
-	}
-EXIT:
-	mutex_unlock(&data->update_lock);
 	return count;
 }
 
 static ssize_t fan1_pulses_show(struct device *dev,
 				struct device_attribute *devattr, char *buf)
 {
-	struct amc6821_data *data = amc6821_update_device(dev);
-	return sprintf(buf, "%d\n", data->fan1_pulses);
+	struct amc6821_data *data = dev_get_drvdata(dev);
+	u32 regval;
+	int err;
+
+	err = regmap_read(data->regmap, AMC6821_REG_CONF4, &regval);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", (regval & AMC6821_CONF4_PSPR) ? 4 : 2);
 }
 
 static ssize_t fan1_pulses_store(struct device *dev,
@@ -663,40 +650,22 @@ static ssize_t fan1_pulses_store(struct device *dev,
 				 size_t count)
 {
 	struct amc6821_data *data = dev_get_drvdata(dev);
-	struct i2c_client *client = data->client;
 	long val;
-	int config = kstrtol(buf, 10, &val);
-	if (config)
-		return config;
+	int err;
+
+	err = kstrtol(buf, 10, &val);
+	if (err)
+		return err;
+
+	if (val != 2 && val != 4)
+		return -EINVAL;
+
+	err = regmap_update_bits(data->regmap, AMC6821_REG_CONF4,
+				 AMC6821_CONF4_PSPR,
+				 val == 4 ? AMC6821_CONF4_PSPR : 0);
+	if (err)
+		return err;
 
-	mutex_lock(&data->update_lock);
-	config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF4);
-	if (config < 0) {
-		dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-		count = config;
-		goto EXIT;
-	}
-	switch (val) {
-	case 2:
-		config &= ~AMC6821_CONF4_PSPR;
-		data->fan1_pulses = 2;
-		break;
-	case 4:
-		config |= AMC6821_CONF4_PSPR;
-		data->fan1_pulses = 4;
-		break;
-	default:
-		count = -EINVAL;
-		goto EXIT;
-	}
-	if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF4, config)) {
-		dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-		count = -EIO;
-	}
-EXIT:
-	mutex_unlock(&data->update_lock);
 	return count;
 }
 
@@ -730,18 +699,18 @@ static SENSOR_DEVICE_ATTR_RO(pwm1_auto_point3_pwm, pwm1_auto_point_pwm, 2);
 static SENSOR_DEVICE_ATTR_RO(pwm1_auto_channels_temp, pwm1_auto_channels_temp,
 			     0);
 static SENSOR_DEVICE_ATTR_2_RO(temp1_auto_point1_temp, temp_auto_point_temp,
-			       1, 0);
+			       0, 0);
 static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_point2_temp, temp_auto_point_temp,
-			       1, 1);
+			       0, 1);
 static SENSOR_DEVICE_ATTR_2_RW(temp1_auto_point3_temp, temp_auto_point_temp,
-			       1, 2);
+			       0, 2);
 
 static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point1_temp, temp_auto_point_temp,
-			       2, 0);
+			       1, 0);
 static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point2_temp, temp_auto_point_temp,
-			       2, 1);
+			       1, 1);
 static SENSOR_DEVICE_ATTR_2_RW(temp2_auto_point3_temp, temp_auto_point_temp,
-			       2, 2);
+			       1, 2);
 
 static struct attribute *amc6821_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -828,110 +797,79 @@ static int amc6821_detect(
 	return 0;
 }
 
-static int amc6821_init_client(struct i2c_client *client)
+static int amc6821_init_client(struct amc6821_data *data)
 {
-	int config;
-	int err = -EIO;
+	struct regmap *regmap = data->regmap;
+	int err;
 
 	if (init) {
-		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF4);
-
-		if (config < 0) {
-				dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-				return err;
-		}
-
-		config |= AMC6821_CONF4_MODE;
-
-		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF4,
-				config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
+		err = regmap_set_bits(regmap, AMC6821_REG_CONF4, AMC6821_CONF4_MODE);
+		if (err)
 			return err;
-		}
-
-		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF3);
-
-		if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
+		err = regmap_clear_bits(regmap, AMC6821_REG_CONF3, AMC6821_CONF3_THERM_FAN_EN);
+		if (err)
 			return err;
-		}
-
-		dev_info(&client->dev, "Revision %d\n", config & 0x0f);
-
-		config &= ~AMC6821_CONF3_THERM_FAN_EN;
-
-		if (i2c_smbus_write_byte_data(client, AMC6821_REG_CONF3,
-				config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
+		err = regmap_clear_bits(regmap, AMC6821_REG_CONF2,
+					AMC6821_CONF2_RTFIE |
+					AMC6821_CONF2_LTOIE |
+					AMC6821_CONF2_RTOIE);
+		if (err)
 			return err;
-		}
 
-		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF2);
-
-		if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
+		err = regmap_update_bits(regmap, AMC6821_REG_CONF1,
+					 AMC6821_CONF1_THERMOVIE | AMC6821_CONF1_FANIE |
+					 AMC6821_CONF1_START | AMC6821_CONF1_PWMINV,
+					 AMC6821_CONF1_START |
+					 (pwminv ? AMC6821_CONF1_PWMINV : 0));
+		if (err)
 			return err;
-		}
-
-		config &= ~AMC6821_CONF2_RTFIE;
-		config &= ~AMC6821_CONF2_LTOIE;
-		config &= ~AMC6821_CONF2_RTOIE;
-		if (i2c_smbus_write_byte_data(client,
-				AMC6821_REG_CONF2, config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			return err;
-		}
-
-		config = i2c_smbus_read_byte_data(client, AMC6821_REG_CONF1);
-
-		if (config < 0) {
-			dev_err(&client->dev,
-			"Error reading configuration register, aborting.\n");
-			return err;
-		}
-
-		config &= ~AMC6821_CONF1_THERMOVIE;
-		config &= ~AMC6821_CONF1_FANIE;
-		config |= AMC6821_CONF1_START;
-		if (pwminv)
-			config |= AMC6821_CONF1_PWMINV;
-		else
-			config &= ~AMC6821_CONF1_PWMINV;
-
-		if (i2c_smbus_write_byte_data(
-				client, AMC6821_REG_CONF1, config)) {
-			dev_err(&client->dev,
-			"Configuration register write error, aborting.\n");
-			return err;
-		}
 	}
 	return 0;
 }
 
+static bool amc6821_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case AMC6821_REG_STAT1:
+	case AMC6821_REG_STAT2:
+	case AMC6821_REG_TEMP_LO:
+	case AMC6821_REG_TDATA_LOW:
+	case AMC6821_REG_LTEMP_HI:
+	case AMC6821_REG_RTEMP_HI:
+	case AMC6821_REG_TDATA_HI:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config amc6821_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = AMC6821_REG_CONF3,
+	.volatile_reg = amc6821_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int amc6821_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct amc6821_data *data;
 	struct device *hwmon_dev;
+	struct regmap *regmap;
 	int err;
 
 	data = devm_kzalloc(dev, sizeof(struct amc6821_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->client = client;
-	mutex_init(&data->update_lock);
+	regmap = devm_regmap_init_i2c(client, &amc6821_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+	data->regmap = regmap;
 
-	/*
-	 * Initialize the amc6821 chip
-	 */
-	err = amc6821_init_client(client);
+	err = amc6821_init_client(data);
 	if (err)
 		return err;
 
-- 
2.39.2


