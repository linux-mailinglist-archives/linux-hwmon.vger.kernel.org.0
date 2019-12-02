Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6811510F32C
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 Dec 2019 00:10:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLBXJ6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 2 Dec 2019 18:09:58 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33288 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfLBXJ6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Dec 2019 18:09:58 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so724751plb.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Dec 2019 15:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7NBXyHlTDec0AiSYuMPEMRsO11GxeDZRkVykVmZ668s=;
        b=M0BJ2TfYLqNeQQ+CCAjdf+JytS5XOcKLQATOkqQcBgZLaPa46yS2H+EdqyOSe4ANaN
         bVsO8MDeFwOfQOgScrVT+u/IWe0yrywcIAdjML0aR/UYFRYCf3NzfIBsXkpLGx0rjBzr
         7G+pdcLEmas9SWF2UeOjl9DcwGRXRHOPsjL8DTRgWnTWGKas/ocPdi0GZuEmf5ZltqwX
         wZZz+W9+PnLqcEb/LsT9quS1O6eACn1uVO+WDVt9BkNqeG3rWDGnPe+b582Z88J3mZmd
         ebE5T3ZnFVXahz8iMX6e0sG/uziT2tCYaoeV3LtH7mOOWp31TkbXHUdulbmotFiKVknk
         5Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=7NBXyHlTDec0AiSYuMPEMRsO11GxeDZRkVykVmZ668s=;
        b=tQh8oaRsNibnbo7BAuA8Yw4nn/O0waeuts8LDHEP89EOvzLjX5n5svU6Ry0izbM5nD
         OfCHDdkSkniupAXNAuTBQovZM4Qg6vUJK71qhfbEBH6uAi2CAQRym1C0/2YSqdz4TjHO
         yRciRZXqYb7n2Ndwd/v47wtzcGQuA64zy2qQxGL0TrMC3QLkd/A5cJYefZ5utjPPhlb4
         tLZFzwJ2nZei4VPRj7Vx04NDGa0hkqUOizBd8fFoBi/WcoFjMJTXosLJoHr1aNDsaQZo
         x2ISR1zLPNueKNrex+RKU20CJ8nOOtvX5qUh+OEJnQWyp4P4GfCkpBVAWdwuqsZPkeDO
         dvxQ==
X-Gm-Message-State: APjAAAXjBvwKBnmtVQ7CufAhqxnYI4/GAg94Y8if+Nx5ZZv0lF6ync1L
        Qddw7/U6zfeBQ8/Fdsfhse0=
X-Google-Smtp-Source: APXvYqw+ltrpsP7bUbTLawteJ4+Pn30JQWOz5Fa4sMSdEC6cIOnU/YTyk8W9++e+TcRRbgs1Kb3vow==
X-Received: by 2002:a17:90a:23a9:: with SMTP id g38mr1894340pje.128.1575328197152;
        Mon, 02 Dec 2019 15:09:57 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m5sm390306pjl.30.2019.12.02.15.09.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 15:09:55 -0800 (PST)
Date:   Mon, 2 Dec 2019 15:09:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Corey Ashford <yeroca@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [RFC] hwmon: add support for IT8686E to it87.c
Message-ID: <20191202230953.GA9421@roeck-us.net>
References: <CALUKdZ_-pjXPouBYxdm_LriN04Jp-vR5+7SBMkCK1reV2Lq_LA@mail.gmail.com>
 <4e6fda8d-761a-741a-d4af-5dc8ea5fe072@roeck-us.net>
 <CALUKdZ9pDpMNeKY4wb21gxF7Dqdp=9CJLTEmeRNtDP1N1Pw_9A@mail.gmail.com>
 <e4b5b93e-65ee-dd23-93a6-1737ede87ef4@roeck-us.net>
 <CALUKdZ9CZWf6KVyPMhsQGLvVN_Ec8JRmVddf=aZw0JOv-5bixQ@mail.gmail.com>
 <20191202175224.GC29323@roeck-us.net>
 <CALUKdZ8GeTiSDieFnCeK_wTr52FoUcfZUYkco7wBL-2rO+Fe1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALUKdZ8GeTiSDieFnCeK_wTr52FoUcfZUYkco7wBL-2rO+Fe1g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Dec 02, 2019 at 02:33:27PM -0800, Corey Ashford wrote:
> On Mon, Dec 2, 2019 at 9:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Dec 02, 2019 at 09:07:10AM -0800, Corey Ashford wrote:
> > > On Mon, Dec 2, 2019 at 6:32 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On 11/29/19 8:48 PM, Corey Ashford wrote:
> > > > > On Fri, Nov 29, 2019 at 8:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > >>
> > > > >> On 11/29/19 6:11 PM, Corey Ashford wrote:
> > > > >>> Hello folks.  I am running a newly-built system that uses an IT8686E
> > > > >>> chip.  Currently, the latest kernel from kernel.org doesn't have code
> > > > >>> in drivers/hwmon/it87.c to support it, however, I found some source on
> > > > >>> the net which has added support for quite a few more variants of that
> > > > >>> brand of Super I/O chip:
> > > > >>> https://github.com/xdarklight/hwmon-it87/blob/master/it87.c
> > > > >>> I tried it out by building the module and "insmod"ing it into my
> > > > >>> running system, and it appears to work fine.
> > > > >>>
> > > > >>> It seems the original developer had a difficult time pushing the
> > > > >>> changes upstream, so he abandoned the project.
> > > > >>>
> > > > >>
> > > > >> I abandoned the project (and dropped the driver from my github page)
> > > > >> because people started _demanding_ that I push the driver from github
> > > > >> upstream, without offering any assistance whatsoever.
> > > > >>
> > > > >>> My thought was that I could add support for just the IT8686E chip as a
> > > > >>> single patch, and since I can test it locally I would have a better
> > > > >>> chance of getting the patch accepted.  The changes to the source at
> > > > >>> the above git tree have quite a number of changes that aren't really
> > > > >>> necessary for supporting the IT8686E chip, so I think the patch could
> > > > >>> be pretty small, but will still credit the original author.
> > > > >>>
> > > > >>
> > > > >> IT8686 is a multi-page chip, meaning you'll need the entire protection
> > > > >> against multi-page accesses by the EC in the system. It also supports
> > > > >> the new temperature map. I don't think it is that simple.
> > > > >>
> > > > >> Guenter
> > > > >
> > > > > Thanks for the quick reply!
> > > > >
> > > > > When you said they didn't offer any assistance, do you mean assistance
> > > > > with testing?  If so, how about if the support is trimmed out for the
> > > > > newly-added chips that have no available test system volunteers, and
> > > > > then slowly add those back as people make test systems and testing
> > > > > time available.  Should I presume that you have access to one or more
> > > > > systems with the added ITnnnn chips?  I volunteer my system for
> > > > > testing the IT8686E support.
> > > > >
> > > >
> > > > Testing and, more importantly, detailed code review. No one but me has
> > > > seriously (if at all) scrutinized that code for years. Just picking it
> > > > into mainline and hope that it won't cause trouble is, by itself, troublesome.
> > > >
> > > > On top of that, the multi-page access problems are well known by board vendors
> > > > using this chip as well as by the chip vendor. Yet, neither board vendors nor
> > > > ITE talk with kernel developers. The workarounds I implemented are based on
> > > > information I got from one of the Windows tools developers, and are not
> > > > validated by any board vendor nor by ITE. Every board vendor I tried to contact
> > > > tells me that they don't support Linux, and I never got any reply from ITE.
> > > > I do know that the code causes problems on early Gigabyte board using the 8686
> > > > and similar multi-page chips. Just accessing the chip from Linux may cause trouble
> > > > because the built-in EC tries to access it as well in parallel (I suspect this
> > > > causes the board to reset because that access is turned off for a while by
> > > > the driver). This is all fine for an out-of-tree driver, but it would be
> > > > unacceptable in the upstream kernel.
> > > >
> > > > In summary, you'll not only need to port the code, you'll also need to establish
> > > > contact to ITE and/or to board vendors to ensure that the code works as intended
> > > > with the EC on the affected boards.
> > > >
> > > > Guenter
> > >
> > > Ah, thank you for your detailed explanation.  How you did as much as
> > > you did is beyond me.  ITE's web site seems to lack any usable
> > > information, and doesn't even list the IT8686 as one of their chips.
> > > Other "supported" chips don't appear to have any documentation easily
> > > available, other than a very generic-y description of the chip.  Quite
> > > an uphill battle for marginal gain.
> > >
> > Exactly. The only real recommendation I have at this time is for anyone
> > running Linux to stay away from boards with ITE chips.
> >
> > > Is it possible there's a way to access the sensors by using the EC as
> > > a proxy, rather than trying to gain direct and exclusive access to the
> > > sensors?  Just a thought.  I have no idea of the architecture of these
> > > things.  Your mention of EC was the first I had heard of it :/
> > >
> >
> > Not that I know of, sorry. The EC is actually running inside the Super-IO
> > chip(s). I have no idea if and how it is accessible from Linux. Either case,
> > that would be even worse, since EC programming is board vendor specific.
> >
> > Guenter
> 
> Just for my clarification, it seems that what you're implying is that
> the embedded EC still uses the SMbus to access those paged registers,
> and so needs to use the same mechanism that an external device would
> use.  If that's true, ugh.  If it has its own private access to the
> entire register set in one "address space", it could bypass the paging
> mechanism.
> 

There are typically two Super-IO chips on those boards. For example,
Gigabyte B450 AORUS M has an IT8792 and an IT8686. The EC on one chip
accesses the other chip through the I2C interface. Or at least that is
what I think is happening... hard to be sure without board/chip vendor
support.

Some of the recent chips solve the problem by memory mapping the entire
register space (unpaged) into memory. This way the Linux driver (and the
Windows driver) can access chip registers directly without having
to select a page. That isn't supported on the 8686, unfortunately.

Guenter
