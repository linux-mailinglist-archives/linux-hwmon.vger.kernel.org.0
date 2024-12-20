Return-Path: <linux-hwmon+bounces-5663-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 631069F916C
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 Dec 2024 12:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EADC31886228
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 Dec 2024 11:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E981C07D8;
	Fri, 20 Dec 2024 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lyK7fUWY"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1291B6D16
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Dec 2024 11:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694422; cv=none; b=TTZmuXLJmrqlAZBkP2ToGo/kjQAkqou/CgFRnXYe4uw7aYIsADTA+6O0pQ+b4naOJ/UYAq43+yDN8U/xws1SEkmOLPqIbachtgJvm8mAS8G2qZe84T33/nIkToHkHTEjh6XQlUfl//lSy8EFwI5wRmHydG+TsEPM1Klm/osSAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694422; c=relaxed/simple;
	bh=wLie45FQJjevoqTvATT1Bwc7/Ik+763kNu0o5MBnW6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ugTwEEx7OeE5zhZX5Wxv+XtpgzcAimVaIg184s5JQX9MnHSg3iBif6HPu/exFeeJb+gK2O1C77zcDomJBj3JIWQISlbJEJD5EK0lFczWSXn46hJKbsz9B5nx1hrZaG+7NkKr4Ma630eL0dcoEsqMDJh24AeRmSkg23xj/OTW6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lyK7fUWY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=7urdFe4hc0mW5T0rNDU1jZWJ1H72Kr3Yh3vXW+VAdRs=; b=lyK7fU
	WY3LP/ZmSFIqdrAGFwbU+VBuO68kzOtCSXWYh8IgmhSjL1gUhq1UoeiZwLyi+aGa
	StU0DGU6eqc9XHJieuQx/HYGqTw30YAenMVgr4y+w8WjpMexbVj0R1tkYSYXLajW
	OHvceZow1AnYFnGmJqDcHHGTOwizPzgkKTlliKk1H9YbRIMLtVUI1t7THd0yjiiG
	NmwH19mnwOAQhHj/mFPsUPOHLGbX4a5CBHjjkEpYbQazx/l+9WKChyV9MlmImqVg
	Wl5cwOYfq/huo4RWE897Fi0KrNWfzCEU5pLA7IUjSnR5iw+wr7105cPcsUXvbQIJ
	HQ/FmSuNWZuTmtbA==
Received: (qmail 990929 invoked from network); 20 Dec 2024 12:33:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 12:33:36 +0100
X-UD-Smtp-Session: l3s3148p1@fl+BBLIpvuIujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFT RESEND 2/5] hwmon: (spd5118) Use generic parity calculation
Date: Fri, 20 Dec 2024 12:33:30 +0100
Message-Id: <20241220113335.17937-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
References: <20241220113335.17937-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use of the new generic helper for calculating the parity.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/hwmon/spd5118.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6cee48a3e5c3..07ab3a47b00c 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -291,12 +291,6 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
 	}
 }
 
-static inline bool spd5118_parity8(u8 w)
-{
-	w ^= w >> 4;
-	return (0x6996 >> (w & 0xf)) & 1;
-}
-
 /*
  * Bank and vendor id are 8-bit fields with seven data bits and odd parity.
  * Vendor IDs 0 and 0x7f are invalid.
@@ -304,7 +298,7 @@ static inline bool spd5118_parity8(u8 w)
  */
 static bool spd5118_vendor_valid(u8 bank, u8 id)
 {
-	if (!spd5118_parity8(bank) || !spd5118_parity8(id))
+	if (get_parity8(bank) == 0 || get_parity8(id) == 0)
 		return false;
 
 	id &= 0x7f;
-- 
2.39.2


