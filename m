Return-Path: <linux-hwmon+bounces-15465-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wpotG+kxQ2qHUQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15465-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 05:03:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D152C6DFF35
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 05:03:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YluZ3Vq5;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15465-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15465-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBA97300E254
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 03:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508253CF217;
	Tue, 30 Jun 2026 03:03:01 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF8236AB72;
	Tue, 30 Jun 2026 03:02:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788581; cv=none; b=i7b6i3GKu3PFBrhxSct0Bm58HshzzWJ1F7dleyRhUdMpi6YoC3QLluFeaNCN0htz2GMCV5HFa+anZh4g/4m/iABeLGYln7hXOdhDP3rO+Vz9A+wMJ6PJhl1AZg1nshWH5DKpIfP3nx5tqOFigC4sStbyYZ3vGVJU2oOtQIiNEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788581; c=relaxed/simple;
	bh=yl0fczNmXhP2D+mIl+xPNfWgDIkRtGeutbpvRy5os08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XD6wRPerOSmQK6iGFD8l9z7ISn/X+UZUWZ5lGy8o5vKtGY5MVV80Z1mezFp4yL6N+VcMlMYXovsEDSgX7Wo6jred5tXlBznngA6BtJMT+o08rc2THXyPJ0JGIoarUYxLJmnuw0URMb+uaHC8NJBiV6/qD8kQbu/vCOw/hH9U9lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YluZ3Vq5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B011F000E9;
	Tue, 30 Jun 2026 03:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788579;
	bh=1DzKjD4b1zUV+B0GEkGbnxH4AZ6Uhi/Qxixyq2TYqnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YluZ3Vq5JQvfp+Yu4eaZsxnar8WXPhwm6O350hVxpZObVg4EzWfnolHNnWz4UXWQI
	 Fcsi4qB6GZ4C8aDitt4HbkmMI33S2B4DJGC+cqEJt4Ed50Xowt6sk0CxZtTeFTxhHo
	 ATRnVEBDGf4pBJiT5Kiv8Im0pSglp0R8oT0A2+0/Ev1WWiViut9WNL+B4Rv7U2Z9nO
	 b16iGfpMO9hAZk0q8Uv339zEGJhfGkyxhijCoTv5/JDnNIvnt1W+L0JjCVWAM3Dkv4
	 jTmjGWvNVktI/RZ5lsuEN/ENYQGwpp1NZjU+8QNppdlZdPqHNcIk6mSnTv/Yo67ph0
	 WXQ2tAXK4GQEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 03:02:59 +0000
Message-Id: <20260630030259.A4B011F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15465-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,analog.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D152C6DFF35

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing initialization delay after asserting the enable GPIO cause=
s probe failure if the device was previously powered off.
--

commit a97eed13d5037d1e7850e1b18fc5fc3222705d55
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for enable GPIO

Add support for the GPIO controlled EN pin. The EN pin is asserted high
for device to operate.

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
Could this cause a regression where the driver fails to probe due to a miss=
ing
hardware boot-up delay?

When the enable GPIO is configured in the device tree and the device was
previously powered off, asserting it with GPIOD_OUT_HIGH will power up the
device. However, the driver proceeds to call i2c_smbus_read_block_data()
shortly after without any settling time.

If the regulator requires a delay to boot up before it can acknowledge i2c
packets, this immediate read might receive a nack and cause the driver
probe to abort.

>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK=
_DATA) &&
>  	    !i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_I2C_B=
LOCK))
>  		return -ENODEV;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D3

