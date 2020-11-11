Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8FB12AF602
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Nov 2020 17:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgKKQQR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 11 Nov 2020 11:16:17 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:13628 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727171AbgKKQQQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Nov 2020 11:16:16 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ABGFaB4018839;
        Wed, 11 Nov 2020 11:16:04 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 34npaax0s3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Nov 2020 11:16:03 -0500
Received: from ASHBMBX9.ad.analog.com (ashbmbx9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 0ABGG2S7049565
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 11 Nov 2020 11:16:02 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 11:16:01 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 11 Nov 2020 11:16:01 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 11 Nov 2020 11:16:01 -0500
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 0ABGFtWi009875;
        Wed, 11 Nov 2020 11:15:58 -0500
From:   <alexandru.tachici@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <linux@roeck-us.net>,
        Alexandru Tachici <alexandru.tachici@analog.com>
Subject: [PATCH v2 2/3] hwmon: ltc2992: Add support for GPIOs.
Date:   Wed, 11 Nov 2020 18:20:56 +0200
Message-ID: <20201111162057.73055-3-alexandru.tachici@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111162057.73055-1-alexandru.tachici@analog.com>
References: <20201111162057.73055-1-alexandru.tachici@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_07:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110096
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Alexandru Tachici <alexandru.tachici@analog.com>

LTC2992 has 4 open-drain GPIOS. This patch exports to user
space the 4 GPIOs using the GPIO driver Linux API.

Signed-off-by: Alexandru Tachici <alexandru.tachici@analog.com>
---
 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/ltc2992.c | 160 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index bf9e387270d6..8a8eb42fb1ec 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -861,6 +861,7 @@ config SENSORS_LTC2990
 config SENSORS_LTC2992
 	tristate "Linear Technology LTC2992"
 	depends on I2C
+	depends on GPIOLIB
 	help
 	  If you say yes here you get support for Linear Technology LTC2992
 	  I2C System Monitor. The LTC2992 measures current, voltage, and
diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index ce679405ac81..78951212ef8b 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -9,6 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/err.h>
+#include <linux/gpio/driver.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
@@ -56,6 +57,9 @@
 #define LTC2992_G4_MAX_THRESH		0x74
 #define LTC2992_G4_MIN_THRESH		0x76
 #define LTC2992_FAULT3			0x92
+#define LTC2992_GPIO_STATUS		0x95
+#define LTC2992_GPIO_IO_CTRL		0x96
+#define LTC2992_GPIO_CTRL		0x97
 
 #define LTC2992_POWER(x)		(LTC2992_POWER1 + ((x) * 0x32))
 #define LTC2992_POWER_MAX(x)		(LTC2992_POWER1_MAX + ((x) * 0x32))
@@ -98,8 +102,18 @@
 #define LTC2992_VADC_UV_LSB		25000
 #define LTC2992_VADC_GPIO_UV_LSB	500
 
+#define LTC2992_GPIO_NR		4
+#define LTC2992_GPIO1_BIT	7
+#define LTC2992_GPIO2_BIT	6
+#define LTC2992_GPIO3_BIT	0
+#define LTC2992_GPIO4_BIT	6
+#define LTC2992_GPIO_BIT(x)	(LTC2992_GPIO_NR - (x) - 1)
+
 struct ltc2992_state {
 	struct i2c_client		*client;
+	struct gpio_chip		gc;
+	struct mutex			gpio_mutex; /* lock for gpio access */
+	const char			*gpio_names[LTC2992_GPIO_NR];
 	struct regmap			*regmap;
 	u32				r_sense_uohm[2];
 };
@@ -113,6 +127,8 @@ struct ltc2992_gpio_regs {
 	u8	alarm;
 	u8	min_alarm_msk;
 	u8	max_alarm_msk;
+	u8	ctrl;
+	u8	ctrl_bit;
 };
 
 static const struct ltc2992_gpio_regs ltc2992_gpio_addr_map[] = {
@@ -125,6 +141,8 @@ static const struct ltc2992_gpio_regs ltc2992_gpio_addr_map[] = {
 		.alarm = LTC2992_FAULT1,
 		.min_alarm_msk = LTC2992_GPIO1_FAULT_MSK(0),
 		.max_alarm_msk = LTC2992_GPIO1_FAULT_MSK(1),
+		.ctrl = LTC2992_GPIO_IO_CTRL,
+		.ctrl_bit = LTC2992_GPIO1_BIT,
 	},
 	{
 		.data = LTC2992_G2,
@@ -135,6 +153,8 @@ static const struct ltc2992_gpio_regs ltc2992_gpio_addr_map[] = {
 		.alarm = LTC2992_FAULT2,
 		.min_alarm_msk = LTC2992_GPIO2_FAULT_MSK(0),
 		.max_alarm_msk = LTC2992_GPIO2_FAULT_MSK(1),
+		.ctrl = LTC2992_GPIO_IO_CTRL,
+		.ctrl_bit = LTC2992_GPIO2_BIT,
 	},
 	{
 		.data = LTC2992_G3,
@@ -145,6 +165,8 @@ static const struct ltc2992_gpio_regs ltc2992_gpio_addr_map[] = {
 		.alarm = LTC2992_FAULT3,
 		.min_alarm_msk = LTC2992_GPIO3_FAULT_MSK(0),
 		.max_alarm_msk = LTC2992_GPIO3_FAULT_MSK(1),
+		.ctrl = LTC2992_GPIO_IO_CTRL,
+		.ctrl_bit = LTC2992_GPIO3_BIT,
 	},
 	{
 		.data = LTC2992_G4,
@@ -155,14 +177,20 @@ static const struct ltc2992_gpio_regs ltc2992_gpio_addr_map[] = {
 		.alarm = LTC2992_FAULT3,
 		.min_alarm_msk = LTC2992_GPIO4_FAULT_MSK(0),
 		.max_alarm_msk = LTC2992_GPIO4_FAULT_MSK(1),
+		.ctrl = LTC2992_GPIO_CTRL,
+		.ctrl_bit = LTC2992_GPIO4_BIT,
 	},
 };
 
+static const char *ltc2992_gpio_names[LTC2992_GPIO_NR] = {
+	"GPIO1", "GPIO2", "GPIO3", "GPIO4",
+};
+
 static int ltc2992_read_reg(struct ltc2992_state *st, u8 addr, const u8 reg_len)
 {
 	u8 regvals[4];
-	int ret;
 	int val;
+	int ret;
 	int i;
 
 	ret = regmap_bulk_read(st->regmap, addr, regvals, reg_len);
@@ -187,6 +215,132 @@ static int ltc2992_write_reg(struct ltc2992_state *st, u8 addr, const u8 reg_len
 	return regmap_bulk_write(st->regmap, addr, regvals, reg_len);
 }
 
+static int ltc2992_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ltc2992_state *st = gpiochip_get_data(chip);
+	unsigned long gpio_status;
+	int reg;
+
+	mutex_lock(&st->gpio_mutex);
+	reg = ltc2992_read_reg(st, LTC2992_GPIO_STATUS, 1);
+	mutex_unlock(&st->gpio_mutex);
+
+	if (reg < 0)
+		return reg;
+
+	gpio_status = reg;
+
+	return !test_bit(LTC2992_GPIO_BIT(offset), &gpio_status);
+}
+
+static int ltc2992_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				     unsigned long *bits)
+{
+	struct ltc2992_state *st = gpiochip_get_data(chip);
+	unsigned long gpio_status;
+	unsigned int gpio_nr;
+	int reg;
+
+	mutex_lock(&st->gpio_mutex);
+	reg = ltc2992_read_reg(st, LTC2992_GPIO_STATUS, 1);
+	mutex_unlock(&st->gpio_mutex);
+
+	if (reg < 0)
+		return reg;
+
+	gpio_status = reg;
+
+	gpio_nr = 0;
+	for_each_set_bit_from(gpio_nr, mask, LTC2992_GPIO_NR) {
+		if (test_bit(LTC2992_GPIO_BIT(gpio_nr), &gpio_status))
+			set_bit(gpio_nr, bits);
+	}
+
+	return 0;
+}
+
+static void ltc2992_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct ltc2992_state *st = gpiochip_get_data(chip);
+	unsigned long gpio_ctrl;
+	int reg;
+
+	mutex_lock(&st->gpio_mutex);
+	reg = ltc2992_read_reg(st, ltc2992_gpio_addr_map[offset].ctrl, 1);
+	if (reg < 0) {
+		mutex_unlock(&st->gpio_mutex);
+		return;
+	}
+
+	gpio_ctrl = reg;
+	assign_bit(ltc2992_gpio_addr_map[offset].ctrl_bit, &gpio_ctrl, value);
+
+	ltc2992_write_reg(st, ltc2992_gpio_addr_map[offset].ctrl, 1, gpio_ctrl);
+	mutex_unlock(&st->gpio_mutex);
+}
+
+static void ltc2992_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				      unsigned long *bits)
+{
+	struct ltc2992_state *st = gpiochip_get_data(chip);
+	unsigned long gpio_ctrl_io = 0;
+	unsigned long gpio_ctrl = 0;
+	unsigned int gpio_nr;
+
+	for_each_set_bit(gpio_nr, mask, LTC2992_GPIO_NR) {
+		if (gpio_nr < 3)
+			assign_bit(ltc2992_gpio_addr_map[gpio_nr].ctrl_bit, &gpio_ctrl_io, true);
+
+		if (gpio_nr == 3)
+			assign_bit(ltc2992_gpio_addr_map[gpio_nr].ctrl_bit, &gpio_ctrl, true);
+	}
+
+	mutex_lock(&st->gpio_mutex);
+	ltc2992_write_reg(st, LTC2992_GPIO_IO_CTRL, 1, gpio_ctrl_io);
+	ltc2992_write_reg(st, LTC2992_GPIO_CTRL, 1, gpio_ctrl);
+	mutex_unlock(&st->gpio_mutex);
+}
+
+static int ltc2992_config_gpio(struct ltc2992_state *st)
+{
+	const char *name = dev_name(&st->client->dev);
+	char *gpio_name;
+	int ret;
+	int i;
+
+	ret = ltc2992_write_reg(st, LTC2992_GPIO_IO_CTRL, 1, 0);
+	if (ret < 0)
+		return ret;
+
+	mutex_init(&st->gpio_mutex);
+
+	for (i = 0; i < ARRAY_SIZE(st->gpio_names); i++) {
+		gpio_name = devm_kasprintf(&st->client->dev, GFP_KERNEL, "ltc2992-%x-%s",
+					   st->client->addr, ltc2992_gpio_names[i]);
+		if (!gpio_name)
+			return -ENOMEM;
+
+		st->gpio_names[i] = gpio_name;
+	}
+
+	st->gc.label = name;
+	st->gc.parent = &st->client->dev;
+	st->gc.owner = THIS_MODULE;
+	st->gc.base = -1;
+	st->gc.names = st->gpio_names;
+	st->gc.ngpio = ARRAY_SIZE(st->gpio_names);
+	st->gc.get = ltc2992_gpio_get;
+	st->gc.get_multiple = ltc2992_gpio_get_multiple;
+	st->gc.set = ltc2992_gpio_set;
+	st->gc.set_multiple = ltc2992_gpio_set_multiple;
+
+	ret = devm_gpiochip_add_data(&st->client->dev, &st->gc, st);
+	if (ret)
+		dev_err(&st->client->dev, "GPIO registering failed (%d)\n", ret);
+
+	return ret;
+}
+
 static umode_t ltc2992_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
 				  int channel)
 {
@@ -784,6 +938,10 @@ static int ltc2992_i2c_probe(struct i2c_client *client, const struct i2c_device_
 	if (ret < 0)
 		return ret;
 
+	ret = ltc2992_config_gpio(st);
+	if (ret < 0)
+		return ret;
+
 	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev, client->name, st,
 							 &ltc2992_chip_info, NULL);
 
-- 
2.20.1

