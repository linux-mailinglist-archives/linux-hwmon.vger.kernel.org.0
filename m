Return-Path: <linux-hwmon+bounces-3522-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3C894CF7B
	for <lists+linux-hwmon@lfdr.de>; Fri,  9 Aug 2024 13:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6119128210E
	for <lists+linux-hwmon@lfdr.de>; Fri,  9 Aug 2024 11:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425B0192B8A;
	Fri,  9 Aug 2024 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhfQTJgv"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B91EADA;
	Fri,  9 Aug 2024 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723204099; cv=none; b=oTno9mG9PiKgZTlYj2DJi3sIgQRdYcNyHwcT4K8hFflgfF58v1rJq1QvRwuvnR5gCfPVqv+vj20oJPNIslKweSDk4acb/8AWzFXdj+Z6p+P9BRXJb/Z7Odlq56ViGaUNkUKP3s2bqpy92LvH/sQQzFUl501dwrHhqAiLsq+gBJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723204099; c=relaxed/simple;
	bh=qpnMDeRnJlAFCtGqKuynReSNxZ3lj28gwduVzRqU0iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBdD8tvTJfhhdWp4WaVd29IZfDWopKx037GtHHd7pzPMT1bGesG12ovnZrwG+/DfpnbmdhX5JlY2sD+geMmbyBMzSkVbUjmosqLJgm+uMszNqWOdkWd9/P056LwgdB7F1FfYudmolzhyZMRwXfLomvhVW2XphltYVZV+Tko2Tpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhfQTJgv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723204097; x=1754740097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qpnMDeRnJlAFCtGqKuynReSNxZ3lj28gwduVzRqU0iE=;
  b=DhfQTJgvjgyy9tn0GcZk01uuLmq/LJcJcbu8+EXnCLHZNhtJaYwPlHMU
   9+MO3WPWy0EGxliAK96/37/1LwghLeGQwJ53waMZPVLS3bsST9XmYMfPN
   o+SsEh/svflj5NidaQwhbZe+k9NyJDAfMtm1v1gYcwyMTKD3D/VXELWs3
   BCbhywiZmyO8/x7LG8k0iX3EX2qBlK7oKFUs5MTRPkC8N1OFPyI3pm8Mf
   zwuUMzfwKJUhDleI9lwn6DHPK2gBAF/6a/OdImBmMYrlywN2efPVfdLXA
   ClbGpFPrXRseTVVnb4wwm1ME+ho8JMKgA983W2aKO+CUe3sbTHugDRxo3
   w==;
X-CSE-ConnectionGUID: cFfJUehRQTa/xmWcrFPROg==
X-CSE-MsgGUID: e2fTszMcSg2vIiQncyWU3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="46781444"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="46781444"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 04:48:16 -0700
X-CSE-ConnectionGUID: duNv+l5FT+GbHA4UyEjmww==
X-CSE-MsgGUID: xBuRMrSIRiSGYyRs9rFE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="62385693"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 04:48:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1scO6K-0000000DPCp-462l;
	Fri, 09 Aug 2024 14:48:08 +0300
Date: Fri, 9 Aug 2024 14:48:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
	daniel@ffwll.ch, linux@roeck-us.net, andi.shyti@linux.intel.com,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	anshuman.gupta@intel.com, badal.nilawar@intel.com,
	riana.tauro@intel.com, ashutosh.dixit@intel.com,
	karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809061525.1368153-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:
> Add hwmon support for fan1_input attribute, which will expose fan speed
> in RPM. With this in place we can monitor fan speed using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         653.00 mV
> fan1:        3833 RPM
> power1:           N/A  (max =  43.00 W)
> energy1:      32.02 kJ

> v2:
> - Add mutex protection
> - Handle overflow
> - Add ABI documentation
> - Aesthetic adjustments (Riana)
> 
> v3:
> - Declare rotations as "long" and drop redundant casting
> - Change date and version in ABI documentation
> - Add commenter name in changelog (Riana)
> 
> v4:
> - Fix wakeref leak
> - Drop switch case and simplify hwm_fan_xx() (Andi)

I do not understand why we pollute Git history with changelogs, but it's
probably the ugly atavism in DRM workflow.

...

> +hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	return attr == hwmon_fan_input &&
> +	       i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;

Not sure why ternary here, it's not well readable in my opinion.

	if (attr == hwmon_fan_input && i915_mmio_reg_valid(hwmon->rg.fan_speed))
		return 0444;

	return 0;

looks better, no?

> +}

...

> +	/*
> +	 * HW register value is accumulated count of pulses from
> +	 * PWM fan with the scale of 2 pulses per rotation.
> +	 */
> +	rotations = pulses >> 1;

In accordance with the comment the

	rotations = pulses / 2;

looks better.

...

(1)

> +	time = time_now - fi->time_prev;
> +

I think location of this blank line is better at (1) above.

> +	if (unlikely(!time)) {
> +		ret = -EAGAIN;
> +		goto exit;
> +	}

...

> +	/* Convert to minutes for calculating RPM */
> +	*val = DIV_ROUND_UP(rotations * (60 * MSEC_PER_SEC), time);

Have you considered to keep jiffies in the fi and use something from jiffies.h
here? To me it feels like we multiply and divide when it can be avoided.
Please, think about it (I haven't checked myself, just an idea to share).

Also comment probably needs to be expanded to explain the formulas behind all
this.

-- 
With Best Regards,
Andy Shevchenko



