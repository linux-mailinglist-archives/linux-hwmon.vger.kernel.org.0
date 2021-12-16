Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213A6477DE5
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Dec 2021 21:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhLPUxd (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 16 Dec 2021 15:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234024AbhLPUxc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Dec 2021 15:53:32 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A52C061574;
        Thu, 16 Dec 2021 12:53:31 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id z7so52792edc.11;
        Thu, 16 Dec 2021 12:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2uIZRNj4gQGgCc65fT03hFU5khNyWDwCWZyTXLwzZY=;
        b=NLwZqvMtD52GCUNWMAe+rJfXFpXSNF4hIsEVBXn/Vyfs8E1LMMvUo7y1MdVWhJkotI
         dbwV/aKHV6xtHUDYasLIyLnP0oVq8gZYlooX24RogVr3XWBLelMdMf4VERdgx/MXBAdG
         NshEW0zwbl6m69XbxZ4T4uWSTt9dHZ6rTpqobWxxKwSrItXJ9n6G786eQ/BVxDGLrcGA
         7ZOossXlgw6GjNZCNvUyHdwLfDuHJhcvIQ7ypsMyEjUNnDxpfXBiySjTBsv76H4JMRPc
         dP0e4agzBFXlJh8X5tn6W8d+RHQU8LUjD1spvRiB+1Tm+P1PIjwZcGzrWWW5p/Jhfr+T
         4PRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2uIZRNj4gQGgCc65fT03hFU5khNyWDwCWZyTXLwzZY=;
        b=JuC2zGTVBZrAti22fmfzNnxBps5OeLUE5huHFQRT7eMT18ss+O9WxPpFeNgKr+p6Da
         8LCGBa10P4c1m4IMKppeEnniOgD1fJjbW2Rv4viZoplf6kNEWWl6nTKhU++hBLhMs0Bx
         /70EsjJLRRREyx8U0bpLr0HWylURdGxXK/6uvVhDAd3XoWrKtgV0iF6VdHihU2hOXrtF
         XPLzwbsuklovDgTUVhWOAIREyFZvLEU5xBiA4J7mIs0YC2BxEUK8nnfskQlbuHpi8o1C
         HcueQ0TAy4ga2gsJNbUI106qQVxxtVGOdbcymg1iXurOm30FaUrB/7LtSyniNBjTGsuh
         HybQ==
X-Gm-Message-State: AOAM5328/rMfTVSD+AeASGzstOQMXMFRz5dhPAzRi6ZM0JTN5tqm2uWF
        UbX/AFEZxcmEADtkFgVlfW0=
X-Google-Smtp-Source: ABdhPJyZLYeZiqrhMsrT+WuddiXW+0Gf+1sWfVIiGsWcI+nwH81WZjjgLcG5aoccIfiSQoJKrspCwQ==
X-Received: by 2002:a17:907:2da5:: with SMTP id gt37mr17197046ejc.316.1639688009824;
        Thu, 16 Dec 2021 12:53:29 -0800 (PST)
Received: from tiger.museclub.art (p200300cf9f34ba00f711d38e28b691af.dip0.t-ipconnect.de. [2003:cf:9f34:ba00:f711:d38e:28b6:91af])
        by smtp.googlemail.com with ESMTPSA id h2sm2107842ejo.169.2021.12.16.12.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:53:29 -0800 (PST)
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     andy.shevchenko@gmail.com, pauk.denis@gmail.com,
        Eugene Shalygin <eugene.shalygin@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (asus-ec-sensors) add driver for ASUS EC
Date:   Thu, 16 Dec 2021 21:53:00 +0100
Message-Id: <20211216205303.768991-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver provides the same data as the asus_wmi_ec_sensors driver
(and gets it from the same source) but does not use WMI, polling
the ACPI EC directly.

That provides two enhancements: sensor reading became quicker (on some
systems or kernel configuration it took almost a full second to read
all the sensors, that transfers less than 15 bytes of data), the driver
became more fexible. The driver now relies on ACPI mutex to lock access
to the EC, in the same way as the WMI DSDT code does.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/Kconfig           |  12 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/asus-ec-sensors.c | 753 ++++++++++++++++++++++++++++++++
 3 files changed, 766 insertions(+)
 create mode 100644 drivers/hwmon/asus-ec-sensors.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 43e5245874ad..c2227118b23a 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2253,6 +2253,18 @@ config SENSORS_ASUS_WMI_EC
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_wmi_sensors_ec.
 
+config SENSORS_ASUS_EC
+	tristate "ASUS EC Sensors"
+	depends on ACPI
+	help
+	  If you say yes here you get support for the ACPI embedded controller
+	  hardware monitoring interface found in ASUS motherboards. The driver
+	  currently supports B550/X570 boards, although other ASUS boards might
+	  provide this monitoring interface as well.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called asus_ec_sensors.
+
 endif # ACPI
 
 endif # HWMON
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3a1551b3d570..2e5c216bb5d7 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_HWMON_VID)		+= hwmon-vid.o
 # APCI drivers
 obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
 obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
+obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
 obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
 obj-$(CONFIG_SENSORS_ASUS_WMI_EC)	+= asus_wmi_ec_sensors.o
 
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
new file mode 100644
index 000000000000..dff717017ee3
--- /dev/null
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -0,0 +1,753 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * HWMON driver for ASUS motherboards that publish some sensor values
+ * via the embedded controller registers
+ *
+ * Copyright (C) 2021 Eugene Shalygin <eugene.shalygin@gmail.com>
+
+ * EC provides:
+ * - Chipset temperature
+ * - CPU temperature
+ * - Motherboard temperature
+ * - T_Sensor temperature
+ * - VRM temperature
+ * - Water In temperature
+ * - Water Out temperature
+ * - CPU Optional fan RPM
+ * - Chipset fan RPM
+ * - VRM Heat Sink fan RPM
+ * - Water Flow fan RPM
+ * - CPU current
+ */
+
+#include <linux/acpi.h>
+#include <linux/dev_printk.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sort.h>
+#include <linux/units.h>
+
+#include <asm/unaligned.h>
+
+#define ASUS_EC_BANK_REGISTER 0xff /* Writing to this EC register switches EC bank */
+#define SENSOR_LABEL_LEN 0x10
+/*
+ * Arbitrary set max. allowed bank number. Required for sorting banks and
+ * currently is overkill with just 2 banks used at max, but for the sake
+ * of alignment let's set it to a higher value
+ */
+#define ASUS_EC_MAX_BANK 0x04
+
+#define ACPI_DELAY_MSEC_LOCK	500	/* Wait for 0.5 s max. to acquire the lock */
+
+/* ACPI mutex for locking access to the EC for the firmware */
+#define ASUS_HW_ACCESS_MUTEX_ASMX	"\\AMW0.ASMX"
+
+/* There are two variants of the vendor spelling */
+#define VENDOR_ASUS_UPPER_CASE	"ASUSTeK COMPUTER INC."
+
+typedef union {
+	u32 value;
+	struct {
+		u8 index;
+		u8 bank;
+		u8 size;
+		u8 dummy;
+	} components;
+} sensor_address;
+
+#define MAKE_SENSOR_ADDRESS(size, bank, index)                                 \
+	{                                                                      \
+		.value = (size << 16) + (bank << 8) + index                    \
+	}
+
+static u32 hwmon_attributes[hwmon_max] = {
+	[hwmon_chip] = HWMON_C_REGISTER_TZ,
+	[hwmon_temp] = HWMON_T_INPUT | HWMON_T_LABEL,
+	[hwmon_in] = HWMON_I_INPUT | HWMON_I_LABEL,
+	[hwmon_curr] = HWMON_C_INPUT | HWMON_C_LABEL,
+	[hwmon_fan] = HWMON_F_INPUT | HWMON_F_LABEL,
+};
+
+struct ec_sensor_info {
+	char label[SENSOR_LABEL_LEN];
+	enum hwmon_sensor_types type;
+	sensor_address addr;
+};
+
+#define EC_SENSOR(sensor_label, sensor_type, size, bank, index)                \
+	{                                                                      \
+		.label = sensor_label, .type = sensor_type,                    \
+		.addr = MAKE_SENSOR_ADDRESS(size, bank, index)                 \
+	}
+
+enum known_ec_sensor {
+	SENSOR_TEMP_CHIPSET	= 1 <<  0, /* chipset temperature [℃] */
+	SENSOR_TEMP_CPU		= 1 <<  1, /* CPU temperature [℃] */
+	SENSOR_TEMP_MB		= 1 <<  2, /* motherboard temperature [℃] */
+	SENSOR_TEMP_T_SENSOR	= 1 <<  3, /* "T_Sensor" temperature sensor reading [℃] */
+	SENSOR_TEMP_VRM		= 1 <<  4, /* VRM temperature [℃] */
+	SENSOR_FAN_CPU_OPT	= 1 <<  5, /* CPU_Opt fan [RPM] */
+	SENSOR_FAN_VRM_HS	= 1 <<  6, /* VRM heat sink fan [RPM] */
+	SENSOR_FAN_CHIPSET	= 1 <<  7, /* chipset fan [RPM] */
+	SENSOR_FAN_WATER_FLOW	= 1 <<  8, /* water flow sensor reading [RPM] */
+	SENSOR_CURR_CPU		= 1 <<  9, /* CPU current [A] */
+	SENSOR_TEMP_WATER_IN	= 1 << 10, /* "Water_In" temperature sensor reading [℃] */
+	SENSOR_TEMP_WATER_OUT	= 1 << 11, /* "Water_Out" temperature sensor reading [℃] */
+	SENSOR_END
+};
+
+/*
+ * All the known sensors for ASUS EC controllers
+ */
+static const struct ec_sensor_info known_ec_sensors[] = {
+	EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a), /* SENSOR_TEMP_CHIPSET */
+	EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x3b), /* SENSOR_TEMP_CPU */
+	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x3c), /* SENSOR_TEMP_MB */
+	EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d), /* SENSOR_TEMP_T_SENSOR */
+	EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e), /* SENSOR_TEMP_VRM */
+	EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0), /* SENSOR_FAN_CPU_OPT */
+	EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2), /* SENSOR_FAN_VRM_HS */
+	EC_SENSOR("Chipset", hwmon_fan, 2, 0x00, 0xb4), /* SENSOR_FAN_CHIPSET */
+	EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc), /* SENSOR_FAN_WATER_FLOW */
+	EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4), /* SENSOR_CURR_CPU */
+	EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00), /* SENSOR_TEMP_WATER_IN */
+	EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01), /* SENSOR_TEMP_WATER_OUT */
+};
+
+struct asus_ec_board_info {
+	int sensors;
+	const char *acpi_mutex_path;
+};
+
+static struct asus_ec_board_info board_P_X570_P = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB | SENSOR_TEMP_VRM
+		 | SENSOR_FAN_CHIPSET,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_PW_X570_A = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB | SENSOR_TEMP_VRM
+		| SENSOR_FAN_CHIPSET
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_R_C8H = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB
+		| SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM
+		| SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT
+		| SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET | SENSOR_FAN_WATER_FLOW
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+/* Same as Hero but without chipset fan */
+static struct asus_ec_board_info board_R_C8DH = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB
+		| SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM
+		| SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT
+		| SENSOR_FAN_CPU_OPT | SENSOR_FAN_WATER_FLOW
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+/* Same as Hero but without water */
+static struct asus_ec_board_info board_R_C8F = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB
+		| SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM
+		| SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_R_C8I = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB |
+		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CHIPSET |
+		SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_RS_B550_E_G = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB
+		| SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM
+		| SENSOR_FAN_CPU_OPT,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_RS_B550_I_G = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB
+		| SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM
+		| SENSOR_FAN_VRM_HS
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_RS_X570_E_G = {
+	.sensors = SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB
+		| SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM
+		| SENSOR_FAN_CHIPSET
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+static struct asus_ec_board_info board_RS_X570_I_G = {
+	.sensors = SENSOR_TEMP_T_SENSOR
+		| SENSOR_FAN_VRM_HS | SENSOR_FAN_CHIPSET
+		| SENSOR_CURR_CPU,
+	.acpi_mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX
+};
+
+#define DMI_EXACT_MATCH_BOARD(vendor, name, sensors) {                         \
+		.matches = {                                                   \
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor),             \
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, name),                 \
+		},                                                             \
+		.driver_data = sensors                                         \
+	}
+
+static const struct dmi_system_id asus_ec_dmi_table[] __initconst = {
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "PRIME X570-PRO", &board_P_X570_P),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "Pro WS X570-ACE", &board_PW_X570_A),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII DARK HERO", &board_R_C8DH),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII FORMULA", &board_R_C8F),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII HERO", &board_R_C8H),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII IMPACT", &board_R_C8I),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG STRIX B550-E GAMING", &board_RS_B550_E_G),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG STRIX B550-I GAMING", &board_RS_B550_I_G),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG STRIX X570-E GAMING", &board_RS_X570_E_G),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG STRIX X570-I GAMING", &board_RS_X570_I_G),
+	{}
+};
+
+struct ec_sensor {
+	unsigned int info_index;
+	u32 cached_value;
+};
+
+struct ec_sensors_data {
+	const struct asus_ec_board_info *board;
+	struct ec_sensor *sensors;
+	/* EC registers to read from */
+	u16 *registers;
+	u8 *read_buffer;
+	/* sorted list of unique register banks */
+	u8 banks[ASUS_EC_MAX_BANK];
+	unsigned long last_updated; /* in jiffies */
+	acpi_handle aml_mutex;
+	u8 nr_sensors; /* number of board EC sensors */
+	/* number of EC registers to read (sensor might span more than 1 register) */
+	u8 nr_registers;
+	u8 nr_banks; /* number of unique register banks */
+};
+
+static u8 register_bank(u16 reg)
+{
+	return (reg & 0xff00) >> 8;
+}
+
+static struct ec_sensors_data *get_sensor_data(struct device *pdev)
+{
+	return dev_get_drvdata(pdev);
+}
+
+static const struct ec_sensor_info *
+get_sensor_info(const struct ec_sensors_data *state, int index)
+{
+	return &known_ec_sensors[state->sensors[index].info_index];
+}
+
+static int find_ec_sensor_index(const struct ec_sensors_data *ec,
+				enum hwmon_sensor_types type, int channel)
+{
+	unsigned int i;
+
+	for (i = 0; i < ec->nr_sensors; ++i) {
+		if (get_sensor_info(ec, i)->type == type) {
+			if (channel == 0)
+				return i;
+			--channel;
+		}
+	}
+	return -ENOENT;
+}
+
+static int __init bank_compare(const void *a, const void *b)
+{
+	return *((const s8 *)a) - *((const s8 *)b);
+}
+
+static int __init board_sensors_count(const struct asus_ec_board_info *board)
+{
+	return hweight_long(board->sensors);
+}
+
+static void __init setup_sensor_data(struct ec_sensors_data *ec)
+{
+	struct ec_sensor *s = ec->sensors;
+	bool bank_found;
+	int i, j;
+	u8 bank;
+
+	ec->nr_banks = 0;
+	ec->nr_registers = 0;
+
+	for (i = 1; i < SENSOR_END; i <<= 1) {
+		if ((i & ec->board->sensors) == 0)
+			continue;
+		s->info_index = __builtin_ctz(i);
+		s->cached_value = 0;
+		ec->nr_registers +=
+			known_ec_sensors[s->info_index].addr.components.size;
+		bank_found = false;
+		bank = known_ec_sensors[s->info_index].addr.components.bank;
+		for (j = 0; j < ec->nr_banks; j++) {
+			if (ec->banks[j] == bank) {
+				bank_found = true;
+				break;
+			}
+		}
+		if (!bank_found) {
+			ec->banks[ec->nr_banks++] = bank;
+		}
+		s++;
+	}
+	sort(ec->banks, ec->nr_banks, 1, &bank_compare, NULL);
+}
+
+static void __init fill_ec_registers(struct ec_sensors_data *ec)
+{
+	const struct ec_sensor_info *si;
+	unsigned int i, j, register_idx = 0;
+	for (i = 0; i < ec->nr_sensors; ++i) {
+		si = get_sensor_info(ec, i);
+		for (j = 0; j < si->addr.components.size; ++j, ++register_idx) {
+			ec->registers[register_idx] =
+				(si->addr.components.bank << 8) +
+				si->addr.components.index + j;
+		}
+	}
+}
+
+static int get_version(u32 *version)
+{
+	/* we know only a single version so far */
+	*version = 0;
+	return 0;
+}
+
+static acpi_handle asus_hw_access_mutex(struct device *dev)
+{
+	struct ec_sensors_data *state = get_sensor_data(dev);
+	acpi_handle res;
+	acpi_status status = acpi_get_handle(
+		NULL, (acpi_string)state->board->acpi_mutex_path, &res);
+	if (ACPI_FAILURE(status)) {
+		dev_err(dev, "Could not get hardware access guard mutex: error %d", status);
+		return NULL;
+	}
+	return res;
+}
+
+/*
+ * Switches ASUS EC banks.
+ */
+static int asus_ec_bank_switch(u8 bank, u8 *old)
+{
+	int status = 0;
+
+	if (old) {
+		status = ec_read(ASUS_EC_BANK_REGISTER, old);
+	}
+	if (status || (old && (*old == bank)))
+		return status;
+	return ec_write(ASUS_EC_BANK_REGISTER, bank);
+}
+
+static int asus_ec_block_read(const struct device *dev,
+			     struct ec_sensors_data *ec)
+{
+	int ireg, ibank, status;
+	u8 bank, reg_bank, prev_bank;
+
+	bank = 0;
+	status = asus_ec_bank_switch(bank, &prev_bank);
+	if (status) {
+		dev_warn(dev, "EC bank switch failed");
+		return status;
+	}
+
+	if (prev_bank) {
+		/* oops... somebody else is working with the EC too */
+		dev_warn(dev, "Concurrent access to the ACPI EC "
+			"detected.\nRace condition possible.");
+	}
+
+	/*
+	 * read registers minimizing bank switches.
+	 */
+	for (ibank = 0; ibank < ec->nr_banks; ibank++) {
+		if (bank != ec->banks[ibank]) {
+			bank = ec->banks[ibank];
+			if (asus_ec_bank_switch(bank, NULL)) {
+				dev_warn(dev, "EC bank switch to %d failed", bank);
+				break;
+			}
+		}
+		for (ireg = 0; ireg < ec->nr_registers; ireg++) {
+			reg_bank = register_bank(ec->registers[ireg]);
+			if (reg_bank < bank) {
+				continue;
+			}
+			ec_read(ec->registers[ireg] & 0x00ff, ec->read_buffer + ireg);
+		}
+	}
+
+	status = asus_ec_bank_switch(prev_bank, NULL);
+	return status;
+}
+
+static inline u32 get_sensor_value(const struct ec_sensor_info *si, u8 *data)
+{
+	switch (si->addr.components.size) {
+	case 1:
+		return *data;
+	case 2:
+		return get_unaligned_be16(data);
+	case 4:
+		return get_unaligned_be32(data);
+	default:
+		return 0;
+	}
+}
+
+static void update_sensor_values(struct ec_sensors_data *ec, u8 *data)
+{
+	const struct ec_sensor_info *si;
+	struct ec_sensor *s;
+
+	for (s = ec->sensors; s != ec->sensors + ec->nr_sensors; s++) {
+		si = &known_ec_sensors[s->info_index];
+		s->cached_value = get_sensor_value(si, data);
+		data += si->addr.components.size;
+	}
+}
+
+static int update_ec_sensors(const struct device *dev,
+			     struct ec_sensors_data *ec)
+{
+	int status;
+
+	/*
+	 * ASUS DSDT does not specify that access to the EC has to be guarded,
+	 * but firmware does access it via ACPI
+	 */
+	if (ACPI_FAILURE(acpi_acquire_mutex(ec->aml_mutex, NULL, ACPI_DELAY_MSEC_LOCK))) {
+		dev_err(dev, "Failed to acquire AML mutex");
+		status = -EBUSY;
+		goto cleanup;
+	}
+
+	status = asus_ec_block_read(dev, ec);
+
+	if (!status) {
+		update_sensor_values(ec, ec->read_buffer);
+	}
+	if (ACPI_FAILURE(acpi_release_mutex(ec->aml_mutex, NULL))) {
+		dev_err(dev, "Failed to release AML mutex");
+	}
+cleanup:
+	return status;
+}
+
+static int scale_sensor_value(u32 value, int data_type)
+{
+	switch (data_type) {
+	case hwmon_curr:
+	case hwmon_temp:
+	case hwmon_in:
+		return value * MILLI;
+	default:
+		return value;
+	}
+}
+
+static int get_cached_value_or_update(const struct device *dev,
+				      int sensor_index,
+				      struct ec_sensors_data *state, u32 *value)
+{
+	if (time_after(jiffies, state->last_updated + HZ)) {
+		if (update_ec_sensors(dev, state)) {
+			dev_err(dev, "update_ec_sensors() failure\n");
+			return -EIO;
+		}
+
+		state->last_updated = jiffies;
+	}
+
+	*value = state->sensors[sensor_index].cached_value;
+	return 0;
+}
+
+/*
+ * Now follow the functions that implement the hwmon interface
+ */
+
+static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, long *val)
+{
+	int ret;
+	u32 value = 0;
+
+	struct ec_sensors_data *state = get_sensor_data(dev);
+	int sidx = find_ec_sensor_index(state, type, channel);
+
+	if (sidx < 0) {
+		return sidx;
+	}
+
+	ret = get_cached_value_or_update(dev, sidx, state, &value);
+	if (!ret) {
+		*val = scale_sensor_value(value,
+					  get_sensor_info(state, sidx)->type);
+	}
+
+	return ret;
+}
+
+static int asus_ec_hwmon_read_string(struct device *dev,
+				      enum hwmon_sensor_types type, u32 attr,
+				      int channel, const char **str)
+{
+	struct ec_sensors_data *state = get_sensor_data(dev);
+	int sensor_index = find_ec_sensor_index(state, type, channel);
+	*str = get_sensor_info(state, sensor_index)->label;
+
+	return 0;
+}
+
+static umode_t asus_ec_hwmon_is_visible(const void *drvdata,
+					 enum hwmon_sensor_types type, u32 attr,
+					 int channel)
+{
+	const struct ec_sensors_data *state = drvdata;
+
+	return find_ec_sensor_index(state, type, channel) >= 0 ?
+			     S_IRUGO :
+			     0;
+}
+
+static int
+asus_wmi_hwmon_add_chan_info(struct hwmon_channel_info *asus_wmi_hwmon_chan,
+			     struct device *dev, int num,
+			     enum hwmon_sensor_types type, u32 config)
+{
+	int i;
+	u32 *cfg = devm_kcalloc(dev, num + 1, sizeof(*cfg), GFP_KERNEL);
+
+	if (!cfg)
+		return -ENOMEM;
+
+	asus_wmi_hwmon_chan->type = type;
+	asus_wmi_hwmon_chan->config = cfg;
+	for (i = 0; i < num; i++, cfg++)
+		*cfg = config;
+
+	return 0;
+}
+
+static const struct hwmon_ops asus_ec_hwmon_ops = {
+	.is_visible = asus_ec_hwmon_is_visible,
+	.read = asus_ec_hwmon_read,
+	.read_string = asus_ec_hwmon_read_string,
+};
+
+static struct hwmon_chip_info asus_wmi_chip_info = {
+	.ops = &asus_ec_hwmon_ops,
+	.info = NULL,
+};
+
+static const struct asus_ec_board_info * __init get_board_info(const struct device *dev)
+{
+	const struct dmi_system_id *dmi_entry;
+	u32 version = 0;
+
+	dmi_entry = dmi_first_match(asus_ec_dmi_table);
+	if (!dmi_entry) {
+		dev_info(dev, "Unsupported board");
+		return NULL;
+	}
+
+	if (get_version(&version)) {
+		dev_err(dev, "Error getting version");
+		return NULL;
+	}
+
+	return dmi_entry->driver_data;
+}
+
+static int __init configure_sensor_setup(struct platform_device *pdev)
+{
+	struct ec_sensors_data *ec_data = platform_get_drvdata(pdev);
+	int nr_count[hwmon_max] = { 0 }, nr_types = 0;
+	struct device *hwdev;
+	struct device *dev = &pdev->dev;
+	struct hwmon_channel_info *asus_wmi_hwmon_chan;
+	const struct hwmon_channel_info **ptr_asus_wmi_ci;
+	const struct hwmon_chip_info *chip_info;
+	const struct ec_sensor_info *si;
+	enum hwmon_sensor_types type;
+	unsigned int i;
+
+	ec_data->board = get_board_info(dev);
+	if (!ec_data->board) {
+		return -ENODEV;
+	}
+
+	ec_data->nr_sensors = board_sensors_count(ec_data->board);
+	ec_data->sensors = devm_kcalloc(dev, ec_data->nr_sensors,
+					sizeof(struct ec_sensor), GFP_KERNEL);
+
+	setup_sensor_data(ec_data);
+	ec_data->registers = devm_kcalloc(dev, ec_data->nr_registers,
+		sizeof(u16), GFP_KERNEL);
+	ec_data->read_buffer = devm_kcalloc(dev, ec_data->nr_registers,
+		sizeof(u8), GFP_KERNEL);
+
+	if (!ec_data->registers || !ec_data->read_buffer) {
+		return -ENOMEM;
+	}
+
+	fill_ec_registers(ec_data);
+
+	ec_data->aml_mutex = asus_hw_access_mutex(dev);
+
+	for (i = 0; i < ec_data->nr_sensors; ++i) {
+		si = get_sensor_info(ec_data, i);
+		if (!nr_count[si->type])
+			++nr_types;
+		++nr_count[si->type];
+	}
+
+	if (nr_count[hwmon_temp])
+		nr_count[hwmon_chip]++, nr_types++;
+
+	asus_wmi_hwmon_chan = devm_kcalloc(
+		dev, nr_types, sizeof(*asus_wmi_hwmon_chan), GFP_KERNEL);
+	if (!asus_wmi_hwmon_chan)
+		return -ENOMEM;
+
+	ptr_asus_wmi_ci = devm_kcalloc(dev, nr_types + 1,
+				       sizeof(*ptr_asus_wmi_ci), GFP_KERNEL);
+	if (!ptr_asus_wmi_ci)
+		return -ENOMEM;
+
+	asus_wmi_chip_info.info = ptr_asus_wmi_ci;
+	chip_info = &asus_wmi_chip_info;
+
+	for (type = 0; type < hwmon_max; ++type) {
+		if (!nr_count[type])
+			continue;
+
+		asus_wmi_hwmon_add_chan_info(asus_wmi_hwmon_chan, dev,
+					     nr_count[type], type,
+					     hwmon_attributes[type]);
+		*ptr_asus_wmi_ci++ = asus_wmi_hwmon_chan++;
+	}
+
+	dev_info(dev, "board has %d EC sensors that span %d registers",
+		 ec_data->nr_sensors,
+		 ec_data->nr_registers);
+
+	hwdev = devm_hwmon_device_register_with_info(
+		dev, "asus-ec-sensors", ec_data, chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwdev);
+}
+
+static struct platform_device *asus_ec_sensors_platform_device;
+
+static int asus_ec_probe(struct platform_device *pdev)
+{
+	struct ec_sensors_data *state = platform_get_drvdata(pdev);
+
+	if (state->board < 0) {
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static struct platform_driver asus_ec_sensors_platform_driver = {
+	.driver = {
+		.name	= "asus-ec-sensors",
+	},
+	.probe		= asus_ec_probe
+};
+
+MODULE_DEVICE_TABLE(dmi, asus_ec_dmi_table);
+
+static void cleanup_device(void)
+{
+	platform_device_unregister(asus_ec_sensors_platform_device);
+	platform_driver_unregister(&asus_ec_sensors_platform_driver);
+}
+
+static int __init asus_ec_init(void)
+{
+	struct asus_ec_sensors *state;
+	int status = 0;
+
+	asus_ec_sensors_platform_device =
+		platform_create_bundle(&asus_ec_sensors_platform_driver,
+				       asus_ec_probe, NULL, 0, NULL, 0);
+
+	if (IS_ERR(asus_ec_sensors_platform_device))
+		return PTR_ERR(asus_ec_sensors_platform_device);
+
+	state = devm_kzalloc(&asus_ec_sensors_platform_device->dev,
+			     sizeof(struct ec_sensors_data), GFP_KERNEL);
+
+	if (!state) {
+		status = -ENOMEM;
+		goto cleanup;
+	}
+
+	platform_set_drvdata(asus_ec_sensors_platform_device, state);
+	status = configure_sensor_setup(asus_ec_sensors_platform_device);
+cleanup:
+	if (status) {
+		cleanup_device();
+	}
+	return status;
+}
+
+static void __exit asus_ec_exit(void)
+{
+	cleanup_device();
+}
+
+module_init(asus_ec_init);
+module_exit(asus_ec_exit);
+
+MODULE_AUTHOR("Eugene Shalygin <eugene.shalygin@gmail.com>");
+MODULE_DESCRIPTION(
+	"HWMON driver for sensors accessible via EC in ASUS motherboards");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1");
-- 
2.34.1

