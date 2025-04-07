Return-Path: <linux-hwmon+bounces-7572-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB16A7D568
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Apr 2025 09:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4483B13B4
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Apr 2025 07:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A80122759B;
	Mon,  7 Apr 2025 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q0rnb386"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB65226D11
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Apr 2025 07:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010183; cv=none; b=G5r58a4nQ3NJW+8NmEvjoxj0W9NILU1rtqF+qlbrhpZaUG9mVFooC2m3sCVarT2xkpLIJjW0ULigRpIqlhmv66ny0E3De6777FVb6GSRigW1JTRtWYG4n0BXWzUi/Qap1SgwtmitBSB0SmU3rYme//M3zLQtX648ynd3mXYgPAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010183; c=relaxed/simple;
	bh=32dlXHJtGqqFGheIgwW6btmV4cORtIWSnUPYYhLz4PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyrZ62TpSK+WLJsS7DOOp0ylWP9Y/RMD7uPGbJIkF/xAdvCfWIyJLBOxATgnlQg8PyyPBAv10d4PUJU1HpKbui4nR5HFwHHIjafGfCZqkE4uVtYVTg9qAs93gcJrQ4uINTP+ODRbjnijdlkr+vaHaVyFsdFQD4fuMbgK/fRFFWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q0rnb386; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso43092675e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 00:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010180; x=1744614980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hx4nA1bMgq05hyAlsbHr5PwAG2LGH+ZbBF995z3c/A8=;
        b=q0rnb386Sf0jpV9GXDFf6tWB4u7sZqrWmGvBp0bJCi/szhF93K/x8SKHxfu+yWWOqo
         l+IEIxdBWFl9Xw2BInLIwvxhQVIaJIMC0KewmshLZeJbbHgYtonLX/35kl8KfI540/O7
         VHNypYHJeURvmiKuP/F2On/2G76txqcSo9rVEYbGJ08hHP69fS1ySvwXsIq+h4OJJyfi
         PDLgMR40+oXv1XL9CjBXKRrhirGp5WeEpHcIhRWbjV2ltmUI1SUM/OKY0JMZNTHrXdG6
         m6rUJQiM+qx15zGF1F/KdmdIp0nj3SreUMMl+2HMXRwjnzkTooPUfyQNWN6FRPSqS6v0
         /0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010180; x=1744614980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hx4nA1bMgq05hyAlsbHr5PwAG2LGH+ZbBF995z3c/A8=;
        b=XLnLaeoAFWYBpLsTTIc3YXqHx6FNrFdBPBQLr46KoG9nuzs2CI2faNy7arLDT53tuN
         FevapNYBgOxDqRrpbqrJvMnbKYAm60vBzb0HZE+QCkYNoU48CNnDswTuaXL95OwrDQOM
         vRreEDOv67jq0p6u3aQEGFIKuGhdtdNSP5DlLiEb21oc0Zulu0F1wEU7JewF9hKt4ZZ5
         5g8fobX7WFSjaXEOVS1A8k6/iIdlG9nIQTzz+cbhOm8cQ+L3clCpbc5ggH4L8Aq4RRZ3
         FX5t0csPHiFFzbFdKzAH0h/18vSkMzyQ7IGEJ1Pv4dRjIiPYCAMtnYzos6M1SbjKW+5o
         ItdA==
X-Gm-Message-State: AOJu0Ywz1dR4LYyYRrZbn3ZxSqHGBR4uNkuWCpe5szAtHjf6usXtghsM
	x0TqLza20/MxSHoIuCNzxym4AVi5JWdusxAHZkIweCtA53rgdjlT33KhqsKBRGE=
X-Gm-Gg: ASbGncvSuTdZSGRD4vKZZ4W9SY25P4u13HhyZM4HA43ujHKYheaoirzieTl7oBVz5po
	ikKYfoCub0O7Tzst+Wlj6V9BfWZoxoI7E2KwBRHnu/qqTXi6UI+x5te4q4/CzDsIi9jflQunfv5
	KhgDu2/QWuLmewvdq2vhgUAkdOLc+B79aiNv8UBU/9LoSfUSJQIeV9MslSWvjhsIAzgPtu7kUiK
	b22WbgyQQzMG6h4XGbKbk2djC/9GfBuiNBmxPWdtLS32wuo2yUUPEPjzdmM3jO71aXl6FCmJ/23
	rTqJaWomtW4IxrqNU1QAUGuCBpydmkg11XQjDw==
X-Google-Smtp-Source: AGHT+IG+K6JD8VjAxWXGVsZepEnuJMJMasSBoWnX7a+VRkPO5QYKYTEpchul3BwTg/0b+Dx+ijcg9Q==
X-Received: by 2002:a05:600c:3d17:b0:43d:7bfa:2739 with SMTP id 5b1f17b1804b1-43ee0768c11mr61942955e9.23.1744010179790;
        Mon, 07 Apr 2025 00:16:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm120728725e9.27.2025.04.07.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:16:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:16:16 +0200
Subject: [PATCH 1/2] hwmon: (ltc2992) Use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-hwmon-v1-1-1fa38f34dc07@linaro.org>
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2922;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1eBROXnr7JXfXh2/tO1d7PBP27CBER238F0TNPMai8A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83vBZAKSU0UpMJH/s9KZTEFI+yA8xh9Ah3zsV
 7AAFWOdZeWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7wQAKCRARpy6gFHHX
 ckKSEACRIZp+Dpdam0+5U97QLSJE9Fct3/dEZboSOFM7sO4cu5C4hcCsvGkAzsvUBMlFz1wyLRQ
 /6tbg/XrWe0oVBMj3KWvAtUp2jJXrQF9VulZ5HmRfLsFiK5ZtDsAWK8Lc9a9DuOTG4QEpJL9sjC
 lwlWjT/5GYbo+eF1CH9qv9PF0sjA0EHfzjBIdEfMOovfnUPj0kNXCfJ7u4/wUQMQ2wXrOI2YTQf
 07HDDbqdItYqCcfkOSATPtfNGW/ul2R89dz+06WwcQ7YwbT1QEMzZmtE1af6lATeiZYu6SBhDVk
 88Faf60qCF007TZhyC0pbIF3fi2KGzE56nfqVAn0DbqUhBkD4S4dW91lTJiwis4rAPolxcvOFSI
 EyrE9+OuYdJZpvcdUesULIvZ82gQe2o/O7CYLtqz4oKgYo2fjTE9bn0c6sBjD2jmsotJA1j3lgL
 iK/N0im8rVBinlO0ARjMdgjFe1QskPi72YVM4Rxc4fy1RpRa6VDFBDnUwxEIYMOw6oT5LEfPDOp
 0isAsnNHHsaspPnW1n2Tc71lxO/ub2LLahVweAtdGIZ2q7EEccJxVSHRz5x9jKvfGHK9fRXJqPE
 joMFzCLaM7rYNNtg9Ro/uz9BO78u7cPKc+aqW5oS0lgYdrx53oSq1ZxxwU6iBcpT6v1sfSI77VE
 Xs+xp5rzYF572jA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hwmon/ltc2992.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 541fa09dc6e7..a45a07ca11fe 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -256,33 +256,38 @@ static int ltc2992_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask
 	return 0;
 }
 
-static void ltc2992_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int ltc2992_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
 {
 	struct ltc2992_state *st = gpiochip_get_data(chip);
 	unsigned long gpio_ctrl;
-	int reg;
+	int reg, ret;
 
 	mutex_lock(&st->gpio_mutex);
 	reg = ltc2992_read_reg(st, ltc2992_gpio_addr_map[offset].ctrl, 1);
 	if (reg < 0) {
 		mutex_unlock(&st->gpio_mutex);
-		return;
+		return reg;
 	}
 
 	gpio_ctrl = reg;
 	assign_bit(ltc2992_gpio_addr_map[offset].ctrl_bit, &gpio_ctrl, value);
 
-	ltc2992_write_reg(st, ltc2992_gpio_addr_map[offset].ctrl, 1, gpio_ctrl);
+	ret = ltc2992_write_reg(st, ltc2992_gpio_addr_map[offset].ctrl, 1,
+				gpio_ctrl);
 	mutex_unlock(&st->gpio_mutex);
+
+	return ret;
 }
 
-static void ltc2992_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+static int ltc2992_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 				      unsigned long *bits)
 {
 	struct ltc2992_state *st = gpiochip_get_data(chip);
 	unsigned long gpio_ctrl_io = 0;
 	unsigned long gpio_ctrl = 0;
 	unsigned int gpio_nr;
+	int ret;
 
 	for_each_set_bit(gpio_nr, mask, LTC2992_GPIO_NR) {
 		if (gpio_nr < 3)
@@ -293,9 +298,14 @@ static void ltc2992_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mas
 	}
 
 	mutex_lock(&st->gpio_mutex);
-	ltc2992_write_reg(st, LTC2992_GPIO_IO_CTRL, 1, gpio_ctrl_io);
-	ltc2992_write_reg(st, LTC2992_GPIO_CTRL, 1, gpio_ctrl);
+	ret = ltc2992_write_reg(st, LTC2992_GPIO_IO_CTRL, 1, gpio_ctrl_io);
+	if (ret)
+		goto out;
+
+	ret = ltc2992_write_reg(st, LTC2992_GPIO_CTRL, 1, gpio_ctrl);
+out:
 	mutex_unlock(&st->gpio_mutex);
+	return ret;
 }
 
 static int ltc2992_config_gpio(struct ltc2992_state *st)
@@ -329,8 +339,8 @@ static int ltc2992_config_gpio(struct ltc2992_state *st)
 	st->gc.ngpio = ARRAY_SIZE(st->gpio_names);
 	st->gc.get = ltc2992_gpio_get;
 	st->gc.get_multiple = ltc2992_gpio_get_multiple;
-	st->gc.set = ltc2992_gpio_set;
-	st->gc.set_multiple = ltc2992_gpio_set_multiple;
+	st->gc.set_rv = ltc2992_gpio_set;
+	st->gc.set_multiple_rv = ltc2992_gpio_set_multiple;
 
 	ret = devm_gpiochip_add_data(&st->client->dev, &st->gc, st);
 	if (ret)

-- 
2.45.2


