Return-Path: <linux-hwmon+bounces-3967-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D144496DB41
	for <lists+linux-hwmon@lfdr.de>; Thu,  5 Sep 2024 16:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 512D11F294B2
	for <lists+linux-hwmon@lfdr.de>; Thu,  5 Sep 2024 14:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740612AE96;
	Thu,  5 Sep 2024 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7F/eQm+"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82019DFB6
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Sep 2024 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545441; cv=fail; b=oRyoLH/S8i1RXandCoyUUAwbcU0DpwYsn4pIRdKLBm82UJPPtfOWe3zOuqZMpAe5sPbpr+gy5XEuF1hIrSv16y1IDiIAt/hjJ3sVvuUZ/RlOErkdsXaB+3f82ujDNMB05IEN0Xt8bGzt1cVps8TVn1fuBFensEUt0ku+hJKGkoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545441; c=relaxed/simple;
	bh=2Z5DUs6dQ6qKqk7/R3Q3KFrc7wYvhbC4T4F+AToj9e0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XW3faMPtsAj9AtmDLRwmpkg9rsrUBC1+qQ8vNs0GhaKcJ7xKFy69hRUpTrKRxam1CbqRxHm817t0cQNy5K6/woMUOT7t9ruCXI9jjBTZD7lIuqg4P27KaGRJ/iMAlR8cxnUoHg6o4Ah6KxCy+CgACGB0SK9WryhNJFEQRQPpFOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7F/eQm+; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725545439; x=1757081439;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2Z5DUs6dQ6qKqk7/R3Q3KFrc7wYvhbC4T4F+AToj9e0=;
  b=A7F/eQm+BVyl9JdMSePRnqCJJlW5cbnNKJs8u3Otx9T/l2KzyRw98+u3
   /nb51N92D2vGazrDXp7xVXcYrKamCBIcvVjfOsIrRTbBEcpLMAzegHMTt
   YrXOKQsMEc8Vma+S9Hc5P13Y0ghgkh+cD+evHfFoFkZSoLwqwzNhz9JEy
   OoOuHKYHBiRZQB6hZ5Wmw6SyeCfwv8VB4/mJZw/XVJQ4hx+RIj5aHITU8
   tAd1SkAwKnN2RyHGi4K2dzhPLbz3aTjjId76Sn+l2m3niw2WSw4V5tMXK
   5mNm4hUW4j6iYquBuq5DDFYl4X0hD7//YcBvmRcoIqPRSH0m0/Aud5oNC
   A==;
X-CSE-ConnectionGUID: pmq75gsPTK+RotCBz7gA6Q==
X-CSE-MsgGUID: qVPUKEAzQmWO1PnPUXwtdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49671615"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49671615"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:09:42 -0700
X-CSE-ConnectionGUID: TMRWcjScTqOlZOMO0u667w==
X-CSE-MsgGUID: s6wlOdqHSVu0opc2mMLeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="70431281"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2024 07:09:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 07:09:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 07:09:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 07:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4cl6cJXoApm33vq8G+UsH0fWgqLkE6zOhqieWchYTUHxvW5+ACbmDAvvsYUVPSnwqNiy25KatMxvWll7Ei+ur0AsWdG2MbX0Zw9plhJT640PsFCWyY2AvkR1IMQjoB6CqWDzTYaK9V4zQcaa/t0RwQcs9YmV09D/FUqTZ36OVsGX2aeGV9EIY9AyXxTFCesrb4w3yKZrTW/SumVI87pdQHsXLsHNqCP+CLdqjRuqdUjyYXjNetrFIa5h8s5S+4o4PM24GyAJ3nYcOGsJLt53yxb6ypGJswI08y+lejeg2SJGzDorJVjVvTjbzBWqqJotYJeGZ/lfrCzJZAm1b8Ecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaJzpxItsetWQcO0M88QUMjW9F/oKfFw0jcgUxAZiIA=;
 b=a2/DJDLoHj6zs9HIdg4tBpw8Nrc69H3fj/03MpErQTzXc66e1HDrxoAYFPngc7g+QDBtSU12nFYhMn2/jZKzxjNsuqwx6rHta40DW90jvWE9bE5FXb2Ga4ToI5RD3sW1dtqti7PoylDx4Vzki3oPNQXS1/QRRiB1mxsBHQpEJv5lhQV12O2WJjILZV7MwCsEqjQxOqg6pPjRC4xcp4L0/mVO8Of1jxNiExMUtTpod5qFdnkz1IIakSLhqDhPcqNS6HE8/Z/sLZ2EQ5iOarZKFQtsHBTlSwOZqsenW9D+8okXqTvEtF3bANXNot7vOL7f+FRICAWgf/w7AmiJdUhDyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 14:09:38 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%6]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 14:09:37 +0000
Date: Thu, 5 Sep 2024 19:39:31 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, <jani.nikula@linux.intel.com>,
	<joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
	<tursulin@ursulin.net>, <linux@roeck-us.net>, <andi.shyti@linux.intel.com>,
	<andriy.shevchenko@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
	<linux-hwmon@vger.kernel.org>, <riana.tauro@intel.com>,
	<ashutosh.dixit@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v1] drm/i915/hwmon: expose package temperature
Message-ID: <56zmt55kfwgeq3bsbci7ghooe4qv3nqxulbaipceng2jqb6dtl@hxvgnwznnzpy>
References: <20240828044512.2710381-1-raag.jadav@intel.com>
 <07c01d49-aa9c-429e-bd4d-65cf2648329e@intel.com>
 <Ztlx-xAd2JSpolZA@black.fi.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztlx-xAd2JSpolZA@black.fi.intel.com>
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To CY5PR11MB6211.namprd11.prod.outlook.com
 (2603:10b6:930:25::6)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6211:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ae47e6-97de-4f2b-c13d-08dccdb4606d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+HpAvWVJxEWliFo9Z48dy7KcZMxqbCs1YEpvLufrQbv97xjgxmu3Gwxu6h?=
 =?iso-8859-1?Q?TQG1bvHEc1skFMpMTejNVWh/rp+pxRmtjh3qgmUqPRxo7XZDOBW/M/PwUi?=
 =?iso-8859-1?Q?YtkK0jVJzyBsw6PZw4zRM0381Nsj0GfmTAeWJaVSA1qQ7WWysSN04KEtP+?=
 =?iso-8859-1?Q?BttzWpbyW0sZLQEYp7Be02HwmZQ8drGb99mutiIpEQWA/JxxnnzFs0YNax?=
 =?iso-8859-1?Q?hy52V+t4L+AH5paY6VAtFCAq8uEfUytZGJTQWSvL8sUta04lWNG/4p9gXe?=
 =?iso-8859-1?Q?KodOnXno2NlSktjNfUzLTiG9veRynjpOfn40Kd9oxhomfQoOUpWkMipMOP?=
 =?iso-8859-1?Q?Lz78aP7+9ZB/PfkeY7hmyFgWFDMcvwVf+lcJ05JNGlmbD9JKj6trRy1w8I?=
 =?iso-8859-1?Q?UmUK5R2ZLk06CjW+EdGAxRJalWa5ibCzDEIspcuj/+IRZuK4mOnwDlwnfu?=
 =?iso-8859-1?Q?SPJ2AoTmiQbW7c1pTCl1PE+9hln6AFyJuAafVEIkSCKLfH+keXAKiP3U7x?=
 =?iso-8859-1?Q?pvcszcNXbv3g578Q5gRfM1e2iYvQSXQJUXTO1zfw2aYceWdBHsnRLQqYQo?=
 =?iso-8859-1?Q?gpCX+ph6dXiU+MCDsnBoU5L1TIdFZVRvv7B6zgVURHKFly72+KhB0gnMDh?=
 =?iso-8859-1?Q?BfVVzUXwRapkE+OTXPGYcnypXEGB58ashKZORHgCzYLcS5QhvZja3bha5W?=
 =?iso-8859-1?Q?N/DBQpcRWWuv4H8CdPa1pAXPXbPCnRi9ZFtqE70vrJIikU4xR5WyXATdBJ?=
 =?iso-8859-1?Q?6eCZ/uxIfhLppHbm1kZ4Nc+roPWDz3RJ4KGs7ktZJjKJy87ORHI2G2YjW1?=
 =?iso-8859-1?Q?zo/SsMLBE86lZJh27xIsEqn7CvF+wkpsEDnEOyCrLsvZ4s9diOh3cm3nwM?=
 =?iso-8859-1?Q?HMt0MO575MOjAF2WBYrJr8aSyaDRq5ypEnqHP+/DCOEC2moZwtoZXsOrHO?=
 =?iso-8859-1?Q?UMFoYqvbW4m5uQ7XzrVebzKqSLOX3Cm00e6Rp3NCnTmDUp/Gr4BKFJ/85W?=
 =?iso-8859-1?Q?w2rrBPEG+6gxjTqbhqurD+m+/Lx3lVKlSD0gJDEvFtSW0cIsqJhhh9EmBm?=
 =?iso-8859-1?Q?ooLYuk6NSNN3bQIoAPumphh9HluIg95Dkj+0TMWaL5JQO/Wt6fPXv/E7ZS?=
 =?iso-8859-1?Q?riGOqMyoIBGNKPkE8eeIlZ6Nf6z8rYt0SiX6NTsC13YtmpLZXS9O90jx0m?=
 =?iso-8859-1?Q?e9K2ozTA32AhbHREvxVDhd77X67ERamACrRocoAASxRWSSH9l37MRZ++Qb?=
 =?iso-8859-1?Q?3CWxQWC3kq/u71Gqxo8XKBFbau33kGe5UuiIPqUzrRCSXD7uWdsPD61j0j?=
 =?iso-8859-1?Q?5zz+yad9/LWVYnwDHLiJwEjecIRS6kAXHo60S6EZMZivaq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6211.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?q8UPH22kzP6scxUVAJmRjWy0Y1woG4N+YfHUV99PdhFBSumOwHQGFgnfjd?=
 =?iso-8859-1?Q?7fJCvm+3pBW57nZP9hkGpHA7NmCPxnaAa0M5UeUF4w7Yf5LKt3BlHh1Ece?=
 =?iso-8859-1?Q?a+VpAls2i6w8bZlrKjjU2ck7+LoDKgbqHbffVtpKbMIt5IktcXOvj3ti+h?=
 =?iso-8859-1?Q?ZJcJrEwSYRffcQgsubrATHmUQv6AZb3DBl0ijWhN+eW510pVw+TYaTTlwc?=
 =?iso-8859-1?Q?2wVlZmPhHH7ErWHDSQm6ZvnmsNPhxi1KMmDT54SmIfh6jGY5Uo4dxhenCh?=
 =?iso-8859-1?Q?iDAcA7nI3bzSm/7kX0tsueSINTzdFCuAA58VbOEF45XhNavJQ+HB8+ItvQ?=
 =?iso-8859-1?Q?06YYb9MYgPoj0NpG0YBQ0zOGDaI/ViQKsHElswa3lEma8q0Bt8kTkIx4J7?=
 =?iso-8859-1?Q?gCIq31VgvZ5yKVbRklaR+hxoLFNQePuqqL2voZ8ZPiOaGhOKSvRnb7oBgl?=
 =?iso-8859-1?Q?d0yrVMY0NHrAK/gkj15cSy/mX53LZmPxApNWNyxHq8pbb59fB5HidEhA1s?=
 =?iso-8859-1?Q?SY+v//6QPHAOdQsjwW8ioOFwrwj98jYuZXN4Slh4AoQTKc5yf3XGrjk5Rl?=
 =?iso-8859-1?Q?ruFLkhSeFTy8Feiim28j6AoFVW834qihtHw6zWpJUf0N4fBRSmwC82dRHF?=
 =?iso-8859-1?Q?dCVOlyP7sgsswcWtOHOUWT+zeDN1PAntvXc2lppp1/vHCOzgQt9tAqOhoc?=
 =?iso-8859-1?Q?3NxefIYe+BgFJJ1ihRRZJyXpu58sRkqeqaseaaBBpAAJ8Q+C361P6uyMEw?=
 =?iso-8859-1?Q?APe1OD7fbtouWji9oFQGYuv0SDyMNCo7gfN5QiJlJFFck0W5PJN/9NvoG5?=
 =?iso-8859-1?Q?/NOgs94psW9uf21uJ7h38rbf+ennHA4thgdTRANolSa+ZWAoinCVLC+G0H?=
 =?iso-8859-1?Q?wBbalt4Kgk1R+v1JEj6JkJ1bY3r13IKKhDwJam+DP59ipmWwl6e8YAljPO?=
 =?iso-8859-1?Q?ORS+5y7SSultlWdM+pIeGkXfHWEps+b1DiH++ZdkldyJpBFfsWROLUIxtZ?=
 =?iso-8859-1?Q?gy5z94FmGUb5yd8fbVBOm3X0bqepLh1FCYES1t0oZlENdrOfnvvIlXSAXz?=
 =?iso-8859-1?Q?I2rLS2D8FDv8DUVymn1rQs7XCJ6/HwZpJuAKak+al/fgIVxR30nFzS6ITu?=
 =?iso-8859-1?Q?wDuTYKV6q4qi2m7u9As9MOXepRTa4azN33A/q+uQf3uCNG8YJlPgnBewsj?=
 =?iso-8859-1?Q?7UIKgQRWhHJcyn84sHTakNlZjilNUlq3DemAKmvWZY25NXHtgV1syF+cuO?=
 =?iso-8859-1?Q?9UHv1wX19cjGvGsklA4e5yLOhsc6ZJ8avCfiOjCCWmbVlMsnymOib3HRC+?=
 =?iso-8859-1?Q?wdPDIl7dsDnKwLKWxLtJ09Lazrbi9xNQm+X/W4/zbRyhJktpBJ4omvJGC5?=
 =?iso-8859-1?Q?IRzJcRmDmypsl+nlcZWenlqJq7GdF4sa/3OC/sfYfglcdEPUvsonysvxax?=
 =?iso-8859-1?Q?7pbY2G/En9ttBYQp+GR2AitkQD/F1lAENhH65udWVHZBY3C9a6b6DHSF7n?=
 =?iso-8859-1?Q?olXnIuJXFGVwAxnsydSRik2QpwVuoJxeCH6Sy9z1yP1M3E6EDr051xE/Sg?=
 =?iso-8859-1?Q?2UmFXybd74nGlCeCG8PphX8mmtt6xu7op5fIvjPdQjdumkjpbFiPYjk5aM?=
 =?iso-8859-1?Q?YwX4+CdUf/C3ig50cvyKElRnBU+3Oj91uuMZqFT28eOAQ75Ayiizw5Nw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ae47e6-97de-4f2b-c13d-08dccdb4606d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 14:09:37.7277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rs80inR6Jtxa3XY2Be+uW7RLsxpp13me0T67q+l1UhlTmzwiVBzNbUR1eHbzJIvPHynH+1nFKSGKeE59+W0HaUmQqsNbwOAg+yGKfTF55UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
X-OriginatorOrg: intel.com

On 2024-09-05 at 11:55:23 +0300, Raag Jadav wrote:
> On Thu, Sep 05, 2024 at 11:56:15AM +0530, Nilawar, Badal wrote:
> > 
> > 
> > On 28-08-2024 10:15, Raag Jadav wrote:
> > > Add hwmon support for temp1_input attribute, which will expose package
> > > temperature in millidegree Celsius. With this in place we can monitor
> > > package temperature using lm-sensors tool.
> > > 
> > > $ sensors
> > > i915-pci-0300
> > > Adapter: PCI adapter
> > > in0:         990.00 mV
> > > fan1:        1260 RPM
> > > temp1:        +45.0�C
> > > power1:           N/A  (max =  35.00 W)
> > > energy1:      12.62 kJ
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11276
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++++
> > >   drivers/gpu/drm/i915/i915_hwmon.c             | 39 +++++++++++++++++++
> > >   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  4 ++
> > >   3 files changed, 51 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > index be4141a7522f..a885e5316d02 100644
> > > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > @@ -83,3 +83,11 @@ Contact:	intel-gfx@lists.freedesktop.org
> > >   Description:	RO. Fan speed of device in RPM.
> > >   		Only supported for particular Intel i915 graphics platforms.
> > > +
> > > +What:		/sys/bus/pci/drivers/i915/.../hwmon/hwmon<i>/temp1_input
> > > +Date:		November 2024
> > > +KernelVersion:	6.12
> > > +Contact:	intel-gfx@lists.freedesktop.org
> > > +Description:	RO. GPU package temperature in millidegree Celsius.
> > > +
> > > +		Only supported for particular Intel i915 graphics platforms.
> > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > index 17d30f6b84b0..9f1a2300510b 100644
> > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > @@ -7,6 +7,7 @@
> > >   #include <linux/hwmon-sysfs.h>
> > >   #include <linux/jiffies.h>
> > >   #include <linux/types.h>
> > > +#include <linux/units.h>
> > >   #include "i915_drv.h"
> > >   #include "i915_hwmon.h"
> > > @@ -32,6 +33,7 @@
> > >   struct hwm_reg {
> > >   	i915_reg_t gt_perf_status;
> > > +	i915_reg_t pkg_temp;
> > >   	i915_reg_t pkg_power_sku_unit;
> > >   	i915_reg_t pkg_power_sku;
> > >   	i915_reg_t pkg_rapl_limit;
> > > @@ -280,6 +282,7 @@ static const struct attribute_group *hwm_groups[] = {
> > >   };
> > >   static const struct hwmon_channel_info * const hwm_info[] = {
> > > +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> > >   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> > >   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> > >   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> > > @@ -310,6 +313,36 @@ static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
> > >   				  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0, uval);
> > >   }
> > > +static umode_t
> > > +hwm_temp_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > > +{
> > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > +
> > > +	if (attr == hwmon_temp_input && i915_mmio_reg_valid(hwmon->rg.pkg_temp))
> > > +		return 0444;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int
> > > +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > > +{
> > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > +	intel_wakeref_t wakeref;
> > > +	u32 reg_val;
> > > +
> > > +	if (attr == hwmon_temp_input) {
> > > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > > +
> > > +		/* HW register value is in degrees, convert to millidegrees. */
> > > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > > +		return 0;
> > > +	}
> > > +
> > > +	return -EOPNOTSUPP;
> > > +}
> > Let's try to have synergy between previous attribute, such as hwm_fan_input,
> > and this one.
> 
> This one's simple enough to be inline IMHO.
> Besides, it's already in synergy with hwm_in_read() which has similar
> implementation.
Agree this is pretty simple to have an any helper but IMO it would have been cleaner to have a switch
like hwm_in_read() to return -EOPNOTSUPP in default case. i think that was reason switch case was 
used in entire file.

Thanks,
Anshuman

> 
> Raag

