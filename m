Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFB65A59CB
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Aug 2022 05:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiH3DPt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 29 Aug 2022 23:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH3DPo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2022 23:15:44 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90A77D1FF
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Aug 2022 20:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661829342; x=1693365342;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=r7ToRVv/oXCMQZupiqpbIgiIhrndlEsMz11PilAmA4c=;
  b=h1Gb64r7ii01ip8Yf2BszpJQB+wHszLM+qWk0RpHVrWzb9U+1AO6pQow
   TWpSbiHUxZLN4VQeq8k929T/1Nb538l8hGGWsKqET06j8MWKn8CrDU07d
   fftYucx1QQotLHxNb4WZ5oDHsrd3EsQjYSOBz0acRJm5soz3x7RTmhO8m
   ZOAtY8oi2ZE8bxIllwV4qT0O+EBT/XvdPDxJB8OrNfxJHzpkF9cSNOb18
   6yvO9A3LLH2GyN0LhzaWwDbF6vpgr59rf85H6a5iVr0VSp5rZ1KMyPcYa
   hp6KFKTsE3D2lddMy5+gzW594PuZXSzWXp+QPywQtHF+bx+Kj6qbPRbiU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="292643405"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="292643405"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 20:15:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="856950279"
Received: from adixit-mobl.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.252.143.205])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 20:15:42 -0700
Date:   Mon, 29 Aug 2022 20:14:50 -0700
Message-ID: <87ilmazal1.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     <intel-gfx@lists.freedesktop.org>, <riana.tauro@intel.com>,
        <anshuman.gupta@intel.com>, <jon.ewins@intel.com>,
        <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/7] drm/i915/hwmon: Show device level energy usage
In-Reply-To: <20220825132118.784407-5-badal.nilawar@intel.com>
References: <20220825132118.784407-1-badal.nilawar@intel.com>   <20220825132118.784407-5-badal.nilawar@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 25 Aug 2022 06:21:15 -0700, Badal Nilawar wrote:
>
> From: Dale B Stimson <dale.b.stimson@intel.com>
>
> Use i915 HWMON to display device level energy input.
>
> v2:
>   - Updated the date and kernel version in feature description

A few things to delete below but since no other changes this is:

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 9a2d10edfce8..03d71c6869d3 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
>  Description:	RO. Card default power limit (default TDP setting).
>
>		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		June 2022
> +KernelVersion:	5.19

Need to update kernel version on all patches now at least to 6.0 if not
6.1.

> +static int
> +hwm_energy(struct hwm_drvdata *ddat, long *energy)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_energy_info *ei = &ddat->ei;
> +	intel_wakeref_t wakeref;
> +	i915_reg_t rgaddr;
> +	u32 reg_val;
> +
> +	rgaddr = hwmon->rg.energy_status_all;
> +
> +	if (!i915_mmio_reg_valid(rgaddr))
> +		return -EOPNOTSUPP;

Delete two lines above. Something like this is only needed if we have
i915_hwmon_energy_status_get() which we are deleting
below. hwm_energy_is_visible() takes care of making the sysfs node
invisible when something cannot be supported and has the same check.

> +int
> +i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy)
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +
> +	return hwm_energy(ddat, energy);
> +}

Let's delete this function, there are no users for it at present.

> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> index 7ca9cf2c34c9..4e5b6c149f3a 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.h
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -17,4 +17,5 @@ static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>  static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
>  #endif
>
> +int i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy);

Delete.
