Return-Path: <linux-hwmon+bounces-14829-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y2GeNpodJmrdSQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14829-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 03:40:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32D6521F6
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 03:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foxmail.com header.s=s201512 header.b=tT+0pagI;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14829-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14829-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foxmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5734730022FA
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 01:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870F630DD30;
	Mon,  8 Jun 2026 01:40:30 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280572EA151;
	Mon,  8 Jun 2026 01:40:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882830; cv=none; b=EGxbcUJt36QIo99RPYtLd3xaWTt5kWLm8fmUKTTbsOi9pw1RP4JHC1WJHoasHMf21esTcMKHXtIC/Iv3vNc+ZSaKWPjVFCZ89ofuVLLtig4/wrMW/Cbb5Kl3CR+GuOXU1ndWkUAqnCIu5BcrE5EXNszqZj3anGBP4+7RBBeo3QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882830; c=relaxed/simple;
	bh=AmZhYFkV1rP9Q9S34mUI9V0VGzSYY5siZJq5Bn6XT0s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VDwVFiSbqDBPU8erjwRlM5W69RTubjxckLsDVQJoGVaCHct+bGaZXr25slEg/cQKYh8F4gVQf5AfNiy2AnChlRpPiHUgG+gHXetAM9E8z6uYy2xm77TspsECVDUVeUck/VSEjOnRAv2xPTeM8JRcG0M9nHuEtsQ7B/UR9NrgMsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=tT+0pagI; arc=none smtp.client-ip=162.62.58.211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780882818;
	bh=Yqy4qB1u0I4P95iKdUtsb3m9tiNvC0uW0pKX/UUKySg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tT+0pagICCkadGzPaocKR4nZHPUexQ5qa2QWQKAihuzCMO67vUv9nqfT/an4s0saV
	 SVg4m90WSXFyCBj0YGJ+9dkjSUdZ4WjYwRjR7dYbkpNBxmiFdFBKN9a5h214y4FCw1
	 2JP9kda+Ej3GyDs8NnPOxdYQrN80X5E521VtDWqQ=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id A0E980F7; Mon, 08 Jun 2026 09:40:14 +0800
X-QQ-mid: xmsmtpt1780882817tox3xguju
Message-ID: <tencent_91CA78C59FD4CDC1BB5A4524727B5145430A@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznTspnye4uZArE1dxxmDlZ+Z4Rfy/Kvm2nLVwFzfMaAlen4RWcEb
	 rrpq04LUN3o/tnZuy6aVSJ2bo/gidxAelfIl5mNKx6x6fRFtLkQmW+aFmDbYfgf4RK09zj0nkIJg
	 DeoP/HXtrtRLuazfikX/kKVyiPNRmScq0MOI2DG3Ooe7l96VXwyWWm8R8oEfLJ2w6XUxlt8QWwsm
	 iwWQzPUk3jeMAMNwGAKb27Lcz3CFnTNaWBEiePXIkbHQM2WTM64d05iAeM/82+KUKqY794OejSjo
	 ORBCU/Z4/sRJzP7A3nsI/PyiGp9dE7EJNTvcRvwBPLMBqM8MZk6Sr8D31vnzZgerimRB2AJEPggL
	 u0ykY03ezzsGlzPxq7bgKrUiZ7YP+3BnNJR/2kShWIc7NLmpgtB0Td4JZmuv+q38lhbrHcZnM5FC
	 qixdrItwBWR3MMRdWEcspYYgkUw/IZlzYVTWP/vIe6rIY8Nv835jI0nJNbPMcm8oZu9cLrFs47ow
	 WDHSA6wzrEi4aDKzQDtGweXPRUqQFUN8P346Bo5vfXMKceeVtSbyfnTIJxueKX6RdRQm/iJal/cI
	 6Blgs3P3daPlX6v5NUDbizEpWOmuLPIlyzOYtDoE5kqTtQHWUiQdFmMfPtIxpuY0v7WZLb1vegT4
	 ZTysdkMNRhHdAEM9qASFLrS1obXhr0BNgttGHixiASAQsOswSp510rHlCSL9qPEnGBUfPTo3W243
	 i61Doo3afvhzH/yf4H/GYE+leI3orkrivs1lLP0ouuzUmUMQJ5C1KL1JELtnHa0ur5q7RpGCNjJe
	 f5mYfYaX/m8ngle8gO551gmq6UHkNiifAKjC/+Zx32priaVBeKO4ufZSYtsjqnNS5IkQkV5xJwGi
	 WJl0z5cTK8a2B8YaEUChECzweccLLG87RtcOD+V1lwkxV0OOMZOXP9sKyGgqbDu5xYj4fJi4fnaM
	 +qpz9cGBjcMfKfs8Qt3p1XMrTrDE+Jk7PsdLMqFW42/TsTu1u6ZXNRZSVMKcd9C0sGGnAgAStMFR
	 sumPvd1zt/fRGCsusNMWiwB3VusqlgQ1JKC23c/L6/iWW1zpfdiQpWYXTv4lwmsnn5d9ysNHDmpB
	 akaFjG
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 3/4] hwmon: (gpd-fan): upgrade log level from warn to err for platform device creation failure
Date: Mon,  8 Jun 2026 09:40:12 +0800
X-OQ-MSGID: <190da616208dc6418b53c66d275753b43ee3fcbb.1780880972.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1780880972.git.xiaopei01@kylinos.cn>
References: <cover.1780880972.git.xiaopei01@kylinos.cn>
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
	DMARC_POLICY_ALLOW(-0.50)[foxmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[foxmail.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cryolitia@uniontech.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xiaopei01@kylinos.cn,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[foxmail.com];
	FORGED_SENDER(0.00)[xiaopeitux@foxmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14829-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopeitux@foxmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[foxmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:from_mime,foxmail.com:dkim,qq.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C32D6521F6

From: Pei Xiao <xiaopei01@kylinos.cn>

When platform_create_bundle() fails, the error is fatal and prevents the
driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
a critical failure.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v3:
1.Add v3 tag

changes in v2:
1.No changes.
---
 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 745b3fb9e3a4..1b57a5add934 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -712,7 +712,7 @@ static int __init gpd_fan_init(void)
 							 match, sizeof(*match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
-		pr_warn("Failed to create platform device\n");
+		pr_err("Failed to create platform device\n");
 		return PTR_ERR(gpd_fan_platform_device);
 	}
 
-- 
2.25.1


