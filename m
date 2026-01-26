Return-Path: <linux-hwmon+bounces-11400-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hh9HB4Md2lCbQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-11400-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 26 Jan 2026 07:39:26 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0F84957
	for <lists+linux-hwmon@lfdr.de>; Mon, 26 Jan 2026 07:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D12C3006B60
	for <lists+linux-hwmon@lfdr.de>; Mon, 26 Jan 2026 06:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4677127FD54;
	Mon, 26 Jan 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqTsVfkK"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B091273D75
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409562; cv=none; b=FPfl1YTPBwvk+9mRAq//iJiLmAI/dH838GrddvE3shGlP1OmkmdmeuGXku4gxJti9EHcqSoAC1oWztdTpeFYvqYKMD6NR4qXfOFJGftJUcxp7jVdsghDLRnEEM64JxcDoaCRxkeytdxz5AFqbxyQqVfofYd451V+9LaA2faHdNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409562; c=relaxed/simple;
	bh=w4FKbbbdyeLST9+/T54McLUTVxjz7JwH/U5UkECvGeY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BeZa5jkvpJZ8RKSCROXyBndhPDZWfqX56+NoBKstFWCRRmwRx3weDL9IbanOG1kX4uu3tFu2khT5+xeJzlIoZGGYCXjOvC0XXPGC3BGqTJ1mbVAWRCiTx1DuN2lXxtGNAndukwFUBv9WMzMaBOJjYFev2JTyOmSz2b4o7qeMdd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqTsVfkK; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c633984fbeeso1210444a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jan 2026 22:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769409560; x=1770014360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lq4/Y6D70aJhHJ0yvgNaxWVP+ut3MWhWFczIa+7wPxA=;
        b=JqTsVfkK96LeBRI/BG5IorTLSKzDPemZMrSyuZXvE5lNj8b8PkdmlOKSxwG57G71vX
         GZu4cF7VtNSvgeGW6gwHlR82NcV0+pjh2QqkYOwjZ8ldvatPEPCYbFNyMLsgWDCfOSYz
         BQSyslsZ65y1UzO8DDaFnyqBiPGXfFLvOK5ZcLk4N+FkjB/Em3pI/LhrfKEfPYsOwGwz
         FPjpPADegQsi7nV0z7MauCTZd6hOwfLriq7rORm6sWdTbTHX4LiRfLxZRfJf+KTY1RZg
         +uU24OPuqh2BTtuJ/NMIcKk/nu2RIERpfcanfP7CQMWZb82sJfo1jb3wCUT/5PqrnoaZ
         L3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769409560; x=1770014360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq4/Y6D70aJhHJ0yvgNaxWVP+ut3MWhWFczIa+7wPxA=;
        b=Xq9tSfLsHBM3A7PC+WsKbPlWlWQLW1N06IRhkhFDOaEsyPotD268iifWEacvYoFaml
         xqCmm2WfU7aKyanEJuHF6d4MbxL6DFPvNGfLjI26fvUjHekNzK4XQkE3mBOz22bO9t7R
         b4lSY+3veW/AbEIdsNRLGU4zZkTvgo/Rt11RmRkhO86rNKEgbjkYNAT+gWYNXRYlQbdw
         nmgyuwETxrU/+KTxSeE/Fs2tNGgu02KUfFwMFpXFaXPmpV1zC/vKYKhnKEGZGpAiCjLV
         ZumgSEvaoONa2pKslXoz5r++OJjNA+minDmswQcmoE1wMNcR7M8uZz6n+SoN+4AeTMs3
         bYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzT7NaQGh/VicxDV4PyAfaIMrVV4XsieMxllPDDFVZZlQmBgMUEgiW5WgADjF8LMYetwrBCzm4WEbXAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLeii55ThlLe6sjT/+nk4Dr6czEh4cCj1LLYYQ6A+nzJ6SXXX+
	pEmd1XtKNWdGkSIfO4gF1BuLtt4cnSZtDmicNZ1+RbYxTDrgrgdjtndG
X-Gm-Gg: AZuq6aIrCgj1czqjoNtEN9zFsiKdJIHxVuYRCzD3xIUE2RH+eVas1YK2mK0gs+1w3ma
	OrjEEEJn2llO42aidJAsxqWZq12lEISplzBKs/QWrJgAvFQ6rspZ6EcTdw0pekBKB76z2qCO7aP
	LCeqApbJAG0wxEYdLfCAmTtiPw92mw7d8CAkLo1oiE9Vl2IFx64aLslBJ4t/5tOlHgrODjbrmtH
	g6yA8TZcW4O6gIuH2vaRAi34UzspLZUO214hvNvciHkoBQVHF00/cmIdEkyRiwQLImjrJJR0NfT
	BPKPq6FFPRU+nzfwt8lv6ZWIV6Lrljts/cgTS3G75faOoqrDEuUseOZWzrMuEwIy2cxjsNTsXTw
	Hb/XxI1YYxU7CGNctHfQ0rH26xcL6ml9lDOo99sHQmlWbWNXpslSTSVjz8N6ZcWy+9L+glmGFWw
	PDUEvhn/7A7OLEcGjLDZQFht3NYGF7ng4o+TQlRZ+0FJhVDd0GdmcxdOZ4rC+bdJXdIaANnX/Cm
	PChmC2gRyCKWK46jRJuNZhAlmfqYEw=
X-Received: by 2002:a17:90b:1d88:b0:352:d0cf:9d18 with SMTP id 98e67ed59e1d1-353c45ab2a3mr2972180a91.5.1769409560195;
        Sun, 25 Jan 2026 22:39:20 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536d8b8f7bsm7865000a91.6.2026.01.25.22.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:39:19 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v7 1/2] dt-bindings: hwmon: add STEF48H28
Date: Mon, 26 Jan 2026 14:37:11 +0800
Message-Id: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11400-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hsuyungteng@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19E0F84957
X-Rspamd-Action: no action

Add device tree bindings for the hot-swap controller STEF48H28.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>

---
Changes in v6:
- This device is a simple I2C slave that does not require any custom
properties beyond the standard ones, just need add to trivial-devices schema.

Changes in v6:
- Fix patch formatting issues.

Changes in v5:
- Move the change list into the commit message.

Changes in v4:
- Fix an incorrect datasheet URL and update it to the correct reference.

Changes in v3:
- Move the STEF48H28 Device Tree binding from
  trivial-devices.yaml to pmbus/stef48h28.yaml.

Changes in v2:
- Fix the entry in trivial-devices.yaml by correcting the comment
  and compatible string ordering.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index d0f7dbf15d6f..7ff5b1dbe61c 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -416,6 +416,8 @@ properties:
           - smsc,emc6d103s
             # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - sparkfun,qwiic-joystick
+            # STMicroelectronics Hot-swap controller stef48h28
+          - st,stef48h28
             # Sierra Wireless mangOH Green SPI IoT interface
           - swir,mangoh-iotport-spi
             # Synaptics I2C touchpad
-- 
2.34.1


