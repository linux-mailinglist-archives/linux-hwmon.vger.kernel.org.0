Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A784D365C05
	for <lists+linux-hwmon@lfdr.de>; Tue, 20 Apr 2021 17:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbhDTPTl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 20 Apr 2021 11:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhDTPTk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Apr 2021 11:19:40 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745F9C06174A;
        Tue, 20 Apr 2021 08:19:07 -0700 (PDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1925421B;
        Tue, 20 Apr 2021 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1618931946;
        bh=oQsjsO0Yl4yjifxeL/OMKHJvvkUd/jcIQKwEeqW7BDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rgqiz1wtPfW54DSKSL8gCSziB2bmtE2CHeyGWJk1RuLk7ibMPtNNu7Bt2PHu3+c8Z
         ZOuCiZcBM/zHQK256DVdxfxB5ykkIbES9HH5dRcI1T4STN3KcU/1oPvc69wQVO3pFg
         ndAZyKi+o0BH+U87lPpQNYnVXAJubvSV0sr06DyE=
Date:   Tue, 20 Apr 2021 10:19:04 -0500
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mark Brown <broonie@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: Enabling pmbus power control
Message-ID: <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
References: <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk>
 <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
 <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
 <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 20, 2021 at 05:52:16AM CDT, Guenter Roeck wrote:
>On 4/20/21 12:06 AM, Zev Weiss wrote:
>> On Tue, Apr 20, 2021 at 01:00:25AM CDT, Guenter Roeck wrote:
>>> On 4/19/21 10:50 PM, Zev Weiss wrote:
>>> [ ... ]
>>>
>>>> I had a glance at the enclosure driver; it looks pretty geared toward SES-like things (drivers/scsi/ses.c being its only usage I can see in the kernel at the moment) and while it could perhaps be pressed into working for this it seems like it would probably drag in a fair amount of boilerplate and result in a somewhat gratuitously confusing driver arrangement (calling the things involved in the cases we're looking at "enclosures" seems like a bit of a stretch).
>>>>
>>>> As an alternative, would something like the patch below be more along the lines of what you're suggesting?  And if so, would it make sense to generalize it into something like 'pmbus-switch.c' and add a PMBUS_HAVE_POWERSWITCH functionality bit or similar in the pmbus code instead of hardcoding it for only LM25066 support?
>>>>
>>>>
>>>
>>> No. Don't access pmbus functions from outside drivers/hwmon/pmbus.
>>>
>>> I used to be opposed to function export restrictions (aka export namespaces),
>>> but you are making a good case that we need to introduce them for pmbus
>>> functions.
>>>
>>> Guenter
>>
>> Okay -- I figured that was likely to be frowned upon, but the alternative seemed to be effectively duplicating non-trivial chunks of the pmbus code.  However, upon realizing that the LM25066 doesn't actually require any of the paging work the generic pmbus code provides, I suppose it can actually be done with a simple smbus read & write.  Does this version look better?
>>
>
>It is just getting worse and worse. You are re-implementing regulator
>support for the lm25066. The correct solution would be to implement
>regulator support in the lm25066 and use it from the secondary driver
>(which should be chip independent).
>
>Guenter
>

Implementing it by way of regulator support seems like it would make 
sense, but that in turn sounds like it would then end up just being a 
reimplementation of REGULATOR_USERSPACE_CONSUMER, which (unless there 
was some more subtle distinction that I missed) Mark already told me in 
no uncertain terms is not the way to go.  So I hope I could be forgiven 
for feeling a bit stuck here.

Mark, do you have any further input on what a viable approach might look 
like?


Thanks,
Zev

