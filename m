Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B772D9183
	for <lists+linux-hwmon@lfdr.de>; Mon, 14 Dec 2020 02:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437505AbgLNBCw (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 13 Dec 2020 20:02:52 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9196 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgLNBCw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Dec 2020 20:02:52 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CvNPb39KXzkqvt;
        Mon, 14 Dec 2020 09:01:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 09:02:05 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     <linux-hwmon@vger.kernel.org>
Subject: [PATCH] hwmon: (w83627ehf)  Switch to using the new API kobj_to_dev()
Date:   Mon, 14 Dec 2020 09:02:15 +0800
Message-ID: <1607907735-17510-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Switch to using the new API kobj_to_dev() to fix the below warnning:
drivers/hwmon/w83627ehf.c:1113:60-61: WARNING opportunity for
kobj_to_dev().

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/w83627ehf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 3964cea..8618aaf 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1110,7 +1110,7 @@ clear_caseopen(struct device *dev, struct w83627ehf_data *data, int channel,
 static umode_t w83627ehf_attrs_visible(struct kobject *kobj,
 				       struct attribute *a, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct w83627ehf_data *data = dev_get_drvdata(dev);
 	struct device_attribute *devattr;
 	struct sensor_device_attribute *sda;
-- 
2.7.4

