Return-Path: <linux-hwmon+bounces-3095-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7B930EC8
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jul 2024 09:31:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A822812CA
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jul 2024 07:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBA8184129;
	Mon, 15 Jul 2024 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="aCg0yyIq"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65F18410A
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721028677; cv=none; b=BBCBNKO10p+Hx/VnSbMZyRm3t4/3/DIQmm39XEr8N2uZDwYO3rAPictQFrA76OOqom2kqDiYWlBPGHs7bfUN/CEL2wzGzE0Ss5KIt5ySpdxHgyjE5KRZyFyXTSE1mZXdWVK+tEpdsZpx4u4h1f8SUZp/KnoaNUDcuUUpCiXclwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721028677; c=relaxed/simple;
	bh=ELszuHUI2Sho29pe1aUjUExSj0Jd1K3H1CrC966SsaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWTWJj5CaakuwCsm+qEIMSgBmrJBwGMtfNKDC0YY+i43k72HMUmXjigu/LPDUJ6Ka9gEKXuAYUqpXCVXheOf06jGaqTDzYN8oxXE1p45HqXPsddvZYwoJ9jIXFcrNg+ECBXLNsivkY13o+IikfL6OA8ajxQYmtYRhd3/GY+DBfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=aCg0yyIq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso4887403a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 00:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1721028674; x=1721633474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rte73YBhPAaVfekdORAEqN2cWG8+g6DnTMOK+KE3CVI=;
        b=aCg0yyIqvUxEVjHLBe0exLt0PrKDreFYXOMpfTsiPTmX/RN4IoSak/B3lnRcOnhoQG
         aGNsyrAeuEib7fvnBFHa7QXJ8WWFRim0rckqhSQP0zdVIenOJVKlcyyhAaB6250YGlOA
         BXpbawxJ+owXVISyMYATovBplECP9ONAfKkINWeFnxF1aA4Dqvi4ZEfLGZ6txehJAlZl
         VANhg6ADqH3NHouvHZf1kuVkyI1D8P0FbUCINwV0Rw9Q+OqhTKIJc03eD7GI4+TuwFe3
         +b4GaB9IoyBht/VK/lc4CZkRt+ilx47tMAfldvywjcIcUnkHUUTP7P+GALEMi7IJCGdi
         8Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721028674; x=1721633474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rte73YBhPAaVfekdORAEqN2cWG8+g6DnTMOK+KE3CVI=;
        b=r1e3RF7u6QV4+yLRJHqSpTs+nl3XTx+gQ+kcwp7IzNWyAXv2xFx0Dlpp0HYFa0BoQv
         Xd90ARPlYaAQS1zI1FCinj7o0wxazmiUoSK/H54GDC1CThRloeD0vnj8ZfFHsLCyz/0s
         jKc7mpx4Nx/c1F0jlGT++CGr94hjmnTORn9ZkgfgiYdCM8afw+SI0ov6jbfM2Y80Hfph
         MYuo6mDfOQeY61R9zoxFAZ+VojR9zWrCjVtfx6au9PMjPMflZUynP7pEWLoHYoubvs1e
         u1gb9baWpI7JyKyVk4iPSRftDAhJDV/S3gPCXxHMl1XSucXJ0m33q9NdhoR5i/F7R/hd
         qIRw==
X-Forwarded-Encrypted: i=1; AJvYcCUPTUHprA70c84bbneIgxYSW2sA1IKI+OBIj40UhZ9uY6pESKUMxS1nsNnUD2LVrVIn9wqisz9Ni5DKprbA3xKocyiwbqWc6B/MjgY=
X-Gm-Message-State: AOJu0YzcbR5x7Gcqg17DTl5LeoJVtPjuzgARls7MEMYdkZo2g0gBBwaV
	mhpBMdCZn4hapKk4z79UYc5BaXhR7mWp13FyomvZ5LJAz3YWDK/C4V0Ee+Su0Ls=
X-Google-Smtp-Source: AGHT+IHRbJ6yV7v/2MCAadhdZz+/1HuasIfVetVYq4oKDfUM7efr3Ya7KJSdKljBYgL0GzJ4CtJkaA==
X-Received: by 2002:a05:6402:3406:b0:58a:e73f:6edb with SMTP id 4fb4d7f45d1cf-594bcab0181mr11008890a12.40.1721028673765;
        Mon, 15 Jul 2024 00:31:13 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59cf7763236sm1274023a12.12.2024.07.15.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 00:31:13 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 3/5] hwmon: pmbus: ucd9000: Use generic code
Date: Mon, 15 Jul 2024 09:31:00 +0200
Message-ID: <20240715073105.594221-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715073105.594221-1-patrick.rudolph@9elements.com>
References: <20240715073105.594221-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use generic pmbus bus write access delay.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 64 ++---------------------------------
 1 file changed, 2 insertions(+), 62 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index d817c719b90b..5d3d1773bf52 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -67,7 +67,6 @@ struct ucd9000_data {
 	struct gpio_chip gpio;
 #endif
 	struct dentry *debugfs;
-	ktime_t write_time;
 };
 #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
 
@@ -86,63 +85,6 @@ struct ucd9000_debugfs_entry {
  */
 #define UCD90320_WAIT_DELAY_US 500
 
-static inline void ucd90320_wait(const struct ucd9000_data *data)
-{
-	s64 delta = ktime_us_delta(ktime_get(), data->write_time);
-
-	if (delta < UCD90320_WAIT_DELAY_US)
-		udelay(UCD90320_WAIT_DELAY_US - delta);
-}
-
-static int ucd90320_read_word_data(struct i2c_client *client, int page,
-				   int phase, int reg)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct ucd9000_data *data = to_ucd9000_data(info);
-
-	if (reg >= PMBUS_VIRT_BASE)
-		return -ENXIO;
-
-	ucd90320_wait(data);
-	return pmbus_read_word_data(client, page, phase, reg);
-}
-
-static int ucd90320_read_byte_data(struct i2c_client *client, int page, int reg)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct ucd9000_data *data = to_ucd9000_data(info);
-
-	ucd90320_wait(data);
-	return pmbus_read_byte_data(client, page, reg);
-}
-
-static int ucd90320_write_word_data(struct i2c_client *client, int page,
-				    int reg, u16 word)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct ucd9000_data *data = to_ucd9000_data(info);
-	int ret;
-
-	ucd90320_wait(data);
-	ret = pmbus_write_word_data(client, page, reg, word);
-	data->write_time = ktime_get();
-
-	return ret;
-}
-
-static int ucd90320_write_byte(struct i2c_client *client, int page, u8 value)
-{
-	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
-	struct ucd9000_data *data = to_ucd9000_data(info);
-	int ret;
-
-	ucd90320_wait(data);
-	ret = pmbus_write_byte(client, page, value);
-	data->write_time = ktime_get();
-
-	return ret;
-}
-
 static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
 {
 	int fan_config = 0;
@@ -667,10 +609,8 @@ static int ucd9000_probe(struct i2c_client *client)
 		info->func[0] |= PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12
 		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
 	} else if (mid->driver_data == ucd90320) {
-		info->read_byte_data = ucd90320_read_byte_data;
-		info->read_word_data = ucd90320_read_word_data;
-		info->write_byte = ucd90320_write_byte;
-		info->write_word_data = ucd90320_write_word_data;
+		/* Delay SMBus operations after a write */
+		info->write_delay = UCD90320_WAIT_DELAY_US;
 	}
 
 	ucd9000_probe_gpio(client, mid, data);
-- 
2.45.2


