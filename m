Return-Path: <linux-hwmon+bounces-5512-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E66909F1D9D
	for <lists+linux-hwmon@lfdr.de>; Sat, 14 Dec 2024 09:58:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 172E8168567
	for <lists+linux-hwmon@lfdr.de>; Sat, 14 Dec 2024 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28D7169AE6;
	Sat, 14 Dec 2024 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GstDXItX"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB94158DD9
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Dec 2024 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734166730; cv=none; b=HGuF2CJs6lyZmQzD3EzLmEqG0rIsU+Mt8YyupEcyZItAK0Y5GulzFUYJsVgcfcP16Soo91y6Za8VP6BiW1dkoIA8umoXRkTQTIxEWMTSyeFPzgzqOoNui8yjrISU0au20RkyCb9anBAfxuWeAkV5R4TnUbA9dDsM841nnMa+Ti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734166730; c=relaxed/simple;
	bh=xj6/6OFbAAgY+sFOgX1xWlAYLZB7CnDEf3EYuh5aqSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txwTieWbNMJZswiTot9PZWU9dILimwgwf7J2IvlKIzaPhliIxI6PLAq29ow7nIOUfC5gpJ4fJMeZp32i9+LjE8+/9merwXcQl9rrEvkXKbOAmIDBhs3QCxRLScyjUPv4JYiuZO/9B2Mhbr/wm4aYLBCSEFb7UXmVOdKgwy8qZAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GstDXItX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9teRMbCJtAxThOYi72k/gx05ceyxqfnfPYuwz7nN4OU=; b=GstDXI
	tXXr269JM2ViNvRI+TFMnCafeQbiT2LtB3q4qN8AavYcXVTiG1zSUvMYTXcG4vYm
	BD2KCRcxKG+8f+BIzZakzzCVb3bESJu+7Z7gO3QeCpmzNGZuz0NmCBqsSaYWR7JM
	iNJPzwaG1OPT7DgoUfhZYrjr6cpzQelRBEbKyy8krglusW+48nyLReWinHxZz/Q6
	BBTonRiun0GKn4kWxQ12CiHtFB+H7gTXCPG6ix7gU/HIJ2QsBxqH6C4wR6DrARDP
	GQhg2I6dEHYVHC2cqifbVZI9l7sLUOenbIJXNx1Otd37ub/fZ/b5ct/39XUBahMB
	ac/fVgoD748cgLeQ==
Received: (qmail 3036687 invoked from network); 14 Dec 2024 09:58:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2024 09:58:38 +0100
X-UD-Smtp-Session: l3s3148p1@OWA0Jzcp1IFehhtJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Date: Sat, 14 Dec 2024 09:58:31 +0100
Message-ID: <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are multiple open coded implementations for getting the parity of
a byte in the kernel, even using different approaches. Take the pretty
efficient version from SPD5118 driver and make it generally available by
putting it into the bitops header. As long as there is just one parity
calculation helper, the creation of a distinct 'parity.h' header was
discarded. Also, the usage of hweight8() for architectures having a
popcnt instruction is postponed until a use case within hot paths is
desired. The motivation for this patch is the frequent use of odd parity
in the I3C specification and to simplify drivers there.

Changes compared to the original SPD5118 version are the addition of
kernel documentation, switching the return type from bool to int, and
renaming the argument of the function.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/bitops.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index ba35bbf07798..4ed430934ffc 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,37 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+/**
+ * get_parity8 - get the parity of an u8 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u8 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ *
+ * Note: This function informs you about the current parity. Example to bail
+ * out when parity is odd:
+ *
+ *	if (get_parity8(val) == 1)
+ *		return -EBADMSG;
+ *
+ * If you need to calculate a parity bit, you need to draw the conclusion from
+ * this result yourself. Example to enforce odd parity, parity bit is bit 7:
+ *
+ *	if (get_parity8(val) == 0)
+ *		val |= BIT(7);
+ */
+static inline int get_parity8(u8 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.45.2


