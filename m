Return-Path: <linux-hwmon+bounces-14273-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH/BEif2CmpZ+QQAu9opvQ
	(envelope-from <linux-hwmon+bounces-14273-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 13:21:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B555F56B6F4
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 13:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 834B0302E7DE
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 11:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E93F58C7;
	Mon, 18 May 2026 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfhU79R+"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EC03F58E2;
	Mon, 18 May 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103189; cv=none; b=bPKZNgUMzZyDZwMfqb45FdsMpdlweppPr1UZrhTSKl6+Y/gYolwzDG9PX2zVp5uPrmil7kDBZrOsampiAfQKVl9e5cj50nK0clz65/wZXSebbGNGKL0Aji4v1lPY8bohle0GxD4uTpW300RqDOaCfvWNSqbOkL1GX3tuv1YKkz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103189; c=relaxed/simple;
	bh=vH7pnbYGn7AO3OaKGHuq9u2nobog1aJHQ14rr8QXIog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gapSoVu9cIP/+Nrdd+Ll2dylYE+rObx6X+zbBN0UvGcBNenI+dlhEO5Dr2AqxJv/sGQZSuI0cWll6j3UL7rMpsAuB10TxSt1zlVqSnWzK6my7YgSWuGb4Cwi/eM0JADc+dU3mLxBTtJuF9pJvM/gblgyV8JfVxb+itVimxJzz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfhU79R+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D177CC2BCB7;
	Mon, 18 May 2026 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779103188;
	bh=vH7pnbYGn7AO3OaKGHuq9u2nobog1aJHQ14rr8QXIog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dfhU79R+hGg0NyjDnDXOjG21p7dVP7hxjyBA2dmLmGKNKBXKYBCRHDbUzC5tQ6SXN
	 CNOLdpJEQWniZNHRXuQBXg0aqVKSDZxly9XpdqG3xXvD5v0X35DIYUZ6OJ/VxvdSFc
	 E5npmSAX/K00E00f5BiG3bsPnDaE65u7fV6DVnBJMs/Iy0rqhZ+5fzUf3uJ4QsXIJc
	 irvjDREjorLtHXVon7/THV0rFHWDPvD/pim70aa736hF89Sin9du6ZQXwsYWYR3LWL
	 N219DxEDJzODsyNDJPZlp0kpvjx1S+/UGNe6ewIwPJGlgnF1HtXS2cus9RuIWSwnFw
	 Ceb+qCKIcZtjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/6] pinctrl: core: Make pin group callbacks
 optional for pin-only drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260518100054.3552143-4-o.rempel@pengutronix.de>
References: <20260518100054.3552143-4-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 11:19:47 +0000
Message-Id: <20260518111947.D177CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: B555F56B6F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14273-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The function `pinconf_groups_show` iterates locklessly over pi=
n groups using `pctlops->get_group_name` without taking `pctldev->mutex`, l=
eading to a Use-After-Free (UAF) race condition.
- [Critical] The function `pinctrl_get_group_selector` iterates over `pctlo=
ps->get_group_name` locklessly, creating a Use-After-Free (UAF) race condit=
ion during map resolution.
--

commit 02ec67dd43dc0fad7f2e694d9ac1bbd0d9a91c1a
Author: Oleksij Rempel <o.rempel@pengutronix.de>

pinctrl: core: Make pin group callbacks optional for pin-only drivers

Relax the requirement for pin-only drivers by making the group callbacks
optional when no muxing or group pin configuration support is provided.

> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> index 6cbcaa6709da1..3fcb7e584a937 100644
> --- a/drivers/pinctrl/core.c
> +++ b/drivers/pinctrl/core.c

[ ... ]

> @@ -738,8 +743,15 @@ int pinctrl_get_group_selector(struct pinctrl_dev *p=
ctldev,
>  			       const char *pin_group)
>  {
>  	const struct pinctrl_ops *pctlops =3D pctldev->desc->pctlops;
> -	unsigned int ngroups =3D pctlops->get_groups_count(pctldev);
>  	unsigned int group_selector =3D 0;
> +	unsigned int ngroups;
> +
> +	if (!pctlops->get_groups_count || !pctlops->get_group_name) {
> +		dev_err(pctldev->dev, "does not support pin groups\n");
> +		return -EINVAL;
> +	}
> +
> +	ngroups =3D pctlops->get_groups_count(pctldev);
> =20
>  	while (group_selector < ngroups) {
>  		const char *gname =3D pctlops->get_group_name(pctldev,

This isn't a new regression introduced by this commit, but since the
surrounding logic is being modified, does this code have a use-after-free
race condition?

pinctrl_get_group_selector() iterates over pctlops->get_group_name
locklessly. This is called from map resolution paths
(e.g. pinmux_map_to_setting()) holding pinctrl_maps_mutex but not
pctldev->mutex.=20

If there is a concurrent dynamic modification to the group list (such as a
provider driver unbinding and calling pinctrl_generic_remove_group() which
frees the descriptor), could it race against the lockless radix tree lookup
and lead to a use-after-free when accessing the returned group name?

Note that simply adding mutex_lock(&pctldev->mutex) inside
pinctrl_get_group_selector() would deadlock callers like
pin_config_group_get() which already hold the lock, so the locking might
need to be addressed correctly in the call stack.

[ ... ]

> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> index dca963633b5d1..81686844dfa5f 100644
> --- a/drivers/pinctrl/pinconf.c
> +++ b/drivers/pinctrl/pinconf.c

[ ... ]

> @@ -348,8 +348,13 @@ static int pinconf_groups_show(struct seq_file *s, v=
oid *what)
>  {
>  	struct pinctrl_dev *pctldev =3D s->private;
>  	const struct pinctrl_ops *pctlops =3D pctldev->desc->pctlops;
> -	unsigned int ngroups =3D pctlops->get_groups_count(pctldev);
>  	unsigned int selector =3D 0;
> +	unsigned int ngroups;
> +
> +	if (!pctlops->get_groups_count || !pctlops->get_group_name)
> +		return 0;
> +
> +	ngroups =3D pctlops->get_groups_count(pctldev);
> =20
>  	seq_puts(s, "Pin config settings per pin group\n");
>  	seq_puts(s, "Format: group (name): configs\n");

Similarly, this isn't a new regression introduced by this patch, but does
pinconf_groups_show() have a use-after-free race condition?

It iterates locklessly over pin groups using pctlops->get_group_name without
taking pctldev->mutex (unlike its sibling pinctrl_groups_show).

Since pinconf_groups_show() is a debugfs callback, it can run concurrently
with a pinctrl driver's unbind or dynamic group removal. A driver unbinding
calls pinctrl_unregister() or pinctrl_generic_remove_group(), which frees
the group descriptor.

Because pinconf_groups_show() traverses the radix tree locklessly and does
not hold pctldev->mutex, can it access a freed group name and lead to memory
corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518100054.3552=
143-1-o.rempel@pengutronix.de?part=3D3

