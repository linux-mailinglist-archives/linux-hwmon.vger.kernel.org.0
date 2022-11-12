Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 641EF62682E
	for <lists+linux-hwmon@lfdr.de>; Sat, 12 Nov 2022 09:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbiKLIh6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 12 Nov 2022 03:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiKLIh6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Nov 2022 03:37:58 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC88F49
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 00:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668242276; x=1699778276;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=51E5QfpL9NehLqog2fxNsvTGUBTS/QIKOtEzb2n6rQI=;
  b=BAAZvWF31b+ebRTzxyAYJZwckMJvy6X7VOIIc+1zo4WSR8raXHV6+quq
   MTGYEbT0uq35Me0CW6wMfTJ6rM6juMzcYvUGvdsQUMsT/nkuHxNILW4TB
   RsdxHS8vgp0MT5AzlE53DvngMPhq2SVmreO51IU5OuSUawLgNefAXvqBq
   XTdK53f4uRuTyENYVhX00OM+XL61PU9K66z8XldJMDrPqMrKGI1pHlqpz
   nmTPEWPML2vUZaqspUy0E7/zeftiJYs9ApL/Pm4qX3y3Sk0/NcieD2Xd3
   XWaMOA9AbQtQRITuREKir+uAFOF91ryfU0JUa96NU9WlR7GOfd9ZLf9/y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="291434877"
X-IronPort-AV: E=Sophos;i="5.96,159,1665471600"; 
   d="scan'208";a="291434877"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2022 00:37:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="743512007"
X-IronPort-AV: E=Sophos;i="5.96,159,1665471600"; 
   d="scan'208";a="743512007"
Received: from nshukri-mobl.gar.corp.intel.com ([10.214.152.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2022 00:37:54 -0800
Message-ID: <59a59d1d69c2647ff2cd62d72d6613660db29d7d.camel@intel.com>
Subject: Re: [PATCH 3/3] hwmon (coretemp): Add support for dynamic ttarget
From:   Zhang Rui <rui.zhang@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Date:   Sat, 12 Nov 2022 16:37:50 +0800
In-Reply-To: <20221111213402.GA1059716@roeck-us.net>
References: <20221108075051.5139-1-rui.zhang@intel.com>
         <20221108075051.5139-4-rui.zhang@intel.com>
         <20221111213402.GA1059716@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi, Guenter,

Thanks for reviewing the patches.
I will address the comments in next version. And also some comments
below.

On Fri, 2022-11-11 at 13:34 -0800, Guenter Roeck wrote:
> >  
> >  /* Keep track of how many zone pointers we allocated in init() */
> >  static int max_zones __read_mostly;
> > @@ -150,8 +150,17 @@ static ssize_t show_ttarget(struct device
> > *dev,
> >  {
> >  	struct sensor_device_attribute *attr =
> > to_sensor_dev_attr(devattr);
> >  	struct platform_data *pdata = dev_get_drvdata(dev);
> > +	struct temp_data *tdata = pdata->core_data[attr->index];
> > +	int ttarget;
> > +
> > +	mutex_lock(&tdata->update_lock);
> 
> Is that mutex really necessary ? I don't immediately see the need
> for it.

I just followed the same pattern as show_crit_alarm().
I checked the history and it was introduced by commit 723f573433b2
("hwmon: (coretemp) Fixup target cpu for package when cpu is
offlined"), to make sure the msr is not running on an offlined cpu.

> > +
> > +	/*
> > +	 * ttarget is valid only if tjmax can be retrieved from
> > +	 * MSR_IA32_TEMPERATURE_TARGET
> > +	 */
> > +	if (tdata->tjmax)
> > +		return -ENODEV;
> > +
> > +	if (c->x86_model <= 0xe || c->x86_model == 0x1c)
> > +		return -ENODEV;
> > +
> 
> Does it really make sense to re-check this each time the target
> temperature
> is read ?

You're right. We can keep this as it was, when deciding whether to
create this sysfs attr or not. Then the check in get_ttarget() can be
removed.

thanks,
rui

