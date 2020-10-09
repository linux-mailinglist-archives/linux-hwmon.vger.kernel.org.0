Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2770A289C1C
	for <lists+linux-hwmon@lfdr.de>; Sat, 10 Oct 2020 01:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgJIX02 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 9 Oct 2020 19:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgJIXZr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 9 Oct 2020 19:25:47 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E791C0613D2
        for <linux-hwmon@vger.kernel.org>; Fri,  9 Oct 2020 16:25:55 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id l16so10751030ilt.13
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Oct 2020 16:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bdQJAu4yF5dce0DD49SyLKXgzP39u50c+umqE0FLgBU=;
        b=1GLphmj5/R5BqAlFnPGRnzhsW3asqG+CCFd5rKI5mUooAraedSiE4OyXexCuybI9ab
         xUnuGU5fG5NdgE+d1dDkiQfGVYhCMKbYNMXtqGIAnWGaB1u4aOHTG/PypcuMTIALyA4b
         BEM9UVh5gDdrzbW6+zKMfdJXnVr5UyYiirF6OCXsG8SQCp0Om0/6ATaL5bEK0g6/mBYr
         Qtrvz/63nBPc38xo69uBkPbUPWWTlP2SmmPRjMZckmiqMQN4xoBAxIwgGebnbT8LLlD7
         4fKKgoVmdyOwDvmfC5OnplL/lF0NLIV5XfGQiq7dnu/UB6/cb2PFf0uU6wNBjhb/jOqJ
         03CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bdQJAu4yF5dce0DD49SyLKXgzP39u50c+umqE0FLgBU=;
        b=JuUWbEB/kDjokZjUw/7lZDBiKNnhRzcuEFTPAcgR9HQYhnod5bklSWNO+HmtBwmK4A
         owz+LMZiY73BlrRdURjAyg23CQ2CBs5O6xecV6eNDvAyJYKpVlcfPSkY+o2ajxQ4mzeI
         H6C+Iv1BmWRkeVWVPT08gRkRiRf4XD/ty6DVSwWrwi9Q3mW9rPUctTG5SHhqiezR53Zo
         mNJgOXagBu+K/lDSFRQTSLIBO1OGRZS3/56i4f8XyfhTgUmAdTypBBAjGj4wR8w8vnXF
         s/NuYIz0eWqeUZFWbaZBUJWkitoRfgKOLARmaf8VgdRjsL0OsZqzbyz8LUWGqpPmSXTO
         M4Yw==
X-Gm-Message-State: AOAM531QTy4FrKODEh3v/6jYOhrBObrJ6Mrkuk0Rxc4h1z4eVRSCj3KU
        zhHkzSU86yK7b3ZyWfOBCbzpPEDvxy2mHAG7x0AlJA==
X-Google-Smtp-Source: ABdhPJxP+j1e3PZosu12MlCEp2JiKAfso8sX9UH9nEzXe5UARh1wrbVACQBg+/qhTwIeyoCWuBJU5G9A5iggmiUld6A=
X-Received: by 2002:a92:6811:: with SMTP id d17mr11954140ilc.145.1602285954971;
 Fri, 09 Oct 2020 16:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201007004901.39859-1-luka.kovacic@sartura.hr>
 <20201007004901.39859-5-luka.kovacic@sartura.hr> <20201007112756.GD12224@duo.ucw.cz>
In-Reply-To: <20201007112756.GD12224@duo.ucw.cz>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Sat, 10 Oct 2020 01:25:43 +0200
Message-ID: <CADZsf3Y=Z9pys=g1QtN=+vhLDV=NVK=rbF14Duv50expF=gzeA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Oct 7, 2020 at 1:27 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Add support for the iEi WT61P803 PUZZLE LED driver.
> > Currently only the front panel power LED is supported.
> >
> > This driver depends on the iEi WT61P803 PUZZLE MFD driver.
>
> > +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
> > +                                                        enum led_brightness brightness)
> > +{
> > +     struct iei_wt61p803_puzzle_led *priv = cdev_to_iei_wt61p803_puzzle_led(cdev);
> > +     unsigned char *resp_buf = priv->response_buffer;
> > +     unsigned char led_power_cmd[5] = {
> > +             IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> > +             IEI_WT61P803_PUZZLE_CMD_LED,
> > +             IEI_WT61P803_PUZZLE_CMD_LED_POWER,
> > +             (char)IEI_LED_OFF
> > +     };
> > +     size_t reply_size;
> > +
> > +     mutex_lock(&priv->lock);
> > +     if (brightness == LED_OFF) {
> > +             led_power_cmd[3] = (char)IEI_LED_OFF;
> > +             priv->led_power_state = LED_OFF;
> > +     } else {
> > +             led_power_cmd[3] = (char)IEI_LED_ON;
> > +             priv->led_power_state = LED_ON;
> > +     }
> > +     mutex_unlock(&priv->lock);
>
> Are you sure you need the mutex?
>
> > +     ret = devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
> > +     if (ret) {
> > +             dev_err(dev, "Could not register LED\n");
> > +             goto err_child_node;
> > +     }
> > +     return 0;
> > +err_child_node:
> > +     fwnode_handle_put(child);
> > +     return ret;
> > +}
>
> Is the fwnode_handle_put(child); missing in non-error path somewhere?
>
> > +MODULE_LICENSE("GPL");
>
> Make sure this is consistent with file header. GPLv2+, if you can.
>
> Best regards,
>
>                                                                         Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

Hi Pavel,

The mutex is locked in
iei_wt61p803_puzzle_led_brightness_set_blocking(), as concurrent
access to the same private structure member should be possible, when
reading the state
from iei_wt61p803_puzzle_led_brightness_get().

It does look like I missed the final fwnode_handle_put(child) here.

My understanding regarding the license is that when
MODULE_LICENSE("GPL") is used
the SPDX identifier can either be GPL-2.0-only or GPL-2.0-or-later.

Kind regards,
Luka
