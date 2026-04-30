Return-Path: <linux-hwmon+bounces-13657-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMNfIfm182lB6QEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13657-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 22:05:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0B4A78FD
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 22:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37D673003BC8
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 20:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2657F3890E8;
	Thu, 30 Apr 2026 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWnYhdli"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015ED388E7D
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777579508; cv=none; b=gEfA5T4+1kmnwilBX3TtFtU19BS1BQdLg8z6cn5rEo3K/TC4IKKD/KNqPBfeu2oQW5A+en+6pLAEW+75zxUNUo5gktjP34sJJhPExp5rTur5mG8trdRUFLeJ4GgnOzefjQQ4fS/ecvwznsyEyZzWMk1amubxOPbIMRaoryYbTa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777579508; c=relaxed/simple;
	bh=cl9O+spRAp0wy6KKcnwvKXkFcRH/01WXV2qCe307Da8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwZiqayQUC7eu+fTvEGP/E92LsaykXZnRVQFhUomGUe3cuSTBIkoPiXBfd+bloPZytt7WwFKLaRIZVZ3iyY7/Q50mJM8idNmyYgE68NXoiAjvT9qKksD3GO6Cr2WTnh7YIjYsmUZE8mH0Wx+Mkd2sqE0oFj+g0OCSANASXgRYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWnYhdli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D091BC2BCC6
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777579507;
	bh=cl9O+spRAp0wy6KKcnwvKXkFcRH/01WXV2qCe307Da8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FWnYhdliKOP49C6Do51nNXZ3FQomUDF8hQKVDOxhExg5UvN8EcaJpf0Q6vikl9CGC
	 dRFcQL4dcIapoPXyHlqIASPdhHyKh40U5yP+XTyJbAFHo92AqnF++AGGUpCg62OD7T
	 /qtpNg4UWSdJonNzKRbjWpiVejWut70HR6NO2TtMjgpPgGeMBQVfpvQYqdtZWrNwtz
	 aeL6CmQha10/Mlzqq40rEMyrX1Ch4dtB8/ZgpfXjCmCLSsdTajof7STA4Y5+kZXjKW
	 3ZaM8buazYRE0B73HegZ4FY7xlrN1PeX8T9X5SQqXbOwICHBIJE5chfPDCRB0IxKGK
	 7xAQbhEz94phg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso1158933e87.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 13:05:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8pNF3e0tWM3IaZBcD+YkaoI6e9jRS7YrZhS2C/J8LSqQJxpzpdUkEqLcoST2W+WcdTJdpvM+e+9Mhsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7JBliGfNP1PRip3KkOFlcLrmn2kuwnkMjir8N+UNFWuWIrr3V
	flYoZAM7KJ41GdQ7uDko9vmrJF8I+VqwCGJduRMZe1wk+ieR9L+6pdG74gQMnoLBaWPdg88pQyu
	TKa6rNhafOFBHvOoEGHqJAHRUs0u3zb8=
X-Received: by 2002:a05:6512:1188:b0:5a3:fd0e:ce6f with SMTP id
 2adb3069b0e04-5a8522d511fmr1959436e87.23.1777579505840; Thu, 30 Apr 2026
 13:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com> <20260429161430.3802970-3-daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260429161430.3802970-3-daniel.lezcano@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2026 22:04:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ikGV1RYWPs6uCiAbJgX2iCr46fJj8XPh1bgPUhWHUniQ@mail.gmail.com>
X-Gm-Features: AVHnY4LtllfFFrrvT9P9cCy4j4syDT7Wt1JzyAEVB8JJUolnZv1oLO7bL5fb5Q8
Message-ID: <CAJZ5v0ikGV1RYWPs6uCiAbJgX2iCr46fJj8XPh1bgPUhWHUniQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] thermal/core: Add a non-OF registering function
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, 
	gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8AF0B4A78FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13657-lists,linux-hwmon=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,intel.com,arm.com,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,etnaviv];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 6:14=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> In order to propose an alternative to non OF code registering a
> cooling device, provide functions which are not for OF code. That sets
> the scene for OF and non-OF code split.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/thermal/thermal_core.c | 35 ++++++++++++++++++++++++++++++++++
>  include/linux/thermal.h        | 16 ++++++++++++++--
>  2 files changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_cor=
e.c
> index 664a4cc95199..5c954bcae4a4 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -1194,6 +1194,41 @@ static void thermal_cooling_device_release(void *d=
ata)
>         thermal_cooling_device_unregister(cdev);
>  }
>
> +/**
> + * devm_thermal_cooling_device_register() - register a thermal cooling d=
evice
> + * @dev:       a valid struct device pointer of a sensor device.
> + * @type:      the thermal cooling device type.
> + * @devdata:   device private data.
> + * @ops:       standard thermal cooling devices callbacks.
> + *
> + * This function will register a cooling device with device tree node re=
ference.
> + * This interface function adds a new thermal cooling device (fan/proces=
sor/...)
> + * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bin=
d itself
> + * to all the thermal zone devices registered at the same time.
> + *
> + * Return: a pointer to the created struct thermal_cooling_device or an
> + * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
> + */
> +struct thermal_cooling_device *
> +devm_thermal_cooling_device_register(struct device *dev,
> +                                    const char *type, void *devdata,
> +                                    const struct thermal_cooling_device_=
ops *ops)
> +{
> +       struct thermal_cooling_device *cdev;
> +       int ret;
> +
> +       cdev =3D __thermal_cooling_device_register(NULL, type, devdata, o=
ps);
> +       if (IS_ERR(cdev))
> +               return cdev;
> +
> +       ret =3D devm_add_action_or_reset(dev, thermal_cooling_device_rele=
ase, cdev);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return cdev;

After the previous patch, this may just be a wrapper around
devm_thermal_of_cooling_device_register() passing NULL as np to it.

> +}
> +EXPORT_SYMBOL_GPL(devm_thermal_cooling_device_register);
> +
>  /**
>   * devm_thermal_of_cooling_device_register() - register an OF thermal co=
oling
>   *                                            device
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 0ddc77aeeca2..50b43e328ab9 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -253,8 +253,12 @@ void thermal_zone_device_update(struct thermal_zone_=
device *,
>  struct thermal_cooling_device *thermal_cooling_device_register(const cha=
r *,
>                 void *, const struct thermal_cooling_device_ops *);
>  struct thermal_cooling_device *
> -thermal_of_cooling_device_register(struct device_node *np, const char *,=
 void *,
> -                                  const struct thermal_cooling_device_op=
s *);
> +devm_thermal_cooling_device_register(struct device *dev, const char *typ=
e,
> +                                    void *devdata, const struct thermal_=
cooling_device_ops *ops);
> +
> +struct thermal_cooling_device *
> +thermal_of_cooling_device_register(struct device_node *np, const char *t=
ype,
> +                                  void *devdata, const struct thermal_co=
oling_device_ops *ops);
>  struct thermal_cooling_device *
>  devm_thermal_of_cooling_device_register(struct device *dev,
>                                 struct device_node *np,
> @@ -304,6 +308,14 @@ static inline struct thermal_cooling_device *
>  thermal_cooling_device_register(const char *type, void *devdata,
>         const struct thermal_cooling_device_ops *ops)
>  { return ERR_PTR(-ENODEV); }
> +
> +static inline struct thermal_cooling_device *
> +devm_thermal_cooling_device_register(struct device *dev, const char *typ=
e,
> +                                    void *devdata, const struct thermal_=
cooling_device_ops *ops)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline struct thermal_cooling_device *
>  thermal_of_cooling_device_register(struct device_node *np,
>         const char *type, void *devdata,
> --
> 2.43.0
>
>

