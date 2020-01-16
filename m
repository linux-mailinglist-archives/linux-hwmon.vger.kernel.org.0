Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDAB813FA0C
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Jan 2020 20:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgAPTyR (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 16 Jan 2020 14:54:17 -0500
Received: from mail-vi1eur05on2056.outbound.protection.outlook.com ([40.107.21.56]:6073
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729259AbgAPTyQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 16 Jan 2020 14:54:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ab25HywJ6tjN+/Hdffc7Z5jXWZJRUwZui5s79emqbmSyY6Vpsi3TAmn3/lJHDonDQSAV9EIizHnB3Y1QzSnyrCR0es2IBBY0YwCLhN4iNDot6LrtkDnDKsXz9VmOPjYxH5IP9zdksMtRHM/EEi/Cmuu/XIVqkVWWO6qrWFWOF76hC5oB4R+AfoX7dhZic4OcpPgWELcllMc9y4az8KSE31m66KwLSdnTNCckK1tkANql9Spv+9jKTNyFtYR63R0vLpJqRYEy64eUu5WVE9F8q78gMngkzHS6upQt/NFbzCUN2r00uD4v+cSmn5grFuafQc7nteSQeO00nUX8X5xPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRTM+u80W7EgqeZaxYsKP4MSmHILEBA8CmAA0N1Bzsg=;
 b=R98oRBSsaaHBBPV0d0fZKsnNGSettV16jr97BkZsATWh5dRu4yDK3MjrrvUPxh6bcTbHnjIvg8QXytlXiOSwoLyOH004XJcMX7qFmwoJt89y+b78OBlJfmJpynPIE448zCA3o6bGxEAnbFmFQbMmng7fmTyK8+FF99PV+zB6vym2w3aksiiT9GK5FKEwH+6x1eLlAUjEqQyHJf6byvkP6GKAj5V3Dsas2pllFuJEqFJ54ffa9YpbqY9Xv1k6sz9WR9a3tSpELnYT/2Qpsu875pFfTX8ElKRYzy0Ay0Q5EI3nznaF/mEhnpXb3M8oQcuMFpQl/SCsk/SIwYioGVO3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRTM+u80W7EgqeZaxYsKP4MSmHILEBA8CmAA0N1Bzsg=;
 b=Xx4ywOnifXuzG+p1Uu3Ij8w6dN+8QZnLRAoDTWHvLMdwt9IH0hO5nI0hQToxJAl7vu623puM5cstGRI1z8/kjpsBi9BqUKLCVngLe8VOw+zGE1YJecjPwzjgO5zIxql94jjP+DnDHcF031uExQRNmw3Qqt9YXK5dFGRD/VgYNFA=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB6551.eurprd05.prod.outlook.com (20.179.5.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Thu, 16 Jan 2020 19:54:11 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::bd4d:e8dc:9b58:3a7c]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::bd4d:e8dc:9b58:3a7c%7]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 19:54:11 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>,
        Ofer Levy <oferl@mellanox.com>
Subject: RE: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Thread-Topic: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Thread-Index: AQHVw7ccUo77+1Sy70mxGafA8mf8l6fcO+2AgAAG1qCAACN3gIAA8BkwgABkGgCAAA3mcIAAWQ8AgAAMj0CAAD4/AIAARClQgABwMwCAAVmVcIAAhSgAgAeQJhCAAJDrAIAApkawgAB9M4CAA4G4QA==
Date:   Thu, 16 Jan 2020 19:54:11 +0000
Message-ID: <AM6PR05MB52246A116E544E7D85DFFD28A2360@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
 <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200108164748.GD28993@roeck-us.net>
 <AM6PR05MB5224026B612B674681E81DF9A2350@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200113205614.GA24228@roeck-us.net>
 <AM6PR05MB522448927DE44812BECAFE74A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <530f290a-37f9-b493-066f-795bea9f8a83@roeck-us.net>
In-Reply-To: <530f290a-37f9-b493-066f-795bea9f8a83@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ad123f15-5230-4069-dd09-08d79abddb42
x-ms-traffictypediagnostic: AM6PR05MB6551:|AM6PR05MB6551:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB65511FBE5D6A39C52E153385A2360@AM6PR05MB6551.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(189003)(199004)(186003)(26005)(7696005)(6506007)(53546011)(2906002)(508600001)(4326008)(76116006)(33656002)(55016002)(9686003)(66476007)(6916009)(5660300002)(66446008)(64756008)(66556008)(66946007)(52536014)(86362001)(71200400001)(8936002)(81166006)(81156014)(8676002)(107886003)(316002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB6551;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GYJkaq+32en++vnMM7cuPfh3JfBWX+FraC3P0iq6LeCG1r++Jt9VvoEE4zxAVK0rP/Dn9LdnvMVjvSvOP19zzYlpW1AjXJGbmsId/g8MpGkOIYyzgUZgJQEf2rzEwd+8q85BXHFJaSjCmOL/rt/7P8U7az62E/9rtC+81jrgIJSfuy5864DgcfLN2bCOT+HNSs43vSaziCNceCEZiadblbuNVvgUytzycUXLZqWMFBSXae81q0K5OoiX7VYc+47wY2PPm2w6KJSz1qkEVxH+gOZTNwldoBVocuWge74rVUEDxyyyFJ6TF/XdQlxcCCU98ulpFZwrPgp0KgTgNnhZ44abYJDnI1aPW/1ipFEgPzppGsrSITExB0sIakxNRX9LQbQWsrg3+X3Cg0reMGpvEbNWljnN7EPfkXbg2FnlasPOMlO3rsWJwEUwdae/oFRm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad123f15-5230-4069-dd09-08d79abddb42
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 19:54:11.3073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cHkFVF/IsZfwDHOLyDXGTkoL0FAJqzFNvsKKJ73Ogz/UGKNgMg/EW6zhCH+kmsgXoLrjERq0TvUSqgaPkHYbZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6551
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFR1
ZXNkYXksIEphbnVhcnkgMTQsIDIwMjAgNDoxOSBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2
YWRpbXBAbWVsbGFub3guY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwub3JnOyB2aWpheWtoZW1r
YUBmYi5jb207IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBtZWxsYW5veC5jb20+OyBPZmVy
DQo+IExldnkgPG9mZXJsQG1lbGxhbm94LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0gg
aHdtb24tbmV4dCB2MSA1LzVdIGh3bW9uOiAocG1idXMvdHBzNTM2NzkpIEV4dGVuZA0KPiBkZXZp
Y2UgbGlzdCBzdXBwb3J0ZWQgYnkgZHJpdmVyDQo+IA0KPiBPbiAxLzEzLzIwIDEwOjU0IFBNLCBW
YWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBHdWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24g
QmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4gPj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDEzLCAy
MDIwIDEwOjU2IFBNDQo+ID4+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxsYW5veC5j
b20+DQo+ID4+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IHZpamF5a2hlbWthQGZiLmNvbTsNCj4g
Pj4gbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgTWljaGFlbA0KPiA+PiBTaHljaCA8bWljaGFlbHNoQG1lbGxhbm94LmNvbT47IE9mZXIgTGV2
eSA8b2ZlcmxAbWVsbGFub3guY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCBod21v
bi1uZXh0IHYxIDUvNV0gaHdtb246IChwbWJ1cy90cHM1MzY3OSkNCj4gPj4gRXh0ZW5kIGRldmlj
ZSBsaXN0IHN1cHBvcnRlZCBieSBkcml2ZXINCj4gPj4NCj4gPj4gSGkgVmFkaW0sDQo+ID4+DQo+
ID4+IE9uIE1vbiwgSmFuIDEzLCAyMDIwIGF0IDEyOjI1OjQ0UE0gKzAwMDAsIFZhZGltIFBhc3Rl
cm5hayB3cm90ZToNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+Pj4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJl
aGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+ID4+Pj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDA4
LCAyMDIwIDY6NDggUE0NCj4gPj4+PiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFu
b3guY29tPg0KPiA+Pj4+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IHZpamF5a2hlbWthQGZiLmNv
bTsNCj4gPj4+PiBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBNaWNoYWVsDQo+ID4+Pj4gU2h5Y2ggPG1pY2hhZWxzaEBtZWxsYW5veC5jb20+
DQo+ID4+Pj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggaHdtb24tbmV4dCB2MSA1LzVdIGh3bW9u
OiAocG1idXMvdHBzNTM2NzkpDQo+ID4+Pj4gRXh0ZW5kIGRldmljZSBsaXN0IHN1cHBvcnRlZCBi
eSBkcml2ZXINCj4gPj4+Pg0KPiA+Pj4+IE9uIFdlZCwgSmFuIDA4LCAyMDIwIGF0IDAyOjEwOjUw
UE0gKzAwMDAsIFZhZGltIFBhc3Rlcm5hayB3cm90ZToNCj4gPj4+Pj4NCj4gPj4+Pj4gSGkgR3Vl
bnRlciwNCj4gPj4+Pj4NCj4gPj4+Pj4gV2UgYXJlIGxvb2tpbmcgZm9yIHBvc3NpYmlsaXR5IHRv
IHByb3ZpZGUgc29tZSBraW5kIG9mIGZsZXhpYmxlDQo+ID4+Pj4+IGRyaXZlciB0byBoYW5kbGUg
ZGlmZmVyZW50IGRldmljZXMgZnJvbSBkaWZmZXJlbnQgdmVuZG9ycywgYnV0DQo+ID4+Pj4+IHdo
aWNoIGhhdmUgY29tbW9uIG5hdHVyZSwgbGlrZSBzdXBwb3J0IG9mIHR3byBwYWdlcyBmb3IgdGVs
ZW1ldHJ5DQo+ID4+Pj4+IHdpdGggc2FtZSBzZXQgb2YgZnVuY3Rpb25zIGFuZCBzYW1lIGZvcm1h
dHMuIChBY3R1YWxseSBkcml2ZXINCj4gPj4+Pj4gY291bGQgYmUgZmxleGlibGUgcmVnYXJkaW5n
IHRoZQ0KPiA+Pj4+IG51bWJlciBvZiBwYWdlcykuDQo+ID4+Pj4+DQo+ID4+Pj4+IFdoaWxlIHRo
ZSBkaWZmZXJlbmNlIG9ubHkgaW4gVklEIGNvZGVzIG1hcHBpbmcuDQo+ID4+Pj4+DQo+ID4+Pj4+
IFRoZSBtb3RpdmF0aW9uIGZvciB0aGF0IGlzIHRvIGdpdmUgZnJlZSBoYW5kIHRvIEhXIGRlc2ln
biB0bw0KPiA+Pj4+PiBjaG9vc2Ugd2hpY2ggcGFydGljdWxhciBkZXZpY2UgdG8gdXNlIG9uIHRo
ZSBzYW1lIHN5c3RlbSB0eXBlLg0KPiA+Pj4+PiBUaGVyZSBhcmUgdHdvIG1haW4gcmVhc29ucyBm
b3Igc3VjaCByZXF1aXJlbWVudDoNCj4gPj4+Pj4gLSBRdWFsaXR5IG9mIGRldmljZSAod2UgYWxy
ZWFkeSBoYWQgYSBzZXJpb3MgcHJvYmxlbXMgd2l0aCB1Y2Q5MjI0IGFuZA0KPiA+Pj4+PiAgICB0
cHM1MzY3OSwgY2F1c2VkIHN5c3RlbSBtZWx0ZG93bikuIEluIHN1Y2ggY2FzZSB0aGUgaW50ZW50
aW9uIGlzIHRvDQo+IG1vdmUNCj4gPj4+Pj4gICAgdG8gZmFsbGJhY2sgZGV2aWNlcyBpbiB0aGUg
bmV4dCBiYXRjaGVzLg0KPiA+Pj4+PiAtIERldmljZSBhdmFpbGFiaWxpdHkgaW4gc3RvY2suIFNv
bWV0aW1lcyB2ZW5kb3JzIGNhbid0IHN1cHBseSBpbiB0aW1lIHRoZQ0KPiA+Pj4+PiAgICAgbmVj
ZXNzYXJ5IHF1YW50aXR5Lg0KPiA+Pj4+Pg0KPiA+Pj4+PiBDdXJyZW50bHkgdGhlcmUgYXJlIHRo
ZSBkZXZpY2VzIGZyb20gdGhyZWUgdmVuZG9yOiBUSSB0cHM1MzZ4eCwNCj4gPj4+Pj4gSW5maW5l
b24NCj4gPj4+Pj4geGRwZTEyMiBhbmQgTVBTIG1wMjk3NS4NCj4gPj4+Pj4gQWxsIGhhdmUgZGlm
ZmVyZW50IG1hcHBpbmcgb2YgVklEIGNvZGVzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBJdCBjb3VsZCBi
ZSBhbHNvIGZldyBhZGRpdGlvbmFsIGRldmljZXMsIHdoaWNoIGFyZSBzdXBwb3NlZCB0byBiZQ0K
PiA+Pj4+PiB1c2VkIGFzIGZhbGxiYWNrIGRldmljZXMuDQo+ID4+Pj4+DQo+ID4+Pj4+IFdlIGhh
dmUgc2V2ZXJhbCB2ZXJ5IGJpZyBjdXN0b21lcnMgb3JkZXJpbmcgbm93IGh1Z2UgcXVhbnRpdHkg
b2YNCj4gPj4+Pj4gb3VyIHN5c3RlbXMsIHdoaWNoIGFyZSB2ZXJ5IGNvbnNlcnZhdGl2ZSByZWdh
cmRpbmcgaW1hZ2UgdXBncmFkZS4NCj4gPj4+Pj4gTWVhbnMgd2UgY2FuIHByb3ZpZGUgbm93IHN1
cHBvcnQgZm9yIHRwczUzNnh4LCB4ZHBlMTIyeHggYW5kDQo+ID4+Pj4+IG1wMjk3NSBidXQgaW4g
Y2FzZSBuZXcgZGV2aWNlcyBhcmUgY29taW5nIHNvb24sIHdlIHdpbGwgYmUgYWJsZSB0bw0KPiA+
Pj4+PiBzdXBwb3J0IGl0IGluIGtlcm5lbCBmb3IgdGhlaXIgaW1hZ2UgYWZ0ZXIgeWVhciBvciBl
dmVuIG1vcmUuDQo+ID4+Pj4+DQo+ID4+Pj4+IFdlIGNhbiBwcm92aWRlIEFDUEkgcG1idXMgZHJp
dmVyLCB3aGljaCB3aWxsIHJlYWQgVklEIG1hcHBpbmcgZnJvbQ0KPiA+Pj4+PiBBQ1BJIERTRFQg
dGFibGUuIFRoaXMgbWFwcGluZyB0YWJsZSB3aWxsIGNvbnRhaW4gdGhlIG5hbWVzIG9mDQo+ID4+
Pj4+IGF2YWlsYWJsZSBtb2RlcyBhbmQgc3BlY2lmaWMgdmVuZG9yIGNvZGUgZm9yIHRoaXMgbW9k
ZS4gTGlrZToNCj4gPj4+Pj4gUE1CVlIxMT0xDQo+ID4+Pj4+IFBNQlZSMTI9Mg0KPiA+Pj4+PiBQ
TUJWUjEzPTUNCj4gPj4+Pj4gUE1CSU1WUDk9MTANCj4gPj4+Pj4gQW5kIGRyaXZlciB3aWxsIHNl
dCBpbmZvLT52cm1fdmVyc2lvbltpXSBhY2NvcmRpbmcgdG8gdGhpcyBtYXBwaW5nLg0KPiA+Pj4+
Pg0KPiA+Pj4+DQo+ID4+Pj4gVGhlIERTRFQgd291bGQgaGF2ZSB0byBwcm92aWRlIGFsbCBwcm9w
ZXJ0aWVzLCBub3QganVzdCB0aGUgVklEIG1vZGVzLg0KPiA+Pj4+IEF0IHRoZSB2ZXJ5IGxlYXN0
IHRoYXQgd291bGQgaGF2ZSB0byBiZSB0aGUgbnVtYmVyIG9mIHBhZ2VzLCBkYXRhDQo+ID4+Pj4g
Zm9ybWF0cywgdnJtIHZlcnNpb24sIGFuZCB0aGUgc3VwcG9ydGVkIGF0dHJpYnV0ZXMgcGVyIHBh
Z2UuIEl0DQo+ID4+Pj4gc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGFsc28gYWRkIG0vYi9SIGluZm9y
bWF0aW9uIGZvciBlYWNoIG9mIHRoZQ0KPiA+Pj4+IHNlbnNvciBjbGFzc2VzLCBidXQgSSBndWVz
cyB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uIGNvdWxkIGJlDQo+ID4+Pj4gcG9zdHBvbmVkDQo+
ID4+IHVudGlsIGl0IGlzIG5lZWRlZC4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgY291bGQgYWxsIGJl
IGRvbmUgdGhyb3VnaCB0aGUgZXhpc3RpbmcgZ2VuZXJpYyBkcml2ZXINCj4gPj4+PiAocG1idXMu
Yyk7IGl0IHdvdWxkIG5vdCByZWFsbHkgcmVxdWlyZSBhIG5ldyBkcml2ZXIuIEFDUEkvRFNEVA0K
PiA+Pj4+IGNvdWxkIHByb3ZpZGUgZmlybXdhcmUgcHJvcGVydGllcywgYW5kIHBtYnVzLmMgY291
bGQgcmVhZCB0aG9zZQ0KPiA+Pj4+IHVzaW5nIGRldmljZV9wcm9wZXJ0eSBBUEkgZnVuY3Rpb25z
IChlZw0KPiA+Pj4+IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJ2cm0tDQo+ID4+IG1v
ZGUiKSkuIFdvdWxkIHRoYXQgd29yayBmb3IgeW91ID8NCj4gPj4+DQo+ID4+PiBIaSBHdWVudGVy
LA0KPiA+Pj4NCj4gPj4+IFdlIHRob3VnaHQgdGhhdCBpdCdzIHBvc3NpYmxlIHRvIHByb3ZpZGUg
anVzdCBtb2RpZmllZCBEU0RUIHdpdGggdGhlDQo+ID4+PiBzcGVjaWZpYyBjb25maWd1cmF0aW9u
IGFzIGFuIGV4dGVybmFsIHRhYmxlLCB3aGljaCBpcyBsb2FkZWQgZHVyaW5nIHN5c3RlbQ0KPiBi
b290Lg0KPiA+Pj4NCj4gPj4+IEl0IHNob3VsZCBub3QgYmUgaW50ZWdyYXRlZCBpbnRvIEJJT1Mg
aW1hZ2UuDQo+ID4+PiBXZSB3YW50IHRvIGF2b2lkIHJlbGVhc2luZyBvZiBuZXcgQklPUyBvciBu
ZXcgZWFjaCB0aW1lIHN5c3RlbQ0KPiA+Pj4gY29uZmlndXJhdGlvbiBpcyBjaGFuZ2VkLg0KPiA+
Pj4gTmV3IEJJT1MgaXMgcmVsZWFzZWQgb25seSB3aGVuIG5ldyBDUFUgdHlwZSBzaG91bGQgYmUg
c3VwcG9ydGVkLg0KPiA+Pj4gQWxzbyBCSU9TIG92ZXJ3cml0aW5nIGlzIG5vdCBhbiBvcHRpb24s
IHNpbmUgd2UgaGF2ZSB0byBzdXBwb3J0IHNlY3VyZWQNCj4gQklPUy4NCj4gPj4+DQo+ID4+PiBJ
dCBzaG91bGQgbm90IGJlIGxvY2F0ZWQgaW4gaW5pdHJkLg0KPiA+Pj4gVGhlIG5ldyBzeXN0ZW0g
YmF0Y2ggaXMgcmVsZWFzZWQgd2l0aCBCSU9TLCBTTUJJT1MgYW5kIHdpdGgNCj4gPj4+IGN1c3Rv
bWVyJ3MgT1Mgb3Igd2l0aCBpbnN0YWxsIGVudmlyb25tZW50IGxpa2UgT05JRS4NCj4gPj4+IE1l
YW5zIG5vIGtlcm5lbCBjaGFuZ2VzLg0KPiA+Pj4gQWxzbyBub3QgYWxsIG91ciBjdXN0b21lcnMg
dXNlIGluaXRyZC4NCj4gPj4+DQo+ID4+PiBTbywgaXQgc2VlbXMgdGhlcmUgaXMgbm8gcGxhY2Us
IHdoZW4gd2UgY2FuIGxvY2F0ZSBtb2RpZmllZCBEU0RUIGFuZA0KPiA+Pj4gbG9hZCBpdCBkeW5h
bWljYWxseS4NCj4gPj4+IEJ1dCB3ZSBzaG91bGQgdGhpbmsgbW9yZSBhYm91dCBwb3NzaWJsZSBt
ZXRob2RzIGZvciBkb2luZyBpdC4NCj4gPj4+DQo+ID4+PiBUb2RheSBhbGwgdGhlIHN0YXRpYyBk
ZXZpY2VzIGFyZSBpbnN0YW50aWF0ZWQgIGZyb20gdGhlIHVzZXIgc3BhY2UuDQo+ID4+PiBJdCdz
IHN1cHBvc2VkIHRvIHdvcmsgZm9yIHVzIHdoaWxlIHdlIGhhdmUgdG8gc3VwcG9ydCBzb21lDQo+
ID4+PiBwcmUtZGVmaW5lZCBzZXQgb2YgZGV2aWNlcywgZm9yIHdoaWNoIHdlIGNhbiBkZXRlY3Qg
dGhlIHNwZWNpZmljDQo+ID4+PiBjb25maWd1cmF0aW9uIHRocm91Z2ggRE1JIHRhYmxlcyAoU0tV
IGluIHBhcnRpY3VsYXIpLg0KPiA+Pj4gQnV0IGl0J2xsIG5vdCB3b3JrIGZvciBzb21lIG5ldyBj
b21pbmcgZGV2aWNlcy4NCj4gPj4+DQo+ID4+PiBXZSBoYXZlIGEgcG9zc2liaWxpdHkgdG8gcHJv
dmlkZSBWSUQgbWFwcGluZyBpbmZvIHRocm91Z2ggQ1BMRCBkZXZpY2UuDQo+ID4+PiBCdXQgaW4g
dGhpcyBjYXNlIHdlJ2xsIGhhdmUgdG8gaW1wbGVtZW50IE1lbGxhbm94IHNwZWNpZmljIFBNQnVz
DQo+ID4+PiBkcml2ZXIgYXdhcmUgb2YgQ1BMRCByZWdpc3RlciBtYXAuDQo+ID4+PiBOb3Qgc3Vy
ZSBpZiBzdWNoIGFwcHJvYWNoIGlzIGFjY2VwdGVkPw0KPiA+Pj4NCj4gPj4NCj4gPj4gSG93IGFi
b3V0IGEgcGxhdGZvcm0gZHJpdmVyIHdoaWNoIGxvYWRzIHRoZSBwYXJhbWV0ZXJzIGludG8gZGV2
aWNlDQo+ID4+IHByb3BlcnRpZXMgZnJvbSB3aGF0ZXZlciBsb2NhdGlvbiBhbmQgaW5zdGFudGlh
dGVzIHRoZSBwbWJ1cyBkcml2ZXIgPw0KPiA+PiBUaGUgUE1CdXMgZHJpdmVyIHdvdWxkIHRoZW4g
cmVhZCB0aGUgZGV2aWNlIGF0dHJpYnV0ZXMgYW5kDQo+ID4+IGluc3RhbnRpYXRlIGl0c2VsZiBh
Y2NvcmRpbmdseS4NCj4gPj4NCj4gPj4gSWYgdGhlIG90aGVyIFBNQnVzIGF0dHJpYnV0ZXMgY2Fu
IGJlIGF1dG8tZGV0ZWN0ZWQsIGl0IG1pZ2h0IGFjdHVhbGx5DQo+ID4+IGJlIHN1ZmZpY2llbnQg
dG8gaGF2ZSBhIHBlci1wYWdlIHZybS1tb2RlIHByb3BlcnR5IGFuZCBvdGhlcndpc2UgdXNlDQo+
ID4+IHRoZSBhdXRvLSBkZXRlY3QgbWVjaGFuaXNtIG9mIHBtYnVzLmMuDQo+ID4NCj4gPiBIaSBH
dWVudGVyLA0KPiA+DQo+ID4gSSBkaWRuJ3QgdGhpbmsgYWJvdXQgc3VjaCBwb3NzaWJpbGl0eS4N
Cj4gPiBJdCBzb3VuZHMgcHJvbWlzaW5nLg0KPiA+DQo+ID4gU28sIHdlIGNhbiBhZGQgb3VyIHBs
YXRmb3JtIGRyaXZlciB0byAiZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veCIsDQo+ID4gd2hpY2gg
Y2FuOg0KPiA+IC0gZmV0Y2ggInZybSIgbWFwcGluZyBwZXIgZWFjaCByZWxldmFudCBkZXZpY2Uu
DQo+ID4gLSBmb3IgZWFjaCBhbGxvY2F0ZSBkZXZpY2Ugbm9kZSwgY3JlYXRlIHByb3BlcnRpZXMg
dGFibGUgd2l0aCB2cm0gbW9kZQ0KPiA+ICAgbWFwcGluZyBsaWtlICJ2cm0tbW9kZS12cjExIiwg
InZybS1tb2RlLXZyMTIiLCAidnJtLW1vZGUtdnIxMyIsDQo+ID4gICAidnJtLW1vZGUtaW12cDki
LCAidnJtLW1vZGUtYW1kNjI1bXYiLCBjb2RlZCBhY2NvcmRpbmdseSB0bw0KPiA+ICAgImVudW0g
dnJtX3ZlcnNpb24iLg0KPiA+IC0gYXR0YWNoIHRoaXMgbm9kZSB0byAiaTJjX2JvYXJkX2luZm8i
IGFuZCBpbnN0YW50aWF0ZSBpdCB3aXRoDQo+ID4gICAgaTJjX25ld19kZXZpY2UoKSBmb3IgInBt
YnVzIiB0eXBlLg0KPiA+DQo+ID4gQW5kIGkicG1idXMiIHdpbGwgZ2V0IHRoZXNlIHByb3BlcnRp
ZXMgbGlrZQ0KPiA+IGRldmljZV9wcm9wZXJ0eV9yZWFkXzgoZGV2LCAidnJtLW1vZGUtdnIxMSIp
KSBldGNldGVyYS4NCj4gPg0KPiA+IERpZCBJIGdldCB5b3VyIHN1Z2dlc3Rpb24gY29ycmVjdGx5
Pw0KPiA+DQo+IA0KPiBDb3JyZWN0LiBXZSdsbCBuZWVkIGEgYmluZGluZ3MgZG9jdW1lbnQsIHRo
b3VnaCwgdG8gbWFrZSBpdCBvZmZpY2lhbC4NCj4gDQo+IFRoZSBiaW5kaW5nIHdvdWxkIGxvb2sg
c29tZXRoaW5nIGxpa2UgInZybS1tb2RlID0gPG51bWJlcj4iLCB3aGVyZQ0KPiA8bnVtYmVyPiBp
cyB3ZWxsIGRlZmluZWQgKHBvc3NpYmx5IGluIGFuIGluY2x1ZGUgZmlsZSkuIFRoZXJlIGFyZSBt
YW55IGJpbmRpbmdzDQo+IGluY2x1ZGUgZmlsZXMgd2hpY2ggeW91IGNhbiB1c2UgYXMgZXhhbXBs
ZXMuDQo+IFdlJ2xsIG5lZWQgdG8gZ2V0IERUIG1haW50YWluZXIgYXBwcm92YWwgZm9yIHRoZSBl
eGFjdCBiaW5kaW5nIG5hbWU7IG1heWJlIGl0DQo+IGhhcyB0byBiZSAicG1idXMsdnJtLW1vZGUi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQoNCkdyZWF0Lg0KSSBzdXBwb3NlIHdlJ2xsIHRyeSB0
byBtYWtlIGl0IGZvciB2NS43Lg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBhbGwgeW91ciBp
bnB1dHMuDQogDQpUaGFua3MsDQpWYWRpbS4NCg0KPiANCj4gVGhhbmtzLA0KPiBHdWVudGVyDQo=
