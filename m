Return-Path: <linux-hwmon+bounces-13346-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOBYNZ3+4mkgBQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13346-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 05:46:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48941FDD2
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 05:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BC0D3006B5D
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 03:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4292236EE;
	Sat, 18 Apr 2026 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNGZM2Y2"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A281917F0
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 03:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776483993; cv=none; b=ujYvDbcLVt3ZZkvmv+TilOiovBYMsg6fDCGiTunSfLoecTGNcSkAPwLZu338nOfKtk1v5baS3JuUq/LXZNzzVGDOqg/jUKgXofZTsL+I9PP1mz+YXuJIGAKhnrNColZIIhEiw61Ei1RSDlz8BI/Od7XPHvnx8mD7L6W6hoO5MFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776483993; c=relaxed/simple;
	bh=mOVNQ5CBl96THq01qdC/kBlx9aK/muQqKsQcHkjfUpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCNTgKZhG2Qy2MVBmX4zQtrzb1z7jFM4cL0qfk1iCR3LXKzssZy9OI73fcUTAbcUjTwJfssMkwD7t86cbCinO3uUL9NfSWEGasiTq+sP3CNu7geADoBcwFtODWF9Jne9vyGxiiieKYue9FyExnUEAR8/ilCapx/YfZVz5zv+b5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNGZM2Y2; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso765761b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 20:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776483992; x=1777088792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lA3vpovy9PX6td0nEMgnoxug44S4JB3dgtcUcALlzoA=;
        b=bNGZM2Y2IaMJN4IUyM/pCVokRJIYw7J9iC7aJbkmkXkc1i9ztlcUlm5gSSscVz8EMV
         KKF+P+AkOH5ITF5ZxWsZxMeqbaIYKRkwm6J3Lg0XgBq/VFQuwDBpvPTbszX8UQU6e3Li
         oc26Zjbh/fqFxLH+c+K9WB7kzeBTSOcwQ8FG4TOIi1fZG1q+jNSq6WbPrg8X/wKOADTv
         o/fHOrJb01+g4Gq+9IhGxhflJUzI+TRzycq2c5NcGCMu/S95KEBIVzMWGzq9Wq0esEgu
         1sDiIzj9SyelTx4CC7UohJsvtIpi7b8ut8yAFKYQtgMWgGCM7/osstv9EecxLgU2L+bR
         jgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776483992; x=1777088792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA3vpovy9PX6td0nEMgnoxug44S4JB3dgtcUcALlzoA=;
        b=cOy89zRhID2PSegyCpjLetmPU576iHKXEDwykzpSEOrj+3qbLYFbYxA5wyRV9IxN+r
         l37DpAvIV1v0zN6UI/zsCiE7kfOFYTqJkk2SXGmRZUFpUoG/PHD2n4c/g278Sv1eaIx9
         KJJi3GaISxm+0tfa6nhAB5tJRwzYs8bScvMlPe1dRQNmVDZtHhGHZ/ZUW9CB2jlfR9Z2
         XsG6S0vT7EYniIGHhOk5Pee4C3/eepq546OmGoKMHMuacYcPneDAzVaAW9JW17bYZexX
         ssZquE1X39sfp7mV90ymgltIHy1X3K4HYez1GGaG4RsFjtymiBPEx84ndh01XJOIEEGk
         v43w==
X-Gm-Message-State: AOJu0Yz6N7ncuVZJ8rY+bUe9cAPXFjClK/iv9W2NTQ8EzL8RgNYCs70k
	imwRJraKSxNJgAByFq14V61E4tAtqMn0t2TIOgZ/21k+Qx5fiv6lsszw
X-Gm-Gg: AeBDieviq/cksxVWSXLGXZs3IOUGLRWhGlau3QrXn+6ucDyoziulwf46jfjo5gWz12a
	uC/ppIgBpCZURsUv9ssFCWC559yaCiYYjYGrNDXKw2IOEYL9abnZoj9DPSyiLlV5BBy0qX3nxfj
	Q1rvXb0kA2H9qJZYN4G5b1t/evsrqsEstKItpeTJlgErBis4eBKBZUETV0kyqiyuiXVUF9KW0qW
	Apc960ADw+eCqKtdST4wgR1tEfFWuD8Utz4OA/nxVCnikGLSuQDY8quLzuoO7+27j9FghRehnO4
	0PtiaJcJtQO/Cmh/kIEVPPwxv67zqMFGJuFjIKt07JwoUbhUddqHkaDbqgrisLP8W4ygrFAeoza
	HGqzLyclUpPIhazkIzg6irsz67L8Zuo5G+/VLXrBeFT+cNANLjejK02I4Te2kN2BzxiDNDPiUk4
	qQF/oKvdaUl67h4Do9HzkMZq1gwP+T5OG8eZB2mB288OejDeFpxxjkgPTy0567EhT6eBR9fsj9y
	g==
X-Received: by 2002:a05:6a00:4408:b0:82c:6b1b:7ad4 with SMTP id d2e1a72fcca58-82f8c84d3aamr5554707b3a.3.1776483991874;
        Fri, 17 Apr 2026 20:46:31 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([27.4.62.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm3549074b3a.56.2026.04.17.20.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 20:46:31 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v3 0/3] hwmon: (ads7871) Modernize and fix DMA safety
Date: Sat, 18 Apr 2026 09:15:58 +0530
Message-ID: <20260418034601.90226-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,brighamcampbell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-13346-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B48941FDD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series modernizes the ads7871 driver by migrating it to the
hwmon_device_register_with_info() API and moving the SPI transfer
buffer into the driver's private data structure to ensure it is
DMA-safe.

Changes in v3:
- Added Patch 1 to fix a pre-existing Endianness bug in the 16-bit
  register read logic, flagged by Sashiko AI during v2 review.
- Fixed multiple formatting and alignment issues caught by checkpatch
  --strict, as requested by Guenter.
- Added "While at it, fix checkpatch violations" to Patch 2 commit message.

Changes in v2:
- Dropped custom mutex in favor of native hwmon core serialization.
- Split API migration and DMA fix into separate, logical patches.
- Corrected output scaling and sign extension to meet hwmon ABI.

Tabrez Ahmed (3):
  hwmon: (ads7871) Fix endianness bug in 16-bit register reads
  hwmon: (ads7871) Convert to hwmon_device_register_with_info
  hwmon: (ads7871) Use DMA-safe buffer for SPI writes
Tabrez Ahmed (3):
  hwmon: (ads7871) Fix endianness bug in 16-bit register reads
  hwmon: (ads7871) Convert to hwmon_device_register_with_info
  hwmon: (ads7871) Use DMA-safe buffer for SPI writes

 drivers/hwmon/ads7871.c | 118 +++++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 50 deletions(-)

-- 
2.43.0


