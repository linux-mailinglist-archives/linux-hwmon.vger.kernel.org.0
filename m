Return-Path: <linux-hwmon+bounces-288-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9501800C98
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 14:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A380728130A
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078BF3B2B3;
	Fri,  1 Dec 2023 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAwd83db"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64241A6;
	Fri,  1 Dec 2023 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701438793; x=1732974793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ub9mgjqgK5kv69AKSxuHPaODWlRDLdyKhrwmElxQA2Q=;
  b=TAwd83dbqIZT/3Gr4jzRTGRwfq14gpZ65gcP/8SY0XgCcnAqJcrP0TB2
   MBkTP00/63Kq14ih4Ox6V1hOoJ2TCqYW90kzZN9KTuBbeNLVlXjigIZxw
   hA76CKf9ZzCx2pGdVMeXycM0ssVcLKw13I/LiI+YoUzyGciNTSrJ2Mgin
   ADmRmXfo5U0mry0zLqIU7UpLKnltY4yMOm8b+AwyvQrC8evNGQnErs4nJ
   b4lXl/CfnX4mERK8+13FjPWN6/YR2cokSwbJYiyntQwolMYfnh3BmE81o
   y7nt1MzmVhOLT6O8SuEEVuWi14uTsOmMobQONRAQEB7L3KMn3ZNO2j8/2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383894770"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="383894770"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 05:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="804076770"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="804076770"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 05:53:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r93x6-000000010GN-3YAW;
	Fri, 01 Dec 2023 15:53:08 +0200
Date: Fri, 1 Dec 2023 15:53:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Tremblay <etremblay@distech-controls.com>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 2/3] hwmon: tmp513: Simplify with dev_err_probe()
Message-ID: <ZWnlRAOG7EP3RyPR@smile.fi.intel.com>
References: <20231128180654.395692-1-andriy.shevchenko@linux.intel.com>
 <20231128180654.395692-3-andriy.shevchenko@linux.intel.com>
 <1ef66c53-d9ba-4fca-8462-b670f029f5de@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ef66c53-d9ba-4fca-8462-b670f029f5de@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 08:10:12PM -0800, Guenter Roeck wrote:
> On Tue, Nov 28, 2023 at 08:06:03PM +0200, Andy Shevchenko wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.

...

> > +	if (IS_ERR(data->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(data->regmap), "failed to allocate register map\n");
> 
> That line length was getting too long. Please consider running checkpatch
> on your patches.

I got your point, but checkpatch has no limit for the string literals, see

f4c014c0dede ("checkpatch: allow printk strings to exceed 80 characters to maintain their searchability")
ca56dc098caf ("checkpatch: check for quoted strings broken across lines")

So, what the exact parameters should I supply to it?

-- 
With Best Regards,
Andy Shevchenko



