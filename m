Return-Path: <linux-hwmon+bounces-15608-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gQfVLabcS2pgbgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15608-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 18:49:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB827137FC
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 18:49:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bJRQNmxd;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15608-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15608-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 501F43036F8C
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A330F433BC5;
	Mon,  6 Jul 2026 16:25:37 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4933BC69C
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 16:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355136; cv=none; b=VmcXFzT6JmUCrXhZJvUeTlogp0aLNM5Y6jcEvLE5UFDC138duqpKZBOWFEePIPOInD3YQgNla7vVpehs+x9O/eUl5xBAqc/ZFoWJLK1tPFP+GHDYsuZo8H/6A9eIltKCDjXEJyp9eQpDVb4OPw1ReoadmUrA24Y7v4VFM9fYE3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355136; c=relaxed/simple;
	bh=+KUVBe36DlwRvJazWxV7Oiad5UiGSEX7yKSxWTBhIpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCp7/+5S2+gCNpDJu8BFNjzLXK+rEOW+aR28ZQrK5XNbUDGxdvHZnL0YfYSLL+GS0719eU5tqHGOqmcRvCG5oZKBouLFAOgP372mUlwMMI1fFS+hc6OemujpY772vshVggleoagTNSj22Ibp8gSRM3rVpVxjaKNP6eYtyLvdDMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJRQNmxd; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1566876a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783355130; x=1783959930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfgReSC75VPZrCd7nNifeyozJvRY+Pip4pWwlMLjiuI=;
        b=bJRQNmxd78bVRZcd5OYIChlC6CGpZU78cMjlPRjtddJFCzoB4Tlkd4XBnteog/QcjG
         4HzNihDNvBLUodnw1bSr86Nm0SBIuvewxiAwWFaLo1yzQ31Ac7l5i/oOPX2CW6TqFlC5
         Gdvk9+zfvR0+dhJ7RtDyTEqrlFxguuzRrgdPVS2A5grNYPoPqObyB9eKrRm34xNv7rdU
         OC5gTAMcMtTn2Z0SE7IfchDdJ7yALo9aajr4dfDDXihefedAd0EvLZfLSWiPCCADDui5
         OVHAyuiQmAsRFzp69CxZiftI8F0Io5fYYutClxi0cNAp67bMB+2PwRAIgjX4HJP79ayj
         9iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355130; x=1783959930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfgReSC75VPZrCd7nNifeyozJvRY+Pip4pWwlMLjiuI=;
        b=rGLRuUgzMQd4xou8lapXDqwkCjxr/Ow9DujB9wUKTI+QD0SnZT2hSI7HAMwQSuoiqz
         DGxc9h4xeBfJws7bMKO+SGYv2nuwlgHUivuiLAI01FpxDjTv4bMNcEMmUgjKd1aZUVqD
         x9etfzMOcggB8yDno5J0AzP7KZTEoK68ivoy3LS6qET2GDloTU8vj4QxgdSLsHq0uoUX
         Et1IASjb4jXNuNWAZ28h+tey96KdYyR+O8YZBQ+20JM2KolE6pVCs9qzV91Yf1Fqb8eA
         sMSkq7QISaaktYYGpspenQ4vdqxJAIH/XJ3SImYMFEjtu10qEu4KQ6AdYZdOD/KCMO4U
         PsBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeSqDssARZAw/ax6G3QSRYo9e/aMBSKyVQMeLPv+vowa3YEN79DASR88NgTLAEYk6bog+9b7pYValinQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfiDJjo/ZDGWpf7u3OncVMyl/vNSPhuNiyM5o5ME420vW0XKl5
	HPEvWKHcmqSNqu6lVfl0S4elnEQbQrnx1kIEK5TbiZLkXAPWvIKL7Is=
X-Gm-Gg: AfdE7clC2/611T31/pF8mFZzZWsp1IGss+8UUmyKACR8YrKFDoDBy8Gt8LNpEjWm6an
	CiKIM4ZktnYULtSl3MfhJkCnraz8+X8dTrsgMZU0zbXnMkF1xzt1DjoCmKlFnNO9GdnL9voasP0
	q/jB8jU622S4mizN999p1bpQ0hS1w+Y1/bm6a4rNVbt9EQRJQ9eZx1n38w4FL/313COdXTZ2OOT
	nFO8s4Rys9w1OAeThsw3pXnvG85ihFIzxAug6B11GfFSoCP8wlAi8O4wdnaGDaFgoVU/9Ri8HyG
	ESEabveTlsSMOBPsURGC6+Fpx/nKF3U1NJH0ZnQD/RvUcbETiEHTgVWSgR4X3alciHy8SZDK7+b
	mlw9ekbB6gghEWIWwCbCjGkw6CJkD6GZKgocgzTC4w+6EII1A2FVJX6/ewf8eCLdf5UjNo7vut/
	MD5CyzHzkteX052sTo95g=
X-Received: by 2002:a17:90a:c2c8:b0:37c:8628:f79e with SMTP id 98e67ed59e1d1-38756ce1500mr1268323a91.16.1783355129573;
        Mon, 06 Jul 2026 09:25:29 -0700 (PDT)
Received: from devubuntu.. ([2402:e280:3e9d:20a:d3b2:4175:fcc0:34c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm19075461eec.26.2026.07.06.09.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:25:29 -0700 (PDT)
From: Animesh Rai <animeshrai853@gmail.com>
To: steve.glendinning@shawell.net,
	linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Animesh Rai <animeshrai853@gmail.com>
Subject: [PATCH] hwmon: emc2103: use min_t() for explicit type in fan target clamp
Date: Mon,  6 Jul 2026 21:55:19 +0530
Message-ID: <20260706162519.6087-1-animeshrai853@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-15608-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:steve.glendinning@shawell.net,m:linux-hwmon@vger.kernel.org,m:linux@roeck-us.net,m:linux-kernel@vger.kernel.org,m:animeshrai853@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[animeshrai853@gmail.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[animeshrai853@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BB827137FC

Using min() with an explicit cast on one operand is fragile. Replace
with min_t(u16, ...) to make the intended comparison type explicit and
avoid implicit type conversion.

Signed-off-by: Animesh Rai <animeshrai853@gmail.com>
---
 drivers/hwmon/emc2103.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 27dc149a3ed9..fbb1b4025eb7 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -348,7 +348,7 @@ static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
 	/* update fan target if high byte is not disabled */
 	if ((data->fan_target & 0x1fe0) != 0x1fe0) {
 		u16 new_target = (data->fan_target * old_div) / new_div;
-		data->fan_target = min(new_target, (u16)0x1fff);
+		data->fan_target = min_t(u16, new_target, 0x1fff);
 		write_fan_target_to_i2c(client, data->fan_target);
 	}
 
-- 
2.43.0


