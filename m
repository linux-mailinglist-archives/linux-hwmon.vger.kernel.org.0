Return-Path: <linux-hwmon+bounces-15320-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 910OF6lKPGr8mAgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15320-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 23:22:49 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5526C16F8
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 23:22:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BJa43BSR;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15320-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15320-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 545343006965
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 21:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39263E5EE4;
	Wed, 24 Jun 2026 21:22:46 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD881F03DE;
	Wed, 24 Jun 2026 21:22:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336166; cv=none; b=ZSFXyC8hYrAF/3SU9Zn8C6O+iRSOCZq7flrXG4IjyCr4fYIf6sV4a5pil5VYp6a9cTOQMq/2ApVd4/cet2nHvDAHnQeIqvcCYLoyugWmzBQYmMnTOIupzuJALXMpAu6rcWxsTgfFnCAXABMORCiWObkW7SKkkDKKKAfhqM+NsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336166; c=relaxed/simple;
	bh=2trwUiheLX6p0awhWvI+L6+xjrn6HNzlpSLtdWm/6c4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NVkXxck47eTfl5UXDhZ1jxvAr7oynqqveVRknm54MGtQJ5RNzr1FRH966qaVbIrk5xohnFR77NZ7wT6ZPFwf4pJ6JS921ZDqigoQ1GbR+u4mLLqzfOJJjr71jHPP3HKXZ8Xw8jirbyAmWASHyBAfOAyvQ6SHdbkmCZMn5UkcK/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJa43BSR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE54C1F000E9;
	Wed, 24 Jun 2026 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782336165;
	bh=NJQfWBTyLCSPh+GNjSW7FUmrtJqjS4QO3yHL+xGuzH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJa43BSRpaqQGfz6qifpBmlr4arxR8SCq8Ll8pDJgeo5yoc+qRfpmjwf/4mnvDc/z
	 jFbBoZO0K/8vl/YPccGL3wNGWcqfH4jb6tzbRpO+Sah6OUVdWl/kB1jjgh+UC/SIQ0
	 7KzUNtxrXvT/ICOQkNNNZG0Ln1G2sZ3nFmODeF7pHLlIBclTwtEjFTUid89cO+VfZr
	 ju3KpPeo/YU8ggzy/+YQJnJ9glBSCkIgL3QoKJugeoYchkp7+SO7jCsGxYeTMAQyow
	 aEEMvmEK458kavOlEopfzr9whnH3l0HtAfNRmO2ZX1eP9XJo5WC6TYOBIAurjrEgC8
	 dxdDdhIq47mFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:22:44 +0000
Message-Id: <20260624212244.CE54C1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15320-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,qualcomm.com:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: BC5526C16F8

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Direct calls to `t14s_ec_read` bypass the `regmap` mutex, violatin=
g the mandatory 10ms hardware recovery delay between EC commands.
- [Medium] Reading the fan RPM requires two separate I2C transfers for the =
LSB and MSB, allowing the hardware value to update in between and cause tor=
n reads.
- [Low] Passing `int *` arguments to a function expecting `unsigned int *` =
for I2C register reads.

Pre-existing issues:
- [High] The `t14s_ec_read` function passes buffers allocated on the kernel=
 stack to `__i2c_transfer()`, which violates DMA mapping rules and can caus=
e panics.
--

commit d0870f0c919ef26da98287c26fc38bc327dcd76b
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures and fa=
n speed

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5694f..142464623f0e8 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c

[ ... ]

> @@ -555,6 +576,128 @@ static irqreturn_t t14s_ec_irq_handler(int irq, voi=
d *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,

[ ... ]

> +static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct t14s_ec *ec =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr =3D=3D hwmon_temp_input) {
> +			ret =3D t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value=
);

[Severity: High]
Does calling t14s_ec_read() directly here bypass the regmap mutex?

Because the embedded controller requires a 10ms hardware recovery delay bet=
ween
commands, regmap serializes accesses and includes the sleep while holding t=
he
lock. Calling t14s_ec_read() directly appears to bypass this locking, poten=
tially
allowing concurrent sysfs reads to interleave with other subsystem I2C
transfers and violate the hardware constraint.

[Severity: High]
This isn't a bug introduced by this patch, but because this exposes new sys=
fs
attributes that userspace can trigger, does t14s_ec_read() pass stack-alloc=
ated
buffers to __i2c_transfer()?

Looking at t14s_ec_read():

static int t14s_ec_read(void *context, unsigned int reg,
                        unsigned int *val)
{
        ...
        u8 buf[4] =3D {T14S_EC_CMD_ECRD, reg, 0x00, 0x01};
        struct i2c_msg request, response;
        u8 result;
        ...
        request.buf =3D buf;
        ...
        response.buf =3D &result;
        ...
        ret =3D __i2c_transfer(client->adapter, &request, 1);

On ARM64 architectures with CONFIG_VMAP_STACK, passing stack memory to I2C
drivers using DMA (like Qualcomm GENI) can trigger a BUG() panic or corrupt
adjacent physical memory. Is it possible to use heap-allocated buffers here
instead?

> +			if (ret)
> +				return ret;
> +			*val =3D value * 1000;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	case hwmon_fan:
> +		if (attr =3D=3D hwmon_fan_input) {
> +			int lsb, msb;
> +			ret =3D t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);

[Severity: Low]
Does this pass pointers of type int * to t14s_ec_read() which expects
unsigned int *?

Newer compilers like GCC 14 treat -Wincompatible-pointer-types as an
error by default, which might break the build here.

[Severity: Medium]
Is there a risk of torn reads when reading the lsb and msb sequentially?

Because t14s_ec_read() enforces a 10ms sleep after each I2C transfer, there=
 is
a large race window between reading T14S_EC_FAN_RPM_LSB and=20
T14S_EC_FAN_RPM_MSB. If the fan RPM rolls over (e.g., from 0x01ff to 0x0200)
during that window, could we combine an old lsb with a new msb and report
a wildly incorrect fan speed?

> +			if (ret)
> +				return ret;
> +
> +			ret =3D t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
> +			if (ret)
> +				return ret;
> +
> +			*val =3D 0;
> +			*val =3D lsb + (msb << 8);
> +
> +			return 0;
> +		}
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624210825.2644=
54-1-daniel.lezcano@oss.qualcomm.com?part=3D1

