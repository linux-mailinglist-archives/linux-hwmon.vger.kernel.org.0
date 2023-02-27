Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BF56A380F
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Feb 2023 03:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjB0COh (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 26 Feb 2023 21:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjB0CN4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 26 Feb 2023 21:13:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA3C1DB9C;
        Sun, 26 Feb 2023 18:11:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C465B60CF9;
        Mon, 27 Feb 2023 02:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486C1C433D2;
        Mon, 27 Feb 2023 02:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677463827;
        bh=TS/TXdAGnOO9YFbg2Hze6IQSoGWYEcKCJfWy6I4UrlQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zd/41/7gChveJX/DSZZoQkSrPrmLjdhUcq2D8HMllNC4b/lZDRBt5hJb+to18IARN
         A0iMRsCpZSxDOt9q+wdJyl+DL1Dz2+SjFw3RuapLiap3Ighxr0HkdWLwNfLaXCZdd+
         eI5JOPn4k1oUQEwqB6m+khoHcCLYJipIPmLfFxujT07Y2OCnbnF1J4SaFOjORKPubw
         9bUqY5TwVbpx+wrWQYB8E7+ibrl7Wr9rRYIoEmg7397hqtZIsCXTSM5Wp/83ISp8K3
         bvpa6v+cxkWU4jUsIAkflyZC1rgQr/423ADUH7d/2YRKZoMU0Zy5SgCNyAuN4KcMd9
         Ze1D6azL/B4og==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, fenghua.yu@intel.com,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/19] hwmon: (coretemp) Simplify platform device handling
Date:   Sun, 26 Feb 2023 21:09:48 -0500
Message-Id: <20230227020957.1052252-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020957.1052252-1-sashal@kernel.org>
References: <20230227020957.1052252-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit 6d03bbff456befeccdd4d663177c4d6c75d0c4ff ]

Coretemp's platform driver is unconventional. All the real work is done
globally by the initcall and CPU hotplug notifiers, while the "driver"
effectively just wraps an allocation and the registration of the hwmon
interface in a long-winded round-trip through the driver core.  The whole
logic of dynamically creating and destroying platform devices to bring
the interfaces up and down is error prone, since it assumes
platform_device_add() will synchronously bind the driver and set drvdata
before it returns, thus results in a NULL dereference if drivers_autoprobe
is turned off for the platform bus. Furthermore, the unusual approach of
doing that from within a CPU hotplug notifier, already commented in the
code that it deadlocks suspend, also causes lockdep issues for other
drivers or subsystems which may want to legitimately register a CPU
hotplug notifier from a platform bus notifier.

All of these issues can be solved by ripping this unusual behaviour out
completely, simply tying the platform devices to the lifetime of the
module itself, and directly managing the hwmon interfaces from the
hotplug notifiers. There is a slight user-visible change in that
/sys/bus/platform/drivers/coretemp will no longer appear, and
/sys/devices/platform/coretemp.n will remain present if package n is
hotplugged off, but hwmon users should really only be looking for the
presence of the hwmon interfaces, whose behaviour remains unchanged.

Link: https://lore.kernel.org/lkml/20220922101036.87457-1-janusz.krzysztofik@linux.intel.com/
Link: https://gitlab.freedesktop.org/drm/intel/issues/6641
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Link: https://lore.kernel.org/r/20230103114620.15319-1-janusz.krzysztofik@linux.intel.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/coretemp.c | 128 ++++++++++++++++++---------------------
 1 file changed, 58 insertions(+), 70 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 42b84ebff0579..eaae5de2ab616 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -550,66 +550,49 @@ static void coretemp_remove_core(struct platform_data *pdata, int indx)
 		ida_free(&pdata->ida, indx - BASE_SYSFS_ATTR_NO);
 }
 
-static int coretemp_probe(struct platform_device *pdev)
+static int coretemp_device_add(int zoneid)
 {
-	struct device *dev = &pdev->dev;
+	struct platform_device *pdev;
 	struct platform_data *pdata;
+	int err;
 
 	/* Initialize the per-zone data structures */
-	pdata = devm_kzalloc(dev, sizeof(struct platform_data), GFP_KERNEL);
+	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->pkg_id = pdev->id;
+	pdata->pkg_id = zoneid;
 	ida_init(&pdata->ida);
-	platform_set_drvdata(pdev, pdata);
 
-	pdata->hwmon_dev = devm_hwmon_device_register_with_groups(dev, DRVNAME,
-								  pdata, NULL);
-	return PTR_ERR_OR_ZERO(pdata->hwmon_dev);
-}
-
-static int coretemp_remove(struct platform_device *pdev)
-{
-	struct platform_data *pdata = platform_get_drvdata(pdev);
-	int i;
+	pdev = platform_device_alloc(DRVNAME, zoneid);
+	if (!pdev) {
+		err = -ENOMEM;
+		goto err_free_pdata;
+	}
 
-	for (i = MAX_CORE_DATA - 1; i >= 0; --i)
-		if (pdata->core_data[i])
-			coretemp_remove_core(pdata, i);
+	err = platform_device_add(pdev);
+	if (err)
+		goto err_put_dev;
 
-	ida_destroy(&pdata->ida);
+	platform_set_drvdata(pdev, pdata);
+	zone_devices[zoneid] = pdev;
 	return 0;
-}
 
-static struct platform_driver coretemp_driver = {
-	.driver = {
-		.name = DRVNAME,
-	},
-	.probe = coretemp_probe,
-	.remove = coretemp_remove,
-};
+err_put_dev:
+	platform_device_put(pdev);
+err_free_pdata:
+	kfree(pdata);
+	return err;
+}
 
-static struct platform_device *coretemp_device_add(unsigned int cpu)
+static void coretemp_device_remove(int zoneid)
 {
-	int err, zoneid = topology_logical_die_id(cpu);
-	struct platform_device *pdev;
-
-	if (zoneid < 0)
-		return ERR_PTR(-ENOMEM);
-
-	pdev = platform_device_alloc(DRVNAME, zoneid);
-	if (!pdev)
-		return ERR_PTR(-ENOMEM);
-
-	err = platform_device_add(pdev);
-	if (err) {
-		platform_device_put(pdev);
-		return ERR_PTR(err);
-	}
+	struct platform_device *pdev = zone_devices[zoneid];
+	struct platform_data *pdata = platform_get_drvdata(pdev);
 
-	zone_devices[zoneid] = pdev;
-	return pdev;
+	ida_destroy(&pdata->ida);
+	kfree(pdata);
+	platform_device_unregister(pdev);
 }
 
 static int coretemp_cpu_online(unsigned int cpu)
@@ -633,7 +616,10 @@ static int coretemp_cpu_online(unsigned int cpu)
 	if (!cpu_has(c, X86_FEATURE_DTHERM))
 		return -ENODEV;
 
-	if (!pdev) {
+	pdata = platform_get_drvdata(pdev);
+	if (!pdata->hwmon_dev) {
+		struct device *hwmon;
+
 		/* Check the microcode version of the CPU */
 		if (chk_ucode_version(cpu))
 			return -EINVAL;
@@ -644,9 +630,11 @@ static int coretemp_cpu_online(unsigned int cpu)
 		 * online. So, initialize per-pkg data structures and
 		 * then bring this core online.
 		 */
-		pdev = coretemp_device_add(cpu);
-		if (IS_ERR(pdev))
-			return PTR_ERR(pdev);
+		hwmon = hwmon_device_register_with_groups(&pdev->dev, DRVNAME,
+							  pdata, NULL);
+		if (IS_ERR(hwmon))
+			return PTR_ERR(hwmon);
+		pdata->hwmon_dev = hwmon;
 
 		/*
 		 * Check whether pkgtemp support is available.
@@ -656,7 +644,6 @@ static int coretemp_cpu_online(unsigned int cpu)
 			coretemp_add_core(pdev, cpu, 1);
 	}
 
-	pdata = platform_get_drvdata(pdev);
 	/*
 	 * Check whether a thread sibling is already online. If not add the
 	 * interface for this CPU core.
@@ -675,18 +662,14 @@ static int coretemp_cpu_offline(unsigned int cpu)
 	struct temp_data *tdata;
 	int i, indx = -1, target;
 
-	/*
-	 * Don't execute this on suspend as the device remove locks
-	 * up the machine.
-	 */
+	/* No need to tear down any interfaces for suspend */
 	if (cpuhp_tasks_frozen)
 		return 0;
 
 	/* If the physical CPU device does not exist, just return */
-	if (!pdev)
-		return 0;
-
 	pd = platform_get_drvdata(pdev);
+	if (!pd->hwmon_dev)
+		return 0;
 
 	for (i = 0; i < NUM_REAL_CORES; i++) {
 		if (pd->cpu_map[i] == topology_core_id(cpu)) {
@@ -718,13 +701,14 @@ static int coretemp_cpu_offline(unsigned int cpu)
 	}
 
 	/*
-	 * If all cores in this pkg are offline, remove the device. This
-	 * will invoke the platform driver remove function, which cleans up
-	 * the rest.
+	 * If all cores in this pkg are offline, remove the interface.
 	 */
+	tdata = pd->core_data[PKG_SYSFS_ATTR_NO];
 	if (cpumask_empty(&pd->cpumask)) {
-		zone_devices[topology_logical_die_id(cpu)] = NULL;
-		platform_device_unregister(pdev);
+		if (tdata)
+			coretemp_remove_core(pd, PKG_SYSFS_ATTR_NO);
+		hwmon_device_unregister(pd->hwmon_dev);
+		pd->hwmon_dev = NULL;
 		return 0;
 	}
 
@@ -732,7 +716,6 @@ static int coretemp_cpu_offline(unsigned int cpu)
 	 * Check whether this core is the target for the package
 	 * interface. We need to assign it to some other cpu.
 	 */
-	tdata = pd->core_data[PKG_SYSFS_ATTR_NO];
 	if (tdata && tdata->cpu == cpu) {
 		target = cpumask_first(&pd->cpumask);
 		mutex_lock(&tdata->update_lock);
@@ -751,7 +734,7 @@ static enum cpuhp_state coretemp_hp_online;
 
 static int __init coretemp_init(void)
 {
-	int err;
+	int i, err;
 
 	/*
 	 * CPUID.06H.EAX[0] indicates whether the CPU has thermal
@@ -767,20 +750,22 @@ static int __init coretemp_init(void)
 	if (!zone_devices)
 		return -ENOMEM;
 
-	err = platform_driver_register(&coretemp_driver);
-	if (err)
-		goto outzone;
+	for (i = 0; i < max_zones; i++) {
+		err = coretemp_device_add(i);
+		if (err)
+			goto outzone;
+	}
 
 	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hwmon/coretemp:online",
 				coretemp_cpu_online, coretemp_cpu_offline);
 	if (err < 0)
-		goto outdrv;
+		goto outzone;
 	coretemp_hp_online = err;
 	return 0;
 
-outdrv:
-	platform_driver_unregister(&coretemp_driver);
 outzone:
+	while (i--)
+		coretemp_device_remove(i);
 	kfree(zone_devices);
 	return err;
 }
@@ -788,8 +773,11 @@ module_init(coretemp_init)
 
 static void __exit coretemp_exit(void)
 {
+	int i;
+
 	cpuhp_remove_state(coretemp_hp_online);
-	platform_driver_unregister(&coretemp_driver);
+	for (i = 0; i < max_zones; i++)
+		coretemp_device_remove(i);
 	kfree(zone_devices);
 }
 module_exit(coretemp_exit)
-- 
2.39.0

