Return-Path: <linux-hwmon+bounces-13140-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIA2K5eR1mmiGQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-13140-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Apr 2026 19:34:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 247FE3BFA4A
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Apr 2026 19:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26439306688E
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Apr 2026 17:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D1F3B0AFC;
	Wed,  8 Apr 2026 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMAid5Dp"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D53A8744
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669332; cv=none; b=DMHJF0ihzu+vzWQOv+GjEtjy8DyJIQIHjrQv6VDVCdNNMlIlMSWqmDHlpTDhHiJ0bHPwrHxDyLRtaAVaCb0EPJNP0gEfsiQqEfckmz4WbLPtqfECoE3VzKEYz0Q+BID1jHGd+suGeTlN753UDL2XVhP5Qt1NH1DuAjdL8YodJ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669332; c=relaxed/simple;
	bh=KK1JODYAmwdfHaP25BwjiQweDEAgJfdsTOR2sLZiKqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M9f+OelRCq3VRsa1nTkeoUz8ZWBC4xuX4Pfxnmnf3VOLO0Pv0DGyIT3tQ0UxWM1y5tr8FKxmcSG/fK2S1gnxg5dlU7sws5AQnKUhD9uw7r/htm6DPjcM3bNvbNVLanr7rY+MGVHnVy6kPkZeX6sUSD+Pmkq9IQy1B/jmfKiBZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMAid5Dp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C680C19421;
	Wed,  8 Apr 2026 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775669332;
	bh=KK1JODYAmwdfHaP25BwjiQweDEAgJfdsTOR2sLZiKqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kMAid5Dp2BK9WqLGpjghSxGEr+6SfDrQCcly5oDmbpuVlK+x3Fe3ws8pXldS19mlJ
	 FDObm2QfRZfH9i8M3dKTCao5sYGjzUU/JJF0dfedphheKO4n65J6ynkuwQzIHM6Hc4
	 4zlkyBrgHDA/+3Yyh3P0xjDsoC4TNMsNy52l+oQEoUtwVFRmrzdq3DZ4SQBJECD8Jl
	 v6xm1eifXm77mEh15DdsPQcKcl3XgGCjI84SkRlQtvOZougOXphWavpPG+z+3br2iU
	 TuChUC3miTMjwmrqZji0WJR11qjFbVDsVtu2N8lhNJ5p6FQjNQgZOkIf10teJFTKk1
	 DiLj9kN5kL51g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (isl28022) Fix integer overflow in power
 calculation on 32-bit
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260408163029.353777-3-sanman.pradhan@hpe.com>
References: <20260408163029.353777-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 17:28:51 +0000
Message-Id: <20260408172852.4C680C19421@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	TO_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13140-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,juniper.net:email]
X-Rspamd-Queue-Id: 247FE3BFA4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [Low] The use of the `min()` macro with mixed types (`u64` and `long`) wi=
ll cause build failures when this patch is backported to older stable kerne=
ls.
--

commit 7d032fe46f91e450d244ac30f5851808fee10667
Author: Sanman Pradhan <psanman@juniper.net>

hwmon: (isl28022) Fix integer overflow in power calculation on 32-bit

This commit fixes an integer overflow on 32-bit systems in the power
calculation of the isl28022 driver by switching to 64-bit arithmetic
and using div_u64().

> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> index c2e559dde63f6..c5a34ceedcdb2 100644
> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c

[ ... ]

> @@ -185,8 +186,8 @@ static int isl28022_read_power(struct device *dev, u3=
2 attr, long *val)
>  				  ISL28022_REG_POWER, &regval);
>  		if (err < 0)
>  			return err;
> -		*val =3D ((51200000L * ((long)data->gain)) /
> -			(long)data->shunt) * (long)regval;
> +		*val =3D min(div_u64(51200000ULL * data->gain * regval,
> +				   data->shunt), LONG_MAX);

Is there a risk of build failures when this patch is backported to older
stable kernels?

Since this patch is marked with "Cc: stable@vger.kernel.org", it will likely
be backported to older LTS kernels like 5.15 or 6.1. While modern kernels
have relaxed the type-checking in the min() macro to allow safely comparable
mixed types, older kernels strictly enforce identical types via pointer
comparison.

Comparing a u64 (from div_u64()) and a long (LONG_MAX) might trigger a
"comparison of distinct pointer types lacks a cast" compiler error during
backporting.

Would it be better to use min_t(u64, div_u64(...), LONG_MAX) to avoid this
issue on older trees?

>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408163029.3537=
77-1-sanman.pradhan@hpe.com?part=3D2

