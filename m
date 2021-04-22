Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C5B367620
	for <lists+linux-hwmon@lfdr.de>; Thu, 22 Apr 2021 02:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbhDVAQP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 21 Apr 2021 20:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhDVAQP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Apr 2021 20:16:15 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87969C06174A
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 17:15:41 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 35-20020a9d05260000b029029c82502d7bso9148607otw.2
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Apr 2021 17:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wxdWJBsFIpCWitHCpukMjQHR/cyYGLPwsX6nSC2X1VE=;
        b=Nvql/0wkvz9XORSG8CizzjYin75UxE7lxwFADENGK17aDlwiTn0evdDt+2U+fQxeAp
         2F2oWELyednk9dxDXYraGhRG9CyCkgYmUV3cmg4OvOdX1iKTdm3/mS0QFa+RfZSkJ5Vm
         6L3zJkYFE7FV63TG1VG6LLzlCfHjgArkInlse1j/6Colv4h+aZ+nsD5y8xcnGwvJkf2S
         wFD93rp6tqqTUaQ6SMtQR3rk8qkIYEg/8+l28rK0EfCMc0jjsC4HU1y1Zzb/XRIeVooJ
         IvWy3BSK+/QBDDYVuUd1BfYXyEvQDMubSwn7eV9A9mXJj39pFMakHeMTrWg2OJWi9Aoi
         tskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wxdWJBsFIpCWitHCpukMjQHR/cyYGLPwsX6nSC2X1VE=;
        b=j4wNbdVgvJ+HZREywtY73M2jQi/BUacjDnlwY8Vy2qb6GyTQv4jtHprRKy9qje5OzV
         rSAKxOBF0JllX2x2N6Awp1mhcC6vbzCKYRrsQShcHvGh1F5CeuLFKvk+U4bUNVI++0dc
         ys9bV1TM0SjOQHHAu17av/D5Uhcs+M1K/t7s2QFoDJcXCjyAHyLM7fDci7IwociIDhRO
         JhLqQtwNlIer2C0D1CyRo064KOg3ENjIhxlCfO6EplCODkkz0i0cpoEe/zG+SbwtuiaS
         P6orZmdYkTYo9J7W3sseOtJ4B6K/VBZYfJGHLY9Xq/4xzJOfh75QPlLl84YHkwjHaFrv
         qDhA==
X-Gm-Message-State: AOAM530KbzF8e+hkW/JmrikwF8FPhF9cGmgm3fkO5zAHh/tK66mCMKrV
        /Q+a+sXfyUm7+cOKgLHImQqOrW/+Os8=
X-Google-Smtp-Source: ABdhPJyVNzGxD5RbFsyEJTQx3ULtUZ+Nmjk9AwFZt6ysfEPbRIMe3fN7yazBSqd6mjKqXzKZglpKCQ==
X-Received: by 2002:a05:6830:14d3:: with SMTP id t19mr551146otq.95.1619050540017;
        Wed, 21 Apr 2021 17:15:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h25sm248319oou.44.2021.04.21.17.15.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 17:15:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 21 Apr 2021 17:15:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonas Malaco <jonas@protocubo.io>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: PWM control in NZXT Grid+ V3 and Smart Device
Message-ID: <20210422001537.GA134898@roeck-us.net>
References: <20210413124529.jdi6ambxusd47y34@calvin.localdomain>
 <20210421164803.up7ndcsor6gxptj4@calvin.localdomain>
 <20210421172136.GD110463@roeck-us.net>
 <20210421233127.3zriqcf22yw5lvxs@calvin.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421233127.3zriqcf22yw5lvxs@calvin.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 21, 2021 at 08:31:27PM -0300, Jonas Malaco wrote:
> On Wed, Apr 21, 2021 at 10:21:36AM -0700, Guenter Roeck wrote:
> > On Wed, Apr 21, 2021 at 01:48:03PM -0300, Jonas Malaco wrote:
> > > On Tue, Apr 13, 2021 at 09:45:29AM -0300, Jonas Malaco wrote:
> > > > Guenter (and others on this list),
> > > 
> > > Very gentle ping.
> > > 
> > > I also thought posting these questions first would be less disruptive
> > > than a RFC patch, but please let me know if you prefer the latter.
> > > 
> > 
> > It is a difficult subject, and I am struggling myself with the situations
> > you are presenting.
> 
> I am somewhat relieved that these issues are not so silly.  And I really
> appropriate your comments.
> 
> Please take a look at a few more comments bellow.
> 
> > 
> > > Thanks again,
> > > Jonas
> > > 
> > > > 
> > > > I am getting ready to submit a driver for NZXT Grid+ V3 and Smart Device
> > > > (V1) fan controllers, but I am having trouble deciding how to expose
> > > > their PWM control due to some device limitations.
> > > > 
> > > > Before getting into those, let me first give some very basic context...
> > > > 
> > > > These devices are USB HIDs, and asynchronously send "status" reports
> > > > every 200 ms to communicate speed, current, voltage and control mode for
> > > > their channels (one channel per report).
> > > > 
> > > > Fans can be controlled by sending HID output reports to the device, and
> > > > both DC and PWM modes are supported.  The device features a special
> > > > initialization routine (that must be requested during probe) which
> > > > automatically detects the appropriate control mode for each channel.
> > > > 
> > > > Back to the device limitations...
> > > > 
> > > > The first is that PWM values can be set, but not read back.  And neither
> > > > hwmon[1] nor lm-sensors' pwmconfig/fancontrol expect pmw* attributes to
> > > > be WO.  One solution is to have the driver track the PWM values that are
> > > > set through it and return those, but is this acceptable?
> > 
> > I have seen a couple of those recently. I think returning -ENODATA
> > if the value isn't known (yet) is the best possible solution. I thought
> > about adding that to the ABI, actually.
> 
> We can never read the pwm[1-*] attributes, not even for detected and
> controllable fans after the initialization procedure.
> 
> And returning -ENODATA for pwm[1-*] reads makes pwmconfig/fancontrol
> unhappy:
> 

Seems to me that pwmconfig is then maybe not appropriate to use,
and maybe there should be no driver for this device in the kernel
in the first place.

Returning a random value after setting the pwm value to 255, removing,
and re-inserting the driver is, in my opinion, even worse than
returning -ENODATA. After all, the driver doesn't know the pwm value,
and it is really a bad idea to report data which doesn't reflect
reality.

Guenter

> # pwmconfig
> [...]
> Found the following PWM controls:
> cat: hwmon0/pwm1: No data available
>    hwmon0/pwm1           current value: 
> cat: hwmon0/pwm1: No data available
> /bin/pwmconfig: line 201: [: : integer expression expected
> cat: hwmon0/pwm1: No data available
> hwmon0/pwm1 stuck to 
> Manual control mode not supported, skipping hwmon0/pwm1.
> [...]
> 
> # fancontrol
> [...]
> Enabling PWM on fans...
> cat: hwmon0/pwm1: No data available
> Starting automatic fan control...
> /bin/fancontrol: line 551: read: read error: 0: No data available
> Error reading PWM value from /sys/class/hwmon/hwmon0/pwm1
> Aborting, restoring fans...
> cat: hwmon0/pwm1: No data available
> /bin/fancontrol: line 458: [: : integer expression expected
> hwmon0/pwm1_enable stuck to 1
> Verify fans have returned to full speed
> 
> > 
> > > > 
> > > > The other starts with PWM control being disabled for channels that the
> > > > device identifies as unconnected.  This is not in itself a problem, but
> > > > the initialization routine (where the detection happens) is
> > > > asynchronous, takes somewhere around 5 seconds, and we do not have any
> > > > way of directly querying its result.  We only know the control mode of
> > > > each channel (be it DC, PWM or disabled) from the regular status
> > > > reports.
> > 
> > Again, I think the best solution is to return -ENODATA until the value
> > is known.
> 
> Ok.
> 
> > 
> > > > 
> > > > These limitations make it complicated to simply use is_visible() to hide
> > > > pwm attributes of unconnected channels.  We would need to register with
> > > > the hwmon subsystem only after getting enough post-initialization status
> > > > reports for all channels, and this would essentially mean to sleep for
> > > > 6+ seconds.  We would also need to unregister and re-register when going
> > > > through a suspend-reset_resume cycle, because the device may have its
> > > > state wiped, requiring reinitialization.[2]
> > > > 
> > I think the above should resolve that.
> 
> Yes, as well as your suggestion bellow.
> 
> > 
> > > > A different approach to handle this, which I have preferred _so far,_ is
> > > > to use pwm*_enable = 0 to report the unconnected channels to user-space,
> > > > while keeping the other pwm attributes visible.  But this comes with
> > > > other problems.
> > > > 
> > > > First, lm-sensors' pwmconfig expects to be able to write to a
> > > > pwm*_enable attribute if it exists, but the device does not support that
> > > > operation.  The hwmon documentation states that RW values may be RO, but
> > > > pwmconfig is out there and in use.  So far I simply return 0 to attempts
> > > > at those writes, silently ignoring them; functional, but certainly a
> > > > hack.
> > 
> > It is a bad idea to return 0 if the value is not accepted. You could check
> > if the written value matches the current value and return 0 if it does,
> > and an error such as -EOPNOTSUPP or -EINVAL otherwise.
> 
> It worked really well, thanks!
> 
> > 
> > > > 
> > > > Second, if PWM control is disabled for a channel, but its pwm* and
> > > > pwm*_mode attributes are still visible, what should we return when
> > > > user-space attempts to write to them?  The practical answer may simply
> > > > be to return -EOPNOTSUPP, but this makes me wonder if the whole approach
> > > > (of handling these cases with pwm*_enable instead of is_visible()) is
> > > > not doomed.
> > > > 
> > Mode isn't really writeable either, isn't it ? If so, use the same trick as
> > with the _enable attribute.
> 
> You're right, but setting its visibility to 0444 didn't cause issues for
> pwmconfig or fancontrol, so I don't think the trick is necessary here.
> 
> > 
> > The same is effectively true for the pwm value itself: Since both _enable
> > and _mode are effectively read-only, you can accept a write only if
> > fan control is enabled, and return an error if it isn't.
> 
> Ok.
> 
> > 
> > > > A final minor problem is that channels detected as unconnected run at
> > > > 40% PWM, but the documentation for pwm*_enable == 0 is a bit too
> > > > specific: "no fan speed control (i.e. fan at *full* speed)" (emphasis
> > > > mine).
> > 
> > Just document the difference. Reality doesn't always match our expectations.
> 
> Ok.
> 
> Thanks,
> Jonas
> 
> > 
> > Thanks,
> > Guenter
> > 
> > > > 
> > > > Do you have any suggestions and/or recommendations?
> > > > 
> > > > If it helps, a pre-RFC (but functional and mostly clean) version of the
> > > > driver can be found at:
> > > > 
> > > > https://github.com/jonasmalacofilho/linux/blob/p-hwmon-add-nzxt-smartdevice-gridplus3/drivers/hwmon/nzxt-smartdevice.c
> > > > 
> > > > Thanks,
> > > > Jonas
> > > > 
> > > > [1] According to Documentation/hwmon/sysfs-interface.rst.
> > > > [2] The device also does not respond to HID Get_Report, so it is not
> > > >     trivial to check whether it really needs to be reinitialized, since
> > > >     the only symptom of that being necessary is the absence of the
> > > >     asynchronous status reports.
