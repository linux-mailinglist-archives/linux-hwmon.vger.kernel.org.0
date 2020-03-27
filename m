Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 224C7195E0A
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Mar 2020 20:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgC0TCA (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 Mar 2020 15:02:00 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39897 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgC0TCA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Mar 2020 15:02:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id h6so2999773lfp.6
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2020 12:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CooN/lA7d5yACqkmjNxbvElnXH9xWYc5D690cPagV5A=;
        b=XzwTwOQ2tZqjO9DLphNswRW0Faz+tkI3lW4QKn8PnDodceq0s69XJc+EX+CaxLUZAc
         DsmeaJdkg7faxGR2WlOr2Q2xOqCK3LhvO83UpvhTPjbrrDITVXe01nU0HW2zIBGLSdNK
         x+SI4S2qeU3EY5SopL7X1UD90wHcT3WjJvLfVVsAO2U5Em5d1XWCXX0PRhRjUwlFbFjC
         /RhNOl/qPgtup89fKy/XuqC10uHh8xb2p99SAbLCDPTbSVvO8tHFnVGOGXPs57VzLKHy
         z3pNrxrHAv/ZVQFSEpVOjEocb4Os2eKubiclJ5LN8KBbJgdGF3NkBVCWlJGOm0DbvFTa
         Y1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CooN/lA7d5yACqkmjNxbvElnXH9xWYc5D690cPagV5A=;
        b=ObUOC3SlhDhsMd46NQZ6drAxgn8e1nxNeFgFsqoTFsOp5ny3C9MDy4BcLTihnspvYX
         TzPJqStONg8fUO6ubd73n2tHxctejkGrNnXW6459Kmp8wnv9NvRd/CVAzesyxxWp8ACX
         1Gzv5wbssr3VzAtP2NX+fCgjYYoOWoI7P4lWwDkRxl6RnOGDjskJfDBuuIgKUyURU5Gq
         ONGDfXdWRQWC22uSDb8S0V9VnEZSdZimBd4T64V7NfAKlKmz7jW4xMleGtqgmwCryIjP
         V5WZYzFVSakmh2+vOgDxrginqkJZT4x+iVLh1D9qiR5IdKFZZwTA8y8Xd/rI2fCpjPMS
         scjA==
X-Gm-Message-State: AGi0PubumhMJV2S+4QqLkV8+B1mugF37VfA/XquI7Sb9PPns6/g4DhXn
        THhN6LpPg0d/Hv1gMQtZeAg70dkK46k3qdgBhQgcwQ==
X-Google-Smtp-Source: APiQypLD/fNDqtD4u7+uuQ8ZqMmHjJHk9/rbkJ2Ows6MzWRJlKEVAAUCTvzeqzTfoWN78XIJxBngK/onAWpgkIOJt00=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr457241lfc.4.1585335716191;
 Fri, 27 Mar 2020 12:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200317205017.28280-1-michael@walle.cc> <20200317205017.28280-13-michael@walle.cc>
 <CAMpxmJW770v6JLdveEe1hkgNEJByVyArhorSyUZBYOyFiVyOeg@mail.gmail.com>
 <9c310f2a11913d4d089ef1b07671be00@walle.cc> <CAMpxmJXmD-M+Wbj6=wgFgP2aDxbqDN=ceHi1XDun4iwdLm55Zg@mail.gmail.com>
 <22944c9b62aa69da418de7766b7741bd@walle.cc> <CACRpkdbJ3DBO+W4P0n-CfZ1T3L8d_L0Nizra8frkv92XPXR4WA@mail.gmail.com>
 <4d8d3bc26bdf73eb5c0e5851589fe085@walle.cc>
In-Reply-To: <4d8d3bc26bdf73eb5c0e5851589fe085@walle.cc>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 20:01:44 +0100
Message-ID: <CACRpkdYwqReW+UcY=4S3ZnC+jFeVr=e+Ns12A_CK6o7VBUXHbA@mail.gmail.com>
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

On Fri, Mar 27, 2020 at 4:28 PM Michael Walle <michael@walle.cc> wrote:

> For starters, would that be a drivers/gpio/gpio-regmap.c or a
> drivers/base/regmap/regmap-gpio.c? I would assume the first,

Yeah I would name it like that. gpio-regmap.c.

Yours,
Linus Walleij
