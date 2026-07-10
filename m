Return-Path: <linux-hwmon+bounces-15769-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RCdPBh3sUGrx8QIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15769-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 14:57:01 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0279873AF7F
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 14:57:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pqrs.dk header.s=key1 header.b=IxtdpbbR;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15769-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15769-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 291CD300C7F2
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 12:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAC24279EE;
	Fri, 10 Jul 2026 12:54:22 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F8240DFC1
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 12:54:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688062; cv=none; b=Zje770Z2UZEBDi6x7arfFRfcj9GWs6V63JIGO/22Y9nlWSxC+4cmaKIuGZgFmVFbp6xNCNnSx0VSPkNdyAgp+aUBJOa+5COW6SbNi2vn6N2reVcZwa+gH2jmbLQdkzIMTc+TZj8r8njReBhdsTTijRlNOP3XqxbaA6UZHoTuTn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688062; c=relaxed/simple;
	bh=6EcN/TZasrXpOc4QnFmZeOhBJDdssaJcwOfFFfx7hJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8J6qW83N9K2ziYfqHXHUZ1+IVJrcx8HZOwAIFCYEdfAsBt85URR3IPq3zehiiOJdZXKOKR+sdIlMgGMWczvIvIEfJioT/sYEsgyxYebKMHeQh0RbtLkjzv8Sa0qEpw1iIE9ittvJEnnHZsVAGdGSnsh7U0BJIppePMkP33fSME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=IxtdpbbR; arc=none smtp.client-ip=95.215.58.177
Date: Fri, 10 Jul 2026 14:53:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1783688046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1nNPIOy+vk1eS1mBs5XE7gdt5FtCACODKoLi7FSYZw=;
	b=IxtdpbbR0TvI9QSjsenyMNxYxm8IVpkuwJX2RJCc4+KDOETBEKnKKGv2Ua3O/3EEz1vH1N
	GD1OVSXLCWQrpzyLxsKpytRN+jXiMdvevNphKXvXZ4V1r+0isppxKGxeLbodYHbdlBbAw4
	kzqsPu5z52rffmlakP6VAdwB+i7c7Ea59XG6xFZ8qLYG1mSSCUi6BgOSqJ4DHqmgD0B02W
	VGJVSblf+0pUnzColAtt0wwNPBZ8wcqhRvHSqWUoUBQRnIJu8gCwMhYsBM98i6QuBcaSiK
	JvxWn8riIAtsDpEMuQwaNUecED1EDYKU3o0nwOuvfh6uoNbrJCZ7Y+nyzUxYnA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Rosin <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH v15 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Message-ID: <alDqEXnZmejphvio@pqrs.dk>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-7-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710101358.2606941-7-o.rempel@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[pqrs.dk:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:o.rempel@pengutronix.de,m:linux@roeck-us.net,m:lee@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peda@axentia.se,m:kernel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:david@protonic.nl,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alvin@pqrs.dk,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15769-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[pqrs.dk];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin@pqrs.dk,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[pqrs.dk:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pqrs.dk:from_mime,pqrs.dk:dkim,pqrs.dk:mid,pengutronix.de:email,analog.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0279873AF7F

On Fri, Jul 10, 2026 at 12:13:55PM +0200, Oleksij Rempel wrote:
> Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
> embedded in the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) devices.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

One small comment below.

[...]

> +static int mc33978_mux_set(struct mux_control *mux, int state)
> +{
> +	struct mux_chip *mux_chip = mux->chip;
> +	struct mc33978_mux_priv *priv = mux_chip_priv(mux_chip);
> +	int ret;
> +
> +	if (state < 0 || state >= MC33978_NUM_AMUX_CH)
> +		return -EINVAL;
> +
> +	ret = regmap_update_bits(priv->map, MC33978_REG_AMUX_CTRL,
> +				 MC33978_AMUX_CTRL_MASK, state);
> +	if (ret)
> +		dev_err(priv->dev, "failed to set AMUX channel %d: %d\n",
> +			state, ret);

Especially for iio, I can imagine a consumer might keep polling even if
the mux .set returns an error. So maybe ratelimit this print?

> +
> +	return ret;
> +}
> +
> +static const struct mux_control_ops mc33978_mux_ops = {
> +	.set = mc33978_mux_set,
> +};

