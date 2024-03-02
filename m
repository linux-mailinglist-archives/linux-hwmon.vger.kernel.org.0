Return-Path: <linux-hwmon+bounces-1302-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9486EF83
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Mar 2024 09:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF0F28510C
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Mar 2024 08:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB62214298;
	Sat,  2 Mar 2024 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="AVbKjHJk"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC113AD4;
	Sat,  2 Mar 2024 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709367933; cv=none; b=QBWFVroTssFUgIwewnBbP/K3Ww885cBAilKzWNYrU1GAKXY3I9BHqrkYEleUIx4Af+bGz+7m8FrDq4ALuI69BtcqLAfSEzLE/ESzOWZsA70qNa1H+sQE2eYO9K0/6FhVnRt1KZy8zFRqEj0Fhw0PRa5YGFrEVXa7B/JqP8Gc3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709367933; c=relaxed/simple;
	bh=aOXt0etRn0iI2pTnk+q60Tvwdmn3qjTu+2GZ+MPbXEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+ZRQgOEI5jcNr4D2ii8r6n5cHme3wVm87DaxXBiBfw7G9GRaCBzRQpCD9BBDTGmU18M3AQlHtY7rqsTAh+V+UJzP+5/UTMlov5dSkALi9GeSBJzpMYKQG7UaDARqw52sOkYJVSZwPlIxPtiANYDvtjXGB+8L357cCh4C4my9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=AVbKjHJk; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4C31AA0F;
	Sat,  2 Mar 2024 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1709367547;
	bh=uBcRNeJLWt5bXN8LL3zh8wUF673J9TLVGF0cM0s95Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVbKjHJkm+9uQlNqZO9YUUY2AI3k/3bKujwb4LdTE3TFigoSXbTYrBBJrSaVEGyfu
	 LCOXbVH49UFqf63/bGdlbdnzMAWlUMa1evXrsRcVPkonuu/TeguMhhPtYEo5XBi3sr
	 B8w6zTllSa6KlENs5z7DiPq6R5DANfSw8KyGjwuM=
Date: Sat, 2 Mar 2024 00:18:57 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: baneric926@gmail.com
Cc: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com,
	naresh.solanki@9elements.com, billy_tsai@aspeedtech.com
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
Message-ID: <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240227005606.1107203-4-kcfeng0@nuvoton.com>

On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:
>From: Ban Feng <kcfeng0@nuvoton.com>
>
>NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>
>Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>---
> Documentation/hwmon/index.rst   |   1 +
> Documentation/hwmon/nct7363.rst |  33 +++
> MAINTAINERS                     |   2 +
> drivers/hwmon/Kconfig           |  11 +
> drivers/hwmon/Makefile          |   1 +
> drivers/hwmon/nct7363.c         | 412 ++++++++++++++++++++++++++++++++
> 6 files changed, 460 insertions(+)
> create mode 100644 Documentation/hwmon/nct7363.rst
> create mode 100644 drivers/hwmon/nct7363.c
>
>diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>index c7ed1f73ac06..302f954b45be 100644
>--- a/Documentation/hwmon/index.rst
>+++ b/Documentation/hwmon/index.rst
>@@ -165,6 +165,7 @@ Hardware Monitoring Kernel Drivers
>    mp5990
>    nct6683
>    nct6775
>+   nct7363
>    nct7802
>    nct7904
>    npcm750-pwm-fan
>diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct7363.rst
>new file mode 100644
>index 000000000000..89699c95aa4b
>--- /dev/null
>+++ b/Documentation/hwmon/nct7363.rst
>@@ -0,0 +1,33 @@
>+.. SPDX-License-Identifier: GPL-2.0
>+
>+Kernel driver nct7363
>+=====================
>+
>+Supported chip:
>+
>+  * Nuvoton NCT7363Y
>+
>+    Prefix: nct7363
>+
>+    Addresses: I2C 0x20, 0x21, 0x22, 0x23
>+
>+Author: Ban Feng <kcfeng0@nuvoton.com>
>+
>+
>+Description
>+-----------
>+
>+The NCT7363Y is a Fan controller which provides up to 16 independent
>+FAN input monitors, and up to 16 independent PWM output with SMBus interface.
>+
>+
>+Sysfs entries
>+-------------
>+
>+Currently, the driver supports the following features:
>+
>+======================= =======================================================
>+fanX_input		provide current fan rotation value in RPM
>+
>+pwmX			get or set PWM fan control value.
>+======================= =======================================================
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 7b1efefed7c4..7ca66b713e30 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -15089,6 +15089,8 @@ M:	Ban Feng <kcfeng0@nuvoton.com>
> L:	linux-hwmon@vger.kernel.org
> S:	Maintained
> F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
>+F:	Documentation/hwmon/nct7363.rst
>+F:	drivers/hwmon/nct7363.c
>
> NETDEVSIM
> M:	Jakub Kicinski <kuba@kernel.org>
>diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>index a608264da87d..a297b5409b04 100644
>--- a/drivers/hwmon/Kconfig
>+++ b/drivers/hwmon/Kconfig
>@@ -1616,6 +1616,17 @@ config SENSORS_NCT6775_I2C
> 	  This driver can also be built as a module. If so, the module
> 	  will be called nct6775-i2c.
>
>+config SENSORS_NCT7363
>+	tristate "Nuvoton NCT7363Y"
>+	depends on I2C
>+	select REGMAP_I2C
>+	help
>+	  If you say yes here you get support for the Nuvoton NCT7363Y,
>+	  hardware monitoring chip.
>+
>+	  This driver can also be built as a module. If so, the module
>+	  will be called nct7363.
>+
> config SENSORS_NCT7802
> 	tristate "Nuvoton NCT7802Y"
> 	depends on I2C
>diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>index 47be39af5c03..d5e7531204df 100644
>--- a/drivers/hwmon/Makefile
>+++ b/drivers/hwmon/Makefile
>@@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
> nct6775-objs			:= nct6775-platform.o
> obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
> obj-$(CONFIG_SENSORS_NCT6775_I2C) += nct6775-i2c.o
>+obj-$(CONFIG_SENSORS_NCT7363)	+= nct7363.o
> obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
> obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
> obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
>diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
>new file mode 100644
>index 000000000000..c79d3ca4f111
>--- /dev/null
>+++ b/drivers/hwmon/nct7363.c
>@@ -0,0 +1,412 @@
>+// SPDX-License-Identifier: GPL-2.0-or-later
>+/*
>+ * Copyright (c) 2023 Nuvoton Technology corporation.
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/bits.h>
>+#include <linux/err.h>
>+#include <linux/hwmon.h>
>+#include <linux/hwmon-sysfs.h>
>+#include <linux/i2c.h>
>+#include <linux/module.h>
>+#include <linux/mutex.h>
>+#include <linux/regmap.h>
>+#include <linux/slab.h>
>+
>+#define NCT7363_REG_GPIO_0_3		0x20
>+#define NCT7363_REG_GPIO_4_7		0x21
>+#define NCT7363_REG_GPIO_10_13		0x22
>+#define NCT7363_REG_GPIO_14_17		0x23
>+#define NCT7363_REG_PWMEN_0_7		0x38
>+#define NCT7363_REG_PWMEN_8_15		0x39
>+#define NCT7363_REG_FANINEN_0_7		0x41
>+#define NCT7363_REG_FANINEN_8_15	0x42
>+#define NCT7363_REG_FANINX_HVAL(x)	(0x48 + ((x) * 2))
>+#define NCT7363_REG_FANINX_LVAL(x)	(0x49 + ((x) * 2))
>+#define NCT7363_REG_FSCPXDUTY(x)	(0x90 + ((x) * 2))
>+
>+#define PWM_SEL(x)			(BIT(0) << (((x) % 4) * 2))
>+#define FANIN_SEL(x)			(BIT(1) << (((x) % 4) * 2))
>+
>+#define NCT7363_FANINX_LVAL_MASK	GENMASK(4, 0)
>+#define NCT7363_FANIN_MASK		GENMASK(12, 0)
>+
>+#define NCT7363_PWM_COUNT		16
>+
>+static inline unsigned long FAN_FROM_REG(u16 val)
>+{
>+	/* In case fan is stopped or divide by 0 */
>+	if (val == NCT7363_FANIN_MASK || val == 0)
>+		return	0;
>+
>+	return (1350000UL / val);
>+}
>+
>+static const struct of_device_id nct7363_of_match[] = {
>+	{ .compatible = "nuvoton,nct7363" },

As far as I can see from the code in this driver, it looks like this 
driver should also be compatible with the nct7362; shall we add the ID 
table entry for it now?  (Though I only have a datasheet for the 
nct7362, not the nct7363, so I don't know exactly how they differ.)

>+	{ },
>+};
>+MODULE_DEVICE_TABLE(of, nct7363_of_match);
>+
>+struct nct7363_data {
>+	struct regmap		*regmap;
>+	struct mutex		lock; /* protect register access */
>+
>+	u16			fanin_mask;
>+	u16			pwm_mask;
>+};
>+
>+static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
>+			    long *val)
>+{
>+	struct nct7363_data *data = dev_get_drvdata(dev);
>+	unsigned int hi, lo;
>+	u16 cnt, rpm;
>+	int ret = 0;
>+
>+	switch (attr) {
>+	case hwmon_fan_input:
>+		/*
>+		 * High-byte register should be read first to latch
>+		 * synchronous low-byte value
>+		 */
>+		ret = regmap_read(data->regmap,
>+				  NCT7363_REG_FANINX_HVAL(channel), &hi);
>+		if (ret)
>+			return ret;
>+
>+		ret = regmap_read(data->regmap,
>+			NCT7363_REG_FANINX_LVAL(channel), &lo);
>+		if (ret)
>+			return ret;

I think this pair of reads should be done under data->lock to ensure 
that the LVAL read gets the right latched value in a scenario where 
multiple threads executing this function end up with their register 
reads interleaved.

>+
>+		cnt = (hi << 5) | (lo & NCT7363_FANINX_LVAL_MASK);
>+		rpm = FAN_FROM_REG(cnt);
>+		*val = (long)rpm;

Given that rpm is assigned from an unsigned long (FAN_FROM_REG()) and 
then to a long (*val), is there any reason we want it as a u16 in 
between the two?  Or for that matter, why not just:

   *val = FAN_FROM_REG(cnt);

?

>+		return 0;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static umode_t nct7363_fan_is_visible(const void *_data, u32 attr, int channel)
>+{
>+	const struct nct7363_data *data = _data;
>+
>+	switch (attr) {
>+	case hwmon_fan_input:
>+		if (data->fanin_mask & BIT(channel))
>+			return 0444;
>+		break;
>+	default:
>+		break;
>+	}
>+
>+	return 0;
>+}
>+
>+static int nct7363_read_pwm(struct device *dev, u32 attr, int channel,
>+			    long *val)
>+{
>+	struct nct7363_data *data = dev_get_drvdata(dev);
>+	unsigned int regval;
>+	u16 ret;
>+
>+	switch (attr) {
>+	case hwmon_pwm_input:
>+		ret = regmap_read(data->regmap,
>+				  NCT7363_REG_FSCPXDUTY(channel), &regval);
>+		if (ret)
>+			return ret;
>+
>+		*val = (long)regval;
>+		return 0;
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static int nct7363_write_pwm(struct device *dev, u32 attr, int channel,
>+			     long val)
>+{
>+	struct nct7363_data *data = dev_get_drvdata(dev);
>+	int ret;
>+
>+	switch (attr) {
>+	case hwmon_pwm_input:
>+		if (val < 0 || val > 255)
>+			return -EINVAL;
>+
>+		mutex_lock(&data->lock);
>+		ret = regmap_write(data->regmap,
>+				   NCT7363_REG_FSCPXDUTY(channel), val);
>+		mutex_unlock(&data->lock);

...though here, I'm not sure the locking is needed -- is there something 
that necessitates it for a single register write?

>+
>+		return ret;
>+
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static umode_t nct7363_pwm_is_visible(const void *_data, u32 attr, int channel)
>+{
>+	const struct nct7363_data *data = _data;
>+
>+	switch (attr) {
>+	case hwmon_pwm_input:
>+		if (data->pwm_mask & BIT(channel))
>+			return 0644;
>+		break;
>+	default:
>+		break;
>+	}
>+
>+	return 0;
>+}
>+
>+static int nct7363_read(struct device *dev, enum hwmon_sensor_types type,
>+			u32 attr, int channel, long *val)
>+{
>+	switch (type) {
>+	case hwmon_fan:
>+		return nct7363_read_fan(dev, attr, channel, val);
>+	case hwmon_pwm:
>+		return nct7363_read_pwm(dev, attr, channel, val);
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static int nct7363_write(struct device *dev, enum hwmon_sensor_types type,
>+			 u32 attr, int channel, long val)
>+{
>+	switch (type) {
>+	case hwmon_pwm:
>+		return nct7363_write_pwm(dev, attr, channel, val);
>+	default:
>+		return -EOPNOTSUPP;
>+	}
>+}
>+
>+static umode_t nct7363_is_visible(const void *data,
>+				  enum hwmon_sensor_types type,
>+				  u32 attr, int channel)
>+{
>+	switch (type) {
>+	case hwmon_fan:
>+		return nct7363_fan_is_visible(data, attr, channel);
>+	case hwmon_pwm:
>+		return nct7363_pwm_is_visible(data, attr, channel);
>+	default:
>+		return 0;
>+	}
>+}
>+
>+static const struct hwmon_channel_info *nct7363_info[] = {
>+	HWMON_CHANNEL_INFO(fan,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT,
>+			   HWMON_F_INPUT),
>+	HWMON_CHANNEL_INFO(pwm,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT,
>+			   HWMON_PWM_INPUT),
>+	NULL
>+};
>+
>+static const struct hwmon_ops nct7363_hwmon_ops = {
>+	.is_visible = nct7363_is_visible,
>+	.read = nct7363_read,
>+	.write = nct7363_write,
>+};
>+
>+static const struct hwmon_chip_info nct7363_chip_info = {
>+	.ops = &nct7363_hwmon_ops,
>+	.info = nct7363_info,
>+};
>+
>+static int nct7363_init_chip(struct nct7363_data *data)
>+{
>+	u8 i, gpio0_3 = 0, gpio4_7 = 0, gpio10_13 = 0, gpio14_17 = 0;
>+	int ret;
>+
>+	for (i = 0; i < NCT7363_PWM_COUNT; i++) {
>+		if (i < 4) {
>+			if (data->pwm_mask & BIT(i))
>+				gpio0_3 |= PWM_SEL(i);
>+			if (data->fanin_mask & BIT(i))
>+				gpio10_13 |= FANIN_SEL(i);
>+		} else if (i < 8) {
>+			if (data->pwm_mask & BIT(i))
>+				gpio4_7 |= PWM_SEL(i);
>+			if (data->fanin_mask & BIT(i))
>+				gpio14_17 |= FANIN_SEL(i);
>+		} else if (i < 12) {
>+			if (data->pwm_mask & BIT(i))
>+				gpio10_13 |= PWM_SEL(i);
>+			if (data->fanin_mask & BIT(i))
>+				gpio0_3 |= FANIN_SEL(i);
>+		} else {
>+			if (data->pwm_mask & BIT(i))
>+				gpio14_17 |= PWM_SEL(i);
>+			if (data->fanin_mask & BIT(i))
>+				gpio4_7 |= FANIN_SEL(i);
>+		}
>+	}

With the caveat that I haven't actually sketched it out myself to be 
sure, might it be a bit cleaner to do this with a 4-element array 
indexed by 'i / 4' instead of a big if/else chain and a bunch of 
near-duplicated blocks?

>+
>+	/* Pin Function Configuration */
>+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_0_3, gpio0_3);
>+	if (ret < 0)
>+		return ret;
>+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_4_7, gpio4_7);
>+	if (ret < 0)
>+		return ret;
>+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_10_13, gpio10_13);
>+	if (ret < 0)
>+		return ret;
>+	ret = regmap_write(data->regmap, NCT7363_REG_GPIO_14_17, gpio14_17);
>+	if (ret < 0)
>+		return ret;
>+
>+	/* PWM and FANIN Monitoring Enable */
>+	ret = regmap_write(data->regmap, NCT7363_REG_PWMEN_0_7,
>+			   data->pwm_mask & 0xff);
>+	if (ret < 0)
>+		return ret;
>+	ret = regmap_write(data->regmap, NCT7363_REG_PWMEN_8_15,
>+			   (data->pwm_mask >> 8) & 0xff);
>+	if (ret < 0)
>+		return ret;
>+	ret = regmap_write(data->regmap, NCT7363_REG_FANINEN_0_7,
>+			   data->fanin_mask & 0xff);
>+	if (ret < 0)
>+		return ret;
>+	ret = regmap_write(data->regmap, NCT7363_REG_FANINEN_8_15,
>+			   (data->fanin_mask >> 8) & 0xff);
>+	if (ret < 0)
>+		return ret;
>+
>+	return 0;
>+}
>+
>+static int nct7363_present_pwm_fanin(struct device *dev,
>+				     struct device_node *child,
>+				     struct nct7363_data *data)
>+{
>+	struct of_phandle_args args;
>+	int ret, fanin_cnt;
>+	u8 *fanin_ch;
>+	u8 ch, index;
>+
>+	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
>+					 0, &args);
>+	if (ret)
>+		return ret;
>+
>+	data->pwm_mask |= BIT(args.args[0]);

Perhaps we should have

   if (args.args[0] >= NCT7363_PWM_COUNT)
     return -EINVAL;

here?

>+
>+	fanin_cnt = of_property_count_u8_elems(child, "tach-ch");
>+	if (fanin_cnt < 1)

fanin_cnt < 1 || fanin_cnt >= NCT7363_PWM_COUNT

>+		return -EINVAL;
>+
>+	fanin_ch = devm_kcalloc(dev, fanin_cnt, sizeof(*fanin_ch), GFP_KERNEL);

Keeping this allocation around persistently for the whole lifetime of 
the device seems unnecessary -- it's not used beyond this function, 
right?  In fact, dynamically allocating it at all seems like overkill, 
considering that in addition to being temporary, it's also got a pretty 
small upper bound on its size.  I'd think a simple

   u8 fanin_ch[NCT7363_PWM_COUNT];

would suffice?  (Along with the check above to ensure fanin_cnt is 
within range of course.)

>+	if (!fanin_ch)
>+		return -ENOMEM;
>+
>+	ret = of_property_read_u8_array(child, "tach-ch", fanin_ch, fanin_cnt);
>+	if (ret)
>+		return ret;
>+
>+	for (ch = 0; ch < fanin_cnt; ch++) {
>+		index = fanin_ch[ch];

...and likewise a range check here too?

>+		data->fanin_mask |= BIT(index);
>+	}
>+

Should we also grab the pulses-per-revolution property here and factor 
that in in FAN_FROM_REG()?

>+	return 0;
>+}
>+
>+static const struct regmap_config nct7363_regmap_config = {
>+	.reg_bits = 8,
>+	.val_bits = 8,
>+};
>+
>+static int nct7363_probe(struct i2c_client *client)
>+{
>+	struct device *dev = &client->dev;
>+	struct device_node *child;
>+	struct nct7363_data *data;
>+	struct device *hwmon_dev;
>+	int ret;
>+
>+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>+	if (!data)
>+		return -ENOMEM;
>+
>+	data->regmap = devm_regmap_init_i2c(client, &nct7363_regmap_config);
>+	if (IS_ERR(data->regmap))
>+		return PTR_ERR(data->regmap);
>+
>+	mutex_init(&data->lock);
>+
>+	for_each_child_of_node(dev->of_node, child) {
>+		ret = nct7363_present_pwm_fanin(dev, child, data);
>+		if (ret) {
>+			of_node_put(child);
>+			return ret;
>+		}
>+	}
>+
>+	/* Initialize the chip */
>+	ret = nct7363_init_chip(data);
>+	if (ret)
>+		return ret;
>+
>+	hwmon_dev =
>+		devm_hwmon_device_register_with_info(dev, client->name, data,
>+						     &nct7363_chip_info, NULL);
>+	return PTR_ERR_OR_ZERO(hwmon_dev);
>+}
>+
>+static struct i2c_driver nct7363_driver = {
>+	.class = I2C_CLASS_HWMON,

Maybe add an i2c_device_id table to accompany the of_match table?

>+	.driver = {
>+		.name = "nct7363",
>+		.of_match_table = nct7363_of_match,
>+	},
>+	.probe = nct7363_probe,
>+};
>+
>+module_i2c_driver(nct7363_driver);
>+
>+MODULE_AUTHOR("CW Ho <cwho@nuvoton.com>");
>+MODULE_AUTHOR("Ban Feng <kcfeng0@nuvoton.com>");
>+MODULE_DESCRIPTION("NCT7363 Hardware Monitoring Driver");
>+MODULE_LICENSE("GPL");
>-- 
>2.34.1
>
>

