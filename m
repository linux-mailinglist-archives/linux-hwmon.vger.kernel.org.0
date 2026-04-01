Return-Path: <linux-hwmon+bounces-12976-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BnEFLWHzGlXTgYAu9opvQ
	(envelope-from <linux-hwmon+bounces-12976-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Apr 2026 04:49:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6237402D
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Apr 2026 04:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25C0A309F796
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Apr 2026 02:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D7A371068;
	Wed,  1 Apr 2026 02:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="PWeiTiQE"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D936F413
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011399; cv=none; b=RwuRQcchW1nXKMf9+/mPDWgvnhs0TLONmhd+LxWBDkTpOMWPmjdl8qVSFk+3kZtUTZNj8ba7/yVBkCKrbxU2LbFkJx/G3cBN8c8B097jivuvL75jDmNAHA+R1zF3aI01NbSX5U8TvUX4o3QHphwBxBxkPHVrfWpQrwE5HJShAE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011399; c=relaxed/simple;
	bh=fGwz0GHXzRDxEnfbge/u5CFlJKG/w9TUvuItYHvn7GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBVa9ehrI1aQpqlumFBA1H0XEn4YHk0xfyIW+unZQazZrn3FpdeLHPXrVxcxabYddqW2etJRNLrFlHhQi70O7eeANLKOut1AEX0/XDrpqYzgI16I/Aeeu+IwyLWuq51q5Xmyr5nFSR3IaQIEDgraRJdDS2XuRhgPJ0rCZdb6PdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=PWeiTiQE; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CCBB22C046F;
	Wed,  1 Apr 2026 15:42:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1775011376;
	bh=YFHnOpD3OIp6daU6D2uz3JcBHiWAJCFU8QhF6kEpoWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWeiTiQEo5yCKk4Tdsno/NNUObfMsX2R0/Jvwql/oAeqLngLyGSQkT9P+FkVgFFk0
	 38OhXYN2yVfpFPrWN9Mx2tXdvjHVvXGLlpHILDL88oqIsZ6h88VNHhM32oKs+nOp46
	 rv1BqDs2CM3rvEpBlw8RIqANmHVVTPs1kGECXHEkCOJrQEaa2SDEawpQQdmkIIKZso
	 ugDXgeHqiqSnI4taGUZimpfs3yFzt6rI9HleDgyseXVTq090PWDmSyEGRF5erJo1WR
	 7PgmsvKE2xPVAA/+n5gxOdAqfhk2MeLKynVrON70G/IzufYtWDZ2PwR21zzVmJTnQM
	 BQMX9cknQA2Dw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69cc86300000>; Wed, 01 Apr 2026 15:42:56 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.12])
	by pat.atlnz.lc (Postfix) with ESMTP id A134213EE36;
	Wed,  1 Apr 2026 15:42:56 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9E6C628153E; Wed,  1 Apr 2026 15:42:56 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Date: Wed,  1 Apr 2026 15:42:11 +1300
Message-ID: <20260401024214.804237-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401024214.804237-1-chris.packham@alliedtelesis.co.nz>
References: <20260401024214.804237-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=EcprQ+mC c=1 sm=1 tr=0 ts=69cc8630 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=A5OVakUREuEA:10 a=jfe4B9wozX6hrU8P5YcA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[chris.packham@alliedtelesis.co.nz,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12976-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alliedtelesis.co.nz:dkim,alliedtelesis.co.nz:email,alliedtelesis.co.nz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AD6237402D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the compatible string for the sony,aps-379. This is a simple PMBus
(I2C) device that requires no additional attributes.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..0a559beff878 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -430,6 +430,8 @@ properties:
           - smsc,emc6d103s
             # Socionext Uniphier SMP control registers
           - socionext,uniphier-smpctrl
+            # Sony APS-379 Power Supply
+          - sony,aps-379
             # SparkFun Qwiic Joystick (COM-15168) with i2c interface
           - sparkfun,qwiic-joystick
             # STMicroelectronics Hot-swap controller stef48h28
--=20
2.53.0


