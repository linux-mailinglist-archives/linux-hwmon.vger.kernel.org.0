Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5EE497719
	for <lists+linux-hwmon@lfdr.de>; Mon, 24 Jan 2022 02:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbiAXB5T (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 23 Jan 2022 20:57:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235569AbiAXB5T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Jan 2022 20:57:19 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABEBC06173D;
        Sun, 23 Jan 2022 17:57:18 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id s18so10756651wrv.7;
        Sun, 23 Jan 2022 17:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UA9PuS5pXZxKNWEJexbZ512qleAq68P4jIOvpMfmGEA=;
        b=I5NFzpNnNa7lLPDBSqbM0HWqvlfPZOHtTe+qVb5zyQd1+jmK22ivCXPeJRhoRUh65z
         HJj3+cYeVbOXWkaNlPIqG1+A59bNu6jJqYm14qcE//+kIy9h/a1XYYayNUOC/ruapZLw
         gGEtLR89nFn53ccS0yB70OM3VF40vN5bLCmWNRmRSyw+N0kL7ClX07BIFzFKZl/Pg24U
         xc6Sc+KGaV0DCu25Er6x+XAuhV9sABBZ23JdNTkXm9lboNme/wsRosZzfwrhOQn6CLfW
         Nck9jbstNZrPFkLOEiK5n6dq8TivdvLvk2PKPixeXsrqZuZsgcikgH7eCDMx9XBPbzCu
         Y8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UA9PuS5pXZxKNWEJexbZ512qleAq68P4jIOvpMfmGEA=;
        b=BVE0/6hMUeBJyyP+lAiqzRwqHrfvLdptsT4fizCNnbrUCnLbNqqokS0SCc37sV2Vyj
         8WXoHydkuWZQTQKtBCx/10bYn53RKoZ2yKp5RKXWw0dRNeJzhV4hWG1svglp+ZxSIsXJ
         kAwVNYui8ewNnul5NJh/UQIqcupOflAlFG8C39siVClXz71DKbY2Dqo6TMEq+w8tzoZ2
         emy0vSyxZ5ndlCzVRo/2weNy5a8bST02FFOmgVxFamzMtL7G4FU4wkHEvsjC8Eqy8uLc
         scBuMYKEsiwlIolBK38sy9++D+TiE1kbAsdvApt2WIsZR/9k8gbTke8gAGmLywqxxMBs
         WEPA==
X-Gm-Message-State: AOAM533i4d5ysEN9FcR5mav4UdlhMqMu0FC4Ateg5bv8ijIcOWPhFDLT
        mOj4OUYrOhxd9A4QG0g2UFAkcZzsWhc=
X-Google-Smtp-Source: ABdhPJyQSSokCun3imrnyNWvoD9frtEPfcujP6EPJk3hnPq/ddPbaVe29D25XJ6F8pBO+nlCKPYTjQ==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr4552253wrw.155.1642989436962;
        Sun, 23 Jan 2022 17:57:16 -0800 (PST)
Received: from tiger.museclub.art (p200300cf9f235800e668694710673d4b.dip0.t-ipconnect.de. [2003:cf:9f23:5800:e668:6947:1067:3d4b])
        by smtp.googlemail.com with ESMTPSA id i2sm3224968wmq.23.2022.01.23.17.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 17:57:16 -0800 (PST)
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
To:     eugene.shalygin@gmail.com
Cc:     andy.shevchenko@gmail.com, pauk.denis@gmail.com,
        oleksandr@natalenko.name, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [ASUS EC Sensors v8 1/3] hwmon: (asus-ec-sensors) add driver for ASUS EC
Date:   Mon, 24 Jan 2022 02:56:43 +0100
Message-Id: <20220124015658.687309-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124015658.687309-1-eugene.shalygin@gmail.com>
References: <20220124015658.687309-1-eugene.shalygin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver provides the same data as the asus_wmi_ec_sensors driver
(and gets it from the same source) but does not use WMI, polling
the ACPI EC directly.

That provides two enhancements: sensor reading became quicker (on some
systems or kernel configuration it took almost a full second to read
all the sensors, that transfers less than 15 bytes of data), the driver
became more flexible. The driver now relies on ACPI mutex to lock access
to the EC in the same way as the WMI code does.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 MAINTAINERS                     |   6 +
 drivers/hwmon/Kconfig           |  11 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/asus-ec-sensors.c | 694 ++++++++++++++++++++++++++++++++
 4 files changed, 712 insertions(+)
 create mode 100644 drivers/hwmon/asus-ec-sensors.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fddd28d3db15..845f09bc0457 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3012,6 +3012,12 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/asus_wmi_ec_sensors.c
 
+ASUS EC HARDWARE MONITOR DRIVER
+M:	Eugene Shalygin <eugene.shalygin@gmail.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/asus-ec-sensors.c
+
 ASUS WIRELESS RADIO CONTROL DRIVER
 M:	João Paulo Rechi Vita <jprvita@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 43e5245874ad..2c16b19d2c03 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2253,6 +2253,17 @@ config SENSORS_ASUS_WMI_EC
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_wmi_sensors_ec.
 
+config SENSORS_ASUS_EC
+	tristate "ASUS EC Sensors"
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
index 000000000000..7285334c7d80
--- /dev/null
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -0,0 +1,694 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * HWMON driver for ASUS motherboards that publish some sensor values
+ * via the embedded controller registers.
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
+#include <linux/bitops.h>
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
+static char *mutex_path_override;
+
+/* Writing to this EC register switches EC bank */
+#define ASUS_EC_BANK_REGISTER	0xff
+#define SENSOR_LABEL_LEN	16
+
+/*
+ * Arbitrary set max. allowed bank number. Required for sorting banks and
+ * currently is overkill with just 2 banks used at max, but for the sake
+ * of alignment let's set it to a higher value.
+ */
+#define ASUS_EC_MAX_BANK	3
+
+#define ACPI_LOCK_DELAY_MS	500
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
+#define MAKE_SENSOR_ADDRESS(size, bank, index) {                               \
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
+#define EC_SENSOR(sensor_label, sensor_type, size, bank, index) {              \
+		.label = sensor_label, .type = sensor_type,                    \
+		.addr = MAKE_SENSOR_ADDRESS(size, bank, index),                \
+	}
+
+enum ec_sensors {
+	/* chipset temperature [℃] */
+	ec_sensor_temp_chipset,
+	/* CPU temperature [℃] */
+	ec_sensor_temp_cpu,
+	/* motherboard temperature [℃] */
+	ec_sensor_temp_mb,
+	/* "T_Sensor" temperature sensor reading [℃] */
+	ec_sensor_temp_t_sensor,
+	/* VRM temperature [℃] */
+	ec_sensor_temp_vrm,
+	/* CPU_Opt fan [RPM] */
+	ec_sensor_fan_cpu_opt,
+	/* VRM heat sink fan [RPM] */
+	ec_sensor_fan_vrm_hs,
+	/* Chipset fan [RPM] */
+	ec_sensor_fan_chipset,
+	/* Water flow sensor reading [RPM] */
+	ec_sensor_fan_water_flow,
+	/* CPU current [A] */
+	ec_sensor_curr_cpu,
+	/* "Water_In" temperature sensor reading [℃] */
+	ec_sensor_temp_water_in,
+	/* "Water_Out" temperature sensor reading [℃] */
+	ec_sensor_temp_water_out,
+};
+
+#define SENSOR_TEMP_CHIPSET BIT(ec_sensor_temp_chipset)
+#define SENSOR_TEMP_CPU BIT(ec_sensor_temp_cpu)
+#define SENSOR_TEMP_MB BIT(ec_sensor_temp_mb)
+#define SENSOR_TEMP_T_SENSOR BIT(ec_sensor_temp_t_sensor)
+#define SENSOR_TEMP_VRM BIT(ec_sensor_temp_vrm)
+#define SENSOR_FAN_CPU_OPT BIT(ec_sensor_fan_cpu_opt)
+#define SENSOR_FAN_VRM_HS BIT(ec_sensor_fan_vrm_hs)
+#define SENSOR_FAN_CHIPSET BIT(ec_sensor_fan_chipset)
+#define SENSOR_FAN_WATER_FLOW BIT(ec_sensor_fan_water_flow)
+#define SENSOR_CURR_CPU BIT(ec_sensor_curr_cpu)
+#define SENSOR_TEMP_WATER_IN BIT(ec_sensor_temp_water_in)
+#define SENSOR_TEMP_WATER_OUT BIT(ec_sensor_temp_water_out)
+
+/* All the known sensors for ASUS EC controllers */
+static const struct ec_sensor_info known_ec_sensors[] = {
+	[ec_sensor_temp_chipset] =
+		EC_SENSOR("Chipset", hwmon_temp, 1, 0x00, 0x3a),
+	[ec_sensor_temp_cpu] = EC_SENSOR("CPU", hwmon_temp, 1, 0x00, 0x3b),
+	[ec_sensor_temp_mb] =
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x3c),
+	[ec_sensor_temp_t_sensor] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
+	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_fan_cpu_opt] =
+		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
+	[ec_sensor_fan_vrm_hs] = EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
+	[ec_sensor_fan_chipset] =
+		EC_SENSOR("Chipset", hwmon_fan, 2, 0x00, 0xb4),
+	[ec_sensor_fan_water_flow] =
+		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
+	[ec_sensor_curr_cpu] = EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4),
+	[ec_sensor_temp_water_in] =
+		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
+	[ec_sensor_temp_water_out] =
+		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
+};
+
+/* Shortcuts for common combinations */
+#define SENSOR_SET_TEMP_CHIPSET_CPU_MB                                         \
+	(SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB)
+#define SENSOR_SET_TEMP_WATER (SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT)
+
+#define DMI_EXACT_MATCH_BOARD(vendor, name, sensors) {                         \
+	.matches = {                                                           \
+		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor),                     \
+		DMI_EXACT_MATCH(DMI_BOARD_NAME, name),                         \
+	},                                                                     \
+	.driver_data = (void *)(sensors), \
+}
+
+static const struct dmi_system_id asus_ec_dmi_table[] __initconst = {
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "PRIME X570-PRO",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "Pro WS X570-ACE",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
+		SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII DARK HERO",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
+		SENSOR_FAN_CPU_OPT | SENSOR_FAN_WATER_FLOW | SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII FORMULA",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
+		SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG CROSSHAIR VIII HERO",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
+		SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
+		SENSOR_FAN_WATER_FLOW | SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
+			      "ROG CROSSHAIR VIII IMPACT",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX B550-E GAMING",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_CPU_OPT),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX B550-I GAMING",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_VRM_HS | SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX X570-E GAMING",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX X570-F GAMING",
+		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET),
+	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX X570-I GAMING",
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_VRM_HS |
+		SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU),
+	{}
+};
+
+struct ec_sensor {
+	unsigned int info_index;
+	u32 cached_value;
+};
+
+struct ec_sensors_data {
+	unsigned long board_sensors;
+	struct ec_sensor *sensors;
+	/* EC registers to read from */
+	u16 *registers;
+	u8 *read_buffer;
+	/* sorted list of unique register banks */
+	u8 banks[ASUS_EC_MAX_BANK + 1];
+	/* in jiffies */
+	unsigned long last_updated;
+	acpi_handle aml_mutex;
+	/* number of board EC sensors */
+	u8 nr_sensors;
+	/*
+	 * number of EC registers to read
+	 * (sensor might span more than 1 register)
+	 */
+	u8 nr_registers;
+	/* number of unique register banks */
+	u8 nr_banks;
+};
+
+static u8 register_bank(u16 reg)
+{
+	return reg >> 8;
+}
+
+static u8 register_index(u16 reg)
+{
+	return reg & 0x00ff;
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
+	for (i = 0; i < ec->nr_sensors; i++) {
+		if (get_sensor_info(ec, i)->type == type) {
+			if (channel == 0)
+				return i;
+			channel--;
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
+static int __init board_sensors_count(unsigned long sensors)
+{
+	return hweight_long(sensors);
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
+	for_each_set_bit(i, &ec->board_sensors,
+			  BITS_PER_TYPE(ec->board_sensors)) {
+		s->info_index = i;
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
+	sort(ec->banks, ec->nr_banks, 1, bank_compare, NULL);
+}
+
+static void __init fill_ec_registers(struct ec_sensors_data *ec)
+{
+	const struct ec_sensor_info *si;
+	unsigned int i, j, register_idx = 0;
+
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
+static acpi_handle __init asus_hw_access_mutex(struct device *dev)
+{
+	const char *mutex_path;
+	acpi_handle res;
+	int status;
+
+	mutex_path = mutex_path_override ?
+		mutex_path_override : ASUS_HW_ACCESS_MUTEX_ASMX;
+
+	status = acpi_get_handle(NULL, (acpi_string)mutex_path, &res);
+	if (ACPI_FAILURE(status)) {
+		dev_err(dev,
+			"Could not get hardware access guard mutex '%s': error %d",
+			mutex_path, status);
+		return NULL;
+	}
+	return res;
+}
+
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
+			      struct ec_sensors_data *ec)
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
+		dev_warn(dev,
+			"Concurrent access to the ACPI EC detected.\nRace condition possible.");
+	}
+
+	/* read registers minimizing bank switches. */
+	for (ibank = 0; ibank < ec->nr_banks; ibank++) {
+		if (bank != ec->banks[ibank]) {
+			bank = ec->banks[ibank];
+			if (asus_ec_bank_switch(bank, NULL)) {
+				dev_warn(dev, "EC bank switch to %d failed",
+					 bank);
+				break;
+			}
+		}
+		for (ireg = 0; ireg < ec->nr_registers; ireg++) {
+			reg_bank = register_bank(ec->registers[ireg]);
+			if (reg_bank < bank) {
+				continue;
+			}
+			ec_read(register_index(ec->registers[ireg]),
+				ec->read_buffer + ireg);
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
+	if (ACPI_FAILURE(acpi_acquire_mutex(ec->aml_mutex, NULL,
+					    ACPI_LOCK_DELAY_MS))) {
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
+			      u32 attr, int channel, long *val)
+{
+	int ret;
+	u32 value = 0;
+
+	struct ec_sensors_data *state = dev_get_drvdata(dev);
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
+				     enum hwmon_sensor_types type, u32 attr,
+				     int channel, const char **str)
+{
+	struct ec_sensors_data *state = dev_get_drvdata(dev);
+	int sensor_index = find_ec_sensor_index(state, type, channel);
+	*str = get_sensor_info(state, sensor_index)->label;
+
+	return 0;
+}
+
+static umode_t asus_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel)
+{
+	const struct ec_sensors_data *state = drvdata;
+
+	return find_ec_sensor_index(state, type, channel) >= 0 ? S_IRUGO : 0;
+}
+
+static int __init
+asus_ec_hwmon_add_chan_info(struct hwmon_channel_info *asus_ec_hwmon_chan,
+			     struct device *dev, int num,
+			     enum hwmon_sensor_types type, u32 config)
+{
+	int i;
+	u32 *cfg = devm_kcalloc(dev, num + 1, sizeof(*cfg), GFP_KERNEL);
+
+	if (!cfg)
+		return -ENOMEM;
+
+	asus_ec_hwmon_chan->type = type;
+	asus_ec_hwmon_chan->config = cfg;
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
+static struct hwmon_chip_info asus_ec_chip_info = {
+	.ops = &asus_ec_hwmon_ops,
+};
+
+static unsigned long __init
+get_board_sensors(const struct device *dev)
+{
+	const struct dmi_system_id *dmi_entry;
+
+	dmi_entry = dmi_first_match(asus_ec_dmi_table);
+	if (!dmi_entry) {
+		dev_info(dev, "Unsupported board");
+		return 0;
+	}
+
+	return (unsigned long)dmi_entry->driver_data;
+}
+
+static int __init configure_sensor_setup(struct device *dev)
+{
+	struct ec_sensors_data *ec_data = dev_get_drvdata(dev);
+	int nr_count[hwmon_max] = { 0 }, nr_types = 0;
+	struct device *hwdev;
+	struct hwmon_channel_info *asus_ec_hwmon_chan;
+	const struct hwmon_channel_info **ptr_asus_ec_ci;
+	const struct hwmon_chip_info *chip_info;
+	const struct ec_sensor_info *si;
+	enum hwmon_sensor_types type;
+	unsigned int i;
+
+	ec_data->board_sensors = get_board_sensors(dev);
+	if (!ec_data->board_sensors) {
+		return -ENODEV;
+	}
+
+	ec_data->nr_sensors = board_sensors_count(ec_data->board_sensors);
+	ec_data->sensors = devm_kcalloc(dev, ec_data->nr_sensors,
+					sizeof(struct ec_sensor), GFP_KERNEL);
+
+	setup_sensor_data(ec_data);
+	ec_data->registers = devm_kcalloc(dev, ec_data->nr_registers,
+					  sizeof(u16), GFP_KERNEL);
+	ec_data->read_buffer = devm_kcalloc(dev, ec_data->nr_registers,
+					    sizeof(u8), GFP_KERNEL);
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
+	asus_ec_hwmon_chan = devm_kcalloc(
+		dev, nr_types, sizeof(*asus_ec_hwmon_chan), GFP_KERNEL);
+	if (!asus_ec_hwmon_chan)
+		return -ENOMEM;
+
+	ptr_asus_ec_ci = devm_kcalloc(dev, nr_types + 1,
+				       sizeof(*ptr_asus_ec_ci), GFP_KERNEL);
+	if (!ptr_asus_ec_ci)
+		return -ENOMEM;
+
+	asus_ec_chip_info.info = ptr_asus_ec_ci;
+	chip_info = &asus_ec_chip_info;
+
+	for (type = 0; type < hwmon_max; ++type) {
+		if (!nr_count[type])
+			continue;
+
+		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
+					     nr_count[type], type,
+					     hwmon_attributes[type]);
+		*ptr_asus_ec_ci++ = asus_ec_hwmon_chan++;
+	}
+
+	dev_info(dev, "board has %d EC sensors that span %d registers",
+		 ec_data->nr_sensors, ec_data->nr_registers);
+
+	hwdev = devm_hwmon_device_register_with_info(dev, "asusec",
+						     ec_data, chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwdev);
+}
+
+static int __init asus_ec_probe(struct platform_device *pdev)
+{
+	struct asus_ec_sensors *state;
+	int status = 0;
+
+	state = devm_kzalloc(&pdev->dev, sizeof(struct ec_sensors_data),
+			     GFP_KERNEL);
+
+	if (!state) {
+		return -ENOMEM;
+	}
+
+	dev_set_drvdata(&pdev->dev, state);
+	status = configure_sensor_setup(&pdev->dev);
+	return status;
+}
+
+static const struct acpi_device_id acpi_ec_ids[] = {
+	/* Embedded Controller Device */
+	{ "PNP0C09", 0 },
+	{}
+};
+
+static struct platform_driver asus_ec_sensors_platform_driver = {
+	.driver = {
+		.name	= "asus-ec-sensors",
+		.acpi_match_table = acpi_ec_ids,
+	},
+};
+
+MODULE_DEVICE_TABLE(dmi, asus_ec_dmi_table);
+module_platform_driver_probe(asus_ec_sensors_platform_driver, asus_ec_probe);
+
+module_param_named(mutex_path, mutex_path_override, charp, 0);
+MODULE_PARM_DESC(mutex_path,
+		 "Override ACPI mutex path used to guard access to hardware");
+
+MODULE_AUTHOR("Eugene Shalygin <eugene.shalygin@gmail.com>");
+MODULE_DESCRIPTION(
+	"HWMON driver for sensors accessible via ACPI EC in ASUS motherboards");
+MODULE_LICENSE("GPL");
-- 
2.34.1

