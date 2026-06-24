Return-Path: <linux-hwmon+bounces-15295-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BH55K5WwO2qHbQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15295-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:25:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F696BD537
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:25:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=PIu65HMt;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15295-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15295-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00250303B4C5
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B6F24A06D;
	Wed, 24 Jun 2026 10:24:28 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590212417D9;
	Wed, 24 Jun 2026 10:24:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296668; cv=fail; b=o4ejjV7FDWRIViFnsu9q1h5G9Hs7ljlGpLZLhRjBKFxXapQBv+r1svI8/rRRrAmrlQR3Nrq73/XhxX4ey+CnciixJtXoLEQH8nWZfC7GWyq/OmfnQlZ6tXiB5/985XomJe6AZMG6JAsn/n5XFyN15AloWPQrQChqPFdCoLAY7eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296668; c=relaxed/simple;
	bh=LxGbeGxd6fNRW5diSjejJAZA5lduVI828SzOT6IIAeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3jewcuUF+wKv85mWFyhr0E3ZUUt7zObkcOvadIUgarBXgv6OIij/Fz0Lv6skgyakiMrTRDklSOBScHyS9K0CoQdKVrAha17Xp49cRpEJ0+UzTLEmeAzJm4qWhu+r10xBrVAsXwAQ3ig3Pt2miEhT/raESOb2YTWUk1e+58HEzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PIu65HMt; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxTOf9JTc7SYtiVsMosOM4R+Lq0qlampaVKj5YQ32x7UpK+FUMXjD78ZLhxtcBstEMIEnr/KlY/cIVK254RNWEbC+JmCtInQhjunYi6voV3Wz7CCzVGsCWl3cpWt8dAmriemG4iF32qA6yxGE8WSX58zG2qqDgOQ6EtWhFHml//KGydvnFfO9nGIyaSqcu1v2wlO0amY770R1u8SXCVRQTi3eOnIYwtMTMa+gasqi9cxzfDGpti0K/tIkxdE93JETfrROUxB3tIzfEFr25s4zYUaEmZPTA6Rs+8TaNSqMJ2UHUpMJJl9HlKr0a2I8y8TNCGq3ergpyP3fa+lXwdUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+ygoEkSKGG2t2VoBa8twGrO1tOheGI4f5VrhT6YPNg=;
 b=m9jGybADWUX+GOM8mYY7x6feg+RJjurNFxDcsBHKqrytbY2R/Sfv3j3GCXrY4Lrpbw43bXvhlzAuPBebuQexOqj6fYLK0DhtZ79/TWnC0z2KiYeeYAwO+aSvopZ20K/EVJxPB8Qx5hR/PGEZ5NwNzMHjwi2eUp15/jU55UySo0w0XICzaAgdwKZd0D4r8ph3jbfcK7qy8hGpN/0BZI6Zs+ujJgdLAG6JI8f3EfHGN8XkjXbUnq1X+qASxQbD40BzzJwhGH88yZf7KOLOMPtnsDRwrG6Zy3k+MrFP4bYpKFRGev+VDMUFNgmIWYft9ajmOag23CgB8xNkn6MpGqtqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+ygoEkSKGG2t2VoBa8twGrO1tOheGI4f5VrhT6YPNg=;
 b=PIu65HMt4LVZo4S1K5Kri/F27ysifviGUOFYgCk+Vgy+XJ++c2V/5X/gMWWzo2VTUA9rmnNPdyadxAdjRsAfaihNVKFIoxUIdoe39C5h/NlpmCuJjVzQi5xhKUu352sT4sjLEdMcQpePVq6CFUJe7ucM+UMPue0tbZ191mfVag67W1TcV+DZdAGOPC/j7ML1wHH/W9Pa37w19weokG+A1/0XMZU/kljpBLefVdVVoTRB46qY86S/ze5SPuf67JJlxMDn/EkxO6yH9340Gs+/jCcWqBKPH1mw1877EH2jTq+0S4Bp0zoxAdl+mloagvwji6hodafesIOhK4SgJdtP0w==
Received: from SA1P222CA0186.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::18)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:24:20 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::39) by SA1P222CA0186.outlook.office365.com
 (2603:10b6:806:3c4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 10:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:20 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:02 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:01 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:23:56 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v5 08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
Date: Wed, 24 Jun 2026 10:21:02 +0000
Message-ID: <20260624102153.1770072-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 800cbe4f-7942-465c-73d1-08ded1dac13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|7416014|1800799024|3023799007|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HJUrEx87mJmtZB1kxPN61ugFBdtIDPoNEHj7mDIRMRaB1HTe3ojTDxjWxS3x/XAKuJt3eExVLwhC4KqZ1tQASOb7xmK9RiQlg4PIyqmVBa/js/i6nO3L7n4/WWxDJAZNRPNYRHpxGE6IKPns+Wt5gdRu4Bqr1f2Nnxnnus5L1K3aAsDdBFeoMC6K0cejet5u27j1zfvzLjiDh/qhbeAp0GUa59ikg+wpBtx/nLAPwrN97g6krCFKP21tcolTHOhLoRWNS4rMV7Z3+vdWuf1xUE/pgbiR6gcUg5X5MnwSIZ4AjJDSqGFqlNq8mRm7IMIO5+SPjNYod3PL4A1DE8uhge0TNhR5JXarAfYozw8gRQbpqUFurYi/qgKsBb7hU2HNt50geCF1T+gX1Wuo5WssCk8E9Qk25QrSvZj6LPpQmfQVm5+7GkTENmOpAepvxvcWrqqzzWiYNXUFAnmY/mCnHi1Ung0dhMrpURJrRTCGiUGREmUGHDbX1a062oCP2dNilZWLCxsc84rXmMIrclO4+xATkuWbyNZKdlnDdm0lEabUBv+S2zCe5vhoz8A7jhYPFpN+iOrahi2+PfMHw9aAH6hXjCEhQX67V4PV3Pga6AhjSGhwbeDNq6RtYKxmXnOJbe7qn/QjFTn2LJYGe617fqr9xLLuLX7rKjepThuMnl0s8kEoyM5Wj0y2T0EqjzgAoBAViC4tSeBA/WXfVYvcZg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(7416014)(1800799024)(3023799007)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7KCGYwmiOHyhLewYq7fNCwcn4/nyAp+u6WezNYQWNNa/3uwcoIWc+OMe0+IuRyGKLqC9uXP3itOp/EKgdt8mjAIsZsokGwmj5UF72Pa6vtiTyP9gpqxHStSzRAuzbqMiRYdhgp6TjUtVQ9Y6KAFguJigEGcOsiskkPgyNPw8cKbNarbwqMcSAvdopOmQUuy18OU0bjuaHWLfCP+OCWWwsCOtTLCfS3IzR+PO24ih3jdcCL1Fa2TkzjbOd+NfDiQO71TF6ykN3HykNkLykf5Ur1hsV/r80PAXXTrwZAnT/+1zFzRa4A0M7glIuhuPsPwFFk5AZvMc+SQ2gV753BbCarQbvic05JJJZ6D06prXvS35SatqouFVtrmcd1K6e1SRMXMWpVCSFOarCOOpTeLmgo7Xuua5mZHh0Hg7ScUwtH67xcwI7egqbPYfXkSWr0sp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:20.6603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 800cbe4f-7942-465c-73d1-08ded1dac13a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15295-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER(0.00)[akhilrajeev@nvidia.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:miquel.raynal@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@roeck-us.net,m:p.zabel@pengutronix.de,m:jonathanh@nvidia.com,m:thierry.reding@kernel.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilrajeev@nvidia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilrajeev@nvidia.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nvidia.com:email,nvidia.com:mid,nvidia.com:from_mime,vger.kernel.org:from_smtp,Nvidia.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43F696BD537

Some ACPI-enumerated devices like Tegra410 do not expose the controller
core clock through the clk framework. Unlike device tree, ACPI on Arm does
not model clock providers. The hardware is expected to have its clocks
enabled by firmware before the OS takes over.

Make the core clock optional and allow selected ACPI devices to provide the
core clock rate through the "clock-frequency" _DSD property when the core
clock is absent.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 29030fd9594a..8e40d178d500 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -242,6 +242,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST	BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -556,13 +557,33 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (master->core_clk)
+		return clk_get_rate(master->core_clk);
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
+		dev_err(master->dev, "missing core clock\n");
+		return 0;
+	}
+
+	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
+		dev_err(master->dev, "missing clock-frequency property\n");
+		return 0;
+	}
+
+	return core_rate_prop;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
 	u8 hcnt, lcnt;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -615,7 +636,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1577,7 +1598,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	master->core_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
-- 
2.43.0


