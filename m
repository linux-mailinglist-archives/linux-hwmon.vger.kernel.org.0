Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 565925EB9F3
	for <lists+linux-hwmon@lfdr.de>; Tue, 27 Sep 2022 07:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiI0FsD (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 27 Sep 2022 01:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiI0FsC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 01:48:02 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB0B8F97F
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 22:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664257678; x=1695793678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EC+xkcqTY6nm3VNh4vHiVrDESdrXABBUnqVDfHmnF7s=;
  b=FoSN7gq2/EBUdsHEBOka/aCeR8aotJq/TLoox3YrF6DYpAeWsrEuuQA8
   989qbWkVjMhEs5zqAhBFhsgpY/8PltQTbEmVljHBtiCMQxznK/okACEBO
   6BgpF0kTFymEXj1xLLOdDi5JU9fjxElAvTEmdG8+k7t3TXCVjiO+SV63k
   /eyt5krxW3aSRwp2bP6GY7gYtWLYbtopzo6Iyt4zxBtgnNp/PK/BIBuRv
   h9xxMNt+McZCoiF4UIsMZHYpVryFXCHX5q9ytkrsgd0mz/Ifys4oymWd5
   33x5RAbH/HQ+/O4cjGU+YYnJUK2Qfe9hWjEfrGQ58c3unjA5A9G4bnq1+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327582716"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="327582716"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:47:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725376865"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="725376865"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 22:47:55 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     ashutosh.dixit@intel.com, riana.tauro@intel.com,
        anshuman.gupta@intel.com, jon.ewins@intel.com,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andi.shyti@intel.com, tvrtko.ursulin@intel.com
Subject: [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Date:   Tue, 27 Sep 2022 11:20:19 +0530
Message-Id: <20220927055020.3499420-7-badal.nilawar@intel.com>
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |   9 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 115 +++++++++++++++++-
 drivers/gpu/drm/i915/intel_mchbar_regs.h      |   7 ++
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index f9d6d3b08bba..19b9fe3ef237 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel i915 graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel i915 graphics platforms.
+
 What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
 Date:		February 2023
 KernelVersion:	6.2
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 2394fa789793..641143956c45 100644
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
@@ -161,6 +164,115 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	return 0;
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
+	long val, max_win, ret;
+	u32 x, y, rxy, x_w = 2; /* 2 bits */
+	u64 tau4, r;
+
+#define PKG_MAX_WIN_DEFAULT 0x12ull
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * val must be < max in hwmon interface units. The steps below are
+	 * explained in i915_power1_max_interval_show()
+	 */
+	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
+
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
+	else
+		return 0;
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
@@ -472,6 +584,7 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 
 	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+	hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 
 	/*
 	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
@@ -510,7 +623,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwm_chip_info,
-							 NULL);
+							 hwm_groups);
 	if (IS_ERR(hwmon_dev)) {
 		i915->hwmon = NULL;
 		return;
diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index bd42fb66e297..64aa1e9be463 100644
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
2.25.1

