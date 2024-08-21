Return-Path: <linux-hwmon+bounces-3693-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3279959B26
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Aug 2024 14:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 827AEB20995
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Aug 2024 11:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983F11A2858;
	Wed, 21 Aug 2024 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/8oOeE9"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA30129D19;
	Wed, 21 Aug 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724240355; cv=none; b=ZKH/lFqKMvHJRXUMul5ScQ0zREVMBZM0EtXFDJgjeYOE3+X5C4F7t9+9HNI6MG6sx08iFcxWZsGwOAqtko9+whzuNON+PSor8eK9cmTsd3Xgs9uwQbAVR5i0OToV7IameixoIuYR6GOoTHc+c3heurZJHrBReVDFCQMxzuRBhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724240355; c=relaxed/simple;
	bh=RIiQDcEhoxlNGd/zdSvvh5yA88ICiJ5gJYczwRbow9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq/6qQkOmDXm1qyAY5i50LHOtJFE8LhUz0ANK+keNY68LwueRUqcS8r5Icu9JhaFEBBUY4rsB6I4CmaWexCm5dc3M4+m6RhcxANTG5hZmEg/CQfoBx5gof1D63ka66xJT+TLCvjldruw50OCBF274ljgH7USZS/4SlKIaglqIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/8oOeE9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724240354; x=1755776354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RIiQDcEhoxlNGd/zdSvvh5yA88ICiJ5gJYczwRbow9E=;
  b=n/8oOeE9NxbFWMr9fAFIXpJ24Wfr3MZ8+98OIO5fiLjrthBzdZ3MYZdk
   P9sM+moFeXHJrXFQIvg8EsEdCilTRg0uAiCSUsicn9AzBRES9yQG4Uekq
   nZwQ/dMY5wfJZD6tVzHipDrhWIVGmYC33x/Jr5AYU/tSB15RdzRb7hsz+
   4FoJz6Df67B/dt6DrOHErELc2gGNvaxpfyDP63N3QIciKnE/ee/3Yi98V
   r9SAFmFcSXWlOQEoAS94b9k9MbQYrHIhZHD0Yr+gwzPHp0HR7kKF1ioV+
   hIrotyOo9dOZYwgNpypRRTXh6mCOAZWt2t7wJ7f0BW4waxOgGIAmZOrqM
   g==;
X-CSE-ConnectionGUID: 3fKhCEE6QrOXf3Aros5ouw==
X-CSE-MsgGUID: ZYG22NP1RdamD3kCvGs+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26388901"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="26388901"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:39:13 -0700
X-CSE-ConnectionGUID: hLNacqnqSTS7jGoR+8WWNw==
X-CSE-MsgGUID: /fpYZqKMRs+sTNfuGqUq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65271967"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 04:39:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgjgA-0000000036K-0ABS;
	Wed, 21 Aug 2024 14:39:06 +0300
Date: Wed, 21 Aug 2024 14:39:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
	linux@roeck-us.net, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	badal.nilawar@intel.com, riana.tauro@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v4] drm/i915/hwmon: expose fan speed
Message-ID: <ZsXR2a6XWwc1HZGZ@smile.fi.intel.com>
References: <20240809061525.1368153-1-raag.jadav@intel.com>
 <ZrYB-GI9L2RSc2bt@smile.fi.intel.com>
 <ZrYEQqs0IwDHWkGx@ashyti-mobl2.lan>
 <ZsRbK8TEk5GZDl0C@black.fi.intel.com>
 <ZsUPY4zJwEGAf_t_@intel.com>
 <ZsVkapETDCTtx2_F@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsVkapETDCTtx2_F@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 21, 2024 at 06:52:10AM +0300, Raag Jadav wrote:
> On Tue, Aug 20, 2024 at 05:49:23PM -0400, Rodrigo Vivi wrote:
> > On Tue, Aug 20, 2024 at 12:00:27PM +0300, Raag Jadav wrote:
> > > On Fri, Aug 09, 2024 at 12:57:54PM +0100, Andi Shyti wrote:
> > > > On Fri, Aug 09, 2024 at 02:48:08PM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Aug 09, 2024 at 11:45:25AM +0530, Raag Jadav wrote:

...

> > > > > I do not understand why we pollute Git history with changelogs, but it's
> > > > > probably the ugly atavism in DRM workflow.
> > > > 
> > > > I never liked it! Besides it should even be against the
> > > > submitting patches recommendation.
> > > > 
> > > > I don't understand what interest might have someone in a couple
> > > > of years, reading this commit, knowing an unintellegible list of
> > > > differences between v2 and v3.
> > > > 
> > > > I consider it a random pollution of the commit log.
> > 
> > I agree it is ugly. But I don't agree it is just a 'random polution'.
> > 
> > I consider a valid and very useful information of the patch history.
> > Very useful for a later cross check to know what exactly version
> > of that patch got merged.
> > Useful for distros on backports as well.
> 
> Isn't this why we have 'Link' as part of commit which points to
> actual ML submission?
> 
> > > Isn't it already documented?
> > > Documentation/process/submitting-patches.rst
> > 
> > I think it is:
> > 
> > "Be sure to tell the reviewers what changes you are making and to thank them
> >  for their time.  Code review is a tiring and time-consuming process, and
> >  reviewers sometimes get grumpy.  Even in that case, though, respond
> >  politely and address the problems they have pointed out.  When sending a next
> >  version, add a ``patch changelog`` to the cover letter or to individual patches
> >  explaining difference against previous submission
> > "
> > 
> > Then:
> > 
> > '''
> > Example of a patch submitted by the From: author::
> > '''
> > 
> > defines 'changelog' as the block above the signatures.
> > 
> > And
> > 
> > 'The canonical patch format'
> > 
> > also tells that anything after '---' marker line is for
> > "Any additional comments not suitable for the changelog."
> > 
> > But well, the important part is to have the version information
> > available for reviewers.
> 
> Can still be available below '---' marker.

+1 to what Raag said.

-- 
With Best Regards,
Andy Shevchenko



