Return-Path: <linux-hwmon+bounces-180-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 047317F57D8
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Nov 2023 06:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 275501C20BEC
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Nov 2023 05:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB85BA5E;
	Thu, 23 Nov 2023 05:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="ro/tmnjk"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6770C11F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Nov 2023 21:49:40 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1700718579; x=1700725779; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Subject: Cc: To: To: From: From:
 Sender: Sender; bh=I8wBwaBN4IEu0DBz273a5ua+d1ZYV86s0JP4ZasTt0o=;
 b=ro/tmnjkQxJ3xy3n//Hrut05lvc06FjHPNBSGzBOAmILUYbdlAlFQi8G1jPxP/wjqY/BnqkvxquzohO7LPLTrhIoUHs1EtvtTbNdkczT2qTW4uJPCs8QrVDjQtM9Cv/PUZ6bxZBTWO8pXq59wXtEpxLkbQ2CdAGsGzgtxBQX2uYctF4pULopOmb7gW20ctb9etk/12YIfuJfAy4ehMz+txwM74HifmglZgnYeOTMcjp07BThsRPBxCXDUzDWy9tAw1eY262jO9dRmq6rsu6kW8hTYT/Z+SQfFCrjv2f9nHfmnIVccG8u/FqYD8c2nsM9g6yP57VrgBVHXpPKHQmpAg==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 9691b5986cf9 with SMTP id
 655ee7f3338167855b81ccf2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Nov 2023 05:49:39 GMT
Sender: james@equiv.tech
From: James Seo <james@equiv.tech>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: James Seo <james@equiv.tech>,
	Lukasz Stelmach <l.stelmach@samsung.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC v3] hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk 800 G6
Date: Wed, 22 Nov 2023 21:49:19 -0800
Message-Id: <20231123054918.157098-1-james@equiv.tech>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EliteDesk 800 G6 stores a raw WMI string within the ACPI object in its
BIOS corresponding to one instance of HPBIOS_PlatformEvents.Name. This is
evidently a valid way of representing a WMI data item as far as the
Microsoft ACPI-WMI mapper is concerned, but is preventing the driver from
loading.

This seems quite rare, but add support for such strings. Treating this as a
quirk pretty much means adding that support anyway.

Also clean up an oversight in update_numeric_sensor_from_wobj() in which
the result of hp_wmi_strdup() was being used without error checking.

Reported-by: Lukasz Stelmach <l.stelmach@samsung.com>
Closes: https://lore.kernel.org/linux-hwmon/7850a0bd-60e7-88f8-1d6c-0bb0e3234fdc@roeck-us.net/
Tested-by: Lukasz Stelmach <l.stelmach@samsung.com>
Signed-off-by: James Seo <james@equiv.tech>
---

Changes v2->v3:
* Fix checkpatch warnings
  - Line break commit message differently (no non-whitespace changes)
  - Use "unsigned int" instead of "unsigned"
* Add Tested-by: from Lukasz Stelmach

Changes v1->v2:
* Remove DMI-based workaround logic
* Add full support for raw WMI strings
  - Improve UTF-16 validation and conversion for the general case
  - Support such strings if they occur in HPBIOS_BIOSEvent objects
* Only use the result of hp_wmi_strdup() in update_numeric_sensor_from_wobj()
  if the call succeeded

History:
v2: https://lore.kernel.org/linux-hwmon/20231105192054.24833-1-james@equiv.tech/
v1: https://lore.kernel.org/linux-hwmon/20231103181931.677796-1-james@equiv.tech/

---
drivers/hwmon/hp-wmi-sensors.c | 127 ++++++++++++++++++++++++++++-----
 1 file changed, 111 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 17ae62f88bbf..b5325d0e72b9 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -17,6 +17,8 @@
  *     Available: https://github.com/linuxhw/ACPI
  * [4] P. Rohár, "bmfdec - Decompile binary MOF file (BMF) from WMI buffer",
  *     2017. [Online]. Available: https://github.com/pali/bmfdec
+ * [5] Microsoft Corporation, "Driver-Defined WMI Data Items", 2017. [Online].
+ *     Available: https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/driver-defined-wmi-data-items
  */
 
 #include <linux/acpi.h>
@@ -24,6 +26,7 @@
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
+#include <linux/nls.h>
 #include <linux/units.h>
 #include <linux/wmi.h>
 
@@ -395,6 +398,50 @@ struct hp_wmi_sensors {
 	struct mutex lock;	/* Lock polling WMI and driver state changes. */
 };
 
+static bool is_raw_wmi_string(const u8 *pointer, u32 length)
+{
+	const u16 *ptr;
+	u16 len;
+
+	/* WMI strings are length-prefixed UTF-16 [5]. */
+	if (length <= sizeof(*ptr))
+		return false;
+
+	length -= sizeof(*ptr);
+	ptr = (const u16 *)pointer;
+	len = *ptr;
+
+	return len <= length && !(len & 1);
+}
+
+static char *convert_raw_wmi_string(const u8 *buf)
+{
+	const wchar_t *src;
+	unsigned int cps;
+	unsigned int len;
+	char *dst;
+	int i;
+
+	src = (const wchar_t *)buf;
+
+	/* Count UTF-16 code points. Exclude trailing null padding. */
+	cps = *src / sizeof(*src);
+	while (cps && !src[cps])
+		cps--;
+
+	/* Each code point becomes up to 3 UTF-8 characters. */
+	len = min(cps * 3, HP_WMI_MAX_STR_SIZE - 1);
+
+	dst = kmalloc((len + 1) * sizeof(*dst), GFP_KERNEL);
+	if (!dst)
+		return NULL;
+
+	i = utf16s_to_utf8s(++src, cps, UTF16_LITTLE_ENDIAN, dst, len);
+	dst[i] = '\0';
+
+	return dst;
+}
+
 /* hp_wmi_strdup - devm_kstrdup, but length-limited */
 static char *hp_wmi_strdup(struct device *dev, const char *src)
 {
@@ -412,6 +459,23 @@ static char *hp_wmi_strdup(struct device *dev, const char *src)
 	return dst;
 }
 
+/* hp_wmi_wstrdup - hp_wmi_strdup, but for a raw WMI string */
+static char *hp_wmi_wstrdup(struct device *dev, const u8 *buf)
+{
+	char *src;
+	char *dst;
+
+	src = convert_raw_wmi_string(buf);
+	if (!src)
+		return NULL;
+
+	dst = hp_wmi_strdup(dev, strim(src));	/* Note: Copy is trimmed. */
+
+	kfree(src);
+
+	return dst;
+}
+
 /*
  * hp_wmi_get_wobj - poll WMI for a WMI object instance
  * @guid: WMI object GUID
@@ -462,8 +526,14 @@ static int check_wobj(const union acpi_object *wobj,
 	for (prop = 0; prop <= last_prop; prop++) {
 		type = elements[prop].type;
 		valid_type = property_map[prop];
-		if (type != valid_type)
+		if (type != valid_type) {
+			if (type == ACPI_TYPE_BUFFER &&
+			    valid_type == ACPI_TYPE_STRING &&
+			    is_raw_wmi_string(elements[prop].buffer.pointer,
+					      elements[prop].buffer.length))
+				continue;
 			return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -480,7 +550,9 @@ static int extract_acpi_value(struct device *dev,
 		break;
 
 	case ACPI_TYPE_STRING:
-		*out_string = hp_wmi_strdup(dev, strim(element->string.pointer));
+		*out_string = element->type == ACPI_TYPE_BUFFER ?
+			hp_wmi_wstrdup(dev, element->buffer.pointer) :
+			hp_wmi_strdup(dev, strim(element->string.pointer));
 		if (!*out_string)
 			return -ENOMEM;
 		break;
@@ -861,7 +933,9 @@ update_numeric_sensor_from_wobj(struct device *dev,
 {
 	const union acpi_object *elements;
 	const union acpi_object *element;
-	const char *string;
+	const char *new_string;
+	char *trimmed;
+	char *string;
 	bool is_new;
 	int offset;
 	u8 size;
@@ -885,11 +959,21 @@ update_numeric_sensor_from_wobj(struct device *dev,
 	offset = is_new ? size - 1 : -2;
 
 	element = &elements[HP_WMI_PROPERTY_CURRENT_STATE + offset];
-	string = strim(element->string.pointer);
-
-	if (strcmp(string, nsensor->current_state)) {
-		devm_kfree(dev, nsensor->current_state);
-		nsensor->current_state = hp_wmi_strdup(dev, string);
+	string = element->type == ACPI_TYPE_BUFFER ?
+		convert_raw_wmi_string(element->buffer.pointer) :
+		element->string.pointer;
+
+	if (string) {
+		trimmed = strim(string);
+		if (strcmp(trimmed, nsensor->current_state)) {
+			new_string = hp_wmi_strdup(dev, trimmed);
+			if (new_string) {
+				devm_kfree(dev, nsensor->current_state);
+				nsensor->current_state = new_string;
+			}
+		}
+		if (element->type == ACPI_TYPE_BUFFER)
+			kfree(string);
 	}
 
 	/* Old variant: -2 (not -1) because it lacks the Size property. */
@@ -996,11 +1080,15 @@ static int check_event_wobj(const union acpi_object *wobj)
 			  HP_WMI_EVENT_PROPERTY_STATUS);
 }
 
-static int populate_event_from_wobj(struct hp_wmi_event *event,
+static int populate_event_from_wobj(struct device *dev,
+				    struct hp_wmi_event *event,
 				    union acpi_object *wobj)
 {
 	int prop = HP_WMI_EVENT_PROPERTY_NAME;
 	union acpi_object *element;
+	acpi_object_type type;
+	char *string;
+	u32 value;
 	int err;
 
 	err = check_event_wobj(wobj);
@@ -1009,20 +1097,24 @@ static int populate_event_from_wobj(struct hp_wmi_event *event,
 
 	element = wobj->package.elements;
 
-	/* Extracted strings are NOT device-managed copies. */
-
 	for (; prop <= HP_WMI_EVENT_PROPERTY_CATEGORY; prop++, element++) {
+		type = hp_wmi_event_property_map[prop];
+
+		err = extract_acpi_value(dev, element, type, &value, &string);
+		if (err)
+			return err;
+
 		switch (prop) {
 		case HP_WMI_EVENT_PROPERTY_NAME:
-			event->name = strim(element->string.pointer);
+			event->name = string;
 			break;
 
 		case HP_WMI_EVENT_PROPERTY_DESCRIPTION:
-			event->description = strim(element->string.pointer);
+			event->description = string;
 			break;
 
 		case HP_WMI_EVENT_PROPERTY_CATEGORY:
-			event->category = element->integer.value;
+			event->category = value;
 			break;
 
 		default:
@@ -1511,8 +1603,8 @@ static void hp_wmi_notify(u32 value, void *context)
 	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct hp_wmi_sensors *state = context;
 	struct device *dev = &state->wdev->dev;
+	struct hp_wmi_event event = {};
 	struct hp_wmi_info *fan_info;
-	struct hp_wmi_event event;
 	union acpi_object *wobj;
 	acpi_status err;
 	int event_type;
@@ -1546,7 +1638,7 @@ static void hp_wmi_notify(u32 value, void *context)
 
 	wobj = out.pointer;
 
-	err = populate_event_from_wobj(&event, wobj);
+	err = populate_event_from_wobj(dev, &event, wobj);
 	if (err) {
 		dev_warn(dev, "Bad event data (ACPI type %d)\n", wobj->type);
 		goto out_free_wobj;
@@ -1577,6 +1669,9 @@ static void hp_wmi_notify(u32 value, void *context)
 out_free_wobj:
 	kfree(wobj);
 
+	devm_kfree(dev, event.name);
+	devm_kfree(dev, event.description);
+
 out_unlock:
 	mutex_unlock(&state->lock);
 }

base-commit: c03cd01890c5e41138cc5709e37859bc917aab5d
-- 
2.40.1


