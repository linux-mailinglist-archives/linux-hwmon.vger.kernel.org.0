Return-Path: <linux-hwmon+bounces-7389-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4589EA6F1A8
	for <lists+linux-hwmon@lfdr.de>; Tue, 25 Mar 2025 12:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8CD3AB1BD
	for <lists+linux-hwmon@lfdr.de>; Tue, 25 Mar 2025 11:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD641EFF83;
	Tue, 25 Mar 2025 11:21:48 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.hows.id.au (125-63-26-112.ip4.superloop.au [125.63.26.112])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72B82E337C;
	Tue, 25 Mar 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.63.26.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742901708; cv=none; b=olKPZpF1AAp0/1tAdul8qac7IcXOxTq8VuOqFuhuGP0FgL/T/d3VYvKwHv27U2HH3ArjuQ9NOkNuspF4NEkKynocSQlBYppiBAZPkQZTb2sjFdPlNq6iI3w3OkFW5maPXkqO3ZGwfBN41pz1bY5VEmXVme8PcVMc/hBgEVB43h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742901708; c=relaxed/simple;
	bh=iLKFQ1XT7Gv64WulzIF36Fz95RYXU9EXLw7LTgu9jT4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BDbc7o1trA3KTaqWUDva8Mdv57+n3TihnxYqfUOj3LiXZwrlewPo5DETYXCgICFgvPxSkvGi0Ybh5XJqXUDVo0ER0y6iWDroklRrTClPJqwXN2USEx0wgE3CMUGpKkWW4W/9j2bO5++1J80qYJRDoP1nMsQcNNmu8m3Nhk4uXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hows.id.au; spf=pass smtp.mailfrom=hows.id.au; arc=none smtp.client-ip=125.63.26.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hows.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hows.id.au
Received: by mail.hows.id.au (Postfix, from userid 113)
	id 2F92622F1A; Tue, 25 Mar 2025 22:14:46 +1100 (AEDT)
X-Spam-Level: 
Received: from archibald.hows.id.au (unknown [192.168.0.118])
	by mail.hows.id.au (Postfix) with ESMTPSA id 7A7A4228BE;
	Tue, 25 Mar 2025 22:14:37 +1100 (AEDT)
Date: Tue, 25 Mar 2025 22:14:36 +1100
From: David Hows <david@hows.id.au>
To: Clemens Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Add support for CCD temperatures in AMD 1Ah CPUs model
 0x40..0x4f
Message-ID: <Z-KQHKm0nBWvYNI1@archibald.hows.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

---
 drivers/hwmon/k10temp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index d0b4cc9a5011..cc2ad7a324f9 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -502,6 +502,13 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			k10temp_get_ccd_support(data, 12);
 			break;
 		}
+	} else if (boot_cpu_data.x86 == 0x1a) {
+		switch (boot_cpu_data.x86_model) {
+		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop*/
+			data->ccd_offset = 0x308;
+			k10temp_get_ccd_support(data, 8);
+			break;
+		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {
-- 
2.49.0


