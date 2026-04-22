Return-Path: <linux-hwmon+bounces-13428-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ+KAdI76GlfHQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13428-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:09:06 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0D441B88
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADC2C301BEF9
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 03:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F9E382373;
	Wed, 22 Apr 2026 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rb1pPnIp"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1175539C014
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827340; cv=none; b=msSiuEXCuCFJxZPwK6Z4XaAIgq1U2s8OA//+wsbT3Z8lB8qbWY0V4iC3upb3tpSuHwiKGsuwZxCQPbdXYn9HaQxlIjS6SXDpANv1pj0leuBxykodUKU7HmUOQbaL0jAcUvOPGLaRL9rN/3RgAnQhztPd4Aw4iezMIU7u/svdoz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827340; c=relaxed/simple;
	bh=yiCCtQI6kO/sI/M8VSNc04lxoUOuCudfSaE6sSst95o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tv/a0efxaTLO6BEr5lf1Vlf1jqyVzJWBa2Pa2yUmhBo9KosqJXGz70sVbNe5BHc/St86o1L1x9X1IIdWVe/ernqRKopPDSAssDfzswhhQv6hXrk5UFPZJY6EqbXF+5xoTi9XQGhsZMZZlRHoQYUkOBpz0nnMGXoaHr+F++bFLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rb1pPnIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040D5C2BCB0;
	Wed, 22 Apr 2026 03:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827338;
	bh=yiCCtQI6kO/sI/M8VSNc04lxoUOuCudfSaE6sSst95o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Rb1pPnIp/WVKlXtkdbGDQW9z/zPn7VT8BSfqDX6wLMeac4ARJwwLVDuLbzF3+gx1R
	 LoUri5+aiIaq5hspmDpoww/VHCjBSD0XS374NkfFaWJL7tLs1u9wXiZFFQMW9f+r44
	 DLlHjXIxZJTTCu1k2VVUtK4cDMzvz6MS5iNYqIMnNxvw5mMKtNlIEUrPE2tm6oPwoN
	 B9oimN6Dl3UHlQSrgJs7jlWzAdzBTVUgYPvPrL2/vMrs0vQOjTzShPoXW6bXI2jXGY
	 lh56rqLFB5eo30BT360KOe9aVhQt1jUEiPj/laW+rWT3jXSqpE7ggdh8Wdefr8wdM0
	 7yXiER2YCP9fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/23] watchdog: Sync up with runtime change of isolated
 CPUs
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: mkoutny@suse.com, linux-hwmon@vger.kernel.org, tj@kernel.org, hannes@cmpxchg.org
In-Reply-To: <20260421030351.281436-8-longman@redhat.com>
References: <20260421030351.281436-8-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:08:57 +0000
Message-Id: <20260422030858.040D5C2BCB0@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13428-lists,linux-hwmon=lfdr.de];
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
X-Rspamd-Queue-Id: B8A0D441B88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] Silent overwrite and clobbering of userspace `watchdog_cpumask` sy=
sctl configuration.
--

commit c51e1c592377490b0da49dd889417304c34badc2
Author: Waiman Long <longman@redhat.com>

watchdog: Sync up with runtime change of isolated CPUs

This commit updates the watchdog to exclude isolated CPUs at runtime by
adding a new watchdog_cpumask_update() helper. It modifies watchdog_cpumask
and watchdog_allowed_mask when the HK_TYPE_KERNEL_NOISE cpumask is updated.

> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 7d675781bc917..f35374abf457c 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
[ ... ]
> +/**
> + * watchdog_cpumask_update - update watchdog_cpumask & watchdog_allowed_=
mask
> + * @isol_mask: cpumask of isolated CPUs
> + *
> + * Update watchdog_cpumask and watchdog_allowed_mask to be inverse of the
> + * given isolated cpumask to disable watchdog activities on isolated CPU=
s.
> + * It should be called with the affected CPUs in offline state which wil=
l be
> + * brought up online later.
> + *
> + * Any changes made in watchdog_cpumask by users via the sysctl paramete=
r will
> + * be overridden. However, proc_watchdog_update() isn't called. So chang=
e will
> + * only happens on CPUs that will brought up later on to minimize change=
s to
> + * the existing watchdog configuration.
> + */
> +void watchdog_cpumask_update(struct cpumask *isol_mask)
> +{
> +	mutex_lock(&watchdog_mutex);
> +	cpumask_andnot(&watchdog_cpumask, cpu_possible_mask, isol_mask);

Does this unintentionally discard the existing sysctl configuration for
kernel.watchdog_cpumask?

By using cpu_possible_mask as the base, it looks like this unconditionally
overwrites the entire watchdog_cpumask with all possible CPUs except the
newly isolated ones.=20

If an administrator had explicitly disabled watchdogs on CPUs 1-6 using the
sysctl interface, and later dynamically isolates CPU 7, would this operation
silently clobber the user API contract and re-enable watchdogs on CPUs 1-6
when they are next onlined or reconfigured?

> +#ifdef CONFIG_SOFTLOCKUP_DETECTOR
> +	cpumask_copy(&watchdog_allowed_mask, &watchdog_cpumask);
> +#endif
> +	mutex_unlock(&watchdog_mutex);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D7

