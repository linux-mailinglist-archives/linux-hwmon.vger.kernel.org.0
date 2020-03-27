Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91093195506
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2020 11:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgC0KVK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 Mar 2020 06:21:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42966 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgC0KVK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Mar 2020 06:21:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id t21so7374229lfe.9
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2020 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TuB8BNTEMS6Xu4xWKK0GTpM0KTFJDSPd7CoTH260LEY=;
        b=BWdcmcSOZAia9WokqOKv83FwargH+rfDXr2Mp0QwyZsT/mABCSd3y3ZMISvNsbmXhU
         gQMIR1duY1UxdvKr1tbHQzNudMLJvKqINJWtOlrbk9+kwOmXToR95IOMrI3yVrYmqYw4
         ERIXKr3kSqBiWHHSNhbcDl9Iko5A1Q0USZ7lVRGh7i4ZWuu8E4UBLvEJ0Rb7XNIkfIsy
         aw8uoNh4prsuenO/RPpdtz/llUkVRpSahQ6WFiqcc4YqGBOhRx5YxeATNzXZkpF5gRXs
         u9qzGndEeTvD5XvNeditQ2MMZ58/zYFaGXYoaCpP0AzoqV0GaxsvyztxFYEj52lAcoCH
         pBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TuB8BNTEMS6Xu4xWKK0GTpM0KTFJDSPd7CoTH260LEY=;
        b=YJ1Rxv4w5DIF31fl7UDIMXLNQ4QXi0VdOh+Kjk8OBmNQEVmoESUMwLvvpmt9zeGZGu
         XndlXlbizznKUMizcWHSjhP0m1xT3aI13yhiTCO0+VNqU2oFJaCWuqZ4WQ6linHof6DU
         KtXi0iPToCbHf2QcoOwvNt5mPFEW0u87wQsYs3W+tJOk7gdiQJYNy6PCFSSLSgTPlNpY
         nd2Bbpope/iTqVopPODQ3JLM1I+mtW+jFfi8rGgLLMLhSgW8DzHlFFWIbv1U7V+a/tDs
         YegkBYn8BsaIVTsgzPI2/s0jk7XxMu0Eejk0l51unbCf+gH0KZocHm2MKgETRkGI8GE/
         Ei8Q==
X-Gm-Message-State: ANhLgQ3Uho5uOf1hOI04qXNcbv0BRv6oTYLn8e4GUG/auZYY65oWg7QK
        qAEUA5d+AiJed9g0ZWzG5ZmWMRTo27xVG4gGrJTdcA==
X-Google-Smtp-Source: ADFU+vtsIgqK8FyZODtKNKWKI1HxhtKduwTybRXQvKGmxQLsPLeMOqx9p3y4gdOqstKYu6oc3bIWeFZeiamysR3lBHg=
X-Received: by 2002:a19:ac8:: with SMTP id 191mr8675462lfk.77.1585304468041;
 Fri, 27 Mar 2020 03:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200317205017.28280-1-michael@walle.cc> <20200317205017.28280-13-michael@walle.cc>
 <CAMpxmJW770v6JLdveEe1hkgNEJByVyArhorSyUZBYOyFiVyOeg@mail.gmail.com>
 <9c310f2a11913d4d089ef1b07671be00@walle.cc> <CAMpxmJXmD-M+Wbj6=wgFgP2aDxbqDN=ceHi1XDun4iwdLm55Zg@mail.gmail.com>
 <22944c9b62aa69da418de7766b7741bd@walle.cc>
In-Reply-To: <22944c9b62aa69da418de7766b7741bd@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:20:56 +0100
Message-ID: <CACRpkdbJ3DBO+W4P0n-CfZ1T3L8d_L0Nizra8frkv92XPXR4WA@mail.gmail.com>
Subject: Re: [PATCH 12/18] gpio: add support for the sl28cpld GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 26, 2020 at 9:06 PM Michael Walle <michael@walle.cc> wrote:
> Am 2020-03-25 12:50, schrieb Bartosz Golaszewski:

> > In that case maybe you should use the disable_locking option in
> > regmap_config and provide your own callbacks that you can use in the
> > irqchip code too?
>
> But how would that solve problem (1). And keep in mind, that the
> reqmap_irqchip is actually used for the interrupt controller, which
> is not this gpio controller.
>
> Ie. the interrupt controller of the sl28cpld uses the regmap_irqchip
> and all interrupt phandles pointing to the interrupt controller will
> reference the toplevel node. Any phandles pointing to the gpio
> controller will reference the GPIO subnode.

Ideally we would create something generic that has been on my
mind for some time, like a generic GPIO regmap irqchip now that
there are a few controllers like that.

I don't know how feasible it is or how much work it would be. But
as with GPIO_GENERIC (for MMIO) it would be helpful since we
can then implement things like .set_multiple() and .get_multiple()
for everyone.

Yours,
Linus Walleij
