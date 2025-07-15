Return-Path: <linux-hwmon+bounces-8729-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79775B04D4C
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Jul 2025 03:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF1E34A5420
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Jul 2025 01:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D04A1D63C7;
	Tue, 15 Jul 2025 01:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wBAHA8ob"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ADD1B6CE9
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Jul 2025 01:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752542439; cv=none; b=KtDDA+RWVE0X2hU4mUv4zb+zz21CAbOtKhm+SC/X6r9/jsgEdzSqD9HhJLgxRtqYCLEAP8wbxpwPXkXsXTcBCRTTN0sWUF7paB07lfobvHiC1Mfmk/X2U/VVLFIq+AzAS+nyrg7N2H+IzrTnIotkwB5PgYPfGBQB8pGPg739nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752542439; c=relaxed/simple;
	bh=+7Okd5KpUl8CR54V8Zek7raTLxtgZ33PvQMeh1OC1AU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=svBTkAMJ1OeqijllCnI+MztD3iha/aXmjNWsHT2tBGURNVmoLxoJeuArBDBsuiTYKwcBLkki21Ow6vwuTG/Rpvw7p69QpFMPWph4GSK/fqUeMDyxjwMmystb2bIQWTrCdlTKcwZZ33mOGZ0HfUgdSuaJ74f/Gg6Mo4ADBcbQHl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wBAHA8ob; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752542434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nC77loZfSLoZJvF86FxWCFT8RwnQ5h925nNSe/Ekbps=;
	b=wBAHA8ob23eW73Y53FTGMwNmEMvdEIGPTKCW0YZPkGylInb3Xdfp2hmsWeDcg6AURYBB5X
	hx+IqrjGgZxA+WJle+0FK5EZbzGEKMlqfh8OaFmLqI7FUCszJPPEGkD956/nO0RI78Z98y
	58NG8VvxBAdcR23ZVDYsjOhByy09QI8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Jonathan Cameron <jic23@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/7] math64: Add div64_s64_rem
Date: Mon, 14 Jul 2025 21:20:17 -0400
Message-Id: <20250715012023.2050178-2-sean.anderson@linux.dev>
In-Reply-To: <20250715012023.2050178-1-sean.anderson@linux.dev>
References: <20250715012023.2050178-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a function to do signed 64-bit division with remainder. This is
implemented using div64_u64_rem in the same way that div_s64_rem is
implemented using div_u64_rem.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 include/linux/math64.h | 18 ++++++++++++++++++
 lib/math/div64.c       | 20 ++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 6aaccc1626ab..0a414446af89 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -57,6 +57,20 @@ static inline u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
 	return dividend / divisor;
 }
 
+/**
+ * div64_s64_rem - signed 64bit divide with 64bit divisor and remainder
+ * @dividend: signed 64bit dividend
+ * @divisor: signed 64bit divisor
+ * @remainder: pointer to signed 64bit remainder
+ *
+ * Return: sets ``*remainder``, then returns dividend / divisor
+ */
+static inline s64 div64_s64_rem(s64 dividend, s64 divisor, s64 *remainder)
+{
+	*remainder = dividend % divisor;
+	return dividend / divisor;
+}
+
 /**
  * div64_u64 - unsigned 64bit divide with 64bit divisor
  * @dividend: unsigned 64bit dividend
@@ -102,6 +116,10 @@ extern s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder);
 extern u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder);
 #endif
 
+#ifndef div64_s64_rem
+s64 div64_s64_rem(s64 dividend, s64 divisor, s64 *remainder);
+#endif
+
 #ifndef div64_u64
 extern u64 div64_u64(u64 dividend, u64 divisor);
 #endif
diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..ccef0db85681 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -124,6 +124,26 @@ u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
 EXPORT_SYMBOL(div64_u64_rem);
 #endif
 
+#ifndef div_s64_rem
+s64 div64_s64_rem(s64 dividend, s64 divisor, s64 *remainder)
+{
+	u64 quotient;
+
+	if (dividend < 0) {
+		quotient = div64_u64_rem(-dividend, abs(divisor), (u64 *)remainder);
+		*remainder = -*remainder;
+		if (divisor > 0)
+			quotient = -quotient;
+	} else {
+		quotient = div64_u64_rem(dividend, abs(divisor), (u64 *)remainder);
+		if (divisor < 0)
+			quotient = -quotient;
+	}
+	return quotient;
+}
+EXPORT_SYMBOL(div64_s64_rem);
+#endif
+
 /*
  * div64_u64 - unsigned 64bit divide with 64bit divisor
  * @dividend:	64bit dividend
-- 
2.35.1.1320.gc452695387.dirty


