Return-Path: <linux-hwmon+bounces-1906-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301C8B491B
	for <lists+linux-hwmon@lfdr.de>; Sun, 28 Apr 2024 03:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95DFD1C214BA
	for <lists+linux-hwmon@lfdr.de>; Sun, 28 Apr 2024 01:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6033A59;
	Sun, 28 Apr 2024 01:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BmCCaTwo"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11olkn2071.outbound.protection.outlook.com [40.92.19.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98215CB;
	Sun, 28 Apr 2024 01:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.19.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714267821; cv=fail; b=gmaQU/aEBZx30uvYRyKwDW3zjYLozK+1A3uWSlfKsWlg5YASMZaVWwAjgPwPSKGTbWZ1ryIY5aEssiGdjFyG0HZgPFjKURVR2G3shqC4QuY4R4R5qlGYPtH7OferVPAj6R8th3voE0zr8nvuEl2kGfIY7b1KJWxQMlMyuX7+kuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714267821; c=relaxed/simple;
	bh=HsT9xvKYpEmLbtJwwQyWVBwQZrvXN/tPuVnUttcIffA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XOrtStqM8izyyk5HXND9clXmbrc1GEUAj6wrEneCPAT2We/GyHGO/uwsxUJRUrf2Xwo+LLlz3qYP7cJJh1u+sYW0ad5YgHdC5dARu4ISaeR3P50B2BryVTxI8dDYHKa2mpT19Gg0asSJarNWw46q3V2rP6MJK2CTzhk0EjJcy4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BmCCaTwo; arc=fail smtp.client-ip=40.92.19.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE3J1y82QFoqGlcgZEJcBTx5HOYSQhlWzkYRiCt+G2tC+8PZSUHJsKOwzZuVf7K0TRQQaCzCcvCl8I5JRi0gOA7b72kpgW3oLQB4q0fM9T15IJpPXtIoRNo5VezHjxZWZEc2qKo9WIzXtZNOXTnarXBLb0t7YnPuBL0pGwnSBhb5svCRDFW7knFEGCVdkkgj5vRd+jv/lvtRblQNoOa/tdhNBKuwArKd7DUQ3UMy0YKeOyv2IltfQF04PvlXpC5NxrxuZb0o+/jTIRr0KromRXO1urTKn69NLn8ZWj6Flxkm7JTA0GFUqhwxVrdCCrrgkwjXYMjhhaEe0aJ2/NQFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrJ5bC9uRb10lo7hJerGYhrhACYxpFCvlIhqFnaQBTI=;
 b=FvFkvhYL4pwQ6b+mLOKI+xohRwjCiuC7RaaLt84LjtUiODOGp1yrWQnHaJ/Lshukfy+O/IFem1N3mWxAjEqv3QpTKu3e4fxfyzL6pu/61kAsSHs64IcFNjgB0d9sBsXIha3BZvze0xokWXKubhirbMP0FU5hYCibmy31L0zXgh9VkE3xtg1NNQtKzNa/WTB3l21EYhSao6lIq0xDwAyHxT1Roy1sFBIjQwCpF3MJgRs5jK9gXPURt7ZXnaHUfuFOtO82p6vabgk67tgJfU0bOzfycPrBeccqxuoTMekhTNVQKhZa/x5b69laDk5aU8dNJsSQzDOVEmBpvO3oXGwOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrJ5bC9uRb10lo7hJerGYhrhACYxpFCvlIhqFnaQBTI=;
 b=BmCCaTwo6xLIUR+6tCUN3RVcpEBdEM7NSNdblOIeI3EujnljjtElNQyvzMnyZX6GK5MRmKe2vl8MkqKqvmQrYl8NGw80jY5yxl778iqFl/3ujRBDFM5o2YX0zJp7vg6p1WB5mD/mWZxnYdNrmwH4Ywp1+iZPKbaW0M+oSM7cF/LyQ089NzXtpPI6MhTnX7hfLiYA4fxJJ8OfQPJPh9lzjoKLBddGaZMpZ4q+rhKJvrdkdDW2VmQanqxuaZc6t/qoVvjNkdHN/0E2LNaYmaP2Bem9VhU0hKvkumnTMKJAmgSSd5TZUREvA3wxhW6OOGYsD5uTLcahpHueupI9B0eLRw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CYYPR20MB6663.namprd20.prod.outlook.com (2603:10b6:930:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 01:30:17 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7519.030; Sun, 28 Apr 2024
 01:30:17 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Huisong Li <lihuisong@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 2/2] drivers: soc: sophgo: Add SG2042 external hardware monitor support
Date: Sun, 28 Apr 2024 09:30:40 +0800
Message-ID:
 <IA1PR20MB4953A6EF6ED0CD082B60DD80BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB49532A8A0C52FE5C599B6D13BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49532A8A0C52FE5C599B6D13BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [/sEn19xMW2DWyGwBc0nHcgEs6tbfH6MA37Onc83seQA=]
X-ClientProxiedBy: TYXPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:403:a::30) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240428013044.477027-2-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CYYPR20MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 85cbb627-a1a7-4f7b-1ea1-08dc6722c29e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	fEG3TnIa3rfPh1UtZTzb4iFgTpLGnVTrjRuA86GZN9JNNEKCNorGyBZnyRS3krIjZFLZs+VSVKlh64mj9veCiM8Dn46hiQ75k6aPMAW3ew+WFmqdZka3pB2mvDSjZvm/OKMWaQF53Nw4/tkaPe6r7LSl43sTBszAfYza96hTjvTsOszkdPhjSdRqo6BEVTdcPrbv4kSs0q7Xscsl7tDrz2/Enl8XC6NJ6uFrBI7tf9Qot2itUlqjyN3xP6WDobmu/9fGcxwUz6RljNG3tzMHceJR/KU8n0Hg1gkL/Gm5HTAf2EHV8KFyBCoDoTBgEsFifVVfumCfIULM4tHJ5h4MhZWO3UjONouGfIIYJ0R4axnnhwFO/bhRuwOJ6Mib20JKdUZc+yS3Nv0bVMRToHxvaOW8GGyrLcyedfVKbCMssT7Y/OIBjV6L3nB2BwuADy5Zj1c6UWtlqaWkWuhI9n0/auvV4s0ZgBls7a7vhJvkfEXpeXlDvD79Kw4hBeWdiX882zJZjOkkGW8t+hMNQXOk9hta5ysbBYHclh/34Ho8vf3KXZcoYHbtTgfIJ4wlWyV0mZMQbOOpfiTg7qtv/w3vFD5ej/q6jgINMHCJk4IKVj8coVSBG2nHP3irmjoORi1B
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Wnl/aTxTDAypocoOaIkntfuqXwbBRRvHpRSKg//hy55zBsJoPhLbolDmHi+?=
 =?us-ascii?Q?PJdhv8QuwTBoFfpzuUf3pK2nhhvconsfec4xJ8ilBW+UBUFPTkEDqsJBSoeY?=
 =?us-ascii?Q?ftLKZojaXZ6ER7+zAooL/AGKwvCaiVBHsIN/Gzd8LyVelyXletkLdsBhAYV8?=
 =?us-ascii?Q?LkB5Wv4Nu4DF58WPmMUFnKZkz5oIjULWgPJMcmeSfjdRMeTAb+oW3QIoPEGn?=
 =?us-ascii?Q?mwh86ihNYbmQ60HkU/7f/dAlElP8hYFFNRHWeZMlAV7QlzSgfXfSmYF4uStv?=
 =?us-ascii?Q?rNaYAce07+cRFBBs3cY/3OYOWM6T9eNu6hPBL8hkjRVnY51GXJvuzaFmHFkJ?=
 =?us-ascii?Q?dN+9dowwiTRpcJ4EwzKDLITDwmvvaL0MqSy/qM/suaQjFo/jcjP/mc2KNC29?=
 =?us-ascii?Q?SOr6Lm/Tjx+XLBx1ijH1b5zrwhNzBsK456J5Y1UDFkvb22g9VeiUMbAiPTv5?=
 =?us-ascii?Q?0cMmBgw/zFwT8Y61Mc712Hlk2EbL2W6CIZ0Dycplg5cmLlfyoeNG/BQTtrDV?=
 =?us-ascii?Q?c6LOmLix8jUFSIGEJpMV7tgjLybdENKsbrjKUZPvXpV5C12q+8WsHW3x/TsN?=
 =?us-ascii?Q?+tEdOopNULCe+omSfsC+xzfrUTu78PYsyH0GZ3N1DlYB/uKUwXFR1aBGdrpL?=
 =?us-ascii?Q?SDxreKVhCrc9QKto97Rl0z3MAXUh86/6N5gapzbBO7ZojWbysj58LBHIBFDr?=
 =?us-ascii?Q?RtllQkrMsfTucdOb908Jv49qPdMqKEbJMoRpRQhAH7dCB4G+xHDEe5+9hAyY?=
 =?us-ascii?Q?vD/v2rbba5UWlm5w7PVFybNMuYVMJXOXyNbxjmS37chn1xXsxxNLEY+HX8Vb?=
 =?us-ascii?Q?ktJh/kp52EsEVtZKFaQjsL7H6PPNmcuX85J32BjTkw88/HemPQ97vZXlAry/?=
 =?us-ascii?Q?+yod69kbGI19HTB5v8/jK+xn2V5RVwaOGNaEsruYDG52m8aXlQaL4Lv9bAcm?=
 =?us-ascii?Q?D0i46pbcitKUMeLSdT44ZAt0sb2eoXTdfUYeM6ABxr4p7GcnGRwHOVlKLS+c?=
 =?us-ascii?Q?qEmTm+bY1Yq5TqimI+MV8mT7Onu2QeDZbfBUi2XtVdHAQb6xO00bsqhYBSzY?=
 =?us-ascii?Q?9IRcM0NOSSHzWEO83AYxNwkr7UyrYLBpqrXnQExoDAiRnMgooYGYy/Bp6Awj?=
 =?us-ascii?Q?iPkVqdKZTHKFwDI5AFL4FGjhO7oYu/wqQQVgZ8x9DFT+6cmPMrStUTzOCQri?=
 =?us-ascii?Q?2HDJs44xkxMWVKnlfRVdLvLfgopd4B8JzmgMGaj+hvfGwX/BvHDfZB1oMIGB?=
 =?us-ascii?Q?Qchb2uM7hwyW5n1UDd9r?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cbb627-a1a7-4f7b-1ea1-08dc6722c29e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2024 01:30:17.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR20MB6663

SG2042 use an external MCU to provide basic hardware information
and thermal sensors.

Add driver support for the onboard MCU of SG2042.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/soc/Kconfig                   |   1 +
 drivers/soc/Makefile                  |   1 +
 drivers/soc/sophgo/Kconfig            |  12 +
 drivers/soc/sophgo/Makefile           |   5 +
 drivers/soc/sophgo/sg2042-hwmon-mcu.c | 531 ++++++++++++++++++++++++++
 5 files changed, 550 insertions(+)
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/sg2042-hwmon-mcu.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 5d924e946507..19050f094996 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -22,6 +22,7 @@ source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
+source "drivers/soc/sophgo/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index ba8f5b5460e1..6948e6617316 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -28,6 +28,7 @@ obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
+obj-y				+= sophgo/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/sophgo/Kconfig b/drivers/soc/sophgo/Kconfig
new file mode 100644
index 000000000000..de9842d1c287
--- /dev/null
+++ b/drivers/soc/sophgo/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo SoC drivers
+#
+
+config SG2042_HWMON_MCU
+	tristate "SG2042 onboard MCU support"
+	depends on RISCV
+	help
+	  Support for SG2042 onboard MCU. This mcu provides power
+	  control and some basic information for SG2042 chip.
+	  If unsure, say Y.
diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
new file mode 100644
index 000000000000..c72729ce61aa
--- /dev/null
+++ b/drivers/soc/sophgo/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo SoC drivers
+#
+obj-$(CONFIG_SG2042_HWMON_MCU)		+= sg2042-hwmon-mcu.o
diff --git a/drivers/soc/sophgo/sg2042-hwmon-mcu.c b/drivers/soc/sophgo/sg2042-hwmon-mcu.c
new file mode 100644
index 000000000000..3413b1a0f5e3
--- /dev/null
+++ b/drivers/soc/sophgo/sg2042-hwmon-mcu.c
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * Sophgo power control mcu for SG2042
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/time.h>
+
+/* fixed MCU registers */
+#define REG_BOARD_TYPE				0x00
+#define REG_MCU_FIRMWARE_VERSION		0x01
+#define REG_PCB_VERSION				0x02
+#define REG_PWR_CTRL				0x03
+#define REG_SOC_TEMP				0x04
+#define REG_BOARD_TEMP				0x05
+#define REG_RST_COUNT				0x0a
+#define REG_UPTIME				0x0b
+#define REG_RESET_REASON			0x0d
+#define REG_MCU_TYPE				0x18
+#define REG_CRITICAL_ACTIONS			0x65
+#define REG_CRITICAL_TEMP			0x66
+#define REG_REPOWER_TEMP			0x67
+
+#define CRITICAL_ACTION_REBOOT			0x1
+#define CRITICAL_ACTION_POWEROFF		0x2
+
+#define DEFAULT_REPOWER_TEMP			60
+#define MAX_REPOWER_TEMP			100
+
+#define sg2042_mcu_read_byte(client, reg)			\
+	i2c_smbus_read_byte_data(client, reg)
+#define sg2042_mcu_write_byte(client, reg, value)		\
+	i2c_smbus_write_byte_data(client, reg, value)
+#define sg2042_mcu_read_block(client, reg, array)		\
+	i2c_smbus_read_i2c_block_data(client, reg, sizeof(array), array)
+
+#define DEFINE_MCU_ATTR_READ_FUNC(_name, _type, _format)		\
+	static ssize_t _name##_show(struct device *dev,			\
+				    struct device_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);	\
+		_type ret;						\
+		ret = sg2042_mcu_get_##_name(mcu->client);		\
+		if (ret < 0)						\
+			return ret;					\
+		return sprintf(buf, _format "\n", ret);			\
+	}
+
+struct sg2042_mcu_board_data {
+	u8		id;
+	const char	*name;
+};
+
+struct sg2042_mcu_data {
+	struct i2c_client			*client;
+	const struct sg2042_mcu_board_data	*board_info;
+};
+
+static const struct sg2042_mcu_board_data sg2042_boards_data[] = {
+	{
+		.id = 0x80,
+		.name = "SG2042 evb x8",
+	},
+	{
+		.id = 0x81,
+		.name = "SG2042R evb",
+	},
+	{
+		.id = 0x83,
+		.name = "SG2042 evb x4",
+	},
+	{
+		.id = 0x90,
+		.name = "Milk-V Pioneer",
+	},
+};
+
+static const char *sg2042_mcu_reset_reason[8] = {
+	"Power supply overheat",
+	"Power supply failure",
+	"12V power supply failure",
+	"Reset commant",
+	"Unknown",
+	"Unknown",
+	"Unknown",
+	"SoC overheat",
+};
+
+static int sg2042_mcu_get_board_type(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_BOARD_TYPE);
+}
+
+static int sg2042_mcu_get_firmware_version(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_MCU_FIRMWARE_VERSION);
+}
+
+static int sg2042_mcu_get_pcb_version(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_PCB_VERSION);
+}
+
+static int sg2042_mcu_get_soc_temp(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_SOC_TEMP);
+}
+
+static int sg2042_mcu_get_board_temp(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_BOARD_TEMP);
+}
+
+static int sg2042_mcu_get_reset_count(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_RST_COUNT);
+}
+
+static s32 sg2042_mcu_get_uptime(struct i2c_client *client)
+{
+	int ret;
+	u8 time_val[2];
+
+	ret = sg2042_mcu_read_block(client, REG_UPTIME, time_val);
+	if (ret < 0)
+		return ret;
+
+	return (s32)(time_val[0]) + ((s32)(time_val[1]) << 8);
+}
+
+static int sg2042_mcu_get_reset_reason(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_RESET_REASON);
+}
+
+static int sg2042_mcu_get_mcu_type(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_MCU_TYPE);
+}
+
+static int sg2042_mcu_get_critical_action(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_CRITICAL_ACTIONS);
+}
+
+static int sg2042_mcu_get_critical_temp(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_CRITICAL_TEMP);
+}
+
+static int sg2042_mcu_get_repower_temp(struct i2c_client *client)
+{
+	return sg2042_mcu_read_byte(client, REG_REPOWER_TEMP);
+}
+
+static int sg2042_mcu_set_critical_action(struct i2c_client *client,
+					  u8 value)
+{
+	return sg2042_mcu_write_byte(client, REG_CRITICAL_ACTIONS, value);
+}
+
+static int sg2042_mcu_set_critical_temp(struct i2c_client *client,
+					u8 value)
+{
+	return sg2042_mcu_write_byte(client, REG_CRITICAL_TEMP, value);
+}
+
+static int sg2042_mcu_set_repower_temp(struct i2c_client *client,
+				       u8 value)
+{
+	return sg2042_mcu_write_byte(client, REG_REPOWER_TEMP, value);
+}
+
+static ssize_t board_type_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", mcu->board_info->name ?: "Unknown");
+}
+
+DEFINE_MCU_ATTR_READ_FUNC(firmware_version, int, "0x%02x");
+DEFINE_MCU_ATTR_READ_FUNC(pcb_version, int, "0x%02x");
+DEFINE_MCU_ATTR_READ_FUNC(reset_count, int, "%d");
+DEFINE_MCU_ATTR_READ_FUNC(uptime, s32, "%d");
+
+static ssize_t reset_reason_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	int ret, val, i;
+
+	val = sg2042_mcu_get_reset_reason(mcu->client);
+	if (val < 0)
+		return val;
+
+	ret = sprintf(buf, "Reason: 0x%02x\n", val);
+
+	for (i = 0; i < ARRAY_SIZE(sg2042_mcu_reset_reason); i++) {
+		if (val & BIT(i))
+			ret += sprintf(buf + ret, "bit %d: %s\n", i,
+						  sg2042_mcu_reset_reason[i]);
+	}
+
+	return ret;
+}
+
+static ssize_t mcu_type_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	int ret;
+
+	ret = sg2042_mcu_get_mcu_type(mcu->client);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, ret ? "GD32\n" : "STM32\n");
+}
+
+static ssize_t critical_action_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	int ret;
+	const char *action;
+
+	ret = sg2042_mcu_get_critical_action(mcu->client);
+	if (ret < 0)
+		return ret;
+
+	if (ret == CRITICAL_ACTION_REBOOT)
+		action = "reboot";
+	else if (ret == CRITICAL_ACTION_POWEROFF)
+		action = "poweroff";
+	else
+		action = "unknown";
+
+	return sprintf(buf, "%s\n", action);
+}
+
+static ssize_t critical_action_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	int value;
+
+	if (sysfs_streq("reboot", buf))
+		value = CRITICAL_ACTION_REBOOT;
+	else if (sysfs_streq("poweroff", buf))
+		value = CRITICAL_ACTION_POWEROFF;
+	else
+		return -EINVAL;
+
+	return sg2042_mcu_set_critical_action(mcu->client, value);
+}
+
+DEFINE_MCU_ATTR_READ_FUNC(repower_temp, u32, "%u");
+
+static ssize_t repower_temp_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	u8 val;
+	int ret;
+
+	ret = kstrtou8(buf, 10, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val == 0 || val > MAX_REPOWER_TEMP)
+		return -EINVAL;
+
+	return sg2042_mcu_set_repower_temp(mcu->client, val);
+}
+
+static DEVICE_ATTR_RO(board_type);
+static DEVICE_ATTR_RO(firmware_version);
+static DEVICE_ATTR_RO(pcb_version);
+static DEVICE_ATTR_RO(reset_count);
+static DEVICE_ATTR_RO(uptime);
+static DEVICE_ATTR_RO(reset_reason);
+static DEVICE_ATTR_RO(mcu_type);
+static DEVICE_ATTR_RW(critical_action);
+static DEVICE_ATTR_RW(repower_temp);
+
+static struct attribute *sg2042_mcu_attrs[] = {
+	&dev_attr_board_type.attr,
+	&dev_attr_firmware_version.attr,
+	&dev_attr_pcb_version.attr,
+	&dev_attr_reset_count.attr,
+	&dev_attr_uptime.attr,
+	&dev_attr_reset_reason.attr,
+	&dev_attr_mcu_type.attr,
+	&dev_attr_critical_action.attr,
+	&dev_attr_repower_temp.attr,
+	NULL
+};
+
+static const struct attribute_group sg2042_mcu_attr_group = {
+	.attrs	= sg2042_mcu_attrs,
+};
+
+static const struct hwmon_channel_info * const sg2042_mcu_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_CRIT,
+				 HWMON_T_INPUT),
+	NULL
+};
+
+static int sg2042_mcu_read_temp(struct device *dev,
+				u32 attr, int channel,
+				long *val)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	long tmp;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		switch (channel) {
+		case 0:
+			tmp = sg2042_mcu_get_soc_temp(mcu->client);
+			if (tmp < 0)
+				return tmp;
+			*val = tmp * 1000;
+			break;
+		case 1:
+			tmp = sg2042_mcu_get_board_temp(mcu->client);
+			if (tmp < 0)
+				return tmp;
+			*val = tmp * 1000;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	case hwmon_temp_crit:
+		if (channel)
+			return -EOPNOTSUPP;
+
+		tmp = sg2042_mcu_get_critical_temp(mcu->client);
+		if (tmp < 0)
+			return tmp;
+		*val = tmp * 1000;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int sg2042_mcu_read(struct device *dev,
+			   enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_chip:
+		if (attr != hwmon_chip_update_interval)
+			return -EOPNOTSUPP;
+		*val = 1000;
+		break;
+	case hwmon_temp:
+		return sg2042_mcu_read_temp(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int sg2042_mcu_write(struct device *dev,
+			    enum hwmon_sensor_types type,
+			    u32 attr, int channel, long val)
+{
+	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
+	u8 down_temp, repower_temp;
+	int ret;
+
+	if (type != hwmon_temp || attr != hwmon_temp_crit || !channel)
+		return -EOPNOTSUPP;
+
+	ret = sg2042_mcu_get_repower_temp(mcu->client);
+	if (ret < 0)
+		repower_temp = DEFAULT_REPOWER_TEMP;
+	else
+		repower_temp = ret;
+
+	down_temp = val / 1000;
+	if (down_temp < repower_temp)
+		return -EINVAL;
+
+	return sg2042_mcu_set_critical_temp(mcu->client, (u8)(val / 1000));
+}
+
+static umode_t sg2042_mcu_is_visible(const void *_data,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_chip:
+		if (attr == hwmon_chip_update_interval)
+			return 0444;
+		break;
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			if (channel < 2)
+				return 0444;
+			break;
+		case hwmon_temp_crit:
+			if (channel == 0)
+				return 0664;
+			break;
+		default:
+			return 0;
+		}
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops sg2042_mcu_ops = {
+	.is_visible = sg2042_mcu_is_visible,
+	.read = sg2042_mcu_read,
+	.write = sg2042_mcu_write,
+};
+
+static const struct hwmon_chip_info sg2042_mcu_chip_info = {
+	.ops = &sg2042_mcu_ops,
+	.info = sg2042_mcu_info,
+};
+
+static int sg2042_mcu_check_board(u8 id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sg2042_boards_data); i++) {
+		if (sg2042_boards_data[i].id == id)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+static int sg2042_mcu_i2c_probe(struct i2c_client *client)
+{
+	int ret;
+	struct device *dev = &client->dev;
+	struct sg2042_mcu_data *mcu;
+	struct device *hwmon_dev;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
+						I2C_FUNC_SMBUS_BLOCK_DATA))
+		return -EIO;
+
+	ret = sg2042_mcu_get_board_type(client);
+	if (ret < 0)
+		return ret;
+
+	ret = sg2042_mcu_check_board(ret);
+	if (ret < 0)
+		return ret;
+
+	mcu = devm_kmalloc(dev, sizeof(*mcu), GFP_KERNEL);
+	if (!mcu)
+		return -ENOMEM;
+
+	mcu->client = client;
+	mcu->board_info = &sg2042_boards_data[ret];
+
+	ret = sysfs_create_group(&dev->kobj, &sg2042_mcu_attr_group);
+	if (ret < 0)
+		return ret;
+
+	i2c_set_clientdata(client, mcu);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 mcu,
+							 &sg2042_mcu_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static void sg2042_mcu_i2c_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+
+	sysfs_remove_group(&dev->kobj, &sg2042_mcu_attr_group);
+}
+
+static const struct i2c_device_id sg2042_mcu_id[] = {
+	{ "sg2042-hwmon-mcu", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, sg2042_mcu_id);
+
+static const struct of_device_id sg2042_mcu_of_id[] = {
+	{ .compatible = "sophgo,sg2042-hwmon-mcu" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sg2042_mcu_of_id);
+
+static struct i2c_driver sg2042_mcu_driver = {
+	.driver = {
+		.name = "sg2042-mcu",
+		.of_match_table = sg2042_mcu_of_id,
+	},
+	.probe = sg2042_mcu_i2c_probe,
+	.remove = sg2042_mcu_i2c_remove,
+	.id_table = sg2042_mcu_id,
+};
+
+module_i2c_driver(sg2042_mcu_driver);
+
+MODULE_DESCRIPTION("MCU I2C driver for bm16xx soc platform");
+MODULE_LICENSE("GPL");
--
2.44.0


