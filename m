Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AC3560CE3
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Jun 2022 01:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbiF2XAD (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 29 Jun 2022 19:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiF2W7p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Jun 2022 18:59:45 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D710403EC
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jun 2022 15:58:55 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id o1-20020a17090ab88100b001ef01610843so380081pjr.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jun 2022 15:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bg9ioyZvi3pggVC6pmrxVE3PJI7RkTo447asQNSDMCo=;
        b=XOgKAp54Uomy/MmM0rVyzKaifQUFQpoD1t30MT8UmSk4KOHvi9VYQBtLOKeJ3qoCT6
         wKGwjYZo3g/dGbJKaFBT0jIkbA+P95nNjL2xa4BsbkANz7tvu+bPqV5M8zspj86R+6Pi
         MDg5CsnBjFcma+9cvcJBzeQsANG9udxS/lKWSY08OdTFEmDpkxrpjs5t3nG/ldOT7AGM
         7hzpNc6DEU9m08IurlitD8wgQ25ff1MNozL2+BK/fRrn3NUTBMXMlKIb3EbzbNi+qb06
         MXSZ/NUMCzRQbU0iubhU+b7vDdg89J0/lN9T+uF2q0aPOpHKL4BzM0lhzoXcqTuaIp3O
         yiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bg9ioyZvi3pggVC6pmrxVE3PJI7RkTo447asQNSDMCo=;
        b=u7k64d9oEN308Q16f+rNJInSvyTelrnBLp0rOcI48D7T127FR2hfMkiKcWjSRNFvhK
         1PYIjhblnJdJoE0ikgZhqsGnFaE6nUD8K+mPhU6g7f4bS2s18gP1XJ5nWtOEw4pms1y7
         /BvKkN8/a4hjKfTKB3CW0B1nAmmw9Iou7z+ZnXSiCiytGQO+p9aTh84C8tVgO/nzpmcu
         cVoEQQujRurStUGA5TYGyg165vmZhmP1QmbdMUcDQHjSjvItCYztHT3Zn68K7lGhbMzG
         hVDxx6vfJycnua3xKErdJp3s5qLu7VkifiVWANzcw8PHR4+4lrad0cnHnwQa619SEXAW
         BsQw==
X-Gm-Message-State: AJIora/TaRQvap9sD+s4L3R9L/NJJHQdPa7ZpUZwVhB4C3RofzWuQVY/
        f8NefUAlkqVkf/UE3RypFcE4QhKFH6kJOGz5Zds=
X-Google-Smtp-Source: AGRyM1uFrWDjwr0dMIMwLT0wv42PT1NVpnfJp0c1gw3lcilw2C0s09prA0+AV6JbWt+Dgn5xul4w0FlFmXjKuEaI700=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:90a:3e04:b0:1ee:e899:4eb6 with
 SMTP id j4-20020a17090a3e0400b001eee8994eb6mr8179267pjc.187.1656543534620;
 Wed, 29 Jun 2022 15:58:54 -0700 (PDT)
Date:   Wed, 29 Jun 2022 22:58:42 +0000
In-Reply-To: <20220629225843.332453-1-willmcvicker@google.com>
Message-Id: <20220629225843.332453-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <20220629225843.332453-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH 4.19 v1 2/2] thermal/drivers/thermal_hwmon: Use hwmon_device_register_for_thermal()
From:   Will McVicker <willmcvicker@google.com>
To:     stable@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ upstream commit 87743bcf08072b3e1952a0bf5524b2833e667b4c ]

The thermal subsystem registers a hwmon device without providing chip
information or sysfs attribute groups. While undesirable, it would be
difficult to change. On the other side, it abuses the
hwmon_device_register_with_info API by not providing that information.
Use new API specifically created for the thermal subsystem instead to
let us enforce the 'chip' parameter for other callers of
hwmon_device_register_with_info().

Acked-by: Rafael J . Wysocki <rafael@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/thermal/thermal_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index dd5d8ee37928..b3b229421936 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -147,8 +147,8 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
 	INIT_LIST_HEAD(&hwmon->tz_list);
 	strlcpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
 	strreplace(hwmon->type, '-', '_');
-	hwmon->device = hwmon_device_register_with_info(&tz->device, hwmon->type,
-							hwmon, NULL, NULL);
+	hwmon->device = hwmon_device_register_for_thermal(&tz->device,
+							  hwmon->type, hwmon);
 	if (IS_ERR(hwmon->device)) {
 		result = PTR_ERR(hwmon->device);
 		goto free_mem;
-- 
2.37.0.rc0.161.g10f37bed90-goog

