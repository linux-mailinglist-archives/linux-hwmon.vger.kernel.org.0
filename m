Return-Path: <linux-hwmon+bounces-15422-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GyNhBfrEQmrQBAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15422-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:18:18 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B76DE3FF
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CG5WBuvz;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15422-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15422-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D12C230095D2
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 19:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7328D3B38BE;
	Mon, 29 Jun 2026 19:17:52 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1435B631
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:17:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760672; cv=none; b=cdTxsyffnLaD6RbFIrJjO+jS/r8VroRsFbeql7yasxMRQfdRtUcHpVWyx1Y7jtmlN2FHuJNmmFntl6t6bcGhxwF1zgKuSdqPwuVXIl8OZ2UMwthJw/e5Fxg4ylcvcl95UkLH7jAqYcqK9bGYkICEuIgE5DKi4MXFsJApAy56KeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760672; c=relaxed/simple;
	bh=CZylIcWn27L68MlVFpHOzPw+3g5OCtM2dDKHRd6Pmhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ke/VGalRM7eCK/2Uk9KjZRnsLxUE41ZDNi+hErbM8BrP2ZwCiCltE7GSJGVY6jBLAh4hb8O4V52VeG+cZh5RrgCmdXlIDVeefaov9X/s/x6No8v5wgibtjWipqImN0plak8pV9ZHS0VWh5luOAXfnxMiIYS3xC2qGQOBY3TVbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CG5WBuvz; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47122683cf3so1202975f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 12:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782760668; x=1783365468; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CH+iuavhzCl31XtXX1knhfjNMAVOS2hmiFPE+b/1Lsw=;
        b=CG5WBuvz7eUJAeTCaqbjb2USK8+SGz5bPFKn5AfIysLueqQb7/KNyxrm4rdoocpP/s
         en4pMQTwtdxuhaBDULhM2evWMmz1Z+6w5ravfu+wAA/+q+smPf1J2p6vNzTRKsEvSkGt
         NmSDvTPnRH++NtQ2JMyhRHSK7XKRJOm0wDSXRztYDZoW/fKPc1qgFkYRVN9phXDbHUXe
         rPEhc+2U0ASGXlXw7AeNGd1kfWh8s/bXJbM7P9CTb+pUx0ah0G1WdaKtJl3PqN7Yxn7J
         War+C5zDoHelbnF6YMUM3QiTPbcfC/f07BxnrTZymfzmrzGp/EHbCmjuZHf7x9U2ur+g
         oBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782760668; x=1783365468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH+iuavhzCl31XtXX1knhfjNMAVOS2hmiFPE+b/1Lsw=;
        b=MbMfnh8pOt9DYVUPc2+gI7kg4qSLt2r9TKh1yqmNCWMDB+cqmZd74rkYO5/5YRBVn4
         0oQtDn0PjMY16RxwBvl7BamO0MmWx8tLSSiNVD2nyvBvM68aMqY/yTqwpDQRXGDoetT2
         oFpJ6Ct2BFXPH6XmdNCcclNgg149kyzlx6wB8/5gHDW3PS+ndIRmoNwqqBKnre342B3T
         5XvhRFVNgk/pRu4y3+WBjGy9838076x6005K79iFnYjFYteHTrCIlR+EVhwAsDmv0cEb
         7cyH5PVm33gmPGSKsBLROnz3pIfhdtMDgMnw7D9TXYEZ9kdqNmi/ojTJqnEpHAI2wexO
         Z45Q==
X-Gm-Message-State: AOJu0YzwtQDau1qbXiXNE5e511xFickTUcovPvzg58gfXeycdPYkTzLH
	eg9VKFgnelDJZPGzJhJfPUQh1wx9WQYBZ1kBGYp4jPyePLEMQv1CRsg8Iq4efQ==
X-Gm-Gg: AfdE7cmFXez9BotrcGsFc6Nm9U4uVCwHu7zwVOw4CVQ9als/NgMmLpwY5XzxaAjs2hm
	HLkGaowXxu/NehpuZFxFJ1kRBW6fY+PtPk5C/ETwmv01j2J3WHlfbgGsVIZbY5bplA33p6i3Jib
	SiPsPcQJSnBw4zAiY+GClIFMXyENl6UfunsQkcoRZzlaGNjs3H4dy2iHKtU0djLG1R0KGJ8tdGV
	shqnjpxry/kch+VQ/JhvyNzqNKrPMgxGntSQIMT0PwRcNHb5gxAJzxiXSczEFPypRgANGqHQ56N
	zK9WAt6X5hbcRugfVt7pYj04sHW5XZuQT+TOlDkKgQHEX36uhuACw0nnb6PqFPs1SCNEQOeuoE7
	EF/3nMcbBgAjWhv2P4pIUelR2XUh3A7iqgkDybsoAKYz0iiv/MRIxcqCvDRjQPhas7ialsq8Z7M
	pX3y7P9vM4o+FCHPUPK9UNzAxNp5vrkWeZunVf/1YCGMAyA/id2vQMs6yUS4bei1xDnXHXhOOyz
	meAQNUn04OYR7OJ9c32SDGXTWVoGVTSFJm35RnYadT4+pYFzXvoSCqyVzichg2OfN+WU45IEebM
	RYM9fiy0bQ==
X-Received: by 2002:a05:6000:460d:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-475507ddd71mr871993f8f.3.1782760667911;
        Mon, 29 Jun 2026 12:17:47 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cdccsm259568f8f.24.2026.06.29.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:17:47 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 0/3] hwmon: (various) add missing `select REGMAP` to
 Kconfig
Date: Mon, 29 Jun 2026 21:17:38 +0200
Message-Id: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBswK8OuEi1ExxoCE4UIpLsnL
 d/i/wqFMlOBRVTIdHPhKzb0nQB32LgTsm8GJZWWWhm03uPprhh4R0+pYG9nLQcTplEaaFnKFPj
 5l+v2vh+GCetaYgAAAA==
X-Change-ID: 20260629-add-kconfig-deps-1a76039f5409
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782760667; l=872;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=CZylIcWn27L68MlVFpHOzPw+3g5OCtM2dDKHRd6Pmhg=;
 b=fJCaRP12TPACNq8PfkVp10HKykP4OoU1/PrGyUvkczDlSND00BPHkhebyN75Tj58oGKUw8XU9
 +0uMykZpudYA0VOOsI8UZcWpXv6Wn2PjOFfH7X93cgc5gtkJfjDECfB
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-15422-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:tzungbi@kernel.org,m:alexandru.tachici@analog.com,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joshua.crofts1@gmail.com,m:stable@vger.kernel.org,m:joshuacrofts1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[joshuacrofts1@gmail.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C7B76DE3FF

This series adds missing `select REGMAP` and `select REGMAP_I2C` to the
MAX6679/MAX1619/LTC2992 Kconfig entries. Without these, some builds may
result in a failure.

Steps to reproduce build failure:
1. Run `make allnoconfig`.
2. Run `make menuconfig` and select I2C, hwmon and any of said drivers.
3. Run `make .` and make will end with regmap-related errors.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Joshua Crofts (3):
      hwmon: (max1619) add missing 'select REGMAP' to Kconfig
      hwmon: (ltc2992) add missing 'select REGMAP_I2C' to Kconfig
      hwmon: (max6679) add missing 'select REGMAP_I2C' to Kconfig

 drivers/hwmon/Kconfig | 3 +++
 1 file changed, 3 insertions(+)
---
base-commit: 446bf1ecbaeceb72d85553ce0ac0e6afc03ec5ca
change-id: 20260629-add-kconfig-deps-1a76039f5409

Best regards,
-- 
Kind regards

CJD


