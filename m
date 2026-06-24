Return-Path: <linux-hwmon+bounces-15293-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9TdGIl+wO2prbQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15293-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:24:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5286BD4E5
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:24:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=mROHPucU;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15293-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15293-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79270303EB8E
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E888525DB0D;
	Wed, 24 Jun 2026 10:23:57 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3B24A06D;
	Wed, 24 Jun 2026 10:23:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296637; cv=fail; b=iEDTKkqIjqdeL9QP86KHOL9nDeYAjUxYqhSQuW/aPvUcHu/qYDhkWEcsINivD+5LlPFMtInWfdh/6d6QMqVO1xCy0dVD3FUXjjNVhKrXayE2ot/sMwV3NNi30r3Fkz14z52yIov3ntV/U9MBxaQ64AsLQE7Mb6tq15ICsXxFYdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296637; c=relaxed/simple;
	bh=UkMZNtCRoRhtHoztYTIjMwpO2Huqa0SU2YcMdNO4YJk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIQOeS0JtOTLFLiYSR/P5qfmhc+Kz8dIuz1J7SrxOq3IsphnXjN4fD2k1uxXmw7f7ZWGecGZeXJDFnb8aCeWtC9BGDg/Lo7bWL17+hxdXnlLrZBDsqss5mG3VDK+yOorkYOjmiJNvtamIbZq7Nvukoyj+GNu1QumCvDuAJC2D/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mROHPucU; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSbjJDh7gkamw5jKm9KIrVUnkeFPNMUx3gMzIILZasSY5/psxO0kUwUt/mqjnor2ppq6ayZd9EMjJdacScUTx1OHFzeyU1bBis/qjZltbIiw4pcvjmertr362/IfKJJFrqPNJ52D5lovzRIdz+ot6mIblef6f5n7DSAW50zs6oXimZJ3oWxpnDkYdRMoQ7eBPPjPgqe62GPEfsz5bhDjMA2PgCOPu8uPAsX65/wIg4aOSzNvaVwiaYcxty0EccPpRz8K2KKaGUiWEHOJw44z+hgmHvpIc4NM9BSHi32SY+izuiRi/agjlyS8r5Uu01F48vwTviMPRduad0MVNgA63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww+k38kewaX4MSG+bvCFzQGppMQLe+gxSsDtRulIdks=;
 b=SHWNd0I/Ffei5UHE5SNdps4KJv2FfTUvLAUCexp+oNe3k55qPut93qRwd1nboyVeSf6tRuDb5zTPwTKUHAsjEyCgrhoAGKflEdIqUhxNnLp/Rk32+5LDwA1QzmuMW7qUyxmf97TwBBFJ8PuXcvHpyZR0pxbSCaOahUIsZinnyZdA+visEA4eBaUb0jml7koJ0vatbppoW7lZi38vsZQCFQRAVt7ULYZ0EWa3O2PARhpQNMVmpeXAteSQdWox1xZXrc7RAE5YZ26mB17e790OTDhRmQyN7MlYiBGgDWpIO7RKOJ0s5NzSVcX3bGR6D5DBn644QI4ozEStXv+HEfSLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww+k38kewaX4MSG+bvCFzQGppMQLe+gxSsDtRulIdks=;
 b=mROHPucULw8CK9Ytgj09y8ju2GVMz+3owj5rMEg0kikmxREwG80wfZyTy2VDN5aGMmOS8LiuyuGBwYR6fNtH2SdeR1eZL8kZaU9u9LQO169975t7si5pwzJ+7zc1C+6L134g4YSBznOQVWE9vt1x7Wj+q/4njvwp8Pjs2ZRU6Y4CjIQRJN/Aj+EriXEku2Imaie7lWQG+W5KfdJcLMD/oDTZXHH0eud+FO8SAd4HkbD3lZNQGqE0w68ZCxbhpQaIVhRTVhxSWX+4S7nAizECUJv1K2UOQxEex+QWnnYi3bTO373K21gruHk4Rm88xmFK9p77tVDMVn3xMR+NGfXlXA==
Received: from SA1P222CA0197.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::6)
 by SA0PR12MB4365.namprd12.prod.outlook.com (2603:10b6:806:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:23:52 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::22) by SA1P222CA0197.outlook.office365.com
 (2603:10b6:806:3c4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 10:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:23:51 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:36 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:34 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:23:29 -0700
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
Subject: [PATCH v5 06/12] i3c: master: match I3C device through DT and ACPI
Date: Wed, 24 Jun 2026 10:21:00 +0000
Message-ID: <20260624102153.1770072-7-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SA0PR12MB4365:EE_
X-MS-Office365-Filtering-Correlation-Id: 997accb8-944c-4947-718c-08ded1daaff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|56012099006|6133799003|22082099003|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	/8AzTvgFZhxVmKXwenV0bQqEZaE2bsaBMObGPBLOiyT36CF5A95xuKWVhKO9KC3dFvWQvc12kYee5Keud90j4C8FUdY7Ul2T9czU3BTGjaFa2llggq2RTxMOo+a0ZWXxCnzq0+UZWyYOwP/K3VLrmjr+vd0fsJLtXDh4njkBd7UNnYIxXanujX+0FiVqBL/MsoR0pjV5tn+JXYSYKiHdNfRnEO/C+DRC3+779pgjKXYISDMiANTCNFQtCaNZWIvdpqNbpQiDQQGNCuJFLfkVxuqOHvP2pzHK8G1iDgTJ9TFDKVzShrL/sRpMPdaNHud+VI2aml7ypyVG2m8b6PLdo0xOsWFxj3ZqvZhZDYp71Hlj0+/iEcRfMRDts/9Xi5D8q69DZTiSkUpIpJyDDFfWITfa9Q1wZeRXbU6nBopxtjFOD5XnINlv99i41tw/HmQt2mFuUEY5jZ5rHWmmRFzYlWTO9JAC6ZBtpcY2UxIN3hy5PqCBw5A9vbdUe0lxQOSZklW1cJdyz0KKVJOMPip1z1oVfHcFwLOOjyxebreQNTp8zm6PCLuF75eU0h2eHE4RJLCWf/cjFvAZNXjFs9AFv5kcZakFFOlf5NGfgON/mcgPrwK7hjGUl300J7PN96K7ejowhtl7lVXYR5ubqjfeQnz6jdFFAumJCGahbYDDnWbQG7SE2abi4MOeMRz8ZLEuPKXa11QjNyspBqrLz1bTHA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u6jwJ79ZMEtjSwRromCHFnk+ltk9YibkW+PLUTZJMmMfEMclZW5z6bgRPjkMkPmFPqk6dwzaI/FFZ+zK3iWtTXB8wsvTmucocEyp1R4JwRcobbzYzQcgmEtZLmi/cdplzo12I1+TL97la4Dgofi6Xopuhpt7aFLexkSrZpVOgXo5ZCR4ErxeuL9pJxUt3lIyTEK+dFCxih5XVuNl4qi6zQzPo55yTPjQ5GEcnKowwzdDE1Do1YNdD7td39DVi58TVAQzYFBqFvdqScq9LyarMQbNnlpL4cWF/wUFrOvuvw7DQkFg5iJ3/eXCAejh2CcoORe+vssoU35TWQRHbyRktYIYdLaa6uqpbU2wnu2UMN8fW3v0GZQ9LH1zQSzCt0o1Mq23LjniL4Aamy5Ah7dztgm95okkKRuHR57PDG9ZliHhLzfmb5Xb17VKQzPV44JL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:23:51.6684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997accb8-944c-4947-718c-08ded1daaff1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4365
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
	TAGGED_FROM(0.00)[bounces-15293-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,nvidia.com:email,nvidia.com:mid,nvidia.com:from_mime,Nvidia.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5286BD4E5

SETAASA-based devices cannot always be identified by PID or DCR; the
standard I3C id_table matching may not be applicable. Allow such devices to
match through Device Tree or ACPI.

Emit OF and ACPI modaliases so firmware-matched devices can autoload their
drivers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index bd0dc76c7ba1..f513169ac395 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -320,6 +321,15 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 	const struct i3c_device *i3cdev = dev_to_i3cdev(dev);
 	struct i3c_device_info devinfo;
 	u16 manuf, part, ext;
+	int rc;
+
+	rc = of_device_uevent_modalias(dev, env);
+	if (rc != -ENODEV)
+		return rc;
+
+	rc = acpi_device_uevent_modalias(dev, env);
+	if (rc != -ENODEV)
+		return rc;
 
 	if (i3cdev->desc)
 		devinfo = i3cdev->desc->info;
@@ -345,15 +355,32 @@ static int i3c_device_match(struct device *dev, const struct device_driver *drv)
 {
 	struct i3c_device *i3cdev;
 	const struct i3c_driver *i3cdrv;
+	u8 static_addr_method = 0;
 
 	if (dev->type != &i3c_device_type)
 		return 0;
 
 	i3cdev = dev_to_i3cdev(dev);
 	i3cdrv = drv_to_i3cdrv(drv);
-	if (i3c_device_match_id(i3cdev, i3cdrv->id_table))
+
+	if (i3cdev->desc && i3cdev->desc->boardinfo)
+		static_addr_method = i3cdev->desc->boardinfo->static_addr_method;
+
+	/*
+	 * SETAASA-based devices need not always have a matching ID since
+	 * it is not mandatory for such devices to implement deviceinfo
+	 * CCC commands. Allow them to register through DT or ACPI.
+	 */
+	if (i3cdrv->id_table && i3c_device_match_id(i3cdev, i3cdrv->id_table))
 		return 1;
 
+	if (static_addr_method & I3C_ADDR_METHOD_SETAASA) {
+		if (of_driver_match_device(dev, drv))
+			return 1;
+		if (acpi_driver_match_device(dev, drv))
+			return 1;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


