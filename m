Return-Path: <linux-hwmon+bounces-14274-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNEFOzz9CmqA+wQAu9opvQ
	(envelope-from <linux-hwmon+bounces-14274-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 13:51:24 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CA56BF8B
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 13:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C64BA301AA91
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 11:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0437D135;
	Mon, 18 May 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajIiep4u"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBAD325491;
	Mon, 18 May 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104778; cv=none; b=Uj07+SUfIF2VaAGlgpEDYJ1tpEwRc/kZ8oNnuadhMR6KW4L9DtNGsLRpIHw09oPXgNvR2d5WgCYqcXjZeBtAe5s4dSLOdwcl+5/E8PImL/A1VEQRGQap8DiL4f9cuGwWTeOiVwkHQWUJdsbfqYlRiEcoL7sa0J9fueHgHbkqZiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104778; c=relaxed/simple;
	bh=O/pwzqRu2WmJr9zRBK96Yj3d47SMwBWRGkBwHkoayuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lwxgGv7mLHpGjH31yzkzCVQhaG++VLhNCgTX0NzcMVmno6kjXAgXqhvuWIh+mflGjtWVcXKYVT9Wqx2FdBUbx5NwP29GojIJNCdUkTTsmCgVuXOqg7H0UaU1186UimF22w+Pg+5Vs1+cEobPiEm7HCTJ/unWooapPjFxnji7LAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajIiep4u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995E2C2BCC6;
	Mon, 18 May 2026 11:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779104778;
	bh=O/pwzqRu2WmJr9zRBK96Yj3d47SMwBWRGkBwHkoayuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ajIiep4umMEeQYb2a6AbIHbcROhdZNR3+xoXW7mdlngdc9nBL3cBzzEA9c3O0LHzc
	 A2UzmjdVSFVXf341CV9Vg7dASV7d4l0kXyCbSfzgOlNen/SRu9uyOqJI1OrBq4xUIL
	 Osbj5KGggP+tC0pnzxaDXibW+BqwG7BO+QqY5h5tfR8dD1YujgDTRmD+P0m0lnDQmc
	 4ut87dbY/dDtEbpn5ib0CKdsZ2VSD9+WZzBLzJ71fFfS8l6lDRzFQBZvhIOVivaB6i
	 dkIvQWycRjkaZZ4oZnX79ZxEMgahuxgOC8GIZnOn+IcYTjEl6d56PowLm5VdgOqg/n
	 7ETDEAQHUAmaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 4/6] pinctrl: add NXP MC33978/MC34978 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260518100054.3552143-5-o.rempel@pengutronix.de>
References: <20260518100054.3552143-5-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:46:16 +0000
Message-Id: <20260518114617.995E2C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: A57CA56BF8B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,protonic.nl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14274-lists,linux-hwmon=lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The GPIO chip is exposed to consumers before its pin ranges are =
established, creating a race condition.
--

commit 3bc65f1451eade57ad8e2b23e1cd7f59d63eb878
Author: David Jander <david@protonic.nl>

pinctrl: add NXP MC33978/MC34978 pinctrl driver

Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple Switch
Detection Interface (MSDI) devices. This driver exposes the 22 mechanical
switch detection inputs as standard GPIOs and supports emulated outputs
and hierarchical interrupt routing.

> diff --git a/drivers/pinctrl/pinctrl-mc33978.c b/drivers/pinctrl/pinctrl-=
mc33978.c
> new file mode 100644
> index 0000000000000..5ac4ebb115b66
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-mc33978.c

[ ... ]

> +	mpc->pctldev =3D devm_pinctrl_register(dev, &mpc->pinctrl_desc, mpc);
> +	if (IS_ERR(mpc->pctldev))
> +		return dev_err_probe(dev, PTR_ERR(mpc->pctldev),
> +				     "can't register pinctrl\n");
> +
> +	ret =3D devm_gpiochip_add_data(dev, &mpc->chip, mpc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't add GPIO chip\n");
> +
> +	/*
> +	 * Distinguish GPIO IRQ domain from parent MFD domain sharing the same
> +	 * fwnode. Matches the pattern used by other GPIO drivers (e.g.,
> +	 * crystalcove). DOMAIN_BUS_WIRED indicates this domain represents
> +	 * actual GPIO pin interrupts (wired lines).
> +	 */
> +	irq_domain_update_bus_token(mpc->chip.irq.domain, DOMAIN_BUS_WIRED);
> +
> +	ret =3D gpiochip_add_pin_range(&mpc->chip, dev_name(dev), 0, 0,
> +				     MC33978_NGPIO);

Could this create a race condition where the GPIO chip is exposed to
consumers before its pin ranges are established?

If a consumer requests a GPIO in the narrow window after
devm_gpiochip_add_data() completes but before gpiochip_add_pin_range()
is called, gpiolib's pinctrl_gpio_request() might not find the pinctrl
mapping and could bypass the pinctrl back-end synchronization.

Additionally, if gpiochip_add_pin_range() fails, returning an error here
would unregister the already-exposed gpiochip, potentially leaving
consumers with dangling handles.

Would it be better to implement the .add_pin_ranges callback in
struct gpio_chip so that gpiolib can safely and atomically establish the
pin ranges under its own internal locks during registration?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add pin range\n");
> +
> +	platform_set_drvdata(pdev, mpc);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518100054.3552=
143-1-o.rempel@pengutronix.de?part=3D4

