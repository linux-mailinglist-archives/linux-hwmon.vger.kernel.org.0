Return-Path: <linux-hwmon+bounces-15787-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WRaKCuK8UWqRIAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15787-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 05:47:46 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E53740378
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 05:47:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FPZBDL+B;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15787-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15787-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11603301FD44
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 03:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59622097;
	Sat, 11 Jul 2026 03:47:43 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A41FD4
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 03:47:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783741663; cv=none; b=Pd7Q1SNt4zyK6GIjNFGIaQx92Zb8FxRkx6Uinf9uBdha1DSiYX1Sl2GWhLBzxVjQ0Zetvsp7vWGrFnjKQMfHh6bC+1WDCGjUEfgkSNPfxbYNiI7enQGLVOrMlhFuHXzs0EY14N79KYBD0PU8fv7JBPU+zpGIko6vZTp/OHAqwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783741663; c=relaxed/simple;
	bh=WVAyt3D1PG/WIgKT16xBSPyWCF5P+x3XcdtVEXPtJTQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h6fU4jiUFsaSn9C9zExLXuuDfyLvhMch28rSoHhI95A2ryjk7a/YFgWMDycSwyyXep5ZjZc6P+ISJYVw6AjxHZFpx6l+uiwVi/NmVj2NLwo82f0dSQDnAxXHhJ4/YN8Mx6RaOfPFmAOBYYWKoPq+PO/fxHEUlY/CuiWMT7NQxfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPZBDL+B; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1081F000E9;
	Sat, 11 Jul 2026 03:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783741661;
	bh=x0fPZAnXHaJCEfCwSLO16PLkUrdeeSOjuyxfINkFCgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FPZBDL+Bg1ybfwnB3lyHjZhJTHrPYeEvbA67qFg1WhPDTQBfDq/vFczncPoTpOl99
	 RG7u/8qS3Nth8OMtsSyybbiy05uFVo60PZSDkMbM/pmjjlhT0WKkl2d/yrp8s1xPIW
	 1bVs+mNhec6+GQJcLHzK7T9K4SmF94cQbaMZxO+eW5nCWi8Y/LOwhmh9IBmfcvo/rx
	 aqpw5DDOLCLccqiudv7PljPyohUAfD5YyIRyA+XNSRx71AiWgI0ey0uOk2CedJ16yb
	 BUiZxozJG2t3B/u7DPupWGeOrWCS8lwmyFABByxNJRaPtjjQotLFrIoH0LWX8IujnS
	 Y/6JyaVPRk/4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711033700.3693-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711033700.3693-1-fourdollars@debian.org>
 <20260711033700.3693-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 03:47:41 +0000
Message-Id: <20260711034741.7A1081F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15787-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fourdollars@debian.org,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60E53740378

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Writing to `hwmon_pwm_enable` causes an immediate deadlock due to =
recursive acquisition of `smcreg.mutex`.
- [Low] The fallback string for fan labels is incorrectly truncated when re=
ad from sysfs due to an unconditional pointer offset.
--

--- Patch [1]: [PATCH v2 1/1] hwmon: (applesmc) Convert to hwmon_device_reg=
ister_with_info ---
commit 319a71a13f69cd2d1c53e88a04e2585bea47d8ab
Author: Shih-Yuan Lee <fourdollars@debian.org>

hwmon: (applesmc) Convert to hwmon_device_register_with_info

This patch converts the deprecated hwmon_device_register() function to the
modern hwmon_device_register_with_info() API. It moves the registration of
standard sensor attributes to the HWMON core and dynamically registers
non-standard ones.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 90a14a7f2c4c0..3470912649c4d 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -597,6 +598,16 @@ static int applesmc_init_smcreg_try(void)
>  	if (s->fan_count > 10)
>  		s->fan_count =3D 10;
> =20
> +	for (i =3D 0; i < s->fan_count; i++) {
> +		char newkey[5];
> +
> +		scnprintf(newkey, sizeof(newkey), FAN_ID_FMT, i);
> +		ret =3D applesmc_read_key(newkey, s->fan_positions[i], 16);
> +		s->fan_positions[i][16] =3D 0;
> +		if (ret)
> +			scnprintf(s->fan_positions[i], 17, "Fan %d", i);
> +	}
> +

[ ... ]

> +static int applesmc_hwmon_write(struct device *dev, enum hwmon_sensor_ty=
pes type,
> +				u32 attr, int channel, long val)
> +{
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:

[ ... ]

> +		break;
> +	case hwmon_pwm:
> +		if (attr =3D=3D hwmon_pwm_enable) {
> +			u8 buffer[2];
> +			u16 manual_val;
> +
> +			if (val !=3D 0 && val !=3D 1)
> +				return -EINVAL;
> +			mutex_lock(&smcreg.mutex);
> +			ret =3D applesmc_read_key(FANS_MANUAL, buffer, 2);

[Severity: High]
Will this cause a deadlock due to recursive mutex acquisition?

The code explicitly acquires smcreg.mutex here, but applesmc_read_key()
and applesmc_write_key() both unconditionally attempt to acquire the same
mutex again through their underlying applesmc_read_entry() and
applesmc_write_entry() calls.

Since this is a standard non-recursive mutex, will this freeze the
calling task when a user writes to hwmon_pwm_enable?

> +			if (ret)
> +				goto out_unlock;
> +			manual_val =3D (buffer[0] << 8 | buffer[1]);
> +			if (val)
> +				manual_val |=3D (0x01 << channel);
> +			else
> +				manual_val &=3D ~(0x01 << channel);
> +			buffer[0] =3D (manual_val >> 8) & 0xff;
> +			buffer[1] =3D manual_val & 0xff;
> +			ret =3D applesmc_write_key(FANS_MANUAL, buffer, 2);
> +out_unlock:
> +			mutex_unlock(&smcreg.mutex);
> +			return ret;
> +		}
> +		break;

[ ... ]

> +static int applesmc_hwmon_read_string(struct device *dev, enum hwmon_sen=
sor_types type,
> +				      u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr =3D=3D hwmon_temp_label) {
> +			*str =3D smcreg.index[channel];
> +			return 0;
> +		}
> +		break;
> +	case hwmon_fan:
> +		if (attr =3D=3D hwmon_fan_label) {
> +			*str =3D smcreg.fan_positions[channel] + 4;

[Severity: Low]
Will this unconditionally truncate the fallback string generated during ini=
t?

If applesmc_read_key() fails in applesmc_init_smcreg_try(), the driver
generates a fallback string formatted as "Fan %d".

When this sysfs attribute is read, the + 4 pointer arithmetic will skip
the "Fan " prefix and only expose the digit to userspace (e.g., exposing
"0" instead of "Fan 0").

> +			return 0;
> +		}
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711033700.3693=
-2-fourdollars@debian.org?part=3D1

