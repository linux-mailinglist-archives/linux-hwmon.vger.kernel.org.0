Return-Path: <linux-hwmon+bounces-1984-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974598B7CA4
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Apr 2024 18:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F3C2284432
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Apr 2024 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CB6179641;
	Tue, 30 Apr 2024 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="10DWIIV7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAE17556B
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714493958; cv=none; b=kTe7zyhXQ23NiLMOtcEDWlG2XUyccXSMVaJrddr1J1rlCPLCKNlBLuM5WTaF6b9IFkRpmxGJjjd/WbDleRPSXtng3IIjM5/lMSUeRHQbvJJjBy3rhMkICujc4Kuq7rn1RaF7CpuXgN2FSLV5yziIn+MQXG5G1CUqYoQLx9F23GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714493958; c=relaxed/simple;
	bh=J44hCCyxD35NbqWW6nQLBqBSODmWNn0Dexkak4J/EvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW9Rh+7dRo4wDLq85b4WMssjitKVpO/i5ippqC828CA0JdvUm7pJmj0lkvk3J+0cWsExrlbFYwuXkPKDHeMlWP2/uMBL05kLDBfj/J9n4wIhoX9fzjJVx756Dfh/beiFSV42eZNiSw4hiaOQxi6WGQKOX9TwJyG1rnDuZ5vFZxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=10DWIIV7; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e060d49f87so18458861fa.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 09:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714493953; x=1715098753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYdB/zYMgqlA7okFvLjIPPWUlhTGwRwh73eiOLj9MZw=;
        b=10DWIIV7lFrlwECtQ+gLiDg8MMuhXsRtzC/FDf4WbC1nhsxE+rB3dP9gXWEoZx8ey3
         CfBdGszghuUQBfBtByeHtFLh0ChHCA5/oFG3clQRcdGGqTNBPa0wVNJE9f6pbcXyU87O
         AKzsaY9d13YfZ5RHT04c/OIeP1STbjgtD+ADg5iXQ23TmqWf2FW+nuo5Xm9kut0npnQb
         SAJwnNxo26e3tcHPtO6Yttq74QxTJJHFqsadVTNACUXyzSgmOvpp+5+Wuw3sgLpIQSS3
         BFF+j8tA7syaoOsC9LOJASeHrjzr7cfsvbrGGH+TDj9Q4N2olM3sr/G4bSy6Rm+Sas8W
         P3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714493953; x=1715098753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYdB/zYMgqlA7okFvLjIPPWUlhTGwRwh73eiOLj9MZw=;
        b=ZuCOc+Jq0co2p6vrdyhBjoPmJSbHFrj8kBrYkYT6oSJrBgyeiuuJIpMtmx5NgwdCSk
         hQIJT5KvrB0bwGyjGV9OMCQmBBFlC+a39fkyFs2U8sknooKZTz+iK3ggjQKyldPJ9BOh
         t4SZ4/8gubvb1TMO75jJv5RhNI7ns/h7pniuFYw++Z2qDLqrDd8w7rKt7t2uAKWQeKEj
         UybbI97FkuenNOAeLmAWcFu5HfhgiUqcIS0uFAVNjanWLbaQwKbzWUXrNB4C4O1ln1IW
         CZOFVZu0Ctkz592f4BYPI1xuo5KmaRUYF2D0ehagizRy5mmv/AIEcSgiOSrk5h5hnu/T
         UCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaHN3ouV9xSEIemHF1AjiiXhPTUCNKZAx/F6HNrJhQFhlRS8Cs1ZbM6AzcwgBsB/jQ0uNPSHEEK1phrQUP+2TsONbjdWD6cH/SdQU=
X-Gm-Message-State: AOJu0Ywpm0cYFqzKg+OCruOe/mp37nI1Q8C3QbZhRkBAIRUczo+xf0j5
	Nt30ZyKnxAWmhCdJIk25dsxON9rFrp2uamrl0A0cKpwroebSFBxmeG+2mPL5blpF8KrggD9TrjT
	7c8fJViGYHezWIFC+BF/4NBMOkISLVHcjsOmwgg==
X-Google-Smtp-Source: AGHT+IHNUEuRQYO/ery9q1WbMjDy+FPeaxsW7gh/vbOG22U6B5PZTmXy7tHPumx1KaMD3DrYzbtRncJOi4/QHYWE08I=
X-Received: by 2002:a2e:3515:0:b0:2de:6f52:5c8d with SMTP id
 z21-20020a2e3515000000b002de6f525c8dmr73932ljz.21.1714493953250; Tue, 30 Apr
 2024 09:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
 <20240429-regulator-get-enable-get-votlage-v2-1-b1f11ab766c1@baylibre.com>
In-Reply-To: <20240429-regulator-get-enable-get-votlage-v2-1-b1f11ab766c1@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 30 Apr 2024 11:19:01 -0500
Message-ID: <CAMknhBG2ySYNEvghnO63wE=x6W8jk0-T2oWZKeXApM_d_eeoCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] regulator: devres: add API for reference voltage supplies
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Support Opensource <support.opensource@diasemi.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 6:40=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> A common use case for regulators is to supply a reference voltage to an
> analog input or output device. This adds a new devres API to get,
> enable, and get the voltage in a single call. This allows eliminating
> boilerplate code in drivers that use reference supplies in this way.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>
> v2 changes:
> * removed dev_err_probe() on error return
> * dropped optional version of the function since there is no more
>   difference after dev_err_probe() is removed
> * renamed function to devm_regulator_get_enable_read_voltage()
> * added unwinding on error paths
> ---
>  Documentation/driver-api/driver-model/devres.rst |  1 +
>  drivers/regulator/devres.c                       | 59 ++++++++++++++++++=
++++++
>  include/linux/regulator/consumer.h               |  7 +++
>  3 files changed, 67 insertions(+)
>
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documenta=
tion/driver-api/driver-model/devres.rst
> index 7be8b8dd5f00..18caebad7376 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -433,6 +433,7 @@ REGULATOR
>    devm_regulator_bulk_put()
>    devm_regulator_get()
>    devm_regulator_get_enable()
> +  devm_regulator_get_enable_read_voltage()
>    devm_regulator_get_enable_optional()
>    devm_regulator_get_exclusive()
>    devm_regulator_get_optional()
> diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
> index 90bb0d178885..4f290b9b559b 100644
> --- a/drivers/regulator/devres.c
> +++ b/drivers/regulator/devres.c
> @@ -145,6 +145,65 @@ struct regulator *devm_regulator_get_optional(struct=
 device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_regulator_get_optional);
>
> +/**
> + * devm_regulator_get_enable_read_voltage - Resource managed regulator g=
et and
> + *                                          enable that returns the volt=
age
> + * @dev: device to supply
> + * @id:  supply name or regulator ID.
> + *
> + * Get and enable regulator for duration of the device life-time.
> + * regulator_disable() and regulator_put() are automatically called on d=
river
> + * detach. See regulator_get_optional(), regulator_enable(), and
> + * regulator_get_voltage() for more information.
> + *
> + * This is a convenience function for supplies that provide a reference =
voltage
> + * where the consumer driver just needs to know the voltage and keep the
> + * regulator enabled.
> + *
> + * In cases where the supply is not strictly required, callers can check=
 for
> + * -ENODEV error and handle it accordingly.
> + *
> + * Returns: voltage in microvolts on success, or an error code on failur=
e.
> + */
> +int devm_regulator_get_enable_read_voltage(struct device *dev, const cha=
r *id)
> +{
> +       struct regulator *r;
> +       int ret;
> +
> +       /*
> +        * Since we need a real voltage, we use devm_regulator_get_option=
al()
> +        * rather than getting a dummy regulator with devm_regulator_get(=
) and
> +        * then letting regulator_get_voltage() fail with -EINVAL. This w=
ay, the
> +        * caller can handle the -ENODEV error code if needed instead of =
the
> +        * ambiguous -EINVAL.
> +        */
> +       r =3D devm_regulator_get_optional(dev, id);
> +       if (IS_ERR(r))
> +               return PTR_ERR(r);
> +
> +       ret =3D regulator_enable(r);
> +       if (ret)
> +               goto err_regulator_put;
> +
> +       ret =3D devm_add_action_or_reset(dev, regulator_action_disable, r=
);
> +       if (ret)
> +               goto err_regulator_put;
> +
> +       ret =3D regulator_get_voltage(r);
> +       if (ret < 0)
> +               goto err_release_action;
> +
> +       return 0;

Oof. Apparently I didn't test this as well as I should have after
adding the unwinding. This obviously should return ret, not 0.

I did more extensive testing today, including faking error returns to
test unwinding to make sure I didn't miss anything else.

> +
> +err_release_action:
> +       devm_release_action(dev, regulator_action_disable, r);
> +err_regulator_put:
> +       devm_regulator_put(r);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_regulator_get_enable_read_voltage);
> +

