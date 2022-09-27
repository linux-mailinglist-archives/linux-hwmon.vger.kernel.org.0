Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D015EB9F5
	for <lists+linux-hwmon@lfdr.de>; Tue, 27 Sep 2022 07:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiI0FsF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 27 Sep 2022 01:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiI0FsD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 01:48:03 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EBC94139
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 22:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664257681; x=1695793681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hd35ku3m7EDG1I4an6H9d1QzFUopqt4XornHaLuGhqA=;
  b=HBd+Iyx/T4sj5GiYv4hJYGEij5GWEX8FBrFzFSr4LKXUf54k9KsUbWUh
   WEXFXNUA+K5mqpm96HOqcTWNtIl9iU63ts4jtJjbZQ8zsYS61CsdZ+g4Y
   w3BaFnQCqNVF1KJquLZPYGzDenjFUwzV21VBB4mGc8m+5hdAlqxJ+2Dl9
   o6AuY/QD/6xfqAibdAt/7rw5xAk9uowmABKC5Iaw3BeLb2iM7LSVRGSeR
   BVy+VQ/AhBh/05M7Dit7O3LOQjI0w1iVR7iAYHDhN4rNH962qbDyclfbX
   W30GBMJeK95oxioccsM4OZwikZO20s+HyyvdKCebh0qGLbJu21ermEWZn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327582726"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="327582726"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:48:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725376876"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="725376876"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:47:58 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andi.shyti@intel.com, tvrtko.ursulin@intel.com
Subject: [PATCH 7/7] drm/i915/hwmon: Extend power/energy for XEHPSDV
Date:   Tue, 27 Sep 2022 11:20:20 +0530
Message-Id: <20220927055020.3499420-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927055020.3499420-1-badal.nilawar@intel.com>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

Extend hwmon power/energy for XEHPSDV especially per gt level energy
usage.

v2: Update to latest HWMON spec (Ashutosh)
v3: Fix review comments (Ashutosh)
v4: Fix review comments (Anshuman)
v5: s/hwmon_device_register_with_info/
    devm_hwmon_device_register_with_info/ (Ashutosh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   5 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 102 +++++++++++++++++-
 3 files changed, 111 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 19b9fe3ef237..dbd16b0f56d0 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -65,6 +65,11 @@ What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
 Date:		February 2023
 KernelVersion:	6.2
 Contact:	dri-devel@lists.freedesktop.org
-Description:	RO. Energy input of device in microjoules.
+Description:	RO. Energy input of device or gt in microjoules.
+
+		For i915 device level hwmon devices (name "i915") this
+		reflects energy input for the entire device. For gt level
+		hwmon devices (name "i915_gtN") this reflects energy input
+		for the gt.
 
 		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index fcf5f9012852..30458f1cf0dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1592,6 +1592,11 @@
 
 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
 
+#define GT0_PACKAGE_ENERGY_STATUS		_MMIO(0x250004)
+#define GT0_PACKAGE_RAPL_LIMIT			_MMIO(0x250008)
+#define GT0_PACKAGE_POWER_SKU_UNIT		_MMIO(0x250068)
+#define GT0_PLATFORM_ENERGY_STATUS		_MMIO(0x25006c)
+
 /*
  * Standalone Media's non-engine GT registers are located at their regular GT
  * offsets plus 0x380000.  This extra offset is stored inside the intel_uncore
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 641143956c45..d80bc569ebcf 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -12,6 +12,7 @@
 #include "i915_reg.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pcode.h"
+#include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
 
 /*
@@ -34,6 +35,7 @@ struct hwm_reg {
 	i915_reg_t pkg_power_sku;
 	i915_reg_t pkg_rapl_limit;
 	i915_reg_t energy_status_all;
+	i915_reg_t energy_status_tile;
 };
 
 struct hwm_energy_info {
@@ -47,10 +49,12 @@ struct hwm_drvdata {
 	struct device *hwmon_dev;
 	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
 	char name[12];
+	int gt_n;
 };
 
 struct i915_hwmon {
 	struct hwm_drvdata ddat;
+	struct hwm_drvdata ddat_gt[I915_MAX_GT];
 	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
 	struct hwm_reg rg;
 	int scl_shift_power;
@@ -144,7 +148,10 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	i915_reg_t rgaddr;
 	u32 reg_val;
 
-	rgaddr = hwmon->rg.energy_status_all;
+	if (ddat->gt_n >= 0)
+		rgaddr = hwmon->rg.energy_status_tile;
+	else
+		rgaddr = hwmon->rg.energy_status_all;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -281,6 +288,11 @@ static const struct hwmon_channel_info *hwm_info[] = {
 	NULL
 };
 
+static const struct hwmon_channel_info *hwm_gt_info[] = {
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	NULL
+};
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
 {
@@ -410,7 +422,10 @@ hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
 
 	switch (attr) {
 	case hwmon_energy_input:
-		rgaddr = hwmon->rg.energy_status_all;
+		if (ddat->gt_n >= 0)
+			rgaddr = hwmon->rg.energy_status_tile;
+		else
+			rgaddr = hwmon->rg.energy_status_all;
 		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
 	default:
 		return 0;
@@ -545,6 +560,44 @@ static const struct hwmon_chip_info hwm_chip_info = {
 	.info = hwm_info,
 };
 
+static umode_t
+hwm_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		  u32 attr, int channel)
+{
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+
+	switch (type) {
+	case hwmon_energy:
+		return hwm_energy_is_visible(ddat, attr);
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	    int channel, long *val)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_energy:
+		return hwm_energy_read(ddat, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwm_gt_ops = {
+	.is_visible = hwm_gt_is_visible,
+	.read = hwm_gt_read,
+};
+
+static const struct hwmon_chip_info hwm_gt_chip_info = {
+	.ops = &hwm_gt_ops,
+	.info = hwm_gt_info,
+};
+
 static void
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
@@ -553,7 +606,9 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 	struct hwm_drvdata *ddat = &hwmon->ddat;
 	intel_wakeref_t wakeref;
 	u32 val_sku_unit;
+	struct intel_gt *gt;
 	long energy;
+	int i;
 
 	if (IS_DG1(i915) || IS_DG2(i915)) {
 		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
@@ -561,12 +616,21 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
 		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
 		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
+	} else if (IS_XEHPSDV(i915)) {
+		hwmon->rg.pkg_power_sku_unit = GT0_PACKAGE_POWER_SKU_UNIT;
+		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit = GT0_PACKAGE_RAPL_LIMIT;
+		hwmon->rg.energy_status_all = GT0_PLATFORM_ENERGY_STATUS;
+		hwmon->rg.energy_status_tile = GT0_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 	} else {
 		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
 		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
+		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
 	}
 
 	with_intel_runtime_pm(uncore->rpm, wakeref) {
@@ -592,6 +656,10 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 	 */
 	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
 		hwm_energy(ddat, &energy);
+	if (i915_mmio_reg_valid(hwmon->rg.energy_status_tile)) {
+		for_each_gt(gt, i915, i)
+			hwm_energy(&hwmon->ddat_gt[i], &energy);
+	}
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
@@ -600,6 +668,9 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	struct i915_hwmon *hwmon;
 	struct device *hwmon_dev;
 	struct hwm_drvdata *ddat;
+	struct hwm_drvdata *ddat_gt;
+	struct intel_gt *gt;
+	int i;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(i915))
@@ -616,6 +687,16 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	ddat->hwmon = hwmon;
 	ddat->uncore = &i915->uncore;
 	snprintf(ddat->name, sizeof(ddat->name), "i915");
+	ddat->gt_n = -1;
+
+	for_each_gt(gt, i915, i) {
+		ddat_gt = hwmon->ddat_gt + i;
+
+		ddat_gt->hwmon = hwmon;
+		ddat_gt->uncore = gt->uncore;
+		snprintf(ddat_gt->name, sizeof(ddat_gt->name), "i915_gt%u", i);
+		ddat_gt->gt_n = i;
+	}
 
 	hwm_get_preregistration_info(i915);
 
@@ -630,6 +711,23 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	}
 
 	ddat->hwmon_dev = hwmon_dev;
+
+	for_each_gt(gt, i915, i) {
+		ddat_gt = hwmon->ddat_gt + i;
+		/*
+		 * Create per-gt directories only if a per-gt attribute is
+		 * visible. Currently this is only energy
+		 */
+		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
+			continue;
+
+		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
+								 ddat_gt,
+								 &hwm_gt_chip_info,
+								 NULL);
+		if (!IS_ERR(hwmon_dev))
+			ddat_gt->hwmon_dev = hwmon_dev;
+	}
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
-- 
2.25.1

