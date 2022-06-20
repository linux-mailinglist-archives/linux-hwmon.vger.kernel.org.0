Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5E95525F5
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Jun 2022 22:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242219AbiFTUrG (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Jun 2022 16:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbiFTUrE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 16:47:04 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1091A3BB
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655758024; x=1687294024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y/uNCIZaLz22zf1BxHs33T9ILA4EiCh7IPkE3oYgg8A=;
  b=ECGVN7NvpdTVdHWUF6xx4EI4/W+VQStumwbpXEOaRwYfrtIFiUtmZJtp
   CAxcbyHLsUnVruF3Knmh0Q02rpfeTXZH6/3NL/5gIIkb4/Ms1dR+mIoGB
   FwTbjN6NwLPUySOok7P3F+PiH3EHlg2UTZKzmunkBePSs76pJAa3bten9
   JPvNZX6DFuGMAUrumf4owY5lJi4dTVBoJ3dVGStwrkeqoe+uXvBsVema7
   BsOoGcBJYohO+/FBIwA0Me8uwycTz0Lcmt37snQGIwtC3YTe4PFiNWO7p
   r2LsdFNRkFCRp00KDhm+Wx9LvU1MWLhVLT1AxyxokHnVxvcOu30WiHS3E
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263004444"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="263004444"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:47:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="620226955"
Received: from bnilawar-desk.iind.intel.com ([10.145.162.36])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:47:01 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     anshuman.gupta@intel.com, jon.ewins@intel.com,
        ashutosh.dixit@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH 2/4] drm/i915/hwmon: Add HWMON current voltage support
Date:   Tue, 21 Jun 2022 02:16:47 +0530
Message-Id: <20220620204649.894703-3-badal.nilawar@intel.com>
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

From: Riana Tauro <riana.tauro@intel.com>

As part of the System Managemenent Interface (SMI), use the HWMON
subsystem to display current voltage

v2:
  - Updated date and kernel version in feature description
  - Fixed review comments (Ashutosh)

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 63 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
new file mode 100644
index 000000000000..24c4b7477d51
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -0,0 +1,7 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		June 2022
+KernelVersion:	5.19
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
+		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 07ef111947b8..63a39e1e00e2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1487,6 +1487,9 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_RPSTAT1				_MMIO(0x1381b4)
+#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 2ef40b0c1e70..fc06db790243 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -14,9 +14,11 @@
 #include "i915_hwmon.h"
 #include "i915_drv.h"
 #include "intel_mchbar_regs.h"
+#include "gt/intel_gt_regs.h"
 
 
 struct i915_hwmon_reg {
+	i915_reg_t gt_perf_status;
 };
 
 struct i915_hwmon_drvdata {
@@ -53,15 +55,65 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 
+/*
+ * HWMON SENSOR TYPE = hwmon_in
+ *  - Voltage Input value (in0_input)
+ */
+static const u32 i915_config_in[] = {
+	HWMON_I_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info i915_in = {
+	.type = hwmon_in,
+	.config = i915_config_in,
+};
+
 static const struct hwmon_channel_info *i915_info[] = {
+	&i915_in,
 	NULL
 };
 
+static umode_t
+i915_in_is_visible(const struct i915_hwmon_drvdata *ddat, u32 attr)
+{
+	struct drm_i915_private *i915 = ddat->uncore->i915;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return (IS_DG1(i915) || IS_DG2(i915)) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+i915_in_read(struct i915_hwmon_drvdata *ddat, u32 attr, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+
+	switch (attr) {
+	case hwmon_in_input:
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
+		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 i915_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		u32 attr, int channel)
 {
+	struct i915_hwmon_drvdata *ddat = (struct i915_hwmon_drvdata *)drvdata;
+
 	switch (type) {
+	case hwmon_in:
+		return i915_in_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -71,7 +123,11 @@ static int
 i915_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	  int channel, long *val)
 {
+	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_in:
+		return i915_in_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -101,6 +157,13 @@ static const struct hwmon_chip_info i915_chip_info = {
 static void
 i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
 {
+	struct i915_hwmon *hwmon = i915->hwmon;
+
+	if (IS_DG1(i915) || IS_DG2(i915)) {
+		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
+	} else {
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
+	}
 
 }
 
-- 
2.25.1

