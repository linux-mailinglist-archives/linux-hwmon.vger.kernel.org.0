Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 680E7553A89
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Jun 2022 21:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351929AbiFUT3Z (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 21 Jun 2022 15:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354187AbiFUT3Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Jun 2022 15:29:24 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0896DF3B
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jun 2022 12:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655839763; x=1687375763;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=u8lmk+uEDcfyawfI2LfV8MblKawjvQVDnAtOTZFq9+s=;
  b=TIyHgVSc4W7M5n86+dOYDQk6wE8JXzus5s4z5nmpZJngDRF+ZkIivRQZ
   vy8djarTdYbbPk7f0+EWiTksQp3BnUmYVoslsXZMkBOfb76RR8H3mVRHZ
   5gSIbEXxxMFmDpZqd4u/Th4tJA6+PmbMA14LFIhX4G6PbwkBvJOQBdpU+
   TYeI4zZgyDcGwdkI4HgnTHqBgScYyLXUIfzZtfb9Zrku1WeFSEofELan4
   7FaEylordamDf62qF1SNAa8G9QKiLFdKrF8De0sXncly7Nf3czqZKiY3P
   krODZWgUVACWr+zaV44koWfIuNBlHqcoWT0HwGdgAaVCkLF27I1me29Tg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="344209700"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="344209700"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 12:29:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="690095956"
Received: from adixit-mobl1.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.212.210.152])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 12:29:22 -0700
Date:   Tue, 21 Jun 2022 12:29:21 -0700
Message-ID: <874k0dvmr2.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org, anshuman.gupta@intel.com,
        jon.ewins@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/i915/hwmon: Add HWMON power sensor support
In-Reply-To: <20220621174421.GA3456551@roeck-us.net>
References: <20220620204649.894703-1-badal.nilawar@intel.com>   <20220620204649.894703-4-badal.nilawar@intel.com>       <4277d384-147a-6de4-abe3-3b64b9dae207@roeck-us.net>     <87bkumv7q2.wl-ashutosh.dixit@intel.com>        <20220621174421.GA3456551@roeck-us.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 21 Jun 2022 10:44:21 -0700, Guenter Roeck wrote:
>
> On Mon, Jun 20, 2022 at 11:41:41PM -0700, Dixit, Ashutosh wrote:
> > On Mon, 20 Jun 2022 13:58:49 -0700, Guenter Roeck wrote:
> > Hi Guenter, Thanks for taking a look.
> >
> > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > index 24c4b7477d51..945f472dd4a2 100644
> > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
> > > >   Description:	RO. Current Voltage in millivolt.
> > > >			Only supported for particular Intel i915 graphics
> > > > platforms.
> > > > +
> > > > +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> > > > +Date:		June 2022
> > > > +KernelVersion:	5.19
> > > > +Contact:	dri-devel@lists.freedesktop.org
> > > > +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> > > > +
> > > > +		The power controller will throttle the operating frequency
> > > > +		if the power averaged over a window (typically seconds)
> > > > +		exceeds this limit.
> > > > +
> > > > +		Only supported for particular Intel i915 graphics platforms.
> > > > +
> > > > +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_default
> > >
> > > I don't immediately see the reason for not using the standard power1_cap
> > > attribute, which is described as
> > >
> > >		If power use rises above this limit, the
> > >                 system should take action to reduce power use.
> > >
> > > and pretty much matches the description above.
> >
> > Sorry I believe you are referring to the description above which is for the
> > standard power1_max attribute (as we have used it). The non-standard
> > attribute is power1_max_default the description for which is below ("Card
> > default power limit (default TDP setting)").
> >
>
> If you use power1_max to limit power consumption if exceeded, power1_cap
> might have been more appropriate.

Looks like in this case the file name is ok but the problem is with the
description (which does not correspond to what PL1 is). Will fix.

> > > > +Date:		June 2022
> > > > +KernelVersion:	5.19
> > > > +Contact:	dri-devel@lists.freedesktop.org
> > > > +Description:	RO. Card default power limit (default TDP setting).
> >
> > Actually we do not want to use custom hwmon attributes as far as
> > possible and are looking for some guidance on which standard attributes
> > which we should use instead.
> >
> You could possibly have used power1_rated_max instead of power1_max_default.

Yes looks like this might work for TDP. We will consider this.

> > These are the power attributes we are interested in: the two above and
> > another one which will come in a future patch:
> >
> > 1. PL1 (RW)
> >
> >    https://www.hardwaretimes.com/intel-10th-gen-cpu-power-consumption-explained-pl1-pl2-and-tau/
> >
> > 2. TDP (RO)
> >
> >    https://en.wikipedia.org/wiki/Thermal_design_power
> >
> Not sure I understand the difference between 'default TDP' (RO),
> 'TDP' (RO), and PL1.

'default TDP' (RO) and 'TDP' (RO) are the same but PL1 is somewhat
different from TDP (see the first link above) and also I believe chip
makers specify PL1 and TDP separately (as in this case).

> > 3. Tau (RW)
> >
> >    https://www.hardwaretimes.com/intel-10th-gen-cpu-power-consumption-explained-pl1-pl2-and-tau/
> >
> > Would you be able to suggest if there are standard hwmon attributes which
> > we would be able to use for these three? We also want to use the read/write
> > permissions as shown above.
> >
>
> There are a number of standard power attributes available to set or report
> limits (cap, cap_max, cap_min, max, crit, rated_min, rated_max). I would
> suggest to pick from that list whatever you think fits best. I don't have
> a recommendation for Tau.

OK, in that case would a custom setting for Tau also be ok?

> Either case, when reporting power, make sure you don't hit any of the
> security issues which caused power reporting to be deleted for other CPUs.
> Restricting read access to hwmon attributes for non-privileged users is not
> acceptable.

OK, I believe you are referring to 9049572fb145. Will keep this in mind too.

Thanks.
--
Ashutosh
