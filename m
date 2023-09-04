Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B95791CA7
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Sep 2023 20:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjIDSQS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 4 Sep 2023 14:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236498AbjIDSQR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 Sep 2023 14:16:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1E912A
        for <linux-hwmon@vger.kernel.org>; Mon,  4 Sep 2023 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693851373; x=1725387373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qjAb7aANtDTSJ7YN4EBV7nKbtweCn0hM1YStYobJDbA=;
  b=FelBlZLjXlKMA6qX9Oe9epilelE4LFgevtJEz7EaqgARUB/tDS5YHJ27
   Edo+dXpAYUIfB07cRA8KRiJFGvhEWPm50akAysv/6oM8HH2BSmCgVxmQU
   qhDXuolrIoOFwmsNuc6zs+vK5JDfKDFTY9Nxdf7ivA0CF5XTHiv8xiWbc
   UCh77zLsRdMDRGK+/YdT11QRdIA7eqQyRNaJ9D7Z9RLHXTpz9Zc1BHfTW
   zE85eNjloVx37aC7Q82UcshIpRtDuAKiFSoqYbso/ivO7GMPdMEq7agjR
   pX0nyLukP/TUHDj4SeRLXU+0cgl69LoNc2PBuesqSbc5DtuKo853tJ/x3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366867393"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="366867393"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071692713"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="1071692713"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 11:16:10 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v4 3/6] drm/xe/hwmon: Expose card reactive critical power
Date:   Mon,  4 Sep 2023 23:52:55 +0530
Message-Id: <20230904182258.2291881-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904182258.2291881-1-badal.nilawar@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose the card reactive critical (I1) power. I1 is exposed as
power1_crit in microwatts (typically for client products) or as
curr1_crit in milliamperes (typically for server).

v2: Move PCODE_MBOX macro to pcode file (Riana)
v3: s/IS_DG2/(gt_to_xe(gt)->info.platform == XE_DG2)
v4: Fix review comments (Andi)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 105 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pcode.h                 |   5 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
 4 files changed, 142 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index da0197a29fe4..37263b09b6e4 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
+Date:		September 2023
+KernelVersion:	6.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in microwatts.
+
+		Card reactive critical (I1) power limit in microwatts is exposed
+		for client products. The power controller will throttle the
+		operating frequency if the power averaged over a window exceeds
+		this limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
+Date:		September 2023
+KernelVersion:	6.5
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in milliamperes.
+
+		Card reactive critical (I1) power limit in milliamperes is
+		exposed for server products. The power controller will throttle
+		the operating frequency if the power averaged over a window
+		exceeds this limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index d66d633724a5..12298a0e8636 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -12,6 +12,8 @@
 #include "xe_gt.h"
 #include "xe_hwmon.h"
 #include "xe_mmio.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
 
 enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
@@ -29,6 +31,7 @@ enum xe_hwmon_reg_operation {
  * SF_* - scale factors for particular quantities according to hwmon spec.
  */
 #define SF_POWER	1000000		/* microwatts */
+#define SF_CURR		1000		/* milliamperes */
 
 struct xe_hwmon {
 	struct device *hwmon_dev;
@@ -184,18 +187,43 @@ static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	NULL
 };
 
+/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
+static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
+{
+	/* Avoid Illegal Subcommand error */
+	if (gt_to_xe(gt)->info.platform == XE_DG2)
+		return -ENXIO;
+
+	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
+			     uval, 0);
+}
+
+static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
+{
+	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
+			      uval);
+}
+
 static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 {
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
 	case hwmon_power_rated_max:
 		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
+	case hwmon_power_crit:
+		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
+			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 	default:
 		return 0;
 	}
@@ -204,11 +232,23 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 static int
 xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 {
+	int ret;
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return xe_hwmon_power_max_read(hwmon, val);
 	case hwmon_power_rated_max:
 		return xe_hwmon_power_rated_max_read(hwmon, val);
+	case hwmon_power_crit:
+		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
+		if (ret)
+			return ret;
+		if (!(uval & POWER_SETUP_I1_WATTS))
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_POWER, POWER_SETUP_I1_SHIFT);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -217,9 +257,63 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
 {
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, val);
+	case hwmon_power_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
+		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t
+xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
+			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	default:
+		return 0;
+	}
+}
+
+static int
+xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
+{
+	int ret;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
+		if (ret)
+			return ret;
+		if (uval & POWER_SETUP_I1_WATTS)
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_CURR, POWER_SETUP_I1_SHIFT);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
+		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -238,6 +332,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_power:
 		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_curr:
+		ret = xe_hwmon_curr_is_visible(hwmon, attr);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -261,6 +358,9 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_power:
 		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
 		break;
+	case hwmon_curr:
+		ret = xe_hwmon_curr_read(hwmon, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -284,6 +384,9 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_power:
 		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
 		break;
+	case hwmon_curr:
+		ret = xe_hwmon_curr_write(hwmon, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 3b4aa8c1a3ba..08cb1d047cba 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -22,4 +22,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
 int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
 
+#define PCODE_MBOX(mbcmd, param1, param2)\
+	(FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
+	| FIELD_PREP(PCODE_MB_PARAM1, param1)\
+	| FIELD_PREP(PCODE_MB_PARAM2, param2))
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 837ff7c71280..5935cfe30204 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -35,6 +35,13 @@
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
 
+#define   PCODE_POWER_SETUP			0x7C
+#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
+#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
+#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
+#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
+#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
-- 
2.25.1

