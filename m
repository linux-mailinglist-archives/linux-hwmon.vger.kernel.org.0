Return-Path: <linux-hwmon+bounces-15202-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FIMnBedMNGr5UAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15202-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jun 2026 21:54:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 617C16A269D
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jun 2026 21:54:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=elvgv8wX;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15202-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15202-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DEC1302EEE7
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jun 2026 19:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4AF2C324C;
	Thu, 18 Jun 2026 19:53:26 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C0021ABC9;
	Thu, 18 Jun 2026 19:53:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812406; cv=fail; b=cn710T3wy7Dz22qjoegUTvEHBNQ3i3Sjx3cgQE06LOkvEP1OQRzquJwF+yarwi+dG5nxnmtxpLHhLKDrFB28d/8Y8kqmDtKCQ2YcXHa8CrC3V3tG8KP8lwQPmA4B+i3Pq4Gx+fhwenMsDA4mKZmz152cXklykd8gEjBiw6+eLN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812406; c=relaxed/simple;
	bh=zzIosmza+AmVQWPJhvucwQYvAhchGUhxdB+mfBQAaYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sHLCRn0pz9w+zdp/3hMYcCeTfqAENwFDpPry5Z+pj+ZNdXcNCJxKRUbTyAmyCqX0VEu2pzwhgqnH3XWxDLtYOwxHZ3Vwzvt1I4QJZG5fUwlYV1WulcgCzsIQ890b0lsLp7mmKqwhMSZNkakgn0XHFWGYg20T5BOB8HIUjx/LCR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=elvgv8wX reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geRG7az2MzyiXW/4gp6HJLJXNgc5vcQtIWJGM4+qf6YyiDnIE0bK7WAfeH0MzZQgYVq9dgr9peQpeZWDHbhO+fFp96KcN2CCFCxU/efqc+6BKTzMBufGoKKJTOxmFXFuVuLvwVh6Ej/F9/PrU3DwnuNtAFGRwSWcOhE/7NZaBPuRPGoI1zxOZ0r0uyqgZPWZFTQ9rK42aqbjFCbVkTzLHwh8EcdIctMjaR49p5K1zVt7vPbDySwbWCASDKZw5poXMoQpRqACunMutch09IjX0hA+HhbCziXwljuopAkD+U/YjUmEbPDz61/vNnu/934DPyEwWUZ/xJncu7NKELQe+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r20S8axy1BJDJn5RsnYRtrT3yic4fYi5nyaMgkjmxto=;
 b=hdVdSEuDFJyIbwogRVz3Vx7iggdGLu4cnVl4QYfU+q1NfTb8Dv2lg0Q2pdag8TpTYtIBk8OB22GsCX8ZH5B7qhz7LOVmlTFYbJ+X75qnEGSTwbX0WCXsqVmoDI3b+0luoM5h69nJpBW7qbiHYVb8KAwyv2EItczeHWR0YwyCChXxy9qFDFGW5+0RfqiD5gWjJRkzU8GflL3BCBLUnfqMowPdVeOnhRw2PdCebAZsXOkThUhZ4jqrOuOCQnHhotShPCOFaO1ZJ1nUHkt0ZNvTOBq3Q7mNP2bU8NbnLEXqVhcTn6vqVIDsvh/GsrwiEpp2C8wqsgiQQ6NwgsykmohdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r20S8axy1BJDJn5RsnYRtrT3yic4fYi5nyaMgkjmxto=;
 b=elvgv8wXE7apgbLKixMFIawb4iggRJ0E+Otq1SiB5jULkE7UTg0uv6t9lyLdwJapGT2169P/fxgJ2z2N0x9yx33aYenz5eMiUnRf4lBbgbbRV04dNhIw41GLZpmkFQ77yql6y1+gG8f075xYzyaErFIpZLoH25/D/RDCW15f7XO6JtD1UkROYPQkN8vZ6oNcov1FME2chIGUJokuciQ2GhRBYWq4i88aimmvthGRHLaHK5TVo2yGqfVCcmyhaWMkEkl295JZ3z1imVmhp9CPyL3bRz6XrS7CwYYFrrqGmYq9w22LkQMRIn20Y6iRSk5mWxLCaAi6j1wVqE7WD8Kjxg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 19:53:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 19:53:22 +0000
Date: Thu, 18 Jun 2026 15:53:14 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, linux-hwmon@vger.kernel.org,
	conor+dt@kernel.org, linux-i3c@lists.infradead.org,
	Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 03/12] i3c: master: Support ACPI enumeration of child
 devices
Message-ID: <ajRMqilbGEi6CsLc@lizhi-Precision-Tower-5810>
References: <20260616095429.3947205-4-akhilrajeev@nvidia.com>
 <20260616101515.34CA61F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616101515.34CA61F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH7PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:510:33d::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dc6ad7-db5a-41b8-0f7a-08decd734071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|56012099006|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	aW57iFP5XW2SMlQ3PWfV6x3BUvHxWPCksLBx5csVwA7uJiAcoNw9twp3Cc5oV0NZk5KVmTIe3yLMIg8nNfASEtdXppH5PoCMOU2yeuSoWz4Q5E4tLKWZVWoDdRspvVOH7ELwK/l5dT75b3pI7OFqJJDOaZBjFPRnEUFuLJkn6Kl2gXUYpDdW4A9iy8jQZxDO0+Mm8xFm3oDhX4mytIxKGw1P1u1yE97Ja14tyABl1rxBhOwPulsrQ/gw2o1eaLd1/hUEQoL4X+603OcKN9gwbQxw2OHRKi9xVgMUrP9gn7FLg71Yb0kjhleA4jx5ExAFE5hSI8I/fpNGdqH9Hiy6RNjaVpphqgr4wrLDLq23dft2hev0vDUWWU4YaMlcJO+AYOUfgOUZl580DPVh5C/5ceHbR0zpfnytPPsxPWWYQ6F4UoitZ9yJ3pzWk61iqwc7mfNAvpibBG1vOZc4yiBon+ipqhmTT668XtuyBFOR7af6aQ0C0VJMV/4QGsov9Qf0cvJkOwJSf2OXTni3TaTw7Q/2OwHPcaNCn/Tu/PZ3wSrDBDtP5d0E0dTbJ/vKuvimISgLIAgb1EhQIPbd3UyjIGYH+9Di1DZbsBKOusnS3ys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?jNjiBggPr6+fB9vF8hEKxjqUZqaIDveMp1e87NfUBAoT4vT4SVgU4rDPJE?=
 =?iso-8859-1?Q?n94/WH5oByk6s4aEJFF4gPIzwjcnFbztX4MTQNiy1Kr3QfAbCEpXTEjAp9?=
 =?iso-8859-1?Q?hLEgnvhbJQ/FSW/hxA3eezI5yiDfXQ/7UXaLckxHdjrYQr//n0603ctpHY?=
 =?iso-8859-1?Q?BQU0e74uZ0biAb1DsNZFcfxCeF5F2pmHtrdBa8iV+K4Qyjt9aK3zeQm0/0?=
 =?iso-8859-1?Q?62MoQJFpmGTbdX2ekBYo0UZYkwnkqib47H2d6HUDINw0RxqcIra+udsYbB?=
 =?iso-8859-1?Q?Z30eIkKGrDlMJ9VLhbRXSet6ZMIUi3uCwy2NZOXHng+Lbt8i+6ncxOs0fD?=
 =?iso-8859-1?Q?X4kdi3nbpYSeF6QLPyeJh66Es1Lj6kvzgz1++UwJC3kC5DIHcgNcdWBdQm?=
 =?iso-8859-1?Q?bNfcavheuZVdSBej4ToAdkn892Ygue/jUNrI8/sh9X7bS4S1o0GTdTaIXH?=
 =?iso-8859-1?Q?HK9D91VtdqF9tlv1RjqsfRQcEEMFPSIWMGivP3PcUahyWxKdKC019xoZoT?=
 =?iso-8859-1?Q?wS+W7uLPFgD5xXd3vzwZRC06V49QzceSFNwrrI60Rh4gBD0k0qesEnKRUd?=
 =?iso-8859-1?Q?IydoWwJIk397bbfs9BUoNlBFwhBJ2MO3qsyCoVOhCt3YjDw+1T0M/mqNA6?=
 =?iso-8859-1?Q?mP5kbv5yu2AGsF1u1InW+tbpmb3VuIPHaxd63SBaEBGUMHalb2rEpMSjVp?=
 =?iso-8859-1?Q?ddxQs8/DUI+sUHWTN7D69vCsSqGe6F2fQ0f2ZjwqzgAZ4kT1pDwYI2BuaA?=
 =?iso-8859-1?Q?RFcXAsNmbIFMmL5pHoQg7onGEy1qUK1oZxVxEKIpNdq1kkQLq4xNUxKg2R?=
 =?iso-8859-1?Q?5TywaMPIaq+O702STRx7OX5zL8SNYAe/Sz2b7LPsthNgVPe6ZonRd2lG9k?=
 =?iso-8859-1?Q?4udMaBuqQ4OqwFNfiTOzRHrMtOYtd6VuRW7Nv0cXt1NrD829SMn3q7FkH4?=
 =?iso-8859-1?Q?fTDPfifGyAROXzzZFcmY3kWvsolovaHnD84x/LWDJtvRjgoI1H9Y9vUPK5?=
 =?iso-8859-1?Q?r+o48ODnjDUjf8Zm6GYs9goBDGEkJrDKWLsMqui2GPHJu5a41OAIf6FvPo?=
 =?iso-8859-1?Q?QTQN65mw9rTBM8OvTEKEtjrghegc2P7LiDXJPA6JuTmaH14uiZfCMCd41A?=
 =?iso-8859-1?Q?vnlHnuueTuNCbvqJNUGyw68e7lYYh5I/9Xp6VItFmB0mONtfAcgQB5EcQr?=
 =?iso-8859-1?Q?0GkDBg8qkGIS1/bsUS/Xli/SKzxM/jRA9NKGIV+P5z0gFxwZiZ7DNIrsCy?=
 =?iso-8859-1?Q?HllAldl4sgic8C2qt3oeU9nmDUgTypMCWBGD2Ug9/GyZl4DzHjWfsFO96O?=
 =?iso-8859-1?Q?rpTCdcLwaqOvyoXUno43ctt2SgK0kigVv1X1EWoNPm6arDCyAWWQiyWmvy?=
 =?iso-8859-1?Q?y9nFb57vIbEgv6G7kO6/hQxyNg2aN5oTpwkeS/+hmctLWWMDEkLkVqiX9+?=
 =?iso-8859-1?Q?FTu/ZR2fQF/35jiUp+VemPcXTLHoDbcE17Lnap+JasfAOVlWy1cHoqwYxk?=
 =?iso-8859-1?Q?sEpJRtHALrLpPJUuu1SBAA9ZvRkgO/g5lP418RiXqetixeOBFJ8P4WlOZE?=
 =?iso-8859-1?Q?T3xUS+8kDsa9vXXRXeB1SeWymQVGt6nRuUqLvWJKtl/M2BPCtGmB+OtRuS?=
 =?iso-8859-1?Q?zk1oE/UXOGvrS/Sin1cTEK3Qs4plJ4fKCbLJFoPHJr3LIi7Pb/+a0oNVGG?=
 =?iso-8859-1?Q?+wvDSrGL2bvbhZOYuHxiLNmaYUb0cPb8nzNVsEQJe5+0thjKMXFOKCUKTs?=
 =?iso-8859-1?Q?QbRjQNoBl6MCPvp4bQN5w4fthejQinZgHmdK7mYVKq2xJKDhYmndIk2Xl3?=
 =?iso-8859-1?Q?9O88GQxbRjN+V2XXk8m8yu413lcm8Rvyaj1vVXgv+L2c56GFTcju?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dc6ad7-db5a-41b8-0f7a-08decd734071
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:53:22.1159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Flu3tTFIuatq5rQdQ8tK+VWgZOq+zsb1Cu+AtpnFDaN8Pigz75glzGs+ohAmyjANNpjZ6gayZSEXqMBvJ1c5SKl/jOfAmrItlzUeOCYTvKi9XpZn8y9CUgm8Q5fCWl8n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15202-lists,linux-hwmon=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:akhilrajeev@nvidia.com,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:linux-i3c@lists.infradead.org,m:Frank.Li@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,vger.kernel.org:from_smtp,lizhi-Precision-Tower-5810:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 617C16A269D

On Tue, Jun 16, 2026 at 10:15:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] devm_kzalloc allocated 'boardinfo' is leaked for every ACPI child node that is ignored because it lacks I2C/I3C resources.
> --
>
> commit 9a388c2056a553d628ce4b8b623a812d4aa08951
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Support ACPI enumeration of child devices
>
> This commit adds support for describing I3C and I2C devices via ACPI tables,
> rather than relying solely on the device tree reg property. It implements
> reading _ADR and LVR properties from ACPI resources to retrieve the static
> address and other device properties.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 3b19a5e8f46d0..f0e05bcac26da 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -2708,6 +2762,74 @@ static int i3c_master_add_dev(struct i3c_master_controller *master,
> >  	return ret;
> >  }
> >
> > +#ifdef CONFIG_ACPI
> > +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> > +				   struct fwnode_handle *fwnode)
> > +{
> > +	struct acpi_device *adev = to_acpi_device_node(fwnode);
> > +	acpi_bus_address adr;
> > +	u32 reg[3] = { 0 };
> > +	int ret;
> > +
> > +	/*
> > +	 * If the ACPI table entry has _ADR method, it's an I3C device.
> > +	 * Otherwise it may be an I2C device described by an I2cSerialBus
> > +	 * resource. If no I2cSerialBus resource is found, ignore the entry.
> > +	 */
> > +	if (!acpi_has_method(adev->handle, "_ADR")) {
> > +		ret = i3c_master_add_i2c_boardinfo(master, fwnode, reg);
> > +		if (ret == -ENODEV)
> > +			return 0;
>
> [Severity: Medium]
> Does this leak the boardinfo allocated in i3c_master_add_i2c_boardinfo()?
>
> If an ACPI child lacks an _ADR method, i3c_master_add_i2c_boardinfo()
> unconditionally allocates boardinfo using devm_kzalloc().
>
> If the node also lacks an I2cSerialBus resource, i3c_acpi_add_i2c_boardinfo()
> returns -ENODEV. This causes i3c_master_add_i2c_boardinfo() to return -ENODEV
> without freeing the allocated boardinfo.
>
> Because we catch -ENODEV here and return 0, the overall bus probe continues
> and ultimately succeeds. This means the devres-allocated memory stays tied
> to the master device, leaking sizeof(struct i2c_dev_boardinfo) for every
> ignored ACPI child node.

Is it true?

Frank

>
> > +
> > +		return ret;
> > +	}
> > +
> > +	adr = acpi_device_adr(adev);
>
> [ ... ]
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616095429.3947205-1-akhilrajeev@nvidia.com?part=3

