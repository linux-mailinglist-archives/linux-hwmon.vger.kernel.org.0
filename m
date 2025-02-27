Return-Path: <linux-hwmon+bounces-6850-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59FA486D9
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Feb 2025 18:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E95B16533F
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Feb 2025 17:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BF81DF247;
	Thu, 27 Feb 2025 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KmAQpiep"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6D1DE884
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Feb 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740678073; cv=none; b=SJFb5xFWnSuJcTxbbZa5tayCuD44BNm3DUiITe78c3pvxECOz1iNv+OWjX6A8lDbH6VJsKDNd7r+QfeKso2TUX9HWWqksyIMGSrUEsk1ri+sIWeed13jaHZbk2SFJCjimoKjGm+bgntL4YXkSUpPp2/Nfj5gxLLp3lq+0PZ14Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740678073; c=relaxed/simple;
	bh=iJRxVaTtxnoERXUpMpoBNWSM0ZxK+oaomsKPSuKCxuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SURTx3WpSVoRDJyIyZVL24qtmhU1aPBgVviL528plL1OK4+7EsNSLdmobvnB9gB+KwUQkbvYWKsy1WmCSv2q5LuDIFMO/gN+TfmNt6EH1ImKJVpSku21Bku7K2FcUpeSZ839LuKFIoMGXPuXiWRhB1Z7btcHgDetmsidLZ2w9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KmAQpiep; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740678058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LtW5EyiYN8qDte8Np1uuhB8NxmEozhwwfYVBmt/mcc8=;
	b=KmAQpiepNGLKc9zPdXJZslDbW0Cs5rYAriSFQv7G9K79WQIgEnwcAgjxaJGhEfJuHQRJs8
	ag26V26XhiVe2Wa/pHnRZURHq1Tuh76xN7W9UTqaYCcdqoxPjTo/19uw0unoCmhCjKDmcB
	2MPcAnoUP1kT69TAa5ViEBmhn1htMYU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Patryk Biel <pbiel7@gmail.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/core) Replace deprecated strncpy() with strscpy()
Date: Thu, 27 Feb 2025 18:39:33 +0100
Message-ID: <20250227173936.7746-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strncpy() is deprecated for NUL-terminated destination buffers; use
strscpy() instead.

Compile-tested only.

Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwmon/pmbus/pmbus_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 787683e83db6..cdde8b03a6e9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1470,8 +1470,7 @@ static int pmbus_add_label(struct pmbus_data *data,
 	snprintf(label->name, sizeof(label->name), "%s%d_label", name, seq);
 	if (!index) {
 		if (phase == 0xff)
-			strncpy(label->label, lstring,
-				sizeof(label->label) - 1);
+			strscpy(label->label, lstring);
 		else
 			snprintf(label->label, sizeof(label->label), "%s.%d",
 				 lstring, phase);
-- 
2.48.1


