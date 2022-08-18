Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62934598CAD
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Aug 2022 21:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239849AbiHRThM (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 18 Aug 2022 15:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiHRThL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Aug 2022 15:37:11 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D060D020C
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Aug 2022 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660851430; x=1692387430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bHY1Gj44M90hYdiItOj7Ifcw886jVE1Vw2vh0ETruBs=;
  b=FJC784jQx9LXDJvo5E6Gf67fd232XE8x8K90ecer9kuKCzKighcdNvlM
   Gu5pA8WN/JuUaT34ZuSFG0BB5JGVyJ5jATiMUnNt1INqHo6e0hKKBTXKY
   hfBm7MQFk5e/twU8myolBsrpq43zQ7b14xfZwSdrFFXpVd3E1EB1fTS/v
   8OKgifx+i78RCzBYV9+vHoU+T1dVY5M/+o8K+IBnnBVha7G6Cn7/7lUcK
   6m1UWD+PJVqSG5sdTBHlLS+Kle9MZqrgeVXnN/K59glSj1/ixGQSfPpyT
   cCTm/uA3P9mRD+UhY5lN5v1vVB+NJhEBvq3/iwshdmWwOfxtQUAchJ3fj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="272627857"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="272627857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 12:37:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="604364649"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2022 12:37:07 -0700
From:   Badal Nilawar <badal.nilawar@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com, linux@roeck-us.net
Subject: [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Date:   Fri, 19 Aug 2022 01:08:55 +0530
Message-Id: <20220818193901.2974625-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818193901.2974625-1-badal.nilawar@intel.com>
References: <20220818193901.2974625-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Dale B Stimson <dale.b.stimson@intel.com>

The i915 HWMON module will be used to expose voltage, power and energy
values for dGfx. Here we set up i915 hwmon infrastructure including i915
hwmon registration, basic data structures and functions.

v2:
  - Create HWMON infra patch (Ashutosh)
  - Fixed review comments (Jani)
  - Remove "select HWMON" from i915/Kconfig (Jani)
v3: Use hwm_ prefix for static functions (Ashutosh)
v4: s/#ifdef CONFIG_HWMON/#if IS_REACHABLE(CONFIG_HWMON)/ since the former
    doesn't work if hwmon is compiled as a module (Guenter)

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/Makefile      |   3 +
 drivers/gpu/drm/i915/i915_driver.c |   7 ++
 drivers/gpu/drm/i915/i915_drv.h    |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c  | 135 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h  |  20 +++++
 5 files changed, 167 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 522ef9b4aff3..2b235f747490 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -208,6 +208,9 @@ i915-y += gt/uc/intel_uc.o \
 # graphics system controller (GSC) support
 i915-y += gt/intel_gsc.o
 
+# graphics hardware monitoring (HWMON) support
+i915-$(CONFIG_HWMON) += i915_hwmon.o
+
 # modesetting core code
 i915-y += \
 	display/hsw_ips.o \
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index deb8a8b76965..62340cd01dde 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -80,6 +80,7 @@
 #include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_getparam.h"
+#include "i915_hwmon.h"
 #include "i915_ioc32.h"
 #include "i915_ioctl.h"
 #include "i915_irq.h"
@@ -736,6 +737,9 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	intel_gt_driver_register(to_gt(dev_priv));
 
+#if IS_REACHABLE(CONFIG_HWMON)
+	i915_hwmon_register(dev_priv);
+#endif
 	intel_display_driver_register(dev_priv);
 
 	intel_power_domains_enable(dev_priv);
@@ -762,6 +766,9 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_unregister(dev_priv);
 
+#if IS_REACHABLE(CONFIG_HWMON)
+	i915_hwmon_unregister(dev_priv);
+#endif
 	intel_gt_driver_unregister(to_gt(dev_priv));
 
 	i915_perf_unregister(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 086bbe8945d6..d437d588dec9 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -705,6 +705,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct i915_hwmon *hwmon;
+
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt0;
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
new file mode 100644
index 000000000000..5b80a0f024f0
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/types.h>
+
+#include "i915_drv.h"
+#include "i915_hwmon.h"
+#include "intel_mchbar_regs.h"
+
+struct hwm_reg {
+};
+
+struct hwm_drvdata {
+	struct i915_hwmon *hwmon;
+	struct intel_uncore *uncore;
+	struct device *hwmon_dev;
+	char name[12];
+};
+
+struct i915_hwmon {
+	struct hwm_drvdata ddat;
+	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
+	struct hwm_reg rg;
+};
+
+static const struct hwmon_channel_info *hwm_info[] = {
+	NULL
+};
+
+static umode_t
+hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+	       u32 attr, int channel)
+{
+	switch (type) {
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	 int channel, long *val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	  int channel, long val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwm_ops = {
+	.is_visible = hwm_is_visible,
+	.read = hwm_read,
+	.write = hwm_write,
+};
+
+static const struct hwmon_chip_info hwm_chip_info = {
+	.ops = &hwm_ops,
+	.info = hwm_info,
+};
+
+static void
+hwm_get_preregistration_info(struct drm_i915_private *i915)
+{
+}
+
+void i915_hwmon_register(struct drm_i915_private *i915)
+{
+	struct device *dev = i915->drm.dev;
+	struct i915_hwmon *hwmon;
+	struct device *hwmon_dev;
+	struct hwm_drvdata *ddat;
+
+	/* hwmon is available only for dGfx */
+	if (!IS_DGFX(i915))
+		return;
+
+	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return;
+
+	i915->hwmon = hwmon;
+	mutex_init(&hwmon->hwmon_lock);
+	ddat = &hwmon->ddat;
+
+	ddat->hwmon = hwmon;
+	ddat->uncore = &i915->uncore;
+	snprintf(ddat->name, sizeof(ddat->name), "i915");
+
+	hwm_get_preregistration_info(i915);
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
+						    ddat,
+						    &hwm_chip_info,
+						    NULL);
+	if (IS_ERR(hwmon_dev)) {
+		mutex_destroy(&hwmon->hwmon_lock);
+		i915->hwmon = NULL;
+		kfree(hwmon);
+		return;
+	}
+
+	ddat->hwmon_dev = hwmon_dev;
+}
+
+void i915_hwmon_unregister(struct drm_i915_private *i915)
+{
+	struct i915_hwmon *hwmon;
+	struct hwm_drvdata *ddat;
+
+	hwmon = fetch_and_zero(&i915->hwmon);
+	if (!hwmon)
+		return;
+
+	ddat = &hwmon->ddat;
+	if (ddat->hwmon_dev)
+		hwmon_device_unregister(ddat->hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+	kfree(hwmon);
+}
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
new file mode 100644
index 000000000000..921ae76099d3
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __I915_HWMON_H__
+#define __I915_HWMON_H__
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include "i915_reg.h"
+
+struct drm_i915_private;
+
+void i915_hwmon_register(struct drm_i915_private *i915);
+void i915_hwmon_unregister(struct drm_i915_private *i915);
+
+#endif /* __I915_HWMON_H__ */
-- 
2.25.1

