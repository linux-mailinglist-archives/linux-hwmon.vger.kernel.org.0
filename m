Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE7F5BFD19
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Sep 2022 13:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiIULoP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 21 Sep 2022 07:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiIULoI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 07:44:08 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607C78FD67
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663760647; x=1695296647;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jr8iny0hYLPrh53XacmwMPeZ8fjFNGJ5WaPcRdW1ZRs=;
  b=Qp5xUu2fHcXi407nbHbL1x4k6dNP0FJlRfQmJG+d+Rybl0+XctE6/Ku6
   WjcExCIYC5e7CXjGK+o43Un2zO1Il7DN/PmqQQx44rZBRTrkh4qTUYFr3
   3AhZXt/ksrCTfC2pTp18K5/JOqEBVueeotrvtQIsdkbnKOK50Ehx8cXv8
   UpqdMRw0+EWnpJjFwOXBsX5rKd28FfCajdRJYgHn7y8Jz+VftNwLJKb/o
   jYLe8q1TgGn4JGLcH9r8RagbnDIz3k4TDu+zas70KAdqsuX6U6A48/A+x
   2C7kQHWivy3kgItsUWY6+xsajpP4Bx1J9arZcFa/3EtvBUjZ7WOZ2nVRu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="361736128"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="361736128"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 04:44:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="570502643"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO [10.213.205.22]) ([10.213.205.22])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 04:44:05 -0700
Message-ID: <dbbd27bd-da76-c835-2122-89d9e4807a4d@linux.intel.com>
Date:   Wed, 21 Sep 2022 12:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915/hwmon: Power PL1 limit and TDP
 setting
Content-Language: en-US
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>
Cc:     linux-hwmon@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-4-badal.nilawar@intel.com>
 <87h711d27s.wl-ashutosh.dixit@intel.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87h711d27s.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 21/09/2022 01:02, Dixit, Ashutosh wrote:
> On Fri, 16 Sep 2022 08:00:50 -0700, Badal Nilawar wrote:
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> index e2974f928e58..bc061238e35c 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
>> @@ -5,3 +5,23 @@ Contact:	dri-devel@lists.freedesktop.org
>>   Description:	RO. Current Voltage in millivolt.
>>
>> 		Only supported for particular Intel i915 graphics platforms.
>> +
>> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
>> +Date:		September 2022
>> +KernelVersion:	6
> 
> Maybe we should ask someone but even if we merge this today to drm-tip this
> will appear in kernel.org Linus' version only in 6.2. So I think we should
> set this as 6.2 on all patches.

Correct, if merged today it will appear in 6.2 so please change to that 
before merging.

As for the date that's harder to predict and I am not really sure how 
best to handle it. Crystal ball predicts February 2023 fwiw so maybe go 
with that for now. Seems less important than the release for me anyway.

Regards,

Tvrtko

> Except for this, thanks for making the changes, this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
