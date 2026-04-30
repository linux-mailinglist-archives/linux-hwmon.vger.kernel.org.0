Return-Path: <linux-hwmon+bounces-13634-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI9XNk0w82m0yAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13634-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 12:34:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8374A0E45
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 12:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 333E9300C991
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 10:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05676389473;
	Thu, 30 Apr 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPOSPa3l"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66E937FF5B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545289; cv=none; b=XqPiO+SwnO5wX/WKAa9CqLFF1BzpdpVvMkSlG3+W5abK7UrHmHbZA/rnMbrrUouxw5ZjCGys5tip1nTTORBMOdMrVTRswGfk+U6Olp2Jinw+dMHoMH1aUAZAI8jTXz1BzIz+wIjt3UlfpzjBRKfTx8gK/JA+0YkRXjVSeUulQ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545289; c=relaxed/simple;
	bh=Le27chp0Kggv5wS0Ik6WsnSqQmRN5qnAVdWA1q64Vis=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PTKTYSNpvxWCfQ1n2PfuPFyAWw1Gk6ehdQeHwcpONbMCT70kpzokReJ8GV0W7Q/raYl3gvDcDweOR33bLMQy2+1b68ZbKVyM3CjAmLx4L9eWnaZDIQdRH0UWhmhJzJQzgIlzLOVpPZuaPLg3BT35EaYNgrE6RRDhPfg6UtV6u3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPOSPa3l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F2BC2BCB3;
	Thu, 30 Apr 2026 10:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777545289;
	bh=Le27chp0Kggv5wS0Ik6WsnSqQmRN5qnAVdWA1q64Vis=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vPOSPa3ldpWAvjVxFw6jNSVBQ/2FRHNdnMCHLOIwAol4gbGgHLEYyzDgn0XqeCayY
	 TmTCOXAKJ5KpQV411YmSOitxuutWbxgtXTQEgc0bijn4L9Ygb+gFJ7T6FMQYkTcBkg
	 vAqWlFJFIxIs2m6+7l3xTJE1aHah1FDvuBDjFVb8pS97IhvDA+f8KcG9yjhe3HZkE3
	 80IJ5c72VKCTX2dvF42rmMEhdjUI5WKxsmU0QpVgq3yMXTlhP1DiAZSh+6Tfcz0EK1
	 KT6ULTHH7S3heSq4t9KXL8RQ4EeWDubZoprTxZXeI0fltsCMfoMgG5Dl0LDLPHvn6F
	 KfIGAYB4dqPLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430-ltc4283-support-v12-3-5dc9901f2567@analog.com>
References: <20260430-ltc4283-support-v12-3-5dc9901f2567@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 10:34:48 +0000
Message-Id: <20260430103449.71F2BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 4F8374A0E45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13634-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,nuno.sa.analog.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,analog.com:email,lists.linux.dev:replyto,smtp.kernel.org:mid]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware glitch due to setting GPIO direction to output before s=
etting the output value.
--

commit 50e4fcc0438eacaeeb8d0e7b85d04586253d71c0
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

This commit adds GPIO support for the LTC4283 device. It registers an auxil=
iary
driver and a gpio_chip for up to 8 pins that can be configured as GPIOs.

[ ... ]

> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 0000000000000..6609443c5d62c
> --- /dev/null
> +++ b/drivers/gpio/gpio-ltc4283.c

[ ... ]

> +static int ltc4283_gpio_direction_output(struct gpio_chip *gc, unsigned =
int off, int val)
> +{
> +	struct ltc4283_gpio *st =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D ltc4283_gpio_direction_set(st, off, false);
> +	if (ret)
> +		return ret;
> +
> +	return __ltc4283_gpio_set_value(st, off, val);

Does this sequence cause a hardware glitch on the GPIO line?

By calling ltc4283_gpio_direction_set() before __ltc4283_gpio_set_value(),
the pin is configured as an output while holding whatever residual logic
level was previously stored in the output value register.

If the residual value differs from the requested val, the hardware might
momentarily drive the pin with an unintended electrical state.

Should the driver write the intended output value first, and then configure
the pin as an output?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430-ltc4283-su=
pport-v12-0-5dc9901f2567@analog.com?part=3D3

