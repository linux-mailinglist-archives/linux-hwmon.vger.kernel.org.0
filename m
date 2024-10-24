Return-Path: <linux-hwmon+bounces-4612-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC539AEF5D
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Oct 2024 20:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C109DB24810
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Oct 2024 18:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3702038D4;
	Thu, 24 Oct 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y31vqQRN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F60202643
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793472; cv=none; b=MoanSBNYFPuo8tYKmlSk1jfZuXyLiGS319YRj+DMu2+D/1WjHOvjxoitm1s+LJddKR1QWw9AsUpth1VIKJhtayhg7wq+rhhw2eotzp+Aia8dAMZ9XKGVsZpoGnPAPlPdFT0ChyNVCJ2NYTwSBt5MKVRSzqBlQwZrMIcJQl3rfHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793472; c=relaxed/simple;
	bh=CcZS2lMSjKQk5DMr0lcBympx6MFOZa91kBCFmmmRsgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGtSyTkfZBxXhwiChvveRI6P843usJeL1UaqqI+qcE/DoWXyYTKygnB/QmftFes4GpG14ztVc999o1kdAtCplhl22gVyMK29ySA618ERGun5uSLj27PU7F5grUDSvba4Jxmzq0VxZTVzxWUub0cKjk85MbJFd4b9BftRqiJwjWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y31vqQRN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so12576975e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793468; x=1730398268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4za7fmNR/tTyyrtswW0yMGY0yUgT5apkN6SQXTSibU=;
        b=y31vqQRNYFwt3d/d/JzDCaaQ61/MkK8Ov1UI+ayTIqMiKi6AP88ytfxKqMlG9soWNw
         D2YnFPaMvp7zWEBdi8GrHw3fSXMS3TiMhC88MuQ/yl3eZ4F7cousLH4CjDnYmzloLJQ8
         AG6NLKuq54EsZ/O7yOXVsb2EVWtLKYz9c1jUc4FfVvgP0aC4Hxn0t6ujXwwy8sN7LFbo
         sj4ppd8UzvC7AtoVolhQkBZkIHkNIqSKkaIaoG9Z/w2Y0EzQGRm+bqdxOPjtoSsM+Hbo
         i7yt8nIOwRwqWq+71kIUc+s3cQouRX3P6J0HKqQFbZffi7aWGf6qeg+YO63pVUGqjQkM
         Qmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793468; x=1730398268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4za7fmNR/tTyyrtswW0yMGY0yUgT5apkN6SQXTSibU=;
        b=pp7Yzuwwk0xNFqQTN/d+/jvOZ7cSty3so7ubOOpJxr+MEe2Fw1TrJVZPDycG7oZZfz
         i1gsu2p7OO9zkNBDfOlXOPUhAngDCk/MyY4+c1UNrKKdgscGlD4++uVccoS+yZ9E7K/O
         9WqUEs07UE0HACvmjl48u84cua/Y5tXZHnV6sjyfrsD312puKf64adwpipfjozkFF0SP
         MsmCDqpgQMVMs1j19TqpxSkPRhElMn0qVSIf4aC9KMCpdBEqQtBp23j7rmfWIIOh/3AO
         J5kT70VvJGRvvvgmK+ysG8NRL+YE16T4FyRC4fwT/DLNdZKUWPIjyf3ur1TScfZk3ehT
         A1vw==
X-Gm-Message-State: AOJu0YyhF7glknQc1cEEKELDb5z2qAx6S9XUGNOR93MsfUAPMJx0dFV+
	LgHhpYnFMBKdvcg0KZ1gui1y0E6Lpk3XqeMnXLD+jC6XhJeWVcc9nbK/bHXIypE=
X-Google-Smtp-Source: AGHT+IGHJg0fHhXtA8gDbMxMxbB2At5z4+omPGcUx0dUgnP8DW+c0l41BYOBqmo1S0mPMy+ZYI8YRg==
X-Received: by 2002:a05:600c:1390:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4318c703d37mr26782415e9.16.1729793468158;
        Thu, 24 Oct 2024 11:11:08 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Oct 2024 20:10:38 +0200
Subject: [PATCH v3 4/6] hwmon: (pmbus/core) clear faults after setting
 smbalert mask
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-tps25990-v3-4-b6a6e9d4b506@baylibre.com>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
In-Reply-To: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=CcZS2lMSjKQk5DMr0lcBympx6MFOZa91kBCFmmmRsgU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo2yVz0maAGcDLQLTYmUMd/l96aXLzFYemkLH
 HthHzP6Qe2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNsgAKCRDm/A8cN/La
 hTMfD/0Zb/NqTaM5V+B4N89l1jXZzBdwslbuWfKti7RPxJq0nYeYJNGQbFWDiPU1yfQehuHIc24
 MbpugM2sV6qvbcMHzvohZrTArL0ysRvU6HjJxzhhfLIi/Ptcgw1dTAhG8jP0Tl3OwSqXhs9PI0t
 OLI6M2GfN3AziKwNiDUrZwRvFJ984bsvNB1/EuXy5/k0iPio9/coBjxB88/ozaXz3yNtlR+es66
 0S/UapET8t5/1UpIIYceRbrEIQhzcODE4w3E9UMUVli4mHsrcPfqwV8jc2QGeyIYWngdTrX8YYB
 sfXMdXPfhEvvGaN8xGhY++SFFHn8irLpHXNLb/QjvMIVNj1PEyg5yYVZyI3aQSwzliBGkwGLh4B
 Lexfzef62pbSb+14e5rOCE36dF1uAGlvvatJPbLvb7ETMExQA+CxZKnRfjugSTXBt/p4BQztvOx
 7FrJuiCeRXHYk05qMz3TCSmdWGkjCXevxP1Su0jXM/3nG32rejxShKx/G3QeGG6dHLrtSzjK/CU
 1EdSjTVE+kBNhqoVy0ri0rhEgLTeg3mO5p6jn+wSOUsca7ElHzepWoHkUMOMMPiAHWAfEvqSLSD
 oUWrNOMX7dVFK1bQm6lPpkPD6nOaDDNgnYs0OO9kMgQQ7n4bYVbQ/uwM9F3tZevtA9hpApUb+NV
 qeJPns3qZ+2f5LA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

pmbus_write_smbalert_mask() ignores the errors if the chip can't set
smbalert mask the standard way. It is not necessarily a problem for the irq
support if the chip is otherwise properly setup but it may leave an
uncleared fault behind.

pmbus_core will pick the fault on the next register_check(). The register
check will fails regardless of the actual register support by the chip.

This leads to missing attributes or debugfs entries for chips that should
provide them.

We cannot rely on register_check() as PMBUS_SMBALERT_MASK may be read-only.

Unconditionally clear the page fault after setting PMBUS_SMBALERT_MASK to
avoid the problem.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 221819ca4c36 ("hwmon: (pmbus/core) Add interrupt support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ce697ca03de01c0e5a352f8f6b72671137721868..a0a397d571caa1a6620ef095f9cf63d94e8bda1d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3346,7 +3346,12 @@ static int pmbus_regulator_notify(struct pmbus_data *data, int page, int event)
 
 static int pmbus_write_smbalert_mask(struct i2c_client *client, u8 page, u8 reg, u8 val)
 {
-	return _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+	int ret;
+
+	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK, reg | (val << 8));
+	pmbus_clear_fault_page(client, -1);
+
+	return ret;
 }
 
 static irqreturn_t pmbus_fault_handler(int irq, void *pdata)

-- 
2.45.2


