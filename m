Return-Path: <linux-hwmon+bounces-2877-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA191EA43
	for <lists+linux-hwmon@lfdr.de>; Mon,  1 Jul 2024 23:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE56A1F21D97
	for <lists+linux-hwmon@lfdr.de>; Mon,  1 Jul 2024 21:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4390217622F;
	Mon,  1 Jul 2024 21:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H86NSpSK"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552817556B;
	Mon,  1 Jul 2024 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869051; cv=none; b=NxgxnUXvxyUukfpsQpO/YJ0mvB32yVAUH5m4j7/c+ZIaE8CeQitpa1zim3pXV2k39TUdb6v1bvZIHnt8xXKxHRNIZlPBSPN/efD7uJofkPV6nySKt5V5VDFy3SgaSopshicQfymzjOjNgJmN+wFqggjRq3EHbMq/qtZk+NMVR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869051; c=relaxed/simple;
	bh=HtaUQZY6PdMTzY4wNxSAu9k0222peQdQm0FUhCEWFuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nd8WrhvbQ9pAbgmrOz62eiGpWKylaJrtODCkfSRcQCnnCYWczZ/SjK3PGN7gOOBJ9Hez5f8XGJYoaePz278TRBInuRLiUzZipLJhvtVfg/UPs/pCeOZ5QcLJ5OVuSiEDmc2+QzC8YHo0YCTfoJZwsox0I6Wjn8172GGdwJBsieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H86NSpSK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6a837e9a3so14163255ad.1;
        Mon, 01 Jul 2024 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719869049; x=1720473849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOpXTWHEXnjjvx9LV4U8IMiTxHBdnBSzp3nuNfveMIA=;
        b=H86NSpSKvCzLb5nn+UHYUeQpd1MrgUocTuu4B6LVR7yKvYzmPaT2YoiLh16Neuxz/U
         04jfU1le94NWE0IdnbqQOqfutButu3G2mdlzNou0r6nTE/NtJZuIQe4u6MvbHIMP2bXj
         Ub8ROTZJUsmtd4FQdHnBhAGZ56KQD6DT+FZkLDDuPVj52t8HH70Ny660LbvH2pZ0hd+A
         5I+lCzjafd7z4wzMeYrDcekU9tBa2MFB4pswDSvC4CgKR9NErYmI+w/hyqeYx7yAwUFC
         xdS2Z+iHBLvlcz2Aq4PGILzKjugLCtHoQ/oamwFPey3j0oJ2MZq45LUjVqMKFLkromyw
         RzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719869049; x=1720473849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YOpXTWHEXnjjvx9LV4U8IMiTxHBdnBSzp3nuNfveMIA=;
        b=EDWjKBK4xOhqRhErKtjNRTNwU2d1v/tVl8HT1RaKXd0zf2PxDYI/jlAtpaiU1rqoxr
         H3pRbmHYdGY2J4mh6FcLiZ4eoZE2KCS/aeZV9UxIRIFiJe5Z0TsCvXm6U39fGGZm+Bo7
         BJeMagnt+ZJm6CbKkpZXB3tnZ8EN3P58O2pKCh4GjXbEPJZbxsiGN/ZiVPZ4iEWyaqWO
         7jvSamBABYNMnODLIkUQlvy4SD9oBtVtDOJAYrgjjr0af2cX7GOCwYifkmJ4bFtxSWCB
         GXzl/43tzXfIoPymcxGGULMjRA0scjvU1do0QMuTEembf2fzK7x/mtKAEStSxAeFUeRl
         vZCA==
X-Gm-Message-State: AOJu0YwWMJUpl2Cl4budoEXf1Ir6que99J8taQnyRAVEtHDPVMTu0/rd
	cNXKmWMVjY6OATbI7hahl3aL4hx4TZTvnJ/FWXy9SynjCEwpABUytf3lig==
X-Google-Smtp-Source: AGHT+IF5xzD0UHn0TgJqM0MM34LPR67PGpGlrjjz2021w9Z0Oiavk/7Ph5O9N/wAgW/MjT7wpPo9Ng==
X-Received: by 2002:a17:903:41cc:b0:1f5:e635:21fc with SMTP id d9443c01a7336-1fadbc746bemr28760955ad.21.1719869048632;
        Mon, 01 Jul 2024 14:24:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad4933a80sm57256755ad.289.2024.07.01.14.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 14:24:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 11/11] hwmon: (amc6821) Add support for pwm1_mode attribute
Date: Mon,  1 Jul 2024 14:23:48 -0700
Message-Id: <20240701212348.1670617-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240701212348.1670617-1-linux@roeck-us.net>
References: <20240701212348.1670617-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMC6821 supports configuring if a fan is DC or PWM controlled.
Add support for the pwm1_mode attribute to make it runtime configurable.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: New patch

 Documentation/hwmon/amc6821.rst |  1 +
 drivers/hwmon/amc6821.c         | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/amc6821.rst b/Documentation/hwmon/amc6821.rst
index 96e604c5ea8e..dbd544cd1160 100644
--- a/Documentation/hwmon/amc6821.rst
+++ b/Documentation/hwmon/amc6821.rst
@@ -58,6 +58,7 @@ pwm1_enable		rw	regulator mode, 1=open loop, 2=fan controlled
 				remote-sensor temperature,
 				4=fan controlled by target rpm set with
 				fan1_target attribute.
+pwm1_mode		rw	Fan duty control mode (0=DC, 1=PWM)
 pwm1_auto_channels_temp ro	1 if pwm_enable==2, 3 if pwm_enable==3
 pwm1_auto_point1_pwm	ro	Hardwired to 0, shared for both
 				temperature channels.
diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
index 5a3c089ae06f..98a45fe529e0 100644
--- a/drivers/hwmon/amc6821.c
+++ b/drivers/hwmon/amc6821.c
@@ -317,6 +317,12 @@ static int amc6821_pwm_read(struct device *dev, u32 attr, long *val)
 			break;
 		}
 		return 0;
+	case hwmon_pwm_mode:
+		err = regmap_read(regmap, AMC6821_REG_CONF2, &regval);
+		if (err)
+			return err;
+		*val = !!(regval & AMC6821_CONF2_TACH_MODE);
+		return 0;
 	case hwmon_pwm_auto_channels_temp:
 		err = regmap_read(regmap, AMC6821_REG_CONF1, &regval);
 		if (err)
@@ -372,6 +378,13 @@ static int amc6821_pwm_write(struct device *dev, u32 attr, long val)
 		return regmap_update_bits(regmap, AMC6821_REG_CONF1,
 					  AMC6821_CONF1_FDRC0 | AMC6821_CONF1_FDRC1,
 					  mode);
+	case hwmon_pwm_mode:
+		if (val < 0 || val > 1)
+			return -EINVAL;
+		return regmap_update_bits(regmap, AMC6821_REG_CONF1,
+					  AMC6821_CONF2_TACH_MODE,
+					  val ? AMC6821_CONF2_TACH_MODE : 0);
+		break;
 	case hwmon_pwm_input:
 		if (val < 0 || val > 255)
 			return -EINVAL;
@@ -749,6 +762,7 @@ static umode_t amc6821_is_visible(const void *data,
 		}
 	case hwmon_pwm:
 		switch (attr) {
+		case hwmon_pwm_mode:
 		case hwmon_pwm_enable:
 		case hwmon_pwm_input:
 			return 0644;
@@ -775,7 +789,7 @@ static const struct hwmon_channel_info * const amc6821_info[] = {
 			   HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX |
 			   HWMON_F_TARGET | HWMON_F_PULSES | HWMON_F_FAULT),
 	HWMON_CHANNEL_INFO(pwm,
-			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE |
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE | HWMON_PWM_MODE |
 			   HWMON_PWM_AUTO_CHANNELS_TEMP),
 	NULL
 };
-- 
2.39.2


