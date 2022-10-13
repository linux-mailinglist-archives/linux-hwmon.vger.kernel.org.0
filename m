Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A325FDD66
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Oct 2022 17:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiJMPqI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Oct 2022 11:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJMPqI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 11:46:08 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A5427FCE
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665675966; x=1697211966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ougFtRi+efDHP591ZHt1OeoagdevHOiR7bnLBEwSPrk=;
  b=WMFO5haCSFRLwsN/ycZTzQfjBXXR4HK9B7jgqZEYOAeuBONGS+5r1/En
   CXy7vHs9pk8Wx9lthuPl4QEm8xWNucF7ESz1jOAYYvISR+UlEqp1RZ3b8
   XwCMqkDNRVQY0A3UWgZZQYAAJV37SIASGWaPkJChv2+8BoOHvJl4MvSS0
   J7+z9PmRWmplR4auT0KZAznsM99r4qLwSPmrgUJfzl28V0LCDwaow+Pw9
   KBtrExmCh2uhj3qNjJ1pTkOpjgu4StL5BMvo1suv5Sxtr1y3BrYFwL/aE
   WJHCXvrKZXi5QacpJ/Vz9ohp41hwFWBq9VSmmUFN7D++Gi3kGnVmwfUFJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="367130118"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="367130118"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="660381021"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="660381021"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com) ([10.165.21.138])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:45:30 -0700
From:   Ashutosh Dixit <ashutosh.dixit@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andi Shyti <andi.shyti@intel.com>
Subject: [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Date:   Thu, 13 Oct 2022 08:45:25 -0700
Message-Id: <20221013154526.2105579-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
References: <20221013154526.2105579-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Expose power1_max_interval, that is the tau corresponding to PL1, as a
custom hwmon attribute. Some bit manipulation is needed because of the
format of PKG_PWR_LIM_1_TIME in
GT0_PACKAGE_RAPL_LIMIT register (1.x * power(2,y)).

v2: Update date and kernel version in Documentation (Badal)
v3: Cleaned up hwm_power1_max_interval_store() (Badal)
v4:
  - Fixed review comments (Anshuman)
  - In hwm_power1_max_interval_store() get PKG_MAX_WIN from
    pkg_power_sku when it is valid (Ashutosh)
  - KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)
v5: On some of the DGFX setups it is seen that although pkg_power_sku
    is valid the field PKG_WIN_MAX is not populated. So it is
    decided to stick to default value of PKG_WIN_MAX (Ashutosh)
v6: Change contact to intel-gfx (Rodrigo)
    Fixed variable types in hwm_power1_max_interval_store (Andi)
    Documented PKG_MAX_WIN_DEFAULT (Andi)
    Removed else in hwm_attributes_visible (Andi)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |   9 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 119 +++++++++++++++++-
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |   7 ++
 3 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index a7a6512fcc8ca..9dc5ff14107bb 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel i915 graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel i915 graphics platforms.
+
 What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
 Date:		February 2023
 KernelVersion:	6.2
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 2b24a7a711400..58f80380e5427 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -20,11 +20,13 @@
  * - power  - microwatts
  * - curr   - milliamperes
  * - energy - microjoules
+ * - time   - milliseconds
  */
 #define SF_VOLTAGE	1000
 #define SF_POWER	1000000
 #define SF_CURR		1000
 #define SF_ENERGY	1000000
+#define SF_TIME		1000
 
 struct hwm_reg {
 	i915_reg_t gt_perf_status;
@@ -53,6 +55,7 @@ struct i915_hwmon {
 	struct hwm_reg rg;
 	int scl_shift_power;
 	int scl_shift_energy;
+	int scl_shift_time;
 };
 
 static void
@@ -159,6 +162,119 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	mutex_unlock(&hwmon->hwmon_lock);
 }
 
+static ssize_t
+hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
+	u32 r, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
+
+	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
+
+	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
+	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
+	/*
+	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
+	 *     = (4 | x) << (y - 2)
+	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
+	 * However because y can be < 2, we compute
+	 *     tau4 = (4 | x) << y
+	 * but add 2 when doing the final right shift to account for units
+	 */
+	tau4 = ((1 << x_w) | x) << y;
+	/* val in hwmon interface units (millisec) */
+	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	return sysfs_emit(buf, "%llu\n", out);
+}
+
+static ssize_t
+hwm_power1_max_interval_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	u32 x, y, rxy, x_w = 2; /* 2 bits */
+	u64 tau4, r, max_win;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12
+	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds
+	 */
+#define PKG_MAX_WIN_DEFAULT 0x12ull
+
+	/*
+	 * val must be < max in hwmon interface units. The steps below are
+	 * explained in i915_power1_max_interval_show()
+	 */
+	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
+	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
+	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
+	tau4 = ((1 << x_w) | x) << y;
+	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	if (val > max_win)
+		return -EINVAL;
+
+	/* val in hw units */
+	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
+	/* Convert to 1.x * power(2,y) */
+	if (!val)
+		return -EINVAL;
+	y = ilog2(val);
+	/* x = (val - (1 << y)) >> (y - 2); */
+	x = (val - (1ul << y)) << x_w >> y;
+
+	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+
+	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
+					    PKG_PWR_LIM_1_TIME, rxy);
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  hwm_power1_max_interval_show,
+			  hwm_power1_max_interval_store, 0);
+
+static struct attribute *hwm_attributes[] = {
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	NULL
+};
+
+static umode_t hwm_attributes_visible(struct kobject *kobj,
+				      struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct i915_hwmon *hwmon = ddat->hwmon;
+
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
+
+	return 0;
+}
+
+static const struct attribute_group hwm_attrgroup = {
+	.attrs = hwm_attributes,
+	.is_visible = hwm_attributes_visible,
+};
+
+static const struct attribute_group *hwm_groups[] = {
+	&hwm_attrgroup,
+	NULL
+};
+
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
@@ -471,6 +587,7 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 
 	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+	hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 
 	/*
 	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
@@ -509,7 +626,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwm_chip_info,
-							 NULL);
+							 hwm_groups);
 	if (IS_ERR(hwmon_dev)) {
 		i915->hwmon = NULL;
 		return;
diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index decd411c2cdd0..f93e9af43ac35 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -194,6 +194,9 @@
  */
 #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
 #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
+#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
 
 #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
@@ -212,6 +215,10 @@
 #define   RPE_MASK				REG_GENMASK(15, 8)
 #define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
+#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
+#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
+#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
 
 /* snb MCH registers for priority tuning */
 #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
-- 
2.38.0

