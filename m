Return-Path: <linux-hwmon+bounces-15462-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gqHoHSIwQ2pYUAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15462-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 04:55:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97B6DFED9
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 04:55:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UHmaDCtT;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15462-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15462-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56D403008095
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 02:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF733C2BA3;
	Tue, 30 Jun 2026 02:54:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AC3783AC;
	Tue, 30 Jun 2026 02:54:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788091; cv=none; b=eF3MjJ0wb9BWIGAQUk4oZBfSZebYyOp4auUEgi27eSrsSaJ25mUAR1j1uR5nSaM5F6xFVqpaXgFQ+Ki30frrXJLJ0xuKUvUQMckf6w8Kh2dAJVDTuLJINePzZ3ui7OLztXmploRS2Su/AZecrEPtz4nuARBPxux04Z1cYtxIxP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788091; c=relaxed/simple;
	bh=51pqVZ4vBKTLJi5n+VOhthhPSCq4fPeqR/fCxrtuM/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WpYYXaP9niJ9EErgQrRcFaNZHoHPLMIDfTmGmlB/rt7nGUk/fcapg1onGg/2vL26i/aANkRDytkUlOb7BQIVj4VlAfSwx1ttLE090hQMGdcyIfAAM/0YQC7jViJgeHlpaqyUrfrI5f13mr8aqNImgAH8r6HBPfG7DrErqdme5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHmaDCtT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2236B1F000E9;
	Tue, 30 Jun 2026 02:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788090;
	bh=GHDAFiS0PFCgDI4Nw7mJOMaFtu/cJce9HDs1nhFMDrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHmaDCtTZFtMCjYouFX3GTnVkZnJ098qbU3bMqvIT23wKse2qCk5HYs1ll4Qqjkey
	 vgpf78riI/Gb5XJFeqY76pvjGr/Q3pN1Kz6PvDG9rCZEAzFTBzjGt5OOk5xigfvRP3
	 mTE7Jdl1r2z+VjW2Z2m8e0y5bokaKUabLSQz8D5twsMUabXhth0ss1KLIRcTVsTFho
	 6/lgQBGbC8cCzyQzODa1pByW7Cweayto3tfFTEIAI01iU96N+ziZcYmwzpcSFBArCd
	 8yYZzt5PIwbqGQrj5rY8E3J43e/ao0EHnJ8sOu+Cnnjfnp2qmTkZdMdcFIiHTiPP+8
	 b6cBlybwc88pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:54:49 +0000
Message-Id: <20260630025450.2236B1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15462-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,analog.com:email,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C97B6DFED9

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing NULL check for the return value of i2c_get_match_data() le=
ads to a potential NULL pointer dereference.
--

commit 44325aff0c44d84d978feed33af57c60c31e89f3
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830): add support for max20830c and max20840c

This commit adds support for the MAX20830C and MAX20840C step-down DC-DC
switching regulators with PMBus interfaces. It updates the driver to handle
multiple device types by introducing chip-specific information structures
and matching data.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> index a3abd24437e8e..252c77beb243c 100644
> --- a/drivers/hwmon/pmbus/max20830.c
> +++ b/drivers/hwmon/pmbus/max20830.c
[ ... ]
> @@ -60,11 +83,14 @@ static struct pmbus_driver_info max20830_info =3D {
> =20
>  static int max20830_probe(struct i2c_client *client)
>  {
> +	const struct max20830_chip_info *chip;
>  	u8 buf[I2C_SMBUS_BLOCK_MAX + 1] =3D {};
>  	struct max20830_data *data;
>  	struct gpio_desc *enable_gpio;
>  	int ret;
> =20
> +	chip =3D i2c_get_match_data(client);
> +

[Severity: High]
Can this result in a NULL pointer dereference if i2c_get_match_data() retur=
ns
NULL?

If an I2C device is instantiated via sysfs using driver_override with a
device name that doesn't exist in the driver's ID tables, table matching is
bypassed and i2c_get_match_data() will return NULL.

>  	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
[ ... ]
>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_READ_BLOCK_=
DATA)) {
> -		/* Reads 9 Data bytes from MAX20830 */
>  		ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>  		if (ret < 0)
>  			return dev_err_probe(&client->dev, ret,
>  					     "Failed to read IC_DEVICE_ID\n");
>  	} else {
> -		/* Reads 1 length byte + 9 Data bytes from MAX20830 */
> +		/* Reads 1 length byte + data bytes */
>  		ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> -						    MAX20830_IC_DEVICE_ID_LENGTH + 1,
> -						    buf);
> +						    chip->id_length + 1, buf);

The chip pointer is then dereferenced here when reading chip->id_length wit=
hout
first checking if it is valid. Should there be a validation check on chip a=
fter
it is obtained from i2c_get_match_data()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D6

