Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36D612E6D8A
	for <lists+linux-hwmon@lfdr.de>; Tue, 29 Dec 2020 04:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgL2DSA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 28 Dec 2020 22:18:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9654 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgL2DSA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Dec 2020 22:18:00 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D4fhY3sJ6z15lFn;
        Tue, 29 Dec 2020 11:16:29 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 11:17:16 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (gpio-fan): Switch to using the new API kobj_to_dev()
Date:   Tue, 29 Dec 2020 11:17:17 +0800
Message-ID: <1609211837-54930-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

fixed the following coccicheck:
drivers/hwmon/gpio-fan.c:302:60-61: WARNING opportunity for
kobj_to_dev()

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/gpio-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
index 3ea4021..befe989 100644
--- a/drivers/hwmon/gpio-fan.c
+++ b/drivers/hwmon/gpio-fan.c
@@ -299,7 +299,7 @@ static DEVICE_ATTR(fan1_target, 0644, fan1_input_show, set_rpm);
 static umode_t gpio_fan_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct gpio_fan_data *data = dev_get_drvdata(dev);
 
 	if (index == 0 && !data->alarm_gpio)
-- 
2.7.4

