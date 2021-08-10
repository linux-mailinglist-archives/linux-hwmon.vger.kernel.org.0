Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E1E3D971E
	for <lists+linux-hwmon@lfdr.de>; Wed, 28 Jul 2021 22:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhG1Uw0 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 28 Jul 2021 16:52:26 -0400
Received: from mout.gmx.net ([212.227.17.22]:56043 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231777AbhG1UwQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 16:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627505517;
        bh=a/vCVW+VvAZpSuBflERa7BISTq4HIIC8eo99ta3kJDE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BPYBMQAJJWPtD2UE7B3RqfjFK44sqI08fEtkjJGQChMbYz9RIn6vqB+X/+l1k94Dg
         6w9iuj8n2IN2Psw6gw4uYKvaG2GW0aiePViSQW4sHQ8UC5U+VO+CelL+Zbt442u/lz
         EywSYsWi9WocKbIg2tw5yWle4ClmMTt4n8H47hcA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MvK4f-1mzA2G17RZ-00rFmA; Wed, 28 Jul 2021 22:51:57 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v6 5/6] hwmon: (dell-smm-hwmon) Convert to devm_hwmon_device_register_with_info()
Date:   Wed, 28 Jul 2021 22:51:41 +0200
Message-Id: <20210728205142.8959-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728205142.8959-1-W_Armin@gmx.de>
References: <20210728205142.8959-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0ZGzrWK6bQBJEe02/ga871IufS3s8Ixgb3xxO27tU4QhstGOBFU
 dPFROe0ZrDqT2OrepbHrMUUjUF1e/AveiUeJHosatScUNmYeV04aN5zoGOn8Yd/Hb2QUtWv
 PdAy532Z3UDr3rd295cCl96Ci/ou6pDSfj8zmb2N3gqDtesUyn3CgcPgeTDSYoxPeIMSiUP
 xkPBgZxMLs5+x8q1XH56A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aa7U10g62iY=:aTlt7QxkqkgJy3J7nlkq+U
 qVCNp6+m5vIJwDGPemkyiz4mPozi/SV+VxLmuEXwS9DNVv8obgGmRxEAVPpnuddR2QJ63nNdo
 XDqwLUNaD0onSZlbLC8yPgDKNCp0Y2WmoO7V7bcG9CJcfaoIPKzJyM7/qqamufQ7o1LYUr9u/
 9bvikucdpn1frFYXQBwhmZd9IPQQ3iX5rYnO3rwpM/CYVf+lkzkRlx03ak4160Ln0e6JvDOC2
 n3B042ZyyUnYM2X8zfykWIXdXw3gJNgKqmKtXELQasWy9BKPdUSOAuWizGf1h8JRIsp8R7jmq
 wq1vgyvC2hLu6OBFD+y7ygHQyCUL9HBXxBCRWFOzUUhtUo2FJJmCXNabEUS/+NSbiRL/Ni51k
 j90N84L0Yc3R1EX83jNpXX2YLXskpIDE0bRLOHaEWRMsnbpX9arZTcfjX3S4P1z9aGjSQBkUb
 Y2sfCqdh2S9U2EiK0/fI/4TLHMhwm6nSXFRddD4n18ZidAeayDX1JrQnH7aDIUklg7cFD5aRb
 aTTger54neTlwfQVzQz9egWAwgOvOe5rWYjcHqPAl3abo9P6U8mt3ELReWp+kO02gJodiGvlM
 hqabYM7HlLO4FAfXi03pBKsEz/FiA+0W4RlnDYi7kEfl4+TEfgQBFmG61rri0kbAJj8YMLS4c
 Lx0eEQrxnGMl/OifEsO2IiI+z+hefCfuFfWthwPNTRFzsS22T1g8Xpv+LXlqZs7zIyVOvzy2L
 BL/KjD447/IZXO149343mTiL5jH8eT8FN6G+zEpJYurXDtKg0SMYBdQTiGgwUlSFGjnYe41ef
 94o+gcx5s1FCMaat7M7AGz84mbcCZqnAgRMYuF22sS8R4TXBlhTWV5JemYN/fc2TFWlIo8mcN
 cRRyiHmnNaa9jeeextqFFFwD3nGof6csXMli6YuqVwju1zM4kyMcf8MnICPToraQ/m/PAJ8iH
 zkFyawok0QdH+4TOOdpUyGMZ6hx7dPrHupFNBZeC73LuVzUmgT4P2r24zLYBYo8Z9bfvrqtXN
 NrVanyRAQDIDdS2YCB3XsS6g5SlAy0iJ1iToHaMOjuOzj3GwNnAYbVUE6GpEuEpK9QW30ElUF
 D7PEBMD1LvRM7so5LpVhujMKfZmQvvmP989
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Convert to new registration API to get rid of attribute magic
numbers and reduce module size.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 583 +++++++++++++++------------------
 1 file changed, 273 insertions(+), 310 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 8841fc1e5872..e842901d770f 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -25,7 +25,6 @@
 #include <linux/capability.h>
 #include <linux/mutex.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
 #include <linux/sched.h>
@@ -60,11 +59,13 @@
 #define I8K_POWER_AC		0x05
 #define I8K_POWER_BATTERY	0x01

+#define DELL_SMM_NO_TEMP	10
+#define DELL_SMM_NO_FANS	3
+
 struct dell_smm_data {
 	struct mutex i8k_mutex; /* lock for sensors writes */
 	char bios_version[4];
 	char bios_machineid[16];
-	u32 i8k_hwmon_flags;
 	uint i8k_fan_mult;
 	uint i8k_pwm_mult;
 	uint i8k_fan_max;
@@ -72,23 +73,11 @@ struct dell_smm_data {
 	bool disallow_fan_support;
 	unsigned int manual_fan;
 	unsigned int auto_fan;
-	int types[3];
+	int temp_type[DELL_SMM_NO_TEMP];
+	bool fan[DELL_SMM_NO_FANS];
+	int fan_type[DELL_SMM_NO_FANS];
 };

-#define I8K_HWMON_HAVE_TEMP1	(1 << 0)
-#define I8K_HWMON_HAVE_TEMP2	(1 << 1)
-#define I8K_HWMON_HAVE_TEMP3	(1 << 2)
-#define I8K_HWMON_HAVE_TEMP4	(1 << 3)
-#define I8K_HWMON_HAVE_TEMP5	(1 << 4)
-#define I8K_HWMON_HAVE_TEMP6	(1 << 5)
-#define I8K_HWMON_HAVE_TEMP7	(1 << 6)
-#define I8K_HWMON_HAVE_TEMP8	(1 << 7)
-#define I8K_HWMON_HAVE_TEMP9	(1 << 8)
-#define I8K_HWMON_HAVE_TEMP10	(1 << 9)
-#define I8K_HWMON_HAVE_FAN1	(1 << 10)
-#define I8K_HWMON_HAVE_FAN2	(1 << 11)
-#define I8K_HWMON_HAVE_FAN3	(1 << 12)
-
 MODULE_AUTHOR("Massimo Dal Zotto (dz@debian.org)");
 MODULE_AUTHOR("Pali Roh=C3=A1r <pali@kernel.org>");
 MODULE_DESCRIPTION("Dell laptop SMM BIOS hwmon driver");
@@ -130,6 +119,33 @@ struct smm_regs {
 	unsigned int edi __packed;
 };

+static const char * const temp_labels[] =3D {
+	"CPU",
+	"GPU",
+	"SODIMM",
+	"Other",
+	"Ambient",
+	"Other",
+};
+
+static const char * const fan_labels[] =3D {
+	"Processor Fan",
+	"Motherboard Fan",
+	"Video Fan",
+	"Power Supply Fan",
+	"Chipset Fan",
+	"Other Fan",
+};
+
+static const char * const docking_labels[] =3D {
+	"Docking Processor Fan",
+	"Docking Motherboard Fan",
+	"Docking Video Fan",
+	"Docking Power Supply Fan",
+	"Docking Chipset Fan",
+	"Docking Other Fan",
+};
+
 static inline const char __init *i8k_get_dmi_data(int field)
 {
 	const char *dmi_data =3D dmi_get_system_info(field);
@@ -284,10 +300,10 @@ static int _i8k_get_fan_type(const struct dell_smm_d=
ata *data, int fan)
 static int i8k_get_fan_type(struct dell_smm_data *data, int fan)
 {
 	/* I8K_SMM_GET_FAN_TYPE SMM call is expensive, so cache values */
-	if (data->types[fan] =3D=3D INT_MIN)
-		data->types[fan] =3D _i8k_get_fan_type(data, fan);
+	if (data->fan_type[fan] =3D=3D INT_MIN)
+		data->fan_type[fan] =3D _i8k_get_fan_type(data, fan);

-	return data->types[fan];
+	return data->fan_type[fan];
 }

 /*
@@ -334,7 +350,7 @@ static int i8k_set_fan(const struct dell_smm_data *dat=
a, int fan, int speed)
 	return i8k_smm(&regs) ? : i8k_get_fan_status(data, fan);
 }

-static int i8k_get_temp_type(int sensor)
+static int __init i8k_get_temp_type(int sensor)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_TEMP_TYPE, };

@@ -634,343 +650,293 @@ static void __init i8k_init_procfs(struct device *=
dev)
  * Hwmon interface
  */

-static ssize_t i8k_hwmon_temp_label_show(struct device *dev,
-					 struct device_attribute *devattr,
-					 char *buf)
+static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor=
_types type, u32 attr,
+				   int channel)
 {
-	static const char * const labels[] =3D {
-		"CPU",
-		"GPU",
-		"SODIMM",
-		"Other",
-		"Ambient",
-		"Other",
-	};
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int type;
+	const struct dell_smm_data *data =3D drvdata;

-	type =3D i8k_get_temp_type(index);
-	if (type < 0)
-		return type;
-	if (type >=3D ARRAY_SIZE(labels))
-		type =3D ARRAY_SIZE(labels) - 1;
-	return sprintf(buf, "%s\n", labels[type]);
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+			if (data->temp_type[channel] >=3D 0)
+				return 0444;
+
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		if (data->disallow_fan_support)
+			break;
+
+		switch (attr) {
+		case hwmon_fan_input:
+			if (data->fan[channel])
+				return 0444;
+
+			break;
+		case hwmon_fan_label:
+			if (data->fan[channel] && !data->disallow_fan_type_call)
+				return 0444;
+
+			break;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		if (data->disallow_fan_support)
+			break;
+
+		switch (attr) {
+		case hwmon_pwm_input:
+			if (data->fan[channel])
+				return 0644;
+
+			break;
+		case hwmon_pwm_enable:
+			if (data->auto_fan)
+				return 0200;
+
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
 }

-static ssize_t i8k_hwmon_temp_show(struct device *dev,
-				   struct device_attribute *devattr,
-				   char *buf)
+static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type=
, u32 attr, int channel,
+			 long *val)
 {
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int temp;
+	struct dell_smm_data *data =3D dev_get_drvdata(dev);
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			ret =3D i8k_get_temp(channel);
+			if (ret < 0)
+				return ret;
+
+			*val =3D ret * 1000;
+
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			ret =3D i8k_get_fan_speed(data, channel);
+			if (ret < 0)
+				return ret;

-	temp =3D i8k_get_temp(index);
-	if (temp < 0)
-		return temp;
-	return sprintf(buf, "%d\n", temp * 1000);
+			*val =3D ret;
+
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			ret =3D i8k_get_fan_status(data, channel);
+			if (ret < 0)
+				return ret;
+
+			*val =3D clamp_val(ret * data->i8k_pwm_mult, 0, 255);
+
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
 }

-static ssize_t i8k_hwmon_fan_label_show(struct device *dev,
-					struct device_attribute *devattr,
-					char *buf)
+static const char *dell_smm_fan_label(struct dell_smm_data *data, int cha=
nnel)
 {
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	static const char * const labels[] =3D {
-		"Processor Fan",
-		"Motherboard Fan",
-		"Video Fan",
-		"Power Supply Fan",
-		"Chipset Fan",
-		"Other Fan",
-	};
-	int index =3D to_sensor_dev_attr(devattr)->index;
 	bool dock =3D false;
-	int type;
+	int type =3D i8k_get_fan_type(data, channel);

-	type =3D i8k_get_fan_type(data, index);
 	if (type < 0)
-		return type;
+		return ERR_PTR(type);

 	if (type & 0x10) {
 		dock =3D true;
 		type &=3D 0x0F;
 	}

-	if (type >=3D ARRAY_SIZE(labels))
-		type =3D (ARRAY_SIZE(labels) - 1);
+	if (type >=3D ARRAY_SIZE(fan_labels))
+		type =3D ARRAY_SIZE(fan_labels) - 1;

-	return sprintf(buf, "%s%s\n", (dock ? "Docking " : ""), labels[type]);
+	return dock ? docking_labels[type] : fan_labels[type];
 }

-static ssize_t i8k_hwmon_fan_show(struct device *dev,
-				  struct device_attribute *devattr, char *buf)
+static int dell_smm_read_string(struct device *dev, enum hwmon_sensor_typ=
es type, u32 attr,
+				int channel, const char **str)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int fan_speed;
-
-	fan_speed =3D i8k_get_fan_speed(data, index);
-	if (fan_speed < 0)
-		return fan_speed;
-	return sprintf(buf, "%d\n", fan_speed);
-}

-static ssize_t i8k_hwmon_pwm_show(struct device *dev,
-				  struct device_attribute *devattr, char *buf)
-{
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int index =3D to_sensor_dev_attr(devattr)->index;
-	int status;
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str =3D temp_labels[data->temp_type[channel]];
+			return 0;
+		default:
+			break;
+		}
+		break;
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_label:
+			*str =3D dell_smm_fan_label(data, channel);
+			return PTR_ERR_OR_ZERO(*str);
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	status =3D i8k_get_fan_status(data, index);
-	if (status < 0)
-		return -EIO;
-	return sprintf(buf, "%d\n", clamp_val(status * data->i8k_pwm_mult, 0, 25=
5));
+	return -EOPNOTSUPP;
 }

-static ssize_t i8k_hwmon_pwm_store(struct device *dev,
-				   struct device_attribute *attr,
-				   const char *buf, size_t count)
+static int dell_smm_write(struct device *dev, enum hwmon_sensor_types typ=
e, u32 attr, int channel,
+			  long val)
 {
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int index =3D to_sensor_dev_attr(attr)->index;
-	unsigned long val;
+	unsigned long pwm;
+	bool enable;
 	int err;

-	err =3D kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-	val =3D clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0, data->i=
8k_fan_max);
+	switch (type) {
+	case hwmon_pwm:
+		switch (attr) {
+		case hwmon_pwm_input:
+			pwm =3D clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0,
+					data->i8k_fan_max);

-	mutex_lock(&data->i8k_mutex);
-	err =3D i8k_set_fan(data, index, val);
-	mutex_unlock(&data->i8k_mutex);
+			mutex_lock(&data->i8k_mutex);
+			err =3D i8k_set_fan(data, channel, pwm);
+			mutex_unlock(&data->i8k_mutex);

-	return err < 0 ? -EIO : count;
-}
+			if (err < 0)
+				return err;

-static ssize_t i8k_hwmon_pwm_enable_store(struct device *dev,
-					  struct device_attribute *attr,
-					  const char *buf, size_t count)
-{
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	int err;
-	bool enable;
-	unsigned long val;
+			return 0;
+		case hwmon_pwm_enable:
+			if (!val)
+				return -EINVAL;

-	if (!data->auto_fan)
-		return -ENODEV;
+			if (val =3D=3D 1)
+				enable =3D false;
+			else
+				enable =3D true;

-	err =3D kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
+			mutex_lock(&data->i8k_mutex);
+			err =3D i8k_enable_fan_auto_mode(data, enable);
+			mutex_unlock(&data->i8k_mutex);

-	if (val =3D=3D 1)
-		enable =3D false;
-	else if (val =3D=3D 2)
-		enable =3D true;
-	else
-		return -EINVAL;
+			if (err < 0)
+				return err;

-	mutex_lock(&data->i8k_mutex);
-	err =3D i8k_enable_fan_auto_mode(data, enable);
-	mutex_unlock(&data->i8k_mutex);
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}

-	return err ? err : count;
+	return -EOPNOTSUPP;
 }

-static SENSOR_DEVICE_ATTR_RO(temp1_input, i8k_hwmon_temp, 0);
-static SENSOR_DEVICE_ATTR_RO(temp1_label, i8k_hwmon_temp_label, 0);
-static SENSOR_DEVICE_ATTR_RO(temp2_input, i8k_hwmon_temp, 1);
-static SENSOR_DEVICE_ATTR_RO(temp2_label, i8k_hwmon_temp_label, 1);
-static SENSOR_DEVICE_ATTR_RO(temp3_input, i8k_hwmon_temp, 2);
-static SENSOR_DEVICE_ATTR_RO(temp3_label, i8k_hwmon_temp_label, 2);
-static SENSOR_DEVICE_ATTR_RO(temp4_input, i8k_hwmon_temp, 3);
-static SENSOR_DEVICE_ATTR_RO(temp4_label, i8k_hwmon_temp_label, 3);
-static SENSOR_DEVICE_ATTR_RO(temp5_input, i8k_hwmon_temp, 4);
-static SENSOR_DEVICE_ATTR_RO(temp5_label, i8k_hwmon_temp_label, 4);
-static SENSOR_DEVICE_ATTR_RO(temp6_input, i8k_hwmon_temp, 5);
-static SENSOR_DEVICE_ATTR_RO(temp6_label, i8k_hwmon_temp_label, 5);
-static SENSOR_DEVICE_ATTR_RO(temp7_input, i8k_hwmon_temp, 6);
-static SENSOR_DEVICE_ATTR_RO(temp7_label, i8k_hwmon_temp_label, 6);
-static SENSOR_DEVICE_ATTR_RO(temp8_input, i8k_hwmon_temp, 7);
-static SENSOR_DEVICE_ATTR_RO(temp8_label, i8k_hwmon_temp_label, 7);
-static SENSOR_DEVICE_ATTR_RO(temp9_input, i8k_hwmon_temp, 8);
-static SENSOR_DEVICE_ATTR_RO(temp9_label, i8k_hwmon_temp_label, 8);
-static SENSOR_DEVICE_ATTR_RO(temp10_input, i8k_hwmon_temp, 9);
-static SENSOR_DEVICE_ATTR_RO(temp10_label, i8k_hwmon_temp_label, 9);
-static SENSOR_DEVICE_ATTR_RO(fan1_input, i8k_hwmon_fan, 0);
-static SENSOR_DEVICE_ATTR_RO(fan1_label, i8k_hwmon_fan_label, 0);
-static SENSOR_DEVICE_ATTR_RW(pwm1, i8k_hwmon_pwm, 0);
-static SENSOR_DEVICE_ATTR_WO(pwm1_enable, i8k_hwmon_pwm_enable, 0);
-static SENSOR_DEVICE_ATTR_RO(fan2_input, i8k_hwmon_fan, 1);
-static SENSOR_DEVICE_ATTR_RO(fan2_label, i8k_hwmon_fan_label, 1);
-static SENSOR_DEVICE_ATTR_RW(pwm2, i8k_hwmon_pwm, 1);
-static SENSOR_DEVICE_ATTR_RO(fan3_input, i8k_hwmon_fan, 2);
-static SENSOR_DEVICE_ATTR_RO(fan3_label, i8k_hwmon_fan_label, 2);
-static SENSOR_DEVICE_ATTR_RW(pwm3, i8k_hwmon_pwm, 2);
-
-static struct attribute *i8k_attrs[] =3D {
-	&sensor_dev_attr_temp1_input.dev_attr.attr,	/* 0 */
-	&sensor_dev_attr_temp1_label.dev_attr.attr,	/* 1 */
-	&sensor_dev_attr_temp2_input.dev_attr.attr,	/* 2 */
-	&sensor_dev_attr_temp2_label.dev_attr.attr,	/* 3 */
-	&sensor_dev_attr_temp3_input.dev_attr.attr,	/* 4 */
-	&sensor_dev_attr_temp3_label.dev_attr.attr,	/* 5 */
-	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 6 */
-	&sensor_dev_attr_temp4_label.dev_attr.attr,	/* 7 */
-	&sensor_dev_attr_temp5_input.dev_attr.attr,	/* 8 */
-	&sensor_dev_attr_temp5_label.dev_attr.attr,	/* 9 */
-	&sensor_dev_attr_temp6_input.dev_attr.attr,	/* 10 */
-	&sensor_dev_attr_temp6_label.dev_attr.attr,	/* 11 */
-	&sensor_dev_attr_temp7_input.dev_attr.attr,	/* 12 */
-	&sensor_dev_attr_temp7_label.dev_attr.attr,	/* 13 */
-	&sensor_dev_attr_temp8_input.dev_attr.attr,	/* 14 */
-	&sensor_dev_attr_temp8_label.dev_attr.attr,	/* 15 */
-	&sensor_dev_attr_temp9_input.dev_attr.attr,	/* 16 */
-	&sensor_dev_attr_temp9_label.dev_attr.attr,	/* 17 */
-	&sensor_dev_attr_temp10_input.dev_attr.attr,	/* 18 */
-	&sensor_dev_attr_temp10_label.dev_attr.attr,	/* 19 */
-	&sensor_dev_attr_fan1_input.dev_attr.attr,	/* 20 */
-	&sensor_dev_attr_fan1_label.dev_attr.attr,	/* 21 */
-	&sensor_dev_attr_pwm1.dev_attr.attr,		/* 22 */
-	&sensor_dev_attr_pwm1_enable.dev_attr.attr,	/* 23 */
-	&sensor_dev_attr_fan2_input.dev_attr.attr,	/* 24 */
-	&sensor_dev_attr_fan2_label.dev_attr.attr,	/* 25 */
-	&sensor_dev_attr_pwm2.dev_attr.attr,		/* 26 */
-	&sensor_dev_attr_fan3_input.dev_attr.attr,	/* 27 */
-	&sensor_dev_attr_fan3_label.dev_attr.attr,	/* 28 */
-	&sensor_dev_attr_pwm3.dev_attr.attr,		/* 29 */
+static const struct hwmon_ops dell_smm_ops =3D {
+	.is_visible =3D dell_smm_is_visible,
+	.read =3D dell_smm_read,
+	.read_string =3D dell_smm_read_string,
+	.write =3D dell_smm_write,
+};
+
+static const struct hwmon_channel_info *dell_smm_info[] =3D {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL
+			   ),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL
+			   ),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT
+			   ),
 	NULL
 };

-static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *att=
r,
-			      int index)
+static const struct hwmon_chip_info dell_smm_chip_info =3D {
+	.ops =3D &dell_smm_ops,
+	.info =3D dell_smm_info,
+};
+
+static int __init dell_smm_init_hwmon(struct device *dev)
 {
-	struct device *dev =3D kobj_to_dev(kobj);
 	struct dell_smm_data *data =3D dev_get_drvdata(dev);
+	struct device *dell_smm_hwmon_dev;
+	int i, err;

-	if (data->disallow_fan_support && index >=3D 20)
-		return 0;
-	if (data->disallow_fan_type_call &&
-	    (index =3D=3D 21 || index =3D=3D 25 || index =3D=3D 28))
-		return 0;
-	if (index >=3D 0 && index <=3D 1 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
-		return 0;
-	if (index >=3D 2 && index <=3D 3 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP2))
-		return 0;
-	if (index >=3D 4 && index <=3D 5 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP3))
-		return 0;
-	if (index >=3D 6 && index <=3D 7 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP4))
-		return 0;
-	if (index >=3D 8 && index <=3D 9 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP5))
-		return 0;
-	if (index >=3D 10 && index <=3D 11 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP6))
-		return 0;
-	if (index >=3D 12 && index <=3D 13 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP7))
-		return 0;
-	if (index >=3D 14 && index <=3D 15 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP8))
-		return 0;
-	if (index >=3D 16 && index <=3D 17 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP9))
-		return 0;
-	if (index >=3D 18 && index <=3D 19 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP10))
-		return 0;
-
-	if (index >=3D 20 && index <=3D 23 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN1))
-		return 0;
-	if (index >=3D 24 && index <=3D 26 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN2))
-		return 0;
-	if (index >=3D 27 && index <=3D 29 &&
-	    !(data->i8k_hwmon_flags & I8K_HWMON_HAVE_FAN3))
-		return 0;
-
-	if (index =3D=3D 23 && !data->auto_fan)
-		return 0;
+	for (i =3D 0; i < DELL_SMM_NO_TEMP; i++) {
+		data->temp_type[i] =3D i8k_get_temp_type(i);
+		if (data->temp_type[i] < 0)
+			continue;

-	return attr->mode;
-}
+		if (data->temp_type[i] >=3D ARRAY_SIZE(temp_labels))
+			data->temp_type[i] =3D ARRAY_SIZE(temp_labels) - 1;
+	}

-static const struct attribute_group i8k_group =3D {
-	.attrs =3D i8k_attrs,
-	.is_visible =3D i8k_is_visible,
-};
-__ATTRIBUTE_GROUPS(i8k);
+	for (i =3D 0; i < DELL_SMM_NO_FANS; i++) {
+		data->fan_type[i] =3D INT_MIN;
+		err =3D i8k_get_fan_status(data, i);
+		if (err < 0)
+			err =3D i8k_get_fan_type(data, i);
+		if (err >=3D 0)
+			data->fan[i] =3D true;
+	}

-static int __init dell_smm_init_hwmon(struct device *dev)
-{
-	struct dell_smm_data *data =3D dev_get_drvdata(dev);
-	struct device *i8k_hwmon_dev;
-	int err;
+	dell_smm_hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "dell_s=
mm", data,
+								  &dell_smm_chip_info, NULL);

-	/* CPU temperature attributes, if temperature type is OK */
-	err =3D i8k_get_temp_type(0);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP1;
-	/* check for additional temperature sensors */
-	err =3D i8k_get_temp_type(1);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP2;
-	err =3D i8k_get_temp_type(2);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP3;
-	err =3D i8k_get_temp_type(3);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP4;
-	err =3D i8k_get_temp_type(4);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP5;
-	err =3D i8k_get_temp_type(5);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP6;
-	err =3D i8k_get_temp_type(6);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP7;
-	err =3D i8k_get_temp_type(7);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP8;
-	err =3D i8k_get_temp_type(8);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP9;
-	err =3D i8k_get_temp_type(9);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_TEMP10;
-
-	/* First fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(data, 0);
-	if (err < 0)
-		err =3D i8k_get_fan_type(data, 0);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN1;
-
-	/* Second fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(data, 1);
-	if (err < 0)
-		err =3D i8k_get_fan_type(data, 1);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN2;
-
-	/* Third fan attributes, if fan status or type is OK */
-	err =3D i8k_get_fan_status(data, 2);
-	if (err < 0)
-		err =3D i8k_get_fan_type(data, 2);
-	if (err >=3D 0)
-		data->i8k_hwmon_flags |=3D I8K_HWMON_HAVE_FAN3;
-
-	i8k_hwmon_dev =3D devm_hwmon_device_register_with_groups(dev, "dell_smm"=
, data, i8k_groups);
-
-	return PTR_ERR_OR_ZERO(i8k_hwmon_dev);
+	return PTR_ERR_OR_ZERO(dell_smm_hwmon_dev);
 }

 struct i8k_config_data {
@@ -1240,9 +1206,6 @@ static int __init dell_smm_probe(struct platform_dev=
ice *pdev)
 	mutex_init(&data->i8k_mutex);
 	data->i8k_fan_mult =3D I8K_FAN_MULT;
 	data->i8k_fan_max =3D I8K_FAN_HIGH;
-	data->types[0] =3D INT_MIN;
-	data->types[1] =3D INT_MIN;
-	data->types[2] =3D INT_MIN;
 	platform_set_drvdata(pdev, data);

 	if (dmi_check_system(i8k_blacklist_fan_support_dmi_table)) {
=2D-
2.20.1

