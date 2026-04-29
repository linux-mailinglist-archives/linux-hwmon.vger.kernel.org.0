Return-Path: <linux-hwmon+bounces-13611-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDDhM8Vr8mkMrAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13611-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 22:36:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495649A2EC
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 22:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0566300B9FE
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 20:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A703939AE;
	Wed, 29 Apr 2026 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxr7nY15"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD053932DE
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494836; cv=none; b=WNPWv09Q4Q+ywrBE4p1zAFLVbAv0wTES6Q/m2KCjj6HnwqmkEwqZ1R+vvX760dXL/DvAwd0Entk++wM94hKldb4QMVbYq99TZWIl7WcTXfzc1JalV9lRnyPaTuhISKmDltAeJVOf9epeJyWbn0blCIPFQ6akIgQaiAl3GVD/G4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494836; c=relaxed/simple;
	bh=1uLV1quQVQCCHVGc6An1MXOlyW2JV3m8163fSbQl154=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fVh8Ri2kIH6T6gDJt87VU4pz4nVxD/7b5M+Frs3Lw5wXtJ/gjbBFb5Y3m+++SNA6dHYhKJ8xVlvGaCvbthHf7OBwJLGJKEHp+r6GP4kXLwftt+mIqAJTpSFopdU2womn/47ZM1iZQ7r+sBwdijURJ54+T0uY8W5eBMFXh4Wa0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxr7nY15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94435C19425;
	Wed, 29 Apr 2026 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777494835;
	bh=1uLV1quQVQCCHVGc6An1MXOlyW2JV3m8163fSbQl154=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dxr7nY15bCFFjNxySN8m6KHr3O54tCjg8BYbca+Xd5QVsvZb4K8glM9q4wzwDcA+O
	 QcJahWq5p95vHrLbLEaxErh9TIJyYdlkxuJGoEqKcKpyHbkZ/+KY3EBFqJx/q34s1P
	 aNebIuwMvzIt5z5YdEyDILqV5EyGLK26m1rd70gVKCl4/+nswD0+Vt9YMqnmY3L9I7
	 +6p8rHltD6BMuxGQjrSKNX2RT6OoG0VNO+38w7n5yDVVWNPyYJ//IBo/LNG+zSxiZJ
	 N5tMIX/KB+dvtJZS15OqH9h0cEOTdGvmJUjqufDFHVYC/s5pHQyBEXp9tYXf2dbHSJ
	 zRi7GUIZ8EcXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429-ltc4283-support-v11-3-27ccde619dad@analog.com>
References: <20260429-ltc4283-support-v11-3-27ccde619dad@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 20:33:54 +0000
Message-Id: <20260429203355.94435C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 3495649A2EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13611-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,nuno.sa.analog.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev]

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Unconditional NULL pointer dereference in `ltc4283_init_valid_=
mask`.
- [Medium] Momentary hardware glitch when configuring GPIO as output.
--

commit 7f319a6f25c038e1ae21c4d383a2dec867c1cace
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

This commit adds GPIO support for the LTC4283 Negative Voltage Hot Swap
Controller. It provides a driver for up to 8 configurable pins that can
be used as GPIOs over an auxiliary bus.

> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 000000000000..6609443c5d62
> --- /dev/null
> +++ b/drivers/gpio/gpio-ltc4283.c

[ ... ]

> @@ -0,0 +1,218 @@
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
> +}

Because ltc4283_gpio_direction_set() and __ltc4283_gpio_set_value() map to
separate regmap updates, could this sequence cause a momentary hardware
glitch?

Setting the direction to output before setting the intended value means the
pin might actively drive its previous state for a short time before the
second transaction completes.

Would it be safer to update the output register to the intended value before
enabling the output driver?

[ ... ]

> +static int ltc4283_init_valid_mask(struct gpio_chip *gc, unsigned long *=
valid_mask,
> +				   unsigned int ngpios)
> +{
> +	unsigned long *mask =3D dev_get_platdata(gc->parent);
> +
> +	bitmap_copy(valid_mask, mask, ngpios);
> +	return 0;
> +}

If the parent device is instantiated without platform data, could this
regression lead to a NULL pointer dereference?

If dev_get_platdata() returns NULL, bitmap_copy() will attempt to copy from
a NULL source pointer:

include/linux/bitmap.h:bitmap_copy() {
        ...
        if (small_const_nbits(nbits))
                *dst =3D *src;
        else
                memcpy(dst, src, len);
        ...
}

Should there be a check to ensure mask is not NULL before calling
bitmap_copy()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429-ltc4283-su=
pport-v11-0-27ccde619dad@analog.com?part=3D3

