Return-Path: <linux-hwmon+bounces-10028-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E4BE8316
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Oct 2025 12:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6211A65846
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Oct 2025 10:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403CA329C7C;
	Fri, 17 Oct 2025 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE1rvhMh"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB032B994
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698714; cv=none; b=N10sPLZ6Yh/0BF+Z1Px6alGTvF2/u3YsxxrdDnTz2g2W3i/+v8IqtDcVEY+3nQiydJkHn7MLOr1LqJtxmfAuDFlh9J5k/4Wuz2D54TQSbjL6K80GJVbELgMSA+9V4kwjGEKmCv/dIr4Bex3wOFJpWz73/7al6JYtaKl47oEsDMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698714; c=relaxed/simple;
	bh=TGNmouYc6kJWnmdz41HUSOws0rzTBKtG2sTqlItIOno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvllKLtAnUWEWOXk6BkZhfSQUZgO6AKIYH519EwbcfgX8gcgcTejAVcJqM9OG4Cyx75iwb4ROwkX1DOoEzhM9q2IrM+XigvdRgg2j0sk/GgKn6gLDwWaURvz5QLGzpEtlUHG8ZAMnIKbzYwccDsUlP18yKLN9/n7zIvL6aqgIS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE1rvhMh; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f343231fcso1205101b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698711; x=1761303511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcQxmQiwhTRDKIQ07xZS0XyTkiyUkEGo8GNfS/IDb2g=;
        b=VE1rvhMhv7ZWSJvApSp+LmvRug/0A+IMTSiSn/7f2DBG5gs3pjccrJHDZjStyflsvJ
         yF9Ee20K8UI4c90s4sopphzZ+a4t+4E3uHN7eUQJQJm+IF6aOSud3xLtyAHs8UZxxk+E
         aCU7dGVcRcP7uO5+0W5yVHNLxLf9zp49Dxeec+PNg7ir/6W1Y1sruV+D8zIJmMZaHrfd
         o/821HdzSAgrI48rC9aMcTu8Rn93SAT74royrmIqnacV4tFTBUfd9GWbKohbEVM+cf/5
         XryA1LFOaAKkWnIIppUf7VPeuMKeBIkkdaBsSSugtDC03msTemYuVylWDPc10cYo608A
         T1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698711; x=1761303511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcQxmQiwhTRDKIQ07xZS0XyTkiyUkEGo8GNfS/IDb2g=;
        b=lVsuCxl7QkGplMQKBKNpxdR7eri209p36P9wXDiFis6y9jpv34K9zZFbsz/VCm1TWX
         24uMk6TF60fxibI4Vfdugy+dBSS0+VYKQz8VG3TvfIuHhpuTZGRK4aaUfReEbVfc2GTu
         3KLlBc1wrQeb5QswfVqD5JC4kXdd/BAcc3kPQsCwCG3ChQQw9UZOMVUDrAnrO8qn7uP0
         2SUXQoiHrUYIJ/vF5n19HlZNVLjLH8TKuXxqxMGkNaCJdO6CCboX0fEjIVfv0dC6CA7r
         6hUn1ZwwEBenUs2NkIoZI/lyMRIx56Yn54IaZ/LDMuNISzZzb3x+v2ZMB+WURVfrBcsR
         i68w==
X-Forwarded-Encrypted: i=1; AJvYcCWV5i0SJ2lOf4c508DMORsVAke4fWHFbxh3cvEDNTpmf5JaCHuM7TWNzlsxl39pLwAKeRC2ozKtWJ56DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CgdAv2jXAB6/oCeC6Z8Y91DPTdmqh91Ga8EPV4SB0blBDrIf
	myBf7E7uZdwLZpxsiB5C74P13PJAdEXNlxGsxk4aEmd9Hy39gMGyEBx2
X-Gm-Gg: ASbGnculagB0uXhuRirybL9ozTttA8Z/FcFQXKB8jDiBXBnHhkIC/7qOzElOTxM+V5c
	YdnpOzWGFqu2wRjhyf5vRy94LH5mcS6F+MUjTTHpHFaCFStHCO8pfrAwnzEV68VSx1qpNLruijv
	9CPeUwWFDM09Gup2jp4szBobawBnGXN1ZXkOM9izlDf0h+C8/htt/m4x0F0q+LHeY/cJ00pgDPg
	caiRY+tQMXHJvLr2CixC8LwiXOua4QZuQK6wlXo7POgKz+HrLOnxiFvvq3chsyqLYKsiCU+pkA6
	cXA3w47ANxgsy6aVbDOS8pgGE5QzFZDWoh5AM2nrqZUJPUpgAAorZJKMl8pgIibiKyZVHQ0DQLh
	isonlWjQiSaaHnlXdEjD8n5IJs625Z1j/oIQ6KUgZKGen0fuPDk2FTy4rev/8ohOa+05y4xlxWx
	P2A132uA==
X-Google-Smtp-Source: AGHT+IGZbS/al5pfP6ZFP3Y4YJCX9ArTkNG4bvjw2RnO7QdoN87bvhipE1jMqEo31zsqvDApgk5XXw==
X-Received: by 2002:a05:6a00:2356:b0:781:2320:5a33 with SMTP id d2e1a72fcca58-7a220a82808mr3675550b3a.9.1760698711438;
        Fri, 17 Oct 2025 03:58:31 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cc8sm25407571b3a.20.2025.10.17.03.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:58:31 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH 3/3] docs/hwmon: Update maxim-ic.com links to analog.com
Date: Fri, 17 Oct 2025 16:27:18 +0530
Message-ID: <20251017105740.17646-4-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017105740.17646-1-spyjetfayed@gmail.com>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2021, Maxim Integrated was acquired by Analog Devices.
maxim-ic.com & maximintegrated.com links redirect to analog.com.

Update maxim-ic.com & maximintegrated.com links to analog.com links.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/max127.rst   |  4 +++-
 Documentation/hwmon/max16601.rst |  4 +++-
 Documentation/hwmon/max1668.rst  |  4 +++-
 Documentation/hwmon/max197.rst   |  8 +++++--
 Documentation/hwmon/max20730.rst | 16 +++++++++----
 Documentation/hwmon/max31722.rst |  8 +++++--
 Documentation/hwmon/max31730.rst |  4 +++-
 Documentation/hwmon/max31785.rst |  4 +++-
 Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
 Documentation/hwmon/max6620.rst  |  4 +++-
 Documentation/hwmon/max6639.rst  |  4 +++-
 Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
 12 files changed, 93 insertions(+), 31 deletions(-)

diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
index dc192dd9c37c..5ff2f64f9daa 100644
--- a/Documentation/hwmon/max127.rst
+++ b/Documentation/hwmon/max127.rst
@@ -13,7 +13,9 @@ Supported chips:
 
     Prefix: 'max127'
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max127-max128.pdf
 
 Description
 -----------
diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
index c8c63a053e40..b4deb12325b1 100644
--- a/Documentation/hwmon/max16601.rst
+++ b/Documentation/hwmon/max16601.rst
@@ -35,7 +35,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX16602.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/max16602.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max1668.rst b/Documentation/hwmon/max1668.rst
index 417f17d750e6..0f741e9ce0a5 100644
--- a/Documentation/hwmon/max1668.rst
+++ b/Documentation/hwmon/max1668.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, 0x4d, 0x4e
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX1668-MAX1989.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX1668-MAX1989.pdf
 
 Author:
 
diff --git a/Documentation/hwmon/max197.rst b/Documentation/hwmon/max197.rst
index 02fe19bc3428..04413f4699dd 100644
--- a/Documentation/hwmon/max197.rst
+++ b/Documentation/hwmon/max197.rst
@@ -11,13 +11,17 @@ Supported chips:
 
     Prefix: 'max197'
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX197.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX197.pdf
 
   * Maxim MAX199
 
     Prefix: 'max199'
 
-    Datasheet: http://datasheets.maxim-ic.com/en/ds/MAX199.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX199.pdf
 
 Description
 -----------
diff --git a/Documentation/hwmon/max20730.rst b/Documentation/hwmon/max20730.rst
index cb0c95b2b1f6..9ea9d824f280 100644
--- a/Documentation/hwmon/max20730.rst
+++ b/Documentation/hwmon/max20730.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20710.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max20710.pdf
 
   * Maxim MAX20730
 
@@ -19,7 +21,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20730.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max20730.pdf
 
   * Maxim MAX20734
 
@@ -27,7 +31,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20734.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max20734.pdf
 
   * Maxim MAX20743
 
@@ -35,7 +41,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX20743.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max20743.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max31722.rst b/Documentation/hwmon/max31722.rst
index 0ab15c00b226..b15603c31c3e 100644
--- a/Documentation/hwmon/max31722.rst
+++ b/Documentation/hwmon/max31722.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31722-MAX31723.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max31722-max31723.pdf
 
   * Maxim Integrated MAX31723
 
@@ -21,7 +23,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31722-MAX31723.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max31722-max31723.pdf
 
 Author: Tiberiu Breana <tiberiu.a.breana@intel.com>
 
diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max31730.rst
index def0de19dbd2..b0be18570984 100644
--- a/Documentation/hwmon/max31730.rst
+++ b/Documentation/hwmon/max31730.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: 0x1c, 0x1d, 0x1e, 0x1f, 0x4c, 0x4d, 0x4e, 0x4f
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31730.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max31730.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max31785.rst b/Documentation/hwmon/max31785.rst
index c8c6756d0ee1..7fb867bf2c70 100644
--- a/Documentation/hwmon/max31785.rst
+++ b/Documentation/hwmon/max31785.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max31785.pdf
 
 Author: Andrew Jeffery <andrew@aj.id.au>
 
diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index 8591a7152ce5..d1292dd8f24f 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -17,7 +17,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34440.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max34440.pdf
 
   * Maxim MAX34441
 
@@ -27,7 +29,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34441.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max34441.pdf
 
   * Maxim MAX34446
 
@@ -37,7 +41,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34446.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max34446.pdf
 
   * Maxim MAX34451
 
@@ -47,7 +53,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max34451.pdf
 
   * Maxim MAX34460
 
@@ -57,7 +65,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34460.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max34460.pdf
 
   * Maxim MAX34461
 
@@ -67,7 +77,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX34461.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max34461.pdf
 
 Author: Guenter Roeck <linux@roeck-us.net>
 
diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
index d70173bf0242..3846a48c5ca6 100644
--- a/Documentation/hwmon/max6620.rst
+++ b/Documentation/hwmon/max6620.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max6620.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	      https://www.analog.com/media/en/technical-documentation/data-sheets/max6620.pdf
 
 Authors:
     - L\. Grunenberg <contact@lgrunenberg.de>
diff --git a/Documentation/hwmon/max6639.rst b/Documentation/hwmon/max6639.rst
index c85d285a3489..0a275aa36781 100644
--- a/Documentation/hwmon/max6639.rst
+++ b/Documentation/hwmon/max6639.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: I2C 0x2c, 0x2e, 0x2f
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
+    Datasheet: Publicly available at the Maxim website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6639-max6639f.pdf
 
 Authors:
     - He Changqing <hechangqing@semptian.com>
diff --git a/Documentation/hwmon/max6697.rst b/Documentation/hwmon/max6697.rst
index 90ca224c446a..fa9cd68aaf85 100644
--- a/Documentation/hwmon/max6697.rst
+++ b/Documentation/hwmon/max6697.rst
@@ -7,61 +7,81 @@ Supported chips:
 
     Prefix: 'max6581'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6581.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6581.pdf
 
   * Maxim MAX6602
 
     Prefix: 'max6602'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6602.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6602.pdf
 
   * Maxim MAX6622
 
     Prefix: 'max6622'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6622.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6622.pdf
 
   * Maxim MAX6636
 
     Prefix: 'max6636'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6636.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6636.pdf
 
   * Maxim MAX6689
 
     Prefix: 'max6689'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6689.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6689.pdf
 
   * Maxim MAX6693
 
     Prefix: 'max6693'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6693.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6693.pdf
 
   * Maxim MAX6694
 
     Prefix: 'max6694'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6694.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6694.pdf
 
   * Maxim MAX6697
 
     Prefix: 'max6697'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6697.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6697.pdf
 
   * Maxim MAX6698
 
     Prefix: 'max6698'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6698.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6698.pdf
 
   * Maxim MAX6699
 
     Prefix: 'max6699'
 
-    Datasheet: http://datasheets.maximintegrated.com/en/ds/MAX6699.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max6699.pdf
 
 Author:
 
-- 
2.51.0


