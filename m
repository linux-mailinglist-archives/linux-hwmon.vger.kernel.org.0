Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A79F6031A9
	for <lists+linux-hwmon@lfdr.de>; Tue, 18 Oct 2022 19:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJRRgm (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 18 Oct 2022 13:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJRRgm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Oct 2022 13:36:42 -0400
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net (p3nlsmtpcp01-04.prod.phx3.secureserver.net [184.168.200.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B658D038B
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Oct 2022 10:36:40 -0700 (PDT)
Received: from p3plcpnl1062.prod.phx3.secureserver.net ([10.199.64.97])
        by : HOSTING RELAY : with ESMTP
        id kqV8oTxSkEbMikqV8offeN; Tue, 18 Oct 2022 10:35:38 -0700
X-CMAE-Analysis: v=2.4 cv=X7yUakfe c=1 sm=1 tr=0 ts=634ee3ea
 a=5p2kn+TdgGlJEV5v7/uc8g==:117 a=E/CgoFk0eU8AT+0vghrO8A==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=gQX1269ULFhLm4Thdby34LUHVW0=:19
 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=Qawa6l4ZSaYA:10 a=sCYMkZJ_nKMA:10
 a=rC2xDT3JWftYEmI9H40A:9 a=ZXOyfd87I8AR-G90gsrY:22
X-SECURESERVER-ACCT: ahmad@khalifa.ws
Received: from [81.147.178.132] (port=53460 helo=orangina.lan)
        by p3plcpnl1062.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1okqV7-00FwYH-Qs; Tue, 18 Oct 2022 10:35:38 -0700
From:   Ahmad Khalifa <ahmad@khalifa.ws>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [RFC] hwmon: (nct6775) Add NCT6799 support through ACPI layer
Date:   Tue, 18 Oct 2022 18:34:29 +0100
Message-Id: <20221018173428.71080-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl1062.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - khalifa.ws
X-Get-Message-Sender-Via: p3plcpnl1062.prod.phx3.secureserver.net: authenticated_id: ahmad@khalifa.ws
X-Authenticated-Sender: p3plcpnl1062.prod.phx3.secureserver.net: ahmad@khalifa.ws
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfBGIE3/4rHO77EJFTMsLkV+P9hiSe+CilzO0eHfEfTPTD+ZPlTjhen/L6lyuG7eVvWnkbNyT3F/NEN2whR4Nhu1/sG4aASgJ1QzoPtRLP/39BFF61w5H
 64Waq9T1p+brRVho8D44ptjWUWx+SRwi9pyowJL4FnkvPLRp3wx/hOWzWb9nyRZjBBYSN/gjcyvkGJ+uv+ul9ct54i++AEhx1jZyJq8p+mxvuiejA4CA47Nr
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

New Asus X670 board firmware doesn't expose the WMI GUID used for the
SIO/HWM methods. The driver's GUID isn't in the ACPI tables and the
GUIDs that do exist do not expose the RSIO/WSIO and RHWM/WHWM methods
(which do exist with same IDs).


1. There are quite a few drivers out there matching on Asus boards/guids
   for various purposes, even inside hwmon/, but the NCT6775 seems to be
   the best one for that.
2. The WMI device GUIDs do not reference the right method to call the
   SIO/HWM methods, but the control method WMBD is there in the
   WMI device. It looks like WMI, but doesn't walk like WMI.
3. Access through IO will require an option to ignore ACPI conflicts as
   with other drivers since the resources are named in the ACPI tables.

The options seem to be:
A. Ignore the firmware, but add ignore_resource_conflicts
B. Proxy the calls through the ACPI method directly
C. Find a way to insert a fake WMI device. In other words, add a WMI
   driver that exposes the NCT's known GUID instead. This would still
   need 6799 support added in.

Below is a patch to demonstrate option B to add a layer to the ACPI method.
(It's not in great shape, would need more work and to be split into 2,
but for now just about showing the approach and driver's ability to
read the NCT6799)

* Replicates the *asuswmi* methods into *asusacpi* and redirects them to ACPI
* Determines WMI vs. ACPI access by matching against known board and
  loops to find the ACPI device
* Sets the access/callbacks to asusacpi
* Finally, adds the NCT6779 device support as a replica of NCT6778

Reading the device sensors is quite accurate for the first 2-3 sensors,
but further up the index, it needs more work as it's not the same map
as the 6778.


What would be the best approach to enable support for those boards?



Regards,
Ahmad

   

---
 drivers/hwmon/nct6775-core.c     |   8 +
 drivers/hwmon/nct6775-platform.c | 269 ++++++++++++++++++++++++++++---
 drivers/hwmon/nct6775.h          |   2 +-
 3 files changed, 259 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index da9ec6983e13..709a43b7c93a 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -33,6 +33,7 @@
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
  *                                           (0xd429)
+ * nct6799d    14      7       7       2+6    0xd802 0xc1    0x5ca3
  *
  * #temp lists the number of monitored temperature sources (first value) plus
  * the number of directly connectable temperature sensors (second value).
@@ -73,6 +74,7 @@ static const char * const nct6775_device_names[] = {
 	"nct6796",
 	"nct6797",
 	"nct6798",
+	"nct6799",
 };
 
 /* Common and NCT6775 specific data */
@@ -1109,6 +1111,7 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 	case nct6796:
 	case nct6797:
 	case nct6798:
+	case nct6799:
 		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
 		  (reg & 0xfff0) == 0x4c0 ||
 		  reg == 0x402 ||
@@ -1462,6 +1465,7 @@ static int nct6775_update_pwm_limits(struct device *dev)
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			err = nct6775_read_value(data, data->REG_CRITICAL_PWM_ENABLE[i], &reg);
 			if (err)
 				return err;
@@ -3109,6 +3113,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			err = nct6775_write_value(data, data->REG_CRITICAL_PWM[nr], val);
 			if (err)
 				break;
@@ -3807,6 +3812,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 	case nct6796:
 	case nct6797:
 	case nct6798:
+	case nct6799:
 		data->in_num = 15;
 		data->pwm_num = (data->kind == nct6796 ||
 				 data->kind == nct6797 ||
@@ -3855,6 +3861,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 			data->virt_temp_mask = NCT6796_VIRT_TEMP_MASK;
 			break;
 		case nct6798:
+		case nct6799:
 			data->temp_label = nct6798_temp_label;
 			data->temp_mask = NCT6798_TEMP_MASK;
 			data->virt_temp_mask = NCT6798_VIRT_TEMP_MASK;
@@ -3918,6 +3925,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
 			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
 			break;
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index b34783784213..6e44ed5eb13e 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -21,7 +21,7 @@
 
 #include "nct6775.h"
 
-enum sensor_access { access_direct, access_asuswmi };
+enum sensor_access { access_direct, access_asuswmi, access_asusacpi };
 
 static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6106D",
@@ -36,6 +36,7 @@ static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6796D",
 	"NCT6797D",
 	"NCT6798D",
+	"NCT6799D",
 };
 
 static unsigned short force_id;
@@ -86,6 +87,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6796_ID		0xd420
 #define SIO_NCT6797_ID		0xd450
 #define SIO_NCT6798_ID		0xd428
+#define SIO_NCT6799_ID		0xd800  /* 0xd802 with revision */
 #define SIO_ID_MASK		0xFFF8
 
 /*
@@ -113,6 +115,16 @@ struct nct6775_sio_data {
 #define ASUSWMI_METHODID_RHWM		0x5248574D
 #define ASUSWMI_METHODID_WHWM		0x5748574D
 #define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
+/*
+ * Newer boards have an ACPI method not exposed through any WMI GUID
+ * so we call it directly through acpi.
+ * Same METHODID values can be used as with WMI
+ */
+#define ASUSACPI_DEVICE_UID		"AsusMbSwInterface"
+#define ASUSACPI_DEVICE_HID		"PNP0C14"
+#define ASUSACPI_METHOD			"WMBD"
+
+struct acpi_device *asus_acpi_dev;
 
 static int nct6775_asuswmi_evaluate_method(u32 method_id, u8 bank, u8 reg, u8 val, u32 *retval)
 {
@@ -192,6 +204,85 @@ static void superio_wmi_exit(struct nct6775_sio_data *sio_data)
 {
 }
 
+
+static int nct6775_asusacpi_evaluate_method(u32 method_id, u8 bank, u8 reg, u8 val, u32 *retval)
+{
+#if IS_ENABLED(CONFIG_ACPI)
+	u32 args = bank | (reg << 8) | (val << 16);
+	acpi_status status;
+	unsigned long long result;
+	union acpi_object params[3];
+	struct acpi_object_list input;
+	acpi_handle handle = acpi_device_handle(asus_acpi_dev);
+
+	params[0].type = ACPI_TYPE_INTEGER;
+	params[0].integer.value = 0;
+	params[1].type = ACPI_TYPE_INTEGER;
+	params[1].integer.value = method_id;
+	params[2].type = ACPI_TYPE_BUFFER;
+	params[2].buffer.length = sizeof(args);
+	params[2].buffer.pointer = (void*)&args;
+	input.count = 3;
+	input.pointer = params;
+
+	status = acpi_evaluate_integer(handle, ASUSACPI_METHOD, &input, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (retval)
+		*retval = (u32)result & 0xFFFFFFFF;
+
+	return 0;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
+static inline int nct6775_asusacpi_write(u8 bank, u8 reg, u8 val)
+{
+	return nct6775_asusacpi_evaluate_method(ASUSWMI_METHODID_WHWM, bank,
+					      reg, val, NULL);
+}
+
+static inline int nct6775_asusacpi_read(u8 bank, u8 reg, u8 *val)
+{
+	u32 ret, tmp = 0;
+
+	ret = nct6775_asusacpi_evaluate_method(ASUSWMI_METHODID_RHWM, bank,
+					      reg, 0, &tmp);
+	*val = tmp;
+	return ret;
+}
+
+static int superio_acpi_inb(struct nct6775_sio_data *sio_data, int reg)
+{
+	int tmp = 0;
+
+	nct6775_asusacpi_evaluate_method(ASUSWMI_METHODID_RSIO, sio_data->ld,
+					reg, 0, &tmp);
+	return tmp;
+}
+
+static void superio_acpi_outb(struct nct6775_sio_data *sio_data, int reg, int val)
+{
+	nct6775_asusacpi_evaluate_method(ASUSWMI_METHODID_WSIO, sio_data->ld,
+					reg, val, NULL);
+}
+
+static void superio_acpi_select(struct nct6775_sio_data *sio_data, int ld)
+{
+	sio_data->ld = ld;
+}
+
+static int superio_acpi_enter(struct nct6775_sio_data *sio_data)
+{
+	return 0;
+}
+
+static void superio_acpi_exit(struct nct6775_sio_data *sio_data)
+{
+}
+
 static void superio_outb(struct nct6775_sio_data *sio_data, int reg, int val)
 {
 	int ioreg = sio_data->sioreg;
@@ -294,6 +385,58 @@ static int nct6775_wmi_reg_write(void *ctx, unsigned int reg, unsigned int value
 	return res;
 }
 
+static inline void nct6775_acpi_set_bank(struct nct6775_data *data, u16 reg)
+{
+	u8 bank = reg >> 8;
+
+	data->bank = bank;
+}
+
+static int nct6775_acpi_reg_read(void *ctx, unsigned int reg, unsigned int *val)
+{
+	struct nct6775_data *data = ctx;
+	int err, word_sized = nct6775_reg_is_word_sized(data, reg);
+	u8 tmp = 0;
+	u16 res;
+
+	nct6775_acpi_set_bank(data, reg);
+
+	err = nct6775_asusacpi_read(data->bank, reg & 0xff, &tmp);
+	if (err)
+		return err;
+
+	res = tmp;
+	if (word_sized) {
+		err = nct6775_asusacpi_read(data->bank, (reg & 0xff) + 1, &tmp);
+		if (err)
+			return err;
+
+		res = (res << 8) + tmp;
+	}
+	*val = res;
+	return 0;
+}
+
+static int nct6775_acpi_reg_write(void *ctx, unsigned int reg, unsigned int value)
+{
+	struct nct6775_data *data = ctx;
+	int res, word_sized = nct6775_reg_is_word_sized(data, reg);
+
+	nct6775_acpi_set_bank(data, reg);
+
+	if (word_sized) {
+		res = nct6775_asusacpi_write(data->bank, reg & 0xff, value >> 8);
+		if (res)
+			return res;
+
+		res = nct6775_asusacpi_write(data->bank, (reg & 0xff) + 1, value);
+	} else {
+		res = nct6775_asusacpi_write(data->bank, reg & 0xff, value);
+	}
+
+	return res;
+}
+
 /*
  * On older chips, only registers 0x50-0x5f are banked.
  * On more recent chips, all registers are banked.
@@ -408,7 +551,7 @@ static int nct6775_resume(struct device *dev)
 	if (data->kind == nct6791 || data->kind == nct6792 ||
 	    data->kind == nct6793 || data->kind == nct6795 ||
 	    data->kind == nct6796 || data->kind == nct6797 ||
-	    data->kind == nct6798)
+	    data->kind == nct6798 || data->kind == nct6799)
 		nct6791_enable_io_mapping(sio_data);
 
 	sio_data->sio_exit(sio_data);
@@ -555,7 +698,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 	} else {
 		/*
 		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
-		 * NCT6797D, NCT6798D
+		 * NCT6797D, NCT6798D, NCT6799D
 		 */
 		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
 		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
@@ -670,6 +813,23 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 			pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
 			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
 
+			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
+			pwm7pin |= cr2d & BIT(7);
+			pwm7pin |= creb & BIT(2);
+			break;
+		case nct6799:
+			fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
+			fan6pin |= cr2a & BIT(4);
+			fan6pin |= creb & BIT(5);
+
+			fan7pin = cr1b & BIT(5);
+			fan7pin |= !(cr2b & BIT(2));
+			fan7pin |= creb & BIT(3);
+
+			pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
+			pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
+			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
+
 			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
 			pwm7pin |= cr2d & BIT(7);
 			pwm7pin |= creb & BIT(2);
@@ -828,6 +988,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 	case nct6796:
 	case nct6797:
 	case nct6798:
+	case nct6799:
 		break;
 	}
 
@@ -866,6 +1027,7 @@ static int nct6775_platform_probe_init(struct nct6775_data *data)
 		case nct6796:
 		case nct6797:
 		case nct6798:
+		case nct6799:
 			tmp |= 0x7e;
 			break;
 		}
@@ -895,6 +1057,13 @@ static const struct regmap_config nct6775_wmi_regmap_config = {
 	.reg_write = nct6775_wmi_reg_write,
 };
 
+static const struct regmap_config nct6775_acpi_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = nct6775_acpi_reg_read,
+	.reg_write = nct6775_acpi_reg_write,
+};
+
 static int nct6775_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -919,8 +1088,12 @@ static int nct6775_platform_probe(struct platform_device *pdev)
 	if (sio_data->access == access_direct) {
 		data->addr = res->start;
 		regmapcfg = &nct6775_regmap_config;
-	} else {
+	} else if (sio_data->access == access_asuswmi) {
 		regmapcfg = &nct6775_wmi_regmap_config;
+	} else if (sio_data->access == access_asusacpi) {
+		regmapcfg = &nct6775_acpi_regmap_config;
+	} else {
+		return -ENODEV;
 	}
 
 	platform_set_drvdata(pdev, data);
@@ -995,6 +1168,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	case SIO_NCT6798_ID:
 		sio_data->kind = nct6798;
 		break;
+	case SIO_NCT6799_ID:
+		sio_data->kind = nct6799;
+		break;
 	default:
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
@@ -1023,7 +1199,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
 	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
 	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
-	    sio_data->kind == nct6798)
+	    sio_data->kind == nct6798 || sio_data->kind == nct6799)
 		nct6791_enable_io_mapping(sio_data);
 
 	sio_data->sio_exit(sio_data);
@@ -1092,6 +1268,66 @@ static const char * const asus_wmi_boards[] = {
 	"TUF GAMING Z490-PLUS (WI-FI)",
 };
 
+static const char * const asus_acpi_boards[] = {
+	"ROG STRIX X670E-I GAMING WIFI",
+};
+/*
+ * Callback for acpi_bus_for_each_dev() to find the
+ * right device by _UID and _HID and stop.
+ * return is an error to exit the loop
+ */
+static int nct6775_find_asus_acpi(struct device *dev, void *data)
+{
+	struct acpi_device *adev = to_acpi_device(dev);
+	const char *uid = acpi_device_uid(adev);
+	const char *hid = acpi_device_hid(adev);
+
+	if (uid && !strcmp(uid, ASUSACPI_DEVICE_UID) &&
+		hid && !strcmp(hid, ASUSACPI_DEVICE_HID)) {
+		asus_acpi_dev = adev;
+		return -EEXIST;
+	}
+
+	return 0;
+}
+
+static enum sensor_access nct6775_determine_access(const char *board_name)
+{
+	int ret;
+	u8 tmp;
+	enum sensor_access access = access_direct;
+
+	ret = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
+				   board_name);
+	if (ret >= 0) {
+		/* if reading chip id via WMI succeeds, use WMI */
+		if (!nct6775_asuswmi_read(0, NCT6775_PORT_CHIPID, &tmp) && tmp) {
+			pr_info("Using Asus WMI to access %#x chip.\n", tmp);
+			return access_asuswmi;
+		} else {
+			pr_err("Can't read ChipID by Asus WMI.\n");
+		}
+	}
+
+	/* not WMI, try to find the ACPI device/method */
+	ret = match_string(asus_acpi_boards, ARRAY_SIZE(asus_acpi_boards),
+			board_name);
+	if (ret >= 0) {
+		acpi_bus_for_each_dev(nct6775_find_asus_acpi, &asus_acpi_dev);
+		if (!asus_acpi_dev)
+			return access;
+		/* if reading chip id via ACPI succeeds, use ACPI */
+		if (!nct6775_asusacpi_read(0, NCT6775_PORT_CHIPID, &tmp) && tmp) {
+			pr_info("Using Asus ACPI to access %#x chip.\n", tmp);
+			return access_asusacpi;
+		} else {
+			pr_err("Can't read ChipID by Asus ACPI.\n");
+		}
+	}
+
+	return access;
+}
+
 static int __init sensors_nct6775_platform_init(void)
 {
 	int i, err;
@@ -1102,7 +1338,6 @@ static int __init sensors_nct6775_platform_init(void)
 	int sioaddr[2] = { 0x2e, 0x4e };
 	enum sensor_access access = access_direct;
 	const char *board_vendor, *board_name;
-	u8 tmp;
 
 	err = platform_driver_register(&nct6775_driver);
 	if (err)
@@ -1111,20 +1346,10 @@ static int __init sensors_nct6775_platform_init(void)
 	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
 	board_name = dmi_get_system_info(DMI_BOARD_NAME);
 
+	/* check if the board has WMI/ACPI access to the device */
 	if (board_name && board_vendor &&
-	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC.")) {
-		err = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
-				   board_name);
-		if (err >= 0) {
-			/* if reading chip id via WMI succeeds, use WMI */
-			if (!nct6775_asuswmi_read(0, NCT6775_PORT_CHIPID, &tmp) && tmp) {
-				pr_info("Using Asus WMI to access %#x chip.\n", tmp);
-				access = access_asuswmi;
-			} else {
-				pr_err("Can't read ChipID by Asus WMI.\n");
-			}
-		}
-	}
+	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC."))
+		access = nct6775_determine_access(board_name);
 
 	/*
 	 * initialize sio_data->kind and sio_data->sioreg.
@@ -1154,6 +1379,12 @@ static int __init sensors_nct6775_platform_init(void)
 			sio_data.sio_select = superio_wmi_select;
 			sio_data.sio_enter = superio_wmi_enter;
 			sio_data.sio_exit = superio_wmi_exit;
+		}else if (access == access_asusacpi) {
+			sio_data.sio_outb = superio_acpi_outb;
+			sio_data.sio_inb = superio_acpi_inb;
+			sio_data.sio_select = superio_acpi_select;
+			sio_data.sio_enter = superio_acpi_enter;
+			sio_data.sio_exit = superio_acpi_exit;
 		}
 
 		pdev[i] = platform_device_alloc(DRVNAME, address);
diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
index be41848c3cd2..44f79c5726a9 100644
--- a/drivers/hwmon/nct6775.h
+++ b/drivers/hwmon/nct6775.h
@@ -5,7 +5,7 @@
 #include <linux/types.h>
 
 enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
-	     nct6793, nct6795, nct6796, nct6797, nct6798 };
+	     nct6793, nct6795, nct6796, nct6797, nct6798, nct6799 };
 enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
 
 #define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
-- 
2.30.2

