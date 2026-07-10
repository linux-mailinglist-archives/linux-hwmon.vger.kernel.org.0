Return-Path: <linux-hwmon+bounces-15746-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xkDYCwjKUGqb5AIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15746-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 12:31:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8F739BAA
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 12:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K4P0+Ygp;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15746-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15746-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75AA0304652D
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 10:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C05D407CD1;
	Fri, 10 Jul 2026 10:27:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAE4071F5;
	Fri, 10 Jul 2026 10:27:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679223; cv=none; b=hD4Se2YGuTFbxj55pl5CHQAPB8oxdezyxsEp60c0QIEMUDwJPSAigJfRgshy2fKqFtrWOzkTs1fRfeZT4JQJg7TsZS4UHJ/6tzB7q8sseXVXInUXlemaB2LqF3wENAgEUfEyYCvbSPuSOxOxYOcLnqviZGcw8DcqRzAY26X/pA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679223; c=relaxed/simple;
	bh=YtWJ4O4o8yCUPWgsElNe4dhkiE/3uw1HIb9WHwqjt5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VO/bsL53L6iDxG3vXc5fOJoMwbLxJB2rSIkYQPurSDdlroA1AfkWVq+POQ1wUmXq2khCIKgsAztvucyUSIQViKPIohAjURnfmym9sJU+JBzpLRVoyp0oHAMiRatn7Z2qO8bu3r9IqEOEr2XX0178qBx82/6fcJrnlXWQGNKKcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4P0+Ygp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5461F000E9;
	Fri, 10 Jul 2026 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679222;
	bh=dNAvF+zpebibRMo4mEGZCoLlukBY10ynXDv91NonSeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K4P0+YgpBzecLog82Q5L+HaJgJxrXxWUplQQMnoN+gf1sZPvgWus8wkUFrNd8OFiB
	 gqp1gdRb1V/ZbUVsNjTqq03xiFfleZRHuyOcpJbEoSm1MeAiaB2q0ee0IxTXa0AP75
	 l/+UXrpzY9oSDDYuumMVekWV2ymxmaZYNLnN8+mP7Yh5lhBLKBIdbFI57xtEN4YH/p
	 yfuY5zTBrKzzKxOdV5c025c0+bZbNBmJ5hXNnjROzSsMYlxaZHBTsnlCu3bW2G0mwb
	 jwswMmUbtfy3ai0b2Wby52EqCtDdA4g+wp9DLq7YXCcnzdW2SXyJiEbzcJLdDvIYQ1
	 SoeQtlJnHWEWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260710101358.2606941-5-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:27:01 +0000
Message-Id: <20260710102701.AE5461F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15746-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:email,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:o.rempel@pengutronix.de,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FD8F739BAA

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing getter support for PIN_CONFIG_DRIVE_STRENGTH_UA breaks p=
inconf readback symmetry.
--

--- Patch [4]: [PATCH v15 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl dri=
ver ---
commit ac0b5b5ec87f6510c16dfd82ea1f8febfb16aa81
Author: David Jander <david@protonic.nl>
Subject: pinctrl: add NXP MC33978/MC34978 pinctrl driver

This commit adds a new pinctrl and GPIO driver for the NXP MC33978/MC34978
Multiple Switch Detection Interface (MSDI) devices. It provides GPIO read/w=
rite
access, emulated outputs, and interrupt routing by exposing the 22 mechanic=
al
switch detection inputs as standard GPIOs.

> diff --git a/drivers/pinctrl/pinctrl-mc33978.c b/drivers/pinctrl/pinctrl-=
mc33978.c
> new file mode 100644
> index 0000000000000..4a7ea1bed233c
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-mc33978.c

[ ... ]

> +static int mc33978_pinconf_get(struct pinctrl_dev *pctldev, unsigned int=
 pin,
> +			       unsigned long *config)
> +{

[ ... ]

> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		ret =3D mc33978_get_ds(mpc, pin, &data);
> +		if (ret)
> +			return ret;
> +		arg =3D data;
> +		break;

[Severity: Medium]
Will this cause debugfs read failures for microamp configurations?

The setter mc33978_pinconf_set() explicitly handles
PIN_CONFIG_DRIVE_STRENGTH_UA, but it is missing here in the getter.
Should PIN_CONFIG_DRIVE_STRENGTH_UA be supported here to maintain readback
symmetry?

> +	default:
> +		/*
> +		 * Ignore checkpatch warning: the pinctrl core specifically
> +		 * expects -ENOTSUPP to silently skip unsupported generic
> +		 * parameters. Using -EOPNOTSUPP causes debugfs read failures.
> +		 */
> +		return -ENOTSUPP;
> +	}
> +
> +	*config =3D pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710101358.2606=
941-1-o.rempel@pengutronix.de?part=3D4

