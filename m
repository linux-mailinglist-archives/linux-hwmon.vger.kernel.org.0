Return-Path: <linux-hwmon+bounces-2100-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA108C0C6B
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 May 2024 10:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCAB32836AD
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 May 2024 08:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761E014AD23;
	Thu,  9 May 2024 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="0q0KYmwr"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2057.outbound.protection.outlook.com [40.107.255.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C07149C74;
	Thu,  9 May 2024 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715242708; cv=fail; b=UFysNDIuqQ5qJzTSNQPlK+SgKAxRXkKT55Gsgm3S4b81N7tUbgTeIsY7jPpaQkaJRiQVK9x14Apx87g2PZS++kmksBQpyDeBbk3voZIhfcUxO8qLEmOXM0A6FRpodsbiFgykhHX81llvWMcGEvcMskLTFGIBRv+kIuw8Yb0OWx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715242708; c=relaxed/simple;
	bh=muVcbLDlWX5UayBMUrbecTJ5GL4fJVhFwzg3Fsk6bc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XcJXcWwOmgRGzFUE5Jbc5A5sw7Cp7zpWWzwYZxlCpdOxIG8wdBGisRwYMnSPXDK1sxKSGOlTRiqQifDfnuFkfiPQGjqy7xPONmSl7wLme/qj1ALqijZ4dE+BTR9gHT7AuqikUqBl83TOezubv9KCm3ODxxQfPVa5z8l8xMJFnQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=0q0KYmwr; arc=fail smtp.client-ip=40.107.255.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB6RSr997p1iw3eUw7pIeQgHkthw277jI/P1UjiSsRMHemkW9dFfiX64ZRABRbWIWRw6NblsM4QffHLB34CNAptBOLH2gmJgMfLmWB5t6ugtFYP2jD4xYJ38IpO9wKSSG1Czvoz1ANIN4AFBcUJbagTYb/6Xlh7hKWDassCTvmTxPYLm7X3hPP0r1DYNp0aAfRY8CxgD1jUOblNni8AW/XgWyHNHwmwuH/uUCDXdWv2OhYm+/7Kd8odxZcydrYrcN3ns9UJ+vi4TTWmp9tsqIBv2uAmAuheEwkrEsslGY+oFeEqlcaT/0v0s+YKJ2uLuD/MbwBTto9LrWcYYl75XJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muVcbLDlWX5UayBMUrbecTJ5GL4fJVhFwzg3Fsk6bc8=;
 b=f2PiU/cj7H9M4PzqrAhinHTCfiOH9Q8u8s1rOpwEbp5kY0C60doygXQ3c6aXbJYmR0ub4zKbcc7XmH78sRhqWX0qQwtoU16rLfmqC9mepLHg0ULwgz3h9C+7Ho1TUK5odf+spkeNBy8kc0j6kzEusJNsi5obYQvp5mrNei4qlv8QsIPHREEb6tIuStnZR391uLn8fNK+S8X58i+UYslcqvLWUgw3raBygTPiOuBJ8L6Az52dLUdl2BqdGDoeyQqFRPs3KYp7OwCwm7ZyCkv0tnwVLRhNewIMNaXQNtm5Yg5GYq8FM/TJpXg3PP3Y1Ucq2Za5YLYRyW2HiCuIc1smEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muVcbLDlWX5UayBMUrbecTJ5GL4fJVhFwzg3Fsk6bc8=;
 b=0q0KYmwrMcImR9d4/6R9vuSrNNelFiIZZv1Yix+JGlnXR0MyCYmJ+Ks8C35E2rt1seNy6XmD8RrICaMKLFOUZAy1BcPcgzdBVlx8ZTk+XKf3bRfGxcwE0tr63/QD7FMFNi3T1ykR60bZWxLEo+JZpLvYAgcxPddPWG9GMAzEd3iWHNthp1WIkhCK/uEa8C+dxOZO58uDMq/DnvTlyPCNPDqDGTiFpj/fq1LD3LS1YsoFJisEEtyxdJvagB/UEV3qO6bMEz53zphKskbAw4zGokNI7qFYq4ii1ELftxz5VPoUyDTd/QXo3zSUT8jDdqF/JpJgwEMp2QnXfbvayllYgQ==
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com (2603:1096:301:69::12)
 by TYZPR04MB8297.apcprd04.prod.outlook.com (2603:1096:405:da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 08:18:07 +0000
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::8f93:f51f:e216:1317]) by PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::8f93:f51f:e216:1317%4]) with mapi id 15.20.7544.041; Thu, 9 May 2024
 08:18:06 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: =?utf-8?B?Q2Fyc3RlbiBTcGllw58=?= <mail@carsten-spiess.de>, Jean Delvare
	<jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Thread-Topic: [PATCH v5 1/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Thread-Index: AQJzoKwE+Uq4b0Tg05ZhuaF0VPUdMgKylW5fsEbxU8A=
Date: Thu, 9 May 2024 08:18:06 +0000
Message-ID:
 <PSAPR04MB45987A9E65DE7F1CD08A6C67A5E62@PSAPR04MB4598.apcprd04.prod.outlook.com>
References: <cover.1692623638.git.mail@carsten-spiess.de>
 <d510d6f7f65c95d5cff1b8e8a4dcd5675bd100fd.1692623638.git.mail@carsten-spiess.de>
In-Reply-To:
 <d510d6f7f65c95d5cff1b8e8a4dcd5675bd100fd.1692623638.git.mail@carsten-spiess.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR04MB4598:EE_|TYZPR04MB8297:EE_
x-ms-office365-filtering-correlation-id: 75cfbaf6-e1c3-4e26-dcbe-08dc70008e18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|7416005|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGRZU0plczhyVkJScjBrMkF3S0kwUThGaXd3bkJITzViNlplLzVweUxKeHpu?=
 =?utf-8?B?L0FvU1pQYmxKSFAzUzQ2UGl2WThCRUhsT3VEc1RWbloyQU9aQmN5M0NhTWNt?=
 =?utf-8?B?cnFkZGFYSUt0Rm5oMTg1WW5WRHI1blNwcFZkWm1hM3VmcUZOYUVKczFTMzdC?=
 =?utf-8?B?N0RvY08xS1ZBSzYzcXFzTlRPQlRMT2Rwb1lSVTFFYXBtcmRvMW04L3R2S0x3?=
 =?utf-8?B?R25UQTdEZkNraDRONHRNMmlsSlVIeENablRiQko0ZS96MHNhV1hubXc0S1lW?=
 =?utf-8?B?YVVpVXQvUTJ6Y1V3VCtUUXRwSVU1Ykl4Vy9rLzkvWC9rai9rRzI5T0laME5s?=
 =?utf-8?B?MUx2MEl2NU5FWXdxSGIyTEVvZS8ya0Vkd2FTcmFwbVVGMjhvbDRkb0Uycmww?=
 =?utf-8?B?QWtMeThsWk9GUlAwZmNSeEg4SEsxdGJoZzZQeENpTjlFblo3OU5zYlk1SHIy?=
 =?utf-8?B?TTRYR1hQb1VYM1RLcTNrd0RZSUZsK05BNnRZd0VBeWZza2dpTEpmMkVTWmhi?=
 =?utf-8?B?R3I2UzlUOWdNakQ0cTdWY0s5S2ZVRjZIakdCT2UwVDRhYStwTkRNS0tlY3l0?=
 =?utf-8?B?dlV6NUZuWkFPTndEdVJlU0JJN2VKNmJZWG55dkxlUFRpWlI4T3dwZlBKZmRp?=
 =?utf-8?B?RU1PNml2cUhSS1pJb2lLOWtMbVdkZzBNdWlrcHBnNDJGTWhCOHZIRk8zUzlj?=
 =?utf-8?B?VzJJS1ZQMEtiUzdXQXJIYUFZNForZ1YxdXBhdU1ydWcyTWl2Zjl6V3gyODZI?=
 =?utf-8?B?OVcwUGFyZGdJblROV3Nqc3ZJTXQyTG9hWHZvME5MVGtjcGdJZ2doMmk4bXRO?=
 =?utf-8?B?RVlwUkVDeGUrZHJTSUZGbzZtNXJNNUZWNWltc2NrNGZUdHMraldDSG9aWWxO?=
 =?utf-8?B?d0QvRVVIZ0ZlT0lmZDNkTkxldDQ5RzhlM21QbHhQN0JoSTc2QTQ3cHhrNWNh?=
 =?utf-8?B?VEtBYkl2OVpzZGNnVktkaFFzZHNtRHhxS0x3WnNZbFFPK2VhbWNSTlZ5UTA5?=
 =?utf-8?B?ZWlVYTRQMUtjOXdKYkFqUWtMbUxuWDlocFhGdUtTSG50Zy9oT2F2UE5kTER3?=
 =?utf-8?B?UUFrTUh1aGxuM1R5OU82eDZGUkdVNGxRNjBXSllGV3hjZlc1d2tyQ2djK2Zl?=
 =?utf-8?B?ckVSMWJ1VGJqTUFkcWY2L21GdjVUbGxHUXhwR2s3UjVScWM4c2hyUlN0ZlJP?=
 =?utf-8?B?SzZTVkszRFFxeEpSQll4NFBGbXJWcHJCOWw1cW14Z1paTEdWNEpkREVFcmdW?=
 =?utf-8?B?bHgxS01KN2FrdEwzeVJYajQxUWdZekVXVGRPbzhzakQ0MStYRVVjQ2xmWW56?=
 =?utf-8?B?L2lJdkJaQ3JwMy9nU1ZsVjUva0ZBRXBCazZFdmpGTzRRcUo2bjZKRmZiSDQ0?=
 =?utf-8?B?NitTa0hiSlNzbEtmV0tSdGc4UlZRTWJrSlJ3SUp1aTRJU0piV05WZkdxS1FN?=
 =?utf-8?B?Y1ZzQ2QzTUVTOVUvclVJUExLQ09GNGI5MmYxTTYzQk9FOHRqQnIxcFRIK1V6?=
 =?utf-8?B?ODBJTXI5QngzQkxZR1dhR3dJSVlKTm9qQmh2ZGVzMytYRFBxb0NNa2kxbElZ?=
 =?utf-8?B?UVVBQUJUZ0ZSZVlvSG12MU5XWExXUGh1UmhzOTE1RklFK1R6UndKcXRrVTUw?=
 =?utf-8?B?Sm9JbDZRdjBFT1ZDQ3k0RHZsM0dNV3dSMUxNVE1mbVVycXZGRU1Ydk1veEtR?=
 =?utf-8?B?TFphRUwyckFGVS9ZYm9KL1JyVnJCbExIVmc4MGVqSk1HMjhnSjF0QmNmdUdq?=
 =?utf-8?B?NUJiN0c0Q29xTVE1RDNpZHhWNHphRnVDc3lBYmZuWHRjYkIvcGxhbEo0SmMy?=
 =?utf-8?B?QVhhMEpqdGtwZ2p6SGpUQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR04MB4598.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDFocjFDS2pqV1hnczh6THhCNURBR3RyKyszT3EranMrWml0UWhCWlhHQTJD?=
 =?utf-8?B?eEpDQ3FETXlQN2IxamZuZGZBL0JnL2tXVHhDY2hFcitMVitYam5kbmxmdkFD?=
 =?utf-8?B?K2tldGZCa1UzWUZBVlZXYVNJbStRUVNJQUJYdjVNa0xtclJLTGhIY0RXSWNh?=
 =?utf-8?B?WFFjUjN4a1htSVBNQnE3TmZ6NGtkNXhXZ2VZTU9pL1NVWlhxa3NpaHVYelpY?=
 =?utf-8?B?cnNLUFdVSUkrZG5HbDg2WUIwZnJXcE5jODZXcHdIUEMyYlJMWUhWOGFPOStx?=
 =?utf-8?B?YzFxRy9oM3lrOE51ankxU2hFSE80Z2JUa3lOVzNoWnVWb3dySElrNVRBMFdt?=
 =?utf-8?B?dGxlSTBlbXZ0QlZ1T25CRS81Z0hjemxyak9jVUJuKzFtQWpRYjhHWnYyMldQ?=
 =?utf-8?B?ZEZJMVFtSGtPaisvRVVWZENSWHJ1SitOZlJaQmxLVVZHNEoyWFY0TkVkYnhJ?=
 =?utf-8?B?YnBBazNJSk9hRWY4ZmZJODUzTGlDQXJvYjZYVGszVWxobk44aDVmTXBZUlkz?=
 =?utf-8?B?bFdzdmZwOWpKLzVmL3BBUlVSN3hRckFSaU1FeU90dEhPVUZHTlpXa2FGeW9k?=
 =?utf-8?B?SFc1Y3NxVXVLdEZwa3l1Nm8yOFNSSXRUYW56WDRsaENESnMySXJpMndQUTJq?=
 =?utf-8?B?UFY4U3pEcUFUc2U4QlhDQkJEai91a0RORzRPRnNIejJybUZ5SkVCSzcrUVpS?=
 =?utf-8?B?SHZLNFVUclU5Zlh3U1pRUTJsNGo5QWFIK3pQSkpzclF6dEVtTWR0bUthSkk3?=
 =?utf-8?B?eHVwTUNpck1ENGRueDQzVmxpOEwyUkE2OStaQW9hSllOOVhpNXM1Z0kwRktz?=
 =?utf-8?B?WnBXeUUrMFMrTFFHdVVCQkVmQnA1RkVpdklubWM1NlhHT3hFRUFERldpR0Yr?=
 =?utf-8?B?WkN5cis5Ky9WOEV3RUpGTVU1TUpwMDlDby80eFlib1pWSHI2TExxQm9pR3FT?=
 =?utf-8?B?aWdIZ3lKbjdiWkZ4a0FZcEhjVU9JOFMyRjMrYVYvejVheU9vNHVtaWJHcnJ2?=
 =?utf-8?B?eDh3c21tZUpZcnJwblpqU04zekJ4a25oVitXakpLUUF3V2ZJZGJvYkxVOWRS?=
 =?utf-8?B?RkhMV0tMcm1KYmJYVnRmUktOOGxZWDJFM1BvZnZyWklLbmxsTVM3SEhLQTAr?=
 =?utf-8?B?K01MVE5hWWwwcFdXdGJMSmpscnBZcHJCQ0VkR3BtUWtMMEU5NnNjSkVqN1ZY?=
 =?utf-8?B?dVQ3U2VUSWJJeVBZNU8vcW8yOXI4UkxydzdSRTBUQ05vWDJwVG5LQU1KYzlM?=
 =?utf-8?B?MVpWMlVJU2VRR1RoeWRRZW5ibWJINVZMR3RsSzVmNWRCenJWMWM2TTFpU01O?=
 =?utf-8?B?RlkwMDNIa0ZQYjN4a3Rlay9zM2pCc0VPM0RrcDk5NUNKcVlDRkN0a0VHckNn?=
 =?utf-8?B?WkhZbGowdjBlQW5nOUZWN0JFREQxS3ZaakJBWnc4VzFobDlJaVp5cjVIRkZK?=
 =?utf-8?B?SnJRdzVoNkcyTHhhK1FpSVhKc3hudlpHeWpoNHBUTkVPSlRLWUI4WUZBUk1B?=
 =?utf-8?B?MURGaDFIcE5tRVlmdURWUDBJMjY0K2tZcHgvak5jUHhaU3duUlJYQzZpQWpS?=
 =?utf-8?B?cGgwQXFTVmpRY3lzd0htVXFZMUFTdVBzRndDcWFXUkNyNFpVMFc1NGR0ZEZh?=
 =?utf-8?B?b3FaMXZaZHN3Wm82UkVjWEJXSnF3NlFrUG4wVk9kOW5yakg0M2hWL3o3MXBH?=
 =?utf-8?B?M3VWYzlSa2EySzMrNFJLTkNOTXNFbSsrSHlqV1JwSGxBejZKQUFSeU5LRCtw?=
 =?utf-8?B?K2NyL01kRzFObjdINmNpbEZiWWpMN0Fab1Zodjd3TlZoVUtWa3hSbWs3bmdC?=
 =?utf-8?B?ZDgwbStkR0V0UW1ObFFEUjZOYURuNHJDUCtmbEVsTGRJMFZ6N3RwQ1ppNXF4?=
 =?utf-8?B?T0QvSDYyL3BlV3A0WFNlMHBwT3BJMjd2d3lFaWYxaWgyUXFEWjhXYkhEbnIw?=
 =?utf-8?B?aXVOSnNuTE1hcjVpSmlSQlEwQWpUNkc2K0FMOGNOTFpxK01uMnFIYWkzMEJR?=
 =?utf-8?B?eUJKYktVL1ZISm0yYUtrYUZ4cXBYaXlnUDZhNkRsSE9nZzFXVmdzc2tmTUZ1?=
 =?utf-8?B?RFlrVjFPZVhhSG9NVjZwRDNyN0RMaUI1SzA0ayt0OWoraWsvRkIwVWpyL2lL?=
 =?utf-8?B?NGtBR211Q0h1OTZEQ1NPL09BV3lCL0tqL0trelRzc0hvK0MyaWdEazhkbUtu?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4598.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cfbaf6-e1c3-4e26-dcbe-08dc70008e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 08:18:06.5607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c0p81DH29wKSbUKH5An7cywqi3hBiLXZbdkfZj62mDk2o+uvu0ZYplGRYABIkpCAwcX8by8GDvR2EfO8KVpE+Hf6I9WwJo+TypinfxgAr9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8297

PiBEcml2ZXIgZm9yIFJlbmVzYXMgSVNMMjgwMjIgcG93ZXIgbW9uaXRvciB3aXRoIEkyQyBpbnRl
cmZhY2UuDQo+IFRoZSBkZXZpY2UgbW9uaXRvcnMgdm9sdGFnZSwgY3VycmVudCB2aWEgc2h1bnQg
cmVzaXN0b3IgYW5kIGNhbGN1bGF0ZWQgcG93ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDYXJz
dGVuIFNwaWXDnyA8bWFpbEBjYXJzdGVuLXNwaWVzcy5kZT4NCg0KSGkgQ2Fyc3RlbiwNCg0KV2Ug
YWRkZWQgc3VwcG9ydCBmb3IgcmVhZGluZyBzaHVudCB2b2x0YWdlIGluIG1WIGFuZCByZXZpc2Ug
Y29kZSBieSBzb21lIGNvbW1lbnQgZnJvbSBtYWludGFpbmVyLg0KV291bGQgeW91IG1pZ2h0IHRh
a2UgYSBsb29rIGludG8gaXQgYW5kIGFwcGx5IHRvIHRoZSBwYXRjaCBzZXQ/IFRoYW5rIHlvdS4N
Cg0KQmVzdCBSZWdhcmRzLA0KRGVscGhpbmUgQ0MgQ2hpdQ0KLS0tDQogZHJpdmVycy9od21vbi9p
c2wyODAyMi5jIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vaXNsMjgwMjIuYyBiL2RyaXZlcnMvaHdtb24vaXNsMjgw
MjIuYw0KaW5kZXggZjA0OTRjM2JkNDgzLi5jNWJjZWZjOTYyNTYgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2h3bW9uL2lzbDI4MDIyLmMNCisrKyBiL2RyaXZlcnMvaHdtb24vaXNsMjgwMjIuYw0KQEAg
LTg1LDggKzg1LDYgQEAgc3RydWN0IGlzbDI4MDIyX2RhdGEgew0KICAgICAgICB1MzIgICAgICAg
ICAgICAgICAgICAgICBzaHVudDsNCiAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgZ2Fp
bjsNCiAgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgYXZlcmFnZTsNCi0gICAgICAgdTE2
ICAgICAgICAgICAgICAgICAgICAgY29uZmlnOw0KLSAgICAgICB1MTYgICAgICAgICAgICAgICAg
ICAgICBjYWxpYjsNCiB9Ow0KDQogc3RhdGljIGludCBpc2wyODAyMl9yZWFkKHN0cnVjdCBkZXZp
Y2UgKmRldiwgZW51bSBod21vbl9zZW5zb3JfdHlwZXMgdHlwZSwNCkBAIC05NSwyMCArOTMsNjEg
QEAgc3RhdGljIGludCBpc2wyODAyMl9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgZW51bSBod21v
bl9zZW5zb3JfdHlwZXMgdHlwZSwNCiAgICAgICAgc3RydWN0IGlzbDI4MDIyX2RhdGEgKmRhdGEg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiAgICAgICAgdW5zaWduZWQgaW50IHJlZ3ZhbDsNCiAg
ICAgICAgaW50IGVycjsNCisgICAgICAgdTE2IHNpZ25fYml0Ow0KDQogICAgICAgIHN3aXRjaCAo
dHlwZSkgew0KICAgICAgICBjYXNlIGh3bW9uX2luOg0KLSAgICAgICAgICAgICAgIHN3aXRjaCAo
YXR0cikgew0KLSAgICAgICAgICAgICAgIGNhc2UgaHdtb25faW5faW5wdXQ6DQotICAgICAgICAg
ICAgICAgICAgICAgICBlcnIgPSByZWdtYXBfcmVhZChkYXRhLT5yZWdtYXAsDQotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJU0wyODAyMl9SRUdfQlVTLCAmcmVndmFs
KTsNCi0gICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIgPCAwKQ0KLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KLSAgICAgICAgICAgICAgICAgICAgICAgLyog
ZHJpdmVyIHN1cHBvcnRzIG9ubHkgNjBWIG1vZGUgKEJSTkcgMTEpICovDQotICAgICAgICAgICAg
ICAgICAgICAgICAqdmFsID0gKGxvbmcpKCgodTE2KXJlZ3ZhbCkgJiAweEZGRkMpOw0KKyAgICAg
ICAgICAgICAgIHN3aXRjaCAoY2hhbm5lbCkgew0KKyAgICAgICAgICAgICAgIGNhc2UgMDoNCisg
ICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAoYXR0cikgew0KKyAgICAgICAgICAgICAgICAg
ICAgICAgY2FzZSBod21vbl9pbl9pbnB1dDoNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZXJyID0gcmVnbWFwX3JlYWQoZGF0YS0+cmVnbWFwLA0KKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSVNMMjgwMjJfUkVHX0JVUywgJnJlZ3ZhbCk7DQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIgPCAwKQ0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7DQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIGRyaXZlciBzdXBwb3J0cyBvbmx5IDYwViBtb2RlIChCUk5HIDEx
KSAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqdmFsID0gKGxvbmcpKCgodTE2
KXJlZ3ZhbCkgJiAweEZGRkMpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsNCisgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCisgICAgICAgICAgICAgICAgICAgICAg
IH0NCisgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgICAgICAgIGNhc2Ug
MToNCisgICAgICAgICAgICAgICAgICAgICAgIHN3aXRjaCAoYXR0cikgew0KKyAgICAgICAgICAg
ICAgICAgICAgICAgY2FzZSBod21vbl9pbl9pbnB1dDoNCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZXJyID0gcmVnbWFwX3JlYWQoZGF0YS0+cmVnbWFwLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVNMMjgwMjJfUkVHX1NIVU5ULCAmcmVn
dmFsKTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVyciA8IDApDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3dpdGNoIChkYXRhLT5nYWluKSB7DQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNhc2UgODoNCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaWduX2JpdCA9IChyZWd2YWwgPj4gMTUpICYgMHgwMTsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqdmFsID0gKGxvbmcpKCgoKHUxNilyZWd2
YWwpICYgMHg3RkZGKSAtDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChzaWduX2JpdCAqIDMyNzY4KSkgLyAxMDA7DQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNhc2UgNDoNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaWduX2Jp
dCA9IChyZWd2YWwgPj4gMTQpICYgMHgwMTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqdmFsID0gKGxvbmcpKCgoKHUxNilyZWd2YWwpICYgMHgzRkZGKSAtDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzaWduX2JpdCAqIDE2
Mzg0KSkgLyAxMDA7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgMjoNCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaWduX2JpdCA9IChyZWd2YWwgPj4gMTMpICYg
MHgwMTsNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqdmFsID0gKGxv
bmcpKCgoKHUxNilyZWd2YWwpICYgMHgxRkZGKSAtDQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChzaWduX2JpdCAqIDgxOTIpKSAvIDEwMDsNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2FzZSAxOg0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpZ25fYml0ID0gKHJlZ3ZhbCA+PiAxMikgJiAweDAxOw0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICp2YWwgPSAobG9uZykoKCgodTE2KXJlZ3ZhbCkgJiAw
eDBGRkYpIC0NCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KHNpZ25fYml0ICogNDA5NikpIC8gMTAwOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9DQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KKyAgICAgICAgICAgICAgICAgICAg
ICAgZGVmYXVsdDoNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOw0KKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7DQogICAgICAgICAgICAgICAgZGVmYXVsdDoNCi0gICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOw0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICBicmVhazsNCiAgICAg
ICAgY2FzZSBod21vbl9jdXJyOg0KQEAgLTEyMiw3ICsxNjEsNyBAQCBzdGF0aWMgaW50IGlzbDI4
MDIyX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LCBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBl
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAobG9uZylkYXRhLT5zaHVudDsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KICAgICAgICAgICAgICAgIGRlZmF1bHQ6DQot
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCisgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAg
ICAgICAgYnJlYWs7DQogICAgICAgIGNhc2UgaHdtb25fcG93ZXI6DQpAQCAtMTM2LDExICsxNzUs
MTEgQEAgc3RhdGljIGludCBpc2wyODAyMl9yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgZW51bSBo
d21vbl9zZW5zb3JfdHlwZXMgdHlwZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KGxvbmcpZGF0YS0+c2h1bnQpICogKGxvbmcpcmVndmFsOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7DQogICAgICAgICAgICAgICAgZGVmYXVsdDoNCi0gICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOw0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgICAgICBicmVhazsNCiAgICAg
ICAgZGVmYXVsdDoNCi0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCisgICAgICAgICAg
ICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQogICAgICAgIH0NCg0KICAgICAgICByZXR1cm4gMDsN
CkBAIC0xODIsNyArMjIxLDggQEAgc3RhdGljIHVtb2RlX3QgaXNsMjgwMjJfaXNfdmlzaWJsZShj
b25zdCB2b2lkICpkYXRhLCBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXANCg0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaHdtb25fY2hhbm5lbF9pbmZvICppc2wyODAyMl9pbmZvW10gPSB7DQogICAg
ICAgIEhXTU9OX0NIQU5ORUxfSU5GTyhpbiwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgIEhX
TU9OX0lfSU5QVVQpLCAgICAgIC8qIGNoYW5uZWwgMDogYnVzIHZvbHRhZ2UgKG1WKSAqLw0KKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgSFdNT05fSV9JTlBVVCwgICAgICAgLyogY2hhbm5lbCAw
OiBidXMgdm9sdGFnZSAobVYpICovDQorICAgICAgICAgICAgICAgICAgICAgICAgICBIV01PTl9J
X0lOUFVUKSwgICAgICAvKiBjaGFubmVsIDE6IHNodW50IHZvbHRhZ2UgKG1WKSAqLw0KICAgICAg
ICBIV01PTl9DSEFOTkVMX0lORk8oY3VyciwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIEhX
TU9OX0NfSU5QVVQpLCAgICAgIC8qIGNoYW5uZWwgMTogY3VycmVudCAobUEpICovDQogICAgICAg
IEhXTU9OX0NIQU5ORUxfSU5GTyhwb3dlciwNCkBAIC0zNjgsMjQgKzQwOCwyMiBAQCBzdGF0aWMg
aW50IGlzbDI4MDIyX3JlYWRfcHJvcGVydGllcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBp
c2wyODAyMl9kYXRhICpkYQ0KIHN0YXRpYyBpbnQgaXNsMjgwMjJfY29uZmlnKHN0cnVjdCBpc2wy
ODAyMl9kYXRhICpkYXRhKQ0KIHsNCiAgICAgICAgaW50IGVycjsNCisgICAgICAgdTE2IGNvbmZp
ZzsNCisgICAgICAgdTE2IGNhbGliOw0KDQotICAgICAgIGRhdGEtPmNvbmZpZyA9IChJU0wyODAy
Ml9NT0RFX0NPTlRfU0IgPDwgSVNMMjgwMjJfTU9ERV9TSElGVCkgfA0KKyAgICAgICBjb25maWcg
PSAoSVNMMjgwMjJfTU9ERV9DT05UX1NCIDw8IElTTDI4MDIyX01PREVfU0hJRlQpIHwNCiAgICAg
ICAgICAgICAgICAgICAgICAgIChJU0wyODAyMl9CUk5HXzYwIDw8IElTTDI4MDIyX0JSTkdfU0hJ
RlQpIHwNCiAgICAgICAgICAgICAgICAgICAgICAgIChfX2ZmcyhkYXRhLT5nYWluKSA8PCBJU0wy
ODAyMl9QR19TSElGVCkgfA0KICAgICAgICAgICAgICAgICAgICAgICAgKChJU0wyODAyMl9BRENf
MTVfMSArIF9fZmZzKGRhdGEtPmF2ZXJhZ2UpKSA8PCBJU0wyODAyMl9TQURDX1NISUZUKSB8DQog
ICAgICAgICAgICAgICAgICAgICAgICAoKElTTDI4MDIyX0FEQ18xNV8xICsgX19mZnMoZGF0YS0+
YXZlcmFnZSkpIDw8IElTTDI4MDIyX0JBRENfU0hJRlQpOw0KDQotICAgICAgIGRhdGEtPmNhbGli
ID0gZGF0YS0+c2h1bnQgPyAweDgwMDAgLyBkYXRhLT5nYWluIDogMDsNCisgICAgICAgY2FsaWIg
PSBkYXRhLT5zaHVudCA/IDB4ODAwMCAvIGRhdGEtPmdhaW4gOiAwOw0KDQotICAgICAgIGVyciA9
IHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsIElTTDI4MDIyX1JFR19DT05GSUcsIGRhdGEtPmNv
bmZpZyk7DQorICAgICAgIGVyciA9IHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsIElTTDI4MDIy
X1JFR19DT05GSUcsIGNvbmZpZyk7DQogICAgICAgIGlmIChlcnIgPCAwKQ0KICAgICAgICAgICAg
ICAgIHJldHVybiBlcnI7DQoNCi0gICAgICAgZXJyID0gcmVnbWFwX3dyaXRlKGRhdGEtPnJlZ21h
cCwgSVNMMjgwMjJfUkVHX0NBTElCLCBkYXRhLT5jYWxpYik7DQotICAgICAgIGlmIChlcnIgPCAw
KQ0KLSAgICAgICAgICAgICAgIHJldHVybiBlcnI7DQotDQotICAgICAgIHJldHVybiAwOw0KKyAg
ICAgICByZXR1cm4gcmVnbWFwX3dyaXRlKGRhdGEtPnJlZ21hcCwgSVNMMjgwMjJfUkVHX0NBTElC
LCBjYWxpYik7Ow0KIH0NCg0KIHN0YXRpYyBpbnQgaXNsMjgwMjJfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkNCkBAIC00MTgsNyArNDU2LDcgQEAgc3RhdGljIGludCBpc2wyODAyMl9w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KDQogICAgICAgIGlzbDI4MDIyX2RlYnVn
ZnNfaW5pdChjbGllbnQsIGRhdGEpOw0KDQotICAgICAgIGh3bW9uX2RldiA9IGRldm1faHdtb25f
ZGV2aWNlX3JlZ2lzdGVyX3dpdGhfaW5mbyhkZXYsICJpc2wyODAyMl9od21vbiIsDQorICAgICAg
IGh3bW9uX2RldiA9IGRldm1faHdtb25fZGV2aWNlX3JlZ2lzdGVyX3dpdGhfaW5mbyhkZXYsIGNs
aWVudC0+bmFtZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGRhdGEsICZpc2wyODAyMl9jaGlwX2luZm8sIE5VTEwpOw0KICAgICAgICBp
ZiAoSVNfRVJSKGh3bW9uX2RldikpDQogICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaHdt
b25fZGV2KTsNCkBAIC00MzgsNyArNDc2LDcgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGlz
bDI4MDIyX2RyaXZlciA9IHsNCiAgICAgICAgLmRyaXZlciA9IHsNCiAgICAgICAgICAgICAgICAu
bmFtZSAgID0gImlzbDI4MDIyIiwNCiAgICAgICAgfSwNCi0gICAgICAgLnByb2JlX25ldyAgICAg
ID0gaXNsMjgwMjJfcHJvYmUsDQorICAgICAgIC5wcm9iZSAgPSBpc2wyODAyMl9wcm9iZSwNCiAg
ICAgICAgLmlkX3RhYmxlICAgICAgID0gaXNsMjgwMjJfaWRzLA0KIH07DQoNCi0tDQoyLjI1LjEN
Cg==

