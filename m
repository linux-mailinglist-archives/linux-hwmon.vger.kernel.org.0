Return-Path: <linux-hwmon+bounces-13425-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAUoONA76GlfHQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13425-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:09:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0D441B7F
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B85730162B9
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 03:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F57C39A055;
	Wed, 22 Apr 2026 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK9qqgz3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE70F394796
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827337; cv=none; b=LnJ1Hu4sity9m6JB6pFvwDuB5LDcEJ6HNl/t8L0A3TNiOitYwbCxPlcdmFZFyw7eOQPOjFgGM1v7zT9FH2BCCDgLhVh4jx7IF5CC8nvn6fjgpMzKssG/ZWq8aKsaSblKvwWKnSUReOii9Cc3WsH2ef+9wm2uTyYegoV66aD76i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827337; c=relaxed/simple;
	bh=jxFZ5aWRFPzs8YkI+5rjyKn2UwMSMBMQE7wEic86Ha8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CChFUIXGKdcle3SW4RhSGQJEKUYqGYY8cet9KgVOHkTWF4U3OXwRW8OWd+ZlrY5A3kktrk5fW/3Qoly97be+ZNv1DyANDBnFd4ilztiDt0Pkv3zYq7M9ARKG5syFjk4lTNRPDmceaEa3SGcSai59thrT1RczQdWKzq4/KjPdSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK9qqgz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8BEC2BCB0;
	Wed, 22 Apr 2026 03:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827336;
	bh=jxFZ5aWRFPzs8YkI+5rjyKn2UwMSMBMQE7wEic86Ha8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YK9qqgz3ufQRx+6/+R5wIkr6Z+xwO0XQW5C9LBu1jMSnSp41rAnTqlQMSiLahxl1d
	 ejuqIxL7bJ2aB/VP0v/aNTYaTjgdaxwD6Vkxd1knz+rQ6zzbQlRifWjmb+n4FB2zGL
	 VrM5tPCaOZPOdMQnjveF4cPsWkGoI6F5fquNZSml75ROYDEmAfs1/IgZruZc4deddS
	 /bHy1w4w+sozcCZEXoILt230GaheGzAzbLzDAH8lupcQx4B5NsCZbsq3y37h5Sin8c
	 N4NW7h3H2irAPIhguwULM5cpIB31MSFxgSmtLkbwi/fw51jLWyaCgx5FjfO9zKnytz
	 8QMTIus/0MTyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/23] rcu/nocbs: Allow runtime changes in RCU NOCBS
 cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260421030351.281436-7-longman@redhat.com>
References: <20260421030351.281436-7-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:08:55 +0000
Message-Id: <20260422030856.4C8BEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13425-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev]
X-Rspamd-Queue-Id: 5DB0D441B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] Dynamic RCU NOCB update attempts to de-offload online `rcu_nocbs=
=3D` CPUs, triggering a WARN_ON_ONCE and leaving isolation state inconsiste=
nt.
--

commit a58a92fdc96e43de871fd44a78e4e6da373179d5
Author: Waiman Long <longman@redhat.com>

rcu/nocbs: Allow runtime changes in RCU NOCBS cpumask

This commit enables dynamic runtime updates to the RCU NO-CB CPU offloading
state when isolated CPUs are added or removed. It introduces a new helper,
rcu_nocb_update_cpus(), which is called directly from housekeeping_update()
to synchronize the offloaded CPUs with the HK_TYPE_KERNEL_NOISE cpumask.

> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
> index 2d06dcb61f379..b2daba1e5cb98 100644
> --- a/kernel/rcu/tree_nocb.h
> +++ b/kernel/rcu/tree_nocb.h
[ ... ]
> +void rcu_nocb_update_cpus(struct cpumask *cpumask)
> +{
> +	int cpu, ret;
> +
> +	if (!rcu_state.nocb_is_setup) {
> +		pr_warn_once("Dynamic RCU NOCB cannot be enabled without nohz_full/rcu=
_nocbs kernel boot parameter!\n");
> +		return;
> +	}
> +
> +	for_each_cpu_andnot(cpu, cpumask, rcu_nocb_mask) {
> +		ret =3D rcu_nocb_cpu_offload(cpu);
> +		if (WARN_ON_ONCE(ret))
> +			return;
> +	}
> +
> +	for_each_cpu_andnot(cpu, rcu_nocb_mask, cpumask) {
> +		ret =3D rcu_nocb_cpu_deoffload(cpu);

What happens here if a system booted with explicit rcu_nocbs=3D CPUs, and
later a user dynamically updates an isolated cpuset?

It looks like this loop assumes the active rcu_nocb_mask should identically
match the new isol_mask. If the boot-time rcu_nocbs=3D CPUs are not included
in the new isolation mask, this loop will attempt to de-offload them.

Because the cpuset subsystem is unaware of the independent rcu_nocbs=3D mas=
k,
wouldn't those original CPUs likely remain online?

> +		if (WARN_ON_ONCE(ret))
> +			return;

If rcu_nocb_cpu_deoffload() is called on an online CPU, it returns -EINVAL.
Could this unconditionally trigger this WARN_ON_ONCE and abort the rest of
the update loop?

If the loop aborts early, since housekeeping_update() already committed the
new mask to housekeeping.cpumasks[], does this leave the system in a
desynchronized state where the scheduler assumes CPUs are isolated but
RCU callback offloading is not properly updated?

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D6

