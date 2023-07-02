Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F41745249
	for <lists+linux-hwmon@lfdr.de>; Sun,  2 Jul 2023 22:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjGBUeo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 2 Jul 2023 16:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjGBUen (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Jul 2023 16:34:43 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695AEE6
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Jul 2023 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688330082; x=1719866082;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=7eBhRgqyFzpFC5DVC4MgzmUoDpalDn5pA7JaWPPwasc=;
  b=Oimh9fW+yTK0tVXuVig5a/xZbc4rs8MCv/ndysKqeXNNR985/KqaDm7C
   mRGUfXurhwD1iXHmO93lYv+uZuoV13ayW9QlAT1R1tT734lY1B6FzLMpE
   7tJw0eKvId6iMAmq54x2n/BoW40RPRORJgkB2SDE/t0Iko0W+ZAlRrUT1
   kNCM7uAlA/aYVBMerOpmUPdefklZP+avs4lUxL3rVj2yU3mS5XIGh5dst
   iWA8n4QOM1Js257tCBXSRq6WqTCCrVq0zdxIU+766qUZcgbgfUn4IV1YC
   9arvks5bHC6QYQHQWN7YnR0+q6RjNjyN5D+cCc3aIeykS2iA2IAZZ2uVH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="360213896"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="360213896"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 13:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="831580250"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="831580250"
Received: from adixit-mobl.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.255.228.125])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 13:34:41 -0700
Date:   Sun, 02 Jul 2023 13:29:44 -0700
Message-ID: <873526dpl3.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v2 0/6] Add HWMON support for DGFX
In-Reply-To: <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>  <87ilb385fv.wl-ashutosh.dixit@intel.com>        <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>     <874jmme276.wl-ashutosh.dixit@intel.com>        <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
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

On Sun, 02 Jul 2023 10:01:00 -0700, Guenter Roeck wrote:
>
> On 7/2/23 08:57, Dixit, Ashutosh wrote:
> > On Sat, 01 Jul 2023 20:02:51 -0700, Guenter Roeck wrote:
> >>
> >> On 7/1/23 18:31, Dixit, Ashutosh wrote:
> >>> On Tue, 27 Jun 2023 11:30:37 -0700, Badal Nilawar wrote:
> >>>>
> >>>
> >>> Hi Badal,
> >>>
> >>>> This series adds the hwmon support on xe driver for DGFX
> >>>
> >>> Needs some discussion but I have a general comment on this series
> >>> first. The implementation here follow what was done for i915. But how
> >>> "hwmon attributes are defined" I think we should look at how this was done
> >>> in other drm drivers, namely amdgpu and radeon. Look here (search for
> >>> "hwmon_attributes"):
> >>>
> >>> drivers/gpu/drm/amd/pm/amdgpu_pm.c, and
> >>> drivers/gpu/drm/radeon/radeon_pm.c
> >>>
> >>> Here the hwmon attribute definition is very similar to how general sysfs
> >>> attributes are defined (they will just appear in hwmon directories) and
> >>> does not carry baggage of the hwmon infrastructure (what i915 has). So my
> >>> preference is to shift to this amd/radeon way for xe.
> >>>
> >>
> >> You mean your preference is to use a deprecated hardware monitoring
> >> registration function and to explicitly violate the following statement
> >> from Documentation/hwmon/hwmon-kernel-api.rst ?
> >>
> >>    All other hardware monitoring device registration functions are deprecated
> >>    and must not be used in new drivers.
> >
> > I missed that, but since we also have this in ddaefa209c4a ("hwmon: Make
> > chip parameter for with_info API mandatory"), yes that is what it would
> > boil down to.
> >
>
> The chip parameter covers all standard hwmon sysfs attributes. A hwmon driver
> without standard sysfs attributes is not a hwmon driver. It abuses the hwmon
> subsystem and its API/ABI.

To me, hwmon is a means to expose some standard attributes to standard
userspace apps so that those apps can find those attributes. What kernel
API's are used internally is an internal matter of the kernel. As subsytem
maintainer you may have reasons for allowing only certain API's.

> If I catch such a driver, I'll NACK it. If I find one in the kernel, I
> will do my best to get it removed.
>
> >> That is quite interesting. Please elaborate and explain your rationale.
> >
> > Basically, like those other drm drivers, the chip parameter is of no use to
> > us (or at least we'd be totally fine not using it), hence the desire to
> > skip it.
> >
> > But we are still required to use what we don't need? Do you care about
> > drivers outside drivers/hwmon?
> >
>
> I would suggest to read the hwmon API more closely to understand it. Your claim
> that "the chip parameter is of no use to us" is simply wrong, as should be obvious
> when you read this submission. Actually, if you would convert the other
> drm drivers to use it, it would reduce the size of the hwmon specific code
> in those drivers, typically by 20-40%. Given that, I must admit that I am quite
> baffled by your claim. Maybe you could explain that in more detail.

Of course when the chip parameter helps it likely reduces code. But when it
is not needed it adds unnecessary code. Those drm drivers
(amdgpu/radeon/i915) I mentioned above are available in the kernel, anyone
can see and judge for themselves.

Of course people might have been abusing the deprecated API's (or NULL chip
parameter) but to me it seems there is also some legitimate use for them.

> Of course, I care about use of the hardware monitoring subsystem
> outside drivers/hwmon. Unlike other maintainers, I let people register drivers
> from outside that directory, but that doesn't mean that I don't care.
>
> FWIW, you are close to convincing me to add a warning message to the kernel
> to tell users of deprecated hwmon APIs that the API is deprecated.
> Alternatively, I may stop permitting new hwmon drivers outside drivers/hwmon.

OK, thanks for clarifying, since you disagree we will not use deprecated
API's, so we will continue with the approach taken in this series.

Ashutosh
