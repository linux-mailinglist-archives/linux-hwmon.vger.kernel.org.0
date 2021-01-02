Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9FC2E7D8F
	for <lists+linux-hwmon@lfdr.de>; Thu, 31 Dec 2020 02:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgLaBE0 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 30 Dec 2020 20:04:26 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:10378 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgLaBE0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 20:04:26 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D5qdV3LjTz7Mym;
        Thu, 31 Dec 2020 09:02:54 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 09:03:41 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (max6650): Switch to using the new API kobj_to_dev()
Date:   Thu, 31 Dec 2020 09:03:41 +0800
Message-ID: <1609376621-46463-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Switch to using the new API kobj_to_dev() to fix the below warnning:
drivers/hwmon/max6650.c:324:60-61: WARNING opportunity for
kobj_to_dev().

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/max6650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index cc7f298..f8d4534 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -321,7 +321,7 @@ static SENSOR_DEVICE_ATTR_RO(gpio2_alarm, alarm, MAX6650_ALRM_GPIO2);
 static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
 				     int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct max6650_data *data = dev_get_drvdata(dev);
 	struct device_attribute *devattr;
 
-- 
2.7.4

