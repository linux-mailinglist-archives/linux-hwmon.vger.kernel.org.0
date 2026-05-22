Return-Path: <linux-hwmon+bounces-14425-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGNTMxgkEGqsUAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14425-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 11:38:32 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB25B1524
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 11:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DF14307008C
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 09:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264D83C4B60;
	Fri, 22 May 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akejbH0K"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF96362153;
	Fri, 22 May 2026 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441895; cv=none; b=YElFW3N/q5vsttp25V/KS+6cpaJDOz2HiHYCS8Uq/hD/y0iO7VHhEer6g4NZbItObsNYw/pEKJd/EjONsE76zz0KZX5KGrPpl/NNlM7M7vIO8rTwiJAsB5euEik4S8px6LfMeJyYQ/UMRC6GSeM+iJF5sr3BJtytUriuj8goS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441895; c=relaxed/simple;
	bh=GLmIHREC5Dq+6M1YcXCln4a9f7hLA0XBNNOCd7+TsA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=opWeL19kQ8+3McYnxs7CSF35kGlbIlKuvNk9wm8bZuMd/3Ezg+yfXLFD5OAFeO+mJTMn01/KsXSoLMGk3ilDJzJDOyxptk78FvFgFxiuAh/uKlvDgBxwCfgVO0var3E6lJs6ZWT25Op58X5ySViLk2hhED61I0k3cvwM7l8dYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akejbH0K; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7927B1F00A3F;
	Fri, 22 May 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779441893;
	bh=nohLK0VMBgP7+6fSfYtReDo1NflPHBuIg76Lw1XUEdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=akejbH0KCDwl3fZQBvDFDv4N2jwuTUjaYScWMlaSHE4OYrQSTeptkTI1ezOw65X8O
	 9pbgOIvuDPk1ry66FRGW/CiVSAQIQakO/jJ69kR7+2WY4N9iIemdQpX6GkqJRODJTH
	 AzAb+9OvMDhb+ZlWyPpspJFeLMr9KKcpOZ5ETPQtwMgKQR+NcRK/YhtBhmqPKCJmZj
	 Mt3Et5uqgZmkLn/rFRV2nj6KBix0Z9SngK97HAlIMbVWQrn31He7dAD4cKdXmyTpRa
	 FfYG6SHxGOLhawB70KSRfRmmi57CVJJIhPY2RjIijLTFImwXFR4pRF9zMHSzbzQL/V
	 qbUaog+rZurow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260522082349.2749970-4-sbogdanov@baylibre.com>
References: <20260522082349.2749970-4-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 09:24:52 +0000
Message-Id: <20260522092453.7927B1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14425-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: CFBB25B1524
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The driver incorrectly uses `i2c_get_clientdata()` to retrieve=
 the `pmbus_driver_info` pointer, resulting in a type mismatch and out-of-b=
ounds memory access.
--

commit 11131ea034ce953233470df60e4f6a1c34cca609
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling

Rework the existing implementation of direct format conversion for TPS25990
non-standard parameters to improve code reusability. It introduces structur=
es
for per-device coefficients and uses generic PMBus conversion helpers.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 05c6288ecafcc..1e252844217b8 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c

[ ... ]

> @@ -36,17 +36,63 @@
>  #define  TPS25990_UNLOCKED		BIT(7)
> =20
>  #define TPS25990_8B_SHIFT		2

[ ... ]

> +struct tps25990_data {
> +	struct pmbus_driver_info info;
> +	struct tps25990_local_direct_value info_local;
> +};
> +
> +static s64 tps25990_reg2data_direct(struct i2c_client *client, int param=
, s32 raw)
> +{
> +	struct pmbus_driver_info *info =3D i2c_get_clientdata(client);
> +	struct tps25990_data *data =3D container_of(info, struct tps25990_data,=
 info);

[Severity: Critical]
Does this code correctly retrieve the pmbus_driver_info pointer?

In pmbus_core.c, pmbus_do_probe() sets the I2C client data to a newly
allocated struct pmbus_data object, not struct pmbus_driver_info.

Because info is the first member of struct tps25990_data, container_of()
evaluates to the same pointer, causing the driver to mistakenly interpret t=
he
pmbus_data object as a tps25990_data object.

When accessing the info_local member, it reads from an offset, yielding gar=
bage
values for the calculation constants m, b, and R. If the garbage m value
happens to be zero, reading sensors via sysfs could cause a divide-by-zero
kernel panic in pmbus_reg2data_direct_calc().

Should this use pmbus_get_driver_info(client) instead of i2c_get_clientdata=
()?

> +	struct tps25990_local_direct_value *info_local =3D &data->info_local;
> +	s64 b, val;
> +	s32 m, R;
> +
> +	val =3D (s16)raw;
> +	m =3D info_local->m[param];
> +	b =3D info_local->b[param];
> +	R =3D info_local->R[param];
> +
> +	return pmbus_reg2data_direct_calc(val, b, m, R);
> +}
> +
> +static u16 tps25990_data2reg_direct(struct i2c_client *client, int param=
, s64 val)
> +{
> +	struct pmbus_driver_info *info =3D i2c_get_clientdata(client);
> +	struct tps25990_data *data =3D container_of(info, struct tps25990_data,=
 info);

[Severity: Critical]
Does this face the same type mismatch regression?

Since the I2C client data points to a struct pmbus_data, using
i2c_get_clientdata() here will also misinterpret the object and result in
out-of-bounds memory access when reading info_local.

Could this be updated to use pmbus_get_driver_info(client) as well?

> +	struct tps25990_local_direct_value *info_local =3D &data->info_local;
> +	s32 m, R;
> +	s64 b;
> +
> +	m =3D info_local->m[param];
> +	b =3D info_local->b[param];
> +	R =3D info_local->R[param];
> +
> +	return pmbus_data2reg_direct_calc(val, b, m, R);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522082349.2749=
970-1-sbogdanov@baylibre.com?part=3D3

