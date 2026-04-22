Return-Path: <linux-hwmon+bounces-13433-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNntNBU96GlaHgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13433-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:14:29 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31653441BEA
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDD86301AD27
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 03:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF313A2574;
	Wed, 22 Apr 2026 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf93ZfWF"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF18E3A2566
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827343; cv=none; b=Xqik0gprorMugfAxX+i1zAZzzlwqxlso3ZxLWx55hhPuRIBN08ehiTvRK0fo7+4gafTh2+Y1pR7iW2AwkM79fSqcXIKQmLI0hKXn1BXWN/OpqUym9lVyJWqaBVuTY2nVt9MtG3ScNQouDKLP1WTYr5Zy6DMiwS6U70YKAv0hBwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827343; c=relaxed/simple;
	bh=7EwjNUqTCUye7zwtomGip/e6cl7Ud9h1qOQBlLe41Uc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SxlhVGnKn9GrHJojx3l0BZxECboGqe7PhXwsf5bSjI5mYpsEwKKpAy9m8ZH1uNrREFh17iUg3t6+aWdY0vndZIG8WWfjbp66lNIDXHDNlJrd7BPrvoVFciMNvA/G9SxregQoSsqoOYg0EQriFYW1KIq/XuNuq3Bx2bMw0P+Tsew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf93ZfWF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26819C2BCB5;
	Wed, 22 Apr 2026 03:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827343;
	bh=7EwjNUqTCUye7zwtomGip/e6cl7Ud9h1qOQBlLe41Uc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Yf93ZfWFedETE7IKlCmuj22XscFaeNm7kX0o/3diktSh8VWB0GJz76EjdUajSU5XF
	 sLK2XKhqN2EoYPKWo3B1neUF85mnjjRArkCsorYYS+whLhQyUD2jxOFqUx2W7cju/6
	 WsMp0lim4B6l9co4xCYnq+ih4IRdofz+HaoV2XXSHAf8lujdSUIlIUdiNPOKI7SkpS
	 izxN2goe+0qDZB7W5JWm5ZJZeqEN8M3egpFPSlywb8rCU+wMR/5hSOeiSj3YxJj+V0
	 fj7erGsBYaMhQw4HMD22SH4tq2dfqXNYoNMmQrJBa9ugkKYb5MJKZI21k6W+azUo5F
	 q45Sdd2gYwWeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/23] hwmon/coretemp: Use RCU to protect access of
 HK_TYPE_MISC cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: linux-hwmon@vger.kernel.org, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
In-Reply-To: <20260421030351.281436-15-longman@redhat.com>
References: <20260421030351.281436-15-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:02 +0000
Message-Id: <20260422030903.26819C2BCB5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13433-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev]
X-Rspamd-Queue-Id: 31653441BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [Medium] Mixing goto-based cleanup labels with scope-based cleanup helper=
s (`scoped_guard`) in the same function.
--

commit 83c63b96668998046d82d5fd34944cc02b7b7876
Author: Waiman Long <longman@redhat.com>

hwmon/coretemp: Use RCU to protect access of HK_TYPE_MISC cpumask

This patch wraps the housekeeping_cpu() check in a scoped_guard for RCU
since the HK_TYPE_MISC cpumask can change at runtime.

> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -563,8 +563,10 @@ static int create_core_data(struct platform_device *=
pdev, unsigned int cpu,
>  	u32 eax, edx;
>  	int err;
> =20
> -	if (!housekeeping_cpu(cpu, HK_TYPE_MISC))
> -		return 0;
> +	scoped_guard(rcu) {
> +		if (!housekeeping_cpu(cpu, HK_TYPE_MISC))
> +			return 0;
> +	}

Is it okay to use scoped_guard in a function that also relies on goto
labels for error handling?

Looking at include/linux/cleanup.h, the guidelines state that usage of
goto and cleanup helpers should never be mixed in the same function. We
should either convert all resources to scope-based cleanup or convert
none of them.

[ ... ]

>  	/* Test if we can access the status register */
>  	err =3D rdmsr_safe_on_cpu(cpu, tdata->status_reg, &eax, &edx);
>  	if (err)
>  		goto err;

[ ... ]

>  err:
>  	destroy_temp_data(pdata, tdata);
>  	return err;
>  }

Since create_core_data() still relies on the goto err label to clean up
tdata, would it be better to use explicit rcu_read_lock() and
rcu_read_unlock() around the housekeeping_cpu() check, or alternatively
convert tdata to use a cleanup helper?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D14

