Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3297465B0
	for <lists+linux-hwmon@lfdr.de>; Tue,  4 Jul 2023 00:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjGCWTv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 3 Jul 2023 18:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjGCWTu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Jul 2023 18:19:50 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFFCE62
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Jul 2023 15:19:48 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-bacf685150cso5705124276.3
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Jul 2023 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688422787; x=1691014787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9HevVK3dLy2DI5tpdlrhQ7544ZuKcagqCCGV2FMIRE=;
        b=B/xAUULsp+QZNBqB/xJExV+WaRnhz39fH88VMTgV2qqE6qZec0PJ+IGlaSrHVrTuq6
         Yc6MI4hqG8QvLXMpEVgbv1r4ED54eI1h1SfpjgOy2caol+rpuIxlaRLg/fMuW4QKVZg+
         8x0yBGMeIPrpsdMwaICRbY6uKnuhN2YxMXIRI8/Yrnq1FTs3xTGGag2zcCkCnoJGQwpH
         mB1ZSLMKvo6jRJ0FCEnOSYSUi6L4KwPinjGjFwAXYhU1VpddjbP3Ykz6ZoY2S+sZN7yd
         fn7Urxw3Uq5m2ZcIr3deVWHF78VM+32ijH8JJR5xVGA0yNENhm2iFDND48O27dzkcD+W
         +4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688422787; x=1691014787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9HevVK3dLy2DI5tpdlrhQ7544ZuKcagqCCGV2FMIRE=;
        b=hHvqzyfh4FurTcQOtNQhpjEl+HPFoC5mHxdp71ic57q3XA6c+ti0RYPCq9bJ9IsrtC
         LyWriBIy2vI7MTdXKNXeP5TwXeSO7tOihY/YYmGR90T/dzOfORJNuzyChYICgXM1h7+x
         UMBoy6GT4spUhu43gw15nWmz+ryB8aIiBDSoBfggIUmcoCjCt2Rbyb9Y0eUScnihTprf
         BLnmH7A0k9o1SWfVNTpuhJXSFrgvlpFfsb4e3LaeWkAqs3LTZw7P2LaYBU26lnq7ZOsn
         ZMe1xxK8sp5JrWcTgVHD1Y3rNMML+3VAKPzaUIC33puxVLpP+BCyhzose2xKzl8g3oPo
         EhOg==
X-Gm-Message-State: ABy/qLYiNUUmRTXGs8F9fSEzWyFJiwD8H2UyGsLFSmly9GIawbRGiEIB
        8Zp67O/nlGadPlK3kQjmSa09GUVkbUPO9aL5fxDovA==
X-Google-Smtp-Source: APBJJlHExt3Lgn60LULo4I21TJ/yokWh52mlqq1qzF5KzFQVszDbClIjmtAAn/XDzc5g4KpeVMI5ljpSeeSBPsZDdZM=
X-Received: by 2002:a25:9c86:0:b0:c1c:7458:87f2 with SMTP id
 y6-20020a259c86000000b00c1c745887f2mr10060974ybo.26.1688422787511; Mon, 03
 Jul 2023 15:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230621213115.113266-1-nick.hawkins@hpe.com> <CACRpkdazmeFHagwkJ3s6BHRBgFoLPbj8AVnPL2f+vTi9K46Kcg@mail.gmail.com>
 <4961CC2A-1755-4784-B942-EE840F981106@hpe.com>
In-Reply-To: <4961CC2A-1755-4784-B942-EE840F981106@hpe.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jul 2023 00:19:35 +0200
Message-ID: <CACRpkdYQ3bYQ=cELPLEaVkFKM1jbjCwpmPyYGLC6ox10=vS_pQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] ARM: Add GPIO support
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 3, 2023 at 5:31=E2=80=AFPM Hawkins, Nick <nick.hawkins@hpe.com>=
 wrote:

> As always thank you for your feedback and suggestions. Sorry for the
> delayed response. I will bring this concept to my team to discuss.

Thanks!

> A possible issue with this could be how our cooling profile varies
> based on options present such as extra DIMMS, CPU, storage,
> network ... etc.

The thermal subsystem has plenty of tunables in sysfs, see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/ABI/testing/sysfs-class-thermal
I don't think it's a problem to add more, if there are technical
requirements for it.

Yours,
Linus Walleij
