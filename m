Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9CA537D77
	for <lists+linux-hwmon@lfdr.de>; Mon, 30 May 2022 15:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbiE3NlY (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 30 May 2022 09:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237774AbiE3NiI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 30 May 2022 09:38:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875688BD36;
        Mon, 30 May 2022 06:31:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F062EB80DB1;
        Mon, 30 May 2022 13:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D554FC341C4;
        Mon, 30 May 2022 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653917473;
        bh=Bpw6Qm6IaCPjexmO1xXZD3Zk0B/+hGZOu1QhVZlvP9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ncfKnxcTKN08/84iGMUeXxdaoljEHAV0GRhuvaz0q8gqDAaeZ0l5IaPGeWCr3EEZq
         G7Nqc3iOIU4ixyZphWao87sX8d/wzuj6pZrsV009N75gcLxaP9uv/oChAL2ns5n7Yf
         wPzpZck1eA9TlXNsgW0dhAvnDKUBtoiZi/POn/0pxuWBXiZKmZ/1l18t7Ukd4odPjQ
         BWdONsMl06P1ohRPpQGI8AFNvOV6LB+0xRh8XvahG5lSv3nN2CgMk/LhBb5y8dueKK
         pUcCEGDa6PFJMTVRWUzSg+7TdbG0G8MX0iuvRNVgE64MQkwR9Wjp8JvMVCFyknbQlK
         HFcfx66SBlsyQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, jdelvare@suse.com,
        corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 151/159] hwmon: Make chip parameter for with_info API mandatory
Date:   Mon, 30 May 2022 09:24:16 -0400
Message-Id: <20220530132425.1929512-151-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit ddaefa209c4ac791c1262e97c9b2d0440c8ef1d5 ]

Various attempts were made recently to "convert" the old
hwmon_device_register() API to devm_hwmon_device_register_with_info()
by just changing the function name without actually converting the
driver. Prevent this from happening by making the 'chip' parameter of
devm_hwmon_device_register_with_info() mandatory.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/hwmon/hwmon-kernel-api.rst |  2 +-
 drivers/hwmon/hwmon.c                    | 16 +++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
index c41eb6108103..23f27fe78e37 100644
--- a/Documentation/hwmon/hwmon-kernel-api.rst
+++ b/Documentation/hwmon/hwmon-kernel-api.rst
@@ -72,7 +72,7 @@ hwmon_device_register_with_info is the most comprehensive and preferred means
 to register a hardware monitoring device. It creates the standard sysfs
 attributes in the hardware monitoring core, letting the driver focus on reading
 from and writing to the chip instead of having to bother with sysfs attributes.
-The parent device parameter cannot be NULL with non-NULL chip info. Its
+The parent device parameter as well as the chip parameter must not be NULL. Its
 parameters are described in more detail below.
 
 devm_hwmon_device_register_with_info is similar to
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 989e2c8496dd..187212988b6c 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -886,11 +886,12 @@ EXPORT_SYMBOL_GPL(hwmon_device_register_with_groups);
 
 /**
  * hwmon_device_register_with_info - register w/ hwmon
- * @dev: the parent device
- * @name: hwmon name attribute
- * @drvdata: driver data to attach to created device
- * @chip: pointer to hwmon chip information
+ * @dev: the parent device (mandatory)
+ * @name: hwmon name attribute (mandatory)
+ * @drvdata: driver data to attach to created device (optional)
+ * @chip: pointer to hwmon chip information (mandatory)
  * @extra_groups: pointer to list of additional non-standard attribute groups
+ *	(optional)
  *
  * hwmon_device_unregister() must be called when the device is no
  * longer needed.
@@ -903,13 +904,10 @@ hwmon_device_register_with_info(struct device *dev, const char *name,
 				const struct hwmon_chip_info *chip,
 				const struct attribute_group **extra_groups)
 {
-	if (!name)
-		return ERR_PTR(-EINVAL);
-
-	if (chip && (!chip->ops || !chip->ops->is_visible || !chip->info))
+	if (!dev || !name || !chip)
 		return ERR_PTR(-EINVAL);
 
-	if (chip && !dev)
+	if (!chip->ops || !chip->ops->is_visible || !chip->info)
 		return ERR_PTR(-EINVAL);
 
 	return __hwmon_device_register(dev, name, drvdata, chip, extra_groups);
-- 
2.35.1

