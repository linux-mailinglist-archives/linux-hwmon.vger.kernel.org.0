Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9CE6CD96F
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Mar 2023 14:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjC2Mhr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 29 Mar 2023 08:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjC2Mhq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Mar 2023 08:37:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773963ABE
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Mar 2023 05:37:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id cn12so62647709edb.4
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Mar 2023 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1680093464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHb6wEI0W+Q8XNFleXC4qtIxQ5KFkUssnbzkaSWTwt0=;
        b=HG/XVNTljst0PoADYJ9a1oe2fUatY94AsdKpMHxxOpv6UuoHB6hvijDjhYLE9/25rs
         152++Pjka5+uGRovDxe9lV+rhf8++TfTk52B//EwPFKlZ8SzAWjTwNLluSshW2RDWPnd
         srv2pNMrlqDFWWsC173i94ItNlYGVLs5iGdN6EW6KPfp4NGuo04lpjR216LCgKHkG6hm
         tt8ytMaBacnj2KHpooUNXKvXT476qhRY2eCUHq0XSDr3E6V5f2UW8KmHuS4qM5P/vnYo
         c7iIw+AdSJaMxFaBxtnvEUmWHYQAhPvuAHIixL2EwShp2QWod24RpXn2eN7OXg5nz4PP
         a8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680093464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHb6wEI0W+Q8XNFleXC4qtIxQ5KFkUssnbzkaSWTwt0=;
        b=itFCY+OjRtJT75Y4v8sFiWzjSAHPZpDsLD/aKsWnWlsG28k3fqMWZw/LZFY9VtMxe6
         sYZWgXeFOSw/U9nzBb7jTR1A1IsDic1vqIpGwzAedwQ2Bh20r7bTu9NQjZwLt4ifr6Dj
         pZIOGjDXk4zviQLEfw5hOuX2f0scbxdtOc+SZ7kgaE6A0BZCT8qyGGzWT194BSU69agf
         BiwfG4mT9JOe1bVVZdnnqa/qdXre9k8z+npJSGPjgpAe/txTmx8d8/DtHw5x46oWEecO
         zmJ+ai3DLowHAfseZDIk9MW26kZZnOHlkkru1jHxIW6F29e19uYCy+esHa2IkK/eTGb1
         SvSQ==
X-Gm-Message-State: AAQBX9fi2+91dLOHoV4oxYdRxSKiGEcZPCftl36cMntmGOeznq9FbAXz
        rvQsLCj3QqlUBrVgsrxRlIuG/Xgm+qaW+k7qhCUsrfMhmUaNWqVWw+3dhg==
X-Google-Smtp-Source: AKy350aDBwtiG5kWGJciArmsYca1qFgzqg6C3cxeEPeZkvx1P1YMyQqnsAGHM99S4BjGebJTBNJNFDacA5sFHwR7yCY=
X-Received: by 2002:a17:907:d687:b0:93d:a14f:c9b4 with SMTP id
 wf7-20020a170907d68700b0093da14fc9b4mr9691718ejc.2.1680093463969; Wed, 29 Mar
 2023 05:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221129161134.2672474-1-Naresh.Solanki@9elements.com>
 <20221129161134.2672474-5-Naresh.Solanki@9elements.com> <20221129163427.dxnqfay6ur6mvivu@pengutronix.de>
 <d2d54a34-56dc-df83-5fde-ad0a9a73a9e0@roeck-us.net> <77c5a9e2-ce25-df19-1eba-ba4808bbeb9d@9elements.com>
In-Reply-To: <77c5a9e2-ce25-df19-1eba-ba4808bbeb9d@9elements.com>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Wed, 29 Mar 2023 18:07:34 +0530
Message-ID: <CABqG17h1112TsJ_JtxZkLrObz0v-5dq_6B86RYA_T6efW14t1Q@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] hwmon: (max6639) Add pwm support
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-pwm@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob, Guenter,

I need your inputs & direction on the next step for max6639 driver.
I'm willing to work & implement changes.

Thank you for your time and consideration.

Regards,
Naresh Solanki

Regards,
Naresh Solanki



9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email:  naresh.solanki@9elements.com
Mobile:  +91 9538631477

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO


On Tue, 6 Dec 2022 at 23:15, Naresh Solanki
<naresh.solanki@9elements.com> wrote:
>
> Hi Guenter, Rob
>
> On 29-11-2022 10:11 pm, Guenter Roeck wrote:
> > On 11/29/22 08:34, Uwe Kleine-K=C3=B6nig wrote:
> >> On Tue, Nov 29, 2022 at 05:11:34PM +0100, Naresh Solanki wrote:
> >>> Add pwm support for max6639. Also configure pwm fan speed based on pw=
m
> >>> provided in DT.
> >>
> >> Did you do anything to resolve the questions I had in reply to v5? If
> >> yes, I must have missed it.
> >>
> >
> > I don't see a response to my concerns either, especially regarding fan =
mode
> > (dc vs. pwm) in the bindings. For that reason, I won't even look at the
> > series.
> Best I can think of regulator with voltage control. Because as per my
> understanding, DC control fan essentially control DC voltage on negative
> pin of fan.
>
>
> Regards,
> Naresh
> >
> > Guenter
> >
> >> Note that maintainer time is scarce and with sending new versions of a
> >> patch with no sign that you improved in the aspects that were critized
> >> before, you're burning that scarce time and loosing the good will of t=
he
> >> responsible maintainers.
> >>
> >> Best regards
> >> Uwe
> >>
> >
