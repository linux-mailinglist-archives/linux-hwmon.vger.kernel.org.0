Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30F05BF1A3
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Sep 2022 02:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiIUACS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 20 Sep 2022 20:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbiIUACR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 20:02:17 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C403F30F
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663718537; x=1695254537;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=/x/mG0a0N+FZzBEU5j2mlqaBLd5kIIkifeNjjuv5KGg=;
  b=NcrfHNtPsFeMYciar7IC4UiWtC25vpKXvMMOzUtnL0iHTYTgwLo2fkVc
   ijrnn3Gx+NzrozkLu9vPEvLUItzYMyRgMGSsQcG7NSbv7MUK9TsO5BiKb
   2DewNab9xHFJ+6p7hmHba57MfJXgn59aXWnw9JcWbCfXjII4njWm/cit3
   ZKTD2meKGkX5X4Py3eH60fKGxlTbwkkTlE+HhVnCSWSlirNdQ/MfRdWMY
   HFXWZgMz7xSK2l+3ubKncYqNPt8Dotop0T4xR36Km5jatege9mafPj4iF
   +VQUgn3pPgnqe7vSarfRsK/kNSUmoajy/fhdJdfttDSfqXcgbuDucBx26
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="286921148"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="286921148"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 17:02:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; 
   d="scan'208";a="619119979"
Received: from adixit-mobl.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.209.57.76])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 17:02:16 -0700
Date:   Tue, 20 Sep 2022 17:02:15 -0700
Message-ID: <87h711d27s.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     <intel-gfx@lists.freedesktop.org>, <riana.tauro@intel.com>,
        <anshuman.gupta@intel.com>, <jon.ewins@intel.com>,
        <linux-hwmon@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP setting
In-Reply-To: <20220916150054.807590-4-badal.nilawar@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
        <20220916150054.807590-4-badal.nilawar@intel.com>
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

On Fri, 16 Sep 2022 08:00:50 -0700, Badal Nilawar wrote:
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index e2974f928e58..bc061238e35c 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
>  Description:	RO. Current Voltage in millivolt.
>
>		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		September 2022
> +KernelVersion:	6

Maybe we should ask someone but even if we merge this today to drm-tip this
will appear in kernel.org Linus' version only in 6.2. So I think we should
set this as 6.2 on all patches.

Except for this, thanks for making the changes, this is:

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
