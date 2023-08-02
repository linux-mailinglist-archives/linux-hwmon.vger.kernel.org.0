Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B53176CF1D
	for <lists+linux-hwmon@lfdr.de>; Wed,  2 Aug 2023 15:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbjHBNqt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 2 Aug 2023 09:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbjHBNqn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 09:46:43 -0400
Received: from mgamail.intel.com (unknown [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1ACF5
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 06:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690984002; x=1722520002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGKYVa4sL2FP4TbBC95+bNIONvGOXW5ddaPs6VBGCrU=;
  b=WDguVctZiInMnXTtwlBlzVSbihzoMl8ONHjgs6+vfHvDbNoj51EiGlck
   zb2rHyFt9edi/dg415C2QN41rhePGBh3ZnZIGRsf4tJYBf1YrkjdFQeC+
   16DS+91NYrrb2kgjtTib+80KWi5iMV8tmUk5tPCBljFj3eSsoDVg4t9+I
   tyfeZS1AKoLEI5W+lvUmaajJP2s7/1rNY6mmDwfhGicgAAZm9d+YAim/m
   KTGD+CTIb24ustcqkf0z8nUuMiYzBPa6iWyeJs7ihzNJFgQkWhtQ/3IAm
   viab7ApCuDhNB0iyJyigMnO5fKyI0C0l/E017sRFxFYK/t4Y7nBYVSx+l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534998"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="400534998"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873984"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="852873984"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:46:39 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Cc:     anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: [PATCH v3 6/6] drm/xe/hwmon: Expose power1_max_interval
Date:   Wed,  2 Aug 2023 19:22:41 +0530
Message-Id: <20230802135241.458855-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  11 ++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 139 +++++++++++++++++-
 3 files changed, 157 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 4b2d6e1d0c7f..3be1e55bfac0 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -64,3 +64,14 @@ Description:	RO. Energy input of device or gt in microjoules.
 		for the gt.
 
 		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel xe graphics platforms.
+
+
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 473a44bd7c56..6897fe70b243 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -22,16 +22,24 @@
 #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
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
 
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a337edcebae5..f10b43e24db0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -48,6 +48,7 @@ enum xe_hwmon_device_type {
 #define SF_CURR		1000
 #define SF_VOLTAGE	1000
 #define SF_ENERGY	1000000
+#define SF_TIME		1000
 
 struct hwmon_energy_info {
 	u32 reg_val_prev;
@@ -70,6 +71,7 @@ struct xe_hwmon {
 	wait_queue_head_t waitq;
 	int scl_shift_power;
 	int scl_shift_energy;
+	int scl_shift_time;
 };
 
 #define ddat_to_xe_hwmon(ddat)	\
@@ -312,6 +314,140 @@ hwmon_energy_get(struct xe_hwmon_data *ddat, long *energy)
 	xe_device_mem_access_put(gt_to_xe(ddat->gt));
 }
 
+static ssize_t
+hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+			       char *buf)
+{
+	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
+	struct xe_hwmon *hwmon = container_of(ddat, struct xe_hwmon, ddat);
+	u32 r, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT,
+			  REG_READ, &r, 0, 0);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
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
+hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
+	struct xe_hwmon *hwmon = container_of(ddat, struct xe_hwmon, ddat);
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
+	 * explained in hwmon_power1_max_interval_show()
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
+	if (!val) {
+		/* Avoid ilog2(0) */
+		y = 0;
+		x = 0;
+	} else {
+		y = ilog2(val);
+		/* x = (val - (1 << y)) >> (y - 2); */
+		x = (val - (1ul << y)) << x_w >> y;
+	}
+
+	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
+			  PKG_PWR_LIM_1_TIME, rxy);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  hwmon_power1_max_interval_show,
+			  hwmon_power1_max_interval_store, 0);
+
+static struct attribute *hwmon_attributes[] = {
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	NULL
+};
+
+static umode_t hwmon_attributes_visible(struct kobject *kobj,
+					struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
+	u32 reg_val;
+	int ret = 0;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		ret =  process_hwmon_reg(ddat, REG_PKG_RAPL_LIMIT,
+					 REG_READ, &reg_val, 0, 0) ? 0 : attr->mode;
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
+static const struct attribute_group hwmon_attrgroup = {
+	.attrs = hwmon_attributes,
+	.is_visible = hwmon_attributes_visible,
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
@@ -723,6 +859,7 @@ hwmon_get_preregistration_info(struct xe_device *xe)
 	if (!ret) {
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 	}
 
 	/*
@@ -784,7 +921,7 @@ void xe_hwmon_register(struct xe_device *xe)
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwmon_chip_info,
-							 NULL);
+							 hwmon_groups);
 
 	if (IS_ERR(hwmon_dev)) {
 		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
-- 
2.25.1

