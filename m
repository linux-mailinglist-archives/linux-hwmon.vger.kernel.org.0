Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200FC7BBD4C
	for <lists+linux-hwmon@lfdr.de>; Fri,  6 Oct 2023 18:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232966AbjJFQyk (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 6 Oct 2023 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjJFQyj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Oct 2023 12:54:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61256AD
        for <linux-hwmon@vger.kernel.org>; Fri,  6 Oct 2023 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696611278; x=1728147278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjZNQc8te2tPkF51wXbxuuQNO+uIRzdw90J6b5j60LY=;
  b=RLg88lQWiKt72MvHTyDX88evT+CFT5zVu37/haz4aVD7VURC88tFf8mQ
   Qw9XxxT5YTm99QOOweLOhVXdFNThUKVJuNARYgnuTgauoWQjizMVM7E95
   lwJSH9CT73S3f6RIfXpUA3Wym+kf0L4bZ08bMh6AVcAOVD5EK5fZwesip
   1LCA22UC8pQOCBA2/2SzsYfaEtBRp2lyhrImkVKlvt2tMKmUbKplbksBz
   Bki40D/wYAOnA+9qgZuKXl2IKenAyKNSYkZ7zPjJf70/5wESDC3OEde1T
   RDVy5GGA1dgbPtBXsiK/Omw+uYdxvFD5Ca9yE645HsZijurRXyjZxmfRX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450276162"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="450276162"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="842894439"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="842894439"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 09:54:35 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        andi.shyti@linux.intel.com, riana.tauro@intel.com,
        rodrigo.vivi@intel.com
Subject: [PATCH 2/2] drm/xe/hwmon: Expose power1_max_interval
Date:   Fri,  6 Oct 2023 22:32:05 +0530
Message-Id: <20231006170205.4136927-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006170205.4136927-1-badal.nilawar@intel.com>
References: <20231006170205.4136927-1-badal.nilawar@intel.com>
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
PACKAGE_RAPL_LIMIT register (1.x * power(2,y))

v2: Get rpm wake ref while accessing power1_max_interval
v3: %s/hwmon/xe_hwmon/
v4:
 - As power1_max_interval is rw attr take lock in read function as well
 - Refine comment about val to fix point conversion (Andi)
 - Update kernel version and date in doc

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 ++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 142 +++++++++++++++++-
 3 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 1a7a6c23e141..8c321bc9dc04 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -59,3 +59,12 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Energy input of device in microjoules.
 
 		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		October 2023
+KernelVersion:	6.6
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index d8ecbe1858d1..519dd1067a19 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -22,15 +22,23 @@
 #define   PKG_TDP				GENMASK_ULL(14, 0)
 #define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
 #define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
+#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
+
 
 #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
 #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
+#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
 
 #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
+#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
+#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
 
 #endif /* _XE_MCHBAR_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 391f9a8dd9d7..867481c91826 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
 #define SF_CURR		1000		/* milliamperes */
 #define SF_VOLTAGE	1000		/* millivolts */
 #define SF_ENERGY	1000000		/* microjoules */
+#define SF_TIME		1000		/* milliseconds */
 
 struct xe_hwmon_energy_info {
 	u32 reg_val_prev;
@@ -50,6 +51,7 @@ struct xe_hwmon {
 	struct mutex hwmon_lock;	/* For rw attributes */
 	int scl_shift_power;
 	int scl_shift_energy;
+	int scl_shift_time;
 	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
 };
 
@@ -253,6 +255,142 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 				  hwmon->scl_shift_energy);
 }
 
+static ssize_t
+xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	u32 r, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
+			     REG_READ, &r, 0, 0);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
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
+xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
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
+	 * explained in xe_hwmon_power1_max_interval_show()
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
+	/*
+	 * Convert val to 1.x * power(2,y)
+	 * y = ilog2(val)
+	 * x = (val - (1 << y)) >> (y - 2)
+	 */
+	if (!val) {
+		y = 0;
+		x = 0;
+	} else {
+		y = ilog2(val);
+		x = (val - (1ul << y)) << x_w >> y;
+	}
+
+	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
+			     PKG_PWR_LIM_1_TIME, rxy);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  xe_hwmon_power1_max_interval_show,
+			  xe_hwmon_power1_max_interval_store, 0);
+
+static struct attribute *hwmon_attributes[] = {
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	NULL
+};
+
+static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
+					   struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret = 0;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? attr->mode : 0;
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return ret;
+}
+
+static const struct attribute_group hwmon_attrgroup = {
+	.attrs = hwmon_attributes,
+	.is_visible = xe_hwmon_attributes_visible,
+};
+
+static const struct attribute_group *hwmon_groups[] = {
+	&hwmon_attrgroup,
+	NULL
+};
+
 static const struct hwmon_channel_info *hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
@@ -574,6 +712,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT, REG_READ, &val_sku_unit, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 	}
 
 	/*
@@ -620,7 +759,8 @@ void xe_hwmon_register(struct xe_device *xe)
 	/*  hwmon_dev points to device hwmon<i> */
 	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", hwmon,
 								&hwmon_chip_info,
-								NULL);
+								hwmon_groups);
+
 	if (IS_ERR(hwmon->hwmon_dev)) {
 		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
 		xe->hwmon = NULL;
-- 
2.25.1

