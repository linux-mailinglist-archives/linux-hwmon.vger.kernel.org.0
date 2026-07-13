Return-Path: <linux-hwmon+bounces-15860-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c7fBGQmZVGpPoAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15860-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 09:51:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1234748608
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 09:51:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JeYFemyg;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15860-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15860-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1331D304E409
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 07:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421A0395AF2;
	Mon, 13 Jul 2026 07:46:34 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F503939BD
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 07:46:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928794; cv=none; b=h8ZfVNyMCnZ4hTlkMm5qUlhVZ45bW1NhbkhPCbMu1kbOxlMj+XVXKsN/Bv1GAfxUME4PHqdgvEIyYuvMnNm0T9Hzerb8DpPBEd9bkaf+qmnhQ5m0WDk7qeJN/wKrEj3IJYF++JPnVs9WGfV6cjHXy9dgQyJuqzjJILOyf+NT/Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928794; c=relaxed/simple;
	bh=qNUzWMILPAZO0p4szJmpre9sZOFFrs7wKaz01ErPF64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5pll7kOKVFFLH6eZZkMc20JDv3yxPSNSzX+ujTIdgVTTS//XUjhbTN8WkEnHKGIvXgjTit+fTVZb9uDbz5EMLRDhMA0eD94/t3+aDFOPinzRukXlzAA9gr/5T0SmG5boirM/K0vtScUPzX9CXQTSwpqJfyt1rMWycLZmKUcXqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeYFemyg; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cea3004256so20419545ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928792; x=1784533592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekqLWa6qOCBXZnPyawtHFyqbZUfQTxYgXo+F6hxou6w=;
        b=JeYFemygWih8CNTk/rn7JCSEDqhYr5hIReKF/CVYGudemfie6i/5/ocI1VT5xBdnss
         WFSG43PSUuqSsMExtWsTuI6/HGG+ZmKa1yjtYN+D3fxsMZEkTQA56Q3l8uhRsFurDaDT
         MqTl5MaeVcjZBE4rdLPVhRoBKLBopOgQkFReMibWk7RTDio5Q2lps3sR3GNNVdgFs9Ht
         mRtwfbq6vF/2vmX3iQlBcHzkgcQXaq9vtagxTse2ixEmycZdRtwci1VwXYhju6A8+VGm
         MHb21+WCUyv85EYDVKE16yj0EfOVE5WkSWQmpoTyZ+WpeFOafVuSSIy8UGzPrMH0vdCO
         Miqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928792; x=1784533592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekqLWa6qOCBXZnPyawtHFyqbZUfQTxYgXo+F6hxou6w=;
        b=C25oL3IaGIPyrBoKeg98uxTA2y+MMvMOTmB8cc5XEnrxA/rNbOasewP2k3rvRP7q9j
         3EPIOeDnDRpTRINYk1bJ5uaRzsd1+hms0LfKPGK6gGngV3NPwtI/mPhg2Ue/jilsDek2
         89PfwzAg5WgQ73HZ60ncTWed9qNegvYKEIv1mIRNIgPa6YikEygcEYcVUzxzipf1aNKE
         0on7M3VVZU0cDxmvw1qaPdRxacyO0j0SRnyqPeSQYbS+EOp18Aea4RnnAzmTrO8baKZn
         46+7DVO+x0gHVgxrNYaMIC8g8pwSNqduXkvSoOjGhc3UGerfV00ZXi6KtVJaMIkuV3x/
         6ziw==
X-Forwarded-Encrypted: i=1; AHgh+RpqI2P+W0OAMGqMqoagRCPK/idI+3qssR/i4ogFsl9R3NEA2PRV/hpTdcozkpLmsj5irmAFXBQc7PM00A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBOjLMOd5r5LaiFN/SXgQOB1U4v9NG8/O+jxOaDrwfRp3tIEys
	lotYzSd9BnW2BjuJViFY60vW80vvLTti7AchEjod71DI3NV8cjH8YQi+
X-Gm-Gg: AfdE7cm3Z1+y0yOvYL+RvSRlRvMefH4x2kpFcpuolf1LsVxn+iW2aRgxAxJzjceQV/R
	tjDHwDeSjkK805E5n+AwIUSm9XJcFxD5kbi+II8M/b1F4iaBGaqbFPad9cbKhHDXWLH2xugqkeW
	bDzsSRrCCnPZAn+8eRrWPA7T8NcRdvnaRo5iOZX0xlwhBo0L6rVXXLtipUOrBaD4puh9VrmViVg
	SYFYDsbqOgPIVpJdOVhDQQe/3udaFPM7gpib2xQ466yhczGZInXGZdxFMprqS2ig04Z1KNX0CHx
	C/gkudILVBATFJBcNlYmKQLZQIhAWp0WUWloRlUp48ppReHaFgfoZ5KsFWhgRdc6wfGK5G/sZgV
	y1t7XdiZnHtT1415PMcOil2xc7115DjaQuZK1A7UKDkeRO4NsFkSB5lGff2oLMvTV7BHqU31hwV
	QyhBdi/+GPyh4oc3qwK8NasA==
X-Received: by 2002:a17:902:d988:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2ce9e9ac01emr86979945ad.11.1783928791635;
        Mon, 13 Jul 2026 00:46:31 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:31 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Date: Mon, 13 Jul 2026 15:45:58 +0800
Message-Id: <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15860-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:zaixiang.xu.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:zaixiangxudev@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zaixiangxudev@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1234748608

Add an of_device_id table to support devicetree based instantiation
of the supported sensors.

The devicetree binding models all higher accuracy parts with a
fallback to the base part of their group, so only the two base
compatibles need to be listed. The match data distinguishes the
humidity and temperature parts (SHT3x) from the temperature-only
parts (STS3x), which require different configuration.

Start enum sht3x_chips at 1: with sht3x equal to 0, the OF match
data for the SHT devices would be NULL, causing i2c_get_match_data()
to fall back to i2c_device_id name matching, which fails for
devicetree names. The devices would then only work because the
resulting chip id 0 happens to equal sht3x. Non-zero match data
avoids relying on that coincidence.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index c2f6b73aa7f3..6d47cfd340f8 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -61,7 +61,7 @@ static const unsigned char sht3x_cmd_read_serial_number[]      = { 0x37, 0x80 };
 #define SHT3X_MAX_HUMIDITY     100000
 
 enum sht3x_chips {
-	sht3x,
+	sht3x = 1,
 	sts3x,
 };
 
@@ -939,8 +939,19 @@ static const struct i2c_device_id sht3x_ids[] = {
 
 MODULE_DEVICE_TABLE(i2c, sht3x_ids);
 
+static const struct of_device_id sht3x_of_match[] = {
+	{ .compatible = "sensirion,sht30", .data = (void *)(uintptr_t)sht3x },
+	{ .compatible = "sensirion,sts30", .data = (void *)(uintptr_t)sts3x },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, sht3x_of_match);
+
 static struct i2c_driver sht3x_i2c_driver = {
-	.driver.name = "sht3x",
+	.driver = {
+		.name = "sht3x",
+		.of_match_table = sht3x_of_match,
+	},
 	.probe       = sht3x_probe,
 	.id_table    = sht3x_ids,
 };
-- 
2.34.1


