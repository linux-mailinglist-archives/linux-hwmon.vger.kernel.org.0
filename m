Return-Path: <linux-hwmon+bounces-15901-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j2QMKW1eVmrN4AAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15901-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 18:06:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E362756CAC
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 18:06:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gDA+JE6k;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15901-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15901-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8657F30548D2
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 16:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBF14A3407;
	Tue, 14 Jul 2026 16:05:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A744A340F;
	Tue, 14 Jul 2026 16:05:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045154; cv=none; b=pqfa16hdsiMVl/OYijKcDK5tW1tO7+P3Q6zJYH4dJR7MbS/2JwnPKWhgGOWN7ZAAEarTGJw8VX2Sue7xF5Zz2HYfRB82t5fYNTbMBXTEqGnbXf3zTNbnqqeGn+6FvO9C32KwojmFIyc6gc3D9MPnKbXswrWhFJzMbuLdiE9Iin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045154; c=relaxed/simple;
	bh=bcSXy3a5137gveyBb4tY2BzEaa5MJv+U9JfJuU4f1cE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TFIQpA4gU508Alv9EG/OYfm/F12nhv53NW/YJi8JBKiEz5w44eH/tj3DWaCgdKHdARwc5f36uM4aTfhUcFcmJ/y9wrUaKNFyyid97Wokbi4KLECQEUrCtUJoyZG1jFU72tIffusL/+DiY8cdzkvtBJKpb2tVScYBZsTKF/mphCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDA+JE6k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1B91F00A3A;
	Tue, 14 Jul 2026 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784045153;
	bh=bbmLOfvrgHxhc9SFOmHP6PJfVi5yA485zLVifceN9nY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gDA+JE6kacJ+opnNq8hmWqFdcBpn2yE7sV77ZFzOEhlKT2Qt0rqu3yMwGb+N3WnBD
	 FtUDAnuFMApsUDcAQViA/l4X6cpnFXTbH91lVifRg3aKC70EsPwbw40TrYRwezCxFM
	 8fzledjF7xp1enkMtojix6Sy+a1UPhQU5b0e/B9Ynie0EZNFKjrjggGrhgx/fi9umz
	 H6mHeOU05et2nTECxWfuJbX0OEQ7/CvCtzDM3MYmDZAufbgDsTpSL2ch4hpE2qs0Hh
	 k/7OLy9SrFdbY1dqAkJMaFX4b3CK4hTj542mwVdPsoHNOcrC1zWMCg+G/y7QiczIYs
	 D40CWk+uGJFlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/8] Add Advantech EIO Thermal driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramiro Oliveira" <ramiro.oliveira@advantech.com>
Cc: linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org, mfd@lists.linux.dev, linux-watchdog@vger.kernel.org
In-Reply-To: <20260714-upstream-v2-v2-7-76e5e41026db@advantech.com>
References: <20260714-upstream-v2-v2-0-76e5e41026db@advantech.com>
 <20260714-upstream-v2-v2-7-76e5e41026db@advantech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 16:05:52 +0000
Message-Id: <20260714160552.DC1B91F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15901-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,advantech.com:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ramiro.oliveira@advantech.com,m:linux-hwmon@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:lee@kernel.org,m:mfd@lists.linux.dev,m:linux-watchdog@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E362756CAC

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The driver registers thermal zones in a loop but fails to unregist=
er them on probe failure and completely lacks a `.remove` callback.
- [High] The `.set_trip_temp` callback incorrectly uses the abstract trip I=
D as a control register address, overwriting critical read-only state regis=
ters.
- [Medium] Multi-byte variable addresses (`int`, `enum`) are passed directl=
y to hardware access functions which read bytes in host memory order, break=
ing on big-endian architectures.
- [Low] The child driver communicates with the parent using a bespoke inter=
-driver function instead of utilizing standard MFD mechanisms.
- [Low] Error codes from `pmc_write` are masked during the trip iteration i=
n `eio_tz_change_mode`.
--

--- Patch [7]: [PATCH v2 7/8] Add Advantech EIO Thermal driver ---
commit 001e79fa1d8c0bd96fb7bffbb91c6090c53b08a4
Author: Ramiro Oliveira <ramiro.oliveira@advantech.com>

Add Advantech EIO Thermal driver

This commit adds the driver to control the Advantech EIO Thermal block,
this block is included in the Advantech EIO Embedded Controller.

> diff --git a/drivers/thermal/eio_thermal.c b/drivers/thermal/eio_thermal.c
> index 0000000000000..ad923acaf1389 100644
> --- /dev/null
> +++ b/drivers/thermal/eio_thermal.c
[ ... ]
> +static int pmc_write(struct device *mfd, u8 ctrl, u8 dev_id, void *data)
> +{
> +	if (ctrl >=3D ARRAY_SIZE(pmc_len))
> +		return -EINVAL;
> +
> +	struct pmc_op op =3D {
> +		.cmd       =3D CMD_THERM_WRITE,
> +		.control   =3D ctrl,
> +		.device_id =3D dev_id,
> +		.payload   =3D (u8 *)data,
> +		.size      =3D pmc_len[ctrl],
> +	};
> +
> +	return eio_core_pmc_operation(mfd, &op);

[Severity: Low]
This isn't a bug, but does calling a bespoke helper function exported by
the parent MFD driver conflict with the MFD subsystem guidelines? The MFD
documentation suggests child drivers should use standard APIs and avoid
custom accessors or helper functions in the parent to pass state.

> +}
[ ... ]
> +static int eio_tz_set_trip_temp(struct thermal_zone_device *tzd,
> +				const struct thermal_trip *trip, int temp)
> +{
> +	struct eio_thermal_dev *eio_thermal =3D thermal_zone_device_priv(tzd);
> +	const u8 ctl =3D (uintptr_t)trip->priv;
> +	u16 val;
> +
> +	if (temp < 1000)
> +		return -EINVAL;
> +
> +	val =3D MILLI_CELSIUS_TO_DECI_KELVIN(temp);
> +	return pmc_write(eio_thermal->mfd, ctl, eio_thermal->ch, &val);

[Severity: High]
Does this write to the wrong register?

During probe, trip->priv is initialized with logical indices like
TRIP_SHUTDOWN (which is 0). Here, the ctl variable is passed directly to
pmc_write() as the control register address. Will this overwrite state
registers like CTRL_STATE (0x00) instead of the limit registers like
CTRL_SHUTDOWN_HI (0x41)?

> +}
> +
> +static int eio_tz_change_mode(struct thermal_zone_device *tzd,
> +			      enum thermal_device_mode mode)
> +{
> +	struct eio_thermal_dev *eio_thermal =3D thermal_zone_device_priv(tzd);
> +	int trip;
> +	int ret =3D 0;
> +
> +	for (trip =3D 0; trip < TRIP_NUM; trip++) {
> +		ret =3D pmc_write(eio_thermal->mfd, ctrl_map[trip], eio_thermal->ch, &=
mode);

[Severity: Medium]
Will this fail to set the mode correctly on big-endian architectures?

The mode variable is an enum (typically 4 bytes), but it's passed as a byte
array payload to pmc_write(). Because pmc_write() only copies 1 or 2 bytes,
won't it read the most significant bytes (usually zeros) on big-endian
systems?

[Severity: Low]
Could an early error in this loop be masked? If pmc_write() fails on the
first iteration but succeeds on the next, ret will be overwritten with 0,
hiding the failure from the caller.

> +		if (ret)
> +			dev_err(eio_thermal->dev, "Error when %s trip num %d\n",
> +				mode =3D=3D THERMAL_DEVICE_ENABLED ? "enabling" : "disabling",
> +				trip);
> +	}
> +
> +	return ret;
> +}
[ ... ]
> +static int eio_thermal_probe(struct platform_device *pdev)
> +{
[ ... ]
> +		/* Throttle starts a 1C increase it */
> +		int throttle_temp =3D MILLI_CELSIUS_TO_DECI_KELVIN(60000);
> +
> +		pmc_write(dev->parent, CTRL_THROTTLE_HI, (u8)ch, &throttle_temp);

[Severity: Medium]
Does this have the same big-endian issue as eio_tz_change_mode()?

The throttle_temp variable is a 32-bit int, and taking its address for a
1 or 2 byte payload write in pmc_write() might read the zeroed upper bytes
on big-endian systems.

[ ... ]
> +		tzd =3D thermal_zone_device_register_with_trips(therm_name[name],
> +							      trips,
> +							      ntrips,
> +							      eio_th,
> +							      &zone_ops,
> +							      &zone_params,
> +							      THERMAL_PASSIVE_DELAY,
> +							      THERMAL_POLLING_DELAY);
> +		if (IS_ERR(tzd))
> +			return PTR_ERR(tzd);

[Severity: High]
Does this path leak resources if a failure occurs after some zones have been
successfully registered?

If the loop successfully registers a thermal zone on ch=3D0 but fails on ch=
=3D1,
it returns immediately without unregistering the thermal zone created for
ch=3D0.

> +		/* Make sure zones start disabled */
> +		thermal_zone_device_disable(tzd);
> +
> +		dev_info(dev, "%s thermal up (ch=3D%d)\n", therm_name[name], ch);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver eio_thermal_driver =3D {
> +	.probe  =3D eio_thermal_probe,
> +	.driver =3D {
> +		.name =3D "eio_thermal",
> +	},
> +};

[Severity: High]
Are there use-after-free and resource leak bugs when this driver is unbound?

Because there is no .remove callback in the platform driver, unbinding it v=
ia
sysfs will leave the registered thermal zones active in the thermal core
while devres frees the eio_th private data. Could this lead to a
use-after-free when the core polls the zones?

> +module_platform_driver(eio_thermal_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-upstream-v=
2-v2-0-76e5e41026db@advantech.com?part=3D7

