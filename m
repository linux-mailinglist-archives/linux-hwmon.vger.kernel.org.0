Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9255733FCE8
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Mar 2021 02:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhCRBy5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 17 Mar 2021 21:54:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13559 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhCRByb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Mar 2021 21:54:31 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F194j1ymYzMj8H;
        Thu, 18 Mar 2021 09:52:05 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 09:54:25 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (ds1621) Use kobj_to_dev()
Date:   Thu, 18 Mar 2021 09:55:04 +0800
Message-ID: <1616032504-59817-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

fixed the following coccicheck:
./drivers/hwmon/ds1621.c:329:60-61: WARNING opportunity
for kobj_to_dev().

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/ds1621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ds1621.c b/drivers/hwmon/ds1621.c
index e1d742b..bf1c4b7 100644
--- a/drivers/hwmon/ds1621.c
+++ b/drivers/hwmon/ds1621.c
@@ -326,7 +326,7 @@ static struct attribute *ds1621_attributes[] = {
 static umode_t ds1621_attribute_visible(struct kobject *kobj,
 					struct attribute *attr, int index)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct ds1621_data *data = dev_get_drvdata(dev);
 
 	if (attr == &dev_attr_update_interval.attr)
-- 
2.7.4

