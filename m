Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6252A5128BC
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 Apr 2022 03:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240507AbiD1Bas (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 27 Apr 2022 21:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239808AbiD1Bap (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 21:30:45 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA6F70934;
        Wed, 27 Apr 2022 18:27:31 -0700 (PDT)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net [174.21.163.222])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A393191E;
        Wed, 27 Apr 2022 18:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1651109250;
        bh=awxwKJL2fdvlcHXNXuVQh6g4FC39ft8awfgGWwXEC7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Adn+J8zRmv5fU+9L0BN7g/xpLHyWjku1TunUQlBl0cNsCyzr9YxbBY8mNGY1o76Om
         xvvaXA9tvgrz9oeJqmje6cLBcRojL0Q/6XQBSTm9E64pA/xj8R/mdNa8QyAiZQOC0h
         1bmaboj+PrJdDzZZrxwR2FWsG1ie/Gd9OB8XoWm8=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] hwmon: (nct6775) Add i2c driver
Date:   Wed, 27 Apr 2022 18:27:07 -0700
Message-Id: <20220428012707.24921-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220428012707.24921-1-zev@bewilderbeest.net>
References: <20220428012707.24921-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver provides an i2c I/O mechanism for the core nct6775 driver,
as might be used by a BMC.  Because the Super I/O chip is shared with
the host CPU in such a scenario (and the host should ultimately be in
control of it), the i2c driver is strictly read-only to avoid
interfering with any usage by the host (aside from the bank-select
register, which seems to be replicated for the i2c interface).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Tested-by: Renze Nicolai <renze@rnplus.nl>
---
 MAINTAINERS                 |   7 ++
 drivers/hwmon/Kconfig       |  17 ++++
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/nct6775-i2c.c | 195 ++++++++++++++++++++++++++++++++++++
 4 files changed, 220 insertions(+)
 create mode 100644 drivers/hwmon/nct6775-i2c.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 88fdb7cb3197..aac1a184a4c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13538,6 +13538,13 @@ F:	drivers/hwmon/nct6775-core.c
 F:	drivers/hwmon/nct6775-platform.c
 F:	drivers/hwmon/nct6775.h
 
+NCT6775 HARDWARE MONITOR DRIVER - I2C DRIVER
+M:	Zev Weiss <zev@bewilderbeest.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
+F:	drivers/hwmon/nct6775-i2c.c
+
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
 S:	Maintained
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 85c22bba439b..a1dac1aa4e3a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1489,6 +1489,23 @@ config SENSORS_NCT6775
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6775.
 
+config SENSORS_NCT6775_I2C
+	tristate "I2C driver for Nuvoton NCT6775F and compatibles"
+	depends on I2C
+	select REGMAP_I2C
+	select SENSORS_NCT6775
+	help
+	  If you say yes here you get support for the hardware monitoring
+	  functionality of the Nuvoton NCT6106D, NCT6775F, NCT6776F, NCT6779D,
+	  NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D, and compatible
+	  Super-I/O chips via their I2C interface.
+
+	  If you're not building a kernel for a BMC, this is probably
+	  not the driver you want (see CONFIG_SENSORS_NCT6775_PLATFORM).
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nct6775-i2c.
+
 config SENSORS_NCT7802
 	tristate "Nuvoton NCT7802Y"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 93f2b774cc5e..004ab87c9b80 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
 nct6775-objs			:= nct6775-platform.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
+obj-$(CONFIG_SENSORS_NCT6775_I2C) += nct6775-i2c.o
 obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
 obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
 obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
new file mode 100644
index 000000000000..e1bcd1146191
--- /dev/null
+++ b/drivers/hwmon/nct6775-i2c.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * nct6775-i2c - I2C driver for the hardware monitoring functionality of
+ *	         Nuvoton NCT677x Super-I/O chips
+ *
+ * Copyright (C) 2022 Zev Weiss <zev@bewilderbeest.net>
+ *
+ * This driver interacts with the chip via it's "back door" i2c interface, as
+ * is often exposed to a BMC.  Because the host may still be operating the
+ * chip via the ("front door") LPC interface, this driver cannot assume that
+ * it actually has full control of the chip, and in particular must avoid
+ * making any changes that could confuse the host's LPC usage of it.  It thus
+ * operates in a strictly read-only fashion, with the only exception being the
+ * bank-select register (which seems, thankfully, to be replicated for the i2c
+ * interface so it doesn't affect the LPC interface).
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/err.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include "nct6775.h"
+
+static int nct6775_i2c_read(void *ctx, unsigned int reg, unsigned int *val)
+{
+	int ret;
+	u32 tmp;
+	u8 bank = reg >> 8;
+	struct nct6775_data *data = ctx;
+	struct i2c_client *client = data->driver_data;
+
+	if (bank != data->bank) {
+		ret = i2c_smbus_write_byte_data(client, NCT6775_REG_BANK, bank);
+		if (ret)
+			return ret;
+		data->bank = bank;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, reg & 0xff);
+	if (ret < 0)
+		return ret;
+	tmp = ret;
+
+	if (nct6775_reg_is_word_sized(data, reg)) {
+		ret = i2c_smbus_read_byte_data(client, (reg & 0xff) + 1);
+		if (ret < 0)
+			return ret;
+		tmp = (tmp << 8) | ret;
+	}
+
+	*val = tmp;
+	return 0;
+}
+
+/*
+ * The write operation is a dummy so as not to disturb anything being done
+ * with the chip via LPC.
+ */
+static int nct6775_i2c_write(void *ctx, unsigned int reg, unsigned int value)
+{
+	struct nct6775_data *data = ctx;
+	struct i2c_client *client = data->driver_data;
+
+	dev_dbg(&client->dev, "skipping attempted write: %02x -> %03x\n", value, reg);
+
+	/*
+	 * This is a lie, but writing anything but the bank-select register is
+	 * something this driver shouldn't be doing.
+	 */
+	return 0;
+}
+
+static const struct of_device_id __maybe_unused nct6775_i2c_of_match[] = {
+	{ .compatible = "nuvoton,nct6106", .data = (void *)nct6106, },
+	{ .compatible = "nuvoton,nct6116", .data = (void *)nct6116, },
+	{ .compatible = "nuvoton,nct6775", .data = (void *)nct6775, },
+	{ .compatible = "nuvoton,nct6776", .data = (void *)nct6776, },
+	{ .compatible = "nuvoton,nct6779", .data = (void *)nct6779, },
+	{ .compatible = "nuvoton,nct6791", .data = (void *)nct6791, },
+	{ .compatible = "nuvoton,nct6792", .data = (void *)nct6792, },
+	{ .compatible = "nuvoton,nct6793", .data = (void *)nct6793, },
+	{ .compatible = "nuvoton,nct6795", .data = (void *)nct6795, },
+	{ .compatible = "nuvoton,nct6796", .data = (void *)nct6796, },
+	{ .compatible = "nuvoton,nct6797", .data = (void *)nct6797, },
+	{ .compatible = "nuvoton,nct6798", .data = (void *)nct6798, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, nct6775_i2c_of_match);
+
+static const struct i2c_device_id nct6775_i2c_id[] = {
+	{ "nct6106", nct6106 },
+	{ "nct6116", nct6116 },
+	{ "nct6775", nct6775 },
+	{ "nct6776", nct6776 },
+	{ "nct6779", nct6779 },
+	{ "nct6791", nct6791 },
+	{ "nct6792", nct6792 },
+	{ "nct6793", nct6793 },
+	{ "nct6795", nct6795 },
+	{ "nct6796", nct6796 },
+	{ "nct6797", nct6797 },
+	{ "nct6798", nct6798 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nct6775_i2c_id);
+
+static int nct6775_i2c_probe_init(struct nct6775_data *data)
+{
+	u32 tsi_channel_mask;
+	struct i2c_client *client = data->driver_data;
+
+	/*
+	 * The i2c interface doesn't provide access to the control registers
+	 * needed to determine the presence of other fans, but fans 1 and 2
+	 * are (in principle) always there.
+	 *
+	 * In practice this is perhaps a little silly, because the system
+	 * using this driver is mostly likely a BMC, and hence probably has
+	 * totally separate fan tachs & pwms of its own that are actually
+	 * controlling/monitoring the fans -- these are thus unlikely to be
+	 * doing anything actually useful.
+	 */
+	data->has_fan = 0x03;
+	data->has_fan_min = 0x03;
+	data->has_pwm = 0x03;
+
+	/*
+	 * Because on a BMC this driver may be bound very shortly after power
+	 * is first applied to the device, the automatic TSI channel detection
+	 * in nct6775_probe() (which has already been run at this point) may
+	 * not find anything if a channel hasn't yet produced a temperature
+	 * reading.  Augment whatever was found via autodetection (if
+	 * anything) with the channels DT says should be active.
+	 */
+	if (!of_property_read_u32(client->dev.of_node, "nuvoton,tsi-channel-mask",
+				  &tsi_channel_mask))
+		data->have_tsi_temp |= tsi_channel_mask & GENMASK(NUM_TSI_TEMP - 1, 0);
+
+	return 0;
+}
+
+static const struct regmap_config nct6775_i2c_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = nct6775_i2c_read,
+	.reg_write = nct6775_i2c_write,
+};
+
+static int nct6775_i2c_probe(struct i2c_client *client)
+{
+	struct nct6775_data *data;
+	const struct of_device_id *of_id;
+	const struct i2c_device_id *i2c_id;
+	struct device *dev = &client->dev;
+
+	of_id = of_match_device(nct6775_i2c_of_match, dev);
+	i2c_id = i2c_match_id(nct6775_i2c_id, client);
+
+	if (of_id && (unsigned long)of_id->data != i2c_id->driver_data)
+		dev_notice(dev, "Device mismatch: %s in device tree, %s detected\n",
+			   of_id->name, i2c_id->name);
+
+	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->kind = i2c_id->driver_data;
+
+	data->read_only = true;
+	data->driver_data = client;
+	data->driver_init = nct6775_i2c_probe_init;
+
+	return nct6775_probe(dev, data, &nct6775_i2c_regmap_config);
+}
+
+static struct i2c_driver nct6775_i2c_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "nct6775-i2c",
+		.of_match_table = of_match_ptr(nct6775_i2c_of_match),
+	},
+	.probe_new = nct6775_i2c_probe,
+	.id_table = nct6775_i2c_id,
+};
+
+module_i2c_driver(nct6775_i2c_driver);
+
+MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
+MODULE_DESCRIPTION("I2C driver for NCT6775F and compatible chips");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(HWMON_NCT6775);
-- 
2.36.0

