Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D63CE5525F7
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Jun 2022 22:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242361AbiFTUrJ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Jun 2022 16:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiFTUrH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 16:47:07 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54A01A3BB
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655758026; x=1687294026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kMxUi2k5fR9XOStLMoibRW6B9veBd0Z/+oX4HqLCfCc=;
  b=HPOcPuTTyOHRUtoCJ3Dvl8hiejAUt5ASaHpu7cWyrZrSTvoq0ZAtEeJf
   J0nWaKAPH0EQP1zyx967LOOjbirrHmDMa2hK04ps86z2gxBaRuE73jfg6
   g4lopAiJJmv1v7/DpsCBpChJO+OTHruUAfLSQ12ksdEHx/GAOvXLXEcbC
   hd/HaCcYoFyhDi3rRB4bKm932iEtYhHBbIlv7XotZi4F5qfxs8fYOJwp/
   R4lcUTz2DrhQ2DcxfGnwk1QFkgNTm/rQpkNDtDWE9NsusX9BTyrO4cQU0
   SUwB+p3HkZteOoELksVa+LZWCXT9Kxptbcuih5Y8Tsga52JD1/SvBO5Fj
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263004448"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="263004448"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:47:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="620226970"
Received: from bnilawar-desk.iind.intel.com ([10.145.162.36])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:47:03 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     anshuman.gupta@intel.com, jon.ewins@intel.com,
        ashutosh.dixit@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 3/4] drm/i915/hwmon: Add HWMON power sensor support
Date:   Tue, 21 Jun 2022 02:16:48 +0530
Message-Id: <20220620204649.894703-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620204649.894703-1-badal.nilawar@intel.com>
References: <20220620204649.894703-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

As part of the System Managemenent Interface (SMI), use the HWMON
subsystem to display power utilization.

v2:
  - Fix review comments (Ashutosh)
  - Do not restore power1_max upon module unload/load sequence
    because on production systems modules are always loaded
    and not unloaded/reloaded (Ashutosh)
  - Fix review comments (Jani)
  - Remove endianness conversion (Ashutosh)

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  20 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 226 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h               |  15 ++
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |   7 +
 4 files changed, 267 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 24c4b7477d51..945f472dd4a2 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
 Description:	RO. Current Voltage in millivolt.
 
 		Only supported for particular Intel i915 graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
+Date:		June 2022
+KernelVersion:	5.19
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically seconds)
+		exceeds this limit.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_default
+Date:		June 2022
+KernelVersion:	5.19
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RO. Card default power limit (default TDP setting).
+
+		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index fc06db790243..75935a55f573 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -16,9 +16,22 @@
 #include "intel_mchbar_regs.h"
 #include "gt/intel_gt_regs.h"
 
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ * - power  - microwatts
+ */
+#define SF_POWER	1000000
+
+#define FIELD_SHIFT(__mask)				    \
+	(BUILD_BUG_ON_ZERO(!__builtin_constant_p(__mask)) + \
+		BUILD_BUG_ON_ZERO((__mask) == 0) +	    \
+		__bf_shf(__mask))
 
 struct i915_hwmon_reg {
 	i915_reg_t gt_perf_status;
+	i915_reg_t pkg_power_sku_unit;
+	i915_reg_t pkg_power_sku;
+	i915_reg_t pkg_rapl_limit;
 };
 
 struct i915_hwmon_drvdata {
@@ -30,18 +43,127 @@ struct i915_hwmon_drvdata {
 
 struct i915_hwmon {
 	struct i915_hwmon_drvdata ddat;
+
 	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
+
 	struct i915_hwmon_reg rg;
+
+	u32 power_max_initial_value;
+
+	int scl_shift_power;
 };
 
+static void
+_locked_with_pm_intel_uncore_rmw(struct i915_hwmon_drvdata *ddat,
+				 i915_reg_t reg, u32 clear, u32 set)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	struct intel_uncore *uncore = ddat->uncore;
+	intel_wakeref_t wakeref;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		intel_uncore_rmw(uncore, reg, clear, set);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+static u64
+_scale_and_shift(u32 in, u32 scale_factor, int nshift)
+{
+	u64 out = mul_u32_u32(scale_factor, in);
+
+	/* Shift, rounding to nearest */
+	if (nshift > 0)
+		out = (out + (1 << (nshift - 1))) >> nshift;
+	return out;
+}
+
+/*
+ * This function's return type of u64 allows for the case where the scaling
+ * of the field taken from the 32-bit register value might cause a result to
+ * exceed 32 bits.
+ */
+static u64
+_field_read_and_scale(struct i915_hwmon_drvdata *ddat, i915_reg_t rgadr,
+		      u32 field_msk, int field_shift,
+		      int nshift, u32 scale_factor)
+{
+	struct intel_uncore *uncore = ddat->uncore;
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_value = intel_uncore_read(uncore, rgadr);
+
+	reg_value = (reg_value & field_msk) >> field_shift;
+
+	return _scale_and_shift(reg_value, scale_factor, nshift);
+}
+
+static void
+_field_scale_and_write(struct i915_hwmon_drvdata *ddat, i915_reg_t rgadr,
+		       u32 field_msk, int field_shift,
+		       int nshift, unsigned int scale_factor, long lval)
+{
+	u32 nval;
+	u32 bits_to_clear;
+	u32 bits_to_set;
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
+
+	bits_to_clear = field_msk;
+	bits_to_set = (nval << field_shift) & field_msk;
+
+	_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
+					 bits_to_clear, bits_to_set);
+}
+
+static ssize_t
+i915_power1_max_default_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	u64 val = 0; /* uapi specifies to keep visible but return 0 if unsupported */
+
+	if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku))
+		val = _field_read_and_scale(ddat,
+					    hwmon->rg.pkg_power_sku,
+					    PKG_PKG_TDP,
+					    FIELD_SHIFT(PKG_PKG_TDP),
+					    hwmon->scl_shift_power,
+					    SF_POWER);
+	return sysfs_emit(buf, "%llu\n", val);
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_default, 0444,
+			  i915_power1_max_default_show, NULL, 0);
+
 static struct attribute *hwmon_attributes[] = {
+	&sensor_dev_attr_power1_max_default.dev_attr.attr,
 	NULL
 };
 
 static umode_t hwmon_attributes_visible(struct kobject *kobj,
 					struct attribute *attr, int index)
 {
-	return 0;
+	struct device *dev = kobj_to_dev(kobj);
+	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
+	struct drm_i915_private *i915 = ddat->uncore->i915;
+	i915_reg_t rgadr;
+
+	if (attr == &sensor_dev_attr_power1_max_default.dev_attr.attr)
+		return IS_DGFX(i915) ? attr->mode : 0;
+	else
+		return 0;
+
+	if (!i915_mmio_reg_valid(rgadr))
+		return 0;
+
+	return attr->mode;
 }
 
 static const struct attribute_group hwmon_attrgroup = {
@@ -54,6 +176,19 @@ static const struct attribute_group *hwmon_groups[] = {
 	NULL
 };
 
+/*
+ * HWMON SENSOR TYPE = hwmon_power
+ *  - Sustained Power (power1_max)
+ */
+static const u32 i915_config_power[] = {
+	HWMON_P_MAX,
+	0
+};
+
+static const struct hwmon_channel_info i915_power = {
+	.type = hwmon_power,
+	.config = i915_config_power,
+};
 
 /*
  * HWMON SENSOR TYPE = hwmon_in
@@ -71,6 +206,7 @@ static const struct hwmon_channel_info i915_in = {
 
 static const struct hwmon_channel_info *i915_info[] = {
 	&i915_in,
+	&i915_power,
 	NULL
 };
 
@@ -87,6 +223,21 @@ i915_in_is_visible(const struct i915_hwmon_drvdata *ddat, u32 attr)
 	}
 }
 
+static umode_t
+i915_power_is_visible(const struct i915_hwmon_drvdata *ddat, u32 attr, int chan)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+
+	switch (attr) {
+	case hwmon_power_max:
+		if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+			return 0664;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
 static int
 i915_in_read(struct i915_hwmon_drvdata *ddat, u32 attr, long *val)
 {
@@ -105,6 +256,44 @@ i915_in_read(struct i915_hwmon_drvdata *ddat, u32 attr, long *val)
 	}
 }
 
+static int
+i915_power_read(struct i915_hwmon_drvdata *ddat, u32 attr, int chan, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+
+	switch (attr) {
+	case hwmon_power_max:
+		*val = _field_read_and_scale(ddat,
+					     hwmon->rg.pkg_rapl_limit,
+					     PKG_PWR_LIM_1,
+					     FIELD_SHIFT(PKG_PWR_LIM_1),
+					     hwmon->scl_shift_power,
+					     SF_POWER);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+i915_power_write(struct i915_hwmon_drvdata *ddat, u32 attr, int chan, long val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+
+	switch (attr) {
+	case hwmon_power_max:
+		_field_scale_and_write(ddat,
+				       hwmon->rg.pkg_rapl_limit,
+				       PKG_PWR_LIM_1,
+				       FIELD_SHIFT(PKG_PWR_LIM_1),
+				       hwmon->scl_shift_power,
+				       SF_POWER, val);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 i915_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		u32 attr, int channel)
@@ -114,6 +303,8 @@ i915_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_in:
 		return i915_in_is_visible(ddat, attr);
+	case hwmon_power:
+		return i915_power_is_visible(ddat, attr, channel);
 	default:
 		return 0;
 	}
@@ -128,6 +319,8 @@ i915_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	switch (type) {
 	case hwmon_in:
 		return i915_in_read(ddat, attr, val);
+	case hwmon_power:
+		return i915_power_read(ddat, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -137,7 +330,11 @@ static int
 i915_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	   int channel, long val)
 {
+	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_power:
+		return i915_power_write(ddat, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -158,13 +355,40 @@ static void
 i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
 {
 	struct i915_hwmon *hwmon = i915->hwmon;
+	struct intel_uncore *uncore = &i915->uncore;
+	intel_wakeref_t wakeref;
+	u32 val_sku_unit;
 
 	if (IS_DG1(i915) || IS_DG2(i915)) {
 		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
+		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
+		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
 	} else {
 		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
+		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
+		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
 	}
 
+
+	with_intel_runtime_pm(uncore->rpm, wakeref) {
+		/*
+		 * The contents of register hwmon->rg.pkg_power_sku_unit do not change,
+		 * so read it once and store the shift values.
+		 *
+		 * For some platforms, this value is defined as available "for all
+		 * tiles", with the values consistent across all tiles.
+		 * In this case, use the tile 0 value for all.
+		 */
+		if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit)) {
+			val_sku_unit = intel_uncore_read(uncore,
+							 hwmon->rg.pkg_power_sku_unit);
+		} else
+			val_sku_unit = 0;
+
+		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+	}
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 932bd6aa4a0a..4809565a3454 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1866,6 +1866,21 @@
 #define   POWER_LIMIT_4_MASK		REG_BIT(9)
 #define   POWER_LIMIT_1_MASK		REG_BIT(11)
 #define   POWER_LIMIT_2_MASK		REG_BIT(12)
+/*
+ * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
+ * Used herein as a 64-bit register.
+ * These masks are defined using GENMASK_ULL as REG_GENMASK is limited to u32
+ * and as GENMASK is "long" and therefore 32-bits on a 32-bit system.
+ * PKG_PKG_TDP, PKG_MIN_PWR, and PKG_MAX_PWR are scaled in the same way as
+ * PKG_PWR_LIM_*, above.
+ * PKG_MAX_WIN has sub-fields for x and y, and has the value: is 1.x * 2^y.
+ */
+#define   PKG_PKG_TDP			GENMASK_ULL(14, 0)
+#define   PKG_MIN_PWR			GENMASK_ULL(30, 16)
+#define   PKG_MAX_PWR			GENMASK_ULL(46, 32)
+#define   PKG_MAX_WIN			GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_Y		GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_X		GENMASK_ULL(52, 48)
 
 #define CHV_CLK_CTL1			_MMIO(0x101100)
 #define VLV_CLK_CTL2			_MMIO(0x101104)
diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index 2aad2f0cc8db..a3eccdee0ca4 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -191,11 +191,18 @@
 
 #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
 #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
+#define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
+#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
+#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
+
 #define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
 #define   RP0_CAP_MASK				REG_GENMASK(7, 0)
 #define   RP1_CAP_MASK				REG_GENMASK(15, 8)
 #define   RPN_CAP_MASK				REG_GENMASK(23, 16)
 
+#define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
+#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
+
 /* snb MCH registers for priority tuning */
 #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
 #define   SSKPD_NEW_WM0_MASK_HSW		REG_GENMASK64(63, 56)
-- 
2.25.1

