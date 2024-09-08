Return-Path: <linux-hwmon+bounces-4058-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD9970A06
	for <lists+linux-hwmon@lfdr.de>; Sun,  8 Sep 2024 23:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E7BAB21733
	for <lists+linux-hwmon@lfdr.de>; Sun,  8 Sep 2024 21:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E87186284;
	Sun,  8 Sep 2024 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ldvIzexo"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39317BED6;
	Sun,  8 Sep 2024 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725829801; cv=none; b=aVJU6VJtiNkqf8GRtGsshkvxNri1U2XqUhi6U8BCiIgq7mgyPsb8PyUWS0PmgMPmGjwr2+cL/oLP7+dEPNbUePpGcGMmXCiK/8QkyPEqomR56oTZBJJUECpiEnD7EUAv3tqSqMScdou7v+kwR/srA5fs/k70yZRKcTnW04F72vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725829801; c=relaxed/simple;
	bh=ikgHDv00UR1GFix404hBO2I+Ancqxynz4109/vX+9ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VG1zcvW6QZqm5OnmvS0qtBqrSKbrp2Ni3xldt1wzqX7tQV3KbSSnsFxJ6IPr8osh6EGqZLvUCgiMAhnGz3C0fPy9cZLxnWs2b2nV9ZSE3pteUKtfQofwKKshZ16KGTp8vKrmrknlyfwUBVNDSsLLsxmspyXcCdXFEhfuX8dJlSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ldvIzexo; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3/4HHY3ghqW2KMcl0RzKPKCyl8MwdumKgzeU1PdzKSc=; b=ldvIzexodOw88hwxfyAi95f6xn
	Ui7G5zkp1SVZ6j7WJdUuM3iHD610PYcejCol5da3+QBe1wZJ/P4BMTvqC1wqZ4LJUyBfG2tVnDEwu
	A19DpOVjQM6vN0foicKUT+nUjL1A8eH3A0goGdcPRxhqffbZK0rmIxcD2a/sg5AnKMEgOX5fye93U
	Z2h3KZhSOSJy6NbcLe5szwHXORbrQuuXws3S8h3R8adPRgBObrjFz1mT5CcAfSrktTSM/5XfBbzli
	gjswITNBWwXTYRo2s+NdwqQRm2blB3ZQu+0AciPp6iDwgon9MZMnC6OTFAreapSHeHeE5nOtEfS19
	S9jyzzMQ==;
Received: from i5e8616cc.versanet.de ([94.134.22.204] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1snPA1-0003s9-47; Sun, 08 Sep 2024 23:09:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	jikos@kernel.org,
	jic23@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	srinivas.pandruvada@linux.intel.com,
	bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	pavel@ucw.cz,
	ukleinek@debian.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v8 1/9] HID: hid-sensor-hub: don't use stale platform-data on remove
Date: Sun,  8 Sep 2024 23:07:55 +0200
Message-ID: <20240908210803.3339919-2-heiko@sntech.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240908210803.3339919-1-heiko@sntech.de>
References: <20240908210803.3339919-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hid-sensor-hub creates the individual device structs and transfers them
to the created mfd platform-devices via the platform_data in the mfd_cell.

Before commit e651a1da442a ("HID: hid-sensor-hub: Allow parallel synchronous reads")
the sensor-hub was managing access centrally, with one "completion" in the
hub's data structure, which needed to be finished on removal at the latest.

The mentioned commit then moved this central management to each hid sensor
device, resulting on a completion in each struct hid_sensor_hub_device.
The remove procedure was adapted to go through all sensor devices and
finish any pending "completion".

What this didn't take into account was, platform_device_add_data() that is
used by mfd_add{_hotplug}_devices() does a kmemdup on the submitted
platform-data. So the data the platform-device gets is a copy of the
original data, meaning that the device worked on a different completion
than what sensor_hub_remove() currently wants to access.

To fix that, use device_for_each_child() to go through each child-device
similar to how mfd_remove_devices() unregisters the devices later and
with that get the live platform_data to finalize the correct completion.

Fixes: e651a1da442a ("HID: hid-sensor-hub: Allow parallel synchronous reads")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/hid/hid-sensor-hub.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 26e93a331a51..3cd00afa453a 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -730,23 +730,30 @@ static int sensor_hub_probe(struct hid_device *hdev,
 	return ret;
 }
 
+static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
+{
+	struct hid_sensor_hub_device *hsdev = dev->platform_data;
+
+	if (hsdev->pending.status)
+		complete(&hsdev->pending.ready);
+
+	return 0;
+}
+
 static void sensor_hub_remove(struct hid_device *hdev)
 {
 	struct sensor_hub_data *data = hid_get_drvdata(hdev);
 	unsigned long flags;
-	int i;
 
 	hid_dbg(hdev, " hardware removed\n");
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
+
 	spin_lock_irqsave(&data->lock, flags);
-	for (i = 0; i < data->hid_sensor_client_cnt; ++i) {
-		struct hid_sensor_hub_device *hsdev =
-			data->hid_sensor_hub_client_devs[i].platform_data;
-		if (hsdev->pending.status)
-			complete(&hsdev->pending.ready);
-	}
+	device_for_each_child(&hdev->dev, NULL,
+			      sensor_hub_finalize_pending_fn);
 	spin_unlock_irqrestore(&data->lock, flags);
+
 	mfd_remove_devices(&hdev->dev);
 	mutex_destroy(&data->mutex);
 }
-- 
2.43.0


