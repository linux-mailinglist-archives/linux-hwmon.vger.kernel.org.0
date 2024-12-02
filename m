Return-Path: <linux-hwmon+bounces-5305-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610679DFEE5
	for <lists+linux-hwmon@lfdr.de>; Mon,  2 Dec 2024 11:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DCCF16202E
	for <lists+linux-hwmon@lfdr.de>; Mon,  2 Dec 2024 10:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4223C1FCD1A;
	Mon,  2 Dec 2024 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="asi4gFVj"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218D01FCD09
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Dec 2024 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135303; cv=none; b=Ycy9MGJCe9Iuvv7HfFEt9XYYrktHJcQS3TsP2HKUPhBDz5S7fc/10khaPxpt31LS4fRfdbTTVidiJTUn9ELwZYS3SegDhtHeG0hQWVoUIRPIFQyM9K1Hjji14MVgV7ZjOvWjUeDq7NFJ8FRDgDZPv422vy6JyARGAXAsRr5KRpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135303; c=relaxed/simple;
	bh=7SN1zYi2bi4ZL76u0nD+cmpU4TQtVFh2a743pVPGxLM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K0sq40RIF/kupGYAfthba5VnRY2OIRqp3Y3FeXW13f5kzv0NvzqRBj5+06gmg9MdMY94ozkBUhU3oXLjZcla6MA1Xy2VOoLJuhCvE7XvG9zj0jjAHvW7QfNy8TpCe9CP8oZCtLJI6gAUe97pfOrdyKmjBl859GUUOeqSXN3O3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=asi4gFVj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so860008f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2024 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733135298; x=1733740098; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWmD20KW9HJvkrylQbojOQFf4OK6t+C4W82MREjzz9I=;
        b=asi4gFVjV40Cg+79aF0Wd2xDYtiBaAlAF0m6bWZRtKVzo7BXZsqYBXMyzLKSAFcjsy
         4ZDMZCOsBT7EjG9FHuvz04+5MVqtI0Wr/pC866oeb/YpHseWiCV5fLfaMaRNOgg/l7dh
         KzI8dX6rq57egpWBKXahERxHvorCRdKXsL201UdhUSIShVwzrzKxPF6xD3a4h+YhpxRE
         Rxy/MKGy5pxHkAIDj2jIhmmtew6TTH/EwCoV43W8MIlJ1FeXLbjw4w0XwLV1MuE4yipf
         28wuZwDKjiUmKxeIbG8HMD8LqaCrBTTcL44rMFe5L4vUNc7ROttQQbtGzh9XY+70NHY8
         ZPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135298; x=1733740098;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWmD20KW9HJvkrylQbojOQFf4OK6t+C4W82MREjzz9I=;
        b=c6Bwv1c/EjrWSoK/+0HLuj63bLT5hq4OjTKdyGd93CJfSvqbOn1rF9KJdiqfFwM4s8
         eZW7rBBCTgMOVktRqDWYWlc8i53HrS3qVLZ6pe9vuNoSsAfCFGT65vjrHaJq6P9JvJl0
         OoYt2E/dtAX/jTFSF+FbK5hnCl3ibr6OmNCHVPxcER5QVobbiUzEWDdL5R5aOE+5GpYn
         asthuwKu/+GLkGASeMBwyCylkY2iLtaxhFkKfjG90u/AiQ0hFhkkLtA29C9oBsXx2sKJ
         9yY2Miwjt0f6mC4uTN5XVAUckGVBb63mskbC8LJXSlxb7tQArFIIJRuNMiHyzbvZmXqo
         NnLg==
X-Gm-Message-State: AOJu0Yxtn3Qex5yi5pduJnRe4ogxZPrSS9op2GjqR0mPCunUvp9j3iVe
	R2G14HWztqYu9MMchRmE5myXjRmqxa7SbTjWvyVnlytWpS2w/jiUo96EePv8mu8Ghje+fUmRmWi
	9
X-Gm-Gg: ASbGncvgasYKsJtVJdo4pC/TGl275o57BANLSADbWh0swqAiDxYV/s5P6YSvYvhbLnf
	XY2BNDQDPU2jezSmP3ko3rXptrM41F3BHL8ZK4p3XVAObbDhjjmVeDQn6+FfVbGU3ouvLR2nCgr
	67gyD5cftW8bb/AYub9EgaKXFCRmeD2GBSmtfqfn+Gga5D6id0EruKNQdVJEgVte7A0X1ruxll9
	vukLcROBnIYgVOsh2/pYFRFwmnM9DjQXgPszU25DGg0GOGsUNR3kVu5/qv9vg==
X-Google-Smtp-Source: AGHT+IHZgF0yFRrLmHXVI8InY5pVjPT+BsN4+An2BUJJBhWCA27NuZYZGO0F2gUnMM9QYoWIQlaWDQ==
X-Received: by 2002:a5d:64ae:0:b0:385:f7ea:eb86 with SMTP id ffacd0b85a97d-385f7eaef3dmr921589f8f.7.1733135298434;
        Mon, 02 Dec 2024 02:28:18 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2380:13:b62c:611c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-385e940fef3sm5757614f8f.42.2024.12.02.02.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:28:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/3] hwmon: pmbus: add tps25990 efuse support
Date: Mon, 02 Dec 2024 11:27:59 +0100
Message-Id: <20241202-tps25990-v4-0-bb50a99e0a03@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+LTWcC/22Qyw6CMBBFf4V0LaZPSF35H8YFLVNpooItNhLCv
 zugMcSwmMWdzDnJnZFECB4iOWQjCZB89O0dg9xlxDbV/QK5rzETTrmkmuq87yJXWtNcSEutc9w
 ALQiedwGcfy2q0xlz42PfhmExJzZvNySJ5WjSRpQgBZRaHU01XL0JsLftjcyexFcspyuWI+sEI
 G5BsVJssOLHMpwVK5A1RVWArqVRtPhjp0+hAI8nvqT/tpqmN79I0/UwAQAA
X-Change-ID: 20240909-tps25990-34c0cff2be06
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Vaishnav Achath <vaishnav.a@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7SN1zYi2bi4ZL76u0nD+cmpU4TQtVFh2a743pVPGxLM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnTYu9ILcbuOEyW1tS6r7zDKCEDVBYslcykP4y5
 Wla7KnDPYyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ02LvQAKCRDm/A8cN/La
 hdC8D/4uyt3XMYlS+t6+7hBabCoMr1U+Mhlm+5UJJOduc4b4/vCSfZyhpR1XMUHIcZ98+42ea2y
 SgoyTNwf50fD3M65Ti+LAFxbs4Jj44G8eVuM/ObA3f20qhjU7CQUjrYyZDH86fKRXKViVVX/rtb
 QJ3t3FWSbVMSpVRJJN8HqixEcCOm05SDH2lufqsvAIP36u/8C5PH2PO3UOUTCHt6MqD1brJCPrh
 izXDqrjMMfq/OB08NA3df9/9xzbEeOH6ucszkdu8dj2RW8uLg8+cVSSUcC7ls+8CE7uL1mp6sTR
 2l39d9Mg0G93W2KGy6HKWgN5aCj/GEvdOZT9CzmtgtFkA7oWK4A5+BAl5esXC/GVMXg0Xisc2Su
 L3zuuzBvvaojk8WfYm1coqWhZVdDB9ylVlC+lFTOnorWcDapLVn/tYmhCccz0N7j8m0RXruBVot
 egSDsdR5jJI5UHXVpoyhnydQP8zfahNukY1q88vpgsEE60pp9+1JBh7DAWVH33sC1Mll7TTxNdi
 G3Q+BLZzXRQgjkI0VckzWJvwrXCY7bcUOep5Ic1GdvrO+OB7C7UoCzCzLn+ScwN/TRavpemhzOK
 zwbr2pUmG+8n9GmkkutS3ElRbu+FsCPXUWVj/kdvejTcNuHE5AAVgAH2VK1LQ1Y9J7CwVSeoe1k
 opvcTLxPW3gp3xg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds initial support for the Texas Instruments TPS25990
eFuse. The TPS25990 is an integrated, high-current circuit protection and
power management device. TPS25895 may be stacked on the TPS25990 for
higher currents.

This patchset provides basic telemetry support for the device.
On boot, the device is write protected. Limits can be changed in sysfs
if the write protection is removed using the introduced pmbus parameter.

Limits will be restored to the default value device on startup, unless
saved to NVM. Writing the NVM is not supported by the driver at the moment.

As part of this series, PMBus regulator support is improved to better
support write-protected devices.

Changes in v4:
- Rebased on v6.13-rc1, dropping applied patches.
- Replace 0xff with -1 when using pmbus_read/write_byte()
- TPS25990 Support only WP_ALL or 0 as write protection, return -EINVAL otherwise.
- Link to v3: https://lore.kernel.org/r/20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com

Changes in v3:
- Grouped hwmon write protect patches from:
  https://lore.kernel.org/r/20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com
- Link to v2: https://lore.kernel.org/r/20240920-tps25990-v2-0-f3e39bce5173@baylibre.com

Changes in v2:
- Drop PGOOD command support
- Use micro-ohms for rimon property and better handle range.
- Adjust read/write callbacks to let PMBus core do the job by default
- Drop history reset specific properties and remap to the generic ones
- Drop debugfs write_protect property and remap to the generic register
- Link to v1: https://lore.kernel.org/r/20240909-tps25990-v1-0-39b37e43e795@baylibre.com

---
Jerome Brunet (3):
      hwmon: (pmbus/core) improve handling of write protected regulators
      hwmon: (pmbus/core) add wp module param
      hwmon: (pmbus/tps25990): add initial support

 Documentation/hwmon/index.rst      |   1 +
 Documentation/hwmon/pmbus-core.rst |  35 +++
 Documentation/hwmon/tps25990.rst   | 148 +++++++++++++
 MAINTAINERS                        |   2 +
 drivers/hwmon/pmbus/Kconfig        |  17 ++
 drivers/hwmon/pmbus/Makefile       |   1 +
 drivers/hwmon/pmbus/pmbus.h        |   4 +
 drivers/hwmon/pmbus/pmbus_core.c   |  81 ++++++-
 drivers/hwmon/pmbus/tps25990.c     | 437 +++++++++++++++++++++++++++++++++++++
 include/linux/pmbus.h              |  14 ++
 10 files changed, 734 insertions(+), 6 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20240909-tps25990-34c0cff2be06

Best regards,
-- 
Jerome


