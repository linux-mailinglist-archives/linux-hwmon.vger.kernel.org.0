Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E24E20E22E
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2020 00:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388417AbgF2VDF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 29 Jun 2020 17:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731155AbgF2TMt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Jun 2020 15:12:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ABD0C08ECB3
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:22 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r12so15277371wrj.13
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jun 2020 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJcoTCCNzlFqdkD2IQ5/+inRuV3iTmw7U1wrbHYsCXY=;
        b=yQNBIfth1iVmJ6MlsArzRkfMw8p3OlqAJFnPjZ9jDWZ8Ckq89NZ8HbCJp70g7E8YCL
         2JY3b42faBfp+pI9Wj+q3iC3i4AZyTUy1GEkfEUcBsqlmw8y8AvYgv5WcS2C2MW5u0JL
         zpbB9ruLU8gyxebla6lw8iGRWOyQDsCc5QzcNd8GacOCDvBNnYL3QOwwMzM23Zf9QFs2
         Iv5wKlZhCSNSPWT5AoW8QvVFYWoTZNDQbgoayzreAzhHe2dFIE9MQe0QbnDRPPdsflBy
         ssKY8pQVsk/0DwYidUKAHysQwmVOmtON7Mggt89l+RXLWxm7hlhn5VM7hDk0VhHUwDrK
         t9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJcoTCCNzlFqdkD2IQ5/+inRuV3iTmw7U1wrbHYsCXY=;
        b=IHwYGIOQd45YavFlvTng3Nfbf3lW6yKWd71rybUk+Seee9LM1fSMy+gTzCfPSnsmoP
         bRG+rOiRp4b9mHtIk/Nn+vCakhZpdD2+Bsrj1JQmMd4KotR+/f/H/YmO4xYvG0OCMK5S
         c+L1IsmfLUKB/7b3jahFqARrAyuceNO8dT0ueSmkchiVHR5DhF+qbwXbBKIeMASYUG10
         6HMzwSfYZ/wT7nUX0naAFE928YAyLwFsf4C9aWphKXb0L0c0WsxoeKt/XAE7cBKyOxEY
         bZg4aFvgBOtGvepEdVhm7WZE/1wrqZSmUw2NFdmPKz4ZuQRMEhGI/9YlFf7AMnS/ixX2
         7dxA==
X-Gm-Message-State: AOAM5319fIpJ66Cekv2ksA5F74VQNzK0ZImjp7Otlwt5KJYThXCxBaHb
        ubnCqTWyLIzvdTNPivDMA094eA==
X-Google-Smtp-Source: ABdhPJzt8Ln/xndbl27Fr/QEAXZT87zNp1KC2QGgpukfa3lZmG8mDlVvRIemD49AvoDQJ3zM4pnmjg==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr15360274wru.258.1593413421366;
        Sun, 28 Jun 2020 23:50:21 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id z25sm26400850wmk.28.2020.06.28.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 23:50:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 6/6] hwmon: pmbus: use more devres helpers
Date:   Mon, 29 Jun 2020 08:50:08 +0200
Message-Id: <20200629065008.27620-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629065008.27620-1-brgl@bgdev.pl>
References: <20200629065008.27620-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Shrink pmbus code by using devm_hwmon_device_register_with_groups()
and devm_krealloc() instead of their non-managed variants.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index a420877ba533..225d0ac162c7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1022,9 +1022,9 @@ static int pmbus_add_attribute(struct pmbus_data *data, struct attribute *attr)
 {
 	if (data->num_attributes >= data->max_attributes - 1) {
 		int new_max_attrs = data->max_attributes + PMBUS_ATTR_ALLOC_SIZE;
-		void *new_attrs = krealloc(data->group.attrs,
-					   new_max_attrs * sizeof(void *),
-					   GFP_KERNEL);
+		void *new_attrs = devm_krealloc(data->dev, data->group.attrs,
+						new_max_attrs * sizeof(void *),
+						GFP_KERNEL);
 		if (!new_attrs)
 			return -ENOMEM;
 		data->group.attrs = new_attrs;
@@ -2538,7 +2538,7 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 
 	ret = pmbus_find_attributes(client, data);
 	if (ret)
-		goto out_kfree;
+		return ret;
 
 	/*
 	 * If there are no attributes, something is wrong.
@@ -2546,35 +2546,27 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	 */
 	if (!data->num_attributes) {
 		dev_err(dev, "No attributes found\n");
-		ret = -ENODEV;
-		goto out_kfree;
+		return -ENODEV;
 	}
 
 	data->groups[0] = &data->group;
 	memcpy(data->groups + 1, info->groups, sizeof(void *) * groups_num);
-	data->hwmon_dev = hwmon_device_register_with_groups(dev, client->name,
-							    data, data->groups);
+	data->hwmon_dev = devm_hwmon_device_register_with_groups(dev,
+					client->name, data, data->groups);
 	if (IS_ERR(data->hwmon_dev)) {
-		ret = PTR_ERR(data->hwmon_dev);
 		dev_err(dev, "Failed to register hwmon device\n");
-		goto out_kfree;
+		return PTR_ERR(data->hwmon_dev);
 	}
 
 	ret = pmbus_regulator_register(data);
 	if (ret)
-		goto out_unregister;
+		return ret;
 
 	ret = pmbus_init_debugfs(client, data);
 	if (ret)
 		dev_warn(dev, "Failed to register debugfs\n");
 
 	return 0;
-
-out_unregister:
-	hwmon_device_unregister(data->hwmon_dev);
-out_kfree:
-	kfree(data->group.attrs);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_probe);
 
@@ -2584,8 +2576,6 @@ int pmbus_do_remove(struct i2c_client *client)
 
 	debugfs_remove_recursive(data->debugfs);
 
-	hwmon_device_unregister(data->hwmon_dev);
-	kfree(data->group.attrs);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);
-- 
2.26.1

