Return-Path: <linux-hwmon+bounces-7792-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7094EA924AC
	for <lists+linux-hwmon@lfdr.de>; Thu, 17 Apr 2025 19:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BDB8A3700
	for <lists+linux-hwmon@lfdr.de>; Thu, 17 Apr 2025 17:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25E0263899;
	Thu, 17 Apr 2025 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="z3hEd+NB"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD487261596;
	Thu, 17 Apr 2025 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744912432; cv=none; b=SZkV0dOlXqB9e6bvxyTHtXkmqF/6Vto1H3354E/lmuCRFmFlUOXTQxiWAQHnfZYvRkhkBbS0tdqhPDWBchdTQmPuf/vFN4f57TMvTCcLwl3g6qpAxuc4haBjsVg9JvuFYrODKym+5XJG+JQNH4jBoPYuQ5ZkGg8PnhX90bBW10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744912432; c=relaxed/simple;
	bh=ZbJK7WSW9vrJAq1geMxJC0zIrQYeRPzUlmkFL/ZUGMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LBHiMeFg/eTv618Vk9B0Bq+Z+hB9qX0QRe8ocvMzgcBZEuhND8rgqnp4p4CWys0FZl+DL4De/egnRJ3gmGP68YBMhhJZOGzHqAmS0sicBoOE+DDFDjsWQJ8bB2JJCvh5xRjv0rLduUOBO2olYrlIp/4EUg0yWXq81sc/tRCe5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=z3hEd+NB; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id D7F882E08699;
	Thu, 17 Apr 2025 20:53:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1744912428;
	bh=8h6yzCqYcnoeJQQzxUS2gzrRRMIzjsAjfJRkwAvEXEw=; h=From:To:Subject;
	b=z3hEd+NBGVktNXufOshglVsuByfCiEx8u8v4yteQmBRklB3GFFnuYEDFKGOC6cVQT
	 kKmgG6JH/La1xhheQoeP6tE1YMY4Twa66kRd2RWtepPWZXEl7ayNJrZLrGdzDrQx4s
	 +ue9NVtdUD2AispImcJRh/PTWJoFbA4VSWEGgmD4=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
	Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
	Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>,
	Eileen <eileen@one-netbook.com>,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	linux@weissschuh.net,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	mario.limonciello@amd.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 14/15] platform/x86: oxpec: Add charge threshold and
 behaviour to OneXPlayer
Date: Thu, 17 Apr 2025 19:53:09 +0200
Message-ID: <20250417175310.3552671-15-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417175310.3552671-1-lkml@antheas.dev>
References: <20250417175310.3552671-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174491242847.25623.9412430074795185223@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

With the X1 (AMD), OneXPlayer added a charge limit and charge inhibit
feature to their devices. Charge limit allows for choosing an arbitrary
battery charge setpoint in percentages. Charge ihibit allows to instruct
the device to stop charging either when it is awake or always.

This feature was then extended for the F1Pro as well. OneXPlayer also
released BIOS updates for the X1 Mini, X1 (Intel), and F1 devices that
add support for this feature. Therefore, enable it for all F1 and
X1 devices.

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/Kconfig |   1 +
 drivers/platform/x86/oxpec.c | 155 ++++++++++++++++++++++++++++++++++-
 2 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 739740c4bb535..6c9e64a03aaef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1204,6 +1204,7 @@ config SEL3350_PLATFORM
 config OXP_EC
 	tristate "OneXPlayer EC platform control"
 	depends on ACPI_EC
+	depends on ACPI_BATTERY
 	depends on HWMON
 	depends on X86
 	help
diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index f0b9fff704de2..ce20bf70027df 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
+#include <acpi/battery.h>
 
 /* Handle ACPI lock mechanism */
 static u32 oxp_mutex;
@@ -60,6 +61,7 @@ enum oxp_board {
 };
 
 static enum oxp_board board;
+static struct device *oxp_dev;
 
 /* Fan reading and PWM */
 #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
@@ -93,6 +95,23 @@ static enum oxp_board board;
 #define OXP_X1_TURBO_LED_OFF           0x01
 #define OXP_X1_TURBO_LED_ON            0x02
 
+/* Battery extension settings */
+#define EC_CHARGE_CONTROL_BEHAVIOURS	(BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)             | \
+					 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE)    | \
+					 BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE))
+
+#define OXP_X1_CHARGE_LIMIT_REG      0xA3 /* X1 charge limit (%) */
+#define OXP_X1_CHARGE_INHIBIT_REG     0xA4 /* X1 bypass charging */
+
+#define OXP_X1_CHARGE_INHIBIT_MASK_AWAKE 0x01
+/*
+ * X1 Mask is 0x0A, OneXFly F1Pro is just 0x02
+ * but the extra bit on the X1 does nothing.
+ */
+#define OXP_X1_CHARGE_INHIBIT_MASK_OFF 0x02
+#define OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS (OXP_X1_CHARGE_INHIBIT_MASK_AWAKE | \
+	OXP_X1_CHARGE_INHIBIT_MASK_OFF)
+
 static const struct dmi_system_id dmi_table[] = {
 	{
 		.matches = {
@@ -507,6 +526,129 @@ static ssize_t tt_led_show(struct device *dev,
 
 static DEVICE_ATTR_RW(tt_led);
 
+/* Callbacks for charge behaviour attributes */
+static bool oxp_psy_ext_supported(void)
+{
+	switch (board) {
+	case oxp_x1:
+	case oxp_fly:
+		return true;
+	default:
+		break;
+	}
+	return false;
+}
+
+static int oxp_psy_ext_get_prop(struct power_supply *psy,
+				       const struct power_supply_ext *ext,
+				       void *data,
+				       enum power_supply_property psp,
+				       union power_supply_propval *val)
+{
+	long raw_val;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		ret = read_from_ec(OXP_X1_CHARGE_LIMIT_REG, 1, &raw_val);
+		if (ret)
+			return ret;
+		if (raw_val < 0 || raw_val > 100)
+			return -EINVAL;
+		val->intval = raw_val;
+		return 0;
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		ret = read_from_ec(OXP_X1_CHARGE_INHIBIT_REG, 1, &raw_val);
+		if (ret)
+			return ret;
+		if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS) ==
+		    OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
+		else if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_AWAKE) ==
+			 OXP_X1_CHARGE_INHIBIT_MASK_AWAKE)
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE;
+		else
+			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int oxp_psy_ext_set_prop(struct power_supply *psy,
+				       const struct power_supply_ext *ext,
+				       void *data,
+				       enum power_supply_property psp,
+				       const union power_supply_propval *val)
+{
+	long raw_val;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+		if (val->intval > 100)
+			return -EINVAL;
+		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		switch (val->intval) {
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+			raw_val = 0;
+			break;
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE:
+			raw_val = OXP_X1_CHARGE_INHIBIT_MASK_AWAKE;
+			break;
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
+			raw_val = OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return write_to_ec(OXP_X1_CHARGE_INHIBIT_REG, raw_val);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int oxp_psy_prop_is_writeable(struct power_supply *psy,
+					    const struct power_supply_ext *ext,
+					    void *data,
+					    enum power_supply_property psp)
+{
+	return true;
+}
+
+static const enum power_supply_property oxp_psy_ext_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+};
+
+static const struct power_supply_ext oxp_psy_ext = {
+	.name			= "oxp-charge-control",
+	.properties		= oxp_psy_ext_props,
+	.num_properties		= ARRAY_SIZE(oxp_psy_ext_props),
+	.charge_behaviours	= EC_CHARGE_CONTROL_BEHAVIOURS,
+	.get_property		= oxp_psy_ext_get_prop,
+	.set_property		= oxp_psy_ext_set_prop,
+	.property_is_writeable	= oxp_psy_prop_is_writeable,
+};
+
+static int oxp_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	return power_supply_register_extension(battery, &oxp_psy_ext, oxp_dev, NULL);
+}
+
+static int oxp_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &oxp_psy_ext);
+	return 0;
+}
+
+static struct acpi_battery_hook battery_hook = {
+	.add_battery	= oxp_add_battery,
+	.remove_battery	= oxp_remove_battery,
+	.name		= "OneXPlayer Battery",
+};
+
 /* PWM enable/disable functions */
 static int oxp_pwm_enable(void)
 {
@@ -847,11 +989,22 @@ static int oxp_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device *hwdev;
+	int ret;
 
+	oxp_dev = dev;
 	hwdev = devm_hwmon_device_register_with_info(dev, "oxp_ec", NULL,
 						     &oxp_ec_chip_info, NULL);
 
-	return PTR_ERR_OR_ZERO(hwdev);
+	if (IS_ERR(hwdev))
+		return PTR_ERR(hwdev);
+
+	if (oxp_psy_ext_supported()) {
+		ret = devm_battery_hook_register(dev, &battery_hook);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static struct platform_driver oxp_platform_driver = {
-- 
2.49.0


