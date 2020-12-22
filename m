Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17DC92DAC51
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Dec 2020 12:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgLOLqg (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 15 Dec 2020 06:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgLOLqa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Dec 2020 06:46:30 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790A6C06138C
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 03:45:49 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id d189so22967636oig.11
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Dec 2020 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VPNooSFhm1lHgbyq3Gdy0dRzatnY9tsEvgnicHbluhg=;
        b=UkamMj25KVqV6NhEtEgcN5ByRxWRmWGpUSSmD5q3DOeCdL3OGjVkZfJhIRaIFMIj0W
         4IB28pxIOxpJKFk8oSzl9KvCkv58jPzj4UBtdUuqy9ppyJgj+jNYrvDPwuZo+GZDZagt
         3OmIphfSRjSDm1ElxIXANEaj6LkYKh5kNod6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VPNooSFhm1lHgbyq3Gdy0dRzatnY9tsEvgnicHbluhg=;
        b=jeMgw641iwd5YBpe3caZvGHMMtwlUN04ZDCgpKkPM7LuE1rGQaiKM9iuNe7bPPnX2R
         wcx+dWWrO2KGinpKLSvO3ywKdxYlufRl6H4mZUEmWC7JE4xJr8/1Z6JelXG4XgvgcKAd
         HF6KXmjXKOtzoIb+dj9znhX+8NjehJraV/xC3COjBKKnIFOGi4xr3XSpQdrh9Ga9r/ae
         MDgvxKeAi8JbRksZhPadDjidDvCkW3YRwYTPStOoNnxQ+IgEtXt34grt1aZd2Yw31v4f
         7ijV6dSfAs8bmjbCxB6//WcUxmcpdL+4VSpKDb5WuWrUPQOhPUm0nn8Ltr2YlZrNnyg6
         8yFg==
X-Gm-Message-State: AOAM5304yfqCvU7T0RZ1U9drXQlHfkHPKrRhtX7/MoujqrqOiWIIaaBE
        Z+bFv0BOwLK05VRFVcwmZGwcMBU+IuEvgh/+LB+Tvw==
X-Google-Smtp-Source: ABdhPJx7DX6x3YRqkUtwWW4flfpN7e5gyjFNcY8gOkTw/6YC+2YJypPO1E1yELCRhQXW3q3hrTaqppSpbJBZxlCQ13A=
X-Received: by 2002:aca:f3d6:: with SMTP id r205mr21203627oih.152.1608032748791;
 Tue, 15 Dec 2020 03:45:48 -0800 (PST)
MIME-Version: 1.0
References: <20201215092031.152243-1-u.kleine-koenig@pengutronix.de> <20201215092031.152243-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201215092031.152243-2-u.kleine-koenig@pengutronix.de>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Tue, 15 Dec 2020 11:45:38 +0000
Message-ID: <CAM9ZRVtsxZyuUTP=0idhOL2JC82_GWLCN3c3T5NOXGCrhsu1Ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: stop using legacy PWM functions and
 some cleanups
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 15 Dec 2020 at 09:23, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> pwm_apply_state() does what the legacy functions pwm_config() and
> pwm_{en,dis}able() do in a single function call. This simplifies error
> handling and is more efficient for new-style PWM hardware drivers.
>
> Instead of repeatedly querying the PWM framework about the initial PWM
> configuration, cache the settings in driver data.
>
> Also use __set_pwm() in .probe() to have the algorithm calculating the PW=
M
> state in a single place.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/hwmon/pwm-fan.c | 47 +++++++++++++++++------------------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index ec171f2b684a..4ccad5a87019 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -25,6 +25,7 @@
>  struct pwm_fan_ctx {
>         struct mutex lock;
>         struct pwm_device *pwm;
> +       struct pwm_state pwm_state;
>         struct regulator *reg_en;
>
>         int irq;
> @@ -73,18 +74,17 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsign=
ed long pwm)
>  {
>         unsigned long period;
>         int ret =3D 0;
> -       struct pwm_state state =3D { };
> +       struct pwm_state *state =3D &ctx->pwm_state;
>
>         mutex_lock(&ctx->lock);
>         if (ctx->pwm_value =3D=3D pwm)
>                 goto exit_set_pwm_err;
>
> -       pwm_init_state(ctx->pwm, &state);
> -       period =3D ctx->pwm->args.period;
> -       state.duty_cycle =3D DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> -       state.enabled =3D pwm ? true : false;
> +       period =3D state->period;
> +       state->duty_cycle =3D DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> +       state->enabled =3D pwm ? true : false;
>
> -       ret =3D pwm_apply_state(ctx->pwm, &state);
> +       ret =3D pwm_apply_state(ctx->pwm, state);
>         if (!ret)
>                 ctx->pwm_value =3D pwm;
>  exit_set_pwm_err:
> @@ -274,7 +274,9 @@ static void pwm_fan_regulator_disable(void *data)
>  static void pwm_fan_pwm_disable(void *__ctx)
>  {
>         struct pwm_fan_ctx *ctx =3D __ctx;
> -       pwm_disable(ctx->pwm);
> +
> +       ctx->pwm_state.enabled =3D false;
> +       pwm_apply_state(ctx->pwm, &ctx->pwm_state);
>         del_timer_sync(&ctx->rpm_timer);
>  }
>
> @@ -285,7 +287,6 @@ static int pwm_fan_probe(struct platform_device *pdev=
)
>         struct pwm_fan_ctx *ctx;
>         struct device *hwmon;
>         int ret;
> -       struct pwm_state state =3D { };
>         u32 ppr =3D 2;
>
>         ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> @@ -324,22 +325,20 @@ static int pwm_fan_probe(struct platform_device *pd=
ev)
>
>         ctx->pwm_value =3D MAX_PWM;
>
> -       pwm_init_state(ctx->pwm, &state);
> +       pwm_init_state(ctx->pwm, &ctx->pwm_state);
> +
>         /*
>          * __set_pwm assumes that MAX_PWM * (period - 1) fits into an uns=
igned
>          * long. Check this here to prevent the fan running at a too low
>          * frequency.
>          */
> -       if (state.period > ULONG_MAX / MAX_PWM + 1) {
> +       if (ctx->pwm_state.period > ULONG_MAX / MAX_PWM + 1) {
>                 dev_err(dev, "Configured period too big\n");
>                 return -EINVAL;
>         }
>
>         /* Set duty cycle to maximum allowed and enable PWM output */
> -       state.duty_cycle =3D ctx->pwm->args.period - 1;
> -       state.enabled =3D true;
> -
> -       ret =3D pwm_apply_state(ctx->pwm, &state);
> +       ret =3D __set_pwm(ctx, MAX_PWM);
>         if (ret) {
>                 dev_err(dev, "Failed to configure PWM: %d\n", ret);
>                 return ret;
> @@ -399,17 +398,16 @@ static int pwm_fan_probe(struct platform_device *pd=
ev)
>  static int pwm_fan_disable(struct device *dev)
>  {
>         struct pwm_fan_ctx *ctx =3D dev_get_drvdata(dev);
> -       struct pwm_args args;
>         int ret;
>
> -       pwm_get_args(ctx->pwm, &args);
> -
>         if (ctx->pwm_value) {
> -               ret =3D pwm_config(ctx->pwm, 0, args.period);
> +               /* keep ctx->pwm_state unmodified for pwm_fan_resume() */
> +               struct pwm_state state =3D ctx->pwm_state;
> +               state.duty_cycle =3D 0;
> +               state.enabled =3D false;
> +               ret =3D pwm_apply_state(ctx->pwm, &state);
>                 if (ret < 0)
>                         return ret;
> -
> -               pwm_disable(ctx->pwm);
>         }
>
>         if (ctx->reg_en) {
> @@ -437,8 +435,6 @@ static int pwm_fan_suspend(struct device *dev)
>  static int pwm_fan_resume(struct device *dev)
>  {
>         struct pwm_fan_ctx *ctx =3D dev_get_drvdata(dev);
> -       struct pwm_args pargs;
> -       unsigned long duty;
>         int ret;
>
>         if (ctx->reg_en) {
> @@ -452,12 +448,7 @@ static int pwm_fan_resume(struct device *dev)
>         if (ctx->pwm_value =3D=3D 0)
>                 return 0;
>
> -       pwm_get_args(ctx->pwm, &pargs);
> -       duty =3D DIV_ROUND_UP_ULL(ctx->pwm_value * (pargs.period - 1), MA=
X_PWM);
> -       ret =3D pwm_config(ctx->pwm, duty, pargs.period);
> -       if (ret)
> -               return ret;
> -       return pwm_enable(ctx->pwm);
> +       return pwm_apply_state(ctx->pwm, &ctx->pwm_state);
>  }
>  #endif
>
> --
> 2.29.2
>

All looks good to me at first glance.

This does conflict with the changes I proposed
(https://lore.kernel.org/linux-hwmon/20201212195008.6036-1-pbarker@konsulko=
.com/T/#t)
so we'll need to figure out that out depending which order they get
applied in (assuming both changes get accepted).

Thanks,

--=20
Paul Barker
Konsulko Group
