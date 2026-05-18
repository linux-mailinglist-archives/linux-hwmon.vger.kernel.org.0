Return-Path: <linux-hwmon+bounces-14260-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABNpKbm/Cmrb7AQAu9opvQ
	(envelope-from <linux-hwmon+bounces-14260-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 09:28:57 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 132FA567853
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 09:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A271C303F2B6
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 07:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C8C3D25CC;
	Mon, 18 May 2026 07:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGucG+po"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EF03DE428
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 07:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089032; cv=none; b=tdwjEq3gg1gn6pg0z/1mJ7EhgiMFz+BTVtLd/eOnACOifz4tA52BlENK1DAiqk6RseFbesGPILueWJP4inxrc+LqCtWmYXaOgPlQ2Izb79LUAJHSS547aHa1izvNi4DYziQkwspMoF8qwYvdwWWqxc6wB/i4Dl8E4XR5lmSSGpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089032; c=relaxed/simple;
	bh=LeaAFQbEZHnFRfSvNhm2mK5q8vuJQ94y05u+EhS6y9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BvqAh1k5Y83Kc6AtpzsVL5/vSw/EXATonXrjmf0h26tLrFnopEr+bBwPlDX0His02mzS4iJw9Wm8GatxfEEVWCxqoquAINWuN3vvu/R0yG82+yyFfks1619y067gPiGUQwuxkb3mxdNRk4GVEB/SD/yBotNWe8JnEIVhpbglMss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGucG+po; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe62837baso954661f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779089029; x=1779693829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt+ufBAZDF7eEFBZJ7u9nZ3pKJ7IfsZ6SjoRHeU26Z0=;
        b=EGucG+poeVLiKO3HUcrE0G9awea7pH2GMo4LK6rdD23kFMnYEDN7LZt+TNVV+afYmF
         3oz/n8PKXxkIwDPdOsn9iFl1HBKzatGYRq3S1nz9NrXyz29Ipjnfwi7oXeJJajQkn1aj
         5f1AQUPLb8YlguCOrE5IuLUih6P6M7qzLSdq8jF5Zqa0D8Zdi39sjzr+IotQblLjDXfb
         g0XOcFj97lP4mUya//zPjq/PeC1VSMu7UbWnDwCxq75u4C3GOqm16Cdbf10HzUF032t0
         LD7zQfGRPSynwFZgwcJaj69u6G/kk2lR/JOaVQYskuwIPODcDbkcCRlLjOGRNYDd7dBk
         C85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089029; x=1779693829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt+ufBAZDF7eEFBZJ7u9nZ3pKJ7IfsZ6SjoRHeU26Z0=;
        b=B/yfgz5PC+go+7h55g3AX1AUEiNj2c3ZCgqFFK6UYMjAuF1Ci5Y8zCq66QWXTTyRsI
         gvXtxp1pKt7D9bfMG9+/R7MIenPQ0YxpnCr2YZ3xgIKwg+T+Z1egGyv+DjMtQE1Di37w
         PhbFeCT1my+vDS4rLGFqyFzJmcGjfM7Hgu/PhVcWv9pt5sKjD3auS2kt9aVnJUyhH3q1
         oCN87YkORLSAqZlDoR+gCOlJJgFk9gv2PUVBcJu7eaZgZRV8cJ5rZqnbuhx2X3g0CCme
         hc/Fa3ragVPfw/C2Rnk26kKCsB0rslwbRKN4uxKX/RTd4KWQ0F54KnaQxqemQVxPQDWp
         jOiA==
X-Forwarded-Encrypted: i=1; AFNElJ8V8cRTrSeBqSeunsK7EgZgFQiF9LLe+ru34BR84+tFFZAPVRwdz7lpwW/I6GGdGhF8go1hM2NDP0RqJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQBrwNHpD63FkF5Kxm0m76JXIZcpxq9KmeJk4FIjGLuEN0Sz2U
	iMf/FJjgujbe3AmB9g8tFEBd6E9YjUBmcaMZVZx6OodGuiRnYxx2m3cq
X-Gm-Gg: Acq92OEMwiypH37z8D8GHDyoqjRE9FNaaSqmv8EwN4MBB6W/Eo8B65hm3L0VpJr7k2s
	X3MnfWrvaZM3DKpFYsZDSO+AQ1iRFaYSwon54pD8eootbZ9bNrFCx/ccFrIvxDsU8CZZrmRZMLw
	VHgSjz1UId5kI5Rth1HSV9NKfcHPKHTvSxqIrHZLQC2gWE93SEQWyeEHK/lLwYrbeoaC1L2TiL0
	JzrGQ+qarlMqR8sz5aTCjvaS36Ofye/bN835Ql+RQnliASg0rgm+t8ydnYVud+BGx4lFN74ddDU
	uPkgcmxYKOJzTl5jvSP8wlsX8Rf4U6icvdN0V21aHZOqPlOXLIiJcKwVnBAfw8ueN5rqo0HsBWo
	ky1tVGxLB/Eusev1PrZTyusOsy198P40f6oVnnG8IP0spXCaOuo972JiftC5k7m1H553LYDqe6q
	vf7Srbxv+qrQGoNlK65j9vyNBtSF1LXkwH7QB9FXfMA+MTjQ9dY/gi4to4Nk7PtqnWWH6R+JXc
X-Received: by 2002:a05:600d:8496:20b0:48f:f7cc:f6f5 with SMTP id 5b1f17b1804b1-48ff7ccf76bmr79038445e9.31.1779089028908;
        Mon, 18 May 2026 00:23:48 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm77395795e9.19.2026.05.18.00.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:23:48 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm75) Add explicit header include
Date: Mon, 18 May 2026 10:23:37 +0300
Message-ID: <20260518072337.4918-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 132FA567853
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14260-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[flaviunistor@gmail.com,linux-hwmon@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Since device_property_read_string() is used in the probe function add
explicit include for linux/mod_devicetable.h and linux/property.h rather
than having implicit inclusions. Header linux/of.h can be removed and
also of_match_ptr() improving non-Device Tree compatibility of the driver.
Remove __maybe_unuse because it is not needed anymore.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Remove __maybe_unuse and reduce line breaks suggested by Guenter Roeck.
- Link to v1: https://lore.kernel.org/all/20260516075708.6682-1-flaviu.nistor@gmail.com/

 drivers/hwmon/lm75.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 1e8af5805f2f..104149a03bad 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -14,7 +14,8 @@
 #include <linux/i3c/device.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/util_macros.h>
 #include <linux/regulator/consumer.h>
@@ -899,7 +900,7 @@ static int lm75_i3c_probe(struct i3c_device *i3cdev)
 	return lm75_generic_probe(dev, id_data->name, id_data->type, 0, regmap);
 }
 
-static const struct of_device_id __maybe_unused lm75_of_match[] = {
+static const struct of_device_id lm75_of_match[] = {
 	{
 		.compatible = "adi,adt75",
 		.data = (void *)adt75
@@ -1152,7 +1153,7 @@ static struct i2c_driver lm75_i2c_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm75",
-		.of_match_table = of_match_ptr(lm75_of_match),
+		.of_match_table = lm75_of_match,
 		.pm	= LM75_DEV_PM_OPS,
 	},
 	.probe		= lm75_i2c_probe,
-- 
2.34.1


