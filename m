Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9193527A17D
	for <lists+linux-hwmon@lfdr.de>; Sun, 27 Sep 2020 17:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgI0PBF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 27 Sep 2020 11:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgI0PBF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Sep 2020 11:01:05 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13A8C0613D4
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2020 08:01:04 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y74so8410238iof.12
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2020 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6XWqSgpr9w+Cpv2RWf3dg57txkghmrOFhF+JT7YUUFo=;
        b=Hx67KdK+eLb1KhFlN+brjEytuno5Nb4kE/ImIazivnLcepkU2GnunWk/4nf/JOIgrX
         xGqa1rFYLOMSxk3VeAOY5ajGOHjOrfT2nUwEUyTkb5gMiaJEzdX1IOfcdLuhwb3jXP4U
         GMhbH7VJakdCkSHjuT5tLm2BgtFYScLY0+8FcDpX5Tvw77gpS3N+YpYA2IPrHd+VFt7y
         uo55QNeGd16WRKmS55HxA9spA1abVNxkLvhyS3hZiCEyn0RQDPgaexzalPBjnm+xmcZW
         MUEtvhz+p6pFf63OgIPX8iulwsRprts2Tl/BzkTj0FIOt6kQSo1/YgAQeb8n9sja6jeK
         Ag1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6XWqSgpr9w+Cpv2RWf3dg57txkghmrOFhF+JT7YUUFo=;
        b=Ym5spPpnuwUiITjaFSkjGrrDQYDIkHLHBIXTZ8TaVZd7B3H50FfTzLOycC4pEHXmUq
         XtJMxE1Dfth4WCbRlqdF3r2bj48Vu6diH2J6YXmuLBsa1bwvcR8sH8e4QyVEFPiA7JQo
         gpiUsf4HLd4kxxZa4icfcNzxcEjevk4EMb2sNuvvzmoudHnVwUoN0oXkVdiiHgiFgHHg
         m8+MGfUOlSd5hyW+RGPYVs9GapmWNP29LWTCfoq5omQhXZuM6B5rd+wf35UYt+usottf
         56sgHbigNDFr34RgvptBSQsgMsWHhGqMKjiouOYpKp9FjOm+BsxN/a/1X4Ci1mhWRfPu
         DvLg==
X-Gm-Message-State: AOAM530/AZaa4j5XqnCIrRmu2DhOr4rDOatrJ6OXaWMv8S5z5hBSHc2Q
        D8P+9ikN53XNWf4RkZVJfv7KgwcMPfnAmY6Kqhti7g==
X-Google-Smtp-Source: ABdhPJyrAZSI73bweKVR53OC+XYNW95pSyhMq69jsjspDDDJJ21Ls4kVbWswaTAl9zIUZNW8EJqsGNTvSlZc3GQv29g=
X-Received: by 2002:a02:94c8:: with SMTP id x66mr6028097jah.64.1601218863238;
 Sun, 27 Sep 2020 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
 <20200926135514.26189-8-luka.kovacic@sartura.hr> <20200926195008.6bd84dd3@nic.cz>
In-Reply-To: <20200926195008.6bd84dd3@nic.cz>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sun, 27 Sep 2020 17:01:04 +0200
Message-ID: <CADZsf3bOAyfoEk9GbAQWNWeq7M6KR5PWWVtefBFV5EFAmArsCA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: marvell: Add a device tree for the iEi
 Puzzle-M801 board
To:     Marek Behun <marek.behun@nic.cz>, Andrew Lunn <andrew@lunn.ch>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jason Cooper <jason@lakedaemon.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Andrew and Marek,

I will break the new patchset up and also add Gregory to the DT conversation.
Should I exclude this patch from this patchset or can I just add him to Cc?

First six LEDs are used to indicate port status and activity on the SFP+ ports.
Certainly, I will change this once the API is solved. There are currently many
similar boards with no real solution for the network LED triggers.

I'll add the color and correct the function properties for the LEDs.

Kind regards,
Luka

On Sat, Sep 26, 2020 at 7:50 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Sat, 26 Sep 2020 15:55:14 +0200
> Luka Kovacic <luka.kovacic@sartura.hr> wrote:
>
> > +     leds {
> > +             compatible = "gpio-leds";
> > +             status = "okay";
> > +             pinctrl-0 = <&cp0_sfpplus_led_pins &cp1_sfpplus_led_pins>;
> > +             pinctrl-names = "default";
> > +
> > +             led0 {
> > +                     function = LED_FUNCTION_STATUS;
> > +                     label = "p2_act";
> > +                     gpios = <&cp1_gpio1 6 GPIO_ACTIVE_LOW>;
> > +             };
>
> There should be a dash in LED node name, please pass this dts via
> dt_binding_check
>   led-0 {
>     ...
>   };
>
> Also why not add the `color` property to the LED? This is DTS for a
> specific device, right?
> `label` is obsolete. The LED subsystem creates a name in form
>   [device:]color:function
> If this LED should blink for activity on port 2 (is this an ethernet
> port?), the function should be LED_FUNCTION_LAN and function-enumerator
> should be <2> (or function should be LED_FUNCTION_ACTIVITY, depending
> on how the LED subsystem goes forward with this, but certainly not
> LED_FUNCTION_STATUS), and trigger-sources should be set to point to the
> ethernet port.
>
> Luka, are you willing to change this once we solve this API properly
> in LED subsystem?
>
>
>
> > +             led6 {
> > +                     function = LED_FUNCTION_STATUS;
> > +                     linux,default-trigger = "disk-activity";
> > +                     label = "front-hdd-led";
> > +                     gpios = <&cp0_gpio2 22 GPIO_ACTIVE_HIGH>;
> > +             };
>
> led-6. LED_FUNCTION_DISK. `label` deprecated.
>
> > +             leds {
> > +                     compatible = "iei,wt61p803-puzzle-leds";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     led@0 {
> > +                             reg = <0>;
> > +                             color = <LED_COLOR_ID_BLUE>;
> > +                             label = "front-power-led";
> > +                     };
>
> Again, `label` is deprecated. Rather use function =
> <LED_FUNCTION_POWER>;
>
> Marek
