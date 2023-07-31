Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D44C768A8C
	for <lists+linux-hwmon@lfdr.de>; Mon, 31 Jul 2023 06:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjGaEFt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 31 Jul 2023 00:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGaEFr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Jul 2023 00:05:47 -0400
Received: from DM5PR00CU002.outbound.protection.outlook.com (mail-centralusazon11021024.outbound.protection.outlook.com [52.101.62.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B3F1B7;
        Sun, 30 Jul 2023 21:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YI/5VvuadCj+/b60aaMlCSzOYSGhMq/Hlr6WBFzIhMXfwtFcr+R/HoW0UzbWcmkcypAVFmv7Fs3osxgRPSB/OlzZD2a3xLN9syOxXBkKXr5cygV1QZCF9Yt2o+vilF6J8UqACT6O7MQzR/Jc8nwjHckxv+qvV74cGx4sqrDm7/8GU5wEd0cPwvCJrxRlwi0aR4lMK1AT6wAfQAy0bDuJft8hp63rj3WDEA6LY++0LcBInHy4rRQzoHB4b3zCzk3mZHVmbE22sR6147hfrnnJeZ53rANqglFTa9pa/NtX35m5SdZgOOch4jkqlnywSYRsD9WfvNQ2FTCk78devpvmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0msHRFxtfoEqNhwy7J5lq7DjjcGop0lkwTCN9NYNXg=;
 b=ULczAleR9/1oibXr1fdfoOPkNMDgkeD6lhONlepQ4HVlAslgOQntQlXau1k+2RCGIBdUtSd14/Nz/4RE0Yo8hrKFoTmgB066bZmOI3rFebcklpV4dndHF+7ALUaribv5CvW43lVqZweU3YqZVZAyNhaK5oarQAvq3k5P1entOBqDkz9igXS/grjfG2SHZy7NxJ4wlJdUe4qE0eL1mKaoITcbRwaLXCCInO44imybXO4gQA4ade2KctJGQoITEuDaCg7aLGMaZ5B/PualbKLQZLk+ZQIPRd5so8oAmiMK4t6FjPJ2C13PG774KV/3AYsJdBivQTYhUkesAK7CaP+YhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0msHRFxtfoEqNhwy7J5lq7DjjcGop0lkwTCN9NYNXg=;
 b=SExYNLIFbWvHWr/feMrwebOP+GPg8VpBCMFLAy+70MSGnGHv8nawphMJDfdbtytzFzKAtSDmg8L4TmvhotTEVcrQWBF7kBEhqDGqdciagXxfVBpkKtF/9V+Avoz7z3WdlrwJcij9D/LZKtROELy5/LM65m28iTYA5C1Uc1fHbTs=
Received: from BYAPR21MB1688.namprd21.prod.outlook.com (2603:10b6:a02:bf::26)
 by SJ1PR21MB3762.namprd21.prod.outlook.com (2603:10b6:a03:451::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.5; Mon, 31 Jul
 2023 04:05:41 +0000
Received: from BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::b588:458f:b0dd:8b9f]) by BYAPR21MB1688.namprd21.prod.outlook.com
 ([fe80::b588:458f:b0dd:8b9f%3]) with mapi id 15.20.6652.004; Mon, 31 Jul 2023
 04:05:41 +0000
From:   "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
CC:     "x86@kernel.org" <x86@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Arjan van de Ven <arjan@linux.intel.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        James Smart <james.smart@broadcom.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Huang Rui <ray.huang@amd.com>, Juergen Gross <jgross@suse.com>,
        Steve Wahl <steve.wahl@hpe.com>,
        Mike Travis <mike.travis@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>
Subject: RE: [patch v2 21/38] x86/cpu: Provide cpu_init/parse_topology()
Thread-Topic: [patch v2 21/38] x86/cpu: Provide cpu_init/parse_topology()
Thread-Index: AQHZwU0WNJnrG48S4EOlGyY6cNlaEa/TN7UQ
Date:   Mon, 31 Jul 2023 04:05:39 +0000
Message-ID: <BYAPR21MB16889FD224344B1B28BE22A1D705A@BYAPR21MB1688.namprd21.prod.outlook.com>
References: <20230728105650.565799744@linutronix.de>
 <20230728120930.839913695@linutronix.de>
In-Reply-To: <20230728120930.839913695@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=00b9280d-b7f1-4469-b43c-d4e519118d3f;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-07-31T03:14:45Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR21MB1688:EE_|SJ1PR21MB3762:EE_
x-ms-office365-filtering-correlation-id: 9b2b003b-f86d-4fb9-f519-08db917b6715
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfIUvaGmhSdMFFZiTe69NBoJHQHKvrzdODqYR0UGVZgnatL4SZb37NSKi49Tbrh86rKDdGTuAhP2JuwfcO5992yoCp5iIuiWezXSO0fOSPT6WYmOt0eJmMSfWOHL5wSIlyOHd1KGWh0TH9oMCJRphYSgwO8RbRFLbtES+FqO1MmREdnU6yP2+c3vNL2LOqH0dJlD9mwlpHK75pDt3otk9i1aUXpyYULiYZPrr6bNZzzefzUDpMVrvUKzkNbyHE2t3HPd2KElegeNU+IAo7DlfdsqL32HmW8vzaqi6J7UboNuHmbcOGVTazMTyKZIqXebNA7F5UisEijmvb9AKLxYIKIR69q/QdgK7EJYNkatjAEsUGqrosgapKYUWu44WD9+HCC4ngLAG3TpWekOTuICmlA5SmUCv1EN8JvG0TGWGO8Aa9h++qu1d+856H4+jvwH5r9osb4xh8ZsbbITntl1C9ojbCvbJ3O/fnt0CxygYLid55kkM4yAuGNgRfuQt5WcyeVTr9xDYd1QZr6A8r6tFKC8KaOme0QmuFEU0s4AanOY80DWlBxlOGDAuKNk+Ox9Aj73/s32ZYuZwe21KGdTJhIP+q4li13DHEiHIIrfda8+icf9sqQq9IR7XvoZkNT5vxVP8oiprhEQMUxnLfQG/uATe3sczRS3azw7HlS8yRk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR21MB1688.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199021)(52536014)(7416002)(5660300002)(66476007)(4326008)(76116006)(66446008)(66946007)(33656002)(66556008)(64756008)(316002)(786003)(38070700005)(8676002)(41300700001)(55016003)(8936002)(2906002)(110136005)(9686003)(54906003)(8990500004)(86362001)(122000001)(478600001)(38100700002)(82950400001)(7696005)(82960400001)(83380400001)(26005)(6506007)(186003)(10290500003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTVaL0Fzb1llQWI0OTJ6VXcyWTJqYXVFWFVXb2lDN0VkNHF4d2pKS2MyQlBh?=
 =?utf-8?B?ODZYam5Oc3hMbmEvLzZheUxyVmNuRzNqNnFJT2ZZdVIyRnBSYm5HZmdrd1VS?=
 =?utf-8?B?QkdUMVJQdi9oeUhGU0hDZFdkTGlQa3VNS2QxcXRGMUtiTjlGd0lBQXJjMTdh?=
 =?utf-8?B?TzAvVDNNaFVmS3k5TnhZdmVzVmsyYVYrQWJ0RkhIQ21TanlCMUw1ZFpoM1Ba?=
 =?utf-8?B?VDJkekd1N2Z1cE4vTGlBOUFwZkZ2TDJ2NFd0OFhPRy9tVUFIM2lsRkhJbi82?=
 =?utf-8?B?SkpmU1V5RnNsRkZOeWNKVnRpVEhMUThzRVNwQXRSU0NaYUJKMEh1WE0vcUV0?=
 =?utf-8?B?WUhMbFJ1WUFhYmF2aGZtejhJV1hhM2M2KzBzNktEQjhvNlVrYnl6NWpDQ3JX?=
 =?utf-8?B?OUtvWGR3QTE1Q0hsRVFpTUFocWEwbmdCdVg0NUJVK3Y2cXl5eVB1Vi9DZkFC?=
 =?utf-8?B?YWNqVFhCNGt0eXlhek1hQUVSc3ROeG1veDc4RU9kWFJTdFNSVGJzT3JaYUhM?=
 =?utf-8?B?VVlxS21HdkFhdGw1dFBjajlvZnBzS1NOT1FOSjJPTzlueGtmb1N4Mnp1OU1U?=
 =?utf-8?B?a2JBbzhiR0ZyTzdwemFOdS9VK0drdUY2NmVZYyswT25nOUh2RXM5b0Q4MXZw?=
 =?utf-8?B?cG02WVRyb01XclNvaHlBdTByNGhLbXZMbGVSckttam1jLy9LSHQzN1BFeFhl?=
 =?utf-8?B?ZFcyQmExeXROM2lqODhoemgvc01uWTBrOUZGcXdKakdudHdRY2UvKzFGREJh?=
 =?utf-8?B?clRYVi9lcCtrVDNOVkNSL0pzbTd0cmQzc2RieSthdVhBY3lXb21KRzVoSU0w?=
 =?utf-8?B?V0dJWmlzczlIUG9tWnFBL2FiWnNvNE9QZEtMbXgzaUJCVHpCMkNPakQyeUZ2?=
 =?utf-8?B?Vk5tVkNOUG01RU9NVGpCaG5aU0NKYXJIZFhobExGTVFwVEJmaW5iUkVFdEN5?=
 =?utf-8?B?ZlBHN0RORGZNWWxKK2JSRDZnR3VzN1JUd0VNeVVnUlhDWlRNV0xtc0hUazh0?=
 =?utf-8?B?MVZWUTJjMWN0TktTVittV0djNnVvRDJ0K0J6OWI1SldKaURMekk2dHRTQzVV?=
 =?utf-8?B?Y3F0L2NFeEFoV2graTVpY1g5SUh4bEFlUlVnWDRmSGtuNzhOS2pZYktJbHAw?=
 =?utf-8?B?VWxmS1pZWWVlNDNEWHNTUDFWMElwWCttK1hkS3RPcmlVQVJxVk5CbkNmSWtk?=
 =?utf-8?B?eWtJNDZKMjc5U2pCNklrT0RyQTIrUHRGSSt6dDcwMDFIZUlqMGFIelpwQWs3?=
 =?utf-8?B?S1JSUkxrTzlqT2ZjMFR6YUJMc3RYSFF5YmpZdm5FVFN4V1pnakZvR0VpdUtH?=
 =?utf-8?B?eCtjWEVCT1lQdFRmaE1ibGM5cEI1V0hvN1pCeEdCcXFSd2R2TEFwbUVVTngv?=
 =?utf-8?B?cWt3Y3FEZ09sWjA5WkIycENLSXg5QldPQ0tLNWx0dWRvSU02azE2dW45TWRE?=
 =?utf-8?B?V1hINmdUZDdtOXhKY0NtN1VZWU5jbXdOUlBDd3FraWcwTGFoRGNia1BMN0Z1?=
 =?utf-8?B?WXNNVFlkMjQzajdpRzVkUFRvTWRRaGIxMTdhUlVqSU1ocWRxSC9wcnd5VTMw?=
 =?utf-8?B?VkFiekl5TWZ4WUsyKzRQYjZxR2xrRTJHS2tKSHlQWTFUcVd1b0tKYVc2eXVk?=
 =?utf-8?B?eW1ZRnBhbzdiUDVCQ0JJR2hzb0xwVlRKSEU0OWo4NW85dWZEMG5PUTVSb291?=
 =?utf-8?B?RmJmTVBBcldCMFdLWkxxQ09SdlJ2MmM3WXg0T0ZNU1ZSL21mbUtKMXN4RGhO?=
 =?utf-8?B?Wm1UVHBvYjNNajhYcG14WWF2dVUxRDY5ZTFQWTNBZk1YWFluQ045aFplenpK?=
 =?utf-8?B?OFBWVkt6V1ZHci9KUXI4OEtEc2ZZTW9BaVZyUjBIU1h4MHFXcjB1blNEekc0?=
 =?utf-8?B?YTlFUzFEb2ZsUlE1Vm5kelJHNjNKTFdRaWVhR0RSSG52d0lhRmV0M080c2Qz?=
 =?utf-8?B?Q3pxM1ZzdzdERXJFbmpTb1l1VUNUOHl6ZkdhVkRRc1lsR1JweCtOUWFPNE1W?=
 =?utf-8?B?WHlQWld5Smw3VGV0WTY0Ti9GbEZFZW1abjRHT29Cbmx5c0FtY3ZXTXZkR1Qr?=
 =?utf-8?B?cUZtdmtidGI5NEI1SXVqSS82dEFSWXF2TzBPaGtzYnBrb3JrSGVETzVzdjhY?=
 =?utf-8?B?dC9kcmpteWQ5a0VwSm8vSFh3cFNoUVRPMEhiVEhrZ0xoUE55MUQ0VUJUaEdx?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1688.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2b003b-f86d-4fb9-f519-08db917b6715
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 04:05:39.9549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/H2sVRscBmW16EKI3iwQMAwBKl74/gvqtly0AP1kQtkRvrmrwdJLdF4ts+SrnNKGpqeshtAd9LxVg1hXNhZ7FTnmek3Hje1gdr4q4mVUBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR21MB3762
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

RnJvbTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IFNlbnQ6IEZyaWRheSwg
SnVseSAyOCwgMjAyMyA1OjEzIEFNDQo+IA0KPiBUb3BvbG9neSBldmFsdWF0aW9uIGlzIGEgY29t
cGxldGUgZGlzYXN0ZXIgYW5kIGltcGVuZXRyYWJsZSBtZXNzLiBJdCdzDQo+IHNjYXR0ZXJlZCBh
bGwgb3ZlciB0aGUgcGxhY2Ugd2l0aCBzb21lIHZlbmRvciBpbXBsZW1lbnRhdGlucyBkb2luZyBl
YXJseQ0KPiBldmFsdWF0aW9uIGFuZCBzb21lIG5vdC4gVGhlIG1vc3QgaG9ycmlmaWMgcGFydCBp
cyB0aGUgcGVybWFuZW50DQo+IG92ZXJ3cml0aW5nIG9mIHNtdF9tYXhfc2libGluZ3MgYW5kIF9f
bWF4X2RpZV9wZXJfcGFja2FnZSwgaW5zdGVhZCBvZg0KPiBlc3RhYmxpc2hpbmcgdGhlbSBvbmNl
IG9uIHRoZSBib290IENQVSBhbmQgdmFsaWRhdGluZyB0aGUgcmVzdWx0IG9uIHRoZQ0KPiBBUHMu
DQo+IA0KPiBUaGUgZ29hbHMgYXJlOg0KPiANCj4gICAtIE9uZSB0b3BvbG9neSBldmFsdWF0aW9u
IGVudHJ5IHBvaW50DQo+IA0KPiAgIC0gUHJvcGVyIHNoYXJpbmcgb2YgcG9pbnRsZXNzbHkgZHVw
bGljYXRlZCBjb2RlDQo+IA0KPiAgIC0gUHJvcGVyIHN0cnVjdHVyaW5nIG9mIHRoZSBldmFsdWF0
aW9uIGxvZ2ljIGFuZCBwcmVmZXJlbmNlcy4NCj4gDQo+ICAgLSBFdmFsdWF0aW5nIGltcG9ydGFu
dCBzeXN0ZW0gd2lkZSBpbmZvcm1hdGlvbiBvbmx5IG9uY2Ugb24gdGhlIGJvb3QgQ1BVDQo+IA0K
PiAgIC0gTWFraW5nIHRoZSAweGIvMHgxZiBsZWFmIHBhcnNpbmcgbGVzcyBjb252b2x1dGVkIGFu
ZCBhY3R1YWxseSBmaXhpbmcNCj4gICAgIHRoZSBzaG9ydCBjb21pbmdzIG9mIGxlYWYgMHgxZiBl
dmFsdWF0aW9uLg0KPiANCj4gU3RhcnQgdG8gY29uc29saWRhdGUgdGhlIHRvcG9sb2d5IGV2YWx1
YXRpb24gY29kZSBieSBwcm92aWRpbmcgdGhlIGVudHJ5DQo+IHBvaW50cyBmb3IgdGhlIGVhcmx5
IGJvb3QgQ1BVIGV2YWx1YXRpb24gYW5kIGZvciB0aGUgZmluYWwgcGFyc2luZyBvbiB0aGUNCj4g
Ym9vdCBDUFUgYW5kIHRoZSBBUHMuDQo+IA0KPiBNb3ZlIHRoZSB0cml2aWFsIHBpZWNlcyBpbnRv
IHRoYXQgbmV3IGNvZGU6DQo+IA0KPiAgICAtIFRoZSBpbml0aWFsaXphdGlvbiBvZiBjcHVpbmZv
X3g4Njo6dG9wbw0KPiANCj4gICAgLSBUaGUgZXZhbHVhdGlvbiBvZiBDUFVJRCBsZWFmIDEsIHdo
aWNoIHByZXNldHMgdG9wbzo6aW5pdGlhbF9hcGljaWQNCj4gDQo+ICAgIC0gdG9wb19hcGljaWQg
aXMgc2V0IHRvIHRvcG86OmluaXRpYWxfYXBpY2lkIHdoZW4gaW52b2tlZCBmcm9tIGVhcmx5DQo+
ICAgICAgYm9vdC4gV2hlbiBpbnZva2VkIGZvciB0aGUgZmluYWwgZXZhbHVhdGlvbiBvbiB0aGUg
Ym9vdCBDUFUgaXQgcmVhZHMNCj4gICAgICB0aGUgYWN0dWFsIEFQSUMgSUQsICB3aGljaCBtYWtl
cyBhcGljX2dldF9pbml0aWFsX2FwaWNpZCgpIG9ic29sZXRlDQo+ICAgICAgb25jZSBldmVyeXRo
aW5nIGlzIGNvbnZlcnRlZCBvdmVyLg0KDQo+IA0KPiBQcm92aWRlIGEgdGVtcG9yYXJ5IGhlbHBl
ciBmdW5jdGlvbiB0b3BvX2NvbnZlcnRlZCgpIHdoaWNoIHNoaWVsZHMgb2ZmIHRoZQ0KPiBub3Qg
eWV0IGNvbnZlcnRlZCBDUFUgdmVuZG9ycyBmcm9tIGludm9raW5nIGNvZGUgd2hpY2ggd291bGQg
YnJlYWsgdGhlbS4NCj4gVGhpcyBzaGllbGRpbmcgY292ZXJzIGFsbCB2ZW5kb3IgQ1BVcyB3aGlj
aCBzdXBwb3J0IFNNUCwgYnV0IG5vdCB0aGUNCj4gaGlzdG9yaWNhbCBwdXJlIFVQIG9uZXMgYXMg
dGhleSBvbmx5IG5lZWQgdGhlIHRvcG9sb2d5IGluZm8gaW5pdCBhbmQNCj4gZXZlbnR1YWxseSB0
aGUgaW5pdGlhbCBBUElDIGluaXRpYWxpemF0aW9uLg0KPiANCj4gUHJvdmlkZSB0d28gbmV3IG1l
bWJlcnMgaW4gY3B1aW5mb194ODY6OnRvcG8gdG8gc3RvcmUgdGhlIG1heGltdW0gbnVtYmVyIG9m
DQo+IFNNVCBzaWJsaW5ncyBhbmQgdGhlIG51bWJlciBvZiBkaWVzIHBlciBwYWNrYWdlIGFuZCBh
ZGQgdGhlbSB0byB0aGUgZGVidWdmcw0KPiByZWFkb3V0LiBUaGVzZSB0d28gbWVtYmVycyB3aWxs
IGJlIHVzZWQgdG8gcG9wdWxhdGUgdGhpcyBpbmZvcm1hdGlvbiBvbiB0aGUNCj4gYm9vdCBDUFUg
YW5kIHRvIHZhbGlkYXRlIHRoZSBBUHMgYWdhaW5zdCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPiAtLS0NCj4gIGFyY2gveDg2
L2luY2x1ZGUvYXNtL3RvcG9sb2d5LmggICAgICAgfCAgIDE5ICsrKw0KPiAgYXJjaC94ODYva2Vy
bmVsL2NwdS9NYWtlZmlsZSAgICAgICAgICB8ICAgIDMNCj4gIGFyY2gveDg2L2tlcm5lbC9jcHUv
Y29tbW9uLmMgICAgICAgICAgfCAgIDIzICstLS0NCj4gIGFyY2gveDg2L2tlcm5lbC9jcHUvY3B1
LmggICAgICAgICAgICAgfCAgICA2ICsNCj4gIGFyY2gveDg2L2tlcm5lbC9jcHUvZGVidWdmcy5j
ICAgICAgICAgfCAgIDM3ICsrKysrKw0KPiAgYXJjaC94ODYva2VybmVsL2NwdS90b3BvbG9neS5o
ICAgICAgICB8ICAgMzIgKysrKysNCj4gIGFyY2gveDg2L2tlcm5lbC9jcHUvdG9wb2xvZ3lfY29t
bW9uLmMgfCAgMTg3DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDcg
ZmlsZXMgY2hhbmdlZCwgMjkwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCg0K
W3NuaXBdDQoNCj4gKw0KPiArc3RhdGljIHZvaWQgcGFyc2VfdG9wb2xvZ3koc3RydWN0IHRvcG9f
c2NhbiAqdHNjYW4sIGJvb2wgZWFybHkpDQo+ICt7DQo+ICsJY29uc3Qgc3RydWN0IGNwdWluZm9f
dG9wb2xvZ3kgdG9wb19kZWZhdWx0cyA9IHsNCj4gKwkJLmN1X2lkCQkJPSAweGZmLA0KPiArCQku
bGxjX2lkCQkJPSBCQURfQVBJQ0lELA0KPiArCQkubDJjX2lkCQkJPSBCQURfQVBJQ0lELA0KPiAr
CX07DQo+ICsJc3RydWN0IGNwdWluZm9feDg2ICpjID0gdHNjYW4tPmM7DQo+ICsJc3RydWN0IHsN
Cj4gKwkJdTMyCXVudXNlZDAJCTogMTYsDQo+ICsJCQlucHJvYwkJOiAgOCwNCj4gKwkJCWFwaWNp
ZAkJOiAgODsNCj4gKwl9IGVieDsNCj4gKw0KPiArCWMtPnRvcG8gPSB0b3BvX2RlZmF1bHRzOw0K
PiArDQo+ICsJaWYgKGZha2VfdG9wb2xvZ3kodHNjYW4pKQ0KPiArCSAgICByZXR1cm47DQo+ICsN
Cj4gKwkvKiBQcmVzZXQgSW5pdGlhbCBBUElDIElEIGZyb20gQ1BVSUQgbGVhZiAxICovDQo+ICsJ
Y3B1aWRfbGVhZl9yZWcoMSwgQ1BVSURfRUJYLCAmZWJ4KTsNCj4gKwljLT50b3BvLmluaXRpYWxf
YXBpY2lkID0gZWJ4LmFwaWNpZDsNCj4gKw0KPiArCS8qDQo+ICsJICogVGhlIGluaXRpYWwgaW52
b2NhdGlvbiBmcm9tIGVhcmx5X2lkZW50aWZ5X2NwdSgpIGhhcHBlbnMgYmVmb3JlDQo+ICsJICog
dGhlIEFQSUMgaXMgbWFwcGVkIG9yIFgyQVBJQyBlbmFibGVkLiBGb3IgZXN0YWJsaXNoaW5nIHRo
ZQ0KPiArCSAqIHRvcG9sb2d5LCB0aGF0J3Mgbm90IHJlcXVpcmVkLiBVc2UgdGhlIGluaXRpYWwg
QVBJQyBJRC4NCj4gKwkgKi8NCj4gKwlpZiAoZWFybHkpDQo+ICsJCWMtPnRvcG8uYXBpY2lkID0g
Yy0+dG9wby5pbml0aWFsX2FwaWNpZDsNCj4gKwllbHNlDQo+ICsJCWMtPnRvcG8uYXBpY2lkID0g
cmVhZF9hcGljX2lkKCk7DQoNClVzaW5nIHRoZSB2YWx1ZSBmcm9tIHRoZSBsb2NhbCBBUElDIElE
IHJlZyB0dXJucyBvdXQgdG8gY2F1c2UgYSBwcm9ibGVtIGluDQpzb21lIEh5cGVyLVYgVk0gY29u
ZmlndXJhdGlvbnMuICBJZiBhIFZNIGhhcyBtdWx0aXBsZSBMMyBjYWNoZXMgKHByb2JhYmx5DQpk
dWUgdG8gbXVsdGlwbGUgTlVNQSBub2RlcykgYW5kIHRoZSAjIG9mIENQVXMgaW4gdGhlIHNwYW4g
b2YgdGhlIEwzIGNhY2hlDQppcyBub3QgYSBwb3dlciBvZiAyLCB0aGUgQVBJQyBJRHMgZm9yIHRo
ZSBDUFVzIGluIHRoZSBzcGFuIG9mIHRoZSAxc3QgTDMgY2FjaGUNCmFyZSBzZXF1ZW50aWFsIHN0
YXJ0aW5nIHdpdGggMC4gIEJ1dCB0aGVuIHRoZXJlIGlzIGEgZ2FwIGJlZm9yZSBzdGFydGluZyB0
aGUNCkFQSUMgSURzIGZvciB0aGUgQ1BVcyBpbiB0aGUgc3BhbiBvZiB0aGUgMm5kIEwzIGNhY2hl
LiAgVGhlIGdhcCBpcw0KcmVwZWF0ZWQgaWYgdGhlcmUgYXJlIGFkZGl0aW9uYWwgTDMgY2FjaGVz
Lg0KDQpUaGUgQ1BVSUQgaW5zdHJ1Y3Rpb24gZXhlY3V0ZWQgb24gYSBndWVzdCB2Q1BVIGNvcnJl
Y3RseSByZXBvcnRzIHRoZSBBUElDDQpJRHMuICBIb3dldmVyLCB0aGUgQUNQSSBNQURUIGFzc2ln
bnMgdGhlIEFQSUMgSURzIHNlcXVlbnRpYWxseSB3aXRoIG5vDQpnYXBzLCBhbmQgdGhlIGd1ZXN0
IGZpcm13YXJlIHNldHMgdGhlIEFQSUNfSUQgcmVnaXN0ZXIgZm9yIGVhY2ggbG9jYWwgQVBJQw0K
dG8gbWF0Y2ggdGhlIE1BRFQuICBXaGVuIHBhcnNlX3RvcG9sb2d5KCkgc2V0cyB0aGUgYXBpY2lk
IGZpZWxkIGJhc2VkIG9uDQpyZWFkaW5nIHRoZSBsb2NhbCBBUElDIElEIHJlZ2lzdGVyLCB0aGUg
dmFsdWUgaXQgc2V0cyBpcyBkaWZmZXJlbnQgZnJvbSB0aGUNCmluaXRpYWxfYXBpY2lkIHZhbHVl
IGZvciBDUFVzIGluIHRoZSBzcGFuIG9mIHRoZSAybmQgYW5kIHN1YnNlcXVlbnQgTDMNCmNhY2hl
cywgYmVjYXVzZSB0aGVyZSdzIG5vIGdhcCBpbiB0aGUgQVBJQyBJRHMgcmVhZCBmcm9tIHRoZSBs
b2NhbCBBUElDLg0KTGludXggYm9vdHMgYW5kIHJ1bnMsIGJ1dCB0aGUgdG9wb2xvZ3kgaXMgc2V0
IHVwIHdpdGggdGhlIHdyb25nIHNwYW4gZm9yDQp0aGUgTDMgY2FjaGUgYW5kIGZvciB0aGUgYXNz
b2NpYXRlZCBzY2hlZHVsaW5nIGRvbWFpbnMuIA0KDQpUaGUgb2xkIGNvZGUgZGVyaXZlcyB0aGUg
YXBpY2lkIGZyb20gdGhlIGluaXRpYWxfYXBpY2lkIHZpYSB0aGUNCnBoeXNfcGtnX2lkKCkgY2Fs
bGJhY2ssIHNvIHRoZXNlIGJhZCBIeXBlci1WIFZNIGNvbmZpZ3Mgc2thdGUgYnkuICBUaGUNCndy
b25nIHZhbHVlIGluIHRoZSBsb2NhbCBBUElDIElEIHJlZ2lzdGVyIGFuZCBNQURUIGRvZXMgbm90
IGFmZmVjdA0KYW55dGhpbmcsIGV4Y2VwdCB0aGF0IHRoZSBjaGVjayBpbiB2YWxpZGF0ZV9hcGlj
X2FuZF9wYWNrYWdlX2lkKCkgZmFpbHMNCmR1cmluZyBib290LCBhbmQgYSBzZXQgb2YgIkZpcm13
YXJlIGJ1ZzoiIG1lc3NhZ2VzIGlzIGNvcnJlY3RseSBvdXRwdXQuDQoNClRocmVlIHRob3VnaHRz
Og0KDQoxKSAgQXJlIEh5cGVyLVYgVk1zIHRoZSBvbmx5IHBsYWNlIHdoZXJlIHRoZSBsb2NhbCBB
UElDIElEIHJlZ2lzdGVyIG1pZ2h0DQpoYXZlIGEgYm9ndXMgdmFsdWU/ICBQcm9iYWJseSBzbywg
YnV0IHlvdSBuZXZlciBrbm93IHdoYXQgbWlnaHQgY3Jhd2wgb3V0Lg0KDQoyKSBUaGUgbmF0dXJh
bCByZXNwb25zZSBpcyAiV2VsbCwgZml4IEh5cGVyLVYhIiAgSSBmaXJzdCBoYWQgdGhpcyBjb252
ZXJzYXRpb24NCndpdGggdGhlIEh5cGVyLVYgdGVhbSBhYm91dCA1IHllYXJzIGFnby4gIFNvbWUg
Y2FzZXMgb2YgdGhlIHByb2JsZW0gd2VyZQ0KZml4ZWQsIGJ1dCBzb21lIGNhc2VzIHJlbWFpbiB1
bmZpeGVkLiAgSXQncyBhIGxvbmcgc3RvcnkuDQoNCjMpICBTaW5jZSBIeXBlci1WIGNvZGUgaW4g
TGludXggYWxyZWFkeSBoYXMgYW4gb3ZlcnJpZGUgZm9yIHRoZSBhcGljLT5yZWFkKCkNCmZ1bmN0
aW9uLCBpdCdzIHBvc3NpYmxlIHRvIGRvIGEgaGFjayBpbiB0aGF0IG92ZXJyaWRlIHNvIHRoYXQg
YXBpY2lkIGdldHMgc2V0IHRvDQp0aGUgc2FtZSB2YWx1ZSBhcyBpbml0aWFsX2FwaWNpZCwgd2hp
Y2ggbWF0Y2hlcyB0aGUgb2xkIGNvZGUuICBIZXJlJ3MgdGhlIGRpZmY6DQoNCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9oeXBlcnYvaHZfYXBpYy5jIGIvYXJjaC94ODYvaHlwZXJ2L2h2X2FwaWMuYw0K
aW5kZXggNzJkOTkzMWRhM2EyLi4yZTdiMTg1NTcxODYgMTAwNjQ0DQotLS0gYS9hcmNoL3g4Ni9o
eXBlcnYvaHZfYXBpYy5jDQorKysgYi9hcmNoL3g4Ni9oeXBlcnYvaHZfYXBpYy5jDQpAQCAtNTgs
NiArNTgsOCBAQCBzdGF0aWMgdTMyIGh2X2FwaWNfcmVhZCh1MzIgcmVnKQ0KICAgICAgICB1MzIg
cmVnX3ZhbCwgaGk7DQoNCiAgICAgICAgc3dpdGNoIChyZWcpIHsNCisgICAgICAgY2FzZSBBUElD
X0lEOg0KKyAgICAgICAgICAgICAgIHJldHVybiBfX3RoaXNfY3B1X3JlYWQoY3B1X2luZm8udG9w
by5pbml0aWFsX2FwaWNpZCkgPDwgMjQ7DQogICAgICAgIGNhc2UgQVBJQ19FT0k6DQogICAgICAg
ICAgICAgICAgcmRtc3IoSFZfWDY0X01TUl9FT0ksIHJlZ192YWwsIGhpKTsNCiAgICAgICAgICAg
ICAgICAodm9pZCloaTsNCkBAIC0zMTEsNiArMzEzLDcgQEAgdm9pZCBfX2luaXQgaHZfYXBpY19p
bml0KHZvaWQpDQogICAgICAgICAgICAgICAgICogYm90aCB4YXBpYyBhbmQgeDJhcGljIGJlY2F1
c2UgdGhlIGZpZWxkIGxheW91dCBpcyB0aGUgc2FtZS4NCiAgICAgICAgICAgICAgICAgKi8NCiAg
ICAgICAgICAgICAgICBhcGljX3VwZGF0ZV9jYWxsYmFjayhlb2ksIGh2X2FwaWNfZW9pX3dyaXRl
KTsNCisgICAgICAgICAgICAgICBhcGljLT5hcGljX2lkX3JlZ2lzdGVyZWQgPSBOVUxMOw0KICAg
ICAgICAgICAgICAgIGlmICgheDJhcGljX2VuYWJsZWQoKSkgew0KICAgICAgICAgICAgICAgICAg
ICAgICAgYXBpY191cGRhdGVfY2FsbGJhY2socmVhZCwgaHZfYXBpY19yZWFkKTsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGFwaWNfdXBkYXRlX2NhbGxiYWNrKHdyaXRlLCBodl9hcGljX3dyaXRl
KTsNCg0KU2V0dGluZyBhcGljLT5hcGljX2lkX3JlZ2lzdGVyZWQgdG8gTlVMTCBpcyBuZWNlc3Nh
cnkgYmVjYXVzZSBpdCBkb2VzDQpyZWFkX2FwaWNfaWQoKSBhbmQgY2hlY2tzIHRoYXQgdGhlIHZh
bHVlIG1hdGNoZXMgYW4gQVBJQyBJRCB0aGF0IHdhcw0KcmVnaXN0ZXJlZCB3aGVuIHRoZSBNQURU
IHdhcyBwYXJzZWQuICBUaGlzIHRlc3QgZmFpbHMgZm9yIHNvbWUgdkNQVXMNCmluIHRoZSBWTSBi
ZWNhdXNlIHRoZSBBUElDIElEcyBmcm9tIHRoZSBNQURUIGFyZSBhbHNvIHNlcXVlbnRpYWwNCndp
dGggbm8gZ2FwcyBhcyBtZW50aW9uZWQgYWJvdmUuIEkgZG9uJ3Qgc2VlIGFueSBiaWcgaGF6YXJk
IGluDQpieXBhc3NpbmcgdGhlIGNoZWNrLg0KDQpUaGUgaHZfYXBpY19yZWFkKCkgb3ZlcnJpZGUg
aXMgdXNlZCBvbmx5IGluIFZNcyB3aXRoIGFuIHhhcGljLg0KSSBzdGlsbCBuZWVkIHRvIGNoZWNr
IGEgZmV3IHRoaW5ncywgYnV0IEkgYmVsaWV2ZSBIeXBlci1WIGdldHMNCk1BRFQgYW5kIGxvY2Fs
IEFQSUMgSUQgcmVnIG51bWJlcmluZyBjb3JyZWN0IHdoZW4gYW4geDJhcGljDQppcyB1c2VkLCBz
byBJIGRvbid0IHRoaW5rIGFueSBoYWNrcyBhcmUgbmVlZGVkIGZvciB0aGF0IHBhdGguDQoNCkRv
ZXMgYW55b25lIGhhdmUgc3VnZ2VzdGlvbnMgb24gYSBkaWZmZXJlbnQgd2F5IHRvIGhhbmRsZQ0K
dGhpcyB0aGF0J3MgYmV0dGVyIHRoYW4gdGhlIGFib3ZlIGRpZmY/ICBPdGhlciB0aG91Z2h0cz8N
Cg0KTWljaGFlbA0K
