Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEC55241DF
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 May 2022 03:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349832AbiELBLA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 11 May 2022 21:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349819AbiELBKy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 21:10:54 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926D614094
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 18:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652317853; x=1683853853;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eG1I0LmqIM56qFRZEAXBa57oIYTbHT2pvMcEusbtzkg=;
  b=SO+QM8XkLg+2ulvZZYH8//NP3bT4rbsSXJctPgxQSj/AAtZihBy/ESuh
   BAaaojDVa8NjT/nSEmpKqoOh4jeMIfEPA2N6TXqATdIQYcFQLUMguzYk0
   5Jf3rUm9GBebwKZO9C85URyVvDxEucS+xRKBzXRS4sHspLyBxb7MzpoZ1
   Hgimvj5UcT6Y9s21DwYsYiPPm+Rr6M66hkUt9cJkRFeIjw95cM9mSz0ku
   d8uiDSO4VI8tm77M+DBGZq8iXmos6tKSFfQJQz6bVny712kGa8LTEPJv+
   Abw6znwdr52ln+2iVYT07zzsSkPi8OuHP1V4zfh56t/hSepbt8NBGcK6c
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="257403261"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="257403261"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 18:10:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="542549898"
Received: from hshen9-mobl1.ccr.corp.intel.com ([10.249.175.117])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 18:10:51 -0700
Message-ID: <ea1f69ef0b02dec7201765f4df870f477e58049f.camel@intel.com>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
From:   Zhang Rui <rui.zhang@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
Date:   Thu, 12 May 2022 09:10:48 +0800
In-Reply-To: <4b9b0b06-c5a9-df99-6b76-75e670513179@roeck-us.net>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
         <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
         <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
         <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
         <4b9b0b06-c5a9-df99-6b76-75e670513179@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, 2022-05-11 at 17:10 -0700, Guenter Roeck wrote:
> On 5/11/22 09:53, Guenter Roeck wrote:
> [ ... ]
> 
> > > If this could happen in real life, we cannot rely on a fixed
> > > hwmon_chip_info and attribute_groups at driver registration
> > > phase.
> > > 
> > 
> > You have a point. However, if anything, that means that we might
> > have
> > to improve/extend the hwmon API to make attributes visible or
> > invisible
> > dynamically (ie add an API call such as hwmon_update_visibility()
> > and have it call sysfs_update_groups()).
> > 
> 
> Actually, adding a new API function isn't even necessary. A call to
> sysfs_update_groups(hwdev->groups) (where hwdev is the device pointer
> returned by the hwmon registration function) should do.
> 
> We could still add an api function for clarity, but all it would do
> would be to execute that call. That would be cleaner, but it isn't
> technically necessary.

Agreed.
Calling sysfs_update_groups() should be sufficient.

Given that Labbe already has done a lot of work on this conversion, I
will leave this to Labbe.

thanks,
rui


