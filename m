Return-Path: <linux-hwmon+bounces-1740-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8EE8A5E36
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Apr 2024 01:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49C81F229D7
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Apr 2024 23:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7C3158875;
	Mon, 15 Apr 2024 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKGqXdzt"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9BF156977
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2024 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713223275; cv=none; b=HPaeQbZ2YJ9dOy01t5ObsAC7tFWYd34r37uGqLLRAINUjMFr4GIkmKIHWFJpauG+ODow8HG6sWmB9fIlCzRErfLxBz4PcJgMcm+FikPiGfiqOpqd8nFhasGZEilco9+fOakKmVGxq64ceRmMUGI7ewt4cuhuJwdzi9P90nknYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713223275; c=relaxed/simple;
	bh=vEvy1T8t8o8AE+PuQbApxXQ5nE1GkPEl8oDRkxqirj8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+F4xECMcFbuEEgTN8RJASU/glpJK5oCH1ozLinGVrt4tHH66d7xMwXap8lHFq2nPQTzofW74lYU2qijJFszoBypv9o+wBdDf3YcHDd4ti7LnluvQurPJPCRoZbKK045iZHgXn+vQgFIQRKjrzw57quVbW1pD7CqhpV0dGdbHrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKGqXdzt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713223274; x=1744759274;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=vEvy1T8t8o8AE+PuQbApxXQ5nE1GkPEl8oDRkxqirj8=;
  b=gKGqXdztBhyoMlvVxDMz82Z51bJoy1r8OUfBEg0AeBYrS9OYMzUTimYP
   XPgfUomH1pt+sTMcytNQqNWUCkF+Au5CTs8Dx59yLk+IzzzZKHxAbLMqh
   oOHG1h3+V0JfFSDX1okxfxpy4ixXGFo2E4U0Lp6638gQJJpYNRd4ykTWW
   4kQMrJi84ZbsyDzy3SM8WRt6DMQsVXiQQ60vF02ekHzfrJgzJw4bmJU4Q
   qWX5BIGnz8PkVZsCxGX4Q+17vpQqwJjW4d9VRW+sxprQPKKD8kaJpDoiQ
   Fc1yVi2HYDCRCOI0WZDxsIUKvhzRBjrB6wy/9dR52pjZBmhM0vyN3KYPY
   Q==;
X-CSE-ConnectionGUID: 44BMkjm0TD67YAMQEfbmWA==
X-CSE-MsgGUID: nzw8eIV0TBWxt6goI6tLRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8763714"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8763714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 16:21:13 -0700
X-CSE-ConnectionGUID: p0wWK2pySZed5VZrt1d8cQ==
X-CSE-MsgGUID: i7kkI1FESp+0rEpigfRwoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26493097"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 16:21:13 -0700
Date: Mon, 15 Apr 2024 16:21:12 -0700
Message-ID: <85bk6atdp3.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: intel-gfx@lists.freedesktop.org, Badal Nilawar
 <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>, Ville
 =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] drm/i915/hwmon: Get rid of devm
In-Reply-To: <55e00433-71a6-4b41-a65b-0a8871398cdc@gmx.de>
References: <20240413001031.481961-1-ashutosh.dixit@intel.com>	<55e00433-71a6-4b41-a65b-0a8871398cdc@gmx.de>
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

On Sat, 13 Apr 2024 07:43:50 -0700, Armin Wolf wrote:
>

Hi Armin,

> Am 13.04.24 um 02:10 schrieb Ashutosh Dixit:
>
> > When both hwmon and hwmon drvdata (on which hwmon depends) are device
> > managed resources, the expectation, on device unbind, is that hwmon will be
> > released before the drvdata. However, it appears devres does not do this
> > consistently, so that we occasionally see drvdata being released before
> > hwmon itself. This results in a uaf if hwmon sysfs is accessed during
> > device unbind.
> >
> > The only way out of this seems to be do get rid of devm_ and release/free
> > everything explicitly during device unbind.
>
> could it be that the underlying cause for this is the fact that you are using
> devres on a DRM device?
>
> The documentation states that:
>
>	devres managed resources like devm_kmalloc() can only be used for resources
>	directly related to the underlying hardware device, and only used in code
>	paths fully protected by drm_dev_enter() and drm_dev_exit().

I just posted v2 of the patch and updated
https://gitlab.freedesktop.org/drm/intel/-/issues/10366. The updates do
include stack traces for two separate code paths in i915 which release
devres.

Actually I am not sure if this is due to using devres on a DRM device. I
was thinking the PCI device would be more appropriate, but looks like DRM
drivers don't have the parent PCI device available in their data structs.

> That said, since the i915 driver is already removing the hwmon device manually
> with i915_hwmon_unregister(),

Well previously i915_hwmon_unregister() was almost empty (and could
actually be eliminated).

> i agree that not using devres in this case seems to be the solution.

Yeah that seems to me too to be the easiest way out of this situation.

Thanks.
--
Ashutosh

