Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C4126361B
	for <lists+linux-hwmon@lfdr.de>; Wed,  9 Sep 2020 20:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728971AbgIISeh (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 9 Sep 2020 14:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgIISef (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Sep 2020 14:34:35 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8FCC061755
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2020 11:34:34 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id g128so4225986iof.11
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2020 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cc1mTJ4YBbjlfzPf25X2vuH8TH88kzjymIjnYwRDABQ=;
        b=cc2Qt1f4dpUC0QpPCXg+9Y9XLHMA8xk6SiF4s5nmfrtFNkxDNTaG9UecXJsuyI+qKu
         4uk4C9AxB33jv2tLG4CDXx6E8VpPQAeLG/oD9Jy7QsgmSfWzrRmK9QJHt+tZ2KnrJPEN
         l1l7iHZWQXFC62PlvMDliggM6kXjdhhSib5wbP7JRdAIBVceTg+n0crB7GqY9SqwmSgy
         3g2tQrPYRRWyMKaQiFKxUcMG6DxHO7x263SxL4be5W6CzxtNbAVbt8f+j8zm1MDX/8Vq
         6N5BN/J1ZZCK0KUuyeiSBa4vAMF+V75zVCllRN6ERTjnW1/ltYGFkU9V0OufLgeRg6X8
         Cnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cc1mTJ4YBbjlfzPf25X2vuH8TH88kzjymIjnYwRDABQ=;
        b=SjXZk+CmHV9jz8gniJ1/ZPk61Ao4w7sKocCSZDg3qjhxNdkkX0uF7+ay3f6izdADfi
         YJoE5A+l+VRRK1RYJDQpKiAxGR/dgYRkmPJXUmLBzG4UEdG0tmBHDSoNTi6fuTKIwCKQ
         q1P56FSv4lz5QDyNSSE1YvNhYvQuna9q01a+wDqh7tBiBoGz00VkBXGFOvI54Wiw/Q5r
         /Dm2AOtfojNdQL94sBtMx7K3k1tFL4/8os+3m6j1dk/t7IhJ0sAHM01/MutC3j8gYSFH
         WtppyGbNzmT+jn91na1DrAwlE1bj1WfTssyPoT+doWnMJIE4v/EfjmxUKWd+/lPslbiI
         pOXA==
X-Gm-Message-State: AOAM531YTBraWNCNz5MQPTAXLJVDwBBsv2cDtoaZRX/JI/B8FbDPxHRg
        bUn/oyPt9Y6OyGTGOhDCz2oQFzL17GoKpjZg/yGARA==
X-Google-Smtp-Source: ABdhPJxYIuKJ2FPIIDSc4fLvVsbvhDs4vwhRgTwzcnsP3YQbp/Eiiw42aHUKGWVr36iO8wKIwRx2XebS9rnI749AuKw=
X-Received: by 2002:a6b:bc82:: with SMTP id m124mr4580365iof.172.1599676473721;
 Wed, 09 Sep 2020 11:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-5-luka.kovacic@sartura.hr> <CAHp75VfwPa9zL6HCz+qqXJ1rK2JB=ewRiK1qdrgsyxixA5R5Lg@mail.gmail.com>
 <20200909103638.GB9222@amd> <CAHp75VcV6Tn8dVjWhOW7bfcjwA_Vabw91FJ=OYit3e1rvPp1qQ@mail.gmail.com>
In-Reply-To: <CAHp75VcV6Tn8dVjWhOW7bfcjwA_Vabw91FJ=OYit3e1rvPp1qQ@mail.gmail.com>
From:   =?UTF-8?B?THVrYSBLb3ZhxI1pxI0=?= <luka.kovacic@sartura.hr>
Date:   Wed, 9 Sep 2020 20:34:22 +0200
Message-ID: <CADZsf3ZH5BAJO_0+sWtXfZuOMdOmJGFWaU_AmgOt0wDjt2_U0g@mail.gmail.com>
Subject: Re: [PATCH 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello everyone,

I'm sending the email again, as I didn't send it as plain text
earlier, sorry.

Thanks for the comments, I'll review them and fix the issues.

This is currently the only iEi Puzzle series device that is using this
microcontroller. Their Intel-based platforms most likely will not use
this MCU, as they resorted to using more standard components there.

Some upcoming iEi Puzzle ARM-based boards might also implement this
microcontroller, so I do agree that using the new API would be beneficial
to future proof the driver.

Kind regards,
Luka

On Wed, Sep 9, 2020 at 3:52 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Sep 9, 2020 at 1:36 PM Pavel Machek <pavel@ucw.cz> wrote:
> > > > Add support for the iEi WT61P803 PUZZLE LED driver.
> > > > Currently only the front panel power LED is supported.
> > > >
> > > > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> > >
> > > Can we make it OF independent?
> > > See below how to achieve this.
> >
> > Is there reason to believe this will be found in non-OF systems?
>
> It's one aspect. Another one is to give a better example to anybody
> who might use this to copy'n'paste from. I believe that most of the
> LED drivers can appear on non-DT systems.
>
> --
> With Best Regards,
> Andy Shevchenko
