Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9727B1B8
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jul 2019 20:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbfG3SQP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 30 Jul 2019 14:16:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45333 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387870AbfG3SQO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Jul 2019 14:16:14 -0400
Received: by mail-pf1-f193.google.com with SMTP id r1so30253365pfq.12
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jul 2019 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJlVBcFw6cgQmE2TcJCLwuGNy4X0qqoZ4PXxrXo9yOs=;
        b=NUZDgnrnyDsEg+yvm339bqt4rMbfBLxY/tz2XFFLV3q1UxiT+G/pmXejX0awBm9gRQ
         YA4PnbOkaRVFki/qNwU54yjzc6A3SL6iIIHXUkYLwnr+x25aow3eHDRXXF7IJPnMwNae
         7tc8162WwXeDjKZAehgf5qPfDRSrUdgEGlJx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJlVBcFw6cgQmE2TcJCLwuGNy4X0qqoZ4PXxrXo9yOs=;
        b=AQ9UYPo5umpruZDcsSutB5eSeMSK9erNr5tUTxcPaxL0gAfdAzP/C+TroxWXz/SOfj
         R60CLtcN5DvSOtbnA5MeVghPULWxoroyRESHTgKarR9nkPhusbSjp8OVK/U2O9Np6XlH
         U+KO0jzzRnwU+oCYSjGmsDrrMqQcKn4vS99wzLb7nCkZp9HWkKKu03QOyGmNOs2M/abf
         B+PcpeYQfc5Uco392zaLS532sgVHb4luNokHxniU/YdQD7YJAfPsTznpB+VYrRojcqZm
         OT98rZE+1anQ9md1dF8OtS9qoFQnucyI7aT8UJvImNQgECVjioyCllb9wsqOHJ9vWEVn
         d3Wg==
X-Gm-Message-State: APjAAAWwscNVcVUHZQ1wfkgRED3bwJm4VdPwZxhmQEzDBJcU70pP/zqi
        332d+E+gW1zV0p1fDSlUwwOyuvqbTsI=
X-Google-Smtp-Source: APXvYqwxMVIkSlnyMuemYnqyVg6VCF6ylAjcO36mqfgO0GWe5e7cRnDDEAeUwhteeNYBMdgj63U28Q==
X-Received: by 2002:a17:90a:bc42:: with SMTP id t2mr117788662pjv.121.1564510573785;
        Tue, 30 Jul 2019 11:16:13 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:13 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 17/57] hwmon: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:17 -0700
Message-Id: <20190730181557.90391-18-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/hwmon/jz4740-hwmon.c    | 5 +----
 drivers/hwmon/npcm750-pwm-fan.c | 4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/jz4740-hwmon.c b/drivers/hwmon/jz4740-hwmon.c
index bec5befd1d8b..47bed41b55a1 100644
--- a/drivers/hwmon/jz4740-hwmon.c
+++ b/drivers/hwmon/jz4740-hwmon.c
@@ -93,11 +93,8 @@ static int jz4740_hwmon_probe(struct platform_device *pdev)
 	hwmon->cell = mfd_get_cell(pdev);
 
 	hwmon->irq = platform_get_irq(pdev, 0);
-	if (hwmon->irq < 0) {
-		dev_err(&pdev->dev, "Failed to get platform irq: %d\n",
-			hwmon->irq);
+	if (hwmon->irq < 0)
 		return hwmon->irq;
-	}
 
 	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hwmon->base))
diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 09aaefa6fdb8..11a28609da3c 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -967,10 +967,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 		spin_lock_init(&data->fan_lock[i]);
 
 		data->fan_irq[i] = platform_get_irq(pdev, i);
-		if (data->fan_irq[i] < 0) {
-			dev_err(dev, "get IRQ fan%d failed\n", i);
+		if (data->fan_irq[i] < 0)
 			return data->fan_irq[i];
-		}
 
 		sprintf(name, "NPCM7XX-FAN-MD%d", i);
 		ret = devm_request_irq(dev, data->fan_irq[i], npcm7xx_fan_isr,
-- 
Sent by a computer through tubes

