Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E973F1AE564
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Apr 2020 21:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgDQTCl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 17 Apr 2020 15:02:41 -0400
Received: from mail-dm6nam12on2045.outbound.protection.outlook.com ([40.107.243.45]:64832
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725960AbgDQTCk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 15:02:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYpjWbZ7uY1p52EftTL7xGvYYDzVqw1AlaFsHGmjk2fC3V2cPZZrNh12/z1w5DiB2/8uxbyp0acKvRkDB+NKJBhVLwMl+ZrjpCaXSne55GnOvH45quI3vrWJg5JTDVuAwdFWy2CD06y3Txn35o4pox4x9TGY+HCMglldOLxu6EakWfHMR/jZDBKPeOq0syB6CeGXzHtk5bP/ikn9GBv33XxdRJnDEHsc0yeRE09C3f4/bWHCA5Ae4D1fVJiRxkoBGpry1RD2Ykt7ANQ0kCJe10QZx/UQLjIujob470oGOQ3/PPU4sonbzxuK9yvvA4B8kq8J4OWjNFSnxhzbgQvdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcOdHA998wo7TenUUi7b08qNb6RkJMEce/hIVNf/WuA=;
 b=IU9kR81RwwKRXl3k1qNmEbN1qLNRij3TcG6jxO2jg8LhiTOrSYpOnFyHO55JL0FfDfhkjwUg8/O3A+QcPmgPjAO2sSq+fiwdtFj1OkThwKXgiDJFU1/lPAo9dorG853dbhAEP8+3WIf19pg02VKLhGKsBPlDZUFh3qxi5gP4SPOw33Tu2hM8maF3ue1y6vZgr9VFW6OhOYBr2T4ixMESSel8tbYwtGGc0tTGoYgOWgl3/kplmRH7+QmIw8lSTlDO59GSW1kiYujLo4ns5rl1CwUob/a8oI9vvEQ9HBRu8FJUFqXfTzfBp7Upr43N9BYpEIhl7gdxkPD2mECGDS/Tuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcOdHA998wo7TenUUi7b08qNb6RkJMEce/hIVNf/WuA=;
 b=2Amy3TBzC2Wf8kPJKgV6NX3Mv8lJOKbFqvpjnXt5c8NvgZFtlGVDXZ/oP2nRIndcXNr9Ay5ONNQb1JA0RUDdISpXdY3Yy+1ufDXUv4D4Z365r2qiBoQq35GNdGh94aPJkrgi+o1z+Ga/va93WmfSUxz2fIQxcc5PEaxPCT2IHg4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=NaveenKrishna.Chatradhi@amd.com; 
Received: from DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14)
 by DM6PR12MB2842.namprd12.prod.outlook.com (2603:10b6:5:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Fri, 17 Apr
 2020 19:02:35 +0000
Received: from DM6PR12MB4219.namprd12.prod.outlook.com
 ([fe80::58f0:5661:ff16:c269]) by DM6PR12MB4219.namprd12.prod.outlook.com
 ([fe80::58f0:5661:ff16:c269%3]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 19:02:35 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: Add amd_energy driver to report energy counters
Date:   Sat, 18 Apr 2020 00:32:06 +0530
Message-Id: <20200417190207.233062-1-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::17) To DM6PR12MB4219.namprd12.prod.outlook.com
 (2603:10b6:5:217::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 19:02:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5660592-c9f7-412c-334b-08d7e301e3ff
X-MS-TrafficTypeDiagnostic: DM6PR12MB2842:|DM6PR12MB2842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB28429C0A187C7B4B21E16552E8D90@DM6PR12MB2842.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4219.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(66556008)(54906003)(6486002)(186003)(52116002)(26005)(4326008)(36756003)(2906002)(316002)(16526019)(6916009)(1076003)(8936002)(956004)(8676002)(66476007)(7696005)(6666004)(66946007)(2616005)(5660300002)(81156014)(478600001)(6606295002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rjp2QaF+ojOdDbYCMs/wFRaIlCAy7plQ2TTbB5EzDr//YD0DLPcMeadmhX1LKMpghekLWOXuGE9PefOBJw9RsqqQv+uJa/q0YmEN7pRWcgiJ3GzmVgSyAeqdNuwoTUVe1Far3YcvPZamY/hi0EBg56ckfxdjoEtzUmGq1N6P0IqRD8X7TrlWi8gqNhEUwozfLpOZJZIH6InOEmWecZgdAS3w1Sf62LiOh0pBQ49o3my2MVhHpT8iqzPuUYieZR4gDue3FzO9vk8k/Fg6lepAMxYwer0PXb0+0bMLBWg4/Z95xD5K7XLc/yOl6FLddDDmPL3k52S/z34ez5AZY9tqhxPneH+3giYis1jlljyJHW40UCubL9lNn+e0syyhoyu9/gFxF7FErhVtFD0uFVTKlcM9pyv4TOatz5HL3TOsCf+jOBnr3IjG9SQKJ5tOsjDWsw2I+elt/DYiu3BMHS4JVZW7SLDnYcAy4MHs9n2BY6qD2VfOa3ogdLqJhBlcqf1
X-MS-Exchange-AntiSpam-MessageData: zSL669NPjB3M8x501Pwao+OKTN/BcZJ9ZkyGei4iD16Jp6zoMiR95LLfYvtidqNMw/IJOlWNbdkk37pKb6U3KrVJnMthwTymP2v2d9vkoIJjleoUcxEy88zS3ZWC4fq11mrHokOw+RTYf9/SrQ99Mg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5660592-c9f7-412c-334b-08d7e301e3ff
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 19:02:35.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpE0X7QP2eVIaed/sCyFMUPnOxh0/yTEsAB/rjQGH6wP5yoacSm2UlmZGOq7Z0Mi3PJRVrBaL+jIDV9VrYaD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2842
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds hwmon based amd_energy driver support for
family 17h processors from AMD.

The driver provides following interface to the userspace
1. Reports the per core consumption
	* file: "energy%d_input", label: "Ecore%03d"
2. Reports per socket energy consumption
	* file: "energy%d_input", label: "Esocket%d"
3. Reports scaled energy value in Joules.

Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes in V2:
Addressed comments from Guenter. Major changes include 
1. Use chip_info instead of groups
2. Use standard file naming conventions
3. Report scaled values 

 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/amd_energy.c | 251 +++++++++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 drivers/hwmon/amd_energy.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 05a30832c6ba..d83f1403b429 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -324,6 +324,16 @@ config SENSORS_FAM15H_POWER
 	  This driver can also be built as a module. If so, the module
 	  will be called fam15h_power.
 
+config SENSORS_AMD_ENERGY
+	tristate "AMD RAPL MSR based Energy driver"
+	depends on X86
+	help
+	  If you say yes here you get support for core and package energy
+	  sensors, based on RAPL MSR for AMD family 17h and above CPUs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called as amd_energy.
+
 config SENSORS_APPLESMC
 	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
 	depends on INPUT && X86
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b0b9c8e57176..318f89dc7133 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
 obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
 obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
 obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
+obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
 obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
 obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
 obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
new file mode 100644
index 000000000000..7127f1f5f5ee
--- /dev/null
+++ b/drivers/hwmon/amd_energy.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2020 Advanced Micro Devices, Inc.
+ */
+
+#include <asm/cpu_device_id.h>
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/processor.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define DRVNAME			"amd_energy"
+
+#define ENERGY_PWR_UNIT_MSR	0xC0010299
+#define ENERGY_CORE_MSR		0xC001029A
+#define ENERGY_PKG_MSR		0xC001029B
+
+#define AMD_TIME_UNIT_MASK	0xF0000
+#define AMD_ENERGY_UNIT_MASK	0x01F00
+#define AMD_POWER_UNIT_MASK	0x0000F
+
+#define ENERGY_STATUS_MASK	0xffffffff
+
+#define AMD_FAM_17		0x17 /* ZP, SSP */
+
+/* Useful macros */
+#define AMD_CPU_FAM_ANY(_family, _model)	\
+{						\
+	.vendor		= X86_VENDOR_AMD,	\
+	.family		= _family,		\
+	.model		= _model,		\
+	.feature	= X86_FEATURE_ANY,	\
+}
+
+#define AMD_CPU_FAM(_model)			\
+	AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
+
+struct amd_energy_data {
+	struct hwmon_channel_info energy_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
+};
+
+static int nr_cpus, nr_socks;
+static uint64_t energy_units;
+
+static int amd_energy_read_labels(struct device *dev,
+			       enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	char *buf = devm_kcalloc(dev, 10, sizeof(char), GFP_KERNEL);
+
+	if (channel >= nr_cpus)
+		scnprintf(buf, 9, "Esocket%u", channel - nr_cpus);
+	else
+		scnprintf(buf, 9, "Ecore%03u", channel);
+
+	*str = buf;
+
+	return 0;
+}
+
+static int get_energy_units(void)
+{
+	uint64_t rapl_units;
+	int ret;
+
+	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
+	if (ret)
+		return -EAGAIN;
+
+	energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
+	return 0;
+}
+
+static int amd_energy_read(struct device *dev,
+			enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	uint64_t value;
+	int cpu = 0, ret;
+	u32 reg;
+
+	if (channel >= nr_cpus) {
+		reg = ENERGY_PKG_MSR;
+		cpu = cpumask_first_and(cpu_online_mask,
+				cpumask_of_node(channel - nr_cpus));
+	} else {
+		reg = ENERGY_CORE_MSR;
+		cpu = channel;
+	}
+
+	if (!cpu_online(cpu))
+		return -ENODEV;
+
+	ret = rdmsrl_safe_on_cpu(cpu, reg, &value);
+	if (ret)
+		return -EAGAIN;
+
+	if ((energy_units == 0) && get_energy_units())
+		return -EAGAIN;
+
+	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
+	*val = (long)value * div64_ul(1000000UL, (1 << energy_units));
+
+	return 0;
+}
+
+static umode_t amd_energy_is_visible(const void *_data,
+			enum hwmon_sensor_types type,
+			u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_ops amd_energy_ops = {
+	.is_visible = amd_energy_is_visible,
+	.read = amd_energy_read,
+	.read_string = amd_energy_read_labels,
+};
+
+static int amd_create_sensor(struct device *dev,
+			struct amd_energy_data *data,
+			u8 type, u32 config)
+{
+	int i;
+	u32 *s_config;
+	struct hwmon_channel_info *info = &data->energy_info;
+
+	nr_socks = num_online_nodes();
+	nr_cpus = num_online_cpus();
+
+	s_config = devm_kcalloc(dev, nr_cpus + nr_socks,
+				sizeof(u32), GFP_KERNEL);
+	if (!s_config)
+		return -ENOMEM;
+
+	info->type = type;
+	info->config = s_config;
+
+	for (i = 0; i < nr_cpus + nr_socks; i++)
+		s_config[i] = config;
+
+	return 0;
+}
+
+static int amd_energy_probe(struct platform_device *pdev)
+{
+	struct device *hwmon_dev;
+	struct amd_energy_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = get_energy_units();
+
+	data = devm_kzalloc(dev, sizeof(struct amd_energy_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->chip.ops = &amd_energy_ops;
+	data->chip.info = data->info;
+
+	/* Populate per-core energy reporting */
+	data->info[0] = &data->energy_info;
+	amd_create_sensor(dev, data,  hwmon_energy,
+				HWMON_E_INPUT | HWMON_E_LABEL);
+
+	data->info[1] = NULL;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
+							 data,
+							 &data->chip,
+							 NULL);
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static int amd_energy_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct platform_device_id amd_energy_ids[] = {
+	{ .name = DRVNAME, },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, amd_energy_ids);
+
+static struct platform_driver amd_energy_driver = {
+	.probe = amd_energy_probe,
+	.remove	= amd_energy_remove,
+	.id_table = amd_energy_ids,
+	.driver = {
+		.name = DRVNAME,
+	},
+};
+
+static struct platform_device *amd_energy_platdev;
+
+static const struct x86_cpu_id cpu_ids[] __initconst = {
+	AMD_CPU_FAM(17),
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
+
+static int __init amd_energy_init(void)
+{
+	int ret;
+
+	if (!x86_match_cpu(cpu_ids))
+		return -ENODEV;
+
+	ret = platform_driver_register(&amd_energy_driver);
+	if (ret < 0)
+		return ret;
+
+	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
+	if (!amd_energy_platdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(amd_energy_platdev);
+	if (ret) {
+		platform_device_unregister(amd_energy_platdev);
+		return ret;
+	}
+
+	return ret;
+}
+
+static void __exit amd_energy_exit(void)
+{
+	platform_device_unregister(amd_energy_platdev);
+	platform_driver_unregister(&amd_energy_driver);
+}
+
+module_init(amd_energy_init);
+module_exit(amd_energy_exit);
+
+MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via HWMON interface");
+MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
+MODULE_LICENSE("GPL");
-- 
2.17.1

