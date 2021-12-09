Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AADB46E1B1
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Dec 2021 05:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhLIEwi (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 8 Dec 2021 23:52:38 -0500
Received: from mail-sgaapc01on2117.outbound.protection.outlook.com ([40.107.215.117]:53889
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229496AbhLIEwg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 8 Dec 2021 23:52:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPpDefJysBZYKSE+f1mgk10WBok1gHXTTJ1pW2kWqpTz7kZ1dhzyu4eUBuyzfFT3oXoNmXGdBwIoRiRu+U7ILiFJ83E2nH1ryWiBVsHrx+UVvO4Qzpev9TtTpUli0EBE8zmNOs1CwRlW68utBx8TdUZTaozN2i3QfmCpUTWbKy5OgpGhS8qsYWX9uwbX+NE8fo2D89vxZGX41MNgFyZ3fd6qb5wJrWfrQl8cgEHYYzFnUKeFfVb+wavq72VSIxvlO4HKL1nQBGuJ/roSsbFnO/KbC/FUBAHv7gjXvR1kG/bJqgoIdd6vhCCOfkV32irftiQo0B/YYzyKj+ec/UbRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoV/hcwqOjvZ43LZROQ/F1RGXxWupY1WsyKyPnYUKCk=;
 b=jSWGy2Yqkr4o8qvZny2JgvfS51j0xIPVZBKTwuE167vHuXNxp8xXROBRR3f8fbQTeZJU3ULNc/jKF1HqXFd8MdNJKI0y63RfdGWLDAdHG5kjP2mOORiyof0TOGm9UJTySaR6gW5OJDKTbaWW36L/1HrB92spO0FYsuVoeDEatKTeGcn/niTXM1H0ikxsAKNqfZv2q020w4jlQ95bp3hCwTmHeA+4QwjMPc1RslCqwmQMsTcmHOrrxyHaTCawMzN/+DYphzbydLjUzRsco6bokjPv1F+MGj4/Pcm1cAqf5j4mNsK9Dc9ikHGMCNWwVpjnkKo7xxpBbD5Am18AkfH7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoV/hcwqOjvZ43LZROQ/F1RGXxWupY1WsyKyPnYUKCk=;
 b=kVB4xxgdofI2NV2U5Prz2qe7MtNuLP7csLdLAPPoB8+I1nSgFpuAAy04qhwePMK37qFLBbXws1jN/aTDIyOmgi+W9PyVvv4edqy6aCSKF0GhSwjroqie4EYPkmxoj9kCT+bnCM+UmsEuZIQnxR5/5Sz8XDDXJgVIBT8GYX5KZGI=
Received: from HKAPR04MB4003.apcprd04.prod.outlook.com (2603:1096:203:df::11)
 by HK2PR04MB3809.apcprd04.prod.outlook.com (2603:1096:202:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 04:48:54 +0000
Received: from HKAPR04MB4003.apcprd04.prod.outlook.com
 ([fe80::50ac:5788:d373:7194]) by HKAPR04MB4003.apcprd04.prod.outlook.com
 ([fe80::50ac:5788:d373:7194%5]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 04:48:54 +0000
From:   =?big5?B?SG93YXJkIENoaXUgKKr0q2G6zSk=?= <Howard.Chiu@quantatw.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     =?big5?B?UG90aW4gTGFpICi/4Kxmp8op?= <Potin.Lai@quantatw.com>
Subject: [PATCH v3] hwmon: (pmbus) Add support for MPS Multi-phase mp5023
Thread-Topic: [PATCH v3] hwmon: (pmbus) Add support for MPS Multi-phase mp5023
Thread-Index: Adfst25QvRVQKJTRROq3BxqAmWFNrg==
Date:   Thu, 9 Dec 2021 04:48:54 +0000
Message-ID: <HKAPR04MB400349AA406694FB976D78D096709@HKAPR04MB4003.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 353a2592-dc92-4f79-6bd6-08d9bacf3437
x-ms-traffictypediagnostic: HK2PR04MB3809:EE_
x-microsoft-antispam-prvs: <HK2PR04MB3809499AFD7181C5424F2AE996709@HK2PR04MB3809.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sH+aRiT9mwIOh9grsOOdi2MCSiaMTRmnV2ot3i87MfW+wfJ42FVM7Ov8syMzaHyzGOkmJPTgDNLINE3ahmr7CPltmK6Azl9kJFJUh8JjmraKOjs8mOJ0lVuAXhY3uCrsBGXkM5cMZSu1dlVeNBxdrfayHAG5WiHFCSPk0HDkDQh8ER2rgt9+BOut0ahRhXIiXVs65ZrVZUUNxXPZEPXkVwKm6N6rvda/yjRP+Mv7tGO3vt/fNjyL3TByRpTToAVvJi7+XaH2/64wpR+CKNsjESK73tnySlzZggkLK1BHzWCJAjOjXJg69BcQvT5Pk1o6aMpREwHdDfKzsXR/iEQXWx0jRTbxpDNro9vUVONogSj+SDgWPtOdAprXf+/wMsW6zqeoyzCDpTUa650LacOKVFYvx2LzFzf3i0FkprT5ZxjOVPesCL86WXFnuG9FHZGK1lxhkHBxmJj8n6D25Dp7EnmVXCksty0glmO+gQhpenq76Ystv87IULuHjqnBFYGfm0ef90zl4s7EZnV5EY+4XCOiS56mcMK0N+JEWpYjOnodXZAwbtmQ3GOgaPvsYQvqVW2IbvPAO1gt7gMvN5YPTtZSmMXVTmpzuLd3NSfwQZ7mufTRSsaBzrSH8CPmXmeYup73DIZqnZwAcenwr9R9mn+T31d3yLBT3pztM06hWJQFv95JTzLf/eaimandvzsHQEpLGJQCYEUpbWOjmP8fhkdhLETc/EY+Qew9AymdYC0zyjSgemicCbmK40Po60kre1dUggfq3a5mw1Cw53ASD/nCWss3Nz6GfHgocOtyAa4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HKAPR04MB4003.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(66556008)(316002)(66476007)(64756008)(66946007)(66446008)(55016003)(9686003)(508600001)(76116006)(186003)(8936002)(966005)(85182001)(83380400001)(71200400001)(38100700002)(5660300002)(122000001)(33656002)(2906002)(26005)(86362001)(52536014)(7696005)(6506007)(38070700005)(4326008)(8676002)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?YmhHaXhycUxPQS9SRE1FZC9jSVg1VWsvVXdZV2sxM2dnbGlxR3NOdEp3Z2pZRDN2?=
 =?big5?B?NFA3NnpaUmZzRXZBdm5jUEM4RUdCQk9scURlQTVHRVpqVGhHS0JaOUFxWWNrSFJP?=
 =?big5?B?NnVmWVNTSHV1WjBsZGNvdmpGU2xFYjB3NHVxR25ia0gwZzhuMUR6OUxzeTdyMm0z?=
 =?big5?B?VGJWK21ndjFQcXl4NkpMVWs3M2xqQS95MzVjZTBiNDN3MW5ZMlRGT3NFdTFTMS9q?=
 =?big5?B?cDNPcjMxT1Z2T0ZCZG5zTG11V3ZDMXlwU24ySncvODFMTGc0K0hyVlI0czlTY1JP?=
 =?big5?B?YTVIMUJpdkVUa012eEpMZnJCeWlhQVlBdXhOa0ZHc2pMR1QwdG1rY0hJNzlBdEI0?=
 =?big5?B?b3Q3ZW8vRVNPTElWMThFcDVXbURPV1ZHK093MnN6RUlhYksySFl6a0RqL2ljTVdR?=
 =?big5?B?NlZvTE9jbmUrRXZSaFBHWDIxZkxyaGhRKy8vbEFab1FneUY3OVFRbUxucSt4Yk9T?=
 =?big5?B?N0N1V04rVWRVSHJJWjE1TGcwakZYb2p0aHNuK2RZcTIzWnJyTVZoQ0lyY1UrZVpv?=
 =?big5?B?Y0VQYzNzM2hWVEV6ZGxrRjVzZ3FrSWhhZ3ZyemRoMmt1Zk10UEx3Rnpic3ZHTk0z?=
 =?big5?B?STNkSGVxbEpaR3E4QW1pQjFra3dCTHZ3NjFxTFFGNHBTaFVzelpPaFd3S1o5SElB?=
 =?big5?B?QXMxZHpRZ2FYVUEvSzF1RWlqU2p6SXdoZWZ6bnJkOTBJM0dPRmhWTXlULzg4VGxr?=
 =?big5?B?SHVoUHZNMjRvRnlib243SnVRazByZnVRS3BKL1VXaXNzYXMvOVA5WkJHUWNxcm9D?=
 =?big5?B?cmtkaHRSMDRYWHdhUm1LOUsxYjVva045d0lTeStPdTB6RzNpejY5Wm44TmNwd0F1?=
 =?big5?B?U0htdzM5VWFYTllnQ3JFbldINjlRMTdhUngxeElCSTJwT0pHUGhSWWR4T2I1NzVQ?=
 =?big5?B?cnRneTNBZExRTStVMmdlQVA0YUI5cnVkUVd0S0QzY1BVcENmWEtFNGhwR0pyT0Qw?=
 =?big5?B?bGRSbVF2SEhNbGhGeWlqSE5NNXRielgyTTZaSzJRYy9rSjBUMENYU3lwajZ6Y3l1?=
 =?big5?B?aXh4VmlQMndpWTUvMy9PV3ViblM5U1ZMQWc0eFQ4U0dtWlpIR2pSVlZlczRsS2pN?=
 =?big5?B?N0xjRTAzaEZkRk0vOHdiWEhaanhsbkFPMHg0UmlmeGhrMmdHNllMNkYrV1B5endm?=
 =?big5?B?dUs4V25JN1I5NlhHenZaeFM0RjdlOExsUENKdUJuM01ieVVkOXNldXhGamRndFV6?=
 =?big5?B?TW9meklIM0F6azV4c0k5YWdTakNsazV0UkRQTXZ6djZRLy9tbU5FUFhiYi8zQ2JO?=
 =?big5?B?REZnRHZIZ2JIQlJqL3paWEl2bmUvRDdNR2tpMXpzdkZHdndVT0JvTHQzYk1lUjlj?=
 =?big5?B?UTRlQXhPRms2U2p6c2lJK0hNNUxxaDJvbmg3d3BEcWdkOVZOZDdick9lanF4YS9z?=
 =?big5?B?eEtsa3VsQnVpcnZWTldwMFc0cTc1ZmljT20vTU01TEE0UE5qYlVidU4yU000V2NQ?=
 =?big5?B?dTZ5M2dpTUZNalcvbWJ5Q2VFVVRmQ0NDeVQwTzFBT1BtY2pHZWJnVk4rU0h5dWdZ?=
 =?big5?B?MHEzUWNicCs4QytFcHhkRmpZQ0krVmlycnNHRHp4Ky9admFMaVBLdUZYUzJOVHAv?=
 =?big5?B?bUdmalZQVUVmbmw4VFVlSUZMc0dRdkhhNTZvUlMyZEFJZVNSbm41NW5uY0dUTVdJ?=
 =?big5?B?anFha3FxalZBOGxMV0xCc3gwQVdvYTlxL0p3amhReWRMdzU1djlLdysxbC9YWXU1?=
 =?big5?B?bnFwdDNiSjFzN05ZRGFpd1NhZ1h3eWM3U3VjSElINitKa3ZLa1dnbGNMYnR6bk9M?=
 =?big5?B?S3hSbFk2b0ZHUEtNVldjQ2NtVEtGWUhjYnB4UkgreDhjeEk3OGc2SjJaSlQ4Ym5n?=
 =?big5?B?akdFK2FCR0hkVXBWa0V4Tkh0K2JvM043R1UreHJkcld4eVNOdXNQbFdiR1dHQUFF?=
 =?big5?B?eCtFTUxPbG16anEyTUhwSi9MaWp0ZysxRldQVEVrdCtIOVY2SlJXanp1MTZJdzF6?=
 =?big5?B?eGNvTnZ0OTJORitoam5qNXJkSDNveVIyMitHdm52bVl0REZobTZjVHpvcGVpUWd6?=
 =?big5?B?VVZjUjZQejlvdEhvR1lnZVpmMkU4aUdlRC8zSnNScGdTTEg0dm9QY3pDRHFZL1JH?=
 =?big5?B?ZzFsT2o4ZFNmY05JMFI0MjNZcU5RZXZ0UEpMbDVpK2hISzM0YWRLVWhkdVZMTHI4?=
 =?big5?B?a2cyanhBPT0=?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HKAPR04MB4003.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353a2592-dc92-4f79-6bd6-08d9bacf3437
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 04:48:54.5586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WciEFYdX8hTN7hPTsHfV9M1UGfcwwu3Ooy7KSQ9vS8mUlOGKWqPQoMOBqBgKZBc3pC8ogZ1rI0b6bGWm1ZVa0SiSIXhOmHGZzL7bi2S5bxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3809
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

QWRkIHN1cHBvcnQgZm9yIG1wNTAyMyBkZXZpY2UgZnJvbSBNb25vbGl0aGljIFBvd2VyIFN5c3Rl
bXMsIEluYy4gKE1QUykNCnZlbmRvci4gVGhpcyBpcyBhIEhvdC1Td2FwIENvbnRyb2xsZXIuDQoN
ClNpZ25lZC1vZmYtYnk6IEhvd2FyZCBDaGl1IDxob3dhcmQuY2hpdUBxdWFudGF0dy5jb20+DQot
LS0NCkNoYW5nZSBzaW5jZSB2MjoNCi0gRml4ZWQgcGF0Y2ggY29udGVudCBvdmVyd3JpdHRlbiBi
eSBtYWlsIHNlcnZlcg0KDQpDaGFuZ2Ugc2luY2UgdjE6DQotIG1wNTAyMy5jDQogIC0gU29ydCBo
ZWFkZXJzDQotIG1wNTAyMy5yc3QNCiAgLSBBZGQgZGF0YXNoZWV0IGluZm9ybWF0aW9uDQogIC0g
Q29ycmVjdCBzZW50ZW5jZXMNCg0KIERvY3VtZW50YXRpb24vaHdtb24vbXA1MDIzLnJzdCB8IDg0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiBkcml2ZXJzL2h3bW9uL3BtYnVz
L0tjb25maWcgICAgfCAgOSArKysrDQogZHJpdmVycy9od21vbi9wbWJ1cy9NYWtlZmlsZSAgIHwg
IDEgKw0KIGRyaXZlcnMvaHdtb24vcG1idXMvbXA1MDIzLmMgICB8IDY2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrDQogNCBmaWxlcyBjaGFuZ2VkLCAxNjAgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2h3bW9uL21wNTAyMy5yc3QNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9od21vbi9wbWJ1cy9tcDUwMjMuYw0KDQpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9od21vbi9tcDUwMjMucnN0IGIvRG9jdW1lbnRhdGlvbi9od21vbi9tcDUwMjMu
cnN0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5hZjVhYjEzNDVh
OTENCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vaHdtb24vbXA1MDIzLnJzdA0K
QEAgLTAsMCArMSw4NCBAQA0KKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQor
DQorS2VybmVsIGRyaXZlciBtcDUwMjMNCis9PT09PT09PT09PT09PT09PT09PQ0KKw0KK1N1cHBv
cnRlZCBjaGlwczoNCisNCisgICogTVBTIE1QNTAyMw0KKw0KKyAgICBQcmVmaXg6ICdtcDUwMjMn
DQorDQorICAqIERhdGFzaGVldA0KKw0KKyAgICBQdWJsaWNseSBhdmFpbGFibGUgYXQgdGhlIE1Q
UyB3ZWJzaXRlIDogaHR0cHM6Ly93d3cubW9ub2xpdGhpY3Bvd2VyLmNvbS9lbi9tcDUwMjMuaHRt
bA0KKw0KK0F1dGhvcjoNCisNCisJSG93YXJkIENoaXUgPGhvd2FyZC5jaGl1QHF1YW50YXR3LmNv
bT4NCisNCitEZXNjcmlwdGlvbg0KKy0tLS0tLS0tLS0tDQorDQorVGhpcyBkcml2ZXIgaW1wbGVt
ZW50cyBzdXBwb3J0IGZvciBNb25vbGl0aGljIFBvd2VyIFN5c3RlbXMsIEluYy4gKE1QUykNCitN
UDUwMjMgSG90LVN3YXAgQ29udHJvbGxlci4NCisNCitEZXZpY2UgY29tcGxhaW50IHdpdGg6DQor
DQorLSBQTUJ1cyByZXYgMS4zIGludGVyZmFjZS4NCisNCitEZXZpY2Ugc3VwcG9ydHMgZGlyZWN0
IGZvcm1hdCBmb3IgcmVhZGluZyBpbnB1dCB2b2x0YWdlLCBvdXRwdXQgdm9sdGFnZSwNCitvdXRw
dXQgY3VycmVudCwgaW5wdXQgcG93ZXIgYW5kIHRlbXBlcmF0dXJlLg0KKw0KK1RoZSBkcml2ZXIg
ZXhwb3J0cyB0aGUgZm9sbG93aW5nIGF0dHJpYnV0ZXMgdmlhIHRoZSAnc3lzZnMnIGZpbGVzDQor
Zm9yIGlucHV0IHZvbHRhZ2U6DQorDQorKippbjFfaW5wdXQqKg0KKw0KKyoqaW4xX2xhYmVsKioN
CisNCisqKmluMV9tYXgqKg0KKw0KKyoqaW4xX21heF9hbGFybSoqDQorDQorKippbjFfbWluKioN
CisNCisqKmluMV9taW5fYWxhcm0qKg0KKw0KK1RoZSBkcml2ZXIgcHJvdmlkZXMgdGhlIGZvbGxv
d2luZyBhdHRyaWJ1dGVzIGZvciBvdXRwdXQgdm9sdGFnZToNCisNCisqKmluMl9pbnB1dCoqDQor
DQorKippbjJfbGFiZWwqKg0KKw0KKyoqaW4yX2FsYXJtKioNCisNCitUaGUgZHJpdmVyIHByb3Zp
ZGVzIHRoZSBmb2xsb3dpbmcgYXR0cmlidXRlcyBmb3Igb3V0cHV0IGN1cnJlbnQ6DQorDQorKipj
dXJyMV9pbnB1dCoqDQorDQorKipjdXJyMV9sYWJlbCoqDQorDQorKipjdXJyMV9hbGFybSoqDQor
DQorKipjdXJyMV9tYXgqKg0KKw0KK1RoZSBkcml2ZXIgcHJvdmlkZXMgdGhlIGZvbGxvd2luZyBh
dHRyaWJ1dGVzIGZvciBpbnB1dCBwb3dlcjoNCisNCisqKnBvd2VyMV9pbnB1dCoqDQorDQorKipw
b3dlcjFfbGFiZWwqKg0KKw0KKyoqcG93ZXIxX2FsYXJtKioNCisNCitUaGUgZHJpdmVyIHByb3Zp
ZGVzIHRoZSBmb2xsb3dpbmcgYXR0cmlidXRlcyBmb3IgdGVtcGVyYXR1cmU6DQorDQorKip0ZW1w
MV9pbnB1dCoqDQorDQorKip0ZW1wMV9tYXgqKg0KKw0KKyoqdGVtcDFfbWF4X2FsYXJtKioNCisN
CisqKnRlbXAxX2NyaXQqKg0KKw0KKyoqdGVtcDFfY3JpdF9hbGFybSoqDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnIGIvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmln
DQppbmRleCBmZmI2MDljZWUzYTQuLmI1NmJkODU0Mjg2NCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
aHdtb24vcG1idXMvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnDQpA
QCAtMjc2LDYgKzI3NiwxNSBAQCBjb25maWcgU0VOU09SU19NUDI5NzUNCiAJICBUaGlzIGRyaXZl
ciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUgd2lsbA0K
IAkgIGJlIGNhbGxlZCBtcDI5NzUuDQogDQorY29uZmlnIFNFTlNPUlNfTVA1MDIzDQorCXRyaXN0
YXRlICJNUFMgTVA1MDIzIg0KKwloZWxwDQorCSAgSWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0
IGhhcmR3YXJlIG1vbml0b3Jpbmcgc3VwcG9ydCBmb3IgTVBTDQorCSAgTVA1MDIzLg0KKw0KKwkg
IFRoaXMgZHJpdmVyIGNhbiBhbHNvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLiBJZiBzbywgdGhlIG1v
ZHVsZSB3aWxsDQorCSAgYmUgY2FsbGVkIG1wNTAyMy4NCisNCiBjb25maWcgU0VOU09SU19QSU00
MzI4DQogCXRyaXN0YXRlICJGbGV4IFBJTTQzMjggYW5kIGNvbXBhdGlibGVzIg0KIAloZWxwDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9NYWtlZmlsZSBiL2RyaXZlcnMvaHdtb24v
cG1idXMvTWFrZWZpbGUNCmluZGV4IDBlZDRkNTk2YTk0OC4uNjFjZGMyNGIxMzA5IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9od21vbi9w
bWJ1cy9NYWtlZmlsZQ0KQEAgLTMxLDYgKzMxLDcgQEAgb2JqLSQoQ09ORklHX1NFTlNPUlNfTUFY
MzQ0NDApCSs9IG1heDM0NDQwLm8NCiBvYmotJChDT05GSUdfU0VOU09SU19NQVg4Njg4KQkrPSBt
YXg4Njg4Lm8NCiBvYmotJChDT05GSUdfU0VOU09SU19NUDI4ODgpCSs9IG1wMjg4OC5vDQogb2Jq
LSQoQ09ORklHX1NFTlNPUlNfTVAyOTc1KQkrPSBtcDI5NzUubw0KK29iai0kKENPTkZJR19TRU5T
T1JTX01QNTAyMykJKz0gbXA1MDIzLm8NCiBvYmotJChDT05GSUdfU0VOU09SU19QTTY3NjRUUikJ
Kz0gcG02NzY0dHIubw0KIG9iai0kKENPTkZJR19TRU5TT1JTX1BYRTE2MTApCSs9IHB4ZTE2MTAu
bw0KIG9iai0kKENPTkZJR19TRU5TT1JTX1E1NFNKMTA4QTIpCSs9IHE1NHNqMTA4YTIubw0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvbXA1MDIzLmMgYi9kcml2ZXJzL2h3bW9uL3Bt
YnVzL21wNTAyMy5jDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi4x
NGQzOTM0YWEwOTkNCi0tLSAvZGV2L251bGwNCisrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvbXA1
MDIzLmMNCkBAIC0wLDAgKzEsNjYgQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlcg0KKy8qDQorICogRHJpdmVyIGZvciBNUFMgTVA1MDIzIEhvdC1Td2FwIENv
bnRyb2xsZXINCisgKi8NCisNCisjaW5jbHVkZSA8bGludXgvaTJjLmg+DQorI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPg0KKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCisjaW5jbHVkZSAi
cG1idXMuaCINCisNCitzdGF0aWMgc3RydWN0IHBtYnVzX2RyaXZlcl9pbmZvIG1wNTAyM19pbmZv
ID0gew0KKwkucGFnZXMgPSAxLA0KKw0KKwkuZm9ybWF0W1BTQ19WT0xUQUdFX0lOXSA9IGRpcmVj
dCwNCisJLmZvcm1hdFtQU0NfVk9MVEFHRV9PVVRdID0gZGlyZWN0LA0KKwkuZm9ybWF0W1BTQ19D
VVJSRU5UX09VVF0gPSBkaXJlY3QsDQorCS5mb3JtYXRbUFNDX1BPV0VSXSA9IGRpcmVjdCwNCisJ
LmZvcm1hdFtQU0NfVEVNUEVSQVRVUkVdID0gZGlyZWN0LA0KKw0KKwkubVtQU0NfVk9MVEFHRV9J
Tl0gPSAzMiwNCisJLmJbUFNDX1ZPTFRBR0VfSU5dID0gMCwNCisJLlJbUFNDX1ZPTFRBR0VfSU5d
ID0gMCwNCisJLm1bUFNDX1ZPTFRBR0VfT1VUXSA9IDMyLA0KKwkuYltQU0NfVk9MVEFHRV9PVVRd
ID0gMCwNCisJLlJbUFNDX1ZPTFRBR0VfT1VUXSA9IDAsDQorCS5tW1BTQ19DVVJSRU5UX09VVF0g
PSAxNiwNCisJLmJbUFNDX0NVUlJFTlRfT1VUXSA9IDAsDQorCS5SW1BTQ19DVVJSRU5UX09VVF0g
PSAwLA0KKwkubVtQU0NfUE9XRVJdID0gMSwNCisJLmJbUFNDX1BPV0VSXSA9IDAsDQorCS5SW1BT
Q19QT1dFUl0gPSAwLA0KKwkubVtQU0NfVEVNUEVSQVRVUkVdID0gMiwNCisJLmJbUFNDX1RFTVBF
UkFUVVJFXSA9IDAsDQorCS5SW1BTQ19URU1QRVJBVFVSRV0gPSAwLA0KKw0KKwkuZnVuY1swXSA9
DQorCQlQTUJVU19IQVZFX1ZJTiB8IFBNQlVTX0hBVkVfVk9VVCB8IFBNQlVTX0hBVkVfUElOIHwN
CisJCVBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfSU9VVCB8DQorCQlQTUJVU19IQVZFX1NU
QVRVU19JTlBVVCB8IFBNQlVTX0hBVkVfU1RBVFVTX1RFTVAsDQorfTsNCisNCitzdGF0aWMgaW50
IG1wNTAyM19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KK3sNCisJcmV0dXJuIHBt
YnVzX2RvX3Byb2JlKGNsaWVudCwgJm1wNTAyM19pbmZvKTsNCit9DQorDQorc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgX19tYXliZV91bnVzZWQgbXA1MDIzX29mX21hdGNoW10gPSB7
DQorCXsgLmNvbXBhdGlibGUgPSAibXBzLG1wNTAyMyIsIH0sDQorCXt9DQorfTsNCisNCitNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBtcDUwMjNfb2ZfbWF0Y2gpOw0KKw0KK3N0YXRpYyBzdHJ1Y3Qg
aTJjX2RyaXZlciBtcDUwMjNfZHJpdmVyID0gew0KKwkuZHJpdmVyID0gew0KKwkJICAgLm5hbWUg
PSAibXA1MDIzIiwNCisJCSAgIC5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtcDUwMjNf
b2ZfbWF0Y2gpLA0KKwl9LA0KKwkucHJvYmVfbmV3ID0gbXA1MDIzX3Byb2JlLA0KK307DQorDQor
bW9kdWxlX2kyY19kcml2ZXIobXA1MDIzX2RyaXZlcik7DQorDQorTU9EVUxFX0FVVEhPUigiSG93
YXJkIENoaXUgPGhvd2FyZC5jaGl1QHF1YW50YXR3LmNvbT4iKTsNCitNT0RVTEVfREVTQ1JJUFRJ
T04oIlBNQnVzIGRyaXZlciBmb3IgTVBTIE1QNTAyMyBIU0MiKTsNCitNT0RVTEVfTElDRU5TRSgi
R1BMIik7DQotLSANCjIuMjUuMQ0KDQo=
