Return-Path: <linux-hwmon+bounces-5991-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C3A0759E
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jan 2025 13:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37A4F164EE4
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jan 2025 12:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96538217F22;
	Thu,  9 Jan 2025 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fbv9SeU4"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFA216E39
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425286; cv=none; b=IS4KYN+b/6lcbPDY5FBrmHmLod2kVG8yc5pkw2gDbFGLfjtgg1+n7WnBeLLRNGLM5Mh2sB+Fn8mFEtZetLmQJ9SzH6UXzrcGlqs5ynIzj5HkBprF5wk8ITmORTlOw5N3WaR27wtkcye6v/kKbEwbKtLV29EJ8/yZQE5ROex3kWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425286; c=relaxed/simple;
	bh=delCU7oh1qhJIgT1/70Byggnb7MSS5YA/BXcbHP9rXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HtMV+b2iPQJ6xBdCG85T4WM7LNuPNN7IHuOHEltOFYI8Kq+/qyI0WUFE1/nyz29zqVEMwIMYM06LRtWQweBPr0xZ8b2y91UmZdRfFHpnhZaySw/iLDwaVIllcmk9H24fyy4qTTyHHF/1fQrp5k1Vy2WdhXULBAjY8+0jHfAZg/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fbv9SeU4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=a475Tm0d0fHuro
	bpbhwqIh8X4nP5e9UltpcMinzNvH0=; b=fbv9SeU4wc37p6fDLY479lVubIS7Av
	0Lq8UuYDtjh2YHQMAet8ZvbbxGEtbqkDGdZg1cIBSwX9walrDa84JquDXY2ET6w6
	7UV/j/7hmz7KcRV9swP8PdNz1p82r0sEGAFG8QuLP7iMceXoCDcC3gbbmhLMptle
	+EPvEmf8SJnEwcWCE0sqyquoFYHch7j/TbPuC+nMzwPIKU1sVQYvEM27F/Ia/9wn
	CdnRzsCOxs3wxDiek/sQGjz0GKaszVK5hMvzQqohMM43vSATx52Z9PZFihq0g/HI
	ztZ+wCOY45UAncU0otHaSNP/H6vVk2FgdLk2IXI6xvrkO7vc10fzwBkQ==
Received: (qmail 2902207 invoked from network); 9 Jan 2025 13:21:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 13:21:17 +0100
X-UD-Smtp-Session: l3s3148p1@ATLQA0UrYr0gAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/2] i2c: core-managed per-client directory in debugfs with example
Date: Thu,  9 Jan 2025 13:21:09 +0100
Message-ID: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I think there are enough i2c_drivers now using debugfs that it justifies
a central handling of an debugfs entry per i2c client.

Here is the I2C core code with an example conversion of the isl28022
driver. Quite convincing diffstat, I'd say.

Tested on a Renesas RZ/G3S SMARC board. The branch is based on 6.13-rc6
plus 'i2c/for-mergewindow' plus 'hwmon/next' and can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/isl28022

@Guenter: because both patches have dependencies in their respective
for-next branches, I suggest that I'll apply the I2C core patch soon and
resend the ISL patch during next merge window once my pull request is
included. Does that sound okay to you? And once both are in, I will send
further conversions as RFT patches aiming for 6.15?

Looking forward to further comments as well!

Happy hacking!


Wolfram Sang (2):
  i2c: add core-managed per-client directory in debugfs
  hwmon: (isl28022) Use per-client debugfs entry

 drivers/hwmon/isl28022.c    | 44 ++-----------------------------------
 drivers/i2c/i2c-core-base.c |  4 ++++
 include/linux/i2c.h         |  1 +
 3 files changed, 7 insertions(+), 42 deletions(-)

-- 
2.45.2


