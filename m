Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D56719E8B4
	for <lists+linux-hwmon@lfdr.de>; Sun,  5 Apr 2020 05:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgDEDBa (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 4 Apr 2020 23:01:30 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:52129 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgDEDBa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Apr 2020 23:01:30 -0400
Received: by mail-pg1-f202.google.com with SMTP id p13so9799951pgk.18
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Apr 2020 20:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=CtL7AkEkknF9SQBZ+WA4OLLm05MxAfzd/9Mlixg963k=;
        b=XIjjC2D2skuYyYcb74CwOUQ/zyRn8Z9WcGQGkRw/Hxf2EW7fVAZfhZWgohC1TEBi9z
         lXcs9ExAnaj70gX8gKK1uAGLzpZCZndH9gaDYDjO/QZavVPF9bD/r6xKocjU4lzqzEf/
         Sf4t7Tb0xf+reY2CslafiTIWaLrxCjTSA25yBpnP1JnoIiCcjLnZGba38FAkyLhrBgWk
         pn3T8pg1efIB8pZkZwIV01HV8TuHjlY0WcoUX6mgW3d/aZpJ96XOVmRCmWdvoCMOFIUg
         oIcT2Y211yXou8yTrxBOADUdxWp3VWaFW4Vf+rX7Rm1Be3kB+NH5YSDLfqV5CdRWdyS/
         dqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=CtL7AkEkknF9SQBZ+WA4OLLm05MxAfzd/9Mlixg963k=;
        b=LPz8CjBUIY5QJVdt6O+J5akZLF4ZFtqu9scQVIQrtqTn+OYn2engDhnNdXQpxCFCMv
         8u+/8qleiiLYzTtQ7NcLN9NdvtkCOiQalhY1A+D6tcH7ZWnstP3wbPJ2OqiTyqgYLeCT
         xhtEZnTnD8Pm+IVsWh0dCi/J3NNcuoDj+sZsa9ORbRk8DedeHOkyYGorMmGKLnCdAudx
         F/2fZROcdDxEBr7/npCfDM6YZezMh67O/Qo8yzmHic+OlLpO8qZ2n21YrLxApVxXzjBw
         xKgBkMgnKdtvwEaeWn4XBpM9qQe46+tp9g2Unhhzgo8ZE+HOF1GCQpmmDkj5j6zgmgRB
         FBhw==
X-Gm-Message-State: AGi0PuYeAMuynQddqEr7DocrlmnRlRHb7ao+m/4RfOmBYMANCU74f2K7
        ZiQlwwRslYvQXcNIlHL44FgwI7Y/GQ==
X-Google-Smtp-Source: APiQypINcx2+T+HVncQIa3Xn65Q1wh6szd8FLfPg/qs8qzK0fiB66DXBdzXYta5IAxvVvMwYi6IjPH/+dw==
X-Received: by 2002:a17:90a:26ef:: with SMTP id m102mr18662377pje.173.1586055687944;
 Sat, 04 Apr 2020 20:01:27 -0700 (PDT)
Date:   Sat,  4 Apr 2020 20:01:16 -0700
In-Reply-To: <20200405030118.191950-1-kunyi@google.com>
Message-Id: <20200405030118.191950-2-kunyi@google.com>
Mime-Version: 1.0
References: <20200405030118.191950-1-kunyi@google.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH linux hwmon-next v3 1/3] hwmon: (sbtsi) Add basic support for
 SB-TSI sensors
From:   Kun Yi <kunyi@google.com>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Kun Yi <kunyi@google.com>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
interface that reports AMD SoC's Ttcl (normalized temperature),
and resembles a typical 8-pin remote temperature sensor's I2C interface
to BMC.

This commit adds basic support using this interface to read CPU
temperature, and read/write high/low CPU temp thresholds.

To instantiate this driver on an AMD CPU with SB-TSI
support, the i2c bus number would be the bus connected from the board
management controller (BMC) to the CPU. The i2c address is specified in
Section 6.3.1 of the spec [1]: The SB-TSI address is normally 98h for socket 0
and 90h for socket 1, but it could vary based on hardware address select pins.

[1]: https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf

Test status: tested reading temp1_input, and reading/writing
temp1_max/min.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/sbtsi_temp.c | 259 +++++++++++++++++++++++++++++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 drivers/hwmon/sbtsi_temp.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 05a30832c6ba..9585dcd01d1b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1412,6 +1412,16 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_SBTSI
+	tristate "Emulated SB-TSI temperature sensor"
+	depends on I2C
+	help
+	  If you say yes here you get support for emulated temperature
+	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbtsi_temp.
+
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b0b9c8e57176..cd109f003ce4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
+obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
new file mode 100644
index 000000000000..e3ad6a9f7ec1
--- /dev/null
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
+ *                compliant AMD SoC temperature device.
+ *
+ * Copyright (c) 2020, Google Inc.
+ * Copyright (c) 2020, Kun Yi <kunyi@google.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+
+/*
+ * SB-TSI registers only support SMBus byte data access. "_INT" registers are
+ * the integer part of a temperature value or limit, and "_DEC" registers are
+ * corresponding decimal parts.
+ */
+#define SBTSI_REG_TEMP_INT		0x01 /* RO */
+#define SBTSI_REG_STATUS		0x02 /* RO */
+#define SBTSI_REG_CONFIG		0x03 /* RO */
+#define SBTSI_REG_TEMP_HIGH_INT		0x07 /* RW */
+#define SBTSI_REG_TEMP_LOW_INT		0x08 /* RW */
+#define SBTSI_REG_TEMP_DEC		0x10 /* RW */
+#define SBTSI_REG_TEMP_HIGH_DEC		0x13 /* RW */
+#define SBTSI_REG_TEMP_LOW_DEC		0x14 /* RW */
+#define SBTSI_REG_REV			0xFF /* RO */
+
+#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
+
+#define SBTSI_TEMP_MIN	0
+#define SBTSI_TEMP_MAX	255875
+#define SBTSI_REV_MAX_VALID_ID	4
+
+/* Each client has this additional data */
+struct sbtsi_data {
+	struct i2c_client *client;
+	struct mutex lock;
+};
+
+/*
+ * From SB-TSI spec: CPU temperature readings and limit registers encode the
+ * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
+ * register encodes the base-2 of the integer portion, and the upper 3 bits of
+ * the "low byte" encode in base-2 the decimal portion.
+ *
+ * e.g. INT=0x19, DEC=0x20 represents 25.125 degrees Celsius
+ *
+ * Therefore temperature in millidegree Celsius =
+ *   (INT + DEC / 256) * 1000 = (INT * 8 + DEC / 32) * 125
+ */
+static inline int sbtsi_reg_to_mc(s32 integer, s32 decimal)
+{
+	return ((integer << 3) + (decimal >> 5)) * 125;
+}
+
+/*
+ * Inversely, given temperature in millidegree Celsius
+ *   INT = (TEMP / 125) / 8
+ *   DEC = ((TEMP / 125) % 8) * 32
+ * Caller have to make sure temp doesn't exceed 255875, the max valid value.
+ */
+static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
+{
+	temp /= 125;
+	*integer = temp >> 3;
+	*decimal = (temp & 0x7) << 5;
+}
+
+static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct sbtsi_data *data = dev_get_drvdata(dev);
+	s32 temp_int, temp_dec;
+	int err, reg_int, reg_dec;
+	u8 read_order;
+
+	if (type != hwmon_temp)
+		return -EINVAL;
+
+	read_order = 0;
+	switch (attr) {
+	case hwmon_temp_input:
+		/*
+		 * ReadOrder bit specifies the reading order of integer and
+		 * decimal part of CPU temp for atomic reads. If bit == 0,
+		 * reading integer part triggers latching of the decimal part,
+		 * so integer part should be read first. If bit == 1, read
+		 * order should be reversed.
+		 */
+		err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
+		if (err < 0)
+			return err;
+
+		read_order = (u8)err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT);
+		reg_int = SBTSI_REG_TEMP_INT;
+		reg_dec = SBTSI_REG_TEMP_DEC;
+		break;
+	case hwmon_temp_max:
+		reg_int = SBTSI_REG_TEMP_HIGH_INT;
+		reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
+		break;
+	case hwmon_temp_min:
+		reg_int = SBTSI_REG_TEMP_LOW_INT;
+		reg_dec = SBTSI_REG_TEMP_LOW_DEC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (read_order == 0) {
+		temp_int = i2c_smbus_read_byte_data(data->client, reg_int);
+		temp_dec = i2c_smbus_read_byte_data(data->client, reg_dec);
+	} else {
+		temp_dec = i2c_smbus_read_byte_data(data->client, reg_dec);
+		temp_int = i2c_smbus_read_byte_data(data->client, reg_int);
+	}
+
+	if (temp_int < 0)
+		return temp_int;
+	if (temp_dec < 0)
+		return temp_dec;
+
+	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
+
+	return 0;
+}
+
+static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct sbtsi_data *data = dev_get_drvdata(dev);
+	int reg_int, reg_dec, err;
+	u8 temp_int, temp_dec;
+
+	if (type != hwmon_temp)
+		return -EINVAL;
+
+	switch (attr) {
+	case hwmon_temp_max:
+		reg_int = SBTSI_REG_TEMP_HIGH_INT;
+		reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
+		break;
+	case hwmon_temp_min:
+		reg_int = SBTSI_REG_TEMP_LOW_INT;
+		reg_dec = SBTSI_REG_TEMP_LOW_DEC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
+	mutex_lock(&data->lock);
+	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
+	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
+	if (err)
+		goto exit;
+
+	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
+exit:
+	mutex_unlock(&data->lock);
+	return err;
+}
+
+static umode_t sbtsi_is_visible(const void *data,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		case hwmon_temp_min:
+			return 0644;
+		case hwmon_temp_max:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *sbtsi_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX),
+	NULL
+};
+
+static const struct hwmon_ops sbtsi_hwmon_ops = {
+	.is_visible = sbtsi_is_visible,
+	.read = sbtsi_read,
+	.write = sbtsi_write,
+};
+
+static const struct hwmon_chip_info sbtsi_chip_info = {
+	.ops = &sbtsi_hwmon_ops,
+	.info = sbtsi_info,
+};
+
+static int sbtsi_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct sbtsi_data *data;
+
+	data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
+
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(dev, client->name, data,
+						     &sbtsi_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id sbtsi_id[] = {
+	{"sbtsi", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sbtsi_id);
+
+static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
+	{
+		.compatible = "amd,sbtsi",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sbtsi_of_match);
+
+static struct i2c_driver sbtsi_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "sbtsi",
+		.of_match_table = of_match_ptr(sbtsi_of_match),
+	},
+	.probe = sbtsi_probe,
+	.id_table = sbtsi_id,
+};
+
+module_i2c_driver(sbtsi_driver);
+
+MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
+MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
+MODULE_LICENSE("GPL");
-- 
2.26.0.292.g33ef6b2f38-goog

