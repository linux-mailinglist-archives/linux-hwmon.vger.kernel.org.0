Return-Path: <linux-hwmon+bounces-14211-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AkoM4rCCGph4AMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14211-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 21:16:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684755D815
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 21:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7DC430104A1
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 19:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A05633DEDD;
	Sat, 16 May 2026 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrUU6Al7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E730568C
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 19:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958971; cv=none; b=KbbsjeFkxvM/28MpsHNtwRPFUFIXl2z7y7r6r+LH5mjjh0MNOUz2wZwKiROUHMsfFI0t5ZhA1WUiOxAH8fTsXqyjTyX9c9FYsf2OLqNQuMeGoD3RwxEWfl9PGfcRDUukS6iBXQDLxQi0eTCyT3qqU5DVWHX3j/BD2T0KObZShr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958971; c=relaxed/simple;
	bh=qGIBGexyfFj6LjXFBwoBsxpdBp3bT7s/lUbl600vSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHvOd8YkO7qB55FuMQF3CSnipZzyRB1UdyuGzQqHkVImQitoPsAa7UgKjF+DGuxOwB4nEmTceMUAbwNRTia/SBW+d5PQ3G3Lv4GR+3CpDs6kDBUHz99b89W05MngmTO/J9F74FtXDArBtfg38KUYlXvBuWqQDvCDVWYxyKa3GCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrUU6Al7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso392256b3a.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958969; x=1779563769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=;
        b=qrUU6Al7i+BX6suPcjEgvgu19HgDLyY/UUn1y0oztw4S00bQ20RUFi3ouOHSsfKxVs
         sAE1QJ8twYhC2bQXLo2Uww+fcYET5lQ7sxU9NYpCfy2m9JQTGx8+fpc/bnTyrOZ702fy
         jSoSSpaxqdNTLLiQCoVKgX4yInSriTytU7oK3HoniTA0su797k4/fU5zfvU2DTDLPafT
         +y2STieydbbe1FGrxEI31OWXAu3nTHnfdbrIkFXOoc+j6x0uhBySYvSXNlhr1Eu/xz19
         LEb/Q0grCt79SDExPdxVnH8lxlzu7kDPrFF9XtBrQizaLBstWkjNgoMVWR7Zy5NsaNTb
         zspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958969; x=1779563769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=;
        b=LBdlhPG3GZAqaY789y53wsoTjp7XsALP9h79pFnLQQhjFD1DuI8xNF8/sfclQBxjhZ
         QkuTeErIHsQYC/aiYCH4bxXQkZYHmc9HUEbT2jNeOldb6VALnALclbBN3qAIoaSCZQd5
         /6RQAhep+e3EzwUiHaYQs71/XOmpka6qgjybfIZMWRv9VBGRBBRNLAcLXvd/3bxuYhYA
         FsaYeRfvWj7s8lbyeoGFbbsTCQ/3OnCKF97zHSu2m12uwjdsBadVb76KlaBRNU9Iwdcq
         R7LRSXnu2qddDgxOH8/OykypefVh/+6r8J94tVNW6UeMkcInzVWDVqgu2nHAOFA9oXnT
         6pvw==
X-Forwarded-Encrypted: i=1; AFNElJ8hUkPi88eMi0e3jG2yFeoRGhsInK8xkUEliHKqfGhY0tqVUoxoamnhYb8Q+kPhlJMoV/5s1uaW2mXxeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZbyAi+VGhltfq6nt0KiWCM3Xu0fF3zh2EwDgr/8hpzCbpy+1
	wG+0lZr0ySvPQ9WSdulvYlUG5xJzayi9THIYJVcvl6Y35eAFPqaZU0qM
X-Gm-Gg: Acq92OHGH6jeL5P9/xLlSUTE3gdTWSJqYpT2yVWOUv8hWJgM2JSxRsz40B4RT3l1YrI
	zlsJbI6AlLEt++S29Vh9MTJnnvui5TVtoprH2BUISQ22E3SlqZlF8e813sdNtFY3NIjdUizkBdj
	SFPhsds6wEQytPuwMc0nRPYojlA8mOMi/N4/clAEGNHw34za+IvfvJ7Maou0yoR4ZzQ0WTz8GTy
	e7+zR70FlZSHdpjYbqJnJPRYj+RPMk79D00TUgomaMChPbOCi0OG6t0IWgsvMchsVO9rS20yiHV
	9zCs7gHfmES+XKhIY6NhIKtZmQXjku4kccelzPull7SoKst7BQvZTilMk/vksulgqxYQIshjBnV
	gSIbizbx5XSS7yNAdBOcU8HhwPkRLRwIHIXAoE5lupJ1vDcjO23/boM2R3BZLdNk7K9/a8LhWGS
	7XGPCgxQrhwXOzQnv8jGnxmlugFvntrIhQA1Q2VP1rAakbdATdIe7J1RnPu6vTRMzkbDdQ
X-Received: by 2002:a05:6a00:2394:b0:82c:7420:82bf with SMTP id d2e1a72fcca58-83f33c8a27amr7135767b3a.19.1778958969274;
        Sat, 16 May 2026 12:16:09 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:08 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 0/2] raspberrypi: firmware and hwmon voltage support
Date: Sun, 17 May 2026 00:45:53 +0530
Message-ID: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4684755D815
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,broadcom.com,vger.kernel.org,lists.infradead.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-14211-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Changes in v2:
- Patch 1/2: no changes
- Patch 2/2:
  - hide unsupported voltage sensors using .is_visible()
  - replace the label switch with a string array
  - update raspberrypi-hwmon documentation


Shubham Chakraborty (2):
  soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
  hwmon: raspberrypi: Add voltage input support

 Documentation/hwmon/raspberrypi-hwmon.rst  |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c          | 134 ++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |   8 ++
 3 files changed, 152 insertions(+), 5 deletions(-)

-- 
2.54.0

