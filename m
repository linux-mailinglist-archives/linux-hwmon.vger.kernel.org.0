Return-Path: <linux-hwmon+bounces-14417-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCYnIlwMEGpqSwYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14417-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 09:57:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53E05B046D
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 09:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D52AC305F08E
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 07:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6843538B7B4;
	Fri, 22 May 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9YUkIFT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45751346E7D
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436225; cv=none; b=ITLDdgHhJOXYcSNws7rP45gOCOFY+VMmMb9O+riEiZUmlJZ9SEPBmrzmFk2rMCzdZw7yEfNRF4mmUyg59XcfhTvHZD5pI1gxct1we0P0Z1NElyWn4K0ARZMkowegZAQHxUomNF82ZHjjWWodsO2fdcrIfnU3Va1bFlj1uucl7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436225; c=relaxed/simple;
	bh=r/fcixIaBsfrDHNDsCp6AjtRLp/QTDIDrugJUQAEfzo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VoD27Ia7/kh4jVwjjvHnlCfCdJUNjrPfsY129xU+9n5b4bDiqrEPDfx37wng8cjJku0Nkqn84Mj6rZPabs5NU+9ty4QbBzqT9PfNWFukyFa2dFfV8UsHZ9gp42vM0dg23lew4t7de3WLSaDNYW9wr6xPzoUpzREbbTElrxSYaYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9YUkIFT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D222E1F000E9;
	Fri, 22 May 2026 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779436224;
	bh=X1+1JJlV2Ftt3ckgGeSXDUyJgs3C0+9C6FkEsDpDmng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c9YUkIFTh7WQzwyTC+/YFKSEFdaAIbafRQwb+m5nhQgfkS3qCkFLK9Q3Xy2f/rcEI
	 6NjouF6QCrxOhkVotJ102n0l6wU8b3T8svFTaR5RXFqwSiJQEqqfBdRyxumUw+tvb7
	 iQqLcChJh2IdWNUI/lBZuGKRHJVEQTLz17MpLm8cM4Clwbb3usPRWhM4Ptz2V38O3n
	 s6/8CAnX9wyIYxO0gbMmk0O88aRcEQCCYiw8Aa7qUMVNjB1x4t4E9DnRzcWhJuY8+q
	 pPdqTOhQf5GWYeJfJYHcO0JcgbzVD056ORmDcEa1GgirMq/ELvdN674IQJR/zuyChM
	 Nf6ZOnrYP8e5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: ina238: use microseconds for update_interval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260522-hwmon-ina238-add-samples-update-interval-v1-2-e1acfceb447e@advastore.com>
References: <20260522-hwmon-ina238-add-samples-update-interval-v1-2-e1acfceb447e@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 07:50:23 +0000
Message-Id: <20260522075023.D222E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14417-lists,linux-hwmon=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-hwmon,ferdinand.schwenk.advastore.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E53E05B046D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Changing the unit of the `update_interval` sysfs attribute fro=
m milliseconds to microseconds violates the standard hwmon sysfs ABI.
--

commit f2472e232de816df3e93f686ee0c5f31ec06d663
Author: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

hwmon: ina238: use microseconds for update_interval

This commit changes the unit of the update_interval sysfs attribute for the
INA238 hardware monitoring driver. It modifies the driver to accept and
report values in microseconds instead of milliseconds, aiming to allow users
to configure conversion times with higher precision.

> diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
> index 7bc18e5445b27..db0c0b5344d6b 100644
> --- a/drivers/hwmon/ina238.c
> +++ b/drivers/hwmon/ina238.c
[ ... ]
> @@ -327,8 +330,8 @@ static int ina238_read_chip(struct device *dev, u32 a=
ttr, long *val)
>  					  INA238_ADC_CONFIG_AVG_SHIFT];
>  		return 0;
>  	case hwmon_chip_update_interval:
> -		/* Return in msec */
> -		*val =3D DIV_ROUND_CLOSEST(ina238_reg_to_interval_us(data), 1000);
> +		/* Return in usec */
> +		*val =3D ina238_reg_to_interval_us(data);

[Severity: Critical]
Does this change break standard hwmon sysfs ABI compatibility?

The hwmon subsystem defines the update_interval sysfs attribute unit strict=
ly
as milliseconds. By exporting and expecting microseconds here, it appears
this would break userspace tools like libsensors that rely on the standard
hwmon ABI. For instance, a userspace tool writing 50 to request 50ms will
now incorrectly configure 50us.

>  		return 0;
>  	default:
>  		return -EOPNOTSUPP;
[ ... ]
> @@ -353,7 +356,7 @@ static int ina238_write_chip(struct device *dev, u32 =
attr, long val)
>  		data->adc_config =3D adc_config;
>  		return 0;
>  	case hwmon_chip_update_interval:
> -		val =3D ina238_interval_ms_to_conv_time(val);
> +		val =3D ina238_interval_us_to_conv_time(val);
>  		idx =3D find_closest(val, data->config->conv_time,
>  				   ARRAY_SIZE(ina238_conv_time));
>  		adc_config =3D (data->adc_config &

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-hwmon-ina2=
38-add-samples-update-interval-v1-0-e1acfceb447e@advastore.com?part=3D2

