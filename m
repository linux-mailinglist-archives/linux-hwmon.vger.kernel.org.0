Return-Path: <linux-hwmon+bounces-15461-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AVP2DjcwQ2pnUAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15461-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 04:55:51 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1A46DFEE9
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 04:55:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Z/g3BLA9";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15461-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15461-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49C513038124
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 02:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0263C345F;
	Tue, 30 Jun 2026 02:54:00 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D906248F64;
	Tue, 30 Jun 2026 02:53:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788040; cv=none; b=Rv3onR2IvoZwvWeMRtxZCySXRAqdZpABoondxUu1QDkgrPSiQPfhoYGjNwSoDKa7WdtP7eXtChljDbFe6zZS3/WFPZ3/o5/t65xcnBnmdgg3sZ+AKP/o6L7jVZIrXLhhJoAvoLKUHqHC8waCH2vpmhRRP/vvSy3rjem/sUEg9JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788040; c=relaxed/simple;
	bh=9Hay3CagXdobhrtGcxM4w5S4eGyQHiRJel3CtUBbExg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DK6mjPRFtzu205Oga+95haJQhPd1SWrQt+gGCtgVG0AEpR2KU6XLo1m702Tep3FitITFzQRFk4vzd8E2ILWRfMje72SZ60ft/FiVLu71J3mA7NrvAV7/kQfh0DELhCNSwgb+oMpw6duEbKmslcjlV/Oe1wK8OxCtLi0XAbXyrzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/g3BLA9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7E91F000E9;
	Tue, 30 Jun 2026 02:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788038;
	bh=JlKYEH475Z/r8n4F2eueogUxISoYAAQj7E1+FOR6n3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/g3BLA9BLCktdZP6KO1zAyoBrVSqbPPPwJAxI3Ja7GpzJB7gSZZdjmQL13Z0qISU
	 YE6gtaZ9EDd3jPzfJ0heaxG/1nPHy3jADc4PwLZN5LRCZlP1cE5jspobyeQ4XZAFRg
	 GyGu6mER+0QvvBFT288DBeWwVh/bVNC8u3dwKKIYuZI1SPleOL92QaXU5hTTpmJy+A
	 KgmXQf+THFe22y5YqIrkPrHkfEG9NmvRNk18QCjnzFYppU7a3/M9/CLCGDzRma0ovM
	 LbBWQnSljfwRtlEoQPKw7pZEWd1Od7wHQcRO3n341HB8xtVlVmUWgQEBNWyQxUEoi5
	 mx9MZh4v1JzDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] hwmon: (pmbus/max20830): add support for enable
 GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-2-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:53:57 +0000
Message-Id: <20260630025358.7A7E91F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15461-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,analog.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF1A46DFEE9

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing delay between asserting the enable GPIO and initiating I2C=
 communication.
--

commit a97eed13d5037d1e7850e1b18fc5fc3222705d55
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for enable GPIO

This commit adds support for a GPIO-controlled EN pin. The EN pin is
asserted high to allow the device to operate.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index cb2c23672166d..cb3a39d747ede 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> @@ -29,8 +30,14 @@ static struct pmbus_driver_info max20830_info =3D {
>  static int max20830_probe(struct i2c_client *client)
>  {
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] =3D {};
> +	struct gpio_desc *enable_gpio;
>  	int ret;
> =20
> +	enable_gpio =3D devm_gpiod_get_optional(&client->dev, "enable", GPIOD_O=
UT_HIGH);
> +	if (IS_ERR(enable_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
> +				     "Failed to get enable GPIO\n");
> +

[Severity: High]
Will this cause the probe to fail if the device was previously unpowered?

When the enable GPIO is asserted high using devm_gpiod_get_optional() with
GPIOD_OUT_HIGH, the device initiates its power-on reset and internal=20
initialization sequence.=20

Because there is no explicit delay between asserting the enable pin and the=
=20
subsequent I2C communication in max20830_probe(), is it possible the first
I2C transaction will fail with a NACK because the hardware hasn't finished
initializing?

Should there be a short delay here after pulling the enable pin high to
give the device time to be ready for I2C communication?

>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK=
_DATA) &&
>  	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_B=
LOCK))
>  		return -ENODEV;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D2

