Return-Path: <linux-hwmon+bounces-3808-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5418963DA7
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Aug 2024 09:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BFCD286E17
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Aug 2024 07:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF87189F2F;
	Thu, 29 Aug 2024 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGUsnxUq"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FDB43154
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724917843; cv=none; b=mDm7x5LYPdZf8GRQuaRReLbd2g3MTzWAQclXcv2mXdUAN1kyr1vaPNvaiVwsFAy/2/NwfBcsW1hEm/R42gsKMiKohZH7q4YBFGFG9KFuZmpUjcGtQLl/8+RN+47TskbbL21KKerizh9JX/tpYicG7lhAKZs9d9fTKOJmCeEj8c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724917843; c=relaxed/simple;
	bh=xSw+0IHqxIqixKwhMjpYoComC+5WM9Rj+1YdZYTAbkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tipvcafamu2ZM3BiMrJ8AkDUjDufP5j3NG+OdACFu30MpQ8ucmCh+w3Vvv6q4KRvokh+Htz7W97wilfHGjtxBb9aBnpYukb1jzkYQIy98hIpBFiGH+SMYGzTS99/ZGf7DNex7Rbi6fADtA6aQ5yBS3iJCOqk1FY3aQ3QzUCELlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGUsnxUq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724917841; x=1756453841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xSw+0IHqxIqixKwhMjpYoComC+5WM9Rj+1YdZYTAbkU=;
  b=PGUsnxUqp9oow3LxibGnOjW5TCxPBfg1ccsYpXPKaZOTO6CpvQFIh/OC
   KSZjIvAD2XG2DBsviKbWJm5euo29KCL5mMeChBDa4bLiDnN8WhXZF9Wab
   MIBdex8T4HFJERaEEtyMVB6YcoBiIvJ8LGYmUXi4GlVOm5Mgbaoao6U/B
   aVaO7dCLUZe/RGDspL2D0I8Oe2FRdDCu2sncdSqhBxXP5qYOucjiOrBJs
   7ELiMGqr5Iw3VHWaHD2nydNItsRggJcSofZtgbFk5V5UOahdqhca4emzB
   hzurzpTpTE/EfZdjWZuv+nv/nMKUx1wF/jcymtMHx2GFsEFar9OsU/3AV
   w==;
X-CSE-ConnectionGUID: 0AGa/iCxQViVtHffJ1N1gA==
X-CSE-MsgGUID: EuoeJJ36TgaES1ILycInrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40995305"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="40995305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 00:50:40 -0700
X-CSE-ConnectionGUID: x0n2VPApRWK8IafM0nVRZw==
X-CSE-MsgGUID: VlMBfjLaTmW3/LFlGU/gCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63486314"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 00:50:38 -0700
Date: Thu, 29 Aug 2024 10:50:35 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net,
	andi.shyti@linux.intel.com, intel-gfx@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com,
	badal.nilawar@intel.com, riana.tauro@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/i915/hwmon: expose package temperature
Message-ID: <ZtAoSkHLHEgT2Enw@black.fi.intel.com>
References: <20240828044512.2710381-1-raag.jadav@intel.com>
 <Zs8tJNV8ATILvmmA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs8tJNV8ATILvmmA@smile.fi.intel.com>

On Wed, Aug 28, 2024 at 04:59:00PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 28, 2024 at 10:15:12AM +0530, Raag Jadav wrote:
> > Add hwmon support for temp1_input attribute, which will expose package
> > temperature in millidegree Celsius. With this in place we can monitor
> > package temperature using lm-sensors tool.
> > 
> > $ sensors
> > i915-pci-0300
> > Adapter: PCI adapter
> > in0:         990.00 mV
> > fan1:        1260 RPM
> > temp1:        +45.0�C
> > power1:           N/A  (max =  35.00 W)
> > energy1:      12.62 kJ
> 
> ...
> 
> > +static umode_t
> > +hwm_temp_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +
> > +	if (attr == hwmon_temp_input && i915_mmio_reg_valid(hwmon->rg.pkg_temp))
> > +		return 0444;
> > +
> > +	return 0;
> 
> Just a question (I'm fine with this implementation): is the style in this file
> to check for correct cases first and return an err/etc at the end?

The convention is to use switch case with err being the default, so I'd say yes.

> > +}
> > +
> > +static int
> > +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +	intel_wakeref_t wakeref;
> > +	u32 reg_val;
> > +
> > +	if (attr == hwmon_temp_input) {
> > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > +
> > +		/* HW register value is in degrees, convert to millidegrees. */
> > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > +		return 0;
> > +	}
> 
> ...because here we may drop an indentation level by doing it opposite
> 
> 	if (x != y)
> 		return -E...;
> 

True, but the idea is to allow more cases in the future with minimal changes.

Raag

