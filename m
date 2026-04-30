Return-Path: <linux-hwmon+bounces-13617-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IotIgHR8mnOuQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13617-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 05:48:17 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8D49D142
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 05:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 408513009B2D
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 03:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEEB23AB88;
	Thu, 30 Apr 2026 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He88iVhP"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985F9EAC7
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777520894; cv=none; b=ZxIlJ9ZsYb6BW+4WW4diZIou/haeD3dNzGszZ5GDevvZTrAUtfDgbNcgcnIn5tC26TTQ1juyvm4tPBb3IdyMykrN5GYPxeM7n84g3NNvGucVAB4i5os3AFxFC7Mm9ctyCJR2bAcM9AmDlyKeC/3OyELYB+jKCk5PT3nWGg1at48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777520894; c=relaxed/simple;
	bh=/IobffCSgXApPYD3MHtmQG+CBScWnR+GwlvyBGb6mlY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGYOn05qPBHPZLRo73VxPseGcwBrgtYUD2Urq1C/wkFhcUbO0XlccD2AO3TE8L9EzFzvzfNMVp55xjayxip7WOr15CQiTd+wf8p40OKKMisSl0Mr2sI70r8kL6T5FlXJ2l5dJrilTvm8cYvAzMO11LquORHLN40C/EEvqT+v8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He88iVhP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24145C2BCB8;
	Thu, 30 Apr 2026 03:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777520894;
	bh=/IobffCSgXApPYD3MHtmQG+CBScWnR+GwlvyBGb6mlY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=He88iVhPLnajGirWSpdakaY6hywdBDGBSqSxuWWyUTWLZcf232g/FySyijZ1ys+4L
	 uOsY5AFK/EgXWV3nz8WtnkQxScJLaaS13OPMwGk7AxOzZJxBUbnuDr10JcBAhxhJh8
	 L49CVwnNUFvVFJFJR1bMUWeu6ikjQJp/+t8xsnz1sZRR0Ie2dTo3HlMoXEzF4ScpBE
	 D6ezAUaWZ9sYUYlVkQ8nHjZ3IZ01upoaXx/WrdRmTjQ/BNLlf8vpeUNsemE+y1BD6x
	 ZPkrcya/ySscszgf+xdRLX4AgiXvpfImqtgJfbJLOX6c2HD8mUY3ckasaNIGJKRkPc
	 9gLLD5zIUbxQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus) add support for Delta E50SN12051
Reply-To: sashiko@lists.linux.dev
To: "Colin Huang via B4 Relay" <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260430-add-e50sn12051-v2-3-d76fe42482ab@gmail.com>
References: <20260430-add-e50sn12051-v2-3-d76fe42482ab@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Apr 2026 03:48:13 +0000
Message-Id: <20260430034814.24145C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: D9C8D49D142
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13617-lists,linux-hwmon=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-hwmon,u8813345.gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary memory allocation using devm_kmemdup for a static struc=
ture.
--

commit e0fb0b22fc908f166717510eea0ebcb85704a919
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus) add support for Delta E50SN12051

This commit introduces a new PMBus driver for the Delta E50SN12051 600W
Non-isolated 1/8th Brick DCDC Power Modules.

> diff --git a/drivers/hwmon/pmbus/e50sn12051.c b/drivers/hwmon/pmbus/e50sn=
12051.c
> new file mode 100644
> index 000000000000..3d61db949afb
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/e50sn12051.c
[ ... ]
> +static int e50sn12051_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +
> +	info =3D devm_kmemdup(&client->dev, &e50sn12051_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	return pmbus_do_probe(client, info);
> +}

Is it necessary to duplicate the e50sn12051_info structure using
devm_kmemdup() here?

The e50sn12051_info structure is statically defined and fully populated at
compile time. Looking at the PMBus core, it only modifies the
pmbus_driver_info structure if the PMBUS_USE_COEFFICIENTS_CMD flag is set,
which is not the case for this driver.

Could this be simplified to pass &e50sn12051_info directly to
pmbus_do_probe() to avoid the extra memory allocation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260430-add-e50sn1=
2051-v2-0-d76fe42482ab@gmail.com?part=3D3

