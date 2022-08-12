Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88575914E6
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Aug 2022 19:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239118AbiHLRfp (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 12 Aug 2022 13:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239534AbiHLRfh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Aug 2022 13:35:37 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A39F76466
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660325736; x=1691861736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9R4cPjYPX1c5sT+4C2xWlqrIjRNGYjihrlyURO/woY4=;
  b=c9ZMnbZZPz2sO4wr+F1InHctYKnDMVdFJO0UWhPas5iZPow55ELMKwCt
   EDDzk9F+tnQsy1iGbSqPmUoWRaB5nJFGm8lfJSCds3R7ER5+/K8/nDZUr
   6X49POcZ6IshaVGftdXNzYzAVD8yber+a1TC9lnvH05yVt3ltpV89kg7L
   XBeXb2uMpusILphJ1JwbLjkrP7qrxl72zxOFLwrnsxkQOtIU3RJB7rbvL
   X8FF29xDbGMGGRH2VwiHPa+gSu/OjWhImD0Kq113Gc8X+sH9KFvit3EE9
   x/0DifFhgBEMQeBRx2knL5iE7+OcFiyt9Mg0SAEAJQ+nTp+0PmoZXeLsI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="291643999"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="291643999"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 10:35:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="665904275"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 10:35:33 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com, linux@roeck-us.net
Subject: [PATCH 2/7] drm/i915/hwmon: Add HWMON current voltage support
Date:   Fri, 12 Aug 2022 23:07:10 +0530
Message-Id: <20220812173715.2398586-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812173715.2398586-1-badal.nilawar@intel.com>
References: <20220812173715.2398586-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Riana Tauro <riana.tauro@intel.com>

Use i915 HWMON subsystem to display current input voltage.

v2:
  - Updated date and kernel version in feature description
  - Fixed review comments (Ashutosh)
v3: Use macro HWMON_CHANNEL_INFO to define hwmon channel (Guenter)
v4:
  - Fixed review comments (Ashutosh)
  - Use hwm_ prefix for static functions (Ashutosh)

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 47 +++++++++++++++++++
 3 files changed, 57 insertions(+)
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
index b3b49f6d6d1c..4604f6dbf8b6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1498,6 +1498,9 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_RPSTAT1				_MMIO(0x1381b4)
+#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 5b80a0f024f0..1893efe796a4 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -10,8 +10,10 @@
 #include "i915_drv.h"
 #include "i915_hwmon.h"
 #include "intel_mchbar_regs.h"
+#include "gt/intel_gt_regs.h"
 
 struct hwm_reg {
+	i915_reg_t gt_perf_status;
 };
 
 struct hwm_drvdata {
@@ -28,14 +30,49 @@ struct i915_hwmon {
 };
 
 static const struct hwmon_channel_info *hwm_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
+static umode_t
+hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		return i915_mmio_reg_valid(ddat->hwmon->rg.gt_perf_status) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+
+	switch (attr) {
+	case hwmon_in_input:
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
+		/* In units of 2.5 millivolt */
+		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
 {
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+
 	switch (type) {
+	case hwmon_in:
+		return hwm_in_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -45,7 +82,11 @@ static int
 hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	 int channel, long *val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_in:
+		return hwm_in_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -75,6 +116,12 @@ static const struct hwmon_chip_info hwm_chip_info = {
 static void
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
+	struct i915_hwmon *hwmon = i915->hwmon;
+
+	if (IS_DG1(i915) || IS_DG2(i915))
+		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
+	else
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.25.1

