Return-Path: <linux-hwmon+bounces-14082-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGaPHJ7uBWpWdgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14082-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 17:47:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1055443C8
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 17:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBCD53026377
	for <lists+linux-hwmon@lfdr.de>; Thu, 14 May 2026 15:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECBD40DFB2;
	Thu, 14 May 2026 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sey3l20T"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347E3DCDAB
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773288; cv=none; b=Ja6jUgk6ZnDOehctiMsUODr7ri4xSftpORuHwXUutOfNDr6diIj2RuSdAX5NeuBMBdjO7w8/cWhI1E3VxDr3V0X38Cc4kyo0FNGH+oygrFF2Soo2pxrTkKtRxdBQhMDGkipZLh7pXAWDaaDbUiBe/zzVHEAXdlyXHDkhWKr9zho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773288; c=relaxed/simple;
	bh=LqWHZ889FfjSUsJJDSnXMSZ2jEN+n2I+ZNi6tiS8o0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fs5xicp4S8Q08YK3lHmB+qt829EILMcnf1aJDGOC3HUPb7owahIjnsqqogL+0WeLaDNz0xeBq/Pbko7DOpAp2C4czGEI/TiJwfufUaCjxmLGgkn+SGnDHc5iZIsPqcuUfJcufoj9wKHZdM7zFer8j7LPRT5WyhaSHOfbo/KhhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sey3l20T; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3664df32e91so6998360a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778773286; x=1779378086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGhCi4yyqYpXjwh9zUcoDYb6CxobDy3aAgcw86g1Gxg=;
        b=Sey3l20TjQtCr5hjE4GJMA8p+IlJZHoPPxekbkSEqo2myBv4QSdYwLdlnQeKYBcmwi
         lmqixjwczKgBX/skSsFyw0qngDBEnkvNxsUlnlnQMVY6b88DifDHqPWm99J5z6N+xO2M
         FLaKtmlc/xaxfprkVs1U2EQDpN2zXfMA1Gs3IhJPbiGXdHSgr0VQAcL/+TJgrw9bEYDs
         a8VPwdpLBayhLFKUcJRsPZUwjR8lPcmXJRKSxKKF91J6YVU42/D8YLc1SFjkdfZAGlrv
         djkswI/+OP6RKtyF2NBjt5uoJzWaRA+OKnwM85WEs/Xko1Gw0Kc8NvW3/Rs9pMbiHZve
         NRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773286; x=1779378086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGhCi4yyqYpXjwh9zUcoDYb6CxobDy3aAgcw86g1Gxg=;
        b=IoUhYRXx1yj8vzhoq8ZDsIS6EWUz80LXra6RQzsOMG7hkV/HzyUO0Lm2uKyYw/ckvU
         IgagC+ZdlAn19wDnSouPxe2qGVPqcMSd4dBu9EhvKKDucGcgtbSZQ1jFwNwAGluKmBcE
         zCY5Tec77N25Wcx9R80t5Gwug1SxSA+vlTfDPFNYXdikWLEMd4HZBahqKJmojckkXatb
         oGeYCFctxEBWuRRWCYPt2KFZXOahAmL4eXFo/vHzt+A9EiPP+i9ShJCgnm9yLBqlV+UK
         w8rhzYSVKYMO2JtmdKvTAe4HPziPa1VP+8GBc3E8k5hEQ0mhcCPjWRskkfxTbf+V//52
         bERQ==
X-Forwarded-Encrypted: i=1; AFNElJ94hcl2lE4mQc3H4U7OzWbavnYhLgIkffhFRS1CtnTAla+zjaK37Da42g+MnWq36CLPrbM70LC9CtsjZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK94fvEwgpr1NMT1tP7po5jNEv5fXK1v26Pr5Hv51F/FXRhvfb
	FHjHemfeLK+8EAT5P8WqUZgfXS4eZOszYRzdKFKiUuprwPputlWzL3cl
X-Gm-Gg: Acq92OES5hpYOcR2vhactzxb7vNi8SWLd3Hrs86TsFrpRnVgyw5caR9/Zx98u0Cn+aE
	kwdhOLrmIj9i+Azeb53o0m6JqRY3pjlk+iQEnaEfpUezNG8VKJJXvxjKJZZiBBMhPBZnknhiv0Z
	JnmLy1+evfOpEXBA9TTqnxmmMdDUJb3xmozZrg2WwLOxKFutMtHV4mF1u9a7QRhAboNwYY6Ecsz
	0uncVwqkTMcRzR8XC1k/5gvlkBn+1yZ8aKOF6ny6qH0I3tpCTMxR5PB6o3Vd+6OKls6RRYvk0h5
	6U2BRkg13BZ3IxwgRVeZgXB3l1rCD0u2mZgAdAHEyIxcOQVQEbszOKOrDx1+vuf+N10rfyA343q
	5Vohf0Jk3RBby10/Zv7ioIXmmTlJl6ccZnQ/jvMP9zwxL1GkaZOYzhwflcr7wkjcGXLhyLcOJBE
	TdEDL5o3Js7zSTuTypXGViqT9xF7CXs9uFTZp8pRmAlxUGNXee8VCHY1DgYRKSfcQ/zh71KQhSs
	TqAI1Bna5PVUeiPAGPKlq3NhrldrsHfekyoBAOnYCBkJ5bF5W73HBoXdPy4XX5dEQ==
X-Received: by 2002:a17:90a:a81:b0:369:1dff:6bd5 with SMTP id 98e67ed59e1d1-3691dff76dcmr3620471a91.17.1778773286539;
        Thu, 14 May 2026 08:41:26 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d23044csm28385315ad.78.2026.05.14.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:41:26 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: hwmon: sy7636a: fix temperature sysfs attribute name
Date: Thu, 14 May 2026 23:39:13 +0800
Message-ID: <20260514154108.1937-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6E1055443C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-14082-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eric039eric@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The hwmon sysfs naming convention uses
temp[1-*]_input for temperature channels.

Documentation/hwmon/sy7636a-hwmon.rst currently documents
temp0_input, while the driver uses the standard hwmon
temperature channel interface.

Update the documentation to use temp1_input.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/sy7636a-hwmon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sy7636a-hwmon.rst b/Documentation/hwmon/sy7636a-hwmon.rst
index 0143ce0e5db7..03d866aba6e8 100644
--- a/Documentation/hwmon/sy7636a-hwmon.rst
+++ b/Documentation/hwmon/sy7636a-hwmon.rst
@@ -22,5 +22,5 @@ The following sensors are supported
 sysfs-Interface
 ---------------
 
-temp0_input
+temp1_input
 	- Temperature of external NTC (milli-degree C)
-- 
2.53.0


