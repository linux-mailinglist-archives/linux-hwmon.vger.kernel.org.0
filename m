Return-Path: <linux-hwmon+bounces-13669-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Oc+J1cC9Gl29gEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13669-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 03:31:03 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AFC4A9A0C
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 03:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD39A3010754
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 May 2026 01:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CCD29A9E9;
	Fri,  1 May 2026 01:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9wrBmm7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4D19C546
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777599055; cv=none; b=KJmeZLb52pH546LOOBMs/3hhxD6xXQC937li4Jxj5ba9Va8h3oHdwfj7nhA2vEr0YGI4fDZG7gHsbXq8WkUG8CWOK9v8lrd4C3/my8PSTjmrJi8OGf/B2KWTVsWhZHB/463phx+actywLGEA8aFbY6Tu06UnAtlwv3UmE20B8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777599055; c=relaxed/simple;
	bh=2I/2yDgmZOODXBhkIxHPsuuNJbD+rAxj+nnAQ+GVSCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EruOojQZ09WpbTcfhh9eP9DMfSVJke1kjZbLwmrFX2Esq11A6DetvnxGCHDagwLo+z7R9kfZud+6Hf2qN7CF3rwJ8f3yY68jAHJ+PpMpkHATXbpxkH4OburXPEDumRZVNhDznEwygYkxaey2IM/14TC8IudC4am4UNiGevB55zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9wrBmm7; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c7973bbc16dso905414a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777599053; x=1778203853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/n6JYUDzgGxuCjwV/yEzfnH2hleELeafJ0aAhqmVVIU=;
        b=S9wrBmm7kgQ/aYb6TPvWSsbXyuN85paCiJEDntlmDEHoBQXvH9HGJe5CCDOD9OYH9k
         8f4sH+/UB7KCci+VirnGLbgwAUUFdYeJS8s79VQsFLrzq2JJefo+BVyG/C3xQnFvQHoy
         xyGi05Jw7FnfOQn5OZ9kYle+VQ8zfieK9Dr1WKLqXkO1J/Z33wfZQ3TehAjJtLiM4FeZ
         LV6TWXOsXQZjpZdXcpJwhPfR+CzcX6325Qm95P7ad2DEUNpyNQ89HHZOADFsWb8pM9CF
         KpR+bq96yD0xmnSlhl3G+glWbKWyxbzoVOkpHdMxfN8W4p+UATpQ/r1hCH2KDybSwdiY
         wxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777599053; x=1778203853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/n6JYUDzgGxuCjwV/yEzfnH2hleELeafJ0aAhqmVVIU=;
        b=AAdhnNlpTklvWzE4jTWvsRrHNJHW7SFPiSxukQyikOpdfCn/Mj4S191IE/I8cDhQ/z
         UOacs0u2XN+Ua0/TIRpVgfCt32dfpEVYK8PrdTlRVimMCpJ39y+YbK+95/6Nq5otpyPO
         PmW85uZ5j2GCOaw9/LYaC3c5b0NjtIISltFx/sn2/Qxnrw6XwZPHfVRYTFkKoS1Blwdn
         XrUxupa6o8PsjgZ+FPOY8ZPyF/241wea6yaWyEL316EU3+F0Uhs5YPMZR8BIewXLzlc+
         5qwnpcvjxDOhlQrNuHT9av5Fsxf///8r7/HjpMNF6pVSBkrFGiGxZambH5NTs2RTs/kH
         G81g==
X-Gm-Message-State: AOJu0YxPhlNYN40pJgagZWmJnx86nreYKmIc7+ewciBWTjKtzttHsBqa
	+iomWb2QGMtLS5eqnFWc1CLJeXAObrg9CoTzAr/IMiIOihhjDy10mtPN
X-Gm-Gg: AeBDies/eomoK0NGoUY1Eqsb1onZbUZse9WTWRxjStN98LL4yCsYwtviQcJEHB/gJSM
	8rVPcI52dg2NcH3kwn2pd6nx4ETWIhEdY3IUjrmM0Q3oQQT8WW99Zj66vye9R8KtrdAmbXzizCQ
	4rkhADX/unaJ/1Url0Kmi8O1zD1REH9BYNZ6BQbLLgQrApM/0zogtyY0RQg5+e0rjOcXmaRATO8
	7xvgtV4Hfn9v7uNjd/ObH0yjiPOwhysLN2g3DEJCF5haIqQOu0lOSyDGb+zdgjySHhXMl89KokL
	58nve7wjb0NH5uFTVehiYeRhx/SKxx+Y4agGFPtgkN6jY3Y9d34KejNpGrF5ce1t8fJ17IPCkGK
	ukkuflZ6HHpeoDMBt5AQvIfaUoP0q3VKblgtaha9Sy3/VvCa4vAj4EJXPGqzXBYXtLBdbHsE8m+
	+hQQBGMhwL5Pdyfmi6ReSZo7YMK85pW8Zc/uifZb8JOa1YlWJ1378vjgKZwpHOsNi0EgaZbGEP1
	c7OZw==
X-Received: by 2002:a05:6a00:1749:b0:82f:355a:857e with SMTP id d2e1a72fcca58-834fdc801bdmr6395680b3a.47.1777599052531;
        Thu, 30 Apr 2026 18:30:52 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158a8432sm1014523b3a.20.2026.04.30.18.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 18:30:51 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v4 0/3] hwmon: (ads7871) Fix endianness and modernize driver
Date: Fri,  1 May 2026 07:00:40 +0530
Message-ID: <20260501013044.22756-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E5AFC4A9A0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,brighamcampbell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-13669-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tabreztalks@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

This series addresses several issues in the ads7871 driver. It fixes an
architecture-dependent endianness bug in the 16-bit register read logic,
migrates the driver to the modern hwmon_device_register_with_info() API,
and moves the SPI transfer buffer into the driver's private data structure
to ensure DMA safety.

Note: I do not have access to the physical ADS7871 hardware. This
series has been compile-tested only.

Changes in v4:
- Fixed an additional Big-Endian hazard where passing a pointer
  to a 32-bit 'int' for a 1-byte SPI write transmitted the wrong command
  byte. Refactored to use a dedicated 'u8' transmit variable.

Changes in v3:
- Added Patch 1 to fix the pre-existing endianness bug in 16-bit reads,
  originally flagged by Sashiko AI.
- Fixed multiple formatting and alignment issues caught by checkpatch
  --strict, as requested by Guenter Roeck.
- Added "While at it, fix checkpatch violations" to Patch 2 commit message.

Changes in v2:
- Dropped custom mutex in favor of native hwmon core serialization.
- Split API migration and DMA fix into separate, logical patches.
- Corrected output scaling and sign extension to meet hwmon ABI.

Tabrez Ahmed (3):
  hwmon: (ads7871) Fix endianness bug in 16-bit register reads
  hwmon: (ads7871) Convert to hwmon_device_register_with_info
  hwmon: (ads7871) Use DMA-safe buffer for SPI writes

 drivers/hwmon/ads7871.c | 121 +++++++++++++++++++++++-----------------
 1 file changed, 71 insertions(+), 50 deletions(-)

-- 
2.43.0

