Return-Path: <linux-hwmon+bounces-1789-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EED448A86D9
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Apr 2024 17:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A884B2834E4
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Apr 2024 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C54146A73;
	Wed, 17 Apr 2024 15:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDF/8mVt"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDD2146A6C
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Apr 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713366067; cv=none; b=fQGJPBW3UHJM3nVCZtyJdZtxT0VwAlsdFyW30YPtflcJuKOMaipPZB8iYC47nc5rxK3HiNZ9oMsi5JlAsGeIqTG0KlpeZg9A/MjZVlD3JMds95bFzt1CBkqz7VhkWx3dFnNhEdk6/Fw3ctjs74FQrJD5tNdQ/0TTn7ZMgUFTYxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713366067; c=relaxed/simple;
	bh=2XfitDFi8joNtBN6v5pf1qqwQN4BZHQIVg7OHTwoRTc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OmWpqHcUd+MCRyX3DIXwDP6ZpwmavQuLv/0dohymFh4Umy6h8bmnBNaIIr8yBi2If5EwsgPDrpPhBNZBb5yT1oHQCD8oWPO+bZahbNIATrQu6u2hJlkqJzXj/KDmpSMdpnaX9WTD7cnCD0N+kG+PkLDHs/wSGbBnpJs2HxkZPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDF/8mVt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713366065; x=1744902065;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=2XfitDFi8joNtBN6v5pf1qqwQN4BZHQIVg7OHTwoRTc=;
  b=dDF/8mVtq6WDrfeC7P8Gmei8ZIlsuy9UY1ZwXgi4OT+yUvip8M2dA+hL
   U1P8dohaRk9cKjGAtktqb+tZeJF7GpnUXljJh6G20nNVAyuxlj1OYD9Bo
   6BkgBvudtHIFH1V4LueRgFggM7egPZuYazxTihf+JN36lgb2zFi6t1fOF
   LeUGL2CJJKVYx2eAV/qcNCl7E5YmTenWrTM9ZRim75Yr3T6hUzxiYLykY
   bsEOty2F7RhoktyPILd6iPZGySPDKnl5Kw/OaRWC9d+214UEZtK4MSqgv
   NegCwa4OrEFNPyhCEc1+z2uM6AfDl40Fxh2BxKTwKMuUIvoSLEHHoYsC2
   Q==;
X-CSE-ConnectionGUID: vg/D3zSpTfKYK2rDz9DNCA==
X-CSE-MsgGUID: YkNqIagNQcyml24xlOdaPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12701333"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="12701333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 08:01:04 -0700
X-CSE-ConnectionGUID: 3hSmhStwTcKRyGUb6jUo5Q==
X-CSE-MsgGUID: lIQ6eIHtQPC39Z0nke0VeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="23244226"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.138])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 08:01:05 -0700
Date: Wed, 17 Apr 2024 08:01:04 -0700
Message-ID: <85bk68c9u7.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc:<intel-gfx@lists.freedesktop.org>,	Badal Nilawar
 <badal.nilawar@intel.com>,	Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>,	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Jani\ Nikula" <jani.nikula@linux.intel.com>,<linux-hwmon@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/i915/hwmon: Get rid of devm
In-Reply-To: <Zh-IQENH0hHokBbv@ashyti-mobl2.lan>
References: <20240417051642.788740-1-ashutosh.dixit@intel.com>
	<Zh-IQENH0hHokBbv@ashyti-mobl2.lan>
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

On Wed, 17 Apr 2024 01:28:48 -0700, Andi Shyti wrote:
>

Hi Andi,

> > @@ -839,16 +837,38 @@ void i915_hwmon_register(struct drm_i915_private *i915)
> >		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
> >			continue;
> >
> > -		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
> > -								 ddat_gt,
> > -								 &hwm_gt_chip_info,
> > -								 NULL);
> > -		if (!IS_ERR(hwmon_dev))
> > -			ddat_gt->hwmon_dev = hwmon_dev;
> > +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
> > +							    ddat_gt,
> > +							    &hwm_gt_chip_info,
> > +							    NULL);
> > +		if (IS_ERR(hwmon_dev))
> > +			goto err;
>
> here the logic is changing, though. Before we were not leaving if
> hwmon_device_register_with_info() was returning error.
>
> Is this wanted? And why isn't it described in the log?

Not sure if the previous logic was intentional or not, anyway I have
restored it in v5 (where I once again forgot to add "PATCH v5" to the
Subject but v5 is there in the version log :/).

Thanks.
--
Ashutosh

