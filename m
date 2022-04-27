Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3106D511A73
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 Apr 2022 16:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237945AbiD0Odd (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 27 Apr 2022 10:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237919AbiD0Od2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 10:33:28 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD75BBC;
        Wed, 27 Apr 2022 07:30:13 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id m62so1246737wme.5;
        Wed, 27 Apr 2022 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+cxY1sC9Dv6zRhIiTT3XVJ64E2V88sAunGH7UdlL2bk=;
        b=gaj9DM/HUZw/GnGYm0/YJhdYrghErOjzQQ3tpNa8lPgVkckXRQ0MiPJcX+g1qYoxnh
         Sh4CyiDJAlaeW95k2EIbS4ihHde8JPHIeyi51f1tExhSkoYPAh58abQN0nFtyn2CjObv
         +EL0J34mxVKnMYE9oPP/jwycvZHyOe6LFs8cAY2k5VCaNQuGTOda6SlJJcAjyT9ngfEO
         N0JDdK7kE+cDU6tH97SEfNRs0pBb5V7n5wA/LVPmwtbK4yl7B835RwqVV2aisPQKxeKu
         5EDw+caYjjM68h640nK3L9UohABDJKSyNRIirQt9kLz4cwAEkxLP2C6GtxfnXbYbyyjn
         prvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+cxY1sC9Dv6zRhIiTT3XVJ64E2V88sAunGH7UdlL2bk=;
        b=LSSuwF4/kR7jf2iijO8whe1h/41rZQ/G/sZq4FjgwMPOSCtXpf5E0e701ubsdlt0Rw
         6FgH5WjamVGAcNWJ106t9Rh4KVr8SLw4aJV0a0uCvF+KPnfmZIfjO3H+NQEvWL3kZGW+
         UPlKVCMLX6sqLrxFZDHPtQXmNnIl+SORVhh2YXLwoXB6BRHUuwcJYNSJavHb3TKtUis2
         FcLFqlmzfbqZ0wbqYZQxmtEYX08Mi1TiV3/u2JwsQcwSqcw8w7qAA0EDgjdP2fhoaW13
         i6M+AAy34V657bFpqdsI8Uc8wSRIY4AfrERYaGY0HX3EETJJbGK86BYacsdInrx1q9oH
         i35Q==
X-Gm-Message-State: AOAM530Y4lwx704E4HIKMiZHEYQrWnIeM7pB526/mU35qf34XNadpRni
        fbFZjXwm1a3A8s8Wy1rSj50JIHrc0cvBnw==
X-Google-Smtp-Source: ABdhPJzc6hg1BdAfpqbow5QUogvdoOD993+6h7kO53hvc49MHU901AC/vChnYp+5QplWzwkJWeTmEA==
X-Received: by 2002:a1c:2682:0:b0:393:fcd2:7222 with SMTP id m124-20020a1c2682000000b00393fcd27222mr5266500wmm.186.1651069811781;
        Wed, 27 Apr 2022 07:30:11 -0700 (PDT)
Received: from tiger.museclub.art (p200300cf9f393100d379c1e4199524ea.dip0.t-ipconnect.de. [2003:cf:9f39:3100:d379:c1e4:1995:24ea])
        by smtp.googlemail.com with ESMTPSA id i14-20020a1c540e000000b00393dc91e9c9sm1721625wmb.17.2022.04.27.07.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 07:30:11 -0700 (PDT)
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Eugene Shalygin <eugene.shalygin@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] hwmon: (asus-ec-sensors) introduce ec_board_info struct for board data
Date:   Wed, 27 Apr 2022 16:29:58 +0200
Message-Id: <20220427143001.1443605-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427143001.1443605-1-eugene.shalygin@gmail.com>
References: <20220427143001.1443605-1-eugene.shalygin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

We need to keep some more information about the current board than just
the sensors set, and with more boards to add the dmi id array grows
quickly. Our probe code is always the same so let's switch to a custom
test code and a custom board info array. That allows us to omit board
vendor string (ASUS uses two strings that differ in case) in the board
info and use case-insensitive comparison, and also do not duplicate
sensor definitions for such board variants as " (WI-FI)" when sensors
are identical to the base variant.

Also saves a quarter of the module size by replacing big dmi_system_id
structs with smaller ones.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 212 ++++++++++++++++++--------------
 1 file changed, 123 insertions(+), 89 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index e3d794fb0534..0c82723f85b5 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -54,8 +54,7 @@ static char *mutex_path_override;
 /* ACPI mutex for locking access to the EC for the firmware */
 #define ASUS_HW_ACCESS_MUTEX_ASMX	"\\AMW0.ASMX"
 
-/* There are two variants of the vendor spelling */
-#define VENDOR_ASUS_UPPER_CASE	"ASUSTeK COMPUTER INC."
+#define MAX_IDENTICAL_BOARD_VARIATIONS	2
 
 typedef union {
 	u32 value;
@@ -164,74 +163,94 @@ static const struct ec_sensor_info known_ec_sensors[] = {
 	(SENSOR_TEMP_CHIPSET | SENSOR_TEMP_CPU | SENSOR_TEMP_MB)
 #define SENSOR_SET_TEMP_WATER (SENSOR_TEMP_WATER_IN | SENSOR_TEMP_WATER_OUT)
 
-#define DMI_EXACT_MATCH_BOARD(vendor, name, sensors) {                         \
-	.matches = {                                                           \
-		DMI_EXACT_MATCH(DMI_BOARD_VENDOR, vendor),                     \
-		DMI_EXACT_MATCH(DMI_BOARD_NAME, name),                         \
-	},                                                                     \
-	.driver_data = (void *)(sensors), \
-}
+struct ec_board_info {
+	const char *board_names[MAX_IDENTICAL_BOARD_VARIATIONS];
+	unsigned long sensors;
+};
 
-static const struct dmi_system_id asus_ec_dmi_table[] __initconst = {
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "PRIME X570-PRO",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
-		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
-			      "ProArt X570-CREATOR WIFI",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
-		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "Pro WS X570-ACE",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
-		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
-			      "ROG CROSSHAIR VIII DARK HERO",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
-		SENSOR_FAN_CPU_OPT | SENSOR_FAN_WATER_FLOW |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
-			      "ROG CROSSHAIR VIII FORMULA",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG CROSSHAIR VIII HERO",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
-		SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
-		SENSOR_FAN_WATER_FLOW | SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
-			      "ROG CROSSHAIR VIII HERO (WI-FI)",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
-		SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
-		SENSOR_FAN_WATER_FLOW | SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
-			      "ROG CROSSHAIR VIII IMPACT",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_FAN_CHIPSET |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX B550-E GAMING",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
-		SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_FAN_CPU_OPT),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX B550-I GAMING",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
-		SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_FAN_VRM_HS |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX X570-E GAMING",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
-		SENSOR_TEMP_T_SENSOR |
-		SENSOR_TEMP_VRM | SENSOR_FAN_CHIPSET |
-		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX X570-F GAMING",
-		SENSOR_SET_TEMP_CHIPSET_CPU_MB |
-		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET),
-	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "ROG STRIX X570-I GAMING",
-		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_VRM_HS |
-		SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
+static const struct ec_board_info board_info[] = {
+	{
+		.board_names = {"PRIME X570-PRO"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
+			SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET,
+	},
+	{
+		.board_names = {"ProArt X570-CREATOR WIFI"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
+			SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT |
+			SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"Pro WS X570-ACE"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
+			SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET |
+			SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"ROG CROSSHAIR VIII DARK HERO"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR |
+			SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
+			SENSOR_FAN_CPU_OPT | SENSOR_FAN_WATER_FLOW |
+			SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"ROG CROSSHAIR VIII FORMULA"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+			SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
+			SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {
+			"ROG CROSSHAIR VIII HERO",
+			"ROG CROSSHAIR VIII HERO (WI-FI)",
+		},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR |
+			SENSOR_TEMP_VRM | SENSOR_SET_TEMP_WATER |
+			SENSOR_FAN_CPU_OPT | SENSOR_FAN_CHIPSET |
+			SENSOR_FAN_WATER_FLOW | SENSOR_CURR_CPU |
+			SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"ROG CROSSHAIR VIII IMPACT"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+			SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU |
+			SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"ROG STRIX B550-E GAMING"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+			SENSOR_FAN_CPU_OPT,
+	},
+	{
+		.board_names = {"ROG STRIX B550-I GAMING"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+			SENSOR_FAN_VRM_HS | SENSOR_CURR_CPU |
+			SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"ROG STRIX X570-E GAMING"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+			SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU |
+			SENSOR_IN_CPU_CORE,
+	},
+	{
+		.board_names = {"ROG STRIX X570-F GAMING"},
+		.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+			SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET,
+	},
+	{
+		.board_names = {"ROG STRIX X570-I GAMING"},
+		.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_FAN_VRM_HS |
+			SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU |
+			SENSOR_IN_CPU_CORE,
+	},
 	{}
 };
 
@@ -241,7 +260,7 @@ struct ec_sensor {
 };
 
 struct ec_sensors_data {
-	unsigned long board_sensors;
+	const struct ec_board_info *board_info;
 	struct ec_sensor *sensors;
 	/* EC registers to read from */
 	u16 *registers;
@@ -307,11 +326,6 @@ static int __init bank_compare(const void *a, const void *b)
 	return *((const s8 *)a) - *((const s8 *)b);
 }
 
-static int __init board_sensors_count(unsigned long sensors)
-{
-	return hweight_long(sensors);
-}
-
 static void __init setup_sensor_data(struct ec_sensors_data *ec)
 {
 	struct ec_sensor *s = ec->sensors;
@@ -322,8 +336,8 @@ static void __init setup_sensor_data(struct ec_sensors_data *ec)
 	ec->nr_banks = 0;
 	ec->nr_registers = 0;
 
-	for_each_set_bit(i, &ec->board_sensors,
-			  BITS_PER_TYPE(ec->board_sensors)) {
+	for_each_set_bit(i, &ec->board_info->sensors,
+			 BITS_PER_TYPE(ec->board_info->sensors)) {
 		s->info_index = i;
 		s->cached_value = 0;
 		ec->nr_registers +=
@@ -463,9 +477,10 @@ static inline s32 get_sensor_value(const struct ec_sensor_info *si, u8 *data)
 static void update_sensor_values(struct ec_sensors_data *ec, u8 *data)
 {
 	const struct ec_sensor_info *si;
-	struct ec_sensor *s;
+	struct ec_sensor *s, *sensor_end;
 
-	for (s = ec->sensors; s != ec->sensors + ec->nr_sensors; s++) {
+	sensor_end = ec->sensors + ec->nr_sensors;
+	for (s = ec->sensors; s != sensor_end; s++) {
 		si = &known_ec_sensors[s->info_index];
 		s->cached_value = get_sensor_value(si, data);
 		data += si->addr.components.size;
@@ -603,12 +618,24 @@ static struct hwmon_chip_info asus_ec_chip_info = {
 	.ops = &asus_ec_hwmon_ops,
 };
 
-static unsigned long __init get_board_sensors(void)
+static const struct ec_board_info * __init get_board_info(void)
 {
-	const struct dmi_system_id *dmi_entry =
-		dmi_first_match(asus_ec_dmi_table);
+	const char *dmi_board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+	const char *dmi_board_name = dmi_get_system_info(DMI_BOARD_NAME);
+	const struct ec_board_info *board;
 
-	return dmi_entry ? (unsigned long)dmi_entry->driver_data : 0;
+	if (!dmi_board_vendor || !dmi_board_name ||
+	    strcasecmp(dmi_board_vendor, "ASUSTeK COMPUTER INC."))
+		return NULL;
+
+	for (board = board_info; board->sensors; board++) {
+		if (match_string(board->board_names,
+				 MAX_IDENTICAL_BOARD_VARIATIONS,
+				 dmi_board_name) >= 0)
+			return board;
+	}
+
+	return NULL;
 }
 
 static int __init asus_ec_probe(struct platform_device *pdev)
@@ -616,17 +643,17 @@ static int __init asus_ec_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **ptr_asus_ec_ci;
 	int nr_count[hwmon_max] = { 0 }, nr_types = 0;
 	struct hwmon_channel_info *asus_ec_hwmon_chan;
+	const struct ec_board_info *pboard_info;
 	const struct hwmon_chip_info *chip_info;
 	struct device *dev = &pdev->dev;
 	struct ec_sensors_data *ec_data;
 	const struct ec_sensor_info *si;
 	enum hwmon_sensor_types type;
-	unsigned long board_sensors;
 	struct device *hwdev;
 	unsigned int i;
 
-	board_sensors = get_board_sensors();
-	if (!board_sensors)
+	pboard_info = get_board_info();
+	if (!pboard_info)
 		return -ENODEV;
 
 	ec_data = devm_kzalloc(dev, sizeof(struct ec_sensors_data),
@@ -635,8 +662,8 @@ static int __init asus_ec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, ec_data);
-	ec_data->board_sensors = board_sensors;
-	ec_data->nr_sensors = board_sensors_count(ec_data->board_sensors);
+	ec_data->board_info = pboard_info;
+	ec_data->nr_sensors = hweight_long(ec_data->board_info->sensors);
 	ec_data->sensors = devm_kcalloc(dev, ec_data->nr_sensors,
 					sizeof(struct ec_sensor), GFP_KERNEL);
 
@@ -709,7 +736,14 @@ static struct platform_driver asus_ec_sensors_platform_driver = {
 	},
 };
 
-MODULE_DEVICE_TABLE(dmi, asus_ec_dmi_table);
+MODULE_DEVICE_TABLE(acpi, acpi_ec_ids);
+/*
+ * we use module_platform_driver_probe() rather than module_platform_driver()
+ * because the probe function (and its dependants) are marked with __init, which
+ * means we can't put it into the .probe member of the platform_driver struct
+ * above, and we can't mark the asus_ec_sensors_platform_driver object as __init
+ * because the object is referenced from the module exit code.
+ */
 module_platform_driver_probe(asus_ec_sensors_platform_driver, asus_ec_probe);
 
 module_param_named(mutex_path, mutex_path_override, charp, 0);
-- 
2.35.1

