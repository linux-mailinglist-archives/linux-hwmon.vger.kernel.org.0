Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777CA2DADFE
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Dec 2020 14:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgLONau (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 15 Dec 2020 08:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgLONal (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Dec 2020 08:30:41 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F31C0617A6
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 05:30:01 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id w124so20161406oia.6
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 05:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wylm9iahzB85sQo54swV1gzcAf2MyfM2fa6Wh1DtC5Q=;
        b=Z1Mzh7YynW7F1kcqiCpd5Klq3L93ZS0Fy2g6Nr19gHjlkOq6rxVMK8EwoMwd+3mp1x
         jidbCuIPZfpbQTc9IBxXAw2mmacKS9FrGhjZ2ctVoigppo8WD2Q+G/8m5jQIHAO7qt8B
         Cmx3RKjnTzjNNtQG6De5htPy2AV69iQpCmCi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wylm9iahzB85sQo54swV1gzcAf2MyfM2fa6Wh1DtC5Q=;
        b=cV8tLSkCChwXMTyljojA8cq4sbq7F34r9P1hrG8DiUwj11QKv/oWdLHsc1G7ZLuWzF
         27NDKC8vkzJAbnaWgrZ+JV2K/a4CZigg8LjvFPqMjCF1imNggGzuxB6C3U48sol3yPdN
         BR1VHGpzBVcrK2GgHyzetUZGePK3o8tvAf1GuGl9M0gfD5wAaPLZdRQ9i0aDZP3RDrOr
         YqtpnWxntJ7Whxi3m+qB4/pnzffXKSjIkVc1PrkgZTIJrbaxeb5gyhSGZc/xoMJ2FJAj
         mv/tTMXgkYxTvOvBExFUNjMTwrqFrDIfefksw+CTY3Lhesp10Xn2zNe5SUUh8kmfmc9o
         J+vA==
X-Gm-Message-State: AOAM532s53LlIh0qNgLHv2hV5CBLQClMVNhRUslvc42qbrCjVE1CF1cs
        LiWUQESScFijEVOJfwFMOHxZeEIghk5MBkMtl14hkw==
X-Google-Smtp-Source: ABdhPJxo1xWSIVDrc64/AyUTXU4nduTXm5NBLuT/Yhv8n+UbW+r67wC9ARsRn+RkJZenMsC6UWg7aVm4Nw5yaxTqMhk=
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr21442279oih.152.1608039000558;
 Tue, 15 Dec 2020 05:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20201215092031.152243-1-u.kleine-koenig@pengutronix.de>
 <CAM9ZRVt1wRUuGSniDvS2PME=O-Y3YtVHgTh27qn5Dkj_kUc3AQ@mail.gmail.com> <20201215125604.iygkycrlxmkq5kzx@pengutronix.de>
In-Reply-To: <20201215125604.iygkycrlxmkq5kzx@pengutronix.de>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Tue, 15 Dec 2020 13:29:49 +0000
Message-ID: <CAM9ZRVuq8YgbuN1fCNaft_RaEu88V0SGYYxy7EHxGE1OFkoy2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: pwm-fan: Ensure that calculation doesn't
 discard big period values
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        kernel@pengutronix.de, Lee Jones <lee.jones@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 15 Dec 2020 at 12:56, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Tue, Dec 15, 2020 at 11:29:39AM +0000, Paul Barker wrote:
> > On Tue, 15 Dec 2020 at 09:23, Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > With MAX_PWM being defined to 255 the code
> > >
> > >         unsigned long period;
> > >         ...
> > >         period =3D ctx->pwm->args.period;
> > >         state.duty_cycle =3D DIV_ROUND_UP(pwm * (period - 1), MAX_PWM=
);
> >
> > Reviewing this I noticed that in pwm_fan_resume() we use
> > DIV_ROUND_UP_ULL for what looks like essentially the same calculation.
>
> After my second patch this isn't true any more. With it applied
> __set_pwm is the only place in the driver that calculates this stuff.
>
> > Could we just switch this line to DIV_ROUND_UP_ULL instead?
>
> Yes that would work, but actually I don't expect someone specifiying a
> period big enough to justify the additional overhead of a 64 bit
> division.

So ULONG_MAX / (MAX_PWM + 1) is 16.7 million on 32-bit platforms. As
the period is in nanoseconds (if I understand correctly), this would
allow a period of up to 16.7ms and so a minimum frequency of around
60Hz.

That does seem fairly reasonable to me but it's probably worth making
a note of these limits in the commit message for future reference.

Thanks,

--=20
Paul Barker
Konsulko Group
