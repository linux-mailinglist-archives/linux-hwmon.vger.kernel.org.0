Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8256365103
	for <lists+linux-hwmon@lfdr.de>; Tue, 20 Apr 2021 05:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbhDTDhp (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 19 Apr 2021 23:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbhDTDhW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Apr 2021 23:37:22 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D6DC061763;
        Mon, 19 Apr 2021 20:36:51 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id k18so32737875oik.1;
        Mon, 19 Apr 2021 20:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6XG3fkhjr8ceZuhijXZ4eXGWUd9gy7HjGg3nn0yIwW8=;
        b=gWmYXLeQhuYLVI9cHZEdbFXDvL3y0mgaSoP1ZU3VE/z4oRzVvS/yr8Rfo5CJMc3wjP
         Jqd1QzX4Lq3odDi8Aekls8+ySQwmUcIaFjQuCIr8OpiGIpwtOjmH/aJRfxfI4eLFbQfF
         ogLEiqvv8J8HXApPcPiLN87w7lJ661rnvXwvwo1NS2aZGayANB4T9Nnh3BMaaangMSuF
         z33oKSIiUbCLO7+reSyk8Y3AZpjhlLcDZVXU6ZUOO89NKjLvu4h5SyN5qDwqm7YfPnec
         DzQaqJaBUp9VhDde71gZNjIyKpjjyeOtIPCr2hMr3kCQJIvuM921tcuug3936CTPo/Cv
         X33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6XG3fkhjr8ceZuhijXZ4eXGWUd9gy7HjGg3nn0yIwW8=;
        b=EbOFq4niyusa2XoyDr9wuxhjyjyFdirQ/KEVTEEnMVIAL0z0zuKCGradXZgV8zRn0v
         I2YseUxLwi8LJQ7/8Wlw4cY/DjyRdiRc7Mbz2TzvTF5cwz1Lbg7KkYmtImVksXoElyLM
         2ZIz9dZ/WaMB3jY/wU8aNRhFfwTVS6SIrPcSk59WLgSuHNgS1/INlXKRgICRxoqgMnJi
         EUaOo1Ahopt2lmjfgZSTaLgpGrc8cm9cprPJezqigeabSWjoCa99AoYb9BIOPc8oL3Vu
         gigks3GvIz6tHIdiblxK71xbuoL6PO+qnsywAFto7W3DQJL95x7rIwcUw+1id+AcMIfa
         WQ6g==
X-Gm-Message-State: AOAM531aNyNOxDuYN/RNAYDi3qmaAKoMKb6hRcO6QF48v4fhYG7oQ5GH
        EEXSwk0DlIzC4c64b2WgpBT6m2fR/QM=
X-Google-Smtp-Source: ABdhPJwJZWI9tqpuP/pL5CC/QGebjE08pvie9whyWllC59GxbS/gXXc0/Q2rpA6BUnhqmX7OWJsbOw==
X-Received: by 2002:aca:d693:: with SMTP id n141mr1580814oig.107.1618889810746;
        Mon, 19 Apr 2021 20:36:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b2sm808087otq.80.2021.04.19.20.36.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 20:36:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Apr 2021 20:36:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Mark Brown <broonie@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: Enabling pmbus power control
Message-ID: <20210420033648.GA227111@roeck-us.net>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk>
 <20210330193810.GA235990@roeck-us.net>
 <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH4ukR5egB2eG0Vo@hatter.bewilderbeest.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 19, 2021 at 08:29:53PM -0500, Zev Weiss wrote:
> On Tue, Mar 30, 2021 at 02:38:10PM CDT, Guenter Roeck wrote:
> > On Tue, Mar 30, 2021 at 07:02:00PM +0100, Mark Brown wrote:
> > > On Tue, Mar 30, 2021 at 12:56:56PM -0500, Zev Weiss wrote:
> > > 
> > > > Okay, to expand a bit on the description in my initial message -- we've
> > > > got a single chassis with multiple server boards and a single manager board
> > > > that handles, among other things, power control for the servers.
> > > > The manager board has one LM25066 for each attached server, which acts as
> > > > the "power switch" for that server.  There thus really isn't any driver to
> > > > speak of for the downstream device.
> > > 
> > > This sounds like you need a driver representing those server boards (or
> > > the slots they plug into perhaps) that represents everything about those
> > > boards to userspace, including power switching.  I don't see why you
> > > wouldn't have a driver for that - it's a thing that physically exists
> > > and clearly has some software control, and you'd presumably also expect
> > > to represent some labelling about the slot as well.
> > 
> > Absolutely agree.
> > 
> > Thanks,
> > Guenter
> 
> Hi Guenter, Mark,
> 
> I wanted to return to this to try to explain why structuring the kernel
> support for this in a way that's specific to the device behind the PMIC
> seems like an awkward fit to me, and ultimately kind of artificial.
> 
> In the system I described, the manager board with the LM25066 devices is its
> own little self-contained BMC system running its own Linux kernel (though
> "BMC" is perhaps a slightly misleading term because there's no host system
> that it manages).  The PMICs are really the only relevant connection it has
> to the servers it controls power for -- they have their own dedicated local
> BMCs on board as well doing all the usual BMC tasks.  A hypothetical
> dedicated driver for this on the manager board wouldn't have any other
> hardware to touch aside from the pmbus interface of the LM25066 itself, so
> calling it a server board driver seems pretty arbitrary -- and in fact the
> same system also has another LM25066 that controls the power supply to the
> chassis cooling fans (a totally different downstream device, but one that
> would be equally well-served by the same software).
> 
> More recently, another system has entered the picture for us that might
> illustrate it more starkly -- the Delta Open19 power shelf [0] supported by
> a recent code release from LinkedIn [1].  This is a rackmount power supply

All I can see is that this code is a mess.

> with fifty outputs, each independently switchable via an LM25066 attached to
> an on-board BMC-style management controller (though again, no host system
> involved).  We (Equinix Metal) are interested in porting a modern OpenBMC to
> it to replace the dated, crufty, pre-Linux-Foundation version of OpenBMC it
> currently runs (as found in the linked repo).  The exact nature of the
> devices powered by its outputs is well outside the scope of the firmware
> running on that controller (it could be any arbitrary thing that runs on
> 12VDC), but we still want to be able to both (a) retrieve per-output
> voltage/current/power readings as provided by the existing LM25066 hwmon
> support, and (b) control the on/off state of those outputs from userspace.
> 
> Given the array of possible use-cases, an approach of adding power-switch
> functionality to the existing LM25066 support seems like the most obvious
> way to support this, so I'm hoping to see if I can get some idea of what an
> acceptable implementation of that might look like.
> 

Sorry, that is simply a no-go for the LM25066 driver. I mentioned it before,
and it is still true: The hwmon subsystem is not in the business of power
control.

Have you looked into enclosures (drivers/misc/enclosure.c) ? Maybe that
or something similar could be used for your purposes.

Thanks,
Guenter
