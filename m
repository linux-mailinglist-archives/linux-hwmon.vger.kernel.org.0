Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42517AF9F3
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 Sep 2023 07:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjI0FT4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 27 Sep 2023 01:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjI0FTM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Sep 2023 01:19:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD864270D
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 22:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695791527; x=1727327527;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=m3y38+V2jqpPkfp6RXEHppUhYdYqEIq0rFeM15KsyDY=;
  b=jjuQXdG6HaW+6gO+jx9ZjeGxOWIyu5gn9H+teFab56RmYT7Yp0EPBoQt
   YxgppPgaYLphFMr/fekDNWSnXeaiHzENvbceDlEWeZkCcsQYo4Zn7l5jx
   Y/M5n3aZwooDhfXi9L0G8QBXThvoUTH35gvSKPmd0u6zU0QC10Vj1SiIg
   I093AWO51nZfwBvGLYaL5a4jCc5RWgmTKKWlzRKOBy991H8mDbW7pzOx5
   mwBTi6Fr00IqCtA17TL+7Rzeruyy4ulsJU9m7chw0zUWZNDS65f/cUPet
   4/01+x1Myf/iiiq156COU617LdQYg7IsYaAIwc7e9gjJkIcGQ+1y4NVQk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445863330"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="445863330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 22:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814724854"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="814724854"
Received: from yangtaey-mobl.amr.corp.intel.com (HELO adixit-arch.intel.com) ([10.209.123.136])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 22:12:06 -0700
Date:   Tue, 26 Sep 2023 21:53:29 -0700
Message-ID: <874jjg1ak6.wl-ashutosh.dixit@intel.com>
From:   "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To:     Badal Nilawar <badal.nilawar@intel.com>
Cc:     <intel-xe@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
        <anshuman.gupta@intel.com>, <linux@roeck-us.net>,
        <andi.shyti@linux.intel.com>, <riana.tauro@intel.com>,
        <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 1/5] drm/xe/hwmon: Expose power attributes
In-Reply-To: <20230925081842.3566834-2-badal.nilawar@intel.com>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
        <20230925081842.3566834-2-badal.nilawar@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/29.1 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 25 Sep 2023 01:18:38 -0700, Badal Nilawar wrote:
>
> +static umode_t
> +xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		    u32 attr, int channel)
> +{
> +	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));

Maybe we do xe_device_mem_access_get/put in xe_hwmon_process_reg where it
is needed? E.g. xe_hwmon_is_visible doesn't need to do this because it
doesn't read/write registers.

Also do we need to take forcewake? i915 had forcewake table so it would
take forcewake automatically but XE doesn't do that.

Thanks.
--
Ashutosh
