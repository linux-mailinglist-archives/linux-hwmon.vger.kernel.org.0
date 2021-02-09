Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68A61314A9F
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Feb 2021 09:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhBIIpR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 Feb 2021 03:45:17 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11719 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbhBIIov (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Feb 2021 03:44:51 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DZbwx3LBhzlHX8;
        Tue,  9 Feb 2021 16:42:09 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Feb 2021 16:43:52 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (da9052): Switch to using the new API kobj_to_dev()
Date:   Tue, 9 Feb 2021 16:43:28 +0800
Message-ID: <1612860208-51088-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Switch to using the new API kobj_to_dev() to fix the below warnning:
/drivers/hwmon/da9052-hwmon.c:302:60-61: WARNING opportunity for
kobj_to_dev().

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/da9052-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/da9052-hwmon.c b/drivers/hwmon/da9052-hwmon.c
index 4af2fc3..ed6c5df 100644
--- a/drivers/hwmon/da9052-hwmon.c
+++ b/drivers/hwmon/da9052-hwmon.c
@@ -299,7 +299,7 @@ static ssize_t label_show(struct device *dev,
 static umode_t da9052_channel_is_visible(struct kobject *kobj,
 					 struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct da9052_hwmon *hwmon = dev_get_drvdata(dev);
 	struct device_attribute *dattr = container_of(attr,
 				struct device_attribute, attr);
-- 
2.7.4

