Return-Path: <linux-hwmon+bounces-15713-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rK0tIfnpT2q/qAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15713-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Jul 2026 20:35:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBE734522
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Jul 2026 20:35:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IQsb5vKX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15713-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15713-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43DBE3016D26
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jul 2026 18:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886E93B5E07;
	Thu,  9 Jul 2026 18:35:35 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF2C386423
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 18:35:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622135; cv=none; b=JQccL1T5JLdKrsU1MsUaLhWUy3GpN4Qo+Wb0uXJEg8c+/cpKDZK4tFJxWX8Lpvtz3ehYk4eXZ+F+NXrix7Pifw9oedT9IJL5uLnbG5NRrxK53I4H8XN+3ezkuqRvDL9FfI4f79H0uBMS0uRPr5zWTx/BD0LYj3WPq6oOwgXusIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622135; c=relaxed/simple;
	bh=06EJBR2VGIgfPzSMEyckssJZZcQUrXf7JKrWrMnHnwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UMIKXWk6PeYYzdoXALyN3OUuzAyisS2Uo/XTTYeZw3+OaEbOyd8PnKZi7/vLc9Cidq/P1Rg57b2QR665VQFzxUzXq+hHu359r7LTpdzA50tEGDLmASkJqy845JD+H9/nn4EP8xzyLdkwK/c9bgG1BCaneZZz2g7dhHq4qK9Roj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQsb5vKX; arc=none smtp.client-ip=209.85.215.178
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so93291a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622134; x=1784226934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w2jBu7V/k7GdPmjfNJKTJo+wH6Ea8ONQzWuEPVDJJP4=;
        b=IQsb5vKXykq/ZE4tZL8+YQfRsESAPHQSgyoWZr6Y5fikrHy1K1m2EesmGFoh1TgqE4
         dV7vBqJrplHWQxqIVuzWHAd9TT3y/jWvzfJIA38zwHKmdvji9l4uaarKxztWj4fN9Lmb
         R9k5dW5dHsPtw7WVC/ZFsW4dI8LuWTRPbwf3Kexwj+q9ucJkEhbtneIlhZTOQxmIeMNG
         iKWP+DF0BZXEBo6nfquW0A0X/+nYgxkmELGdEb93pyZDo46cqtYYAeZWyN5S8Rch8E64
         FQpAytB4TyLBBzS+frfqvWNDyn/7Z41k5duOjPRe3WSHw7IN7mPD3x4LaFfqG2HCLpXq
         mugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622134; x=1784226934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w2jBu7V/k7GdPmjfNJKTJo+wH6Ea8ONQzWuEPVDJJP4=;
        b=sIq9f5NKS2216FUBVuxXHz7nvCzyM9YFocpCx1Hdl+jHHr74klDr2HNfrDouYtklyU
         /XMBgvJj+XWMFw+K2pWB3saqHGQWloDceOoJkTgRifsPTXMHuXBlVckrlbUBX5DoLBZf
         xDWgjJ6byvGmyM8II0yOEdsIQtUPaW8J6Dvei19833sXvg5XpJKw593WFi7ZmQArvrp7
         5QHlOiCNTQyjBh4LvfY3y7e1KwKGQjVvptNq3n9vKeOhSZQfG0FZfIN+1htlruD25G6k
         NWNrV+XNOt2ae/zNyJWLUtVRMRrJHQ4FHXo6z1FHzX39D7QSUMwKdGXAO+/vw0uPuHEl
         W7oA==
X-Gm-Message-State: AOJu0Yx0VbtN5wmJeBgOKB0AQD1+U8AVl711L+76zDSmHSpv1aL5xVOh
	EP6lHZjYaLswkFIjqEV4EceoVg2SxqrJEL57AW0xx5cwLQEUa3W0YEmO
X-Gm-Gg: AfdE7cl3N6EOnwGcAz0ZALPe88yXM4J+kThNc1mRSY/RGNivj1vbVL/40s4EzeBd1f5
	cka6koT6AKYoCZIbf7aW/X+RmeRiS44AemRWleIBpP9A/ZDN1QGDYLXLmIVYzEyGDVEHM4NT0YS
	pILPP5rIwQII2cPWBeH1zOvtQ449XOF+loiIHUeaJAKlzYiGSeH3p+EjTcdQp+kjJHpyXQgBVLi
	rbT8pn16cJic/8pCkWKCva+DRwOZH3Ir/pujZ3PpC6ITKNRRIqLzLMFbgTuWibmfdGgltt/v75+
	vPbi0JoEB1pnysACYmwXn6PD5H8nVA6BXntPC7PJS7zgu4SobESr7wlBnhwTiKcXARRsOwiGhUZ
	QFaQOY9J3IDJ0p1aMS4Ut/eVoiUfoEDe7gdHUa+L77pDFZYx6d4UDVVmGgFJovNysXQFst14j5+
	YJTEf1XewoIdP6ITccTvneD5HbZPS0vJo=
X-Received: by 2002:a05:6a21:4612:b0:3bf:c126:baf2 with SMTP id adf61e73a8af0-3c0bd16fa1amr10034668637.47.1783622133599;
        Thu, 09 Jul 2026 11:35:33 -0700 (PDT)
Received: from Tilu.localdomain ([60.254.103.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm40085716c88.7.2026.07.09.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:35:33 -0700 (PDT)
From: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>
To: sergiomelas@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for Lenovo LOQ 15IAX9
Date: Fri, 10 Jul 2026 00:05:00 +0530
Message-ID: <20260709183500.13761-1-sarbajitsarkar16108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-15713-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[sarbajitsarkar16108@gmail.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sergiomelas@gmail.com,m:linux-hwmon@vger.kernel.org,m:sarbajitsarkar16108@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarbajitsarkar16108@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36CBE734522

Add the Lenovo LOQ 15IAX9 product family to the yogafan dmi_system_id
table. Unlike the Legion series, ACPI table extraction reveals this LOQ
utilizes an 8-bit EC architecture with a 100x multiplier, but maintains
a dual-fan setup via the \_SB.PC00.LPCB.EC0.FA1S and FA2S paths.

A new loq_15iax9_8bit_dual_cfg structure was added to properly map these
hardware registers and calculate RPMs correctly while avoiding path
conflicts with AMD-based LOQ variants.

Signed-off-by: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>
---
 drivers/hwmon/yogafan.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 605cc92..0a41b86 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -71,6 +71,12 @@ static const struct yogafan_config legion_16bit_dual_cfg = {
 	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
 };
 
+static const struct yogafan_config loq_15iax9_8bit_dual_cfg = {
+	.multiplier = 100,
+	.fan_count = 2,
+	.paths = { "\\_SB.PC00.LPCB.EC0.FA1S", "\\_SB.PC00.LPCB.EC0.FA2S" }
+};
+
 static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
 {
 	ktime_t now = ktime_get_boottime();
@@ -194,6 +200,14 @@ static const struct dmi_system_id yogafan_quirks[] = {
 		},
 		.driver_data = (void *)&ideapad_8bit_fan0_cfg,
 	},
+	{
+		.ident = "Lenovo LOQ 15IAX9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ 15IAX9"),
+		},
+		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, yogafan_quirks);
-- 
2.55.0


