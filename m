Return-Path: <linux-hwmon+bounces-15308-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VeYDD0a1O2qTbggAu9opvQ
	(envelope-from <linux-hwmon+bounces-15308-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:45:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854E6BD78F
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F2xH55t3;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15308-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15308-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F722302A1AE
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2402D3727;
	Wed, 24 Jun 2026 10:45:19 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06112DC79A;
	Wed, 24 Jun 2026 10:45:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297919; cv=none; b=FUGErgt84ZIxfT7vHSzBsl7guuSgEUXSRxgO6gN06hhSI1DAhR2NAx4ttLur7n15r0BuG97llY6kUgiUbV1Kfm4AI3ouq7SKECOiUMCm6w9dqy2huFALGzD5xXCYPeFNmaAy9aZXg8x+zpRgIoSrMwyIfY4FaklfGP4YiMUqQyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297919; c=relaxed/simple;
	bh=G1tVP3Q0mfNHODWgvs+xQ3MvD26uccJXVWxkCd+IlyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K+rvCPNfWvTkv0RNyrs5+iInZ75bqPI5/mI68h/yNhPq46/zALmEgKl+eZdPewjPnTs4mhK74v+6FdVSsZa5scr1+JVgRXmhMgXH4FBmH2ZrS3l1+ocVakRkvnuaI40zuu1WjGB20nZRKF0FxFejieNTO781WO+dyuBhgZyKuLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2xH55t3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDA41F00A3D;
	Wed, 24 Jun 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297917;
	bh=16UUvhPcdf75gFkTxBVtAW1KWMj7bxFajreMUHfHwPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F2xH55t3Gf++FnT7+5apbeIg3jy/dN33O6wVnwNfCmBPKOzphFxyhArxEW+fpbFOD
	 IUKYKH1xBem3fCZ6Wyv8/CJTZtX+7maE7mRAMZ3YfMTJ7JX2Xples1czRoY73zaZYw
	 6ZLizvZFNrWfzRM4Ag1ynJInr3rndWAlQr+cIZg/vRnvBicjm89EHQa57dK2SS8yCq
	 X7AFjP0YlVAoqd9X1rIZX2giLKcLO6o54T2/WCCwBYLoO+EFRyOzff/rmysAqwbq/e
	 59WSTBt2Heji6ds6wzf4h8LWb1ydkJlJS9xq9zp9fH1woUXe1VUk8glxDeHOLtPJ97
	 lVrTHtKAP0Ybg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/12] i3c: dw-i3c-master: Add ACPI core clock
 frequency quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624102153.1770072-9-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-9-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:45:16 +0000
Message-Id: <20260624104517.4BDA41F00A3D@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15308-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:robh@kernel.org,m:Frank.Li@kernel.org,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9854E6BD78F

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Changing `core_clk` from mandatory to optional delays missing cloc=
k validation, leading to unclocked hardware register accesses that can trig=
ger a synchronous external abort (system crash) on misconfigured platforms.

Pre-existing issues:
- [High] The workqueue `master->wq` is destroyed during unregistration, but=
 the devres-managed hardware IRQ remains active without being masked, allow=
ing a late interrupt to queue work on the destroyed workqueue.
- [High] The driver unconditionally casts the pointer returned by `device_g=
et_match_data()` to an `unsigned long` when binding an ACPI companion, lead=
ing to garbage quirk flags if the device is bound via the PRP0001 ACPI-OF f=
allback.
--

commit d5fbc1910ed540d2be9a4cb57886399f9c4f9b04
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add ACPI core clock frequency quirk

Some ACPI-enumerated devices like Tegra410 do not expose the controller
core clock through the clk framework. Unlike device tree, ACPI on Arm does
not model clock providers. The hardware is expected to have its clocks
enabled by firmware before the OS takes over.

Make the core clock optional and allow selected ACPI devices to provide the
core clock rate through the "clock-frequency" _DSD property when the core
clock is absent.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index 29030fd9594aa..8e40d178d500a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c

[ ... ]

> @@ -1577,7 +1598,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *maste=
r,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
> =20
> -	master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> +	master->core_clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);

[Severity: High]
If the device tree is missing the core clock, this will now return NULL
instead of an error. Could this lead to unclocked MMIO accesses?

In dw_i3c_common_probe():

    master->core_clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);
    ...
    writel(INTR_ALL, master->regs + INTR_STATUS);

If the clock is missing, the MMIO access to INTR_STATUS will happen
unconditionally, which can trigger a synchronous external abort on some
systems.

The missing clock is checked later in dw_i3c_master_get_core_rate():

    if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
        dev_err(master->dev, "missing core clock\n");
        return 0;
    }

Is it possible to validate the missing clock earlier to prevent the kernel
panic during the probe sequence?

>  	if (IS_ERR(master->core_clk))
>  		return PTR_ERR(master->core_clk);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but does the removal path
destroy the workqueue while hardware interrupts are still active?

In drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_remove():

    i3c_master_unregister(&master->base);

This unregisters the device and eventually triggers:

drivers/i3c/master.c:i3c_masterdev_release():
    if (master->wq)
        destroy_workqueue(master->wq);

Since INTR_STATUS_EN is never cleared to mask interrupts and the devres
managed IRQ is not yet freed, could a delayed IBI or Hot-Join interrupt
still fire?

If it does, the still-active IRQ handler will attempt to queue work on
the destroyed workqueue:

drivers/i3c/master/dw-i3c-master.c:dw_i3c_master_irq_handle_ibis():
    } else if (IBI_TYPE_HJ(reg)) {
        i3c_master_queue_hotjoin(&master->base);
    }

Can this result in a use-after-free?

[Severity: High]
This is a pre-existing issue, but does this unconditionally cast the match
data pointer to an integer?

In drivers/i3c/master/dw-i3c-master.c:dw_i3c_common_probe():

    if (has_acpi_companion(&pdev->dev)) {
        quirks =3D (unsigned long)device_get_match_data(&pdev->dev);
    } else if (pdev->dev.of_node) {
        drvdata =3D device_get_match_data(&pdev->dev);
        if (drvdata)
            quirks =3D drvdata->flags;
    }

If the device uses the PRP0001 ACPI-OF fallback, has_acpi_companion() will
be true, and device_get_match_data() will return a pointer to the OF table
struct dw_i3c_drvdata.

Does this cast the pointer address directly into the quirks bitmask, causing
unpredictable feature toggles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D8

