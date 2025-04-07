Return-Path: <linux-hwmon+bounces-7573-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4356A7D56F
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Apr 2025 09:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E433F3B7471
	for <lists+linux-hwmon@lfdr.de>; Mon,  7 Apr 2025 07:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A2222A80A;
	Mon,  7 Apr 2025 07:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZVBPpOKU"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B985226D16
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Apr 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010185; cv=none; b=M1BSkVtysMqUw9S6mEWnmbTk+f49v4sdBL8r4pdA5DAsfC73ZKaQNJ5GU8Ie/6eQNEEWT9DulXA+nWxo2eJ1rj0C5SXkOHECJb9FnvT3nPdJFYFM1hgsBEvEZHAiyRPGPoo5TQlz6X5RUeWK8d+M9rPJpLZ49I9OvW21dQSRXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010185; c=relaxed/simple;
	bh=+lVN69TWmBJGkcCx4RTC68T2V1dx9edleF2Xorkmk58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sDCrjIQNk+vjgovXSvqrkod5E/+HomjnQPxYR3nLdk5Lf4v8jnpgyt42CU+4HDOOyhTsd0HMrA62dmEWEXG7xC7KpkEAZx1GSttL92Q6aznfUVrh+pZb6HT+3GtwXk611bJ5Q6dp51u4lkFj4+Bm4PsFKtY3H6oCHCbuE2NaT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZVBPpOKU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so39780755e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010180; x=1744614980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzYz0IrNb1aiDrsSJo07WBOcsPBauEosyVEV2lACwJU=;
        b=ZVBPpOKUwPdzc4MAAf3QhRUVFiMWxaB0/J0WfxlJ1909UJsRm57kr2buVus+B9rRXE
         +FOPMsko1J2V0FJv9w/7GjbArzfQvyjdonqT22iMXLxVzvfn3IddfV5iFyzTjuj5V1q0
         upXBo0GG42yqYfeSd4LESsxjYTE/hbTHykq6MI6EvXaJ6tf10W7SHxrMlgZ37rbAV1o/
         gQFGawWxBnXwE0A0cgT2IXuto+GQ1CK5sEpPz/b9AH2d+grn96xHb0pnpRPkFoxiwSnm
         QPmgh5UK8GhLhcbNk8CSEyeWMjv4auKtCDknkxZAL9u2+pLuU8oSt0UKnj8HOG878Onb
         +/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010180; x=1744614980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzYz0IrNb1aiDrsSJo07WBOcsPBauEosyVEV2lACwJU=;
        b=lR0dutAi0ANcrB8xhl0hLJMro/+RqAwQMhpGboWnDRBJXefJf7QkoqD+7CtMOXPXgF
         HfgyWE4W3hD+NYlwWMmR/Y5HjJrTtUUt2FbDadTykbdY3klfgAh8gtZK2AXuWgagFDlq
         WLP3TtC1AX/4qSqWNnH3KDbJOFcMfSPYQVq9yl4GXqR1jY/36MZfLY/U46ne9vYQ24Mp
         eMUayK0bqbo7+YVZPdNl/B/McW+CegoGMqyQYw26MfXNBnQx02rdETBzw+X7QujF6PlK
         lSHZyffyiZ+JeTACK0CS192E1hcxWe4nUKUslxJ8g1rtTWMCFrW+1ViQKwELal7JWoQb
         Cd7w==
X-Gm-Message-State: AOJu0YzQMu42/t+7zw65O7/wNfNRerbnnOQz/7ns4WpiQCbBlUfcU7E2
	AQZXCe8FkWxVC7nymwEL9VbqWznsjRjimeeZybWI5ZESESsYssylQ4B4dNxXLBSd4XCDZBR7pec
	Ix14=
X-Gm-Gg: ASbGncuLv+hEdCH3ma/o1Gfy3xHsl4aHPQ6bo8QXEWU/8REHqZLVnFB9VFQqoReweOb
	8v5hhU5mQb2dyO0zfZv5Qk806uKFnJ+dR+BUG+UPa5rJzOBAPfJQL3wTC5sonCGd04r5JmSm/y/
	9frhHus2F6YKp7RqBfNifTV9Pe++/7xTwSbeVTwOX5J7njnE0s5NZuPEDwouBYyvPpR3dj6PDbb
	xk1qvjn7L9mKOx81RI+w0kXJEK+zFZGkTYtXcFhbzHB5hisZ21I9OkAdDXdJwr26K7RxfwnM3aZ
	XKzW2TTz8Sohifw+RxPonlcCs+d2yWIxYHjm/w==
X-Google-Smtp-Source: AGHT+IE8TYDZRnZ10si9IEbVCRrw3jYRuGhAUnbXwYdDSJ2w1xK6P2L+5C7YzmeuYk3QEjBUh3buGw==
X-Received: by 2002:a05:600c:45cc:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43ecfa19d6bmr74584255e9.33.1744010180653;
        Mon, 07 Apr 2025 00:16:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm120728725e9.27.2025.04.07.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:16:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:16:17 +0200
Subject: [PATCH 2/2] hwmon: (pmbus/ucd9000) Use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-hwmon-v1-2-1fa38f34dc07@linaro.org>
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lT9LPgVcdHog5NKMsZeYq1JZn6VFGMZndrir3r18U4Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83vCqvelR6492PjchFZZRoSHlU+ZhyIQkbCAi
 C73EkHOFW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7wgAKCRARpy6gFHHX
 cng3EADUg97oz9I2TXygVlGc1U9x9LK/8rlGl/jqTG6LheeWfX7J3EEzlWFXZfpPqbkFkmfV8wU
 DbVpr7KLtP7c5csddJS9nXfNEsVgUQyyGXda1Ebl9mwp52cW30ksqbggYSGDdGEB0HGqUmfxYk3
 m823XzZgo6I0cGW4Nu0mXGQYa7zYEzqBwUxUnlwD5AuertOLIvY9QX/tyEqgZFBaDYH7pS1NCFv
 QScrGVh9EfQVw1UQja2OAV4mNaS2T+Imv5tJHhVfnQMjME5Fry6rLPluck1n5HTSYQwzbxq1gvZ
 1bucSP8YkAA80DsXfuO3sLdbyuoNfrT1AGF+ctPMNpOatseRBEv53H9yV+HMDIq5Bx33LRTarPq
 WmQxc2i7IUTZF3b2S0TJxXwR91G11XLC/gBcUOD/48oTnvxQ6K/lc+Bcuj5k69ZxD24rGK390bz
 y3xtMwrdnf2IcXj8sU61NuCyqYaprm+LS1fI9l1Tk71h2n3eaLxjOaNb8iMdrVF98xSzMAIgoRN
 REEmYF4Ja5Ul78RibwlXRKJCk6OM0HfgeGiWd3vpnw2doQOrHLkpgIQmduQf8NiNw6Drdk8m2Ys
 g8lWedA8sSZgR1RxfrQdwXiTVvmxIviO4hGS2zNa3eh3GYgDiy1zPpXSAWpwN/HOC5jIc7YJKA7
 brtDUlwn9DxuD5Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hwmon/pmbus/ucd9000.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 9b0eadc81a2e..2bc8cccb01fd 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -212,8 +212,8 @@ static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
 }
 
-static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			     int value)
+static int ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct i2c_client *client = gpiochip_get_data(gc);
 	int ret;
@@ -222,17 +222,17 @@ static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	if (ret < 0) {
 		dev_dbg(&client->dev, "failed to read GPIO %d config: %d\n",
 			offset, ret);
-		return;
+		return ret;
 	}
 
 	if (value) {
 		if (ret & UCD9000_GPIO_CONFIG_STATUS)
-			return;
+			return 0;
 
 		ret |= UCD9000_GPIO_CONFIG_STATUS;
 	} else {
 		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
-			return;
+			return 0;
 
 		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
 	}
@@ -244,7 +244,7 @@ static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	if (ret < 0) {
 		dev_dbg(&client->dev, "Failed to write GPIO %d config: %d\n",
 			offset, ret);
-		return;
+		return ret;
 	}
 
 	ret &= ~UCD9000_GPIO_CONFIG_ENABLE;
@@ -253,6 +253,8 @@ static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	if (ret < 0)
 		dev_dbg(&client->dev, "Failed to write GPIO %d config: %d\n",
 			offset, ret);
+
+	return ret;
 }
 
 static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
@@ -362,7 +364,7 @@ static void ucd9000_probe_gpio(struct i2c_client *client,
 	data->gpio.direction_input = ucd9000_gpio_direction_input;
 	data->gpio.direction_output = ucd9000_gpio_direction_output;
 	data->gpio.get = ucd9000_gpio_get;
-	data->gpio.set = ucd9000_gpio_set;
+	data->gpio.set_rv = ucd9000_gpio_set;
 	data->gpio.can_sleep = true;
 	data->gpio.base = -1;
 	data->gpio.parent = &client->dev;

-- 
2.45.2


