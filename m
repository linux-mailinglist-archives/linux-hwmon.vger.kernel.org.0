Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29155364F5
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Jun 2019 21:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfFETtq (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 5 Jun 2019 15:49:46 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:3040 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfFETtq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 15:49:46 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55JnPZ4017969
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 13:49:25 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55JnFuT000988
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 13:49:17 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH v2 2/2] hwmon: (pmbus) Add Infineon IRPS5401 driver
Date:   Wed,  5 Jun 2019 13:49:01 -0600
Message-Id: <1559764141-26105-3-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559764141-26105-1-git-send-email-hancock@sedsystems.ca>
References: <1559764141-26105-1-git-send-email-hancock@sedsystems.ca>
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add a driver to support the Infineon IRPS5401 PMIC. This chip has 5
pages corresponding to 4 switching outputs and one linear (LDO) output.
The switching and LDO outputs have slightly different supported
parameters.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/hwmon/pmbus/Kconfig    |  9 ++++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/irps5401.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/irps5401.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 30751eb..8eb5bb4 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -64,6 +64,15 @@ config SENSORS_IR38064
 	  This driver can also be built as a module. If so, the module will
 	  be called ir38064.
 
+config SENSORS_IRPS5401
+	tristate "Infineon IRPS5401"
+	help
+	  If you say yes here you get hardware monitoring support for the
+	  Infineon IRPS5401 controller.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called irps5401.
+
 config SENSORS_ISL68137
 	tristate "Intersil ISL68137"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 2219b93..e4a7dd0 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
+obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
new file mode 100644
index 0000000..825e9fa
--- /dev/null
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for the Infineon IRPS5401M PMIC.
+ *
+ * Copyright (c) 2019 SED Systems, a division of Calian Ltd.
+ *
+ * The device supports VOUT_PEAK, IOUT_PEAK, and TEMPERATURE_PEAK, however
+ * this driver does not currently support them.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define IRPS5401_SW_FUNC (PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | \
+			  PMBUS_HAVE_STATUS_INPUT | \
+			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
+			  PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
+			  PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | \
+			  PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
+
+#define IRPS5401_LDO_FUNC (PMBUS_HAVE_VIN | \
+			   PMBUS_HAVE_STATUS_INPUT | \
+			   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
+			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
+			   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | \
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
+
+static struct pmbus_driver_info irps5401_info = {
+	.pages = 5,
+	.func[0] = IRPS5401_SW_FUNC,
+	.func[1] = IRPS5401_SW_FUNC,
+	.func[2] = IRPS5401_SW_FUNC,
+	.func[3] = IRPS5401_SW_FUNC,
+	.func[4] = IRPS5401_LDO_FUNC,
+};
+
+static int irps5401_probe(struct i2c_client *client,
+			  const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &irps5401_info);
+}
+
+static const struct i2c_device_id irps5401_id[] = {
+	{"irps5401", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, irps5401_id);
+
+static struct i2c_driver irps5401_driver = {
+	.driver = {
+		   .name = "irps5401",
+		   },
+	.probe = irps5401_probe,
+	.remove = pmbus_do_remove,
+	.id_table = irps5401_id,
+};
+
+module_i2c_driver(irps5401_driver);
+
+MODULE_AUTHOR("Robert Hancock");
+MODULE_DESCRIPTION("PMBus driver for Infineon IRPS5401");
+MODULE_LICENSE("GPL");
+
-- 
1.8.3.1

