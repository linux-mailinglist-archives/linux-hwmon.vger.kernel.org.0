Return-Path: <linux-hwmon+bounces-15753-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qv25I+jWUGp26AIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15753-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 13:26:32 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446173A3A2
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 13:26:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=vB1pioMp;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15753-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15753-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1226D30CB20A
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 11:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578D7421896;
	Fri, 10 Jul 2026 11:17:38 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E8A41DEF0;
	Fri, 10 Jul 2026 11:17:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682258; cv=fail; b=dEZPMtgoZkjTZSC1Q4dPS2XIj0FNryENEC8ThDehOvfzDCp0o3ahODrk8xR2hRVLQBc9cdD2cfUur1M1E8B61rSRafX8tKeaTJ/u0ybPh10YUh2YMTXASazeTeMOsyAelYO0avZbPBRQGw/pEKIB4S1psQbtDegxFR56pc+agzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682258; c=relaxed/simple;
	bh=ZIu6/Kv52RFBtwoEYeOK0QFipJaTw/BORXYCtOrBrLc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qj2iQvCNefRjdG4Ww6sGZ/Mg79bhOPW/1RF4fHITDLX0mOf/QC3bDu252V1PPS+vLH2rx6EPE3QpfgkApQ20vPrPqQUgAmTgcOlC5t7ZOoEskWJX4hGmEPyafmweQcu4krEfol64hxnQUCY1drx7Tcse6THsZcZMEoz8NvTMh/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vB1pioMp; arc=fail smtp.client-ip=52.101.52.51
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+7bOBPMpwS/gEnwQov3/i3KHfYTm87vDuZSa1VeoSnRJM7B2zxhuvhegsEbslD2xX71+4udYd/lj0+YaTU5z1tCIBcxDZILu3fDzrSebfZHEZiJuHqd8NEoGeLq4gO1mmTFB/36UmcZpcrRbMvKFx8KCY4duO6j7GUQDX3c+Viv+Df+28GGmTwhhUPopcgM1JwTfgSHLkCSnCV2zqdgzk2+rpXbFgfe+CJzso3OfwMHYcRF0l+ac/Kj3e3hIVHGZ07nz3qZibf1+OXFsYjt++e9hrZ+BcEIWXcP8H80//+0py7Myg7sgX1jqBl+Ha7RE4Aw91TOnRc6lLKfOP19LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0/8Fy1ZoZAvFJfaz1DxJ27z7B+GvvpK1yC6StVJGHc=;
 b=AczheE3Bu8EXkjucoxHGuzH72O3WQNor0rBvOru9HjOQySJ7gF1ZyIBY/7p6pK7Rlt3rz6G3N25Rc5fkkhEE61UJLlYwVk/9Yg6vHVq7R73yNsuQi/4vW5WWCDGrd10rZhrDv4SNWSgUOJp87aoPnWG9xoa/jOQB7bmvwudrO5XeCctxQm52Q+2MdFviMweg7YRkt1nrCkgKW5B1Gun2ZwWCDjbXByd5+rz/B4gl8+fYDC2kprrXAzhCxq92PNz3aJI+Vnk6GVnSa20/t0FVvmdPnEALsAJZ8EDCkKPGJ4P6hvMDask0eYlE6exLtLGZTnmoKaiS4wPfhLkC7NTwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0/8Fy1ZoZAvFJfaz1DxJ27z7B+GvvpK1yC6StVJGHc=;
 b=vB1pioMpc+9znn1IbRph3P007Er14a0Bl1rNdbFttH9yRT+ae2EvCD4aF2ZQTdqAG9zaPNFNhNwmNYEpCYHv9SCvXk85lGBtTC/lD4gCmNo16+7o9dxmPHk2GPhsvEkf9jodA2NndWZrCXdFCOWQnywYUjKGkxdctw/WF4cbMZY=
Received: from DS7P221CA0034.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::16) by
 PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 11:17:32 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:25e:cafe::84) by DS7P221CA0034.outlook.office365.com
 (2603:10b6:8:25e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 11:17:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:31 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:28 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 7/8] hwmon: Add mutex protecting for sbtsi read/write through hwmon
Date: Fri, 10 Jul 2026 16:46:41 +0530
Message-ID: <20260710111642.850022-8-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710111642.850022-1-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c404fcd-e1db-440d-b16f-08dede74d5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8IrIfhmkjrWLHSkvOgncXZ6xQqgsxacG2m7gmSlmc6TyOGx+qjzJdI97mpJIoS/1FJDCOKcg1ACYUD3YWmDAamBs86ubfIutPxEoY2YPg5uZQ8zbWYYZEXFpl0EySmczw1aTZOGDW8tqud3YuLi4FEoFKFs5mmwR84vrliU5As/zfxw/LKZVRu7H8uCDmfzIYsu3zZNUIy5c80XzpyIdTAxFB3sRPux6wiE5vb5wXDF16LPv3PjD2MZkDAt8+xC1WvFMVQ5PZoCGlsyq1mp1bIH/dTf/12HvuKxWKCJralVJl6UCSaNAxvp+kkRL6yWd7TrlKMFWZXNT6elTEitJkX+Mojpf+dKxUJQ+CptHHAZSuDL5b+ewLLsvpFCq/6CX+CjEQCz7syO8SLASPZJjzKHfIOjpekVnIoQ41nasdukIlSLbCDT1S+cHZBKrMY+/uMGyrt7ggdGt+VbSUcx6Mfgyd+QPXZpzgfKbIk32CvDFSfGnOi4zgo3L1pA0UDxzo1z6ggmMfa+RA+ZSY3QNxLfFTZteTtZdKPqTQgm6y5Z+darK9teXwCUaZWhwQjT2NJKa5hguEVjl3jC6j4hsbl5utc6LxRXHXTxlPg1Dd78Rfd1mv4A0odzpQ4C3M/2hufAVNqPZBvtq3QIRi5H9iXLT2E+qt7ExD+N0jEPd8pUEL8aVbb6D7G8k38Xui2ofRMNGk9xgEZgsYue11PJprg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ipp23IFj0yQlFz9x+Th86e349ilG6ffPfp9yxypCzqjqRYyP4yrAW/qjp6u0L1z0dNunZkac9C0h19z8vwHwBQBl0oWKHt5kLtze+eN6Qr7iDnrgQtNHlrDdpIMFzI6lQ1Ktw+SV3tPKhPdwc+46TMlfWFiYp6a/XtLTBwqxJzpqK6/lM7RfKSXRr/jwvTYq6FEa+pbDoaoYNo++GrAtYlwEcW5Ttejb9ANP3pAI5d9NFwWlkJdj/WFbq/FngSCwPcCtadNLQA5y6prJB7p6fEkwAnV4sZG8M1ZBHcRhSNKDJwnk4MlPMSAg/4HvDjgUoJrmXBG93VO+phH76a0hnKDzsed8yhxbvWL7vkUvjUY2HLhyRvxhKguTfxFXNZR2UPAODnUNQURSO8XZU45CAjVnZwPOssQk5haJ4qzN0LW/BmPc1XuSXtnoDsLQhTA7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:31.8252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c404fcd-e1db-440d-b16f-08dede74d5e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@roeck-us.net,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:NaveenKrishna.Chatradhi@amd.com,m:Anand.Umarji@amd.com,m:Akshay.Gupta@amd.com,m:Prathima.Lk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Akshay.Gupta@amd.com,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15753-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Akshay.Gupta@amd.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4446173A3A2

From: Prathima <Prathima.Lk@amd.com>

Add a mutex and take it around SBTSI read/write paths so that only
one transaction runs at a time. The lock is held only for the
duration of the bus transfer and associated driver bookkeeping, not
across blocking work unrelated to SBTSI.

This is a concurrency hardening fix.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v2:
- New patch

 drivers/hwmon/sbtsi_temp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
index d7ae986d824c..11c8108d69b2 100644
--- a/drivers/hwmon/sbtsi_temp.c
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -70,6 +70,7 @@ static int sbtsi_temp_read(struct sbtsi_data *data, u8 reg1, u8 reg2,
 {
 	int ret;
 
+	guard(sbtsi)(data);
 	ret = sbtsi_xfer(data, reg1, val1, true);
 	if (!ret)
 		ret = sbtsi_xfer(data, reg2, val2, true);
@@ -84,6 +85,7 @@ static int sbtsi_temp_write(struct sbtsi_data *data, u8 reg_int, u8 reg_dec,
 {
 	int ret;
 
+	guard(sbtsi)(data);
 	ret = sbtsi_xfer(data, reg_int, &val_int, false);
 	if (!ret)
 		ret = sbtsi_xfer(data, reg_dec, &val_dec, false);
-- 
2.34.1


