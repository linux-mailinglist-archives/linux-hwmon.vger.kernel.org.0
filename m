Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A357763270B
	for <lists+linux-hwmon@lfdr.de>; Mon, 21 Nov 2022 15:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbiKUO4U (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 21 Nov 2022 09:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbiKUO4A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Nov 2022 09:56:00 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D04BFCDFC1;
        Mon, 21 Nov 2022 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669041961; x=1700577961;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q87ARTflR8LiIhGNxbSwvpgmEhyGWuP5UjAY0VFX/Xs=;
  b=TvLbtRmAkV/8BItJTGM6CgLI4Bo/VzPnZZCG0u3Otd5JGZFAnhl5M5Bv
   yyCqhMfbCViV/z1mF4Mpl8rYfDDgOxvDpD+0qAdSz9qvMvwEhvQy6Tzpu
   QZWUOmCgwqVs8yaR+aolX44+F0MPz0B/ASHgTbcVm3unl7Lwf2NYUWnmk
   NgBWEqgvDDQOIdMHkEZkTxaFo7ssZmPsNjIaROJY6QzdkagjlyeWlmDBS
   EdFhRX2gQpGEJ4RcGe5Gp8YjKo+sk4KINEpfcGPAB1kNNNzVIm0Z5Jky5
   pEQlofZIM5wh/5AzWWQ9FbkZdppvzGBhFx2q0Nc2M95ZCQCJkMDqy0TD0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="340432775"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="340432775"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 06:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="641040627"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="641040627"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2022 06:46:01 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 06:46:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 06:45:59 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 06:45:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 06:45:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMxhC3dsVPt+ghr3bsy70c864vfO+XwF+wMaW4E1Q/xEjkDV4Cfv1ZTpCURSVjxyvAXdTcvLK6yhVYh612kQqIWAoO98jGHION9Q1rzQZrcxVszBctup8yROEJNVjX91MW/svdRNRKAP8WZubYuvOa1l5X0B4tR+GKiz/no+UpfJzlWxcp4nI3MrgRo068uXylndBZhUDh/qPNHeUrm2lqMAC95ct1t2+VYTMXMmxNTFJQmvUCTZqCopo+LQuMfAXfHQfhWYM8T1Jw7vkivIgoW9O8HmcGXrTq2CGzJ3FHVSvgd3U4eMK/m+E/VDww9cNtP5C0WEyZBbR8K84dQQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q87ARTflR8LiIhGNxbSwvpgmEhyGWuP5UjAY0VFX/Xs=;
 b=GPB8QBeybYj38r+Dl5Yi9vJaKJF3R4bo54biRvZIoTsKBghbLYyTwqkQDGokgJWpcP12WcWftoogEW23LbbK1xUrK0nFnIel/NyXOu/GZe6zxO56dTF/A1Rh8WqTmEJw5poNC7Oz//la0QPpbTOZlMZRsjFtVw7lOX8sYbVg1XSUsOha3cPJ3du27ir+fqH53xurOgn+WnZRfMu5ZDlEryZIQQnE6selyS16gCydj/TBpEe2iTQAYAvUNH/GZzQBax195gN/lCRx2O42nSZcmKk3uuRlD2mQXtKzBqaRtUJobP8XGoRw7Lyp4SO8nOaj1iYEJ6chZJuaHn7Gx7YjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 14:45:56 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::5fab:ad47:5241:6c46]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::5fab:ad47:5241:6c46%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 14:45:56 +0000
From:   "Khandelwal, Rajat" <rajat.khandelwal@intel.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
CC:     "lars@metafoo.de" <lars@metafoo.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v9] iio: temperature: Add driver support for Maxim
 MAX30208
Thread-Topic: [PATCH v9] iio: temperature: Add driver support for Maxim
 MAX30208
Thread-Index: AQHY83prySPO8ZzoQUmhzBOUNY1BsK48xOeAgAZ2DaCABkcuYA==
Date:   Mon, 21 Nov 2022 14:45:56 +0000
Message-ID: <CO1PR11MB48355839B598C1381D8B61AF960A9@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20221109135949.734180-1-rajat.khandelwal@linux.intel.com>
 <20221113114905.2b2dd891@jic23-huawei>
 <CO1PR11MB483513883EAFED0AD6F2D4B596069@CO1PR11MB4835.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB483513883EAFED0AD6F2D4B596069@CO1PR11MB4835.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|DM4PR11MB5231:EE_
x-ms-office365-filtering-correlation-id: 5fe601a4-dddb-41a0-923f-08dacbcf18e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x3RmT8N9K88g1Vc6b+y/yg3NqIU9SZA7dq+LoGBmCt/Rpw1hA5nrL7IIaqL/OdDLnxuHTS+BNqcmzVPHZUAJ7UPS645sgtaN26zHrZd0LQCaIVd3KLZSs1JEUKoW+4SxmhRxLWZ9seVH0dPXseOEZwDstKMZW8VuMxaohY5z0oiq1Wda3YkiWG4lYJkHN5TLKu5G8moYNCxPz/cCIfGBRxVpZzaP2D7XOPbmf88NnMJZriiwidXAJcu/BqFbp3WiAYCqq0oX9LS1p8jx9I1RaBKa4fwcGW5H3XOJCNPyIIP7QgvuU0pJfi3s8YOOMAvRlA+pd9Cq78eXW/1IOxlfu/xUXOzCnRYB5EmW+IylaBGG/vM5H48Zd4oGPYyStWVCXCqYhtKC5SAiaMjwJD8VQHhfGrqtOwmaVQ5hbGDP4MS5LecvLNzI0hd9MQV/oRW5gwEPjSUDITqiWpkAh84X/H5BzXc57wSp3+fEQ1q6ts2Bgn/qkL2beiR85wgVCSNgp95mEbWtkJWgPbAfBGTNeeoLbNl5wj9typ5Z5lcBhAUwbN+lzeQ0eZzkU5WpYrqKjgN+Rz1/WmjdHeKsjMmq9HW/mlBZJR0oqAGuRU977054RVuNJWUj+AuaPuco+akeVjekL8fqvIX72qMxUogS1Q44j1ubb2MqOHsNjoo43bImE01zE+/9vrA4Jyr2gBVN0uqhlsbYRsyJz3ouYBWiseCe0h9KVqoOTml8fz7naJ/eJo1MoE3aZPXSh58Zhba5ZiNq6DqXb7mQfLlj3TZV8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(8936002)(30864003)(5660300002)(54906003)(966005)(53546011)(110136005)(52536014)(478600001)(6506007)(7696005)(186003)(316002)(38070700005)(9686003)(2906002)(86362001)(82960400001)(38100700002)(83380400001)(8676002)(66476007)(26005)(71200400001)(66446008)(66556008)(64756008)(4326008)(55016003)(41300700001)(76116006)(66946007)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjYwcWEvaWtwbXY2U0IxaEh5V3g0OHpLazlHMVZWVm5INE5YNFlqQkxkRU9Q?=
 =?utf-8?B?QUxhUWZ1VUdBZnphZHp6eEpuNXlidm1rVkJjQW9NVTAvZEJlTGtlOXhEb0ww?=
 =?utf-8?B?WFNIU0hTbVVXQTlMSjhqS3VRZjh3dXpiblFyUzBiYjNmeWp3TlNIZ1B5Y0hO?=
 =?utf-8?B?anZ3RmIwcjVxN3M1SUF4QjhOcHdWclZTcS82RkgvVFZIdStjTnAzSmNXT2Vm?=
 =?utf-8?B?NnBDa1pObzF6N2U0RUpSU1E4eCtVUUEzdmhIa1k3UWc4ZjAzSSswejFKVmFH?=
 =?utf-8?B?MjQxOThuVVhBVy9TWUlrQU04K200RUMvRzZjNHBCSUxRRENaY0FuMjI1d3N1?=
 =?utf-8?B?WWl2OHcvbC82eVhpZFVCZlVOUy9mSG5kR2JWR0ZQRGJRc0tKVXBBZTB5UDcr?=
 =?utf-8?B?YUVtT0VQS0RGcFNNWEhxR051Uk56MmpKSGJQZVhyMmo1eURaWTJzM0J1dlZz?=
 =?utf-8?B?UWVMazB6Uk1OVEhURFk4SmZYZ0FFVzdZV0pBRzIyaGIvbUtreE9UNS9YMHZw?=
 =?utf-8?B?WUdwS2NGNkwrM2sza3FIaXhBYmxTMXBneHgzbWdGUVNpLy9KUTlQaCs1Mk4w?=
 =?utf-8?B?a0FSTkJuNXBia3VqNitMUVFuZXhqbVVhTEk4aEhERXAwLzFSZlN4dGI4RDVZ?=
 =?utf-8?B?ZDliMW5oKzZka1gxbVh1OGIxTzYwSzVkRk5pYkZUVVRYRXJhLyt5SUhsb1Nh?=
 =?utf-8?B?WmJsRXFJc0hLTTVVNzA5a0lGdGtPVjNxUUZOOWVVdUc2MUhud0hwM25nNk42?=
 =?utf-8?B?MzNEYmtrT3Z2d3djejczaGVaWTMyNEUwZWFQM2UxekZDSXMzMkpZSzdQemNx?=
 =?utf-8?B?eXpkaVREL3Zrd2Rkbm5lVVdPd3ZQcUhUdUoyZUJZbUdFNURTc2VrbTFVOXNW?=
 =?utf-8?B?UVBuNnZKT2dGUWd4d0lEM2h1dnhlWCtLS2tqSUFoeEV3aFdOR1pXQVFPV0dH?=
 =?utf-8?B?RXU2T1hJZUduOWZaUlZsSXltNWNNQmpmbnBMejRYbk0xbmFidnJpdXFmanBV?=
 =?utf-8?B?ZFJieS9taklLV09xMlIzZGdwL3ZlN0VWTHNtekhsZFA2ekFnL0lOeUs3SHQ5?=
 =?utf-8?B?S09YajNPRVZqaXI1aGYrU1BkTFJTbDM3d3hBek8wM1pnRmhISCtFbVVZRzVU?=
 =?utf-8?B?bVcwREN2UERhaW50Z04zdWw5M09NTWdaRnNwYkV2aWJKcTNXR2dKTitLS2E3?=
 =?utf-8?B?Qk9vSkgvbDFkNG5GUlBteC85bEVIOUtDY250eUFoRjR0RFhnZ3BsZGZjMkVj?=
 =?utf-8?B?dnhaTmE4UXNaSTB0azZpUzlxQVREQUVnSWFnZmI3cWU4Z2tpTnJBbkh0bnIw?=
 =?utf-8?B?Y2s2WnR1R09KbnZSRUxBOVlqRUZOUGc1cFFCMm93SFo5bXd6cjV4cEpaLzdl?=
 =?utf-8?B?WVdwWjg5eUUrb1MxK2dubUhKcHZpSDlFQ2VqZHF1SFV5K25kdVBjNUw0cEty?=
 =?utf-8?B?Rm5EaWRvU3lNQUNzV240Z05sOUVrRGZMZDlHWG1jNmppeXpmOHljVENpbzlu?=
 =?utf-8?B?SjgvKzNta3RpOFBheHI3dE1BV1l5dW5mSEJRUTJzbFlxL3BhSlpuZkpGcGJq?=
 =?utf-8?B?VDFCUUhWL3lYeUo3cFFlajFhOWM0V0JaaVk0dWgwYlhId2twbHF6Vm9VaE1s?=
 =?utf-8?B?Zkl4ckJOUHBpa1JETXF2cHZibDVsd0VXVWRJQWxpSytZdmwzWXRxOXJ3eVFp?=
 =?utf-8?B?eGVzazdwKzZKV2J0dSt2bjJ4Skdad1FMNWY0dmhpNVE0UjJiZE9XdWx2blJu?=
 =?utf-8?B?R0JCb2tEVXZvSW8xS1ptcFhqQUFhdmgyMEZQNE9xcG9HQm5qSHRMYndOK0JC?=
 =?utf-8?B?dlNCRjNUUUFWVW5IMEFqSUtCV25ka05wVXZ0R0ZwWHlqU0tCTVQ2TEc5ZCtK?=
 =?utf-8?B?ZnFOeHhvekh0dDBZb01EeUwzRWFQM3JxL2Z5SEIrWlNYWExsSmtCOXZLelJ3?=
 =?utf-8?B?OEtZL3F4UStsM0hBcHFwcEk3ajAzTDJDbDlHeEdRczZ5TmkvZEFSeW01Z3hy?=
 =?utf-8?B?QWVJb1JFN3FvdFczS2g4WDJFSUlpbEpyNVFUbXVuRjlMeVRNRTNGaUlLYXp1?=
 =?utf-8?B?T1FxK0ErNm5QN1N3NWdOejJwUVhEUEJ5VjNuY2tlMGJxQmdwTExLbXZhUzBO?=
 =?utf-8?B?Q2lTTytySmFYUy92WHFZbmNTSlowemFKYWZTams5N1RmVmtJVkg5UWFxT0Y4?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe601a4-dddb-41a0-923f-08dacbcf18e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 14:45:56.2597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJ/U2uxKZCQ/UYoP1ZEzzQEgXmGJwg3QUSHz1tJuDNYC+tUuI265EuF+qjqomyIkLpgrO8pSRGuLcqdqqctVAGzlZzisFYrTXwFiX5Q4zh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGkgSm9uYXRoYW4sDQpJIGRvbuKAmXQga25vdyB3aHkgc2VuZGluZyBtYWlsIHRvIHlvdXIgbW9z
dCByZWNlbnQgb25lIGlzIGJvdW5jaW5nIGJhY2suIFRyaWVkIDMgdGltZXMgYW5kIGV2ZXJ5dGlt
ZQ0KaXQgc2F5cyAibm90IGRlbGl2ZXJlZCIuIA0KQW55d2F5cywgdGhpcyBpcyB5b3VyIGxhdGVz
dCBjb21tZW50IGxpbmsgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMTE3MTYzMDQw
LjAwMDAxZjVhQEh1YXdlaS5jb20vDQotPldpbGwgdGFrZSBjYXJlIG9mIHRoZSBibGFuayBsaW5l
cw0KMS4gUmVhZCBmaXJzdCB0aW1lLCBvdmVyZmxvdyBzZXQgc28gd2UgcmVhZCBsYXRlc3QgcmVz
dWx0IC0gbGVhdmluZw0KICAgMzEgYW5jaWVudCB2YWx1ZXMgaW4gdGhlIGZpZm8uDQoyLiBSZWFk
IGFnYWluIHJlYWxseSBxdWlja2x5IGFuZCBnZXQgdGhvc2UgYW5jaWVudCB2YWx1ZXMuDQotLT4g
VGhpcyB3b250IGhhcHBlbi4gQWZ0ZXIgdGhlIDMxIHJlYWRpbmdzLCB3aGVuZXZlciB1c2VyIHdv
dWxkIHJlcXVpcmUgYW5vdGhlciByZWFkaW5nLA0KY29udmVyc2lvbiB3b3VsZCBhZ2FpbiB0YWtl
IHBsYWNlIGFuZCByZWFkaW5nIHdpbGwgZ2V0IHN0b3JlZCBpbiBkYXRhIGJ1ZmZlci4gDQpGdXJ0
aGVyLCBJIGRvbuKAmXQgdGhpbmsgd2UgbmVlZCB0byBmbHVzaCB0aGUgYnVmZmVyIGV2ZXJ5dGlt
ZSBvdmVyZmxvdyBvY2N1cnMgc2luY2UgdGhlcmUNCndpbGwgYmUgbm8gaW1wYWN0IHRvIHVzZXIg
d2hlbiBoZSBkb2VzIHJlYWQuIEV2ZW4gZHVyaW5nIG92ZXJmbG93LCB0aGUgbGF0ZXN0IHJlYWRp
bmcgd2lsbA0KYmUganVzdCAxIHBvcCBhd2F5IGZyb20gdGhlIEZJRk8gYnVmZmVyLiANCkhhdmUg
dmVyaWZpZWQgaXQgZHVyaW5nIG11bHRpcGxlIGl0ZXJhdGlvbnMgaW4gbXkgc2V0dXAuIA0KT25l
IGFkZGl0aW9uYWwgaW5mbzogSSBwbGFuIHRvIGluY29ycG9yYXRlIGJ1ZmZlcmVkIGZsb3cgaW4g
SUlPIGxhdGVyIGFzIGRpc2N1c3NlZCBpbiBwcmV2aW91cyBtYWlscy4NCg0KTGV0IG1lIGtub3cg
YWJvdXQgYW55IG1vcmUgcXVlcmllcyBiZWZvcmUgSSBzZW5kIHYxMSB0YWtpbmcgY2FyZSBvZiB0
aGUgYmxhbmsgbGluZXMuDQoNClRoYW5rcw0KUmFqYXQNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IEtoYW5kZWx3YWwsIFJhamF0IA0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVy
IDE3LCAyMDIyIDg6NDQgUE0NClRvOiBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3Jn
PjsgUmFqYXQgS2hhbmRlbHdhbCA8cmFqYXQua2hhbmRlbHdhbEBsaW51eC5pbnRlbC5jb20+DQpD
YzogbGFyc0BtZXRhZm9vLmRlOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1p
aW9Admdlci5rZXJuZWwub3JnOyBqZGVsdmFyZUBzdXNlLmNvbTsgbGludXhAcm9lY2stdXMubmV0
OyBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0ggdjldIGlp
bzogdGVtcGVyYXR1cmU6IEFkZCBkcml2ZXIgc3VwcG9ydCBmb3IgTWF4aW0gTUFYMzAyMDgNCg0K
SGkgSm9uYXRoYW4sDQpJdCB0b29rIHRpbWUgZm9yIG1lIHRvIGFnYWluIGdvIGJhY2sgYW5kIGFu
YWx5emUgZXZlcnl0aGluZy4gOikgVGhlIHBhZ2UgMTYgb2YgdGhlIGRhdGFzaGVldCBpcyBhYnNv
bHV0ZWx5IGNvcnJlY3QuIElmIG92ZXJmbG93IGhhcHBlbnMsIHdlIHdpbGwgaGF2ZSBhIHRvdGFs
IG9mIDMyIHNhbXBsZXMgdG8gcmVhZCAtIG5vdCBkZW55aW5nIHRoYXQuIA0KSSB3aWxsIHRyeSB0
byBleHBsYWluIHdpdGggYW4gZXhhbXBsZSBoZXJlLg0KTGV0cyBzYXkgdGhlIHJlYWQgcG9pbnRl
ciBhbmQgd3JpdGUgcG9pbnRlciBhcmUgYm90aCBhdCAweDA0LiANCk5vdyBJIHRyaWdnZXJlZCB0
aGUgY29udmVyc2lvbiBzZXZlcmFsIHRpbWVzIHdoaWNoIGxlYWQgdG8gd3JpdGUgcG9pbnRlciBp
bmNyZWFzaW5nIHRvIDB4MzEgYW5kIHRoZW4gYWdhaW4gcm90YXRpbmcgYmFjayBhbmQgZmluaXNo
aW5nIGF0IDB4MDQuDQpOb3cgYWdhaW4gSSB0cmlnZ2VyZWQgdGhlIGNvbnZlcnNpb24gMiBtb3Jl
IHRpbWVzLiANCkF0IHRoaXMgdGltZSwgdGhlIG92ZXJmbG93IGNvdW50ZXIgd2lsbCByZWFkIC0g
Mi4gVGhpcyB0aW1lIEkgdGhvdWdodCB0aGF0IHZhbHVlcyBhdCAweDA0IGFuZCAweDA1IGFyZSBv
dmVyZmxvd2VkIGFuZCB3cml0ZSBwb2ludGVyIGNvbWVzIGF0IDB4MDYuIA0KQW5kIHRodXMgSSB3
YXMga2VlcGluZyB0aGUgZGF0YSBjb3VudCBhcyAyIGFuZCBwb3BwaW5nIG91dCAyIHZhbHVlcyB0
byByZWFjaCB0aGUgbGF0ZXN0IG9uZS4gDQoNCkhvd2V2ZXIsIEkgY2hlY2tlZCB0aGlzIHRpbWUg
dHJpZ2dlcmluZyB0aGUgY29udmVyc2lvbiBhIG15cmlhZCBhbW91bnQgb2YgdGltZXMuIEFjdHVh
bGx5LCBpZiB3cml0ZSBwb2ludGVyIGNvbWVzIGJhY2sgYXQgMHgwNCBhbmQgaWYgSSBhZ2FpbiB0
cmlnZ2VyIHRoZSBjb252ZXJzaW9ucywgdGhlIHZhbHVlIGF0IDB4MDQgb25seSBnZXRzIG92ZXJ3
cml0dGVuIHRoYXQgbWFueSB0aW1lcyBhbmQgd3JpdGUgcG9pbnRlciBzdGF5cyBhdCAweDA0LiBU
aHVzIHRyaWdnZXJpbmcgMiB0aW1lcyB3aWxsIHN0aWxsIGtlZXAgdGhlIHdyaXRlIHBvaW50ZXIg
YXQgMHgwNCBhbmQgbG9nIDIgaW4gb3ZlcmZsb3cgY291bnRlci4gDQpUaHVzIGFjdHVhbGx5LCBp
biBvcmRlciB0byByZWFjaCB0aGUgcmVjZW50IG1vc3QgdmFsdWUsIGl0IHdvbid0IGJlIDB4MDQg
ICsgb3ZlcmZsb3cgY291bnRlciwgcmF0aGVyIDB4MDQgaXRzZWxmIGFzIDB4MDQgZ2V0cyBvdmVy
d3JpdHRlbiBhZnRlciBGSUZPIGdldHMgZnVsbC4gDQoNCk9rLCBzbyBub3cgYWNjb3JkaW5nIHRv
IG1lLCBpZiBJIHdhbnQgdGhlIHJlY2VudCBtb3N0IHJlYWRpbmcsIEkgd291bGQgb25seSBoYXZl
IHRvIHBvcCAxIHRpbWUgdG8gcmVhZCB0aGUgdmFsdWUgYXQgMHgwNCB3aXRoIHJlYWQgcG9pbnRl
ciBpbmNyZWFzaW5nIHRvIDB4MDUgYW5kIG92ZXJmbG93IGNvdW50ZXIgY29taW5nIGJhY2sgdG8g
MC4gDQoNCkhhdmUgaW5jb3Jwb3JhdGVkIGluIHYxMCBmb3IgeW91ciBwZXJ1c2FsLiBBcG9sb2dp
ZXMgZm9yIHRoZSBpbmNvcnJlY3QgdW5kZXJzdGFuZGluZy4gSUlPIGlzIHJlbGF0aXZlbHkgbmV3
IGRvbWFpbiB0byBtZSBhbmQgaG93IHRoZXNlIGRldmljZXMgYmVoYXZlIGFuZCBkYXRhc2hlZXQg
aXMgbGFpZCBvdXQgZ2V0cyBpbnRlcnByZXRlZCBieSBtZSBzb21ldGltZXMgaW4gYSB3cm9uZyBt
YW5uZXIuIA0KDQpUaGFua3MNClJhamF0DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPg0KU2VudDogU3VuZGF5LCBO
b3ZlbWJlciAxMywgMjAyMiA1OjE5IFBNDQpUbzogUmFqYXQgS2hhbmRlbHdhbCA8cmFqYXQua2hh
bmRlbHdhbEBsaW51eC5pbnRlbC5jb20+DQpDYzogbGFyc0BtZXRhZm9vLmRlOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1paW9Admdlci5rZXJuZWwub3JnOyBqZGVsdmFyZUBz
dXNlLmNvbTsgbGludXhAcm9lY2stdXMubmV0OyBsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmc7
IEtoYW5kZWx3YWwsIFJhamF0IDxyYWphdC5raGFuZGVsd2FsQGludGVsLmNvbT4NClN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjldIGlpbzogdGVtcGVyYXR1cmU6IEFkZCBkcml2ZXIgc3VwcG9ydCBmb3Ig
TWF4aW0gTUFYMzAyMDgNCg0KT24gV2VkLCAgOSBOb3YgMjAyMiAxOToyOTo0OSArMDUzMA0KUmFq
YXQgS2hhbmRlbHdhbCA8cmFqYXQua2hhbmRlbHdhbEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
DQo+IE1heGltIE1BWDMwMjA4IGlzIGEgZGlnaXRhbCB0ZW1wZXJhdHVyZSBzZW5zb3Igd2l0aCAw
LjHCsEMgYWNjdXJhY3kuDQo+IA0KPiBBZGQgc3VwcG9ydCBmb3IgbWF4MzAyMDggZHJpdmVyIGlu
IGlpbyBzdWJzeXN0ZW0uDQo+IERhdGFzaGVldDogaHR0cHM6Ly9kYXRhc2hlZXRzLm1heGltaW50
ZWdyYXRlZC5jb20vZW4vZHMvTUFYMzAyMDgucGRmDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYWph
dCBLaGFuZGVsd2FsIDxyYWphdC5raGFuZGVsd2FsQGxpbnV4LmludGVsLmNvbT4NCg0KSGkgUmFq
YXQsDQoNCkFsb25nc2lkZSBzb21lIHRyaXZpYWwgc3R1ZmYgSSB3b3VsZCBoYXZlIGVpdGhlciBm
aXhlZCB1cCB3aGVuIGFwcGx5aW5nIG9yIG5vdCB3b3JyaWVkIGFib3V0Li4uDQoNClRoZSBvdmVy
ZmxvdyBjb3VudGVyIGhhbmRsaW5nIHN0aWxsIGxvb2tzIHdyb25nIHRvIG1lIGFuZCBkb2Vzbid0
IGZvbGxvdyB0aGUgcHNldWRvIGNvZGUgb24gcGFnZSAxNiBvZiB0aGUgZGF0YSBzaGVldDoNCkZJ
Rk9fREFUQSByZWFkIGV4YW1wbGUuDQoNCkkgdGhvdWdodCBhYm91dCBqdXN0IGFwcGx5aW5nIHRo
aXMgd2l0aCB0aGUgY2hhbmdlIEknbSBzdWdnZXN0aW5nLCBidXQgcHJvYmFibHkgYmV0dGVyIGlm
IHlvdSB0ZXN0IGl0IHdvcmtzIGFzIGV4cGVjdGVkIGFuZCBzcGluIGEgdjEwLg0KDQpUaGFua3Ms
DQoNCkpvbmF0aGFuDQoNCj4gLS0tDQo+IA0KPiB2OTogUmVwb3NpdGlvbmluZyByZWdpc3RlciBk
YXRhDQo+IA0KPiB2ODoNCj4gMS4gUmV0dXJuaW5nIHRpbWUgb3V0IGlmIGNvbnZlcnNpb24gZmFp
bHMgdG8gaGFwcGVuIDIuIFNldHRpbmcgDQo+IHJvbGxvdmVyIGJpdCB0byAnMScgdG8gYWxsb3cg
RklGTyBvdmVyd3JpdGluZyAzLiBEcm9wcGluZyBBQ1BJX1BUUg0KPiANCj4gdjc6DQo+IDEuIERy
b3BwZWQgR1BJT3MgdXNlIGZvciBub3cNCj4gMi4gRHJpdmVyIG5hbWUgc3RyaW5nIGRpcmVjdGx5
IHVzZWQNCj4gMy4gTXV0ZXggbG9jayBkZXNjcmlwdGlvbiBhZGRlZA0KPiA0LiBSZW1vdmVkIG5v
aXN5IGVycm9ycyBhbmQgb25seSBrZXB0IGVycm9ycyBvbiBsYXJnZXIgY29kZSBibG9ja3MgNS4g
DQo+IGRldl93YXJuIC0+IGRldl9lcnIgZm9yIHRlbXBlcmF0dXJlIGNvbnZlcnNpb24gZmFpbHVy
ZSA2LiBJbXByb3Zpc2VkIA0KPiB0aGUgbG9naWMgb2YgcG9wcGluZyBvdXQgdmFsdWVzIDcuIEZp
eGVkIGxpbmUgYnJlYWtzIDguDQo+IG1vZHVsZV9pMmNfZHJpdmVyDQo+IA0KPiB2NjogQ29udmVy
dGVkIHVzbGVlcF9yYW5nZSB0byBtc2xlZXAgYXMgZGVsYXkgaXMgcXVpdGUgbGFyZ2UNCj4gDQo+
IHY1Og0KPiAxLiBGaXhlZCBjb21tZW50IHBvc2l0aW9uIGluIG1heDMwMjA4X3JlcXVlc3QgMi4g
VXNlIG9mIGxvY2FsIHU4IA0KPiB2YXJpYWJsZSB0byBidWlsZCByZWdpc3RlciB2YWx1ZXMgMy4g
VXNpbmcgdTggaW5zdGVhZCBvZiBzOCBpbiANCj4gZGF0YV9jb3VudCA0LiBSZW1vdmVkIGdsb2Jh
bCBNQVgzMDIwOF9SRVNfTUlMTElDRUxDSVVTIDUuIFJlbW92ZWQgDQo+ICdjb21tYScgb24gTlVM
TCB0ZXJtaW5hdG9ycw0KPiANCj4gdjQ6IFZlcnNpb24gY29tbWVudHMgZ28gYmVsb3cgbGluZSBz
ZXBhcmF0b3Igb2Ygc2lnbmVkLW9mZi1ieQ0KPiANCj4gdjM6IFJlbGVhc2UgdGhlIG11dGV4IGxv
Y2sgYWZ0ZXIgZXJyb3IgZ2V0cyByZXR1cm5lZA0KPiANCj4gdjI6DQo+IDEuIFJlbW92ZWQgVE9E
Tw0KPiAyLiBSZW1vdmVkIHVubmVjZXNzYXJ5IGJsYW5rIHNwYWNlcw0KPiAzLiBDb3JyZWN0ZWQg
TUMtPk1JTExJQ0VMQ0lVUw0KPiA0LiBDb21tZW50cyBhZGRlZCB3aGVyZXZlciByZXF1aXJlZA0K
PiA1LiBkZXZfZXJyIG9uIGkyYyBmYWlscw0KPiA2LiBSZWFycmFuZ2VkIHNvbWUgZmxvd3MNCj4g
Ny4gUmVtb3ZlZCBQUk9DRVNTRUQNCj4gOC4gaW50IGVycm9yIHJldHVybiBvbiBncGlvIHNldHVw
DQo+IDkuIGRldmljZV9yZWdpc3RlciBhdCB0aGUgZW5kIG9mIHByb2JlIDEwLiBSZXR1cm4gb24g
dW5zdWNjZXNzZnVsIA0KPiByZXNldCAxMS4gYWNwaV9tYXRjaF90YWJsZSBhbmQgb2ZfbWF0Y2hf
dGFibGUgYWRkZWQgMTIuIE1pbm9yIHF1aXJrcw0KPiANCj4gIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvS2NvbmZp
ZyAgICB8ICAxMCArKw0KPiAgZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvTWFrZWZpbGUgICB8ICAg
MSArDQo+ICBkcml2ZXJzL2lpby90ZW1wZXJhdHVyZS9tYXgzMDIwOC5jIHwgMjUxDQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDI2OCBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvbWF4
MzAyMDguYw0KPiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMgaW5k
ZXgNCj4gZjEzOTBiODI3MGIyLi43ZjFmZDJlMzFiOTQgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlO
RVJTDQo+ICsrKyBiL01BSU5UQUlORVJTDQo+IEBAIC0xMjM3Myw2ICsxMjM3MywxMiBAQCBTOglN
YWludGFpbmVkDQo+ICBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxh
dG9yL21heGltLG1heDIwMDg2LnlhbWwNCj4gIEY6CWRyaXZlcnMvcmVndWxhdG9yL21heDIwMDg2
LXJlZ3VsYXRvci5jDQo+ICANCj4gK01BWElNIE1BWDMwMjA4IFRFTVBFUkFUVVJFIFNFTlNPUiBE
UklWRVINCj4gK006CVJhamF0IEtoYW5kZWx3YWwgPHJhamF0LmtoYW5kZWx3YWxAbGludXguaW50
ZWwuY29tPg0KPiArTDoJbGludXgtaWlvQHZnZXIua2VybmVsLm9yZw0KPiArUzoJTWFpbnRhaW5l
ZA0KPiArRjoJZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvbWF4MzAyMDguYw0KPiArDQo+ICBNQVhJ
TSBNQVg3NzY1MCBQTUlDIE1GRCBEUklWRVINCj4gIE06CUJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+DQo+ICBMOglsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lpby90ZW1wZXJhdHVyZS9LY29uZmlnIA0KPiBiL2RyaXZlcnMvaWlv
L3RlbXBlcmF0dXJlL0tjb25maWcgaW5kZXggZThlZDg0OWUzYjc2Li5lZDM4NGYzM2UwYzcNCj4g
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaWlvL3RlbXBlcmF0dXJlL0tjb25maWcNCj4gKysrIGIv
ZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvS2NvbmZpZw0KPiBAQCAtMTI4LDYgKzEyOCwxNiBAQCBj
b25maWcgVFNZUzAyRA0KPiAgCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBt
b2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlIHdpbGwNCj4gIAkgIGJlIGNhbGxlZCB0c3lzMDJkLg0K
PiAgDQo+ICtjb25maWcgTUFYMzAyMDgNCj4gKwl0cmlzdGF0ZSAiTWF4aW0gTUFYMzAyMDggZGln
aXRhbCB0ZW1wZXJhdHVyZSBzZW5zb3IiDQo+ICsJZGVwZW5kcyBvbiBJMkMNCj4gKwloZWxwDQo+
ICsJICBJZiB5b3Ugc2F5IHllcyBoZXJlIHlvdSBnZXQgc3VwcG9ydCBmb3IgTWF4aW0gTUFYMzAy
MDgNCj4gKwkgIGRpZ2l0YWwgdGVtcGVyYXR1cmUgc2Vuc29yIGNvbm5lY3RlZCB2aWEgSTJDLg0K
PiArDQo+ICsJICBUaGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYg
c28sIHRoZSBtb2R1bGUNCj4gKwkgIHdpbGwgYmUgY2FsbGVkIG1heDMwMjA4Lg0KPiArDQo+ICBj
b25maWcgTUFYMzE4NTYNCj4gIAl0cmlzdGF0ZSAiTUFYMzE4NTYgdGhlcm1vY291cGxlIHNlbnNv
ciINCj4gIAlkZXBlbmRzIG9uIFNQSQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vdGVtcGVy
YXR1cmUvTWFrZWZpbGUNCj4gYi9kcml2ZXJzL2lpby90ZW1wZXJhdHVyZS9NYWtlZmlsZQ0KPiBp
bmRleCBkZDA4ZTU2MmZmZTAuLmRmZWM4YzZkMzAxOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
aW8vdGVtcGVyYXR1cmUvTWFrZWZpbGUNCj4gKysrIGIvZHJpdmVycy9paW8vdGVtcGVyYXR1cmUv
TWFrZWZpbGUNCj4gQEAgLTcsNiArNyw3IEBAIG9iai0kKENPTkZJR19JUVM2MjBBVF9URU1QKSAr
PSBpcXM2MjBhdC10ZW1wLm8NCj4gIG9iai0kKENPTkZJR19MVEMyOTgzKSArPSBsdGMyOTgzLm8N
Cj4gIG9iai0kKENPTkZJR19ISURfU0VOU09SX1RFTVApICs9IGhpZC1zZW5zb3ItdGVtcGVyYXR1
cmUubw0KPiAgb2JqLSQoQ09ORklHX01BWElNX1RIRVJNT0NPVVBMRSkgKz0gbWF4aW1fdGhlcm1v
Y291cGxlLm8NCj4gK29iai0kKENPTkZJR19NQVgzMDIwOCkgKz0gbWF4MzAyMDgubw0KPiAgb2Jq
LSQoQ09ORklHX01BWDMxODU2KSArPSBtYXgzMTg1Ni5vDQo+ICBvYmotJChDT05GSUdfTUFYMzE4
NjUpICs9IG1heDMxODY1Lm8NCj4gIG9iai0kKENPTkZJR19NTFg5MDYxNCkgKz0gbWx4OTA2MTQu
bw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vdGVtcGVyYXR1cmUvbWF4MzAyMDguYw0KPiBi
L2RyaXZlcnMvaWlvL3RlbXBlcmF0dXJlL21heDMwMjA4LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xMDJlYjJiNzdkYmUNCj4gLS0tIC9kZXYvbnVsbA0K
PiArKysgYi9kcml2ZXJzL2lpby90ZW1wZXJhdHVyZS9tYXgzMDIwOC5jDQo+IEBAIC0wLDAgKzEs
MjUxIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ICsN
Cj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgKGMpIFJhamF0IEtoYW5kZWx3YWwgPHJhamF0LmtoYW5k
ZWx3YWxAbGludXguaW50ZWwuY29tPg0KPiArICoNCj4gKyAqIE1heGltIE1BWDMwMjA4IGRpZ2l0
YWwgdGVtcGVyYXR1cmUgc2Vuc29yIHdpdGggMC4xwrBDIGFjY3VyYWN5DQo+ICsgKiAoNy1iaXQg
STJDIHNsYXZlIGFkZHJlc3MgKDB4NTAgLSAweDUzKSkgICovDQo+ICsNCj4gKyNpbmNsdWRlIDxs
aW51eC9iaXRvcHMuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiArI2luY2x1ZGUg
PGxpbnV4L2lpby9paW8uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9pMmMuaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiArDQo+ICsj
ZGVmaW5lIE1BWDMwMjA4X1NUQVRVUwkJCTB4MDANCj4gKyNkZWZpbmUgTUFYMzAyMDhfU1RBVFVT
X1RFTVBfUkRZCUJJVCgwKQ0KPiArI2RlZmluZSBNQVgzMDIwOF9JTlRfRU5BQkxFCQkweDAxDQo+
ICsjZGVmaW5lIE1BWDMwMjA4X0lOVF9FTkFCTEVfVEVNUF9SRFkJQklUKDApDQo+ICsNCj4gKyNk
ZWZpbmUgTUFYMzAyMDhfRklGT19PVkZfQ05UUgkJMHgwNg0KPiArI2RlZmluZSBNQVgzMDIwOF9G
SUZPX0RBVEFfQ05UUgkJMHgwNw0KPiArI2RlZmluZSBNQVgzMDIwOF9GSUZPX0RBVEEJCTB4MDgN
Cj4gKw0KPiArI2RlZmluZSBNQVgzMDIwOF9GSUZPX0NPTkZJRwkJMHgwYQ0KPiArI2RlZmluZSBN
QVgzMDIwOF9GSUZPX0NPTkZJR19STwkJQklUKDEpDQo+ICsNCj4gKyNkZWZpbmUgTUFYMzAyMDhf
U1lTVEVNX0NUUkwJCTB4MGMNCj4gKyNkZWZpbmUgTUFYMzAyMDhfU1lTVEVNX0NUUkxfUkVTRVQJ
MHgwMQ0KPiArDQo+ICsjZGVmaW5lIE1BWDMwMjA4X1RFTVBfU0VOU09SX1NFVFVQCTB4MTQNCj4g
KyNkZWZpbmUgTUFYMzAyMDhfVEVNUF9TRU5TT1JfU0VUVVBfQ09OVglCSVQoMCkNCj4gKw0KPiAr
c3RydWN0IG1heDMwMjA4X2RhdGEgew0KPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQ7DQo+
ICsJc3RydWN0IGlpb19kZXYgKmluZGlvX2RldjsNCj4gKwlzdHJ1Y3QgbXV0ZXggbG9jazsgLyog
TG9jayB0byBwcmV2ZW50IGNvbmN1cnJlbnQgcmVhZHMgb2YgDQo+ICt0ZW1wZXJhdHVyZSByZWFk
aW5ncyAqLyB9Ow0KPiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19jaGFuX3NwZWMgbWF4
MzAyMDhfY2hhbm5lbHNbXSA9IHsNCj4gKwl7DQo+ICsJCS50eXBlID0gSUlPX1RFTVAsDQo+ICsJ
CS5pbmZvX21hc2tfc2VwYXJhdGUgPSBCSVQoSUlPX0NIQU5fSU5GT19SQVcpIHwgQklUKElJT19D
SEFOX0lORk9fU0NBTEUpLA0KPiArCX0sDQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIG1heDMw
MjA4X3JlcXVlc3QoKSAtIFJlcXVlc3QgYSByZWFkaW5nDQo+ICsgKiBAZGF0YTogU3RydWN0IGNv
bXByaXNpbmcgbWVtYmVyIGVsZW1lbnRzIG9mIHRoZSBkZXZpY2UNCg0KVHJpdmlhbCwgYnV0IHBl
cmhhcHMgYmV0dGVyIGFzDQoJQGRhdGE6IHN0cnVjdCBjb250YWluaW5nIHBlciBkZXZpY2UgaW5z
dGFuY2UgZGF0YS4NCg0KRGV2aWNlIGNhbiBib3RoIG1lYW4gdGhlIGxpbnV4IGRyaXZlciBtb2Rl
bCBkZXZpY2UgYW5kIHRoZSBhY3R1YWwgcGllY2Ugb2YgaGFyZHdhcmUgYW5kIGluIHRoaXMgY2Fz
ZSBJIGRvbid0IHRoaW5rIGl0IGlzIGNsZWFyIHdoaWNoIQ0KVGhpcyBhcHBsaWVzIHRvIG90aGVy
IGluc3RhbmNlcyBvZiB0aGUgc2FtZSBjb21tZW50Lg0KDQo+ICsgKg0KPiArICogUmVxdWVzdHMg
YSByZWFkaW5nIGZyb20gdGhlIGRldmljZSBhbmQgd2FpdHMgdW50aWwgdGhlIGNvbnZlcnNpb24g
aXMgcmVhZHkuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgbWF4MzAyMDhfcmVxdWVzdChzdHJ1Y3Qg
bWF4MzAyMDhfZGF0YSAqZGF0YSkgew0KPiArCS8qDQo+ICsJICogU2Vuc29yIGNhbiB0YWtlIHVw
IHRvIDUwMCBtcyB0byByZXNwb25kIHNvIGV4ZWN1dGUgYSB0b3RhbCBvZg0KPiArCSAqIDEwIHJl
dHJpZXMgdG8gZ2l2ZSB0aGUgZGV2aWNlIHN1ZmZpY2llbnQgdGltZS4NCj4gKwkgKi8NCj4gKwlp
bnQgcmV0cmllcyA9IDEwOw0KPiArCXU4IHJlZ3ZhbDsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJ
cmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGRhdGEtPmNsaWVudCwgTUFYMzAyMDhfVEVN
UF9TRU5TT1JfU0VUVVApOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJcmVndmFsID0gcmV0IHwgTUFYMzAyMDhfVEVNUF9TRU5TT1JfU0VUVVBfQ09OVjsNCj4g
Kw0KPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoZGF0YS0+Y2xpZW50LCBNQVgz
MDIwOF9URU1QX1NFTlNPUl9TRVRVUCwgcmVndmFsKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1
cm4gcmV0Ow0KPiArDQo+ICsJd2hpbGUgKHJldHJpZXMtLSkgew0KPiArCQlyZXQgPSBpMmNfc21i
dXNfcmVhZF9ieXRlX2RhdGEoZGF0YS0+Y2xpZW50LCBNQVgzMDIwOF9TVEFUVVMpOw0KPiArCQlp
ZiAocmV0IDwgMCkNCj4gKwkJCXJldHVybiByZXQ7DQo+ICsNCj4gKwkJaWYgKHJldCAmIE1BWDMw
MjA4X1NUQVRVU19URU1QX1JEWSkNCj4gKwkJCXJldHVybiAwOw0KPiArDQo+ICsJCW1zbGVlcCg1
MCk7DQo+ICsJfQ0KPiArCWRldl9lcnIoJmRhdGEtPmNsaWVudC0+ZGV2LCAiVGVtcGVyYXR1cmUg
Y29udmVyc2lvbiBmYWlsZWRcbiIpOw0KPiArDQo+ICsJcmV0dXJuIC1FVElNRURPVVQ7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBpbnQgbWF4MzAyMDhfdXBkYXRlX3RlbXAoc3RydWN0IG1heDMwMjA4
X2RhdGEgKmRhdGEpIHsNCj4gKwl1OCBkYXRhX2NvdW50Ow0KPiArCWludCByZXQ7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZkYXRhLT5sb2NrKTsNCj4gKw0KPiArCXJldCA9IG1heDMwMjA4X3JlcXVl
c3QoZGF0YSk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byB1bmxvY2s7DQo+ICsNCj4gKwlyZXQg
PSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoZGF0YS0+Y2xpZW50LCBNQVgzMDIwOF9GSUZPX09W
Rl9DTlRSKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4gKwkJZ290byB1bmxvY2s7DQoNCkknbSBmYWly
bHkgc3VyZSB0aGlzIHN0aWxsIGRvZXNuJ3Qgd29yay4gIElmIGFuIG92ZXJmbG93IGhhcyBvY2N1
cnJlZCB3ZSBuZWVkIHRvIHJlYWQgdGhlIGZ1bGwgZmlmby4gIE9WRl9DTlRSIGNvbnRhaW5zIHRo
ZSBudW1iZXIgb2YgcmVhZGluZ3MgdGhhdCBvdmVyZmxvd2VkLCBub3QgdGhlIG51bWJlciB3ZSBu
ZWVkIHRvIHJlYWQuICBIZW5jZSBpbiB0aGUgb3ZlcmZsb3cgY29uZGl0aW9uIGl0IG1heSByZWFk
IGFueXRoaW5nIGJldHdlZW4gMSBhbmQgMHgxZiBkZXBlbmRpbmcgb24gaG93IG11Y2ggd2UgaGF2
ZSBvdmVyZmxvd2VkLg0KDQpXaGF0IHdlIHdhbnQgZGF0YV9jb3VudCB0byBiZSBpcyB0aGUgc2l6
ZSBvZiB0aGUgZmlmbyBub3QgdGhpcyBudW1iZXIuDQpGcm9tIHRoZSBkYXRhc2hlZXQ6DQoNCk51
bWJlciBvZiBzYW1wbGVzIGF2YWlsYWJsZSBpbiB0aGUgRklGTyBhZnRlciB0aGUgbGFzdCByZWFk
IGNhbiBiZSBvYnRhaW5lZCBieSByZWFkaW5nIHRoZSBPVkZfQ09VTlRFUls0OjBdIGFuZCBGSUZP
X0RBVEFfQ09VTlRbNTowXSByZWdpc3RlcnMgdXNpbmcgdGhlIGZvbGxvd2luZyBwc2V1ZG8tY29k
ZToNCnJlYWQgdGhlIE9WRl9DT1VOVEVSIHJlZ2lzdGVyDQpyZWFkIHRoZSBGSUZPX0RBVEFfQ09V
TlQgcmVnaXN0ZXINCmlmIE9WRl9DT1VOVEVSID09IDAgLy9ubyBvdmVyZmxvdyBvY2N1cnJlZA0K
CU5VTV9BVkFJTEFCTEVfU0FNUExFUyA9IEZJRk9fREFUQV9DT1VOVCBlbHNlLA0KCU5VTV9BVkFJ
TEFCTEVfU0FNUExFUyA9IDMyIC8vIG92ZXJmbG93IG9jY3VycmVkIGFuZCBkYXRhIGhhcyBiZWVu
IGxvc3QNCg0KV2hhdCB5b3UgcmUgbWlzc2luZyBpcyB0aGlzID0gMzIgYnJhbmNoLg0KDQpDb2Rl
IHNob3VsZCBwcm9iYWJseSBsb29rIGxpa2UuLi4NCg0KCXJldCA9IGkyY19zbWJ1c19yZWFkX2J5
dGVfZGF0YShkYXRhLT5jbGllbnQsIE1BWDMwMjA4X0ZJRk9fT1ZGX0NOVFIpOw0KCWlmIChyZXQg
PCAwKSB7DQoJCWdvdG8gdW5sb2NrOw0KCS8vIEZpbmUgdG8gbm90IGRvIGFuIGVsc2UgYWZ0ZXIg
dGhlIGVycm9yIHBhdGggYXMgaXQgaXMgaW5oZXJlbnRseSBkaWZmZXJlbnQgZnJvbQ0KCS8vIHRo
ZSBuZXh0IHR3byB3aGljaCBhcmUgaW4gc29tZSB3YXkgJ2VxdWFsJyBpbiBpbXBvcnRhbmNlLiAg
IElmIHlvdSBwcmVmZXIgaXQNCgkvLyB0aGF0J3MgZmluZSB0b28uDQoJaWYgKHJldCA+IDApIHsN
CgkJZGF0YV9jb3VudCA9IDMyOw0KCX0gZWxzZSB7DQoJCXJldCA9IGkyY19zbWJ1c19yZWFkX2J5
dGVfZGF0YShkYXRhLT5jbGllbnQsIE1BWDMwMjA4X0ZJRk9fREFUQV9DTlRSKTsNCgkJaWYgKHJl
dCA8IDApDQoJCQlnb3RvIHVubG9jazsNCgkJZGF0YV9jb3VudCA9IHJldDsNCgl9DQoNCg0KDQo+
ICsJZWxzZSBpZiAoIXJldCkgew0KPiArCQlyZXQgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEo
ZGF0YS0+Y2xpZW50LCBNQVgzMDIwOF9GSUZPX0RBVEFfQ05UUik7DQo+ICsJCWlmIChyZXQgPCAw
KQ0KPiArCQkJZ290byB1bmxvY2s7DQo+ICsJfQ0KPiArDQo+ICsJZGF0YV9jb3VudCA9IHJldDsN
Cj4gKw0KPiArCXdoaWxlIChkYXRhX2NvdW50KSB7DQo+ICsJCXJldCA9IGkyY19zbWJ1c19yZWFk
X3dvcmRfc3dhcHBlZChkYXRhLT5jbGllbnQsIE1BWDMwMjA4X0ZJRk9fREFUQSk7DQo+ICsJCWlm
IChyZXQgPCAwKQ0KPiArCQkJZ290byB1bmxvY2s7DQo+ICsNCj4gKwkJZGF0YV9jb3VudC0tOw0K
PiArCX0NCj4gKw0KPiArdW5sb2NrOg0KPiArCW11dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQo+
ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArLyoqDQo+ICsgKiBtYXgzMDIwOF9jb25maWdf
c2V0dXAoKSAtIFNldCB1cCBGSUZPIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXINCj4gKyAqIEBkYXRh
OiBTdHJ1Y3QgY29tcHJpc2luZyBtZW1iZXIgZWxlbWVudHMgb2YgdGhlIGRldmljZQ0KPiArICoN
Cj4gKyAqIFNldHMgdGhlIHJvbGxvdmVyIGJpdCB0byAnMScgdG8gZW5hYmxlIG92ZXJ3cml0aW5n
IEZJRk8gZHVyaW5nIG92ZXJmbG93Lg0KPiArICovDQo+ICtzdGF0aWMgaW50IG1heDMwMjA4X2Nv
bmZpZ19zZXR1cChzdHJ1Y3QgbWF4MzAyMDhfZGF0YSAqZGF0YSkgew0KPiArCXU4IHJlZ3ZhbDsN
Cj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGRh
dGEtPmNsaWVudCwgTUFYMzAyMDhfRklGT19DT05GSUcpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiAr
CQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmVndmFsID0gcmV0IHwgTUFYMzAyMDhfRklGT19DT05G
SUdfUk87DQo+ICsNCj4gKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGRhdGEtPmNs
aWVudCwgTUFYMzAyMDhfRklGT19DT05GSUcsIHJlZ3ZhbCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJ
cmV0dXJuIHJldDsNCg0KVHJpdmlhbCBidXQgY2FuIGJlIHNpbXBsaWZpZWQgdG8NCg0KCXJldHVy
biBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKC4uLik7DQoNCj4gKw0KPiArCXJldHVybiAwOw0K
PiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IG1heDMwMjA4X3JlYWQoc3RydWN0IGlpb19kZXYgKmlu
ZGlvX2RldiwNCj4gKwkJCSBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyBjb25zdCAqY2hhbiwNCj4gKwkJ
CSBpbnQgKnZhbCwgaW50ICp2YWwyLCBsb25nIG1hc2spDQo+ICt7DQo+ICsJc3RydWN0IG1heDMw
MjA4X2RhdGEgKmRhdGEgPSBpaW9fcHJpdihpbmRpb19kZXYpOw0KPiArCWludCByZXQ7DQo+ICsN
Cj4gKwlzd2l0Y2ggKG1hc2spIHsNCj4gKwljYXNlIElJT19DSEFOX0lORk9fUkFXOg0KPiArCQly
ZXQgPSBtYXgzMDIwOF91cGRhdGVfdGVtcChkYXRhKTsNCj4gKwkJaWYgKHJldCA8IDApDQo+ICsJ
CQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJCSp2YWwgPSBzaWduX2V4dGVuZDMyKHJldCwgMTUpOw0K
PiArCQlyZXR1cm4gSUlPX1ZBTF9JTlQ7DQo+ICsNCj4gKwljYXNlIElJT19DSEFOX0lORk9fU0NB
TEU6DQo+ICsJCSp2YWwgPSA1Ow0KPiArCQlyZXR1cm4gSUlPX1ZBTF9JTlQ7DQo+ICsNCj4gKwlk
ZWZhdWx0Og0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICt9DQoNCg==
