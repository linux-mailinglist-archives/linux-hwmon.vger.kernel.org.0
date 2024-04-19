Return-Path: <linux-hwmon+bounces-1802-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 086288AA66C
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Apr 2024 03:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21D71F22451
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Apr 2024 01:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C05D387;
	Fri, 19 Apr 2024 01:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asG3HBlf"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18450A55
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Apr 2024 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713488732; cv=none; b=OWKpEbsaLs7dCNDtnLeIZojoeHWqsVS5D9pO3xZ/J2FsgkkMMIm4WFxSdY6atKGCh2I7uU4p4FaNsAJNa8dqCA3fRhBJbjnueLw0L1VXBbP2/rDexwsh6kTPWaAM7X0tbTqc5N/XjK9jacc1Lt/snxVHDCpah5xkZ+y/SwBjtXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713488732; c=relaxed/simple;
	bh=zmJIOTVSXHNG/1LS4rD4f4JmQ99V51giJdVFbZDMLj8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYa5WlKbNLXDm/SG/HUZrDrip75r0HfGWAFbBDFijt8EqBnd7vGdByTuXT3A1HNIS+5XNH8URFBsrs098lO/FlopB8V4LWrf8hHKIICL9Gvd9Bzdn4zPoUWuZyeRyrLW0mNBI+j8TMc76Ad4sLuzhOHMhDMhXd5iyir7z8DRPSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asG3HBlf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713488730; x=1745024730;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=zmJIOTVSXHNG/1LS4rD4f4JmQ99V51giJdVFbZDMLj8=;
  b=asG3HBlfcM2IyKtaTlcAZOWFEk6GVta6OD1mpfW6N5/hryLe1tl/8zwD
   HgJ7G9q6LSzfP+5v1MtlJ1R5IU0MnPcWN3DXaYlmiVVMTEB+jI9ZPSoIZ
   0ihnaOZc7xH76kBSOFP0jWgwtP3/MMocZ7DnxASPVQokpBz5WLI2cCHCs
   YE5NFTA+YghdDgsdvkLvANpXqi8/vCv20FEcNScXxfmQ+6rPyws7sTxZq
   aV2drmNfIcdiY9GUEaQdnUspDf3RPRK474kuEVQACIGL8jDS5Zq0SC/eb
   PHDuYFM/CMfC6d/n/XyDqgwkY4x2KsZg4naRXARzzNzRebv6f/2wkbHh4
   g==;
X-CSE-ConnectionGUID: p0fsvLpAQ4Cc1lVDV/gCUg==
X-CSE-MsgGUID: yKi0+fiHSPiwJVdkKWBZbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12907673"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="12907673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:05:29 -0700
X-CSE-ConnectionGUID: UHzZUvgxQsugT+iRKiDQiA==
X-CSE-MsgGUID: IWrBIqJCTrGaQrH8u7FkEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23787894"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com) ([10.165.21.138])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 18:05:30 -0700
Date: Thu, 18 Apr 2024 18:05:29 -0700
Message-ID: <857cgucgbq.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc:<intel-gfx@lists.freedesktop.org>,	Badal Nilawar
 <badal.nilawar@intel.com>,	Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>,	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Jani\ Nikula" <jani.nikula@linux.intel.com>,<linux-hwmon@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/hwmon: Get rid of devm
In-Reply-To: <ZiGXKrheNEJlk56X@ashyti-mobl2.lan>
References: <20240417145646.793223-1-ashutosh.dixit@intel.com>
	<ZiGXKrheNEJlk56X@ashyti-mobl2.lan>
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

On Thu, 18 Apr 2024 14:56:58 -0700, Andi Shyti wrote:
>
> > v2: Change commit message and other minor code changes
> > v3: Cleanup from i915_hwmon_register on error (Armin Wolf)
> > v4: Eliminate potential static analyzer warning (Rodrigo)
> >     Eliminate fetch_and_zero (Jani)
> > v5: Restore previous logic for ddat_gt->hwmon_dev error return (Andi)
>
> Thanks!
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks a lot Andi, merged!

Ashutosh

