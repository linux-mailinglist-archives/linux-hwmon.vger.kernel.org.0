Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0FF21EF13F
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2020 08:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgFEGNy (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 5 Jun 2020 02:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgFEGNy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 Jun 2020 02:13:54 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C54BC08C5C2
        for <linux-hwmon@vger.kernel.org>; Thu,  4 Jun 2020 23:13:54 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f185so7866834wmf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jun 2020 23:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yJN2wMTqdmW9Ywj7bcdohdTeZTeJk5SGvJLUrYv99yE=;
        b=Wl7PqVYB0NgnKYSjXlz5tRPX5NANomxtDkglcbdjvQsRL+/sWEI5cyjRwbLQ+T/mKJ
         M6Sc4l0Tp0CYqkIM19DWwsyrML2uNkCQzaRdzWEBO4IX78Xj83hqcyrFBi5p0KwQPyyt
         sKWZhOFZNlEuvbmA8Y7NjXu1NFVModaASoCqeRUiyrCpwF/jDRi5bccIxaSnkUwrc3AE
         ZUNS+K/7hVqJYlegt7KZSLfRDBX3qMf8IC9CV9c30saGPnT3D1XpB/ptPF5HrUbitr0g
         QNFtDsD0FRNBDII5Aim6NI2sruSlz3pIyjo6iBcdTBciWCFeOQEA2YSBgxmU2gAXaS5Q
         HrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yJN2wMTqdmW9Ywj7bcdohdTeZTeJk5SGvJLUrYv99yE=;
        b=NmaR8wsxsa20R6xBguZNXxNd3u152RMY+T1BPQlgTv0E3CMiA7cRBhj485LjezOLLm
         vNK+Yg3urv9GtHGB0JHx2ATgBcdjyhPgzFChUMJevSsLbcPcSuxN3k3XtsUQq7jZ/Yli
         JdRf9SqFTD5wYzOM2CDDnj80a9KdLn0vZGNE5U7tSxctGYM7bImcMigjMFFMpmMFsRSJ
         jLu8CiYLHGD0mLWOrMfSEz26bjTK7OUWTqxb742Ft+bRrZEfTi11nbgLkEch6EhJq/QZ
         n5B40AENV8m9xRJbBqNE0/GmWRTzwTiZKa5lqd4ghQ4lu2qWLc53lvQ9yJAP93D6cZb3
         v4ew==
X-Gm-Message-State: AOAM530asHt6VCr87hs8INLAO2cg3w3q9oMTez9bAFS8WIYQLmFY6RXf
        1EJdFNF47BNycQBNWaAevVLZLw==
X-Google-Smtp-Source: ABdhPJwf5S2OwPHZvteiT4PVJdXt+ehvT08EuJ6eK2OP2Atm5I/Xbi4JETpWh90BOmkczgotX4Fl6Q==
X-Received: by 2002:a1c:7dd5:: with SMTP id y204mr963235wmc.182.1591337632738;
        Thu, 04 Jun 2020 23:13:52 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id x186sm9871815wmg.8.2020.06.04.23.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 23:13:51 -0700 (PDT)
Date:   Fri, 5 Jun 2020 07:13:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 00/11] Add support for Kontron sl28cpld
Message-ID: <20200605061350.GC3714@dell>
References: <20200604211039.12689-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200604211039.12689-1-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 04 Jun 2020, Michael Walle wrote:

> The Kontron sl28cpld is a board management chip providing gpio, pwm, fan
> monitoring and an interrupt controller. For now this controller is used on
> the Kontron SMARC-sAL28 board. But because of its flexible nature, it
> might also be used on other boards in the future. The individual blocks
> (like gpio, pwm, etc) are kept intentionally small. The MFD core driver
> then instantiates different (or multiple of the same) blocks. It also
> provides the register layout so it might be updated in the future without a
> device tree change; and support other boards with a different layout or
> functionalities.
> 
> See also [1] for more information.
> 
> This is my first take of a MFD driver. I don't know whether the subsystem
> maintainers should only be CCed on the patches which affect the subsystem
> or on all patches for this series. I've chosen the latter so you can get a
> more complete picture.

You chose wisely. :)

> [1] https://lore.kernel.org/linux-devicetree/0e3e8204ab992d75aa07fc36af7e4ab2@walle.cc/
> 
> Changes since v3:
>  - use of_platform_populate() to populate internal devices using the
>    internal register offsets as unit-addresses
>  - because we don't use mfd_cells anymore, we cannot use IORESOURCE_REG,
>    but instead parse the reg property in each individual driver
>  - dropped the following patches because they were already merged:
>      gpiolib: Introduce gpiochip_irqchip_add_domain()
>      gpio: add a reusable generic gpio_chip using regmap
>  - dropped the following patches because they are no longer needed:
>      include/linux/ioport.h: add helper to define REG resource constructs
>      mfd: mfd-core: Don't overwrite the dma_mask of the child device
>      mfd: mfd-core: match device tree node against reg property
>  - rephrase commit messages, as suggested by Thomas Gleixner

It's great to have this changelog overview.

However it's equally, if not arguably more important to have a more
fine grained changelog in each of the patches, usually placed between
the '---' and the diff stat.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
