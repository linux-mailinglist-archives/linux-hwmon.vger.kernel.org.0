Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AED284636
	for <lists+linux-hwmon@lfdr.de>; Tue,  6 Oct 2020 08:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgJFGl5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 6 Oct 2020 02:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgJFGl5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Oct 2020 02:41:57 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1F4C0613A7
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2020 23:41:57 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id q1so10051224ilt.6
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2020 23:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uHM1D8yaoPgVu7OkaALEGbJy4kg1o1eRhm5NyrRUylM=;
        b=F2Tik6j5lSqAx01VgPEc/ic+3a+2cD1ALsagm7/uTKd1bFTlXB0iPvJ6wLB5MMREgm
         cQFQECDIn+HmLqpvNq+6dM7W/vCKzNLNOk8FhCCoUoQ5HtaN1QmvZRAmOIx67g27vp8U
         dkXLOPpf9OkLw2ZTqn7JxwF3ktoTg4BcmFrl+HB5IasXlTK+GbxCc4aNY1oM3Cd2C2u3
         IhDCLLQGMij02rtGUhH8uQOJIYa0gJ8cRtQSPgeHOIU7J3cNpBYvbzi9AVuqHFR6gpRI
         ab6mJlHu1WZwBiJk/UAduBwW8UjiuIckfS1QbPhdCsrbrKIvk23SboncRwXDNfRFlbdA
         u1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uHM1D8yaoPgVu7OkaALEGbJy4kg1o1eRhm5NyrRUylM=;
        b=qXvzaGk9CkU8NEw6fe7JsLTHanWzO/30NSRPzHMQT9RwWWMlwlj9fdV068hs7rElge
         kx9SAyE5U9b7OQdWgmFrr4OgDin08ExtwHQEBfYzyNzm17zeaqvtTHEKk5Tsy1dvXxqr
         JJ+BlkM6HCUlsberyAzITX8c0crEqf5mqISRePwOhHDG4xdeLTjjocXTDh3j798jRUKe
         Jo18timNugswHgEFRdbP5nAlbDfmWZD2i4dmmXE5OqyzT2exgBBfW/SeyWZemX/nbc/c
         2+dVN7ullLxl/p9XUEx55suskjR5YOlBz1ks4zC3gTzK5/pqrpE8u5FMhgRZ8PbylYPk
         Ixmw==
X-Gm-Message-State: AOAM530+JGB9Svla5b6TaFu8FuBKmz64hV4CwVgShS0UtSbjZ5SHu6zu
        GIK8L2Jo6BTMMjwHanJ8o/jF3j0nMtXF21VRi4Z6Zg==
X-Google-Smtp-Source: ABdhPJwOFY2AVkq+DSviecXMqxbtuAa8qCx0Gyx56bAvbqU5sjiGaic0Dbg30kwuz9+gBlPKxjdMeoxiUgKTvZh1Evg=
X-Received: by 2002:a92:c00c:: with SMTP id q12mr2436199ild.294.1601966516666;
 Mon, 05 Oct 2020 23:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200930014058.44460-1-luka.kovacic@sartura.hr>
 <20200930014058.44460-5-luka.kovacic@sartura.hr> <20200930194759.GA24378@amd>
In-Reply-To: <20200930194759.GA24378@amd>
From:   Luka Kovacic <luka.kovacic@sartura.hr>
Date:   Tue, 6 Oct 2020 08:41:45 +0200
Message-ID: <CADZsf3ZL712nZh5nQxh5RQ=YCbM0fEK8dp-uHyOW+2FSMv+UpA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        Marek Behun <marek.behun@nic.cz>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 30, 2020 at 9:48 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
> > +             enum led_brightness brightness)
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
> > +
> > +     return iei_wt61p803_puzzle_write_command(priv->mcu, led_power_cmd,
> > +                     sizeof(led_power_cmd), resp_buf, &reply_size);
> > +}
>
> Is the mutex needed? If so, should it include the
> iei_wt61p803_puzzle_write_command()? Does
> iei_wt61p803_puzzle_write_command() have internal locking to prevent
> two messages from being mingled?
>
> Best regards,
>                                                                         Pavel
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

Hello Pavel,

The mutex isn't needed and can be removed.
The function iei_wt61p803_puzzle_write_command() already handles its own
mutex locking, so a separate mutex isn't required.

Does brightness_set_blocking only block a single caller (each caller separately)
or does it block all callers until the previous caller is finished?

Kind regards,
Luka
