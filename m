Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158F8744E8D
	for <lists+linux-hwmon@lfdr.de>; Sun,  2 Jul 2023 18:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjGBQLB (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 2 Jul 2023 12:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjGBQLA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Jul 2023 12:11:00 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB763E60
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Jul 2023 09:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688314256; x=1719850256;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=8hQhlQBbsesrJ19kkSzpxWOMdjQTzS2/DmMBgx09RLY=;
  b=TrB4+9k1lknqCGb5+/fA0ShWqWZQ6hAHrfHv7vMdKNVZgONC0WUnTQXR
   XXfQKOIRJ3G+jFX7rf04rObc3mRzAXeQdSHbGMZJxtays6ogHcNMTuzki
   e/0H59m/YZRkzMyR6pcWj3o7u4beafSRiL4Jsm1kvU4QwT63gJ9yYHHON
   lE8N/7s7n/uH4Ku1oA7wR+aKvhOqBDOQbDMz/Z29PI6x6uDXsY2GEUwxD
   /tInq6Nb5xnFGqxyx+bWpibu0yI5PmnQeMLxVR4YMDo5kigywwXNQ3xmu
   WgijQnYQM7qci8pdfJnJpnYWwVIjgaIAOaPq2+As1HQKdAVo/1y4Gb0KC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361566604"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="361566604"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 09:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="695558346"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="695558346"
Received: from adixit-mobl.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.255.228.125])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 09:10:55 -0700
Date:   Sun, 02 Jul 2023 08:57:17 -0700
Message-ID: <874jmme276.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v2 0/6] Add HWMON support for DGFX
In-Reply-To: <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>  <87ilb385fv.wl-ashutosh.dixit@intel.com>        <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 01 Jul 2023 20:02:51 -0700, Guenter Roeck wrote:
>
> On 7/1/23 18:31, Dixit, Ashutosh wrote:
> > On Tue, 27 Jun 2023 11:30:37 -0700, Badal Nilawar wrote:
> >>
> >
> > Hi Badal,
> >
> >> This series adds the hwmon support on xe driver for DGFX
> >
> > Needs some discussion but I have a general comment on this series
> > first. The implementation here follow what was done for i915. But how
> > "hwmon attributes are defined" I think we should look at how this was done
> > in other drm drivers, namely amdgpu and radeon. Look here (search for
> > "hwmon_attributes"):
> >
> > drivers/gpu/drm/amd/pm/amdgpu_pm.c, and
> > drivers/gpu/drm/radeon/radeon_pm.c
> >
> > Here the hwmon attribute definition is very similar to how general sysfs
> > attributes are defined (they will just appear in hwmon directories) and
> > does not carry baggage of the hwmon infrastructure (what i915 has). So my
> > preference is to shift to this amd/radeon way for xe.
> >
>
> You mean your preference is to use a deprecated hardware monitoring
> registration function and to explicitly violate the following statement
> from Documentation/hwmon/hwmon-kernel-api.rst ?
>
>   All other hardware monitoring device registration functions are deprecated
>   and must not be used in new drivers.

I missed that, but since we also have this in ddaefa209c4a ("hwmon: Make
chip parameter for with_info API mandatory"), yes that is what it would
boil down to.

> That is quite interesting. Please elaborate and explain your rationale.

Basically, like those other drm drivers, the chip parameter is of no use to
us (or at least we'd be totally fine not using it), hence the desire to
skip it.

But we are still required to use what we don't need? Do you care about
drivers outside drivers/hwmon?

Thanks.
--
Ashutosh
