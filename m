Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E0A5FDD97
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Oct 2022 17:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiJMPxX (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Oct 2022 11:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiJMPxW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 11:53:22 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B41100BD5
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665676401; x=1697212401;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=1FaekfIfmCYS51XaYw2eEPToJK6znIRfinHhGeoGJfM=;
  b=BzNiqHCwxqwXvXqIiSFRFLGt4PlOR23xf8tvL+CTRRiBMT41khhjpcTk
   gu+7q/3SUU5dTvlAcHU3cit+hGu3nYb5RzgvL0PmBZyC0M+cK/Dm5dDe+
   55Z/8efrl8bi4DVYiEZ235xtCyCXFxeeOuHSKul9aTPes2T3nmwTo8TES
   qK+8Y/+uLfQQHBK9CqTtNNy97JnaiP6+dPye3vJ55PDQanKs+KwVVFRp6
   dD6MPpZgr9u0faTVo5AwoFGSY5DcJE89f+cs092gyKj/722Zo58MR2wx3
   6rE3XPdyCdsgZdeI87zr82NEUh7ObhQmLrMMZ7udcl7ACtVrVAMteTUyD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="306190020"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="306190020"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:53:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="716392596"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="716392596"
Received: from sudhars1-mobl.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.212.216.120])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 08:53:20 -0700
Date:   Thu, 13 Oct 2022 08:53:19 -0700
Message-ID: <87edvbsosw.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org, riana.tauro@intel.com,
        jon.ewins@intel.com, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/7] drm/i915/hwmon: Show device level energy usage
In-Reply-To: <4062cc45-1b29-eb7b-3858-55f3d6ce17b5@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>   <20220916150054.807590-5-badal.nilawar@intel.com>       <4062cc45-1b29-eb7b-3858-55f3d6ce17b5@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 21 Sep 2022 05:02:48 -0700, Gupta, Anshuman wrote:
>
> > diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> > index b74df11977c6..1014d0b7cc16 100644
> > --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> > +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> > @@ -191,7 +191,9 @@
> >     #define PCU_PACKAGE_POWER_SKU_UNIT
> > _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> >   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> > +#define   PKG_ENERGY_UNIT                      REG_GENMASK(12, 8)
> Please use tab here instead of space to line up with above macros.

Fixed in v9.

> With that,
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>

Thanks.
