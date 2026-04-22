Return-Path: <linux-hwmon+bounces-13429-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKP8OAw96GlaHgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13429-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:14:20 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135B441BE3
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27343018280
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 03:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11053A256D;
	Wed, 22 Apr 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uc4FT6O+"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C4139A06F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827340; cv=none; b=OS1Fc1qZ9A/r0p6tfqQs/lNDL2TLAKlUCIjzfZ42HiJGTmn++EJU1382+a2bt1gY4wBdxJiOJoozWzJdd9Uz/VwdY1wb55wqELrNTYytUZZpWcDIKUKkASzg/uRro+1XBnr4mEvcJhN1+Jmq+IJLhXgrjLvRR6vsLCYsq1+H2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827340; c=relaxed/simple;
	bh=aIEniT57RdWgrQLKmb3ZbnfFxfdni83jFktsb11yKLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nEfqJyLUHb14w65HckFbyrBERIdliOyud76mpEWyEPXCh/z2+Uyp15EZyzITEbo4YE62bJhyMdjtfBa6hyUKrUecow89BT2f0FBRpq2s/VzU0BdiJkqYd7jZzE7vNZ8lntH3yhn8ElBwVUDl8uOqxhkVjXRXVLURGsF8LGx2dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uc4FT6O+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752DAC2BCB0;
	Wed, 22 Apr 2026 03:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827340;
	bh=aIEniT57RdWgrQLKmb3ZbnfFxfdni83jFktsb11yKLw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uc4FT6O+Wflfl09y0s/nDVg60q9Pau73ujHaRuQZP2AceEFphnG3N/8Q+27ZdNyRv
	 h66f1RztDj8ybbbCmtTZyY+d28jhp0jasLmowcwQEG+4iL10vW/vWh7fpbFw5Li6wA
	 INzxNeRBDoWN+VfsnStY9sof7oyXqkq1+Ms2eTMELNYMGkzI6CDZAGIJEPcFUc5TXt
	 8WHK7u2rnRvJlSJUQ3O7sfpHiJkgQ2iZzGA+btUGdfxfQyb+2LaoddRkC77oaI8tdU
	 u/EsUet8Rl8MdBz75p2G3OrN9iVMIgWq8TTsfomlx4cs/6/jtnKjv18Kw1565nXWnr
	 0wLu5spVlhpCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/23] tick/nohz: Make nohz_full parameter optional
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: linux-hwmon@vger.kernel.org, mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
In-Reply-To: <20260421030351.281436-4-longman@redhat.com>
References: <20260421030351.281436-4-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:08:59 +0000
Message-Id: <20260422030900.752DAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13429-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev]
X-Rspamd-Queue-Id: 4135B441BE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] Booting with `nohz_full` (no argument) silently disables `CONFIG_R=
CU_NOCB_CPU_DEFAULT_ALL`.
--

commit b2af6c59a7f3101f93296e77bcb1e7af45562ea8
Author: Waiman Long <longman@redhat.com>

tick/nohz: Make nohz_full parameter optional

This commit allows the nohz_full boot option to be specified without
any parameters, forcing it to be enabled without any CPUs initially in
the tick_nohz_full_mask.

[ ... ]

> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
> index b3337c7231ccb..2d06dcb61f379 100644
> --- a/kernel/rcu/tree_nocb.h
> +++ b/kernel/rcu/tree_nocb.h
> @@ -1267,7 +1267,7 @@ void __init rcu_init_nohz(void)
>  	struct shrinker * __maybe_unused lazy_rcu_shrinker;
> =20
>  #if defined(CONFIG_NO_HZ_FULL)
> -	if (tick_nohz_full_running && !cpumask_empty(tick_nohz_full_mask))
> +	if (tick_nohz_full_running)
>  		cpumask =3D tick_nohz_full_mask;
>  #endif

If the kernel is booted with nohz_full (no arguments), tick_nohz_full_runni=
ng
will be true but tick_nohz_full_mask will be empty. This causes cpumask to
be assigned a non-NULL pointer to an empty mask.

Will this inadvertently disable CONFIG_RCU_NOCB_CPU_DEFAULT_ALL?

Looking at the code immediately following this change in rcu_init_nohz():

	if (IS_ENABLED(CONFIG_RCU_NOCB_CPU_DEFAULT_ALL) &&
	    !rcu_state.nocb_is_setup && !cpumask)
		cpumask =3D cpu_possible_mask;

Since cpumask is no longer NULL, this fallback check evaluates to false.
The subsequent code will then OR with the empty tick_nohz_full_mask, result=
ing
in rcu_nocb_mask remaining empty and disabling RCU callback offloading for
all CPUs at boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D3

