Return-Path: <linux-hwmon+bounces-13517-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OSR8K+W26mk7CwAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13517-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Apr 2026 02:18:45 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A54588CC
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Apr 2026 02:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81616300A510
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Apr 2026 00:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5708C1A2545;
	Fri, 24 Apr 2026 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7fu9FEl"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2F19C556
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776989921; cv=none; b=SLjQZJvxnqbWUZUJJbCyCa1KXNaTLVquQJL8meaTkMPhUrmBXVcTi9vifFV0u/v9pxsjIqz2Urecn4v+YO4dLQWQEONzUix9s5/7tZERkJ9BR4NCLRb6Po9XcYenisxD14EEA8dR3nXkPSpkalirfqgIXvnyC6ilXMMURqryBaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776989921; c=relaxed/simple;
	bh=BDWVg+xsoZuu3/erQjXdOpjoEuCO9AXelt3tBM+A/44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FSPvcsQTVBy4Eb01qHBURfQCzx7v/ANyDtC7bmHUFw0Qx7B4TeNdIuSzoBtCpLvnQocabv011Lig9QlcLUIW1/X2rtry7x9RLhwsKqQTUfIqrKNBByzFAhlgUWWGGh2us+yXO5GFITzY7XTlMiXIAqlmjljFu9TvbP8BuDjTfn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7fu9FEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE092C2BCAF;
	Fri, 24 Apr 2026 00:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776989920;
	bh=BDWVg+xsoZuu3/erQjXdOpjoEuCO9AXelt3tBM+A/44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=H7fu9FEllSxZpQvNuQAM2LcFraQpz/DZcSHIVBM2LtAMChYfgVMThHmYhaIK4FaI3
	 L9zfdR/brLn/8KU7oG49nFMzrYxZDP1uPFY/2wDra7M2+MQc+H92nRusVi64UsW2jl
	 /8JqWizCZuQG9krz8mnKqVrhBn5iD2VjDJJ/7K9quL69W/cQu1I1TWxDiMQUkfasxi
	 j7mvXH40xFU/NQQ8wtCDRjwnULAV0rBJH3puCZkrhLEHdpGmtG6NBykpzPAXHJUaSc
	 1PW2LylRkunr4Ey7KvF0z9PrwHai/SxreJ0eiSYmdqOodFXsbxf/ocetkXiyAg9bhl
	 jCX7NZ+zXLjKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/13] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-10-akhilrajeev@nvidia.com>
References: <20260423085718.70762-10-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 00:18:40 +0000
Message-Id: <20260424001840.AE092C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: E20A54588CC
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
	TAGGED_FROM(0.00)[bounces-13517-lists,linux-hwmon=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid]

Sashiko AI review found 5 potential issue(s):
- [Critical] The driver fails to disable hardware interrupts before destroy=
ing the workqueue during removal, leading to a potential Use-After-Free.
- [High] The patch alters the initialization order of `pclk` and `core_rst`=
, causing the core reset to be deasserted before the peripheral clock is en=
abled.
- [High] Casting the return value of `device_get_match_data()` to `unsigned=
 long` causes pointer addresses to be interpreted as quirk flags on ACPI PR=
P0001 systems, which can lead to random hardware initialization failures.
- [High] A crafted `clock-frequency` device property can cause an integer o=
verflow leading to a divide-by-zero kernel panic on 32-bit systems.
- [High] Combining `devm_clk_get_enabled()` with Runtime PM clock managemen=
t causes a clock refcount underflow if the device is suspended during drive=
r removal.
--

commit 62e84914f9fc0efd829919bb31559f49b5cb8b00
Author: Akhil R <akhilrajeev@nvidia.com>

i3c: dw-i3c-master: Add a quirk to skip clock and reset

Some ACPI-enumerated devices like Tegra410 do not have clock and reset
resources exposed via the clk/reset frameworks. This patch adds match data
to skip acquiring these controls during probe and reads the core clock rate
from a device property instead.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index edd42daf75539b..b90756ade2db6d 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
[ ... ]
> @@ -556,13 +557,26 @@ static void dw_i3c_master_set_intr_regs(struct dw_i=
3c_master *master)
>  	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
>  }
> =20
> +static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *m=
aster)
> +{
> +	unsigned int core_rate_prop;
> +
> +	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST))
> +		return clk_get_rate(master->core_clk);
> +
> +	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate=
_prop))
> +		return 0;
> +
> +	return core_rate_prop;
> +}

Could reading a large clock-frequency property cause an integer overflow?

If core_rate is read as a very large value from the property (e.g.,=20
3400000000), it seems core_period in dw_i3c_clk_cfg() could evaluate to 0=20
due to the addition in the DIV_ROUND_UP() macro wrapping around on 32-bit=20
systems.=20

Would the subsequent DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) then=20
trigger a divide-by-zero panic?

[ ... ]
> @@ -1580,19 +1594,33 @@ int dw_i3c_common_probe(struct dw_i3c_master *mas=
ter,
>  	if (IS_ERR(master->regs))
>  		return PTR_ERR(master->regs);
> =20
> -	master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
> -	if (IS_ERR(master->core_clk))
> -		return PTR_ERR(master->core_clk);
> +	if (has_acpi_companion(&pdev->dev)) {
> +		quirks =3D (unsigned long)device_get_match_data(&pdev->dev);

Can this pointer cast lead to random hardware initialization failures?

If an ACPI device uses the PRP0001 mechanism, device_get_match_data()
might return a pointer to struct dw_i3c_drvdata instead of an integer.

If the pointer address happens to have BIT(3) set, could the driver
inadvertently skip acquiring core_clk and core_rst, leading to an external
abort when reading hardware registers on an unclocked device?

> +	} else if (pdev->dev.of_node) {
> +		drvdata =3D device_get_match_data(&pdev->dev);
> +		if (drvdata)
> +			quirks =3D drvdata->flags;
> +	}
> +	master->quirks =3D quirks;
> +
> +	if (master->quirks & DW_I3C_ACPI_SKIP_CLK_RST) {
> +		master->core_clk =3D NULL;
> +		master->core_rst =3D NULL;
> +	} else {
> +		master->core_clk =3D devm_clk_get_enabled(&pdev->dev, NULL);

Is there a risk of a clock refcount underflow here during device removal?

The clocks are dynamically disabled in dw_i3c_master_runtime_suspend().
If the device is already suspended when dw_i3c_common_remove() calls
pm_runtime_disable() without forcefully resuming first, would the
devres cleanup unconditionally call clk_disable_unprepare() again?

> +		if (IS_ERR(master->core_clk))
> +			return PTR_ERR(master->core_clk);
> +
> +		master->core_rst =3D devm_reset_control_get_optional_exclusive_deasser=
ted(&pdev->dev,
> +											"core_rst");
> +		if (IS_ERR(master->core_rst))
> +			return PTR_ERR(master->core_rst);
> +	}
> =20
>  	master->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");

Does this change alter the initialization order between the peripheral clock
and the core reset?

In the original code, pclk was enabled before core_rst was acquired and
deasserted. By moving core_rst into the else block above pclk, the reset
appears to be deasserted while pclk is still disabled.

Since hardware IPs typically require the peripheral bus clock to be running
for reset signals to properly synchronize and clear APB registers, could
this inverted sequence cause bus hangs or initialization failures?

[ ... ]

Additionally, is there a potential use-after-free regarding hj_work during
driver removal?

In dw_i3c_common_remove(), cancel_work_sync(&master->hj_work) is called
followed by i3c_master_unregister(), which destroys master->base.wq.

Since the IRQ was requested with devm_request_irq(), it remains active
until devres runs after remove() returns. If a Hot-Join interrupt fires
after the workqueue is destroyed, would the handler execute and call
queue_work(), dereferencing the freed pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D9

