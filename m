Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393FB76DB9F
	for <lists+linux-hwmon@lfdr.de>; Thu,  3 Aug 2023 01:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjHBXe6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 2 Aug 2023 19:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjHBXe5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 19:34:57 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D936C2D4B
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 16:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691019296; x=1722555296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7efkBciRE71+tn2Z25LoetMi/dJ33maLBxNsWpeV1tE=;
  b=kWY51wZqHJ240RjwB+Mpgni+tigiZY/PR2b/9ZoEhYInVAXWLcH9xGuH
   SzQgj1HXc5+I+QsaCDrTNIuCex3VXt+vfCZeKzor6RnCyTO0xf/nyyzEZ
   ilN50a1FTRivFlsOiXRN6dsWa2hzJ7Q0cxhiswxCaDIJTFBx/dOIMJtHL
   0mITvaGvdqJEAMxEn9wYe2oFo6CQ5ckNcU65OIjdjKO0c7bZrBpxs4NVH
   k67Ih0WZ2k8nyHFuiRb7tGTtBb5v3oCVcUUnEy9G60u3TYdCOL2ZPxkFQ
   7owuLEMF1Ds9KD2ATiH/27TUF+C/OeJWuVNLw+MOtohCBijQHw5FYwyC6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433564380"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="433564380"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="975862534"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="975862534"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com) ([10.252.38.55])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:34:53 -0700
Date:   Thu, 3 Aug 2023 01:34:51 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Message-ID: <ZMroG8SWDMDHtsOL@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
 <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

[...]

> > > +static const struct hwmon_channel_info *hwmon_info[] = {
> > > +	NULL
> > > +};
> > 
> > just:
> > 
> >    static const struct hwmon_channel_info *hwmon_info[] = { };
> > 
> > would do.
> > 
> 
> What would be the point ? This is just a placeholder, and we need
> a NULL entry at the end.

right... this series needs to be read from the end to the
beginning :)

Andi
