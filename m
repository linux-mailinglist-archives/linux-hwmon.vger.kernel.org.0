Return-Path: <linux-hwmon+bounces-12205-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q5cBIwfkq2kShwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-12205-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 07 Mar 2026 09:38:31 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A522ABD2
	for <lists+linux-hwmon@lfdr.de>; Sat, 07 Mar 2026 09:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA363301DE04
	for <lists+linux-hwmon@lfdr.de>; Sat,  7 Mar 2026 08:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC62387369;
	Sat,  7 Mar 2026 08:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+C61ADD"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D936A02B
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772872707; cv=none; b=DPtbL/o0RhmSRUNrAFQhtyiF2CYoHD/EtdCIsziSp44vO71ponNrvl48JaXEJkF46BsU2cB/C6ydSWoJLAqf8qr/75VRkVN7IVc2u9tR8UgofiyxJ9t2PQ3ydFLOBMP/nshV+KbpmfuaSzKmD+fzIQyGnHAZhPMNq5kZDBZSpaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772872707; c=relaxed/simple;
	bh=wv7PF3CPthuMuMLY9Sl9xqb7g1UD/3KaIZAayvTerzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oM81vpk39LhdB5p+0Q38oHELrsQmcdsx7j8Z0A8vxazIFHP2CR7tbSB4LcGCH0yfRUlQpIh4Vm/xlpmPx5LWfazFHul7/HcTZM5wtw4xzH3+vpFQOFB9Obrj/l8fkghXidE9o2jEQkqPctbhnoXfOhsO1FOxFOi0ZadcFBhJUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+C61ADD; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c738d1fa6f1so1396377a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 00:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772872705; x=1773477505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvIHZZEg8NEPZV4vJCPvRe+osiFJZCXqUTnywKUIgH8=;
        b=a+C61ADD2vQfS3hEhUlfpsAEth+6Umopwl5T3DTt7j53aDzPjEfesHorpEEb2z9hPR
         vssMKlPzDmOurpRX3azUvWxB+tBEO6bSss5eADL8IZB9q1rIl/ZT4Woc0G1dCR/JVANr
         c80h2QbXQWkrVrGo1o0hePBtz69n7hCVW6jDL/JDfyN6p/YJcbtjPj7CJUjA9bbmYRW6
         u3nfkrY6uxE7fYSn5GgcJ5m1wjOFYFb1V6Vj2fQrsEbK5bZR8EJpZBnIB4ae9OUjRFhk
         //hxZvDPPDZM6yWfsM1qILmNlLEf01FUY0uknC1jHLDh0rkJ3XQu3ZvAtSJUHlAPBwsX
         HDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772872705; x=1773477505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvIHZZEg8NEPZV4vJCPvRe+osiFJZCXqUTnywKUIgH8=;
        b=oJuPyDi/nJ2dB9+Pru/dY99WPALCcz6vDgGj6f+TpOIJW5Lbhkf4tHK3W29stjJf+0
         bdfy+LnkwZLrSSiiT7FA/Zv1/O4FWk6PBx2sbdq1USKBqIaTb5XArtMGO7L7z4hBeJHv
         +ViqpcfcXZYpHHSH8WMv1i4Kkvz0wyquB2i0q0pxidKyUVLAPH4ogz6y/pVPNfC68vLF
         S4ZKkVLqIHnFS5z8RvHi+unme2yNaCEoA9gHsPjcVnvV7nyI0+8fUxi8iE2DYN7y2Cyu
         lD9cysOHV4eJ3JW/HfyVTt1P3kwkxjlzDYzCqiFyD8l6BaDfkvdMUKBEZebqogtGdLtB
         5E1g==
X-Gm-Message-State: AOJu0Yw2uAQuTJWiXulwBR/y1+Q2uy9ZOboy/0r24KRK3kT8eChUfo2O
	+u3N10g/vtFbzateR6bvvcfRidi/7+dz489bQJbkTu0vragSq+IO7QzRTmw9Xw==
X-Gm-Gg: ATEYQzzZ7c8LKpTbOF+rJYGT7jwpYAJMbItNnfCRT9QF0enTX3sTzSuGjPDW5y5fEz1
	WFKW4GbrnlXlQvgPilcAgwsrk/l4wN1F2nKHv5HqnDwwsGnKqcHXXYhh/Vu0pLV20V0d0+RmHpl
	LIcx+tXT0umarKOhRN7No96auwX5CJ80VKXqnWGc1FDVE4rj8CDfKQEBq0W3z8aPlWb5igHhvSR
	9oouZNAwsN6RHF4f0D4AszlhzgHkoOp4POgUv8Zn3+R5+H05xO9ZRTKQ+XagWD1wBi+7AYZfPqg
	QsKayEC/N0f0LsvHTybQWrdS/SE3LUkbZ8yFCm8isZnM7hVs3uU3XTLcFQNp5MV4+2tqUH1puIc
	3viBgPb1E2TWogBqnTUYGV8kYNvPi0ay+ArqIhDk88CuNXVwsr/43xFXMqQld5SG8CcdO9uNcJo
	Tp8k1c1i77qwOaNJDXNVVHe4LY+eAGH593acFDWVxfdAnHu2/LbcpkdW4Q6tklRTLKD3+xiH0f
X-Received: by 2002:a05:6a21:329d:b0:393:2434:683a with SMTP id adf61e73a8af0-398590f6823mr5398694637.67.1772872705550;
        Sat, 07 Mar 2026 00:38:25 -0800 (PST)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([2401:4900:4e5f:8ac8:a739:6c36:ff08:6f05])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e16cefcsm3620712a12.19.2026.03.07.00.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 00:38:25 -0800 (PST)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH] hwmon: (ads7871) Replace sprintf() with sysfs_emit()
Date: Sat,  7 Mar 2026 14:08:15 +0530
Message-ID: <20260307083815.12095-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D23A522ABD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,brighamcampbell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-12205-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tabreztalks@gmail.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use sysfs_emit() instead of sprintf() in the sysfs show function
voltage_show() to comply with the preferred kernel interface for
writing to sysfs buffers, which ensures PAGE_SIZE buffer limits
are respected.

No functional change intended.

Note: Not runtime tested due to lack of hardware.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/hwmon/ads7871.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 5434c37969d75..b84426c940c5e 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -124,7 +124,7 @@ static ssize_t voltage_show(struct device *dev, struct device_attribute *da,
 		val = ads7871_read_reg16(spi, REG_LS_BYTE);
 		/*result in volts*10000 = (val/8192)*2.5*10000*/
 		val = ((val >> 2) * 25000) / 8192;
-		return sprintf(buf, "%d\n", val);
+		return sysfs_emit(buf, "%d\n", val);
 	} else {
 		return -1;
 	}
-- 
2.43.0


