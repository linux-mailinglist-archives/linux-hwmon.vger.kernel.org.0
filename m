Return-Path: <linux-hwmon+bounces-1746-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4178C8A61F5
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Apr 2024 06:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0719E28526B
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Apr 2024 04:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28F3208C4;
	Tue, 16 Apr 2024 04:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQCTdkKL"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325821CD06
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240347; cv=none; b=Jo5tOu+O17UO9iDaHcY4Uucfe+U/9O4Cvmj1b9ixDC5DQj0bt/eLCsRll6ztreln08ayG7vBKEgL4S6fT82c3roHVL8oS367MwI4TewNXDqIjx+kCF2tVvESkNXhhObLXiKAsqJxkwRLH2ieShrofaE0inV7U4MrgT8RRXX8gYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240347; c=relaxed/simple;
	bh=qYqFQxG3GvJkIgbdj07EURxXDW2TY/tvCr3y2HRKj/0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADZhohLEHS2PulpsJPumGNSWae5T5xvHQAcmbMKW3J2AATk0DwuRYnHtJhocIB2bX6V2ZeCEVtnJ7UuD7Wa8hVgKZfDCZCqGdrlb681C2B5E4lZ3PZGywTUfYl1iFO2Ac7Qza1oq8lC++eLSs2tCgd8R/u64pHT7KodOu2Ew+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQCTdkKL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713240346; x=1744776346;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=qYqFQxG3GvJkIgbdj07EURxXDW2TY/tvCr3y2HRKj/0=;
  b=UQCTdkKLG/kdccRy0CNo7P/djq42FPEl6KgLNRio3dRoli1R8RmbXIUv
   w919DBr/E5F7UMP9nBm3iiz2dJXr9rgM9io27tOTKdfXwSoetaZ0kocgg
   qcPuIB7PxY6RcnZVQGfIO+De1eoJ8VOMIbEKz6ov0W9w+hBKU8YX364jE
   KXocDNQB2dNrO2Gc5xO+O20pc25YjxAqbdu22jnERpPbED/niTxAzbzRO
   Szu7aOIA+cNStlBe+sAfg+0CVE9GWuyolM8YBny9g7qAm/CKRyIT5lUT1
   wfncFCnB8rOGRuUg7JBxcxgrpTuVlN0xrAL8e9PvjuIekl9bollpJYFnJ
   w==;
X-CSE-ConnectionGUID: 0y8SFxZwQW2lsCXSU6562Q==
X-CSE-MsgGUID: +qffFQh9RaCFmkMcSjZECg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19806194"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="19806194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 21:05:45 -0700
X-CSE-ConnectionGUID: P5RiF+FQSCOOfh8QDOT3Qw==
X-CSE-MsgGUID: 28oq5WzRSEuiDM/RxaLK1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26545199"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 21:05:44 -0700
Date: Mon, 15 Apr 2024 21:05:44 -0700
Message-ID: <857cgyt0iv.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: intel-gfx@lists.freedesktop.org, Badal Nilawar
 <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/hwmon: Get rid of devm
In-Reply-To: <020612d1-2e6b-4bd7-87a6-dbd31574fdd8@gmx.de>
References: <20240415223612.738535-1-ashutosh.dixit@intel.com>	<020612d1-2e6b-4bd7-87a6-dbd31574fdd8@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-redhat-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Apr 2024 16:35:02 -0700, Armin Wolf wrote:
>

Hi Armin,

> Am 16.04.24 um 00:36 schrieb Ashutosh Dixit:
> > @@ -818,10 +818,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> >	hwm_get_preregistration_info(i915);
> >
> >	/*  hwmon_dev points to device hwmon<i> */
> > -	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> > -							 ddat,
> > -							 &hwm_chip_info,
> > -							 hwm_groups);
> > +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
> > +						    ddat,
> > +						    &hwm_chip_info,
> > +						    hwm_groups);
> >	if (IS_ERR(hwmon_dev)) {
> >		i915->hwmon = NULL;
>
> you need to free hwmon here, since it is not managed by devres anymore.

Thanks a lot for catching this, I had missed it in v2, it's fixed in v3. I
am actually reusing i915_hwmon_unregister() for error unwinding in v3.

>
> >		return;
> > @@ -838,10 +838,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> >		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
> >			continue;
> >
> > -		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
> > -								 ddat_gt,
> > -								 &hwm_gt_chip_info,
> > -								 NULL);
> > +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
> > +							    ddat_gt,
> > +							    &hwm_gt_chip_info,
> > +							    NULL);
> >		if (!IS_ERR(hwmon_dev))
> >			ddat_gt->hwmon_dev = hwmon_dev;
> >	}
> > @@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> >
> >   void i915_hwmon_unregister(struct drm_i915_private *i915)
> >   {
> > -	fetch_and_zero(&i915->hwmon);
> > +	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
>
> Why is fetch_and_zero() necessary here?

As mentioned, in v3 i915_hwmon_unregister() itself is used for error
unwinding so we need to prevent multiple device_unregister's etc. That is
the purpose of setting i915->hwmon to NULL. But even earlier, though it is
not obvious, i915_hwmon_unregister() is called multiple times. So e.g. it
will be called at device unbind as well as module unload. So once again we
prevent multiple device_unregister's by setting and checking for NULL
i915->hwmon.

>
> > +	struct hwm_drvdata *ddat = &hwmon->ddat;
> > +	struct intel_gt *gt;
> > +	int i;
> > +
> > +	if (!hwmon)
> > +		return;
> > +
> > +	for_each_gt(gt, i915, i) {
> > +		struct hwm_drvdata *ddat_gt = hwmon->ddat_gt + i;
> > +
> > +		if (ddat_gt->hwmon_dev) {
> > +			hwmon_device_unregister(ddat_gt->hwmon_dev);
> > +			ddat_gt->hwmon_dev = NULL;
> > +		}
> > +	}
> > +
> > +	if (ddat->hwmon_dev)
> > +		hwmon_device_unregister(ddat->hwmon_dev);
> > +
> > +	mutex_destroy(&hwmon->hwmon_lock);
> > +	kfree(hwmon);
> >   }

Thanks.
--
Ashutosh

