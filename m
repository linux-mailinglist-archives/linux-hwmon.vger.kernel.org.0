Return-Path: <linux-hwmon+bounces-15160-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GzlcLe9IMWpcgAUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15160-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 15:00:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46A68FB1E
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 15:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vhu6SxaA;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15160-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15160-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 478293046CF0
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D13A364E92;
	Tue, 16 Jun 2026 12:56:56 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6703A35CBD7
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 12:56:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614616; cv=none; b=TVvDVgWWK4CEIQLrXAQGQ3uno8ubUD9Q7sj1w3JmVRps92da3UFSovNTBU2Z8jbHr72lVi5rtIU/0TQ0A5+5v5hEYKece1rziBBlKWuFZsAc+ynVzMz2Jni7Q9FgI9tB8IA63bArnLYY41IyWCfv63vHDf5jLdM2e822H1XjYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614616; c=relaxed/simple;
	bh=YhZ/au6OYPHrCNzZOeVlbkh+UA6Sp7Urxr3ZPdImLLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uY/e4MQ8AlORGBTHeJ5zU+Pdi8Es9E2D4Rb+WlLp6sWNIm1R4mSBA/ebT/G3VRZdbvlfKzFmFB/Wpsa6JlS4t7xvIvXRGI25S8K32H1lHmrjz7Evsx4UxuM2lGpcIbJ/ZMar9zTkyXH02iKe+l0M+ZNuhDzaE3Tza2UByCk//qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vhu6SxaA; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso29583035e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781614613; x=1782219413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLYdtjHVaHHXCXkpZNbJ59fYHRM2DbYW2OHCGDYcwm0=;
        b=Vhu6SxaA1LArNRbOwvl6Ytf1D1DIKIM/XBKTyOWDnpCh3+sZ4+qoj0U56NbR9fzzlS
         jUjV04DyBZOYr4fv+M44t/ktLfCcDLidVVT+HcjO7PzOvu8r5inDnlMlh+TSn1+YeAGU
         RUVPpHzzYVX4o0WG0Fn/SPZZ847W7+VP5+o6uZB3okZvUIFTMKoz/w/66whQKSDtEEi8
         SYDnV93HxyUiCzEdC5pC0zVjslu9jw3T0Ud3Q3cGULR6j8cZACIbnuDj9fAZ3j8p3jxP
         mD61gITBWWlIS7Hgs62hIGEBRu8NRhRjvQIH8u+AOUgtSlZeLnLDjt7z2mzGdCWPJIN7
         EXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614613; x=1782219413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLYdtjHVaHHXCXkpZNbJ59fYHRM2DbYW2OHCGDYcwm0=;
        b=rHL1En80tOi7fZ2jnrdwmOwmyQ6TWN/jGG2R9qv9fLgWDMsRy+pBKfz3phj/fUxz9d
         lLdVrJgfrjUC1+r5T0m0Sva+ecPDq5P7ubclHF2EFqYc1KZJg5WN18LU5lUNrwn8ZJZc
         9icXPRouJgPix3fSvr761J5Ive38xVBiQ41Z4udoLTzCE7iERK25FaDBTDiziSSekcZS
         /y4gWBaDxURB1eTO5emepG+m+7jAjPYJd2Ebd9zagxddkOd6YuunxsZMxT6r9klDDyMy
         jHjQuLfDrPux1njvxp8VEq6IQLWotLML2t/fbxDhMr1SxSxtM8c6Ghwb1qJmTLm44xWC
         kUOw==
X-Gm-Message-State: AOJu0YxwV0EYImrQTOnsCc6+xLsLNakxJk+mSco4UgSwW/aM+Ce583Nh
	GTemjBeKolxL+ItJMwgLm+VqBd/BHN8H4ER/3J4SftG1JGWte3lzpRxH
X-Gm-Gg: Acq92OFIhlhDPXcOPJmDW/RB1n+wNBswCVLUb0L+Pwz7oAT7Bk2CHVASkYAeexXlcUK
	BGYUOrq0f4jrauGP7T64Cm68zeG1ZHAx6E7c/6B5uZWb7Z7S2ZaDuh7xNjWwIT5SANc0Xa36L8V
	LnwLxSVIeYYh/vDSV9j4wG0GSb3ZOuhgmp4jWd37p7K8oqntjRt2IygAzDj4+IE4C2FsYDm1CFN
	dQfXqClVQxOPFhnfHpz6HK4mrhM8ReOdFPzaFHkM7AaOjzv7x8en3vTGaaf7PaIWfaZWCkKv2wZ
	BSteJ3RLkI4MEquwPzYWwIPJ494OUDZHyJxAlj52BRL/IkaG6xilAvebINpyNDYGqCkoAP73jNt
	YrWkThveFU+UDxgfFRNhzgLoE40FYpkQQrqGszVOOSdbFHp83fIux9jDyGACyocxRpdBF59VhxE
	lx/VG5DaBeXIA3kDjiYu9Zm/zhUQoGbJPSOqs8G5pBCA==
X-Received: by 2002:a05:600c:8b81:b0:491:a220:6e48 with SMTP id 5b1f17b1804b1-4922ffbeca3mr51457875e9.32.1781614612709;
        Tue, 16 Jun 2026 05:56:52 -0700 (PDT)
Received: from xz (bba-92-96-19-210.alshamil.net.ae. [92.96.19.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa890d8sm87025495e9.10.2026.06.16.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:56:52 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ximing Zhang <xzhangjr@gmail.com>
Subject: [PATCH] hwmon: (coretemp) Clarify attr_size comment
Date: Tue, 16 Jun 2026 16:56:31 +0400
Message-ID: <20260616125631.35537-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15160-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[xzhangjr@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xzhangjr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xzhangjr@gmail.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C46A68FB1E

The attr_size field stores the number of sysfs attributes created for a
temperature data group. Clarify the comment to describe the field directly.

No functional change intended.

Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
---
 drivers/hwmon/coretemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 6215ea49faaa..d47ba64788e1 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -68,7 +68,7 @@ enum coretemp_attr_index {
  *		This value is passed as "id" field to rdmsr/wrmsr functions.
  * @status_reg: One of IA32_THERM_STATUS or IA32_PACKAGE_THERM_STATUS,
  *		from where the temperature values should be read.
- * @attr_size:  Total number of pre-core attrs displayed in the sysfs.
+ * @attr_size:  Number of sysfs attributes in this temperature data group.
  */
 struct temp_data {
 	int temp;
-- 
2.54.0


