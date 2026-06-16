Return-Path: <linux-hwmon+bounces-15150-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hD1EEj8kMWoUcgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15150-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:23:59 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FEB68E32A
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:23:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WvFwrHkz;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15150-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15150-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04EDE3153626
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 10:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6E7428828;
	Tue, 16 Jun 2026 10:14:04 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A02429831;
	Tue, 16 Jun 2026 10:14:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604844; cv=none; b=Q6XIi0gofNlRdwxvpQiLwGcmv5T4nCEeRLMSIWUfa0Aopy2GoMbPa7eyCgEkbRtNlWOzqDIdJJVvRhPVygSsdysUUCt/utp9thS9Ci3VokgbtgOUzimWHtY0x1HV2S/2RckZ6D+LihPqATth23aE1YZ6/Pc6MRfzG1CPte+w1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604844; c=relaxed/simple;
	bh=CkQkf/98/u+xk10cclKmFBg9buW6Zc7qAb+ABsgu6lo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tnFahTZon4/hy1W4luHzCI1SFxQteQ1LZsylO+NEtMNauKmuNmWa+WD3YFn3Mlsfot7zZ+rr8FuNe769+u5UEdnzIkM9nJabmKQ2zFB4HX9GZkPJKoKJhn+f7e64FVYnRsgT5xnnv2hV2GFYJPIhhTieRnyV4eSjR3QyzAp4p9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvFwrHkz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6591F000E9;
	Tue, 16 Jun 2026 10:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604842;
	bh=IWL9O+mOnqNE+zk47q2aUvYc4Z4XdhpD7ad9rAgRuqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WvFwrHkzniFXBlCfpb6r9vahieCEq2yoWhTTLr/xYKzb/GaeX84QgiPBya+CKMo2n
	 y1UnI8NSjbA3N84TuckXZj2McDMmjEtCmuD26kB82PfCVp+lHLbO3uUmzeoHkks3RA
	 +Sb/Sn4bWmlCLFglWYXLOL32N1iGjJRESPEFEPLUxn8c04wQ66x1/FRRwXAqKwS7xI
	 QEfO7GS/8Zis2y1Bun+GfFqFU2hdQXZwmxRYZuFC7+zHWPjb0lZ68z8rCKxvhUustF
	 O/auhD42P/+0IrPg4S3/fIeNf/EWtlYuiw9L0H20wgsN7t2jV0PqVh+BDIH4k1ABh0
	 dQIzyZKiAlnOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616095429.3947205-9-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:14:01 +0000
Message-Id: <20260616101401.EB6591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15150-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:devicetree@vger.kernel.org,m:Frank.Li@kernel.org,m:linux-i3c@lists.infradead.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0FEB68E32A

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Type confusion when an ACPI device binds via PRP0001, causing memo=
ry addresses to be cast to hardware quirk flags.
- [High] Double disable of clocks during driver unbind if the device is run=
time suspended.
--

commit 40ac6ebf3eb6f03540ce6b0b57bfd00730536f5d
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add a quirk to skip clock and reset

Some ACPI-enumerated devices like Tegra410 do not have clock and reset
resources exposed via the clk/reset frameworks. Unlike device tree,
ACPI on Arm does not model such provider functions.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 3e510fddf06c5..a2a4b88c20177 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c

[ ... ]

> @@ -1577,18 +1593,33 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
> =20
> -	master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(master->core_clk))
> -		return PTR_ERR(master->core_clk);
> -
> -	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> -	if (IS_ERR(master->pclk))
> -		return PTR_ERR(master->pclk);
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);

[Severity: High]
This is a pre-existing issue, but can this cast cause a type confusion if an
ACPI device uses the PRP0001 HID to bind via OF-style matching?

In that scenario, has_acpi_companion() evaluates to true, but
device_get_match_data() returns a pointer to the OF match data (like struct
dw_i3c_drvdata). Casting this pointer directly to an unsigned long would
interpret the memory address as a quirk bitmask, potentially enabling quirks
randomly depending on the kernel's memory layout.

> +	} else if (pdev->dev.of_node) {
> +		drvdata =3D device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks =3D drvdata->flags;
> +	}
> +	master->quirks =3D quirks;
> =20
> -	master->core_rst =3D devm_reset_control_get_optional_exclusive_deassert=
ed(&pdev->dev,
> -										"core_rst");
> -	if (IS_ERR(master->core_rst))
> -		return PTR_ERR(master->core_rst);
> +	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
> +		master->core_clk =3D NULL;
> +		master->pclk =3D NULL;
> +		master->core_rst =3D NULL;
> +	} else {
> +		master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);

[Severity: High]
This is a pre-existing issue, but does using devm_clk_get_enabled() risk a
double-disable during driver unbind if the device is runtime suspended?

If the device is in the RPM_SUSPENDED state when dw_i3c_common_remove() run=
s,
the clock has already been disabled by the runtime_suspend callback. Because
the remove function calls pm_runtime_disable() without first waking the
device up via pm_runtime_get_sync(), the subsequent automatic devres cleanup
will call clk_disable_unprepare() a second time on the already disabled clo=
ck.

> +		if (IS_ERR(master->core_clk))
> +			return PTR_ERR(master->core_clk);
> +
> +		master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +		if (IS_ERR(master->pclk))
> +			return PTR_ERR(master->pclk);
> +
> +		master->core_rst =3D devm_reset_control_get_optional_exclusive_deasser=
ted(&pdev->dev,
> +											"core_rst");
> +		if (IS_ERR(master->core_rst))
> +			return PTR_ERR(master->core_rst);
> +	}
> =20
>  	spin_lock_init(&master->xferqueue.lock);
>  	INIT_LIST_HEAD(&master->xferqueue.list);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D8

