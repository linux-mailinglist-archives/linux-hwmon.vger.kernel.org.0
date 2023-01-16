Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E388A66C014
	for <lists+linux-hwmon@lfdr.de>; Mon, 16 Jan 2023 14:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjAPNt4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 16 Jan 2023 08:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjAPNtz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Jan 2023 08:49:55 -0500
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 05:49:52 PST
Received: from mail.zeus06.de (www.zeus06.de [194.117.254.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545EB1F5C5
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Jan 2023 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=from:to
        :cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=k1; bh=cW6sg199Dn9e019EslJm8HTYEmb
        3t/VavP6Q0lgX/eA=; b=Xegq+qt1aoqTS/NUqOs1Mf1SydP5B6rhvXx1Zgbi/HI
        VnLMljhR99AAhiUWycidlwkPlC5suNRdEywHrUjKsoBcoukereO+VgKlfArWX0GT
        Q1XQxAx0rqXmwMfsd0ugz2sn0WSbqO70cvFVa6er/rgiigstkvqcD6vwsXOgJPcM
        =
Received: (qmail 702149 invoked from network); 16 Jan 2023 14:43:09 +0100
Received: by mail.zeus06.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2023 14:43:09 +0100
X-UD-Smtp-Session: l3s6476p2@eFlaw2HyAx/CtAHJ
From:   Mario Kicherer <dev@kicherer.org>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        Mario Kicherer <dev@kicherer.org>
Subject: [PATCH] hwmon: add initial NXP MC34VR500 PMIC monitoring support
Date:   Mon, 16 Jan 2023 14:42:58 +0100
Message-Id: <20230116134258.3136852-1-dev@kicherer.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds initial monitoring support for the MC34VR500 PMIC. In its
current form, input voltage and temperature events are reported to hwmon.
Other interrupts only generate a generic entry in the kernel log so far.

The header file is copied from U-Boot and placed next to the C file as the
chip is usually only configured by the bootloader and it is unlikely that
it will be used by another Linux subsystem. If I should remove unused parts
or move the file to another path, let me know.

Datasheet:
 - https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf

Signed-off-by: Mario Kicherer <dev@kicherer.org>
---
 drivers/hwmon/Kconfig          |   7 +
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/mc34vr500.c      | 382 +++++++++++++++++++++++++++++++++
 drivers/hwmon/mc34vr500_pmic.h | 172 +++++++++++++++
 4 files changed, 562 insertions(+)
 create mode 100644 drivers/hwmon/mc34vr500.c
 create mode 100644 drivers/hwmon/mc34vr500_pmic.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 3176c33af6c6..b917c2528b62 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2350,6 +2350,13 @@ config SENSORS_INTEL_M10_BMC_HWMON
 	  sensors monitor various telemetry data of different components on the
 	  card, e.g. board temperature, FPGA core temperature/voltage/current.
 
+config SENSORS_MC34VR500
+	tristate "NXP MC34VR500 hardware monitoring driver"
+	depends on I2C
+	help
+	  If you say yes here you get support for the temperature and input
+	  voltage sensors of the NXP MC34VR500.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index e2e4e87b282f..99e8cd8275c5 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -216,6 +216,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
+obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
 
 obj-$(CONFIG_SENSORS_OCC)	+= occ/
 obj-$(CONFIG_SENSORS_PECI)	+= peci/
diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
new file mode 100644
index 000000000000..bddf108d05ae
--- /dev/null
+++ b/drivers/hwmon/mc34vr500.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * An hwmon driver for the NXP MC34VR500
+ *
+ * Copyright 2022 Mario Kicherer <dev@kicherer.org>
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include "mc34vr500_pmic.h"
+
+#define MC34VR500_DEVICEID_VALUE	0x14
+
+// INTSENSE0
+#define ENS_BIT		(1<<0)
+#define LOWVINS_BIT	(1<<1)
+#define THERM110S_BIT	(1<<2)
+#define THERM120S_BIT	(1<<3)
+#define THERM125S_BIT	(1<<4)
+#define THERM130S_BIT	(1<<5)
+
+// INTSENSE1
+#define SW1FAULTS1_BIT	(1<<0)
+#define SW1FAULTS2_BIT	(1<<1)
+#define SW1FAULTS3_BIT	(1<<2)
+#define SW2FAULTS_BIT	(1<<3)
+#define SW3FAULTS1_BIT	(1<<4)
+#define SW3FAULTS2_BIT	(1<<5)
+#define SW4FAULTS_BIT	(1<<6)
+
+// INTSENSE4
+#define LDO1FAULTS_BIT	(1<<1)
+#define LDO2FAULTS_BIT	(1<<2)
+#define LDO3FAULTS_BIT	(1<<3)
+#define LDO4FAULTS_BIT	(1<<4)
+#define LDO5FAULTS_BIT	(1<<5)
+
+struct mc34vr500_data {
+	struct i2c_client	*client;
+	struct regmap *regmap;
+};
+
+static ssize_t mc34vr500_bool_show(struct device *dev,
+				   struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct mc34vr500_data *data = (struct mc34vr500_data *) dev_get_drvdata(dev);
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(data->regmap, MC34VR500_INTSENSE0 + (attr->index >> 8), &reg);
+	if (ret < 0)
+		return ret;
+
+	reg &= (attr->index & 0xff);
+
+	return sysfs_emit(buf, "%d\n", !!reg);
+}
+
+// INTSENSE0
+static SENSOR_DEVICE_ATTR_RO(in1_alarm, mc34vr500_bool, 0x00 | LOWVINS_BIT);
+static SENSOR_DEVICE_ATTR_RO(temp110_alarm, mc34vr500_bool, 0x00 | THERM110S_BIT);
+static SENSOR_DEVICE_ATTR_RO(temp120_alarm, mc34vr500_bool, 0x00 | THERM120S_BIT);
+static SENSOR_DEVICE_ATTR_RO(temp125_alarm, mc34vr500_bool, 0x00 | THERM125S_BIT);
+static SENSOR_DEVICE_ATTR_RO(temp130_alarm, mc34vr500_bool, 0x00 | THERM130S_BIT);
+
+// INTSENSE1
+static SENSOR_DEVICE_ATTR_RO(curr1_alarm, mc34vr500_bool, 0x300 | SW1FAULTS1_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr2_alarm, mc34vr500_bool, 0x300 | SW1FAULTS2_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr3_alarm, mc34vr500_bool, 0x300 | SW1FAULTS3_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr4_alarm, mc34vr500_bool, 0x300 | SW2FAULTS_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr5_alarm, mc34vr500_bool, 0x300 | SW3FAULTS1_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr6_alarm, mc34vr500_bool, 0x300 | SW3FAULTS2_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr7_alarm, mc34vr500_bool, 0x300 | SW4FAULTS_BIT);
+
+// INTSENSE4
+static SENSOR_DEVICE_ATTR_RO(curr8_alarm, mc34vr500_bool, 0x600 | LDO1FAULTS_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr9_alarm, mc34vr500_bool, 0x600 | LDO2FAULTS_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr10_alarm, mc34vr500_bool, 0x600 | LDO3FAULTS_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr11_alarm, mc34vr500_bool, 0x600 | LDO4FAULTS_BIT);
+static SENSOR_DEVICE_ATTR_RO(curr12_alarm, mc34vr500_bool, 0x600 | LDO5FAULTS_BIT);
+
+static struct attribute *mc34vr500_attrs[] = {
+	&sensor_dev_attr_in1_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp110_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp120_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp125_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp130_alarm.dev_attr.attr,
+
+	&sensor_dev_attr_curr1_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr2_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr3_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr4_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr5_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr6_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr7_alarm.dev_attr.attr,
+
+	&sensor_dev_attr_curr8_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr9_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr10_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr11_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr12_alarm.dev_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mc34vr500);
+
+static irqreturn_t mc34vr500_process_interrupt(int irq, void *userdata)
+{
+	struct mc34vr500_data *data = (struct mc34vr500_data *) userdata;
+	struct i2c_client *client = data->client;
+	unsigned int reg;
+	int ret;
+
+	pr_debug("mc34vr500: received interrupt\n");
+
+	ret = regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
+	if (ret < 0) {
+		dev_err(&client->dev, "unable to read mc34vr500 intsense0 register\n");
+		return ret;
+	}
+
+	if (reg) {
+		pr_warn("mc34vr500: interrupt intstat0 %u\n", reg);
+
+		if (reg & LOWVINS_BIT) {
+			ret = hwmon_notify_event(&client->dev, hwmon_in,
+						 hwmon_in_alarm, 1);
+			if (ret)
+				dev_err(&client->dev,
+					"mc34vr500: error, hwmon_notify_event() failed: %d\n",
+					ret);
+		}
+
+		if (reg & THERM110S_BIT) {
+			ret = hwmon_notify_event(&client->dev, hwmon_temp,
+						 hwmon_temp_alarm, 110);
+			if (ret)
+				dev_err(&client->dev,
+					"mc34vr500: error, hwmon_notify_event() failed: %d\n",
+					ret);
+		}
+
+		reg = 0;
+		ret = regmap_write(data->regmap, MC34VR500_INTSTAT0, reg);
+		if (ret) {
+			dev_err(&client->dev, "unable to enable intmask0 interrupts\n");
+			return ret;
+		}
+	}
+
+	ret = regmap_read(data->regmap, MC34VR500_INTSTAT1, &reg);
+	if (ret < 0) {
+		dev_err(&client->dev, "unable to read mc34vr500 intsense1 register\n");
+		return ret;
+	}
+
+	if (reg) {
+		pr_warn("mc34vr500: interrupt intstat1 %u\n", reg);
+
+		reg = 0;
+		ret = regmap_write(data->regmap, MC34VR500_INTSTAT1, reg);
+		if (ret) {
+			dev_err(&client->dev, "unable to enable intmask1 interrupts\n");
+			return ret;
+		}
+	}
+
+	ret = regmap_read(data->regmap, MC34VR500_INTSTAT4, &reg);
+	if (ret < 0) {
+		dev_err(&client->dev, "unable to read mc34vr500 intsense4 register\n");
+		return ret;
+	}
+
+	if (reg) {
+		pr_warn("mc34vr500: interrupt intstat4 %u\n", reg);
+
+		reg = 0;
+		ret = regmap_write(data->regmap, MC34VR500_INTSTAT4, reg);
+		if (ret) {
+			dev_err(&client->dev, "unable to enable intmask4 interrupts\n");
+			return ret;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_config mc34vr500_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MC34VR500_PWRGD_EN,
+};
+
+static int mc34vr500_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct mc34vr500_data *data;
+	struct device *hwmon_dev;
+	int ret;
+	unsigned int reg, revid, fabid;
+	struct regmap *regmap;
+	u32 interrupt_mask;
+
+	regmap = devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(regmap);
+	}
+
+	data = devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regmap = regmap;
+	data->client = client;
+
+	ret = regmap_read(regmap, MC34VR500_DEVICEID, &reg);
+	if (ret < 0) {
+		dev_err(dev, "unable to read config register\n");
+
+		return ret;
+	}
+
+	if (reg != MC34VR500_DEVICEID_VALUE) {
+		dev_err(dev, "invalid config register value 0x%x\n", reg);
+
+		return -ENODEV;
+	}
+
+	ret = regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
+	if (ret < 0) {
+		dev_err(dev, "unable to read mc34vr500 revid register\n");
+		return ret;
+	}
+
+	ret = regmap_read(regmap, MC34VR500_FABID, &fabid);
+	if (ret < 0) {
+		dev_err(dev, "unable to read mc34vr500 fabid register\n");
+		return ret;
+	}
+
+	pr_notice("mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
+
+
+	ret = of_property_read_u32(dev->of_node,
+				   "interrupt-mask",
+				   &interrupt_mask);
+	if (ret == -EINVAL) {
+		interrupt_mask = 0;
+	} else if (ret) {
+		dev_err(dev, "Error reading interrupt_mask\n");
+		return ret;
+	}
+
+	ret = regmap_read(regmap, MC34VR500_INTSTAT0, &reg);
+	if (ret < 0) {
+		dev_err(dev, "unable to read mc34vr500 intstat0 register\n");
+		return ret;
+	}
+	reg = reg & (~interrupt_mask);
+
+	if (reg)
+		pr_notice("mc34vr500: intstat0: 0x%x\n", reg);
+
+	if (reg & LOWVINS_BIT)
+		pr_notice("mc34vr500: low input voltage detected\n");
+
+	if (reg & THERM130S_BIT)
+		pr_notice("mc34vr500: temperature >= 130°c\n");
+	else if (reg & THERM125S_BIT)
+		pr_notice("mc34vr500: temperature >= 125°c\n");
+	else if (reg & THERM120S_BIT)
+		pr_notice("mc34vr500: temperature >= 120°c\n");
+	else if (reg & THERM110S_BIT)
+		pr_notice("mc34vr500: temperature >= 110°c\n");
+
+	ret = regmap_read(regmap, MC34VR500_INTSTAT1, &reg);
+	if (ret < 0) {
+		dev_err(dev, "unable to read mc34vr500 intstat1 register\n");
+		return ret;
+	}
+	reg = reg & ((~interrupt_mask) >> 8);
+
+	if (reg)
+		pr_notice("mc34vr500: intstat1: 0x%x\n", reg);
+
+	ret = regmap_read(regmap, MC34VR500_INTSTAT4, &reg);
+	if (ret < 0) {
+		dev_err(dev, "unable to read mc34vr500 intstat4 register\n");
+		return ret;
+	}
+	reg = reg & ((~interrupt_mask) >> 16);
+
+	if (reg)
+		pr_notice("mc34vr500: intstat4: 0x%x\n", reg);
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+							   data,
+							   mc34vr500_groups);
+
+	if (client->irq) {
+		pr_notice("mc34vr500: enabling IRQ...\n");
+
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						mc34vr500_process_interrupt,
+						IRQF_TRIGGER_RISING |
+							IRQF_ONESHOT |
+							IRQF_SHARED,
+						dev_name(dev),
+						data);
+		if (ret) {
+			dev_err(dev, "Error requesting irq\n");
+			return ret;
+		}
+
+		/* clear interrupts */
+		reg = 0;
+		ret = regmap_write(regmap, MC34VR500_INTSTAT0, reg);
+		if (ret) {
+			dev_err(dev, "unable to write intstat0 register\n");
+			return ret;
+		}
+
+		/* enable interrupts */
+		ret = regmap_write(regmap, MC34VR500_INTMASK0, interrupt_mask & 0xff);
+		if (ret) {
+			dev_err(dev, "unable to enable intmask0 interrupts\n");
+			return ret;
+		}
+
+		reg = 0;
+		ret = regmap_write(regmap, MC34VR500_INTSTAT1, reg);
+		if (ret) {
+			dev_err(dev, "unable to write intstat1 register\n");
+			return ret;
+		}
+
+		ret = regmap_write(regmap, MC34VR500_INTMASK1, (interrupt_mask >> 8) & 0xff);
+		if (ret) {
+			dev_err(dev, "unable to enable intmask1 interrupts\n");
+			return ret;
+		}
+
+		reg = 0;
+		ret = regmap_write(regmap, MC34VR500_INTSTAT4, reg);
+		if (ret) {
+			dev_err(dev, "unable to write intstat1 register\n");
+			return ret;
+		}
+
+		ret = regmap_write(regmap, MC34VR500_INTMASK4, (interrupt_mask >> 16) & 0xff);
+		if (ret) {
+			dev_err(dev, "unable to enable intmask1 interrupts\n");
+			return ret;
+		}
+	}
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id mc34vr500_id[] = {
+	{ "mc34vr500", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mc34vr500_id);
+
+static struct i2c_driver mc34vr500_driver = {
+	.driver = {
+		.name	= "mc34vr500",
+	},
+	.probe_new = mc34vr500_probe,
+	.id_table = mc34vr500_id,
+};
+
+module_i2c_driver(mc34vr500_driver);
+
+MODULE_AUTHOR("Mario Kicherer <dev@kicherer.org>");
+
+MODULE_DESCRIPTION("MC34VR500 driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/mc34vr500_pmic.h b/drivers/hwmon/mc34vr500_pmic.h
new file mode 100644
index 000000000000..1543ac692d72
--- /dev/null
+++ b/drivers/hwmon/mc34vr500_pmic.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ * Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
+ */
+
+#ifndef __MC34VR500_H_
+#define __MC34VR500_H_
+
+#define MC34VR500_I2C_ADDR	0x08
+
+/* Drivers name */
+#define MC34VR500_REGULATOR_DRIVER	"mc34vr500_regulator"
+
+/* Register map */
+enum {
+	MC34VR500_DEVICEID		= 0x00,
+
+	MC34VR500_SILICONREVID		= 0x03,
+	MC34VR500_FABID,
+	MC34VR500_INTSTAT0,
+	MC34VR500_INTMASK0,
+	MC34VR500_INTSENSE0,
+	MC34VR500_INTSTAT1,
+	MC34VR500_INTMASK1,
+	MC34VR500_INTSENSE1,
+
+	MC34VR500_INTSTAT4		= 0x11,
+	MC34VR500_INTMASK4,
+	MC34VR500_INTSENSE4,
+
+	MC34VR500_PWRCTL		= 0x1B,
+
+	MC34VR500_SW1VOLT		= 0x2E,
+	MC34VR500_SW1STBY,
+	MC34VR500_SW1OFF,
+	MC34VR500_SW1MODE,
+	MC34VR500_SW1CONF,
+	MC34VR500_SW2VOLT,
+	MC34VR500_SW2STBY,
+	MC34VR500_SW2OFF,
+	MC34VR500_SW2MODE,
+	MC34VR500_SW2CONF,
+
+	MC34VR500_SW3VOLT		= 0x3C,
+	MC34VR500_SW3STBY,
+	MC34VR500_SW3OFF,
+	MC34VR500_SW3MODE,
+	MC34VR500_SW3CONF,
+
+	MC34VR500_SW4VOLT		= 0x4A,
+	MC34VR500_SW4STBY,
+	MC34VR500_SW4OFF,
+	MC34VR500_SW4MODE,
+	MC34VR500_SW4CONF,
+
+	MC34VR500_REFOUTCRTRL		= 0x6A,
+
+	MC34VR500_LDO1CTL		= 0x6D,
+	MC34VR500_LDO2CTL,
+	MC34VR500_LDO3CTL,
+	MC34VR500_LDO4CTL,
+	MC34VR500_LDO5CTL,
+
+	MC34VR500_PAGE_REGISTER		= 0x7F,
+
+	/* Internal RAM */
+	MC34VR500_SW1_VOLT		= 0xA8,
+	MC34VR500_SW1_SEQ,
+	MC34VR500_SW1_CONFIG,
+
+	MC34VR500_SW2_VOLT		= 0xAC,
+	MC34VR500_SW2_SEQ,
+	MC34VR500_SW2_CONFIG,
+
+	MC34VR500_SW3_VOLT		= 0xB0,
+	MC34VR500_SW3_SEQ,
+	MC34VR500_SW3_CONFIG,
+
+	MC34VR500_SW4_VOLT		= 0xB8,
+	MC34VR500_SW4_SEQ,
+	MC34VR500_SW4_CONFIG,
+
+	MC34VR500_REFOUT_SEQ		= 0xC4,
+
+	MC34VR500_LDO1_VOLT		= 0xCC,
+	MC34VR500_LDO1_SEQ,
+
+	MC34VR500_LDO2_VOLT		= 0xD0,
+	MC34VR500_LDO2_SEQ,
+
+	MC34VR500_LDO3_VOLT		= 0xD4,
+	MC34VR500_LDO3_SEQ,
+
+	MC34VR500_LDO4_VOLT		= 0xD8,
+	MC34VR500_LDO4_SEQ,
+
+	MC34VR500_LDO5_VOLT		= 0xDC,
+	MC34VR500_LDO5_SEQ,
+
+	MC34VR500_PU_CONFIG1		= 0xE0,
+
+	MC34VR500_TBB_POR		= 0xE4,
+
+	MC34VR500_PWRGD_EN		= 0xE8,
+
+	MC34VR500_NUM_OF_REGS,
+};
+
+/* Registor offset based on SWxVOLT register */
+#define MC34VR500_VOLT_OFFSET	0
+#define MC34VR500_STBY_OFFSET	1
+#define MC34VR500_OFF_OFFSET	2
+#define MC34VR500_MODE_OFFSET	3
+#define MC34VR500_CONF_OFFSET	4
+
+#define SW_MODE_MASK	0xf
+#define SW_MODE_SHIFT	0
+
+#define LDO_VOL_MASK	0xf
+#define LDO_EN		(1 << 4)
+#define LDO_MODE_SHIFT	4
+#define LDO_MODE_MASK	(1 << 4)
+#define LDO_MODE_OFF	0
+#define LDO_MODE_ON	1
+
+#define REFOUTEN	(1 << 4)
+
+/*
+ * Regulator Mode Control
+ *
+ * OFF: The regulator is switched off and the output voltage is discharged.
+ * PFM: In this mode, the regulator is always in PFM mode, which is useful
+ *      at light loads for optimized efficiency.
+ * PWM: In this mode, the regulator is always in PWM mode operation
+ *	regardless of load conditions.
+ * APS: In this mode, the regulator moves automatically between pulse
+ *	skipping mode and PWM mode depending on load conditions.
+ *
+ * SWxMODE[3:0]
+ * Normal Mode  |  Standby Mode	|      value
+ *   OFF		OFF		0x0
+ *   PWM		OFF		0x1
+ *   PFM		OFF		0x3
+ *   APS		OFF		0x4
+ *   PWM		PWM		0x5
+ *   PWM		APS		0x6
+ *   APS		APS		0x8
+ *   APS		PFM		0xc
+ *   PWM		PFM		0xd
+ */
+#define OFF_OFF		0x0
+#define PWM_OFF		0x1
+#define PFM_OFF		0x3
+#define APS_OFF		0x4
+#define PWM_PWM		0x5
+#define PWM_APS		0x6
+#define APS_APS		0x8
+#define APS_PFM		0xc
+#define PWM_PFM		0xd
+
+enum swx {
+	SW1 = 0,
+	SW2,
+	SW3,
+	SW4,
+};
+
+int mc34vr500_get_sw_volt(uint8_t sw);
+int mc34vr500_set_sw_volt(uint8_t sw, int sw_volt);
+int power_mc34vr500_init(unsigned char bus);
+#endif /* __MC34VR500_PMIC_H_ */
-- 
2.34.1

