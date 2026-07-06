Return-Path: <linux-hwmon+bounces-15581-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+PECWQSS2pqLgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15581-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 04:26:44 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEBD70C1C8
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 04:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NCW7FcUE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15581-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15581-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B49D3046FF3
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 02:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E066037D10E;
	Mon,  6 Jul 2026 02:21:57 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE22571C7;
	Mon,  6 Jul 2026 02:21:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304517; cv=none; b=QZAft2HuUR9e8U4PW/RyHX/1QsVvkjiAvRx6yytz7cLR8afVZUMA/lFDwSVrY6L69LlMnylcfbM/hqCVyEvH90wi//OdzQRInMEmoeuYeDn1LWc99Hj1fZjVjv0wqDX79gFnqUANe8P38WKeGTRd04ibMVkbehzyAIUpvP6frGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304517; c=relaxed/simple;
	bh=W08u6cMqm8AssLDLLZINau+NVIsZnLSWS51z7PYM4OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TgG+aMgZ/IqmgIuSLDOYwiN/vwuK61fpTbyVsnNDCsty/MvqrMo/E17bWJgl0COWkS4B95/lwxmEmAImiKZ9pP8aXxVfujvHJkLPjBbTxO6Tlelt3ulOW+fcGJ0+Cj8DRZVoboYER5L2JgAp7lsLnMCBK/t5KQ2y4lcokXPu4wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCW7FcUE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B251F000E9;
	Mon,  6 Jul 2026 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783304516;
	bh=aZrtCXjwUyJlZ/LsHCvAzZ4kOm/tIv6jHSibcQ9okmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NCW7FcUEM/h6XBVjNPsb9ExHdE9yUjaBIWyImfwXyx24aTQpqeyv1bu+HSuiODdXk
	 g8Cxa3h96t/dpI2DdjvwI0wHQguvv4GzpAUl1KOVmVQL2P9aFOxrRX72CzziZ8o3GB
	 P8m7+D3NO0+leaFA8exdKMT32dUW6afkRszh/KFPwCUJF2miK8Ylo23aItv5yYDE1k
	 G4DwLV/VgcjOgSosRVopkL3tzzQCQaxFjJsemLTXnyfiQO7YnDQdCCGOhqoHcENCqO
	 IOSL8KFyInbXg6/k3/eeLxQ0XzfySPyZhvoKAEgAdzWilq9V27omTpjEuKLf6k4Nek
	 zbPn1o+vjhVNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-3-37761e89bb5f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 02:21:55 +0000
Message-Id: <20260706022155.C5B251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15581-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto,analog.com:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AEBD70C1C8

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Scaled `PMBUS_READ_VOUT` value can exceed the 16-bit capacity of t=
he PMBus `LINEAR16` format, causing silent truncation and incorrect voltage=
 reporting.
- [High] Missing software scaling for VOUT limit attributes and missing `.w=
rite_word_data` callback causes hardware limits to be programmed completely=
 out of bounds.
--

commit 19e6041d100f0e80c9e49784d17900b141e3ea61
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
   =20
Implement support for external voltage divider scaling using the
adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.

When the desired output voltage exceeds VREF, a resistor divider
(RFB1 and RFB2) is used to scale down the feedback voltage. The
driver reads these resistor values from device tree and applies
the scaling formula: VOUT_actual =3D VOUT_measured =C3=97 (1 + RFB1/RFB2)

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index cb2c23672166d..5aad4448054fc 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c

[ ... ]

> @@ -14,6 +15,45 @@
> =20
>  #define MAX20830_IC_DEVICE_ID_LENGTH	9
> =20
> +struct max20830_data {
> +	struct pmbus_driver_info info;
> +	u32 vout_rfb1;
> +	u32 vout_rfb2;
> +};
> +
> +/*
> + * Driver currently only supports READ_VOUT for monitoring that needs sc=
aling to
> + * convert from feedback voltage to actual output voltage.
> + *
> + * vout_actual =3D vout_fb =C3=97 (1 + RFB1/RFB2)
> + *
> + * VOUT_COMMAND and VOUT_MAX are currently not in use, but work with fee=
dback
> + * voltage. If regulator support is added, VOUT_COMMAND values would need
> + * to be adjusted accordingly.
> + */
> +static int max20830_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client);
> +	const struct max20830_data *data =3D container_of(info, struct max20830=
_data, info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Apply voltage divider scaling if resistors are non-zero */
> +		if (data->vout_rfb1 && data->vout_rfb2)
> +			ret =3D DIV_ROUND_CLOSEST_ULL((u64)ret * (data->vout_rfb1 +
> +						    data->vout_rfb2), data->vout_rfb2);
> +		return ret;

[Severity: High]
Does this returned value need bounds checking?

If a large resistor divider is used, the scaled PMBus word calculated here
can exceed 0xFFFF. The generic PMBus core function pmbus_reg2data_linear()
will cast this returned value to a u16, silently wrapping the value modulo
65536 and resulting in wildly incorrect telemetry (e.g., reporting 2V inste=
ad
of 12V).

Should this be clamped using clamp_val(ret, 0, 0xffff)?

> +	default:
> +		return -ENODATA;
> +	}
> +}

[Severity: High]
Will returning -ENODATA bypass software scaling for VOUT limit attributes?

The driver sets PMBUS_HAVE_VOUT below, which exposes hardware VOUT limits
(like inX_max or inX_lcrit). Because only PMBUS_READ_VOUT is intercepted
here, the core will read those limits unscaled from the hardware.

> +
>  static struct pmbus_driver_info max20830_info =3D {
>  	.pages =3D 1,
>  	.format[PSC_VOLTAGE_IN] =3D linear,
> @@ -24,13 +64,25 @@ static struct pmbus_driver_info max20830_info =3D {
>  		PMBUS_HAVE_TEMP |
>  		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>  		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data =3D max20830_read_word_data,

[Severity: High]
Does this struct also need a .write_word_data callback?

Since PMBUS_HAVE_VOUT is enabled, user writes to limit attributes will fall
through to the PMBus core, which writes the scaled PMBus word directly into
the hardware's limit register. Because the hardware expects limits in the
unscaled feedback voltage range, the written value will be completely out
of bounds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dev-max208=
30c-v2-0-37761e89bb5f@analog.com?part=3D3

