Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B2F396D4
	for <lists+linux-hwmon@lfdr.de>; Fri,  7 Jun 2019 22:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbfFGUag (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 7 Jun 2019 16:30:36 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38926 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729910AbfFGUag (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 16:30:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so1806848pfe.6
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 13:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=WLz2SfaUwAfarUYtEyfVxJRKHQ4lZqI9TqjU9DSSTjE=;
        b=XpenQCPm3nvWVeOsU+sRqmIE+yuk/Qmcxx8c7U+6s2bG2oByf7tw12xMjk/TWN0p7c
         WJ9AM3s5dFA2rXzyCFyg1Or+dKU8px5XDc7Byen+FfiNE8hVLtdOOhy4CBGETXJmqi/a
         Woile9y9wQcHOAAFxuSZQ/EC8aq8Zpe3pIybx6mp6mrbX1j5Nu6lYFIKFTBd4oa1WhQz
         IcbS2BwO7IgKWf3Ono+NhEgKYWxCR0DS+be4LNrcA0Fv+gthTx4d+036PxdqSZqLEglU
         4Jz30Y0m/J2lVncCQYbdSstaD14McXliK2m/8rf+a1Ai5I3+aMTyNorFg6pIQQQ61Qe9
         oPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=WLz2SfaUwAfarUYtEyfVxJRKHQ4lZqI9TqjU9DSSTjE=;
        b=VBRs2dbzgJkgYFQa55d6/SOLtrzm04drOK+muHNKxTV341bDPGZ3/dv7ZpNZEvTAFx
         23pl9UZaAEdir7GlgnEBH8yQ5+1uvz/4YxwKOBsqAXfc7ulASxPvdiTr29ra7XagDUTD
         1YL/t6Q6GfxFGcSx1F0gmkByj6jkoR7z1kILTrfY9yq/YztoziNl2toi8F6pjOhRD7Bs
         q+L9b3xFsgNUSF5Hzy+CO67OKMtpYBZsIPY83NMSdSBVYaLbqpqAYfLMWWkWs8kzPdEy
         GboPBAQPDN0GaJL0RRdimQ6CFFiOmhD4/MKnwKO+/ti9owwxkHUlDI6+57y292eL8IOw
         gjjg==
X-Gm-Message-State: APjAAAXFPbZIFlPLf2bz6cdfh9yoab9xcH7BForUSxd3zN9qCUOwYK+d
        Ks9T7OC6PK4WwbS6FiOkUu6daXpV
X-Google-Smtp-Source: APXvYqytIbzAamLHPmOw1yVmNJLlz64EUHOYkN8DPL0eI2z275ntap3eHMFMwpnR7oE5GCt+A62Npg==
X-Received: by 2002:a63:2c01:: with SMTP id s1mr4668020pgs.261.1559939435441;
        Fri, 07 Jun 2019 13:30:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k8sm2866550pfk.177.2019.06.07.13.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 13:30:34 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (gpio-fan) Check return value from devm_add_action_or_reset
Date:   Fri,  7 Jun 2019 13:30:30 -0700
Message-Id: <1559939431-18731-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

devm_add_action_or_reset() can fail due to a memory allocation failure.
Check for it and return the error if that happens.

Fixes: 9534784550ab ("hwmon: (gpio-fan) Use devm_thermal_of_cooling_device_register")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gpio-fan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 84753680a4e8..54c27e683ee1 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -524,7 +524,9 @@ static int gpio_fan_probe(struct platform_device *pdev)
 		err = fan_ctrl_init(fan_data);
 		if (err)
 			return err;
-		devm_add_action_or_reset(dev, gpio_fan_stop, fan_data);
+		err = devm_add_action_or_reset(dev, gpio_fan_stop, fan_data);
+		if (err)
+			return err;
 	}
 
 	/* Make this driver part of hwmon class. */
-- 
2.7.4

