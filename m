Return-Path: <linux-hwmon+bounces-14150-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIbLGyJnB2rG1wIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14150-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 20:34:10 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E48CC5564C1
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 20:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A189301DC16
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 18:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976A13FDBFC;
	Fri, 15 May 2026 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsfMqax7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A76318EF4;
	Fri, 15 May 2026 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778868426; cv=none; b=Siq28wCLzSb/eEVamVvky7pxPXi2SkWS9QXGcVCSj5pVOb+/UeDFlsMs5mcHP/It6QqdrswBtAZPE2RTYcJrvyKUI5Q4/iexnbeE4AfB2EiAk07gvZ1MMyQPUfStqef0j+WZrvwSWPUvSHCdDH4KBzrl/2va0OmhQVeG+1xflgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778868426; c=relaxed/simple;
	bh=MNgucxDdXQp6pKqBkiLjgpVooAKZZcCEtmvA/14/GIw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BoogfsCuIO6MOUyyFoEWg8I9ox5ke2HIwDo4tlFyN2rDn3967A+UavIzdZ8ET+JlZloye4uaFWRup9KSj7ql8KQ9X5qJOLAbVcEdoDv4qilkGjIZbydGDEVi0JDgkPVy3uFwJCKcPGY2fTX2SewMe7JUfhrV0x4RM5MgQaboMXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsfMqax7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32BAC2BCB0;
	Fri, 15 May 2026 18:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778868426;
	bh=MNgucxDdXQp6pKqBkiLjgpVooAKZZcCEtmvA/14/GIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fsfMqax7A4eStuzPk/xePDAjyqUk+hnvNNO52aznPJJL3zV62QjyQapO1mSivxAYt
	 MbcxE2md+tpe2vQXffHN7vlDlrKMYSR5CkOsRi2lMdrAOygHSbG2e7ZMPvhBsb167D
	 pdcaHkLZ5pV3etd+ypriw834w+6ryVbdlXW9q6lYwXXuIqAoM3T3OxH/+yzTK+5fxv
	 z17vyrURlNY8FCpGPynoKB9rOtE3G76dYG3THTCoudCYVtMIT4XqeUUafZjCQyD62O
	 4KaHrhogP4NPfpAw8KiP5pLhnMK58hqFZIpz1W5bomWAnOfW0pRlyLPBtTIvROMQ79
	 PBNDFtXYZnHXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260515160537.115808-5-o.rempel@pengutronix.de>
References: <20260515160537.115808-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 18:07:05 +0000
Message-Id: <20260515180705.C32BAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: E48CC5564C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonic.nl:email];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14150-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `cached_bias` and `cached_drive` arrays independently cache th=
e same physical hardware state (`MC33978_REG_CONFIG`), leading to conflicti=
ng state restoration when changing GPIO direction.
--

commit ae57c2734af81a36d2a256fc43f258b7210de10a
Author: David Jander <david@protonic.nl>

pinctrl: add NXP MC33978/MC34978 pinctrl driver

Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple Switch
Detection Interface (MSDI) devices. This driver translates physical switch
states to logical GPIO levels, emulates outputs via hardware tri-state,
and implements a hierarchical irq_chip for interrupt routing.

> diff --git a/drivers/pinctrl/pinctrl-mc33978.c b/drivers/pinctrl/pinctrl-=
mc33978.c
> index 0000000000000..2ee1b1284c87a
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-mc33978.c
[ ... ]
> +struct mc33978_pinctrl {
[ ... ]
> +	enum mc33978_bias_state cached_bias[MC33978_NGPIO];
> +	enum mc33978_drive_mode cached_drive[MC33978_NGPIO];
> +};

Does the separation of cached_bias and cached_drive lead to conflicting
state restoration?

Both arrays appear to independently cache the same physical hardware state
(MC33978_REG_CONFIG) for SP pins:

[ ... ]
> +static int mc33978_set_drive(struct mc33978_pinctrl *mpc, unsigned int p=
in,
> +			     enum mc33978_drive_mode mode)
> +{
[ ... ]
> +	ret =3D mc33978_update_bits(mpc, MC33978_REG_CONFIG, mask,
> +				  (mode =3D=3D MC33978_OPEN_DRAIN) ? mask : 0);
> +	if (!ret)
> +		mpc->cached_drive[pin] =3D mode;
> +
> +	return ret;
> +}

When mc33978_set_drive() updates MC33978_REG_CONFIG and cached_drive,
cached_bias is left stale.

[ ... ]
> +static int mc33978_set_pull(struct mc33978_pinctrl *mpc, unsigned int pi=
n,
> +			    enum mc33978_bias_state val)
> +{
[ ... ]
> +	/* Configure direction (Exclusively for SP pins) */
> +	if (mc33978_is_sp(pin) && val !=3D MC33978_TRISTATE) {
> +		ret =3D mc33978_update_bits(mpc, MC33978_REG_CONFIG, mask,
> +					  (val =3D=3D MC33978_PD) ? mask : 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Enable current source or set to tri-state  */
> +	ret =3D mc33978_update_bits(mpc, mc33978_spsg(MC33978_REG_TRI_SP, pin),
> +				  mask,
> +				   (val =3D=3D MC33978_TRISTATE) ? mask : 0);
> +	if (!ret)
> +		mpc->cached_bias[pin] =3D val;
> +
> +	return ret;
> +}

Similarly, when mc33978_set_pull() updates MC33978_REG_CONFIG and
cached_bias, cached_drive is left stale.

[ ... ]
> +static int mc33978_direction_input(struct gpio_chip *chip, unsigned int =
offset)
> +{
> +	struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +
> +	guard(mutex)(&mpc->lock);
[ ... ]
> +	return mc33978_set_pull(mpc, offset, mpc->cached_bias[offset]);
> +}

If mc33978_direction_input() unconditionally restores cached_bias, could
this write back stale MC33978_REG_CONFIG data, clobbering a recently
configured output drive mode?

[ ... ]
> +static int mc33978_direction_output(struct gpio_chip *chip, unsigned int=
 offset,
> +				    int value)
> +{
> +	struct mc33978_pinctrl *mpc =3D gpiochip_get_data(chip);
> +	u32 mask =3D BIT(offset);
> +	u32 bits =3D value ? mask : 0;
> +	int ret;
> +
> +	guard(mutex)(&mpc->lock);
> +
> +	ret =3D mc33978_set_drive(mpc, offset, mpc->cached_drive[offset]);
> +	if (ret)
> +		return ret;
> +
> +	return mc33978_update_tri_state(mpc, mask, bits);
> +}

And likewise, could mc33978_direction_output() clobber the pinctrl bias
setting when it restores the potentially stale cached_drive?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515160537.1158=
08-1-o.rempel@pengutronix.de?part=3D4

