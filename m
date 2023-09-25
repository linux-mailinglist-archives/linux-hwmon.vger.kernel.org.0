Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874E77AD7B4
	for <lists+linux-hwmon@lfdr.de>; Mon, 25 Sep 2023 14:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjIYMIw (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 25 Sep 2023 08:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjIYMIi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Sep 2023 08:08:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81F9CC2
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Sep 2023 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695643692; x=1727179692;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Esft+rDKLhiMoWZ3I/PgnC7bwFHvyGh6+NmReGKWAF0=;
  b=kgn9wPrNUiqEBSI+pnccOQlq0Z7JV0MIRT0zg8Q8DYH2/KjAWZlgL0/O
   V87PQCERbRo/mBmRskF5EiBHG0NQeS93B10KbpzqmAQVNIC9o93BUJz9a
   WiZUhAmA98ui2XlzbVuXFyzZxgL9U81QxNJ1TmR1cFLc17dD2IeaEmOzv
   n7MJ3tGZu/0K0+JxP0Oa4uauMh1iWznPo3K5nG02+utqMXSEfOujHnUit
   6yxhHTuvAOp8/HANkCkRqUjisvDZIT4VUg2poKZjsCQFk3PVF1d3XtbSP
   +/LypXXiFHARi0Nq9Kz3NkD/hpxxAVCwsMLbg0FlDw8g06xxsgSFPJR3a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378501725"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="378501725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="863857641"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="863857641"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost) ([10.252.40.46])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:08:10 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Gupta, Anshuman" <anshuman.gupta@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
Subject: Re: [Intel-xe] [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
In-Reply-To: <CY5PR11MB6211E9C38F74EBB728448AFD95FFA@CY5PR11MB6211.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-2-badal.nilawar@intel.com>
 <ZQxpTss3+OYdbJks@intel.com> <ZQ2vx6CNgDwWW8SU@ashyti-mobl2.lan>
 <CY5PR11MB6211E9C38F74EBB728448AFD95FFA@CY5PR11MB6211.namprd11.prod.outlook.com>
Date:   Mon, 25 Sep 2023 15:08:08 +0300
Message-ID: <871qemo3pz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 22 Sep 2023, "Gupta, Anshuman" <anshuman.gupta@intel.com> wrote:
>> -----Original Message-----
>> From: Andi Shyti <andi.shyti@linux.intel.com>
>> Sent: Friday, September 22, 2023 8:46 PM
>> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Cc: Nilawar, Badal <badal.nilawar@intel.com>; intel-xe@lists.freedesktop.org;
>> linux-hwmon@vger.kernel.org; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> linux@roeck-us.net; andi.shyti@linux.intel.com; Tauro, Riana
>> <riana.tauro@intel.com>; Brost, Matthew <matthew.brost@intel.com>
>> Subject: Re: [PATCH v5 1/6] drm/xe: Add XE_MISSING_CASE macro
>> 
>> Hi Rodrigo,
>> 
>> On Thu, Sep 21, 2023 at 12:03:26PM -0400, Rodrigo Vivi wrote:
>> > On Thu, Sep 21, 2023 at 03:55:14PM +0530, Badal Nilawar wrote:
>> > > Add XE_MISSING_CASE macro to handle missing switch case
>> > >
>> > > v2: Add comment about macro usage (Himal)
>> > >
>> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> > > Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_macros.h | 4 ++++
>> > >  1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_macros.h
>> > > b/drivers/gpu/drm/xe/xe_macros.h index daf56c846d03..6c74c69920ed
>> > > 100644
>> > > --- a/drivers/gpu/drm/xe/xe_macros.h
>> > > +++ b/drivers/gpu/drm/xe/xe_macros.h
>> > > @@ -15,4 +15,8 @@
>> > >  			    "Ioctl argument check failed at %s:%d: %s", \
>> > >  			    __FILE__, __LINE__, #cond), 1))
>> > >
>> > > +/* Parameter to macro should be a variable name */ #define
>> > > +XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
>> > > +				__stringify(x), (long)(x))
>> > > +
>> >
>> > No, please! Let's not add unnecessary macros.
>> 
>> it's not a bad idea, actually... in i915 we have the MISSING_CASE for switch
>> cases with a defined number of cases and print warnings in case none if them
>> is the one inside the switch.
> IMHO Our CI aborts the on MISSING_CASE, which is not recoverable, drm_warn would
> Be better alternative here.

The whole point is that it aborts, so it won't get ignored. It's only
for cases like this.

BR,
Jani.


> Thanks,
> Anshuman Gupta.
>> 
>> It's so widely used and actually nice to have that I thought many times to
>> move it to some core kernel libraries.
>> 
>> Andi

-- 
Jani Nikula, Intel
