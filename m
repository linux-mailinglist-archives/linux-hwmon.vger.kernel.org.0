Return-Path: <linux-hwmon+bounces-9259-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC4B3B155
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 Aug 2025 05:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691ED686BC9
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 Aug 2025 03:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFE32264DB;
	Fri, 29 Aug 2025 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="pvzkBOKm"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E13223311
	for <linux-hwmon@vger.kernel.org>; Fri, 29 Aug 2025 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756436726; cv=none; b=QuIUfStU1o6o8hCWnyGneT+PW5MWQqY+8b10fUIv4hLn/7jlT3qFtgXZHrZqActGfKarXsIGQMTSF4OXfAsA1izFTlZ5SHLEmCF8+i0+I9ZNTlTbxccxZbFCj/hJHAUN/WWVcowMThqH9kdHsoJteU2awlaf70Zi++QiJy6ss+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756436726; c=relaxed/simple;
	bh=1++jJYuzNykA5VvnqPYFpQYjkH2amH6zLJAIV6vVzOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlERRgiFAaqdURp38K5y7MKLpvKl0pjE75lQF9SYY8+sUtngshFPxAy811vSRROYKdVtevkLy/KRIsuILCWRTirouylPxNygLkmuaLUjLGX5wbHZR68oBKZB3/a/BCiFwUFC3QcQWu1DFw0dZMFxQc0BGZ4DU0CJZtL6v3/Uj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=pvzkBOKm; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5F5E02C08CC;
	Fri, 29 Aug 2025 15:05:15 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1756436715;
	bh=P9bZIoYjbV+nZf/wxT97YQo37CNMsR7rVL380oiGi3E=;
	h=From:To:Cc:Subject:Date:From;
	b=pvzkBOKmTvDyuN+19u1PvNzwYlFFW9eA7v0BB/2ASHCVjdyvqYqo6MSv5tTuHACK/
	 0bu8nfgZJ5HXxSyq+BqcNuNiBYOYzys8iCF2aHv/XeyYoJ64jZ1tDMgT8eY24GnsKI
	 RG7JWo8mVCddRemC0/Tgl2vgTttCOXJD53nWXPPS/Uni4ogYw1cQKeS7gt6eD5mQNM
	 NVIfHtYY7qBC8JzOzOCuZ2g+Q4iiRwBT79vQZJUVWcZ8yPDhd39YQt+NngK5n356Tg
	 sGDJu9IZxs7JaotTa6BLHf8/u1KdlilDAOGli7NmYiR4utCDRAAY86cvpHekUHX07M
	 268D3/jNl2JmA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68b118eb0000>; Fri, 29 Aug 2025 15:05:15 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1859713EE41;
	Fri, 29 Aug 2025 15:05:15 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 140D3280725; Fri, 29 Aug 2025 15:05:15 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	wenliang202407@163.com,
	jre@pengutronix.de
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 0/4] hwmon: Add support for INA780
Date: Fri, 29 Aug 2025 15:05:08 +1200
Message-ID: <20250829030512.1179998-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Yo+sRJYX c=1 sm=1 tr=0 ts=68b118eb a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=C3wMKfzXq0U6J_64E7oA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This series adds support for the INA780 to the existing ina238.c driver.

v2: https://lore.kernel.org/linux-hwmon/20250808030510.552724-1-chris.pac=
kham@alliedtelesis.co.nz/
v1: https://lore.kernel.org/linux-hwmon/20250806005127.542298-1-chris.pac=
kham@alliedtelesis.co.nz/

One important bit of feedback I've not addressed is this

> Follow-up: I ordered evaluation boards for INA228, INA237, INA238, and =
INA780A.
> I'll want to see support added for current limits on all chips, using a=
 similar
> approach as the one in the ina2xx driver. After all, the shunt voltage =
limits
> are really current limits in disguise. With that and appropriate chip s=
pecific
> parameters the differences between the chips should become relatively m=
inor.
>
> This should also simplify adding support for INA700 which seems similar=
 to INA780A.

I wasn't sure if that meant you were going to look at adding current limi=
ts to
the existing chips and I should wait or if you wanted me to try based on =
the
code. Given our timezone differences I figured I'd send the series anyway=
.
Patch 2 is a bugfix that you might want to pick up sooner.

Chris Packham (4):
  dt-bindings: hwmon: ti,ina2xx: Add INA780 device
  hwmon: (ina238) Correctly clamp temperature
  hwmon: (ina238) Add ina238_config fields
  hwmon: (ina238) Add support for INA780

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   1 +
 Documentation/hwmon/ina238.rst                |  20 ++
 drivers/hwmon/ina238.c                        | 273 ++++++++++++++----
 3 files changed, 238 insertions(+), 56 deletions(-)

--=20
2.51.0


