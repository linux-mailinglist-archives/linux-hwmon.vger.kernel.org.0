Return-Path: <linux-hwmon+bounces-1765-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980C8A7438
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Apr 2024 21:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 555B02831D9
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Apr 2024 19:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AC3137C4D;
	Tue, 16 Apr 2024 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifWzy08O"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306213777D
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294133; cv=none; b=NG7hvs+jCt/xCgUty0qkOU/UaGKOkewZx2NN93paIbntAEVlAasGK5jax8Fe80ebe/V45XGt1/HJt2gH90WssX3k7kWdkCJ61fwbNzw6v4c1TzR2RmnJ6RXwANO9+3b1N7RtuQjzK/VVMg5PQ+MWaZDNGTddq/BqYB2IE5ATGr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294133; c=relaxed/simple;
	bh=cWgfFbkRRGPeHH51a6cCpYsUxCzyFOtg5Ia+0xVpfX0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iL7xCg2w+XXVpybLsw6ESFm5gQa2PVgyLaI9vOrBlPRBY7kYvu3F2Trqz9Kcs0g/k+aHNczH+bSVDjEg3fyGiSg4vKf0KpGkUFWdI5/X20MzOB5vYG57n0sdGBWRKH/XD67eRbaYEd6lxxuc//yTW8ZePMXw+ot3NtWBr5s9JeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifWzy08O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713294131; x=1744830131;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=cWgfFbkRRGPeHH51a6cCpYsUxCzyFOtg5Ia+0xVpfX0=;
  b=ifWzy08OLBSsp+ml0IRF07sRjiSBPFvgYgtQOjuQkKYFdxL0zFMmqUC+
   CiySaSZBU+bcLzM9V4aqAp40VskbXQnmYQKsOthzV7hqWh83VMo4R2DOH
   pLo8rouL6Ae+6vEoVutegpgIoNJY1HZWp1vQlrhPdqXEiFZ7ZKU/DrE+L
   2nNH8lcE8LI8PfaTfE0hoazvhUSffnWceE6rMQyroXqEjboA0IK8CkSJ2
   dkKFDopwcbHlgUkpeu/r+oH7IGOv/Ter2LouMmkeX4OwutUhtaf/ydp3v
   dsAI7lqH65fBt3rLGt4LvlLu8jRFLYHnG9AoecGUim/S7Pu+FWc5QkbLN
   Q==;
X-CSE-ConnectionGUID: z5FtQUswRASOZRE1lDPnMA==
X-CSE-MsgGUID: HZsIpu7LQBGFfEGrcOzaGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12535748"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="12535748"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:02:11 -0700
X-CSE-ConnectionGUID: ft6I1Z/xR1Slpe9WbxVbwg==
X-CSE-MsgGUID: eetmvu/LTHes6YDuDm5Zww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="59794531"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.138])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:02:11 -0700
Date: Tue, 16 Apr 2024 12:02:10 -0700
Message-ID: <85jzkxcerx.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org,	Badal Nilawar
 <badal.nilawar@intel.com>,	Andi Shyti <andi.shyti@intel.com>,	Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	linux-hwmon@vger.kernel.org,	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/hwmon: Get rid of devm
In-Reply-To: <Zh7JmPQ8XRJwMQnQ@intel.com>
References: <20240415223612.738535-1-ashutosh.dixit@intel.com>
	<Zh7JmPQ8XRJwMQnQ@intel.com>
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

On Tue, 16 Apr 2024 11:55:20 -0700, Rodrigo Vivi wrote:
>

Hi Rodrigo,

> > @@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> >
> >  void i915_hwmon_unregister(struct drm_i915_private *i915)
> >  {
> > -	fetch_and_zero(&i915->hwmon);
> > +	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
> > +	struct hwm_drvdata *ddat = &hwmon->ddat;
> > +	struct intel_gt *gt;
> > +	int i;
> > +
> > +	if (!hwmon)
> > +		return;
>
> "that's too late", we are going to hear from static analyzer tools.
>
> beter to move ddat = &hwmon->ddat; after this return.

Yeah, I worried a lot about it :/ But then finally decided (and verified)
that we are never actually dereferencing the (possibly NULL) pointer.

But not sure about static analyzer tools, maybe you are right, I'll move
it.

> with that,
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks a lot :)

Ashutosh

>
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
> >  }
> > --
> > 2.41.0
> >

