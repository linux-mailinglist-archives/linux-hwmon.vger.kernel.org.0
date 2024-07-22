Return-Path: <linux-hwmon+bounces-3209-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8010B93872E
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jul 2024 03:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C62A1F210C0
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jul 2024 01:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56ECDDA8;
	Mon, 22 Jul 2024 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="bzz4opar"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677048801
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 01:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721610520; cv=none; b=gLlmt0dqF0U4kP1uFtbdDvX0eBxHgos83OeDda+PVk7mutacAzrGfcb5EYmzw2t1l9xdpmAc1CyH9WhO0fva1Abhg0TgmYzHY6WDalbyze6e12yHx7yV3xIPh5w/lG8G1DXFJO3TS/r/mer/Bvrrp8cz4FReh/7IpBmFT10kl+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721610520; c=relaxed/simple;
	bh=A6UbHtt51ryxjEQ56nmE97SbAYAIhVAvX6o9Y8W6vR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahHQpdbon82862XS9wi/9hJYO3I2lUnEjdYOnywLF0Lt2ksSU2smlxbeSmUi0iQMrmQBz0C9HGP+VKaanFBSWT2qh888kQp5DyHTLpwFcrEc3y9U26sAt+ASg1adGJFHVlQ1gcLU7qc52grRRtsM/RjBIYPJD8vDBf5MeQ3/lyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=bzz4opar; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8C4272C0E2F;
	Mon, 22 Jul 2024 12:58:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1721609921;
	bh=Mv6CJIE83p5kF2aun4rUSQtQtj6Pahz/PyoQynZs19Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzz4opar1WGUlIAT098yDYdBzrtdj/lTF9LSEoRQJ7084Xf6hzRxygQnjo/BnbYgc
	 dyD/MWksfJ0KRxo+RKiWXHMuZ1pdQEVZ69y29cPCwF6/XiLlMTUrzIODQVab+qR6dR
	 GMTWCEzsSb+MQGItXFesGfRddavtz1ETpdAJUP9i+lJM7+vRPrI1HTldGYk/IvhIYy
	 /Cb8Z4Sh55XZLrSCTBqdKTryUNfTcPEjQi3Wu3L/SX9BW/6Y36f/aNEFa8Ims/QTx+
	 QtL/k28t9hFc60AJZoByD2AhRQ+n7HId/7QT2u1SiKy2ODnjX73LrrIJy95Y8Lsi9d
	 /wQvSMGEAzfwg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B669daec10002>; Mon, 22 Jul 2024 12:58:41 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3E4DC13ED2A;
	Mon, 22 Jul 2024 12:58:41 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3AC3E2808D5; Mon, 22 Jul 2024 12:58:41 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 2/3] dt-bindings: hwmon: adt7475: Deprecate adi,pwm-active-state
Date: Mon, 22 Jul 2024 12:58:24 +1200
Message-ID: <20240722005825.1800403-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722005825.1800403-1-chris.packham@alliedtelesis.co.nz>
References: <20240722005825.1800403-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Gqbh+V1C c=1 sm=1 tr=0 ts=669daec1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=VwQbUJbxAAAA:8 a=A1YWOaG1RMH6ymt1ZYoA:9 a=3ZKOabzyN94A:10 a=TmF2cBh53Nm6oE2QjmZc:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Now that we have fan child nodes that can specify flags for the PWM
outputs we no longer need the adi,pwm-active-state property.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

Notes:
    Changes in v5:
    - Add ack from Rob
    Changes in v4:
    - None
    Changes in v3:
    - New

 Documentation/devicetree/bindings/hwmon/adt7475.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Docum=
entation/devicetree/bindings/hwmon/adt7475.yaml
index df2b5b889e4d..79e8d62fa3b3 100644
--- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
@@ -45,6 +45,7 @@ properties:
       the pwm uses a logic low output for 100% duty cycle. If set to 1 t=
he pwm
       uses a logic high output for 100% duty cycle.
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    deprecated: true
     minItems: 3
     maxItems: 3
     items:
@@ -121,7 +122,6 @@ examples:
         reg =3D <0x2e>;
         adi,bypass-attenuator-in0 =3D <1>;
         adi,bypass-attenuator-in1 =3D <0>;
-        adi,pwm-active-state =3D <1 0 1>;
         adi,pin10-function =3D "smbalert#";
         adi,pin14-function =3D "tach4";
         #pwm-cells =3D <4>;
--=20
2.45.2


