Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF0C12BC0F
	for <lists+linux-hwmon@lfdr.de>; Sat, 28 Dec 2019 01:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbfL1A7J (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 Dec 2019 19:59:09 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:48288 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725306AbfL1A7J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Dec 2019 19:59:09 -0500
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBS0tNuT014464;
        Fri, 27 Dec 2019 16:58:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5UbTjefwEB2/zlhJcnHZ/q/529wBK0x9ibNgP6oDvcI=;
 b=MxZ1v8+2Qqyv5GbQVzipnVPX0eVBIbiIlIhDuNkshX3d+dxX2edfT96eDfQpIzGBBvNf
 F/1cOg2a4MTpmbuHs9gudAnRq9zCEQAhkoGxJfo0vrZEPCAE5d74XjPl4xmHlLwgolAD
 JeIshtq0fagxsqh/+kcuJBAT5J9nV+MGDKs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2x5rhmgu7n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 27 Dec 2019 16:58:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Dec 2019 16:58:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqA+q/jQiZ05Sd4/f90IHTRXsDVXc6ZkSZIj6ACWcWGEs7G80seUzWFm/IhFPIhFEOi69eA/BqXusb7sNUf4qM/y0LqS+GC+m7pXH2XQpZh3JkjKa5FwkpwxwMRYXyv+5LcwEwfJAGKc8x8lxeVHORSYxyJ6p2OAiLyS4xZK7sBD4dD/ZHv5Y/r7BbdSomfT45o15nawXZb3TxLioUpxpDl7ESSuzWbMGWWxDpWpRx7yptOIqukipxRVjUACBRO+PD5AtanLtm0uf8GUdjUzzV3utlewAGHS0ekQ++x6TJajznPKVx497qRob66Y32plDbIeQYIO8uN/kK4wEqoo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UbTjefwEB2/zlhJcnHZ/q/529wBK0x9ibNgP6oDvcI=;
 b=TGpPstc3gdAsxu+2plxlX9Je/IKhsG0/8MQm6vSHK4AdWPG9cpARYvXcMq4D/rCW4j2YzwCgF/TuG5/i9IYix1fkjt+yRrkwBiOeaeWIXLbuOkhj3BkvoQU4S7LlKvV6aPRRDnZu0irMbk50iCN7d45Yv60gSP7rOSQ125lNV5vB75VmRMM65B9VaYVltLel/ou/PJ24n+eUjpqQwxxDtqcvTcdwM4bthALINj3qv3dzkJfB4nWpTuonXqSUf6MVKbEw9QNEhnjh+WLq3BH0pbuAjDE47ijXsTrxWdrvnJZ2WHlhsIZJBFjMgNkKvnlRygjdwPag5zDkOTPK9WQSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UbTjefwEB2/zlhJcnHZ/q/529wBK0x9ibNgP6oDvcI=;
 b=kO/DGzkhmYiJjDuEGF91LrbJKpcxdE46oQA/wRkGV5PIwgqlgiLuxlQnMY8USZu5QxzFX+pRf8pIaXFZ3IJl+ySACvstpfER+yBVaa803abo4Ohkpu4fj4uIPkVY2tLvAW4gXTs54aSjfAxQBTwjLbf9C8Pw3lqxNzO+CLbDKNE=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1662.namprd15.prod.outlook.com (10.175.140.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Sat, 28 Dec 2019 00:58:27 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2581.007; Sat, 28 Dec 2019
 00:58:27 +0000
From:   Vijay Khemka <vijaykhemka@fb.com>
To:     Andrew Peng <pengms1@lenovo.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "benjaminfair@google.com" <benjaminfair@google.com>
CC:     "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        Yonghui Liu <liuyh21@lenovo.com>, Derek Lin <dlin23@lenovo.com>
Subject: Re: [PATCH v1 0/1] hwmon: (pmbus) Add Infineon IR38164, Renesas
 RAA228006, and TI SN1701022 driver
Thread-Topic: [PATCH v1 0/1] hwmon: (pmbus) Add Infineon IR38164, Renesas
 RAA228006, and TI SN1701022 driver
Thread-Index: AQHVu8k8o824kp+FJkCsuV+3PSLCBafONiKA
Date:   Sat, 28 Dec 2019 00:58:26 +0000
Message-ID: <BC6F1E7B-DAB3-4674-AE98-7A99EAC44105@fb.com>
References: <1577350032-127172-1-git-send-email-pengms1@lenovo.com>
In-Reply-To: <1577350032-127172-1-git-send-email-pengms1@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::ac9d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 862d2941-2671-4539-61a4-08d78b310c34
x-ms-traffictypediagnostic: MWHPR15MB1662:
x-microsoft-antispam-prvs: <MWHPR15MB166207D569CE6DF562FC31C4DD250@MWHPR15MB1662.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02652BD10A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(39860400002)(366004)(396003)(189003)(199004)(66946007)(5660300002)(76116006)(316002)(110136005)(66446008)(54906003)(66476007)(71200400001)(2616005)(36756003)(30864003)(186003)(66556008)(64756008)(33656002)(6486002)(478600001)(6506007)(81156014)(2906002)(81166006)(86362001)(4326008)(8936002)(8676002)(6512007)(2004002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1662;H:MWHPR15MB1597.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6vT5eLLZJQdeNy5lRRKvSt5VLRBvV97sc/ONZT3sD5f5c/pcgFuvuyYRheyeX5pnQK7xTI1GDJgh5HaXsFVC5hU5U1pahfo7pb2Kytm3y9le2cz9js3P5Q7BCoGXtuuRt0U0Mi4PN52HhmSshDTtgHrxI6W3qBdmvLHlDZOFNo9kMAe5JtPSePTReGw92jxp+FzyauTcIOznystUzobBRVBTGZDqd1Pj9gByk6fBrVePW+dh73sEu3yEZnuSmK/7XQyu0u77Vx01Rek9BbBPvyxygh2GeLODKo5dPv31dQGjwKNVMsIU9OtmK8GXyMSKcQ64KH+nnweq/sydQaD8Wzpsp3I+/i9cdesKUmm3/3GiUZwV83OqxTmUfyb709spPkrK9Ko+IXeRfSPAdDWwTlzLGfZEbkLrzMESDSSFV9haznpaznWgNdwR79Pfll6iczuJHoKNODm9o2n6HD3BCPEmlGZyzMFHxLldy/Eh7mQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F51E137719AD9146910985B387E36A22@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 862d2941-2671-4539-61a4-08d78b310c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2019 00:58:26.8403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7T0MYh/sgKP5EnMGHIOdqh4WpppUv5CbbKruDH4gEdLOG2B3kJvQCPMzTqI1mmQH5aIqKWXjNP7/e/KNXyOTMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1662
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-27_07:2019-12-27,2019-12-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912280007
X-FB-Internal: deliver
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCu+7v09uIDEyLzI2LzE5LCAxMjo0OCBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEFuZHJl
dyBQZW5nIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiBwZW5nbXMxQGxlbm92by5jb20+IHdyb3RlOg0KDQogICAgQWRkIHRo
ZSBwbWJ1cyBkcml2ZXIgZm9yIEluZmluZW9uIElSMzgxNjQgVm9sdGFnZSBSZWd1bGF0b3IgZHJp
dmVyLg0KICAgIEFkZCB0aGUgcG1idXMgZHJpdmVyIGZvciBSZW5lc2FzIFJBQTIyODAwNiBEaWdp
dGFsIFBXTSBDb250cm9sbGVyLg0KICAgIEFkZCB0aGUgcG1idXMgZHJpdmVyIGZvciBUSSBTTjE3
MDEwMjIgZHJpdmVyLg0KDQpQbGVhc2UgaGF2ZSBzZXBhcmF0ZSBwYXRjaCBmb3IgZWFjaCBkcml2
ZXIuDQogICAgDQogICAgU2lnbmVkLW9mZi1ieTogQW5kcmV3IFBlbmcgPHBlbmdtczFAbGVub3Zv
LmNvbT4NCiAgICBTaWduZWQtb2ZmLWJ5OiBEZXJlayBMaW4gPGRsaW4yM0BsZW5vdm8uY29tPg0K
ICAgIFNpZ25lZC1vZmYtYnk6IFlvbmdodWkgTGl1IDxsaXV5aDIxQGxlbm92by5jb20+DQogICAg
LS0tDQogICAgdjE6IGluaXRpYWwgdmVyc2lvbg0KICAgIA0KICAgICBkcml2ZXJzL2h3bW9uL3Bt
YnVzL0tjb25maWcgICAgIHwgIDI1ICsrKysrKysrDQogICAgIGRyaXZlcnMvaHdtb24vcG1idXMv
TWFrZWZpbGUgICAgfCAgIDMgKw0KICAgICBkcml2ZXJzL2h3bW9uL3BtYnVzL2lyMzgxNjQuYyAg
IHwgIDcyICsrKysrKysrKysrKysrKysrKysrKysrDQogICAgIGRyaXZlcnMvaHdtb24vcG1idXMv
cmFhMjI4MDA2LmMgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KICAgICBkcml2ZXJzL2h3bW9uL3BtYnVzL3NuMTcwMTAyMi5jIHwgIDgwICsrKysrKysrKysr
KysrKysrKysrKysrKysNCiAgICAgNSBmaWxlcyBjaGFuZ2VkLCAzMDcgaW5zZXJ0aW9ucygrKQ0K
ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od21vbi9wbWJ1cy9pcjM4MTY0LmMNCiAg
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcG1idXMvcmFhMjI4MDA2LmMNCiAg
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcG1idXMvc24xNzAxMDIyLmMNCiAg
ICANCiAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnIGIvZHJpdmVy
cy9od21vbi9wbWJ1cy9LY29uZmlnDQogICAgaW5kZXggYjY1ODg0OC4uZDUxZTY3ZCAxMDA2NDQN
CiAgICAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWcNCiAgICArKysgYi9kcml2ZXJz
L2h3bW9uL3BtYnVzL0tjb25maWcNCiAgICBAQCAtNjQsNiArNjQsMTUgQEAgY29uZmlnIFNFTlNP
UlNfSVIzODA2NA0KICAgICAJICBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1v
ZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUgd2lsbA0KICAgICAJICBiZSBjYWxsZWQgaXIzODA2NC4N
CiAgICAgDQogICAgK2NvbmZpZyBTRU5TT1JTX0lSMzgxNjQNCiAgICArCXRyaXN0YXRlICJJbmZp
bmVvbiBJUjM4MTY0Ig0KICAgICsJaGVscA0KICAgICsJICBJZiB5b3Ugc2F5IHllcyBoZXJlIHlv
dSBnZXQgaGFyZHdhcmUgbW9uaXRvcmluZyBzdXBwb3J0IGZvciBJbmZpbmVvbg0KICAgICsJICBJ
UjM4MTY0Lg0KICAgICsNCiAgICArCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMg
YSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlIHdpbGwNCiAgICArCSAgYmUgY2FsbGVkIGlyMzgx
NjQuDQogICAgKw0KICAgICBjb25maWcgU0VOU09SU19JUlBTNTQwMQ0KICAgICAJdHJpc3RhdGUg
IkluZmluZW9uIElSUFM1NDAxIg0KICAgICAJaGVscA0KICAgIEBAIC0yMjEsNCArMjMwLDIwIEBA
IGNvbmZpZyBTRU5TT1JTX1pMNjEwMA0KICAgICAJICBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBi
dWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUgd2lsbA0KICAgICAJICBiZSBjYWxs
ZWQgemw2MTAwLg0KICAgICANCiAgICArY29uZmlnIFNFTlNPUlNfUkFBMjI4MDA2DQogICAgKwl0
cmlzdGF0ZSAiUkFBMjI4MDA2IGFuZCBjb21wYXRpYmxlcyINCiAgICArCWhlbHANCiAgICArCSAg
SWYgeW91IHNheSB5ZXMgaGVyZSB5b3UgZ2V0IGhhcmR3YXJlIG1vbml0b3Jpbmcgc3VwcG9ydCBm
b3IgUkFBMjI4MDA2Lg0KICAgICsNCiAgICArCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVp
bHQgYXMgYSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlIHdpbGwNCiAgICArCSAgYmUgY2FsbGVk
IFJBQTIyODAwNi4NCiAgICArDQogICAgK2NvbmZpZyBTRU5TT1JTX1NOMTcwMTAyMg0KICAgICsJ
dHJpc3RhdGUgIlNOMTcwMTAyMiINCiAgICArCWhlbHANCiAgICArCSAgSWYgeW91IHNheSB5ZXMg
aGVyZSB5b3UgZ2V0IGhhcmR3YXJlIG1vbml0b3Jpbmcgc3VwcG9ydCBmb3IgU04xNzAxMDIyLg0K
ICAgICsNCiAgICArCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1bGUu
IElmIHNvLCB0aGUgbW9kdWxlIHdpbGwNCiAgICArCSAgYmUgY2FsbGVkIHNuMTcwMTAyMi4NCiAg
ICArDQogICAgIGVuZGlmICMgUE1CVVMNCiAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9w
bWJ1cy9NYWtlZmlsZSBiL2RyaXZlcnMvaHdtb24vcG1idXMvTWFrZWZpbGUNCiAgICBpbmRleCBj
OTUwZWE5Li4yMWQyNTlmIDEwMDY0NA0KICAgIC0tLSBhL2RyaXZlcnMvaHdtb24vcG1idXMvTWFr
ZWZpbGUNCiAgICArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL01ha2VmaWxlDQogICAgQEAgLTks
NiArOSw3IEBAIG9iai0kKENPTkZJR19TRU5TT1JTX0FETTEyNzUpCSs9IGFkbTEyNzUubw0KICAg
ICBvYmotJChDT05GSUdfU0VOU09SU19JQk1fQ0ZGUFMpCSs9IGlibS1jZmZwcy5vDQogICAgIG9i
ai0kKENPTkZJR19TRU5TT1JTX0lSMzUyMjEpCSs9IGlyMzUyMjEubw0KICAgICBvYmotJChDT05G
SUdfU0VOU09SU19JUjM4MDY0KQkrPSBpcjM4MDY0Lm8NCiAgICArb2JqLSQoQ09ORklHX1NFTlNP
UlNfSVIzODE2NCkJKz0gaXIzODE2NC5vDQogICAgIG9iai0kKENPTkZJR19TRU5TT1JTX0lSUFM1
NDAxKQkrPSBpcnBzNTQwMS5vDQogICAgIG9iai0kKENPTkZJR19TRU5TT1JTX0lTTDY4MTM3KQkr
PSBpc2w2ODEzNy5vDQogICAgIG9iai0kKENPTkZJR19TRU5TT1JTX0xNMjUwNjYpCSs9IGxtMjUw
NjYubw0KICAgIEBAIC0yNSwzICsyNiw1IEBAIG9iai0kKENPTkZJR19TRU5TT1JTX1RQUzUzNjc5
KQkrPSB0cHM1MzY3OS5vDQogICAgIG9iai0kKENPTkZJR19TRU5TT1JTX1VDRDkwMDApCSs9IHVj
ZDkwMDAubw0KICAgICBvYmotJChDT05GSUdfU0VOU09SU19VQ0Q5MjAwKQkrPSB1Y2Q5MjAwLm8N
CiAgICAgb2JqLSQoQ09ORklHX1NFTlNPUlNfWkw2MTAwKQkrPSB6bDYxMDAubw0KICAgICtvYmot
JChDT05GSUdfU0VOU09SU19SQUEyMjgwMDYpCSs9IHJhYTIyODAwNi5vDQogICAgK29iai0kKENP
TkZJR19TRU5TT1JTX1NOMTcwMTAyMikJKz0gc24xNzAxMDIyLm8NCiAgICBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9od21vbi9wbWJ1cy9pcjM4MTY0LmMgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL2lyMzgx
NjQuYw0KICAgIG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQogICAgaW5kZXggMDAwMDAwMC4uZGI4OTQ3
Mw0KICAgIC0tLSAvZGV2L251bGwNCiAgICArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL2lyMzgx
NjQuYw0KV2h5IGNhbid0IGEgY29tbW9uIHBtYnVzIGRyaXZlciB3b3JrIGZvciB0aGlzIHNpbXBs
ZSBkZXZpY2UuIFRoZXJlIGlzIG5vdGhpbmcNCkV4dHJhIGJlaW5nIGRvbmUgaGVyZSBpbiB0aGlz
IGRyaXZlci4NCiAgICBAQCAtMCwwICsxLDcyIEBADQogICAgKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQogICAgKy8qDQogICAgKyAqIEhhcmR3YXJlIG1vbml0
b3JpbmcgZHJpdmVyIGZvciBJbmZpbmVvbiBpcjM4MTY0DQogICAgKyAqDQogICAgKyAqIENvcHly
aWdodCAoQykgMjAxOS1wcmVzZW50IExlbm92bw0KICAgICsgKg0KICAgICsgKiBUaGlzIHByb2dy
YW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yDQogICAg
KyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlDQogICAgKyAqIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uOyBlaXRoZXIgdmVyc2lvbiAyDQogICAgKyAqIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KICAgICsgKg0KICAgICsgKiBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwNCiAg
ICArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQg
d2FycmFudHkgb2YNCiAgICArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQ0KICAgICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGlj
ZW5zZSBmb3IgbW9yZSBkZXRhaWxzLg0KICAgICsgKg0KICAgICsgKiBZb3Ugc2hvdWxkIGhhdmUg
cmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KICAgICsg
KiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0
d2FyZQ0KICAgICsgKiBGb3VuZGF0aW9uLCBJbmMuLCA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRo
IEZsb29yLA0KICAgICsgKiBCb3N0b24sIE1BICAwMjExMC0xMzAxLCBVU0EuDQogICAgKyAqLw0K
ICAgICsNCiAgICArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KICAgICsjaW5jbHVkZSA8bGludXgv
aTJjLmg+DQogICAgKyNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQogICAgKyNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4NCiAgICArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KICAgICsjaW5jbHVk
ZSAicG1idXMuaCINCiAgICArDQogICAgK3N0YXRpYyBzdHJ1Y3QgcG1idXNfZHJpdmVyX2luZm8g
aXIzODE2NF9pbmZvID0gew0KICAgICsJLnBhZ2VzID0gMSwNCiAgICArCS5mb3JtYXRbUFNDX1ZP
TFRBR0VfSU5dID0gbGluZWFyLA0KICAgICsJLmZvcm1hdFtQU0NfVk9MVEFHRV9PVVRdID0gbGlu
ZWFyLA0KICAgICsJLmZvcm1hdFtQU0NfQ1VSUkVOVF9PVVRdID0gbGluZWFyLA0KICAgICsJLmZv
cm1hdFtQU0NfUE9XRVJdID0gbGluZWFyLA0KICAgICsJLmZvcm1hdFtQU0NfVEVNUEVSQVRVUkVd
ID0gbGluZWFyLA0KICAgICsNCiAgICArCS5mdW5jWzBdID0gUE1CVVNfSEFWRV9WSU4gfCBQTUJV
U19IQVZFX1NUQVRVU19JTlBVVA0KICAgICsJICAgIHwgUE1CVVNfSEFWRV9URU1QIHwgUE1CVVNf
SEFWRV9TVEFUVVNfVEVNUA0KICAgICsJICAgIHwgUE1CVVNfSEFWRV9WT1VUIHwgUE1CVVNfSEFW
RV9TVEFUVVNfVk9VVA0KICAgICsJICAgIHwgUE1CVVNfSEFWRV9JT1VUIHwgUE1CVVNfSEFWRV9T
VEFUVVNfSU9VVA0KICAgICsJICAgIHwgUE1CVVNfSEFWRV9QT1VULA0KICAgICt9Ow0KICAgICsN
CiAgICArc3RhdGljIGludCBpcjM4MTY0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQs
DQogICAgKwkJCSBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQpDQogICAgK3sNCiAgICAr
CXJldHVybiBwbWJ1c19kb19wcm9iZShjbGllbnQsIGlkLCAmaXIzODE2NF9pbmZvKTsNCiAgICAr
fQ0KICAgICsNCiAgICArc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGlyMzgxNjRf
aWRbXSA9IHsNCiAgICArCXsiaXIzODE2NCIsIDB9LA0KICAgICsJe30NCiAgICArfTsNCiAgICAr
DQogICAgK01PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBpcjM4MTY0X2lkKTsNCiAgICArDQogICAg
Ky8qIFRoaXMgaXMgdGhlIGRyaXZlciB0aGF0IHdpbGwgYmUgaW5zZXJ0ZWQgKi8NCiAgICArc3Rh
dGljIHN0cnVjdCBpMmNfZHJpdmVyIGlyMzgxNjRfZHJpdmVyID0gew0KICAgICsJLmRyaXZlciA9
IHsNCiAgICArCQkgICAubmFtZSA9ICJpcjM4MTY0IiwNCiAgICArCQkgICB9LA0KICAgICsJLnBy
b2JlID0gaXIzODE2NF9wcm9iZSwNCiAgICArCS5yZW1vdmUgPSBwbWJ1c19kb19yZW1vdmUsDQog
ICAgKwkuaWRfdGFibGUgPSBpcjM4MTY0X2lkLA0KICAgICt9Ow0KICAgICsNCiAgICArbW9kdWxl
X2kyY19kcml2ZXIoaXIzODE2NF9kcml2ZXIpOw0KICAgICsNCiAgICArTU9EVUxFX0FVVEhPUigi
WW9uZ2h1aSBMaXUgPGxpdXloMjFAbGVub3ZvLmNvbT4iKTsNCiAgICArTU9EVUxFX0RFU0NSSVBU
SU9OKCJQTUJ1cyBkcml2ZXIgZm9yIEluZmluZW9uIGlyMzgxNjQiKTsNCiAgICArTU9EVUxFX0xJ
Q0VOU0UoIkdQTCIpOw0KICAgIGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3JhYTIy
ODAwNi5jIGIvZHJpdmVycy9od21vbi9wbWJ1cy9yYWEyMjgwMDYuYw0KICAgIG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQogICAgaW5kZXggMDAwMDAwMC4uOWFlZDQ4MQ0KICAgIC0tLSAvZGV2L251bGwN
CiAgICArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL3JhYTIyODAwNi5jDQogICAgQEAgLTAsMCAr
MSwxMjcgQEANCiAgICArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0
ZXINCiAgICArLyoNCiAgICArICogSGFyZHdhcmUgbW9uaXRvcmluZyBkcml2ZXIgZm9yIHJhYTIy
ODAwNg0KICAgICsgKg0KICAgICsgKiBDb3B5cmlnaHQgKEMpIDIwMTktcHJlc2VudCBMZW5vdm8N
CiAgICArICoNCiAgICArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vcg0KICAgICsgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQ0KICAgICsgKiBhcyBwdWJsaXNoZWQg
YnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMg0KICAgICsg
KiBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4N
CiAgICArICoNCiAgICArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQogICAgKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQogICAgKyAqIE1FUkNIQU5U
QUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCiAg
ICArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCiAgICAr
ICoNCiAgICArICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UNCiAgICArICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IGlm
IG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUNCiAgICArICogRm91bmRhdGlvbiwgSW5j
LiwgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwNCiAgICArICogQm9zdG9uLCBNQSAg
MDIxMTAtMTMwMSwgVVNBLg0KICAgICsgKi8NCiAgICArDQogICAgKyNpbmNsdWRlIDxsaW51eC9l
cnIuaD4NCiAgICArI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KICAgICsjaW5jbHVkZSA8bGludXgv
aW5pdC5oPg0KICAgICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQogICAgKyNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4NCiAgICArI2luY2x1ZGUgInBtYnVzLmgiDQogICAgKw0KICAgICtzdGF0
aWMgaW50IHJhYTIyODAwNl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KICAgICsJ
CQkgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQ0KICAgICt7DQogICAgKwlzdHJ1Y3Qg
cG1idXNfZHJpdmVyX2luZm8gKmluZm87DQogICAgKwl1OCBidWZbSTJDX1NNQlVTX0JMT0NLX01B
WF07DQogICAgKwlpbnQgcmV0Ow0KICAgICsNCiAgICArCWlmICghaTJjX2NoZWNrX2Z1bmN0aW9u
YWxpdHkoY2xpZW50LT5hZGFwdGVyLA0KICAgICsJCQkJICAgICBJMkNfRlVOQ19TTUJVU19SRUFE
X0JZVEVfREFUQQ0KICAgICsJCQkJfCBJMkNfRlVOQ19TTUJVU19SRUFEX1dPUkRfREFUQQ0KICAg
ICsJCQkJfCBJMkNfRlVOQ19TTUJVU19SRUFEX0JMT0NLX0RBVEEpKQ0KICAgICsJCXJldHVybiAt
RU5PREVWOw0KICAgICsNCiAgICArCS8qIEJ5IGRlZmF1bHQgdGhpcyBkZXZpY2UgZG9lc24ndCBi
b290IHRvIHBhZ2UgMCwgc28gc2V0IHBhZ2UgMA0KICAgICsJICogdG8gYWNjZXNzIGFsbCBwbWJ1
cyByZWdpc3RlcnMuDQogICAgKwkgKi8NCiAgICArDQogICAgKwlpMmNfc21idXNfd3JpdGVfYnl0
ZV9kYXRhKGNsaWVudCwgMCwgMCk7DQogICAgKw0KICAgICsJLyogUmVhZCBNYW51ZmFjdHVyZXIg
aWQgKi8NCiAgICArCXJldCA9IGkyY19zbWJ1c19yZWFkX2Jsb2NrX2RhdGEoY2xpZW50LCBQTUJV
U19NRlJfSUQsIGJ1Zik7DQogICAgKwlpZiAocmV0IDwgMCkgew0KICAgICsJCWRldl9lcnIoJmNs
aWVudC0+ZGV2LCAiRmFpbGVkIHRvIHJlYWQgUE1CVVNfTUZSX0lEXG4iKTsNCiAgICArCQlyZXR1
cm4gcmV0Ow0KICAgICsJfQ0KICAgICsNCiAgICArCWluZm8gPSBkZXZtX2t6YWxsb2MoJmNsaWVu
dC0+ZGV2LCBzaXplb2Yoc3RydWN0IHBtYnVzX2RyaXZlcl9pbmZvKSwNCiAgICArCQkJICAgIEdG
UF9LRVJORUwpOw0KICAgICsJaWYgKCFpbmZvKQ0KICAgICsJCXJldHVybiAtRU5PTUVNOw0KICAg
ICsNCiAgICArCWluZm8tPmZvcm1hdFtQU0NfVk9MVEFHRV9JTl0gPSBkaXJlY3Q7DQogICAgKwlp
bmZvLT5mb3JtYXRbUFNDX1ZPTFRBR0VfT1VUXSA9IGRpcmVjdDsNCiAgICArCWluZm8tPmZvcm1h
dFtQU0NfQ1VSUkVOVF9JTl0gPSBkaXJlY3Q7DQogICAgKwlpbmZvLT5mb3JtYXRbUFNDX0NVUlJF
TlRfT1VUXSA9IGRpcmVjdDsNCiAgICArCWluZm8tPmZvcm1hdFtQU0NfUE9XRVJdID0gZGlyZWN0
Ow0KICAgICsJaW5mby0+Zm9ybWF0W1BTQ19URU1QRVJBVFVSRV0gPSBkaXJlY3Q7DQogICAgKwlp
bmZvLT52cm1fdmVyc2lvbiA9IHZyMTM7DQogICAgKw0KICAgICsJaW5mby0+bVtQU0NfVk9MVEFH
RV9JTl0gPSAxLA0KICAgICsJaW5mby0+YltQU0NfVk9MVEFHRV9JTl0gPSAwLA0KICAgICsJaW5m
by0+UltQU0NfVk9MVEFHRV9JTl0gPSAzLA0KICAgICsNCiAgICArCWluZm8tPm1bUFNDX1ZPTFRB
R0VfT1VUXSA9IDEsDQogICAgKwlpbmZvLT5iW1BTQ19WT0xUQUdFX09VVF0gPSAwLA0KICAgICsJ
aW5mby0+UltQU0NfVk9MVEFHRV9PVVRdID0gMCwNCiAgICArDQogICAgKwlpbmZvLT5tW1BTQ19D
VVJSRU5UX0lOXSA9IDEsDQogICAgKwlpbmZvLT5iW1BTQ19DVVJSRU5UX0lOXSA9IDAsDQogICAg
KwlpbmZvLT5SW1BTQ19DVVJSRU5UX0lOXSA9IDEsDQogICAgKw0KICAgICsJaW5mby0+bVtQU0Nf
Q1VSUkVOVF9PVVRdID0gMSwNCiAgICArCWluZm8tPmJbUFNDX0NVUlJFTlRfT1VUXSA9IDAsDQog
ICAgKwlpbmZvLT5SW1BTQ19DVVJSRU5UX09VVF0gPSAyLA0KICAgICsNCiAgICArCWluZm8tPm1b
UFNDX1BPV0VSXSA9IDEsDQogICAgKwlpbmZvLT5iW1BTQ19QT1dFUl0gPSAwLA0KICAgICsJaW5m
by0+UltQU0NfUE9XRVJdID0gMywNCiAgICArDQogICAgKwlpbmZvLT5tW1BTQ19URU1QRVJBVFVS
RV0gPSAxLA0KICAgICsJaW5mby0+YltQU0NfVEVNUEVSQVRVUkVdID0gMCwNCiAgICArCWluZm8t
PlJbUFNDX1RFTVBFUkFUVVJFXSA9IDMsDQogICAgKw0KICAgICsJaW5mby0+ZnVuY1swXSA9IFBN
QlVTX0hBVkVfVklODQogICAgKwkJfCBQTUJVU19IQVZFX1ZPVVQgfCBQTUJVU19IQVZFX0lJTg0K
ICAgICsJCXwgUE1CVVNfSEFWRV9JT1VUIHwgUE1CVVNfSEFWRV9QSU4NCiAgICArCQl8IFBNQlVT
X0hBVkVfUE9VVCB8IFBNQlVTX0hBVkVfVEVNUA0KICAgICsJCXwgUE1CVVNfSEFWRV9URU1QMiB8
IFBNQlVTX0hBVkVfVEVNUDMNCiAgICArCQl8IFBNQlVTX0hBVkVfU1RBVFVTX1ZPVVQgfCBQTUJV
U19IQVZFX1NUQVRVU19JT1VUDQogICAgKwkJfCBQTUJVU19IQVZFX1NUQVRVU19JTlBVVCB8IFBN
QlVTX0hBVkVfU1RBVFVTX1RFTVA7DQogICAgKw0KICAgICsJaW5mby0+cGFnZXMgPSBpZC0+ZHJp
dmVyX2RhdGE7DQogICAgKw0KICAgICsJcmV0dXJuIHBtYnVzX2RvX3Byb2JlKGNsaWVudCwgaWQs
IGluZm8pOw0KICAgICt9DQogICAgKw0KICAgICtzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZp
Y2VfaWQgcmFhMjI4MDA2X2lkW10gPSB7DQogICAgKwl7InJhYTIyODAwNiIsIDF9LA0KICAgICsJ
e30NCiAgICArfTsNCiAgICArDQogICAgK01PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCByYWEyMjgw
MDZfaWQpOw0KICAgICsNCiAgICArLyogVGhpcyBpcyB0aGUgZHJpdmVyIHRoYXQgd2lsbCBiZSBp
bnNlcnRlZCAqLw0KICAgICtzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgcmFhMjI4MDA2X2RyaXZl
ciA9IHsNCiAgICArCS5kcml2ZXIgPSB7DQogICAgKwkJICAgLm5hbWUgPSAicmFhMjI4MDA2IiwN
CiAgICArCQkgICB9LA0KICAgICsJLnByb2JlID0gcmFhMjI4MDA2X3Byb2JlLA0KICAgICsJLnJl
bW92ZSA9IHBtYnVzX2RvX3JlbW92ZSwNCiAgICArCS5pZF90YWJsZSA9IHJhYTIyODAwNl9pZCwN
CiAgICArfTsNCiAgICArDQogICAgK21vZHVsZV9pMmNfZHJpdmVyKHJhYTIyODAwNl9kcml2ZXIp
Ow0KICAgICsNCiAgICArTU9EVUxFX0FVVEhPUigiWW9uZ2h1aSBMaXUgPGxpdXloMjFAbGVub3Zv
LmNvbT4iKTsNCiAgICArTU9EVUxFX0RFU0NSSVBUSU9OKCJQTUJ1cyBkcml2ZXIgZm9yIHJhYTIy
ODAwNiIpOw0KICAgICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQogICAgZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaHdtb24vcG1idXMvc24xNzAxMDIyLmMgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL3NuMTcw
MTAyMi5jDQogICAgbmV3IGZpbGUgbW9kZSAxMDA2NDQNCiAgICBpbmRleCAwMDAwMDAwLi4wYmE0
NWFjDQogICAgLS0tIC9kZXYvbnVsbA0KICAgICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvc24x
NzAxMDIyLmMNCiAgICBAQCAtMCwwICsxLDgwIEBADQogICAgKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQogICAgKy8qDQogICAgKyAqIEhhcmR3YXJlIG1vbml0
b3JpbmcgZHJpdmVyIGZvciBzbjE3MDEwMjINCiAgICArICoNCiAgICArICogQ29weXJpZ2h0IChD
KSAyMDE5LXByZXNlbnQgTGVub3ZvDQogICAgKyAqDQogICAgKyAqIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3INCiAgICArICogbW9k
aWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UN
CiAgICArICogYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDINCiAgICArICogb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlv
bikgYW55IGxhdGVyIHZlcnNpb24uDQogICAgKyAqDQogICAgKyAqIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KICAgICsgKiBi
dXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50
eSBvZg0KICAgICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFS
IFBVUlBPU0UuICBTZWUgdGhlDQogICAgKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3JlIGRldGFpbHMuDQogICAgKyAqDQogICAgKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlDQogICAgKyAqIGFsb25n
IHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlDQog
ICAgKyAqIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3Is
DQogICAgKyAqIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEsIFVTQS4NCiAgICArICovDQogICAgKw0K
ICAgICsjaW5jbHVkZSA8bGludXgvZXJyLmg+DQogICAgKyNpbmNsdWRlIDxsaW51eC9pMmMuaD4N
CiAgICArI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCiAgICArI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPg0KICAgICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQogICAgKyNpbmNsdWRlICJwbWJ1
cy5oIg0KICAgICsNCiAgICArc3RhdGljIHN0cnVjdCBwbWJ1c19kcml2ZXJfaW5mbyBzbjE3MDEw
MjJfaW5mbyA9IHsNCiAgICArCS5wYWdlcyA9IDIsDQogICAgKwkuZm9ybWF0W1BTQ19WT0xUQUdF
X0lOXSA9IGxpbmVhciwNCiAgICArCS5mb3JtYXRbUFNDX1ZPTFRBR0VfT1VUXSA9IHZpZCwNCiAg
ICArCS52cm1fdmVyc2lvbiA9IHZyMTIsDQogICAgKwkuZm9ybWF0W1BTQ19DVVJSRU5UX09VVF0g
PSBsaW5lYXIsDQogICAgKwkuZm9ybWF0W1BTQ19DVVJSRU5UX0lOXSA9IGxpbmVhciwNCiAgICAr
CS5mb3JtYXRbUFNDX1BPV0VSXSA9IGxpbmVhciwNCiAgICArCS5mb3JtYXRbUFNDX1RFTVBFUkFU
VVJFXSA9IGxpbmVhciwNCiAgICArDQogICAgKwkuZnVuY1swXSA9IFBNQlVTX0hBVkVfVklOIHwg
UE1CVVNfSEFWRV9TVEFUVVNfSU5QVVQNCiAgICArCSAgICB8IFBNQlVTX0hBVkVfVEVNUCB8IFBN
QlVTX0hBVkVfU1RBVFVTX1RFTVANCiAgICArCSAgICB8IFBNQlVTX0hBVkVfVk9VVCB8IFBNQlVT
X0hBVkVfU1RBVFVTX1ZPVVQNCiAgICArCSAgICB8IFBNQlVTX0hBVkVfSU9VVCB8IFBNQlVTX0hB
VkVfU1RBVFVTX0lPVVQNCiAgICArCSAgICB8IFBNQlVTX0hBVkVfUE9VVCwNCiAgICArDQogICAg
KwkuZnVuY1sxXSA9IFBNQlVTX0hBVkVfVklOIHwgUE1CVVNfSEFWRV9TVEFUVVNfSU5QVVQNCiAg
ICArCSAgICB8IFBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX1RFTVANCiAgICAr
CSAgICB8IFBNQlVTX0hBVkVfVk9VVCB8IFBNQlVTX0hBVkVfU1RBVFVTX1ZPVVQNCiAgICArCSAg
ICB8IFBNQlVTX0hBVkVfSU9VVCB8IFBNQlVTX0hBVkVfU1RBVFVTX0lPVVQNCiAgICArCSAgICB8
IFBNQlVTX0hBVkVfUE9VVCwNCiAgICArfTsNCiAgICArDQogICAgK3N0YXRpYyBpbnQgc24xNzAx
MDIyX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQogICAgKwkJCSBjb25zdCBzdHJ1
Y3QgaTJjX2RldmljZV9pZCAqaWQpDQogICAgK3sNCiAgICArCXJldHVybiBwbWJ1c19kb19wcm9i
ZShjbGllbnQsIGlkLCAmc24xNzAxMDIyX2luZm8pOw0KICAgICt9DQogICAgKw0KICAgICtzdGF0
aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgc24xNzAxMDIyX2lkW10gPSB7DQogICAgKwl7
InNuMTcwMTAyMiIsIDB9LA0KICAgICsJe30NCiAgICArfTsNCiAgICArDQogICAgK01PRFVMRV9E
RVZJQ0VfVEFCTEUoaTJjLCBzbjE3MDEwMjJfaWQpOw0KICAgICsNCiAgICArLyogVGhpcyBpcyB0
aGUgZHJpdmVyIHRoYXQgd2lsbCBiZSBpbnNlcnRlZCAqLw0KICAgICtzdGF0aWMgc3RydWN0IGky
Y19kcml2ZXIgc24xNzAxMDIyX2RyaXZlciA9IHsNCiAgICArCS5kcml2ZXIgPSB7DQogICAgKwkJ
ICAgLm5hbWUgPSAic24xNzAxMDIyIiwNCiAgICArCQkgICB9LA0KICAgICsJLnByb2JlID0gc24x
NzAxMDIyX3Byb2JlLA0KICAgICsJLnJlbW92ZSA9IHBtYnVzX2RvX3JlbW92ZSwNCiAgICArCS5p
ZF90YWJsZSA9IHNuMTcwMTAyMl9pZCwNCiAgICArfTsNCiAgICArDQogICAgK21vZHVsZV9pMmNf
ZHJpdmVyKHNuMTcwMTAyMl9kcml2ZXIpOw0KICAgICsNCiAgICArTU9EVUxFX0FVVEhPUigiWW9u
Z2h1aSBMaXUgPGxpdXloMjFAbGVub3ZvLmNvbT4iKTsNCiAgICArTU9EVUxFX0RFU0NSSVBUSU9O
KCJQTUJ1cyBkcml2ZXIgZm9yICBzbjE3MDEwMjIiKTsNCiAgICArTU9EVUxFX0xJQ0VOU0UoIkdQ
TCIpOw0KICAgIC0tIA0KICAgIDIuNy40DQogICAgDQogICAgDQoNCg==
