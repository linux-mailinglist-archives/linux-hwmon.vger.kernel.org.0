Return-Path: <linux-hwmon+bounces-290-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12FD800E04
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 16:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2080EB20DDD
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 15:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243DB47A79;
	Fri,  1 Dec 2023 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6Ool6KX"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFCDA8;
	Fri,  1 Dec 2023 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701443304; x=1732979304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKdliyNqcy1CrB4xqyUAFpb2fs1SNe7ofuDciphcd0w=;
  b=n6Ool6KXaj8nWYy3OI1UvwyPXfuZm1gtXul2jIItZmi6Ba3dAEC41VHR
   eSNBteupX2rw7WeVoyrv+MMRnunX13VCuoILtzwRTOODDC/0102ubLWkA
   KXHqxiDCOj6C7N20vGJTXKIdA6J6jvLFpB741HnMypbXN5i4096IFzAv3
   c5TPLemdAXAjCP845kVS9USCvOGvv7Wg18zRDAISUXWtK4kx72YAZhZmg
   RMEI8VVCmuMsyGemqduRyc6UgaAZWY7Vcd+IwdDRWC9wLRbfJmwW6On/S
   aL0xoE99k0dpT9pf8cAQ/cbLmSJgFLmsXqjlYSdmmHJDqdgErMLbfy8xp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="12222099"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="12222099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="804098597"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="804098597"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 07:08:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r957p-000000011EQ-3dxA;
	Fri, 01 Dec 2023 17:08:17 +0200
Date: Fri, 1 Dec 2023 17:08:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Tremblay <etremblay@distech-controls.com>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 2/3] hwmon: tmp513: Simplify with dev_err_probe()
Message-ID: <ZWn24UbVpYzXc1JX@smile.fi.intel.com>
References: <20231128180654.395692-1-andriy.shevchenko@linux.intel.com>
 <20231128180654.395692-3-andriy.shevchenko@linux.intel.com>
 <1ef66c53-d9ba-4fca-8462-b670f029f5de@roeck-us.net>
 <ZWnlRAOG7EP3RyPR@smile.fi.intel.com>
 <a77968c8-fd40-4221-96be-740aecdb5e84@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a77968c8-fd40-4221-96be-740aecdb5e84@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Dec 01, 2023 at 06:51:32AM -0800, Guenter Roeck wrote:
> On 12/1/23 05:53, Andy Shevchenko wrote:
> > On Thu, Nov 30, 2023 at 08:10:12PM -0800, Guenter Roeck wrote:
> > > On Tue, Nov 28, 2023 at 08:06:03PM +0200, Andy Shevchenko wrote:

...

> > > > +	if (IS_ERR(data->regmap))
> > > > +		return dev_err_probe(dev, PTR_ERR(data->regmap), "failed to allocate register map\n");
> > > 
> > > That line length was getting too long. Please consider running checkpatch
> > > on your patches.
> > 
> > I got your point, but checkpatch has no limit for the string literals, see
> > 
> > f4c014c0dede ("checkpatch: allow printk strings to exceed 80 characters to maintain their searchability")
> > ca56dc098caf ("checkpatch: check for quoted strings broken across lines")
> > 
> > So, what the exact parameters should I supply to it?
> 
> None. Please just run checkpatch.
> 
> $ scripts/checkpatch.pl index.html
> WARNING: line length of 102 exceeds 100 columns
> #126: FILE: drivers/hwmon/tmp513.c:729:
> +		return dev_err_probe(dev, PTR_ERR(data->regmap), "failed to allocate register map\n");

Ah, thanks!

-- 
With Best Regards,
Andy Shevchenko



