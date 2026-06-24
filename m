Return-Path: <linux-hwmon+bounces-15294-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iUqTI02wO2pkbQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15294-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:24:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B296BD4CE
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:24:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=KUGe2m6M;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15294-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15294-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4D4F300C334
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E646323D7F0;
	Wed, 24 Jun 2026 10:24:09 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56A78F29;
	Wed, 24 Jun 2026 10:24:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296649; cv=fail; b=VGFNCXCHvr4cu2zUMbhlaSzXvz3dRy9STms08IJ8NhG0HWkR0BF4sW4xlS8hETxdhBVA79BiFTkUDFMN1UXN6XtT74+N/nkxcC6r8qBuyHexV3ZulCR5AcdRWPkkWT3HgHdqmffFQRb1zRoKBI2RZRfHrht8+4rjSYT4yorOAsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296649; c=relaxed/simple;
	bh=cnBxZfKlFcPWDDScr3bRU6n4zC7SxOLBJhii9RPj3Vk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d62yoFR0hWjQsGjdmSltWuOYxaUvYvLxbnhp74SHsat42PXIuNnKpZqSreXXvOGEE6oqQM0tbPbJA93jfGPzAXDgouEvlK4SdZboemvUu/ZrqG4AhXAyRWJtB91m3/LSjt+jjafPY+GrxbBD88XRBNIG5i+Js/P2VkAF/+FNNRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KUGe2m6M; arc=fail smtp.client-ip=40.93.198.60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI+WjhoPmhutgWzB9tNu4p6G8v20o3jj2yPwf6K6uuaK07Gtpj8eTNuMVd+1XU818wBTNHXpEqOrfiC01yTGYhS9dUg4APFGDRsSBTdJxm8qXQ9VVhQG1tVfXcvnhwNX1B3PelTb8k/CpKvjuEiHAleLqWxInLK72pPtQlcD7c79rGRaWmzqKIeauBCWb5nnfMWXx0R1M0BBn6Vo/CRkPnRbQ5kaKbjsge0O90EAv8jUERwOry7/7NxNMXv380D5O59bLO9H9Axm/loqAwUAYZTyhVUOyYXqz4kDRzayMq9D24nuDxew8u4tZl+w7ng9J9ok8xfalb7wEJoxx1aMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=nkUnHPH1YSg7daci0uAHRjDhKUzP5EbTNFl5+0kU2hino5BDY/bAkSEnPuDC8tvvPSAhe5uGicgvni/ZbEFgSXvf2/ej2lzN82IZlzXrEFqiAJEnaPpbwoJ66E3wI7bDY0VWfBRcOll56epfPrm9xtQtH5rdw/a0hHWJWjhwFTVVqLbyq9ycP9xeYwedYK66TgVS6KOF0QJr+dmACS9hVvuYhTO+x7GrN5SGzhvTFmI45cIU+TSE35OlWuoD0hn51I+uBDFINU0lNnYCo7kac0V8iaszWuNIE8VJ8Wm5mKls05sjD/yG2vDNQxA0s+OYEF6nCShOom4iakInzobhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unGLf+Uxex8MrwG2kOJpiBdUwqjgd3Iqf3Br6rTj0JI=;
 b=KUGe2m6M8V6Auld9vy1Ws2mWlbmkTXrgDnbzffMY3AlZ3lQQgehG3B+0Tljkhe6wbiCKuHpKHBSTLHZbUdFI6NAZmdvOPlwHFiTyVIGqzSjOi+juCZaV4EI7pqfAdQL/SGaWW0WxdRHnB6cBxlb3G5tW7XpYy7Ms0fKu/v3S9lW/ss4W5bpWFVj4KN7oRciIUwCRTYvSJPi2jUBTdt1ZeXC64JiqJVyqmQ2D7CQRKeV376UslRDV2OQxMmWf5LpoPcQkckx0ZojGNGEj63d/fIv3VxvzmFRUVNpCO7s7rrXeSTROFmiyF3n2FdhdfcXgos4ffnpF7lUDNRXb00H7xQ==
Received: from SA9PR10CA0015.namprd10.prod.outlook.com (2603:10b6:806:a7::20)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.14; Wed, 24 Jun 2026 10:24:02 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::61) by SA9PR10CA0015.outlook.office365.com
 (2603:10b6:806:a7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Wed,
 24 Jun 2026 10:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:01 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:47 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:23:46 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:23:41 -0700
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
Subject: [PATCH v5 07/12] i3c: dw-i3c-master: Add SETAASA as supported CCC
Date: Wed, 24 Jun 2026 10:21:01 +0000
Message-ID: <20260624102153.1770072-8-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a701d6-f15e-4e65-7951-08ded1dab5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|7416014|376014|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0aly3J3Nbb1FDvp4e+XxAOxSgyMinBW+4nc+M0lMCsZUxMBXuq4K3GQczifgWJS+u7yeoX+RyocMtly3VD2EVH5SD9QH9QdJSZpCvxUebLlf2HfvFWPeyl5UEa90knsKRXYfsY0NhT9ZvEkwHLhjf56HzXbehxE22F7Wht0yMr3fR9sYbM4e4cJs3LcX8zYI8HrddHrUbrCJ2Hvs14vv4i28A0NR4ghtdOGOgewflzMndiKLdZH2Tis/mZpeuIeYS1tDQO01gsZlBgX5ZwlUf4arMl4N9HNI7PnHm2iHXITFu4HxbrQISS/b1gnaaW0emX85NPaUspYtHe7DwBfKv3+JVUHEwGTxJk1JW1Sok6sp52OFVxTJuImPqBJqZ0XARKqcUjkklrprzSyo5gsSOpRAM7biJfAYTcwAINyYeStQwPGjzbCqmTP4sJnAGxB7nRNcaNEWqjXdgO+n06FyW9OcrgJlfZ56ExB85mSJLdUtFqIFAELsDMi3ErIl/nbWmpmkSy4+aQfzqaaKnSDWXaFsM+ce+gHMPQB3JROedFdpZn1+ugpoxB5bF/WaLrQJawseORPKA8PDHrJDt8QZAEP/6kSaW10o0x4OxVsYCrL8sbA8RoL3R++xT4G25BovO11bvGYSRRYM18HVKDOpfc+905GzLeK+LaI3b+BmYubp+fCXSlZ799os5cFCjSMiYeFk/GBaz5S/+diXJzL4WQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(7416014)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lloOJvxRlmsZxQZ3jCvTkqF6Y5WaM4P7Z890zf8eaYxDcX/4g332hbDVF/94T0zrmDff96kKmIaHVuy+yQsinyF7umEqF2Odr+pEe1fegwZec3R0Dr3LSB+A12Odi1h7NM6wTqnlLqwSAfYZrdvciu2WUghOvLyI+1UVUnd/1+GHRphlUHJ0T0KsxapvblIkue8SUPWUNlMpMyu4ZbqI6CGe+ej26jhBYfRBPa5hl5MSQ4vH0l+KW7c075pK2BafmOaWcPUiYoWsNZmLQpinwEbfUqvo+zms3m7e+S6iFsRxCzZF9+zecjrVkAnkdiNLs0W0DRitgP456m2BGd1XJEjOqcEpqM8N9+PAWGK9DE2QLjwkwp4oLIwEj0n6uHdCNWXBk+7Acz/r55h4HA7fIqhn0Ia8HvoQLKHnmUrtj5dvD0o7LlQnlPKf/74FvOcl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:01.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a701d6-f15e-4e65-7951-08ded1dab5e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_DMARC(-7.00)[nvidia.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15294-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:email,nvidia.com:email,nvidia.com:mid,nvidia.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,Nvidia.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49B296BD4CE

Add SETAASA and SETHID to the supported list of CCC commands for
DesignWare I3C host controller.

SETAASA is a broadcast command that assigns predefined static addresses
to all I3C devices on the bus.

SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
are connected. It is a prerequisite command to be sent before SETAASA as
recommended by JESD300-5 and JESD403 sideband bus specifications.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2f8c0c4683e0..29030fd9594a 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -309,6 +309,8 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
 	case I3C_CCC_GETSTATUS:
 	case I3C_CCC_GETMXDS:
 	case I3C_CCC_GETHDRCAP:
+	case I3C_CCC_SETAASA:
+	case I3C_CCC_VENDOR(0, true): /* SETHID */
 		return true;
 	default:
 		return false;
-- 
2.43.0


