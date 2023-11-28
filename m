Return-Path: <linux-hwmon+bounces-236-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB97FC2B3
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Nov 2023 19:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5660C1C20A57
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Nov 2023 18:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA721E4AE;
	Tue, 28 Nov 2023 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrpdQzzb"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468581710;
	Tue, 28 Nov 2023 10:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701195430; x=1732731430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1R2I6yK8uz4+mMbjPb8Ix/gfVd6VyGXOdv4Zk2JJis=;
  b=QrpdQzzb/lbm1FhZLi9IYXqTrAdwKbXlQ06VGJoxnLk3nSp8DAiKBg32
   8SidhsW+kOFtwmRtGwlAS43V+/cgNEwXUbM64J5li8svLKNpRdCoQAIBk
   Vp96q386Hdml0FZHWT4jO9XPVVPNqVyEKs7SxR4KUNwiY5eBai+DthKzE
   gheocV4vdR5jYdaz8x8D+DjeEhM66xSAHBQArp7S45d1mfPZBoTHNpFAX
   fTEy2QsgL1rBtkLqKZYuF7zqmnCCJ4ysCgJ4zZYcaa2iISXZOrHY7lOxA
   nOinB3dX8HDmhGyTkaVqNbsegql976AVMrHAMhG62a6S+9uTk4Djd8iRa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11692051"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="11692051"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 10:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797655089"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797655089"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 10:17:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F4009F7; Tue, 28 Nov 2023 20:06:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eric Tremblay <etremblay@distech-controls.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] hwmon: tmp513: Don't use "proxy" headers
Date: Tue, 28 Nov 2023 20:06:02 +0200
Message-ID: <20231128180654.395692-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128180654.395692-1-andriy.shevchenko@linux.intel.com>
References: <20231128180654.395692-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses math.h and not util_macros.h.

All the same for the kernel.h, replace it with what the driver is using.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/tmp513.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index 8a7cf08733c6..849a8c3e1020 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -19,15 +19,19 @@
  * the Free Software Foundation; version 2 of the License.
  */
 
+#include <linux/bitops.h>
+#include <linux/bug.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/kernel.h>
+#include <linux/math.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/util_macros.h>
+#include <linux/types.h>
 
 // Common register definition
 #define TMP51X_SHUNT_CONFIG		0x00
-- 
2.43.0.rc1.1.gbec44491f096


