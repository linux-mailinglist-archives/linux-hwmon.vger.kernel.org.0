Return-Path: <linux-hwmon+bounces-2096-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5698C06A1
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 May 2024 23:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7D41C214B4
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 May 2024 21:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A5133401;
	Wed,  8 May 2024 21:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ly4RhmoT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1687F1332A0
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205311; cv=none; b=t4UNNcv+iGwi1VxdoWsNdkENGgmjVOfoiz8BUIxzYSPbWzsM+vINWOuywOp0nmQ7e2VGuxu88BgOis8W+TMvLA3rqXIkum6rU8OSOMbDGOSBzturq2fiHJoY/nrO9z/x0GQBfTi3AfPmEv176QWarTIr7MkdVd/o/KnV+Q6nUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205311; c=relaxed/simple;
	bh=4f5DUf1pONPmn0vooSlEAH1gHVZXc7bMU1Qr2jHYsqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAhjMe4tNJjWTSrBqhmpZbGNiJTfzXL0viwEx3zBx6oc6Bi3c7vHBYegl/PKvSUK45PJPKh5yXoAwA9lmD0E4+MGc8px3pog0m+bxglIRV1W9B414Z67CbONWigc9iaQ1PaZrVq24i8XjO8yTtXLwT80d7CGH0gPjq4IDJ6Zt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ly4RhmoT; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9254E2C011D;
	Thu,  9 May 2024 09:55:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1715205306;
	bh=RIBsKaML1GYlJf0TYhDKn8YLY1NDU1lgKIRGtdKqthc=;
	h=From:To:Cc:Subject:Date:From;
	b=ly4RhmoTOvMCl37AVm/JNVjW/2WAnldu1S981IKHHoFeEob8Yuy3AyU1CE0mYqU7b
	 a5VBp8/tNy/kHw8bPY1oOVUugDy/ArIK7C2on+72+3sZ53C+dWA3QnTEuEt4wp91eh
	 G0NH6NsS5ISZI/awFEUb2x4tnzuD5qUHrAolgS5hKTeAXHB3ULEq9RHcaJg0FQBMLY
	 JboETgWoUL83XirYCi6tVW5TNmqmHxYGFhaWXYmgimAuVV26cnZnsfUzfUkHtlk//8
	 Oj9Wsn0MKDZXGPr1OTt7Amtxhnw26cm9Eq/AFJXVDXJ2XmNLx9xPO/ULyRQ/IwjkUM
	 XFucufBuQvoEg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B663bf4ba0000>; Thu, 09 May 2024 09:55:06 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4920413EDD7;
	Thu,  9 May 2024 09:55:06 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 44A77280483; Thu,  9 May 2024 09:55:06 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/2] hwmon: (adt7475) duty cycle configuration
Date: Thu,  9 May 2024 09:55:02 +1200
Message-ID: <20240508215504.300580-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=MfrPuI/f c=1 sm=1 tr=0 ts=663bf4ba a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=TpHVaj0NuXgA:10 a=IntvOMply_uMlCww3fEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

I have a system that has very over spec'd fans so the amount of noise whe=
n they
run at 100% duty cycle is considerable. We have userspace monitoring tool=
s that
will configure appropriate fan control parameters but there is a bit of a=
 delay
between the kernel loading the driver and the userland tools catching up =
to
configure the fan control. This series adds device properties that allow =
the
PWM duty cycle to be specified via device properties so the PWM duty cycl=
e can
be reduced as soon as possible.

Apologies for sending the quick v2 but the v1 I sent was an earlier local
iteration than what I meant to send out.

Chris Packham (2):
  dt-bindings: hwmon: Document adt7475 PWM initial duty cycle
  hwmon: (adt7475) Add support for configuring initial PWM duty cycle

 .../devicetree/bindings/hwmon/adt7475.yaml    | 27 ++++++++-
 drivers/hwmon/adt7475.c                       | 58 +++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)

--=20
2.43.2


