Return-Path: <linux-hwmon+bounces-3937-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FCF96BC2A
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Sep 2024 14:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DFF92848B7
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Sep 2024 12:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3578C1D9D6A;
	Wed,  4 Sep 2024 12:27:42 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2C1D9351;
	Wed,  4 Sep 2024 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452862; cv=none; b=eWqRgJb25hSif24be0rQNFUXAAQJv8IH3ybL0COrbytvL/eAWEip4CJBilUwwBBL4L8Tv61al0Ks4n9cABpybLCCk3ObhIAp71JLTQC5e1ZpNF2rtreLuy3bOALIVkxDeGznTZ5ciudG3B2xPScE3+GRgRRVT4rjbMKCieFEx3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452862; c=relaxed/simple;
	bh=PclyRyj08simZQDFeLMPTpwSfkCzHHD9bpcGdEnMNwk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZ0qrwxnBg25zEXm3P72qzifA0Oil3NQ3qTXDu+xuv+w9keSZt2oVlesAvczWBFGXJkrgjjtl3FyfGUfXGceNXZi9R1m2V3aOMI2nY++H42LOO4I4b86Ag35+Od1Np4jJVCGDkZ6jRkmJnoXAo8FdsgdhQYSP/UrpcoLFGJ+P6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WzMCY2QBkzpVJc;
	Wed,  4 Sep 2024 20:25:45 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 166AE140137;
	Wed,  4 Sep 2024 20:27:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 4 Sep
 2024 20:27:37 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>, <rrameshbabu@nvidia.com>,
	<bonbons@linux-vserver.org>, <roderick.colenbrander@sony.com>,
	<david@readahead.eu>, <savicaleksa83@gmail.com>, <me@jackdoan.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <mail@mariuszachmann.de>,
	<wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next 12/19] hwmon: (aquacomputer_d5next) Use devm_hid_hw_start_and_open in aqc_probe()
Date: Wed, 4 Sep 2024 20:36:00 +0800
Message-ID: <20240904123607.3407364-13-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904123607.3407364-1-lizetao1@huawei.com>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Currently, the aquacomputer_d5next module needs to maintain hid resources
by itself. Consider using devm_hid_hw_start_and_open helper to ensure
that hid resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/hwmon/aquacomputer_d5next.c | 39 +++++++----------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 8e55cd2f46f5..9b66ff0fe6e1 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1556,14 +1556,10 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		return ret;
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
 	if (ret)
 		return ret;
 
-	ret = hid_hw_open(hdev);
-	if (ret)
-		goto fail_and_stop;
-
 	switch (hdev->product) {
 	case USB_PRODUCT_ID_AQUAERO:
 		/*
@@ -1577,10 +1573,8 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		 * they present. The two other devices have the type of the second element in
 		 * their respective collections set to 1, while the real device has it set to 0.
 		 */
-		if (hdev->collection[1].type != 0) {
-			ret = -ENODEV;
-			goto fail_and_close;
-		}
+		if (hdev->collection[1].type != 0)
+			return -ENODEV;
 
 		priv->kind = aquaero;
 
@@ -1740,10 +1734,8 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		 * Choose the right Leakshield device, because
 		 * the other one acts as a keyboard
 		 */
-		if (hdev->type != 2) {
-			ret = -ENODEV;
-			goto fail_and_close;
-		}
+		if (hdev->type != 2)
+			return -ENODEV;
 
 		priv->kind = leakshield;
 
@@ -1865,30 +1857,20 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	priv->name = aqc_device_names[priv->kind];
 
 	priv->buffer = devm_kzalloc(&hdev->dev, priv->buffer_size, GFP_KERNEL);
-	if (!priv->buffer) {
-		ret = -ENOMEM;
-		goto fail_and_close;
-	}
+	if (!priv->buffer)
+		return -ENOMEM;
 
 	mutex_init(&priv->mutex);
 
 	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, priv->name, priv,
 							  &aqc_chip_info, NULL);
 
-	if (IS_ERR(priv->hwmon_dev)) {
-		ret = PTR_ERR(priv->hwmon_dev);
-		goto fail_and_close;
-	}
+	if (IS_ERR(priv->hwmon_dev))
+		return PTR_ERR(priv->hwmon_dev);
 
 	aqc_debugfs_init(priv);
 
 	return 0;
-
-fail_and_close:
-	hid_hw_close(hdev);
-fail_and_stop:
-	hid_hw_stop(hdev);
-	return ret;
 }
 
 static void aqc_remove(struct hid_device *hdev)
@@ -1897,9 +1879,6 @@ static void aqc_remove(struct hid_device *hdev)
 
 	debugfs_remove_recursive(priv->debugfs);
 	hwmon_device_unregister(priv->hwmon_dev);
-
-	hid_hw_close(hdev);
-	hid_hw_stop(hdev);
 }
 
 static const struct hid_device_id aqc_table[] = {
-- 
2.34.1


