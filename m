Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C2E2F17CD
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Jan 2021 15:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbhAKOOe (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 11 Jan 2021 09:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729867AbhAKOOd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Jan 2021 09:14:33 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093F6C061794
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Jan 2021 06:13:53 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c133so13944408wme.4
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Jan 2021 06:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HDQz4iMlNtJUgLbZfKWh3c6UGq9q4CpkzN2dgTPuBqE=;
        b=aTCCFtxnRgly36Ux3D+jAWhsNi3Aj+9GAa7C15lOfMsBm1JS/and3I/F97ePyFunQD
         hchCfukPVLzNWQFV8IcW3G1tfW5kF9gnl6+NuLiQv5B67Rck8wjngMzh+aOYOdr+tk/I
         RKg4h10awXZjb2nk4FwYWiDsW/dn9wUVcXQ8aMku/JAs5Vunxt9JX5ULNbUfcq6IyjDC
         0/zD+HeegdWtlTOWHoHaZuLKztzP2pDlNKroCqx3Cs/lOqPYjjoYOcw8dQazH431tZYH
         t/9vqkJ6N+TFPISx2B9YWzgLu9iSPO5EFaU9Z4RnCVxxJ2/oqSEhAaWXMwYN5KgB7HfV
         P3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HDQz4iMlNtJUgLbZfKWh3c6UGq9q4CpkzN2dgTPuBqE=;
        b=U95/e7kqzgm4pFpvUcobqHyLvVVgBjAbhzFL9ITIJRLzEeTvkaMj3o7BVLYUYLZb6G
         foSojIUxFpN+U613VL1dj558rsbJelyz6zxOGXsDYbEl7yzmxjaooeNSi1T4I/upxSv/
         LCU2sJ3c2wqNQ8NWN3ohNV6ySgB146jRvAszlqYVNFqcA4hSvQ/Pl+uGi62BZWbNcAHo
         a7xhtgGFXFFb+LGGn0lF/5U3PXK0ngDLYYUA6TwXmY0dhxTB9YPkSsjM4V3bwsiHlsOL
         nnS1Z+SOSK1Zs0KoG/v/aEb35+UCZAkQQoIZJ852k1u+YSbI5Ah+VJM7E55cXFBWejUG
         Pf8Q==
X-Gm-Message-State: AOAM531a8A/55XbaS29dS5IBA4gzQnXElLTj1WZj6OzFWC69d1nyEHhJ
        DJ1MSA3YD5rUsWEP9tLONi0VVg==
X-Google-Smtp-Source: ABdhPJwFg0efm8YFmQlmB67mGL59RKW9zsqEtOpZpO9CAVBe4fctS5yB+fG7sdWgwygKOZXiGFNnhw==
X-Received: by 2002:a1c:bb06:: with SMTP id l6mr15224113wmf.112.1610374431483;
        Mon, 11 Jan 2021 06:13:51 -0800 (PST)
Received: from localhost.localdomain (lns-bzn-59-82-252-152-224.adsl.proxad.net. [82.252.152.224])
        by smtp.gmail.com with ESMTPSA id c4sm22367583wmf.19.2021.01.11.06.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 06:13:50 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rui.zhang@intel.com
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Amit Kucheria <amitk@kernel.org>,
        linux-hwmon@vger.kernel.org (open list:PWM FAN DRIVER),
        linux-kernel@vger.kernel.org (open list),
        linux-pm@vger.kernel.org (open list:THERMAL)
Subject: [PATCH] thermal/core: Make cooling device state change private
Date:   Mon, 11 Jan 2021 15:13:20 +0100
Message-Id: <20210111141320.15452-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The change of the cooling device state should be used by the governor
or at least by the core code, not by the drivers themselves.

Remove the API usage and move the function declaration to the internal
headers.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/hwmon/pwm-fan.c        | 1 -
 drivers/thermal/thermal_core.h | 2 ++
 include/linux/thermal.h        | 3 ---
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index bdba2143021a..0b1159ceac9b 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -378,7 +378,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 			return ret;
 		}
 		ctx->cdev = cdev;
-		thermal_cdev_update(cdev);
 	}
 
 	return 0;
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 90f9a80c8b23..86b8cef7310e 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -65,6 +65,8 @@ static inline bool cdev_is_power_actor(struct thermal_cooling_device *cdev)
 		cdev->ops->power2state;
 }
 
+void thermal_cdev_update(struct thermal_cooling_device *);
+
 /**
  * struct thermal_trip - representation of a point in temperature domain
  * @np: pointer to struct device_node that this trip point was created from
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 1e686404951b..6ac7bb1d2b1f 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -390,7 +390,6 @@ int thermal_zone_get_temp(struct thermal_zone_device *tz, int *temp);
 int thermal_zone_get_slope(struct thermal_zone_device *tz);
 int thermal_zone_get_offset(struct thermal_zone_device *tz);
 
-void thermal_cdev_update(struct thermal_cooling_device *);
 void thermal_notify_framework(struct thermal_zone_device *, int);
 int thermal_zone_device_enable(struct thermal_zone_device *tz);
 int thermal_zone_device_disable(struct thermal_zone_device *tz);
@@ -437,8 +436,6 @@ static inline int thermal_zone_get_offset(
 		struct thermal_zone_device *tz)
 { return -ENODEV; }
 
-static inline void thermal_cdev_update(struct thermal_cooling_device *cdev)
-{ }
 static inline void thermal_notify_framework(struct thermal_zone_device *tz,
 	int trip)
 { }
-- 
2.17.1

