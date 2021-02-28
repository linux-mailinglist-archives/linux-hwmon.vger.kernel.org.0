Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD696327525
	for <lists+linux-hwmon@lfdr.de>; Mon,  1 Mar 2021 00:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhB1XQz (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 28 Feb 2021 18:16:55 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:35318 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbhB1XQy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Feb 2021 18:16:54 -0500
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1D670891AF;
        Mon,  1 Mar 2021 12:07:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1614553638;
        bh=mTm99MPkc+6dS7pISgrAnkJH72py1xCk7Vkk6ktc3EU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a9j2RyeJrnhMOjj5G1DP57GC2bonpTQBEI9sm0XmDXY6GO1zpmtq2ITdw9r90Vzf/
         SOnqvVtPLcFU2j8I66E6I0TQ4J24csYrFWerFgOuchBn9hQrhBS7MdZ+jHAF3ZRYrW
         EMqBWWsteDw0Pv4UyAhcZj12l8x7leMPqfIqCUryFL87/e5g0/pLlywlI0hhEP5RGb
         nCC//Q1e8JrrS+r2dTvuEoR8lBC1a3gC9t3VSo6W4Wf2+qBs2Lqm7+BsecJRGAy3A/
         o4S6nAuo9EvCdJaz8lFO14d7tdbRDkZyyedqOjheweVYnrEPOlfOARIfBHqa3rlKIA
         kH0rK6Q0LcsVA==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B603c22250002>; Mon, 01 Mar 2021 12:07:17 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 0165113EF08;
        Mon,  1 Mar 2021 12:07:28 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 8D7DF283985; Mon,  1 Mar 2021 12:07:17 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (pmbus): Add driver for Infineon IR36021
Date:   Mon,  1 Mar 2021 12:07:14 +1300
Message-Id: <20210228230714.26578-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210228230714.26578-1-chris.packham@alliedtelesis.co.nz>
References: <20210228230714.26578-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=bUQKSiCPAAAA:8 a=eFSOPmDLR39FoRlrkAYA:9 a=QEXdDO2ut3YA:10 a=-fHZXUhsFbuwFN3fwQAr:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The IR36021 is a dual=E2=80=90loop digital multi=E2=80=90phase buck contr=
oller.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/hwmon/index.rst   |  1 +
 Documentation/hwmon/ir36021.rst | 62 +++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |  9 ++++
 drivers/hwmon/pmbus/Makefile    |  1 +
 drivers/hwmon/pmbus/ir36021.c   | 81 +++++++++++++++++++++++++++++++++
 5 files changed, 154 insertions(+)
 create mode 100644 Documentation/hwmon/ir36021.rst
 create mode 100644 drivers/hwmon/pmbus/ir36021.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rs=
t
index 8d5a2df1ecb6..b34894403c2b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -77,6 +77,7 @@ Hardware Monitoring Kernel Drivers
    intel-m10-bmc-hwmon
    ir35221
    ir38064
+   ir36021
    isl68137
    it87
    jc42
diff --git a/Documentation/hwmon/ir36021.rst b/Documentation/hwmon/ir3602=
1.rst
new file mode 100644
index 000000000000..36ef8d518b81
--- /dev/null
+++ b/Documentation/hwmon/ir36021.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver ir36021
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Supported chips:
+
+  * Infineon IR36021
+
+    Prefix: ir36021
+    Addresses scanned: -
+
+    Datasheet: Publicly available at the Infineon website
+      https://www.infineon.com/dgdl/ir36021.pdf?fileId=3D5546d462533600a=
4015355d0aa2d1775
+
+Authors:
+      - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+Description
+-----------
+
+The IR36021 is a dual=E2=80=90loop digital multi=E2=80=90phase buck cont=
roller designed for
+point of load applications.
+
+Usage Notes
+-----------
+
+This driver does not probe for PMBus devices. You will have to instantia=
te
+devices explicitly.
+
+Sysfs attributes
+----------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+curr1_label             "iin"
+curr1_input             Measured input current
+curr1_alarm             Input fault alarm
+
+curr2_label             "iout1"
+curr2_input             Measured output current
+curr2_alarm             Output over-current alarm
+
+in1_label               "vin"
+in1_input               Measured input voltage
+in1_alarm               Input under-voltage alarm
+
+in2_label               "vout1"
+in2_input               Measured output voltage
+in2_alarm               Output over-voltage alarm
+
+power1_label            "pin"
+power1_input            Measured input power
+power1_alarm            Input under-voltage alarm
+
+power2_label            "pout1"
+power2_input            Measured output power
+
+temp1_input             Measured temperature
+temp1_alarm             Temperature alarm
+
+temp2_input             Measured other loop temperature
+temp2_alarm             Temperature alarm
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 32d2fc850621..ee8c27b3b83d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -84,6 +84,15 @@ config SENSORS_IR35221
 	  This driver can also be built as a module. If so, the module will
 	  be called ir35221.
=20
+config SENSORS_IR36021
+	tristate "Infineon IR36021"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  IR36021.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ir36021.
+
 config SENSORS_IR38064
 	tristate "Infineon IR38064"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 6a4ba0fdc1db..685a6bc2b15f 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SENSORS_BEL_PFE)	+=3D bel-pfe.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+=3D ibm-cffps.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) +=3D inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+=3D ir35221.o
+obj-$(CONFIG_SENSORS_IR36021)	+=3D ir36021.o
 obj-$(CONFIG_SENSORS_IR38064)	+=3D ir38064.o
 obj-$(CONFIG_SENSORS_IRPS5401)	+=3D irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+=3D isl68137.o
diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.=
c
new file mode 100644
index 000000000000..99b5c7311afd
--- /dev/null
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Infineon IR36021
+ *
+ * Copyright (c) 2021 Allied Telesis
+ */
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info ir36021_info =3D {
+	.pages =3D 1,
+	.format[PSC_VOLTAGE_IN] =3D linear,
+	.format[PSC_VOLTAGE_OUT] =3D linear,
+	.format[PSC_CURRENT_IN] =3D linear,
+	.format[PSC_CURRENT_OUT] =3D linear,
+	.format[PSC_POWER] =3D linear,
+	.format[PSC_TEMPERATURE] =3D linear,
+	.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT
+		| PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT
+		| PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
+		| PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+		| PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int ir36021_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA
+				     | I2C_FUNC_SMBUS_READ_WORD_DATA
+				     | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
+		return -ENODEV;
+
+	ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_MFR_MODEL, 2, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
+		return ret;
+	}
+	if (ret !=3D 2 || !(buf[0] =3D=3D 0x01 || buf[1] =3D=3D 0x2d)) {
+		dev_err(&client->dev, "MFR_MODEL unrecognised\n");
+		return -ENODEV;
+	}
+
+	return pmbus_do_probe(client, id, &ir36021_info);
+}
+
+static const struct i2c_device_id ir36021_id[] =3D {
+	{ "ir36021", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ir36021_id);
+
+static const struct of_device_id __maybe_unused ir36021_of_id[] =3D {
+	{ .compatible =3D "infineon,ir36021" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ir36021_of_id);
+
+static struct i2c_driver ir36021_driver =3D {
+	.class =3D I2C_CLASS_HWMON,
+	.driver =3D {
+		.name =3D "ir36021",
+		.of_match_table =3D of_match_ptr(ir36021_of_id),
+	},
+	.probe =3D ir36021_probe,
+	.remove =3D pmbus_do_remove,
+	.id_table =3D ir36021_id,
+};
+
+module_i2c_driver(ir36021_driver);
+
+MODULE_AUTHOR("Chris Packham <chris.packham@alliedtelesis.co.nz>");
+MODULE_DESCRIPTION("PMBus driver for Infineon IR36021");
+MODULE_LICENSE("GPL");
--=20
2.30.0

