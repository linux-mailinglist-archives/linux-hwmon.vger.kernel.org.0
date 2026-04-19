Return-Path: <linux-hwmon+bounces-13373-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO5dEDwg5WkTegEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13373-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 19 Apr 2026 20:34:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5542516E
	for <lists+linux-hwmon@lfdr.de>; Sun, 19 Apr 2026 20:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5DA630041CB
	for <lists+linux-hwmon@lfdr.de>; Sun, 19 Apr 2026 18:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F712701C4;
	Sun, 19 Apr 2026 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGLiQpP1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105CC17DE36
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776623672; cv=none; b=nFKx5lmsbRKMnYsNb6WIEiEabyYMIyVv1Hxqg2HVuZ8XVIPes5YSxyo93bPQpXhoFEby1W40jAe7Wh3g80wBN4eSbrreBCh1a5ePOsNorkAY6Hh0nuOTAN+EH7sW+M3hrcvMAddnMu3cmkmApUh619iadzEvKFwNr/C1nv7pwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776623672; c=relaxed/simple;
	bh=ft7kInWgnpep9V/ZTU1Bffes7qJ+ddB2hY/R8E8CjnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eEyCJrcpGLy16TOBt2Ar0CGTNRGHApfkISZ1ibaBxUO5ZZlmuvXEgz5tsa+d73JFFzcIPdti8hZ103iy53m9COgZtRo3k043hq2yPLu3go72rKl4AODk+TunN9mJgdRD28XLwMZLhF+/mMfa06HQViHEFtmBAO7PFrnCY9v+GvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGLiQpP1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5169C2BCAF;
	Sun, 19 Apr 2026 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776623671;
	bh=ft7kInWgnpep9V/ZTU1Bffes7qJ+ddB2hY/R8E8CjnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DGLiQpP1Ov0okI/mE4wiGe1awfM9Qsf/xXeVSit2nzFEIEiySUEefBDbKtViWEQhs
	 B0h+BR5oPjds10JIw1iJn56q6Q0/qZxg7mBz7jSZf+nuN3nWXk4aDzfIcjyWh6BaWi
	 KZ2dJ35h76q/HmguvproxmL9Gf4C/Q1iEhwrUEayPtigOX3JgscYWuAMtMoKlaJGeB
	 90MBacusLX2FG7O2tcio8grQ4igUTwy0z48/PxxE8pkVA2rhY/NSp0cpQXTpYTy6/F
	 Wfnv/Hns7769N/joUo0h4+YZdPT4NCIAppRTaHBq0xZ8sitzC4V46966Q8qXLsVl1g
	 s+GUQCszt68Kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 10/14] thermal/of: Rename the
 devm_thermal_of_cooling_device_register() function
Reply-To: sashiko@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260419182203.4083985-11-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-11-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Apr 2026 18:34:31 +0000
Message-Id: <20260419183431.B5169C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13373-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,qualcomm.com:email,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADB5542516E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 3 potential issue(s):
- [Low] Semantic mismatch in API naming for drivers not using child nodes.
- [Low] Incomplete refactoring leaves `thermal_of_cooling_device_register()=
` with a generic name.
- [Low] Kerneldoc for the renamed function does not document the new specia=
lized semantics.
--

commit d1ab585391fe2969c56e5221cba69749aaa4c5c5
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: thermal/of: Rename the devm_thermal_of_cooling_device_register() f=
unction

This commit renames devm_thermal_of_cooling_device_register() to
devm_thermal_of_child_cooling_device_register() across the kernel. This
name change is intended to distinguish the old bindings using child nodes f=
rom
an incoming new binding format for cooling devices.

> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 37269db2de84f..e6a567d58579d 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
[ ... ]
> @@ -685,8 +685,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
> =20
>  	ctx->pwm_fan_state =3D ctx->pwm_fan_max_state;
>  	if (IS_ENABLED(CONFIG_THERMAL)) {
> -		cdev =3D devm_thermal_of_cooling_device_register(dev,
> -			dev->of_node, "pwm-fan", ctx, &pwm_fan_cooling_ops);
> +		cdev =3D devm_thermal_of_child_cooling_device_register(dev, dev->of_no=
de,
> +								     "pwm-fan", ctx,
> +								     &pwm_fan_cooling_ops);

Since this driver is passing dev->of_node rather than a child node, does th=
is
renaming create a semantic mismatch for this and other similar drivers (such
as tc654.c, max6650.c, and gpio-fan.c)?

[ ... ]
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 3d2fb8f37b9c5..ba5093f612d0e 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -550,7 +550,7 @@ static void thermal_cooling_device_release(struct dev=
ice *dev, void *res)
>  }
> =20
>  /**
> - * devm_thermal_of_cooling_device_register() - register an OF thermal co=
oling
> + * devm_thermal_of_child_cooling_device_register() - register an OF ther=
mal cooling
>   *					       device
>   * @dev:	a valid struct device pointer of a sensor device.
>   * @np:		a pointer to a device tree node.

Since the function is now explicitly meant for legacy bindings utilizing ch=
ild
nodes, could this kerneldoc description be updated to clarify its specializ=
ed
semantics instead of leaving it generically registering an OF thermal cooli=
ng
device?

[ ... ]
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index a8e870ca2e271..6535353ae83ca 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -206,10 +206,10 @@ thermal_of_cooling_device_register(struct device_no=
de *np,
>  				   const struct thermal_cooling_device_ops *ops);
> =20
>  struct thermal_cooling_device *
> -devm_thermal_of_cooling_device_register(struct device *dev,
> -					struct device_node *np,
> -					const char *type, void *devdata,
> -					const struct thermal_cooling_device_ops *ops);
> +devm_thermal_of_child_cooling_device_register(struct device *dev,
> +					      struct device_node *np,
> +					      const char *type, void *devdata,
> +					      const struct thermal_cooling_device_ops *ops);

Should the underlying unmanaged thermal_of_cooling_device_register() also
be renamed to maintain a consistent API surface between the managed and
unmanaged variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260419182203.4083=
985-1-daniel.lezcano@oss.qualcomm.com?part=3D10

