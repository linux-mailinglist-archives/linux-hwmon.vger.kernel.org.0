Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E97CF58F49D
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Aug 2022 01:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiHJXAH (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 10 Aug 2022 19:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbiHJW76 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 18:59:58 -0400
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8806612F
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 15:59:57 -0700 (PDT)
Received: from hatter.bewilderbeest.net (97-113-235-229.tukw.qwest.net [97.113.235.229])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6A704716;
        Wed, 10 Aug 2022 15:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1660172397;
        bh=DXF3e/+JB6QPYScRB9h5RhcrVbgyhnyHCcCQhWNC2Yk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oJGBCkfuB2ys2AyGLAr2Etg2JzbM0CAcuyAwOQ9tH6NfLD0/Gm9eSlja7xY4b/C3V
         T5AiIq2Dc030PDndtq/k6UcdXEhEgpCRHiDAjOZruzbMxsoHNa2QXRwFbhxIXBfdr8
         tvsx7esMWTZQeadGP3ki5LUezKe9LtrT6h8SoIaw=
Date:   Wed, 10 Aug 2022 15:59:56 -0700
From:   Zev Weiss <zev@bewilderbeest.net>
To:     =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: PROBLEM: NCT6775: suspend doesn't work after updating to Linux
 5.19
Message-ID: <YvQ4bPgW31/VRZtJ@hatter.bewilderbeest.net>
References: <f5990ef1-4efe-d2b1-8e50-c6890526c054@gmail.com>
 <YvLJ9TQeXP/miUgT@hatter.bewilderbeest.net>
 <03c9bdca-846e-cd47-f628-6fc38bd0c27b@gmail.com>
 <YvLg/tuMEn9Mc1Tp@hatter.bewilderbeest.net>
 <c3c24f03-1c77-2b12-d499-4589e8d72f59@gmail.com>
 <YvMMRm0rA5q+Gjtj@hatter.bewilderbeest.net>
 <a270a9d0-2ff7-5331-fdbc-b074ba8a750e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a270a9d0-2ff7-5331-fdbc-b074ba8a750e@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 10, 2022 at 01:22:04AM PDT, Zoltán Kővágó wrote:
>On 2022-08-10 03:39, Zev Weiss wrote:
>>On Tue, Aug 09, 2022 at 04:50:20PM PDT, Zoltán Kővágó wrote:
>>>On 2022-08-10 00:34, Zev Weiss wrote:
>>>>On Tue, Aug 09, 2022 at 02:28:20PM PDT, Zoltán Kővágó wrote:
>>>>>On 2022-08-09 22:56, Zev Weiss wrote:
>>>>>>On Tue, Aug 09, 2022 at 01:27:48PM PDT, Zoltán Kővágó wrote:
>>>>>>>Hi,
>>>>>>>
>>>>>>>[1.] One line summary of the problem:
>>>>>>>NCT6775: suspend doesn't work after updating to Linux 5.19
>>>>>>>
>>>>>>>[2.] Full description of the problem/report:
>>>>>>>After updating my kernel from 5.18.11 to 5.19, I've 
>>>>>>>noticed that resuming after suspend no longer works: fans 
>>>>>>>start up, then about a second later, the computer just 
>>>>>>>shuts down, leaving the USB ports powered up (normally it 
>>>>>>>turns them off on shutdown). The screens don't turn on 
>>>>>>>during this timeframe, so I can't see any useful log 
>>>>>>>messages.
>>>>>>>
>>>>>>>Bisecting between 5.18 (where it still worked) and 5.19 
>>>>>>>lead me to commit c3963bc0a0cf9ecb205a9d4976eb92b6df2fa3fd 
>>>>>>>"hwmon: (nct6775) Split core and platform driver" which 
>>>>>>>looks like a refactor commit, but apparently it broke 
>>>>>>>something.
>>>>>>>
>>>>>>
>>>>>>Hi Zoltán,
>>>>>>
>>>>>>Thanks for the thorough bug report.  You're right that that 
>>>>>>commit was essentially just a refactor, though there was one 
>>>>>>slight change to the nct6775_suspend() function introduced 
>>>>>>during the review process that may perhaps have had some 
>>>>>>subtle unintended side-effects.
>>>>>>
>>>>>>Can you test the following patch and report if it resolves 
>>>>>>the problem?
>>>>>>
>>>>>>
>>>>>>Thanks,
>>>>>>Zev
>>>>>
>>>>>Hi Zev,
>>>>>
>>>>>Thanks for the quick reply. Yes, it looks like your patch does 
>>>>>solve the problem (I've applied it on top of 5.19 (after 
>>>>>fighting with my mail client for a while) and suspended a few 
>>>>>times, it's working so far).
>>>>>
>>>>>Regards,
>>>>>Zoltan
>>>>
>>>>Great, thanks.
>>>>
>>>>Guenter, it looks like nct6775_suspend() really does in fact 
>>>>need to use nct6775_update_device() instead of 
>>>>dev_get_drvdata(), though it's not immediately obvious to me 
>>>>why.  Though given that the bulk of of the body of 
>>>>nct6775_update_device() is inside an 'if' block that might not 
>>>>necessarily execute every time, I also wonder if it might be 
>>>>vulnerable to exhibiting the same problem depending on timing.
>>>>
>>>>Zoltán, if you could try another experiment to try to gather 
>>>>some data on that -- with the patch from my previous email still 
>>>>applied, could you try suspending via:
>>>>
>>>>    $ cat 
>>>>/sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input 
>>>>&& echo mem > /sys/power/state
>>>
>>>Tried it, three times in fact, and it worked fine every time. 
>>>Looking at the dmesg, though, it looks like it needs a bit more 
>>>than 1.5 sec to suspend. Where's that 1.5 sec limit defined? I 
>>>will try to increase it tomorrow.
>>>
>>
>>The 1.5 second duration comes from this line in nct6775_update_device():
>>
>>   if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
>>
>>Each 'HZ' represents one second, so HZ + HZ / 2 = 1.5 sec; if you 
>>want to lengthen it you could do e.g. 10 * HZ or something instead.
>
>Tried that, this isn't the problem.
>
>>
>>Though as Guenter noted, one other possibility is that with the 
>>previous (buggy) version nct6775_update_device() might never have 
>>gotten called at all -- do you know if that might be the case on 
>>your system?  (i.e. do you have any userspace monitoring program or 
>>the like that would have been reading from the nct6775 device's 
>>sensors?)  If something like that never ran between the driver 
>>getting loaded and the system suspending, that might also 
>>(partially) explain things; to test that out you could revert to the 
>>old buggy code and see if the suspend problem still occurs if you 
>>explicitly run
>>
>>   $ cat /sys/bus/platform/drivers/nct6775/nct6775.*/hwmon/hwmon*/*_input
>>
>>(or just 'sensors' if you've got the lm-sensors package installed).  
>>That will
>>ensure that nct6775_update_device() gets called before the suspend 
>>operation, which could help narrow things down further.
>
>Yup, this was it. It looks like I remembered it wrong and my 
>monitoring widget in the end only used k10temp and not nct6798, so I 
>could very easily suspend without any reads from nct6775 before (and 
>that widget itself even only ran when I had an X session).
>
>Regards,
>Zoltan

Great, glad that's confirmed.  The fix is now in Linus's tree and should 
presumably get picked up in the -stable tree for 5.19.1.

Thanks for the bug report & testing!


Zev

