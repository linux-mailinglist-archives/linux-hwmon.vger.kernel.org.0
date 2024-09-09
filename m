Return-Path: <linux-hwmon+bounces-4075-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8D970B1E
	for <lists+linux-hwmon@lfdr.de>; Mon,  9 Sep 2024 03:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABA041F21899
	for <lists+linux-hwmon@lfdr.de>; Mon,  9 Sep 2024 01:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB991F94A;
	Mon,  9 Sep 2024 01:14:31 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D61C693;
	Mon,  9 Sep 2024 01:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725844471; cv=none; b=YFgiCh1xB42ucQwTkzxNRbR/VNcs4LVwoPZC28XQGVMwRgwyWzyUgw3cx7KkRnajSxfavF45YeZl86qO8WBdPT4AOi0+IIDN9VcHFucHH7C49MVyK5GMdLJrgvZLelIEDpvAZBaxtzHL9tavjPQE/k630jUIte89TSnUtcMYTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725844471; c=relaxed/simple;
	bh=zKX/EfcsEKb1OAT3Isg8pJMNEnZ2ZUELN4axIB85uks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYs2OrYN/U7CiHKhGzMFldRNKvDzXlqj11pdjpVOPNkB6Gr460+XR764OMybZTo4x86WW2jnDfICgxfaSX76XbZdEzS172733/v/LRTquSnVSSqFAA1rQVLZfd53P6oIkcZwzq5ZgDmNswykoAr4dZDuSyi92WPRdH8NoRz6ngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4X283J4H6Dz1BNkw;
	Mon,  9 Sep 2024 09:13:16 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 0B68C180087;
	Mon,  9 Sep 2024 09:14:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 9 Sep
 2024 09:14:19 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <michael.zaidman@gmail.com>,
	<gupt21@gmail.com>, <djogorchock@gmail.com>,
	<roderick.colenbrander@sony.com>, <savicaleksa83@gmail.com>,
	<me@jackdoan.com>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<mail@mariuszachmann.de>, <wilken.gottwalt@posteo.net>, <jonas@protocubo.io>,
	<mezin.alexander@gmail.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-hwmon@vger.kernel.org>
Subject: [PATCH -next v2 08/15] hwmon: (aquacomputer_d5next) Use devm_hid_hw_start_and_open in aqc_probe()
Date: Mon, 9 Sep 2024 09:23:06 +0800
Message-ID: <20240909012313.500341-9-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909012313.500341-1-lizetao1@huawei.com>
References: <20240909012313.500341-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Currently, the aquacomputer_d5next module needs to maintain hid resources
by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
resources are consistent with the device life cycle, and release
hid resources before device is released. At the same time, it can avoid
the goto-release encoding, drop the fail_and_close and fail_and_stop
lables, and directly return the error code when an error occurs.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Adjust commit information
v1:
https://lore.kernel.org/all/20240904123607.3407364-13-lizetao1@huawei.com/

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


