Return-Path: <linux-hwmon+bounces-4609-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C29AEF50
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Oct 2024 20:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4E81F21F98
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Oct 2024 18:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB23C200C8C;
	Thu, 24 Oct 2024 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aWgMIYIi"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEC5200C91
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793468; cv=none; b=tYSuBhfqCcEgcSRGf0R3rQHCItk8z1Wv5YV83LuLOV43uJ1l7vLUc9jWjP4SIuyyKPbD3WNbXHjpSykwfC34R+gntKWZAJvsYI9C1Hy/hnLU+88ETO1cq57ns3/TbHmzbE/aVrp+jOMpaXVjFA49cNecu3T/hRuUUfm9GZPj+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793468; c=relaxed/simple;
	bh=o/S07rQA5LKC++ibvZP8+btEUdTChzX9PQxEcexB2Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kgs05RuXD/L/8WYuENTGORmOaZLKgjjJcTGaYlWVxkzbJ5K6PBIB5yZE8wjawTFbWHMVSPAfLeHr8+klWilr/4SgbpmYS+e8JwnwqEy7DgYsmwTwey1wfEDy2gH8DEIxtpOYa72zSBV7UPp96maiKQfz2YzUxouwKHxteLQF4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aWgMIYIi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso16645765e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 11:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793464; x=1730398264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYYwPmz/G4AVlx/yjCM3Cevdc1UJIzYaJNcdAVGLoTM=;
        b=aWgMIYIibpNsPlvrGrigVTXokNhKjHEDUBzToWH/HG/ywaoHQrV/vpnCp5OcsK4oRY
         FQc9yKHNz2+oixKPHBsu5rRvV297INq9Ce8NhK3oJD35FRF+Uk/jU2O8psT0vTdkW9fd
         8oq25YspHBMvbGPK+hSSbDMJb8ik0iZgxK81cNHdmqKJ9fq03OQulZbMe+E5i1YGC0O/
         X5gBA5lmVGKt3/81al+dupsBWLJkel0+frrWM0D/Wc1iO0IxEKEs5+U95rdzeVXJm0QR
         Ua9tStY2loDEvatf87kCAhD8xOrJ9GR3Ar9rYoTh+/sSZlRLMXktvHHIATLx0tp6gVtL
         gsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793464; x=1730398264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYYwPmz/G4AVlx/yjCM3Cevdc1UJIzYaJNcdAVGLoTM=;
        b=Sn6+SjuvUN7U6sTv96D9py4KMgvh/ViKVo6/Bn94zhpQ4iaXrruQL7cgtVfTRakhje
         gZeIaPF6XQhHVN8gPsBuoMqQvkCAaYxqi3sQ6QiB/wD3bZCbnusSYZjpBbE0jLHKWRto
         LFbBLfUaB6ckvbTRQW5K7H0eoCzx8E7IunzWht9P4BXe14xfLPLKKX3aL3q1Uu6Q8aOQ
         Labf9Pdu/9nYqFNwO/7CJd+zg/zINd7xXTAikJJ4fU4KhNUsICPBTw4vrERq6Ns6Sk8+
         7iWRkUsuhR4Q1j93MRm/PQlQhQOJyplmNajgknsFCMFXXVdg7AtNt8WvYNPHb9nIRPbk
         v6Aw==
X-Gm-Message-State: AOJu0Yx/TmrVn6Dr/QMQJQigS/ud+50CWXuBhhALuA7N8Z326L4x+pc8
	250biUDAAhKjIDKhYls6jpGyJgGe1YgqfUTovnBDXQla9GAR8q6j+aauRLNpgZE=
X-Google-Smtp-Source: AGHT+IHL2+uVpS3ikDQFYRZLH5E7XzwSPXFjTh7xVgWGIXAPqcMeyY/gkj1vyBdTNK3iZpTgY3cz7g==
X-Received: by 2002:a05:600c:5250:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-4318424f1a4mr81750555e9.32.1729793463911;
        Thu, 24 Oct 2024 11:11:03 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Oct 2024 20:10:35 +0200
Subject: [PATCH v3 1/6] hwmon: (pmbus/core) allow drivers to override
 WRITE_PROTECT
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-tps25990-v3-1-b6a6e9d4b506@baylibre.com>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
In-Reply-To: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=o/S07rQA5LKC++ibvZP8+btEUdTChzX9PQxEcexB2Fc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo2vAVbdImCMdj783Ex0INoW6HwNWBuxtOWSv
 t0iBHLujqCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNrwAKCRDm/A8cN/La
 hUJED/wMYn0ebSATdu5mONHobOwZ3UCQWGqyMmqcDSKDUHGHAciT7QMU8ONAMelna4EsnJ/GdpO
 uD0jcNBGz0eWpBSrChB8ftYONkk7IfVQuSWVC1Q7e3xa0JMK4uv/ojV/6MG9pz30lWBF1jPBBp4
 jlD8kLb9FT48dAnuQSur1Ka+yoDmdoQXioG2/m65B8hk1o43400u/DYwdUg8mHS/pFKctzbiRH7
 uLeJAU9vdI2DsMLWV1N5BqIBWWF5ZdPoydjdBaAnl+1GYpdkfo1PZ+p5x3aDL3j/tpnAg4T+2x2
 nn2ZwF7SYyChXJCNe5B/lz/fwQfO8eyNF+iAu0lxkG15YuiuNUhn+AG2UEQIBe2uZMzzaCDcJqb
 J/YiRV3mb5CjQC/SRFCGR1g0wg9VOxQPLXWFP8XPPYbsoAU5vjbNLArO4HV4NnR8csaEWiQugO8
 T+pFlTEXFcTEVrUvdFyaGfBZnmD6WKMVsZufiuATwFHPx64ppQYGmpRuAX0nERi9dXmHs8FWIou
 yFzraIYnvMWqb8Jv1ivwTTTdPU3ZeDk6E2t+Z+2bNGf8z7jpUxPvA3sSmHwlmxFPbLCS1BL8Bv3
 VjPaAN4AhqAV4DK4LSVZgbzpLK4iEvX9Pbr6Mcis8mvPCkagFuu8VHVAtOTxAeRXI0+2rHxWxdZ
 Za1zLd5j1UEyyWA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Use _pmbus_read_byte_data() rather than calling smbus directly to check
the write protection status. This give a chance to device implementing
write protection differently to report back on the actual write protection
status.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ce7fd4ca9d89b0f0a02e6c99db391a7cfca924a8..085a4dc91d9bad3d2aacdd946b74a094ea9ae458 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2719,9 +2719,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * limit registers need to be disabled.
 	 */
 	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
-		pmbus_wait(client);
-		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
-		pmbus_update_ts(client, false);
+		ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
 
 		if (ret > 0 && (ret & PB_WP_ANY))
 			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;

-- 
2.45.2


