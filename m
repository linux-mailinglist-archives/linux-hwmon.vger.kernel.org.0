Return-Path: <linux-hwmon+bounces-3359-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29793E9AB
	for <lists+linux-hwmon@lfdr.de>; Sun, 28 Jul 2024 23:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30AB3281FC9
	for <lists+linux-hwmon@lfdr.de>; Sun, 28 Jul 2024 21:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF928287E;
	Sun, 28 Jul 2024 21:18:29 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981380027;
	Sun, 28 Jul 2024 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722201509; cv=none; b=PGKNObqSw2LmsDyxjMQ4V8XbnU872xm5qErJaIfFexVEByDaGExPP+3rq+LFSNsOb6GBwJwdAVk0wL0myI/K6Ah8rqQLZLfh4DH9c5FnnQe5P96Blb4WQQDI/4Nd/eW7r0L8/6s8JnragZrH9v/SQ7jeI/jX4NQte4TsgEjLOwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722201509; c=relaxed/simple;
	bh=ca5UcqIMoaSgMWpVnlt2I52ThFCKWVLE5AeeGpCFdD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9qsdGeBtZKwaLaxzJqsWadklmzmOc5obXXko2PO9Xf2ACowjJWvJDqEovvK+7x/v+FhMJo4hVfB/tVqsteC8XZXTIkSCWzb1q8fvQLOXKJwNqhBJN+ZGQ7TfW3XKDeOg8IaWV/ccIbcM9Psa4NCqyojz+cfxU5DsWQBKbOhnWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e86192c.versanet.de ([94.134.25.44] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sYBHH-0005yh-1i; Sun, 28 Jul 2024 23:18:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 5/7] hwmon: add driver for the hwmon parts of qnap-mcu devices
Date: Sun, 28 Jul 2024 23:17:49 +0200
Message-Id: <20240728211751.2160123-6-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728211751.2160123-1-heiko@sntech.de>
References: <20240728211751.2160123-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MCU can be found on network-attached-storage devices made by QNAP
and provides access to fan control including reading back its RPM as
well as reading the temperature of the NAS case.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/hwmon/index.rst          |   1 +
 Documentation/hwmon/qnap-mcu-hwmon.rst |  27 ++
 MAINTAINERS                            |   1 +
 drivers/hwmon/Kconfig                  |  12 +
 drivers/hwmon/Makefile                 |   1 +
 drivers/hwmon/qnap-mcu-hwmon.c         | 375 +++++++++++++++++++++++++
 6 files changed, 417 insertions(+)
 create mode 100644 Documentation/hwmon/qnap-mcu-hwmon.rst
 create mode 100644 drivers/hwmon/qnap-mcu-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 03d313af469a1..53648dc1f1df0 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -196,6 +196,7 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    q54sj108a2
+   qnap-mcu-hwmon
    raspberrypi-hwmon
    sbrmi
    sbtsi_temp
diff --git a/Documentation/hwmon/qnap-mcu-hwmon.rst b/Documentation/hwmon/qnap-mcu-hwmon.rst
new file mode 100644
index 0000000000000..83407e3408f2b
--- /dev/null
+++ b/Documentation/hwmon/qnap-mcu-hwmon.rst
@@ -0,0 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver qnap-mcu-hwmon
+============================
+
+This driver enables the use of the hardware monitoring and fan control
+of the MCU used on some QNAP network attached storage devices.
+
+Author: Heiko Stuebner <heiko@sntech.de>
+
+Description
+-----------
+
+The driver implements a simple interface for driving the fan controlled by
+setting its PWM output value and exposes the fan rpm and case-temperature
+to user space through hwmon's sysfs interface.
+
+The fan rotation speed returned via the optional 'fan1_input' is calculated
+inside the MCU device.
+
+The driver provides the following sensor accesses in sysfs:
+
+=============== ======= =======================================================
+fan1_input	ro	fan tachometer speed in RPM
+pwm1		rw	relative speed (0-255), 255=max. speed.
+temp1_input	ro	Measured temperature in millicelsius
+=============== ======= =======================================================
diff --git a/MAINTAINERS b/MAINTAINERS
index 58574f278bfed..ab66fbba07678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18345,6 +18345,7 @@ F:	drivers/media/tuners/qm1d1c0042*
 QNAP MCU DRIVER
 M:	Heiko Stuebner <heiko@sntech.de>
 S:	Maintained
+F:	drivers/hwmon/qnap-mcu-hwmon.c
 F:	drivers/input/misc/qnap-mcu-input.c
 F:	drivers/leds/leds-qnap-mcu.c
 F:	drivers/mfd/qnap-mcu.c
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e14ae18a973b3..21943731f4382 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1806,6 +1806,18 @@ config SENSORS_PWM_FAN
 	  This driver can also be built as a module. If so, the module
 	  will be called pwm-fan.
 
+config SENSORS_QNAP_MCU_HWMON
+	tristate "QNAP MCU hardware monitoring"
+	depends on MFD_QNAP_MCU
+	depends on THERMAL || THERMAL=n
+	help
+	  Say yes here to enable support for fan and temperature sensor
+	  connected to a QNAP MCU, as found in a number of QNAP network
+	  attached storage devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called qnap-mcu-hwmon.
+
 config SENSORS_RASPBERRYPI_HWMON
 	tristate "Raspberry Pi voltage monitor"
 	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e3f25475d1f04..b72c6a059e4af 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -188,6 +188,7 @@ obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
 obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
+obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
diff --git a/drivers/hwmon/qnap-mcu-hwmon.c b/drivers/hwmon/qnap-mcu-hwmon.c
new file mode 100644
index 0000000000000..d53da443b4573
--- /dev/null
+++ b/drivers/hwmon/qnap-mcu-hwmon.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Driver for hwmon elements found on QNAP-MCU devices
+ *
+ * Copyright (C) 2024 Heiko Stuebner <heiko@sntech.de>
+ */
+
+#include <linux/module.h>
+#include <linux/hwmon.h>
+#include <linux/mfd/qnap-mcu.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/thermal.h>
+
+struct qnap_mcu_hwmon {
+	struct qnap_mcu *mcu;
+	struct device *dev;
+
+	unsigned int pwm_min;
+	unsigned int pwm_max;
+
+	unsigned int fan_state;
+	unsigned int fan_max_state;
+	unsigned int *fan_cooling_levels;
+
+	struct thermal_cooling_device *cdev;
+	struct hwmon_chip_info info;
+};
+
+static int qnap_mcu_hwmon_get_rpm(struct qnap_mcu_hwmon *hwm)
+{
+	static u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x46, /* F */
+		[2] = 0x41  /* A */
+	};
+	u8 reply[6];
+	int ret;
+
+	/* poll the fan rpm */
+	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
+	if (ret)
+		return ret;
+
+	/* First 2 bytes must mirror the sent command */
+	if (memcmp(cmd, reply, 2))
+		return -EIO;
+
+	return reply[4] * 30;
+}
+
+static int qnap_mcu_hwmon_get_pwm(struct qnap_mcu_hwmon *hwm)
+{
+	static u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x46, /* F */
+		[2] = 0x5a, /* Z */
+		[3] = 0x30  /* 0 ... fan-id? */
+	};
+	u8 reply[4];
+	int ret;
+
+	/* poll the fan pwm */
+	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
+	if (ret)
+		return ret;
+
+	/* First 3 bytes must mirror the sent command */
+	if (memcmp(cmd, reply, 3))
+		return -EIO;
+
+	return reply[3];
+}
+
+static int qnap_mcu_hwmon_set_pwm(struct qnap_mcu_hwmon *hwm, u8 pwm)
+{
+	u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x46, /* F */
+		[2] = 0x57, /* W */
+		[3] = 0x30, /* 0 ... fan-id? */
+		[4] = pwm
+	};
+
+	/* set the fan pwm */
+	return qnap_mcu_exec_with_ack(hwm->mcu, cmd, sizeof(cmd));
+}
+
+static int qnap_mcu_hwmon_get_temp(struct qnap_mcu_hwmon *hwm)
+{
+	static u8 cmd[] = {
+		[0] = 0x40, /* @ */
+		[1] = 0x54, /* T */
+		[2] = 0x33  /* 3 */
+	};
+	u8 reply[4];
+	int ret;
+
+	/* poll the fan rpm */
+	ret = qnap_mcu_exec(hwm->mcu, cmd, sizeof(cmd), reply, sizeof(reply));
+	if (ret)
+		return ret;
+
+	/* First bytes must mirror the sent command */
+	if (memcmp(cmd, reply, sizeof(cmd)))
+		return -EIO;
+
+	/*
+	 * There is an unknown bit set in bit7.
+	 * Bits [6:0] report the actual temperature as returned by the
+	 * original qnap firmware-tools, so just drop bit7 for now.
+	 */
+	return (reply[3] & 0x7f) * 1000;
+}
+
+static int qnap_mcu_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+				u32 attr, int channel, long val)
+{
+	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val < 0 || val > 255)
+			return -EINVAL;
+
+		if (val < hwm->pwm_min)
+			val = hwm->pwm_min;
+
+		if (val > hwm->pwm_max)
+			val = hwm->pwm_max;
+
+		return qnap_mcu_hwmon_set_pwm(hwm, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int qnap_mcu_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long *val)
+{
+	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret = qnap_mcu_hwmon_get_pwm(hwm);
+			if (ret < 0)
+				return ret;
+
+			*val = ret;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+	case hwmon_fan:
+		ret = qnap_mcu_hwmon_get_rpm(hwm);
+		if (ret < 0)
+			return ret;
+
+		*val = ret;
+		return 0;
+	case hwmon_temp:
+		ret = qnap_mcu_hwmon_get_temp(hwm);
+		if (ret < 0)
+			return ret;
+
+		*val = ret;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t qnap_mcu_hwmon_is_visible(const void *data,
+					 enum hwmon_sensor_types type,
+					 u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		return 0444;
+
+	case hwmon_pwm:
+		return 0644;
+
+	case hwmon_fan:
+		return 0444;
+
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_ops qnap_mcu_hwmon_hwmon_ops = {
+	.is_visible = qnap_mcu_hwmon_is_visible,
+	.read = qnap_mcu_hwmon_read,
+	.write = qnap_mcu_hwmon_write,
+};
+
+/* thermal cooling device callbacks */
+static int qnap_mcu_hwmon_get_max_state(struct thermal_cooling_device *cdev,
+					unsigned long *state)
+{
+	struct qnap_mcu_hwmon *hwm = cdev->devdata;
+
+	if (!hwm)
+		return -EINVAL;
+
+	*state = hwm->fan_max_state;
+
+	return 0;
+}
+
+static int qnap_mcu_hwmon_get_cur_state(struct thermal_cooling_device *cdev,
+					unsigned long *state)
+{
+	struct qnap_mcu_hwmon *hwm = cdev->devdata;
+
+	if (!hwm)
+		return -EINVAL;
+
+	*state = hwm->fan_state;
+
+	return 0;
+}
+
+static int qnap_mcu_hwmon_set_cur_state(struct thermal_cooling_device *cdev,
+					unsigned long state)
+{
+	struct qnap_mcu_hwmon *hwm = cdev->devdata;
+	int ret;
+
+	if (!hwm || state > hwm->fan_max_state)
+		return -EINVAL;
+
+	if (state == hwm->fan_state)
+		return 0;
+
+	ret = qnap_mcu_hwmon_set_pwm(hwm, hwm->fan_cooling_levels[state]);
+	if (ret)
+		return ret;
+
+	hwm->fan_state = state;
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops qnap_mcu_hwmon_cooling_ops = {
+	.get_max_state = qnap_mcu_hwmon_get_max_state,
+	.get_cur_state = qnap_mcu_hwmon_get_cur_state,
+	.set_cur_state = qnap_mcu_hwmon_set_cur_state,
+};
+
+static int qnap_mcu_hwmon_get_cooling_data(struct device *dev, struct qnap_mcu_hwmon *hwm)
+{
+	int num, i, ret;
+
+	if (!device_property_present(dev->parent, "cooling-levels"))
+		return 0;
+
+	ret = device_property_count_u32(dev->parent, "cooling-levels");
+	if (ret <= 0) {
+		dev_err(dev, "Failed to count elements in 'cooling-levels'\n");
+		return ret ? : -EINVAL;
+	}
+
+	num = ret;
+	hwm->fan_cooling_levels = devm_kcalloc(dev, num, sizeof(u32),
+					       GFP_KERNEL);
+	if (!hwm->fan_cooling_levels)
+		return -ENOMEM;
+
+	ret = device_property_read_u32_array(dev->parent, "cooling-levels",
+					     hwm->fan_cooling_levels, num);
+	if (ret) {
+		dev_err(dev, "Failed to read 'cooling-levels'\n");
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		if (hwm->fan_cooling_levels[i] > hwm->pwm_max) {
+			dev_err(dev, "fan state[%d]:%d > %d\n", i,
+				hwm->fan_cooling_levels[i], hwm->pwm_max);
+			return -EINVAL;
+		}
+	}
+
+	hwm->fan_max_state = num - 1;
+
+	return 0;
+}
+
+static const struct hwmon_channel_info * const qnap_mcu_hwmon_channels[] = {
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static int qnap_mcu_hwmon_probe(struct platform_device *pdev)
+{
+	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
+	const struct qnap_mcu_variant *variant = qnap_mcu_get_variant_data(mcu);
+	struct qnap_mcu_hwmon *hwm;
+	struct thermal_cooling_device *cdev;
+	struct device *dev = &pdev->dev;
+	struct device *hwmon;
+	int ret;
+
+	hwm = devm_kzalloc(dev, sizeof(*hwm), GFP_KERNEL);
+	if (!hwm)
+		return -ENOMEM;
+
+	hwm->mcu = mcu;
+	hwm->dev = &pdev->dev;
+	hwm->pwm_min = variant->fan_pwm_min;
+	hwm->pwm_max = variant->fan_pwm_max;
+
+	platform_set_drvdata(pdev, hwm);
+
+	/*
+	 * Set duty cycle to maximum allowed.
+	 */
+	ret = qnap_mcu_hwmon_set_pwm(hwm, hwm->pwm_max);
+	if (ret)
+		return ret;
+
+	hwm->info.ops = &qnap_mcu_hwmon_hwmon_ops;
+	hwm->info.info = qnap_mcu_hwmon_channels;
+
+	ret = qnap_mcu_hwmon_get_cooling_data(dev, hwm);
+	if (ret)
+		return ret;
+
+	hwm->fan_state = hwm->fan_max_state;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "qnapmcu",
+						     hwm, &hwm->info, NULL);
+	if (IS_ERR(hwmon))
+		return dev_err_probe(dev, PTR_ERR(hwmon), "Failed to register hwmon device\n");
+
+	/*
+	 * Only register cooling device when we found cooling-levels.
+	 * qnap_mcu_hwmon_get_cooling_data() will fail when reading malformed
+	 * levels and only succeed with either no or correct cooling levels.
+	 */
+	if (IS_ENABLED(CONFIG_THERMAL) && hwm->fan_cooling_levels) {
+		cdev = devm_thermal_of_cooling_device_register(dev,
+					dev->parent->of_node, "qnap-mcu-hwmon",
+					hwm, &qnap_mcu_hwmon_cooling_ops);
+		if (IS_ERR(cdev))
+			return dev_err_probe(dev, PTR_ERR(cdev),
+				"Failed to register qnap-mcu-hwmon as cooling device\n");
+		hwm->cdev = cdev;
+	}
+
+	return 0;
+}
+
+static struct platform_driver qnap_mcu_hwmon_driver = {
+	.probe = qnap_mcu_hwmon_probe,
+	.driver = {
+		.name = "qnap-mcu-hwmon",
+	},
+};
+module_platform_driver(qnap_mcu_hwmon_driver);
+
+MODULE_ALIAS("platform:qnap-mcu-hwmon");
+MODULE_AUTHOR("Heiko Stuebner <heiko@sntech.de>");
+MODULE_DESCRIPTION("QNAP MCU hwmon driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2


