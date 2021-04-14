Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE2F35EEF5
	for <lists+linux-hwmon@lfdr.de>; Wed, 14 Apr 2021 10:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348349AbhDNIA4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 14 Apr 2021 04:00:56 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42]:37749 "EHLO
        mail-ej1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232940AbhDNIAz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Apr 2021 04:00:55 -0400
Received: by mail-ej1-f42.google.com with SMTP id w3so30027562ejc.4;
        Wed, 14 Apr 2021 01:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wDJ0gI8SIsM7RtEkdnPpXcZUZl6+Vj8Yk5cF33BynzE=;
        b=c/1rixrAGUAcvav1AVO4T7Ilzl1e0OkNrRyuoorA028yD5gjD3LAN3f9vW5FP6GLP9
         rCN0bgyH1rWe7HVs9eXoGvQvx5fpO91wmbFqYoap28xaAh6HbqQUllK+wNzx7mLN+cDM
         FRSU6fAgtdOScCekPv3BOYSBsYOUtkpgO5tlBxyKRViCi1DN/AXDTsk9D447pkIdLYqm
         McTeB7CyLc8WMPC1P4sROAOw66vEr2uiajMDbxkM0X/vlBNz6+OJQHUQ8NcU9KGnjYaH
         4EUi3hVvhZz6rJSKw6AUOX5JvA4wiEMP5kIQ+/DmSOFdw+ox1anlJQNFe3gLoQ9XD4Zj
         AB+Q==
X-Gm-Message-State: AOAM530PxJ1IxOpWjAfvPm/gjMTNZxv4IhmwEPmKwG7Z3WPiFXgS+Ga4
        NzlgUphDgeDK0BELZbcVUOj9wwjCA2Wusg==
X-Google-Smtp-Source: ABdhPJyi3Sp2WP7nXyA3iVBF3mQUtCnAOvSeCwc7aKgtI/D1k0s11HwU4TPzkFdg/jmJWTUUHij+oA==
X-Received: by 2002:a17:906:4d17:: with SMTP id r23mr15748790eju.134.1618387229145;
        Wed, 14 Apr 2021 01:00:29 -0700 (PDT)
Received: from localhost ([2a02:8308:387:c900:a7b5:b859:9449:c07b])
        by smtp.gmail.com with ESMTPSA id r25sm11386617edv.78.2021.04.14.01.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 01:00:28 -0700 (PDT)
From:   =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@cesnet.cz>
Cc:     =?UTF-8?q?V=C3=A1clav=20Kubern=C3=A1t?= <kubernat@cesnet.cz>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6] hwmon: Add driver for fsp-3y PSUs and PDUs
Date:   Wed, 14 Apr 2021 10:00:17 +0200
Message-Id: <20210414080019.3530794-1-kubernat@cesnet.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210329143833.1047539-1-kubernat@cesnet.cz>
References: <20210329143833.1047539-1-kubernat@cesnet.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds support for these devices:
- YH-5151E - the PDU
- YM-2151E - the PSU

The device datasheet says that the devices support PMBus 1.2, but in my
testing, a lot of the commands aren't supported and if they are, they
sometimes behave strangely or inconsistently. For example, writes to the
PAGE command requires using PEC, otherwise the write won't work and the
page won't switch, even though, the standard says that PEC is optional.
On the other hand, writes to SMBALERT don't require PEC. Because of
this, the driver is mostly reverse engineered with the help of a tool
called pmbus_peek written by David Brownell (and later adopted by my
colleague Jan Kundrát).

The device also has some sort of a timing issue when switching pages,
which is explained further in the code.

Because of this, the driver support is limited. It exposes only the
values, that have been tested to work correctly.

Signed-off-by: Václav Kubernát <kubernat@cesnet.cz>
---
 Documentation/hwmon/fsp-3y.rst |  28 ++++
 Documentation/hwmon/index.rst  |   1 +
 drivers/hwmon/pmbus/Kconfig    |  10 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/fsp-3y.c   | 253 +++++++++++++++++++++++++++++++++
 5 files changed, 293 insertions(+)
 create mode 100644 Documentation/hwmon/fsp-3y.rst
 create mode 100644 drivers/hwmon/pmbus/fsp-3y.c

diff --git a/Documentation/hwmon/fsp-3y.rst b/Documentation/hwmon/fsp-3y.rst
new file mode 100644
index 000000000000..5693d83a2035
--- /dev/null
+++ b/Documentation/hwmon/fsp-3y.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver fsp3y
+======================
+Supported devices:
+  * 3Y POWER YH-5151E
+  * 3Y POWER YM-2151E
+
+Author: Václav Kubernát <kubernat@cesnet.cz>
+
+Description
+-----------
+This driver implements limited support for two 3Y POWER devices.
+
+Sysfs entries
+-------------
+  * in1_input            input voltage
+  * in2_input            12V output voltage
+  * in3_input            5V output voltage
+  * curr1_input          input current
+  * curr2_input          12V output current
+  * curr3_input          5V output current
+  * fan1_input           fan rpm
+  * temp1_input          temperature 1
+  * temp2_input          temperature 2
+  * temp3_input          temperature 3
+  * power1_input         input power
+  * power2_input         output power
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fcb870ce6286..55c9f014c248 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -63,6 +63,7 @@ Hardware Monitoring Kernel Drivers
    f71805f
    f71882fg
    fam15h_power
+   fsp-3y
    ftsteutates
    g760a
    g762
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 03606d4298a4..9d12d446396c 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -56,6 +56,16 @@ config SENSORS_BEL_PFE
 	  This driver can also be built as a module. If so, the module will
 	  be called bel-pfe.
 
+config SENSORS_FSP_3Y
+	tristate "FSP/3Y-Power power supplies"
+	help
+	  If you say yes here you get hardware monitoring support for
+	  FSP/3Y-Power hot-swap power supplies.
+	  Supported models: YH-5151E, YM-2151E
+
+	  This driver can also be built as a module. If so, the module will
+	  be called fsp-3y.
+
 config SENSORS_IBM_CFFPS
 	tristate "IBM Common Form Factor Power Supply"
 	depends on LEDS_CLASS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 6a4ba0fdc1db..bfe218ad898f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
+obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
new file mode 100644
index 000000000000..564649e87e34
--- /dev/null
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for FSP 3Y-Power PSUs
+ *
+ * Copyright (c) 2021 Václav Kubernát, CESNET
+ *
+ * This driver is mostly reverse engineered with the help of a tool called pmbus_peek written by
+ * David Brownell (and later adopted by Jan Kundrát). The device has some sort of a timing issue
+ * when switching pages, details are explained in the code. The driver support is limited. It
+ * exposes only the values, that have been tested to work correctly. Unsupported values either
+ * aren't supported by the devices or their encondings are unknown.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define YM2151_PAGE_12V_LOG	0x00
+#define YM2151_PAGE_12V_REAL	0x00
+#define YM2151_PAGE_5VSB_LOG	0x01
+#define YM2151_PAGE_5VSB_REAL	0x20
+#define YH5151E_PAGE_12V_LOG	0x00
+#define YH5151E_PAGE_12V_REAL	0x00
+#define YH5151E_PAGE_5V_LOG	0x01
+#define YH5151E_PAGE_5V_REAL	0x10
+#define YH5151E_PAGE_3V3_LOG	0x02
+#define YH5151E_PAGE_3V3_REAL	0x11
+
+enum chips {
+	ym2151e,
+	yh5151e
+};
+
+struct fsp3y_data {
+	struct pmbus_driver_info info;
+	int chip;
+	int page;
+};
+
+#define to_fsp3y_data(x) container_of(x, struct fsp3y_data, info)
+
+static int page_log_to_page_real(int page_log, enum chips chip)
+{
+	switch (chip) {
+	case ym2151e:
+		switch (page_log) {
+		case YM2151_PAGE_12V_LOG:
+			return YM2151_PAGE_12V_REAL;
+		case YM2151_PAGE_5VSB_LOG:
+			return YM2151_PAGE_5VSB_REAL;
+		}
+		return -EINVAL;
+	case yh5151e:
+		switch (page_log) {
+		case YH5151E_PAGE_12V_LOG:
+			return YH5151E_PAGE_12V_REAL;
+		case YH5151E_PAGE_5V_LOG:
+			return YH5151E_PAGE_5V_LOG;
+		case YH5151E_PAGE_3V3_LOG:
+			return YH5151E_PAGE_3V3_REAL;
+		}
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+
+static int set_page(struct i2c_client *client, int page_log)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct fsp3y_data *data = to_fsp3y_data(info);
+	int rv;
+	int page_real;
+
+	if (page_log < 0)
+		return 0;
+
+	page_real = page_log_to_page_real(page_log, data->chip);
+	if (page_real < 0)
+		return page_real;
+
+	if (data->page != page_real) {
+		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page_real);
+		if (rv < 0)
+			return rv;
+
+		data->page = page_real;
+
+		/*
+		 * Testing showed that the device has a timing issue. After
+		 * setting a page, it takes a while, before the device actually
+		 * gives the correct values from the correct page. 20 ms was
+		 * tested to be enough to not give wrong values (15 ms wasn't
+		 * enough).
+		 */
+		usleep_range(20000, 30000);
+	}
+
+	return 0;
+}
+
+static int fsp3y_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	int rv;
+
+	rv = set_page(client, page);
+	if (rv < 0)
+		return rv;
+
+	return i2c_smbus_read_byte_data(client, reg);
+}
+
+static int fsp3y_read_word_data(struct i2c_client *client, int page, int phase, int reg)
+{
+	int rv;
+
+	/*
+	 * This masks commands which weren't tested to work correctly. Some of
+	 * the masked commands return 0xFFFF. These would probably get tagged as
+	 * invalid by pmbus_core. Other ones do return values which might be
+	 * useful (that is, they are not 0xFFFF), but their encoding is unknown,
+	 * and so they are unsupported.
+	 */
+	switch (reg) {
+	case PMBUS_READ_FAN_SPEED_1:
+	case PMBUS_READ_IIN:
+	case PMBUS_READ_IOUT:
+	case PMBUS_READ_PIN:
+	case PMBUS_READ_POUT:
+	case PMBUS_READ_TEMPERATURE_1:
+	case PMBUS_READ_TEMPERATURE_2:
+	case PMBUS_READ_TEMPERATURE_3:
+	case PMBUS_READ_VIN:
+	case PMBUS_READ_VOUT:
+	case PMBUS_STATUS_WORD:
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	rv = set_page(client, page);
+	if (rv < 0)
+		return rv;
+
+	return i2c_smbus_read_word_data(client, reg);
+}
+
+struct pmbus_driver_info fsp3y_info[] = {
+	[ym2151e] = {
+		.pages = 2,
+		.func[YM2151_PAGE_12V_LOG] =
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+			PMBUS_HAVE_PIN | PMBUS_HAVE_POUT  |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+			PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |
+			PMBUS_HAVE_FAN12,
+		.func[YM2151_PAGE_5VSB_LOG] =
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT,
+			PMBUS_HAVE_IIN,
+		.read_word_data = fsp3y_read_word_data,
+		.read_byte_data = fsp3y_read_byte_data,
+	},
+	[yh5151e] = {
+		.pages = 3,
+		.func[YH5151E_PAGE_12V_LOG] =
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+			PMBUS_HAVE_POUT  |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3,
+		.func[YH5151E_PAGE_5V_LOG] =
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+			PMBUS_HAVE_POUT,
+		.func[YH5151E_PAGE_3V3_LOG] =
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+			PMBUS_HAVE_POUT,
+		.read_word_data = fsp3y_read_word_data,
+		.read_byte_data = fsp3y_read_byte_data,
+	}
+};
+
+static int fsp3y_detect(struct i2c_client *client)
+{
+	int rv;
+	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+
+	rv = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	if (rv < 0)
+		return rv;
+
+	buf[rv] = '\0';
+
+	if (rv == 8) {
+		if (!strcmp(buf, "YM-2151E"))
+			return ym2151e;
+		else if (!strcmp(buf, "YH-5151E"))
+			return yh5151e;
+	}
+
+	dev_err(&client->dev, "Unsupported model %.*s\n", rv, buf);
+	return -ENODEV;
+}
+
+static const struct i2c_device_id fsp3y_id[] = {
+	{"ym2151e", ym2151e},
+	{"yh5151e", yh5151e},
+	{0}
+};
+
+static int fsp3y_probe(struct i2c_client *client)
+{
+	struct fsp3y_data *data;
+	const struct i2c_device_id *id;
+	int rv;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct fsp3y_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip = fsp3y_detect(client);
+	if (data->chip < 0)
+		return data->chip;
+
+	id = i2c_match_id(fsp3y_id, client);
+	if (data->chip != id->driver_data)
+		dev_warn(&client->dev, "Device mismatch: Configured %s (%d), detected %d\n",
+			 id->name, (int)id->driver_data, data->chip);
+
+	rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
+	if (rv < 0)
+		return rv;
+	data->page = rv;
+
+	data->info = fsp3y_info[data->chip];
+
+	return pmbus_do_probe(client, &data->info);
+}
+
+MODULE_DEVICE_TABLE(i2c, fsp3y_id);
+
+static struct i2c_driver fsp3y_driver = {
+	.driver = {
+		   .name = "fsp3y",
+		   },
+	.probe_new = fsp3y_probe,
+	.id_table = fsp3y_id
+};
+
+module_i2c_driver(fsp3y_driver);
+
+MODULE_AUTHOR("Václav Kubernát");
+MODULE_DESCRIPTION("PMBus driver for FSP/3Y-Power power supplies");
+MODULE_LICENSE("GPL");
-- 
2.31.1

