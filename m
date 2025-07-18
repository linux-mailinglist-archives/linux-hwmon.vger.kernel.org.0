Return-Path: <linux-hwmon+bounces-8834-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A5B0A5ED
	for <lists+linux-hwmon@lfdr.de>; Fri, 18 Jul 2025 16:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D3F1AA2D8E
	for <lists+linux-hwmon@lfdr.de>; Fri, 18 Jul 2025 14:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370FA2D3206;
	Fri, 18 Jul 2025 14:13:06 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C8F2BD590
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Jul 2025 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752847986; cv=none; b=Pe3Fee8pWneWXctyLGgOvNMC5C6hID+P7hEIZfnqQ/U1zcvxt3wFIElKs3Pn2OHc3SEVN/3Rup2KIqa/HoqPybq5EBjX7iFVDtsPFtUL64ahY+Wf1SjsJRzdTp3+z2DzliJ38znMN1vLIlsbibj2qNHXMlH76VaJgNIrtfY7guY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752847986; c=relaxed/simple;
	bh=m8eeowTFOQ6rASGzd6J4wlcDNzQpxR4Dg/XHN9ePewg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AHldv81FUTC+02Nd5oAa5g4iDsMgZJIBRbLcpHdXir4pkvl3Dk4u26VW94x1BA1J38Y4K/losPRSrjWhAYikp2f8PgLQNMM8f0WBQSiRIrD1QIguRsFjeBIR4cHk/+Miu30TLIJu/v+oqWQ94y23eM/1/omi/QDl0HpLt9pGuQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uclpT-00065i-KS; Fri, 18 Jul 2025 16:12:51 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Fri, 18 Jul 2025 16:12:48 +0200
Subject: [PATCH v2 1/3] hwmon: ina238: Fix inconsistent whitespace
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-ina228-v2-1-227feb62f709@pengutronix.de>
References: <20250718-ina228-v2-0-227feb62f709@pengutronix.de>
In-Reply-To: <20250718-ina228-v2-0-227feb62f709@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.15-dev-19c33
X-Developer-Signature: v=1; a=openpgp-sha256; l=5075; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=m8eeowTFOQ6rASGzd6J4wlcDNzQpxR4Dg/XHN9ePewg=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYsioCkt828G4Z3Vxo9s3v2mG+ioLKnY/dp2Qs8CW3do+P
 uEGg9X6jlIWBjEOBlkxRZZYNTkFIWP/62aVdrEwc1iZQIYwcHEKwESO/GVkmFr0d5ndE4dpm9V/
 vvc3d9BYKvdx4fl82catUflHTzJdP83IsOViTOXuMlPe7k6H40vmzihdfsS6w1u3hVu1hHe1YsV
 nRgA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Some purely cosmetic changes in ina238.c:

 - When aligning definitions, do so consistently with tab stop of 8.
 - Use spaces instead of tabs around operators.
 - Align wrapped lines.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/hwmon/ina238.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 9a5fd16a4ec2..5e43bbe8817d 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -41,7 +41,7 @@
 
 #define INA238_CONFIG_ADCRANGE		BIT(4)
 #define SQ52206_CONFIG_ADCRANGE_HIGH	BIT(4)
-#define SQ52206_CONFIG_ADCRANGE_LOW		BIT(3)
+#define SQ52206_CONFIG_ADCRANGE_LOW	BIT(3)
 
 #define INA238_DIAG_ALERT_TMPOL		BIT(7)
 #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
@@ -104,7 +104,7 @@
 
 #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
 #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define INA238_DIE_TEMP_LSB			1250000 /* 125.0000 mC/lsb */
+#define INA238_DIE_TEMP_LSB		1250000 /* 125.0000 mC/lsb */
 #define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
 #define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
@@ -118,12 +118,12 @@ enum ina238_ids { ina238, ina237, sq52206 };
 
 struct ina238_config {
 	bool has_power_highest;		/* chip detection power peak */
-	bool has_energy;			/* chip detection energy */
-	u8 temp_shift;				/* fixed parameters for temp calculate */
+	bool has_energy;		/* chip detection energy */
+	u8 temp_shift;			/* fixed parameters for temp calculate */
 	u32 power_calculate_factor;	/* fixed parameters for power calculate */
-	u16 config_default;			/* Power-on default state */
+	u16 config_default;		/* Power-on default state */
 	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
-	int temp_lsb;				/* use for temperature calculate */
+	int temp_lsb;			/* use for temperature calculate */
 };
 
 struct ina238_data {
@@ -271,7 +271,7 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		if (channel == 0)
 			/* gain of 1 -> LSB / 4 */
 			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
-					data->gain / (1000 * 4);
+				data->gain / (1000 * 4);
 		else
 			*val = (regval * data->config->bus_voltage_lsb) / 1000;
 		break;
@@ -370,7 +370,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
 				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
@@ -381,7 +381,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
 				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
@@ -395,7 +395,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT * data->gain *
 				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
@@ -448,7 +448,7 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 			return err;
 		/* Signed, result in mC */
 		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
-						(s64)data->config->temp_lsb, 10000);
+			       (s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
@@ -456,7 +456,7 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 			return err;
 		/* Signed, result in mC */
 		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
-						(s64)data->config->temp_lsb, 10000);
+			       (s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -501,8 +501,8 @@ static ssize_t energy1_input_show(struct device *dev,
 		return ret;
 
 	/* result in uJ */
-	energy = div_u64(regval * INA238_FIXED_SHUNT *	data->gain * 16 * 10 *
-				data->config->power_calculate_factor, 4 * data->rshunt);
+	energy = div_u64(regval * INA238_FIXED_SHUNT * data->gain * 16 * 10 *
+			 data->config->power_calculate_factor, 4 * data->rshunt);
 
 	return sysfs_emit(buf, "%llu\n", energy);
 }

-- 
2.50.1.319.g90c0775e97


