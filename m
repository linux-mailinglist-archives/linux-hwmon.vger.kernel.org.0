Return-Path: <linux-hwmon+bounces-13432-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPY9HdM76GlfHQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13432-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:09:07 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E53441B9D
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 05:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAA84301BED4
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2026 03:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B783A0E86;
	Wed, 22 Apr 2026 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFELo0dU"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9AF392C4B
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 03:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827343; cv=none; b=nXEr2jj3iT9cVUdkoqvSi7gWHmbyU/r2+kjPjhs8xcBmann5NCtqs7J800IiHX9LOdaFAY8qsuj905QP3YzgwZiMFLrb6fayiVLYLiJqhvN2ofdaSzxoVsIEGdwXRrb5tOp3ppJ4TFEF/powfF90j47JHbYEK7nYN/N2Qodyn/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827343; c=relaxed/simple;
	bh=TA0aXBIzpvd7J1MRDvRURtDPSzovlZrUKNxgh/hLn6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FAV9k1VsUUy+1Ww5YclllQCpPd3BxZQSX9rme+M3umqFJzSn4m+BgIehXqmu2+kU1MLhT/Bl+iZJXkftgeesxyy4FFhilRDUTg4xuoJqDMv2ufmpcTZY+7c1DoJd6KZBqxkW3MQWAqk1MVFbdnEDe5OcjoEVjYJcRAq2hi3mnU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFELo0dU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F95FC2BCB0;
	Wed, 22 Apr 2026 03:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776827342;
	bh=TA0aXBIzpvd7J1MRDvRURtDPSzovlZrUKNxgh/hLn6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dFELo0dUEKTSgsiYT/uRgcbhARP8aJX7I30i1AJgEeTVcxoeAAQxZ+aNRmO9nbQ70
	 A22/VxJ/n0fG5XDX+9tBZ3fYJ6rvrkonIViPgoLgQmwtQAb0wO59VaU51UjTQ6TOw2
	 8uKsZFF4SMtVPqrRiE69xJ/2EN9c8euHNxku7fHRtm1HYKGwCW3MUmpzi5kTycCe4N
	 rkRMdSq3Z/4VRehxpHTZvOrCZXjC1LsA6H0pyMc71c3UBb0Muq1o2ZxKqfp68WTzI9
	 KJlYjHdKDoZoOMsLLrcL/wDUW3Sr58UIMjh4p40X9ENM8vKViKwWNItwRxhUWrPWdk
	 cpbVKf0fdm2yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/23] sched/core: Use RCU to protect access of
 HK_TYPE_KERNEL_NOISE cpumask
Reply-To: sashiko@lists.linux.dev
To: "Waiman Long" <longman@redhat.com>
Cc: mkoutny@suse.com, tj@kernel.org, linux-hwmon@vger.kernel.org, hannes@cmpxchg.org
In-Reply-To: <20260421030351.281436-14-longman@redhat.com>
References: <20260421030351.281436-14-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 03:09:01 +0000
Message-Id: <20260422030902.4F95FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13432-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev]
X-Rspamd-Queue-Id: 37E53441B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] The commit message incorrectly claims that `housekeeping_cpumask()=
` will warn if used in an invalid context, masking potential RCU safety vio=
lations elsewhere in the kernel. Specifically, `housekeeping_dereference_ch=
eck(type)` returns `true` for `HK_TYPE_KERNEL_NOISE`, causing `rcu_derefere=
nce_all_check()` to bypass the `rcu_read_lock_held()` validation. This fals=
e assumption of a safety net led the author to miss unprotected accesses, s=
uch as the `housekeeping_show` sysfs handler in `drivers/base/cpu.c` which =
does not hold `rcu_read_lock()`. Because `housekeeping_update()` replaces a=
nd frees the old mask via `kfree()` after `synchronize_rcu()`, concurrent e=
xecution of `housekeeping_show()` results in a Use-After-Free. While the lo=
ckdep omission is patched later in the series by commit "sched/isolation: E=
xtend housekeeping_dereference_check() to cover changes in nohz_full or man=
ged_irqs cpumasks", the underlying Use-After-Free vulnerability in `drivers=
/base/cpu.c` remains unfixed throughout the entire series.
--

commit 7a774b36f9d9b430bf7171534b53f6145556f483
Author: Waiman Long <longman@redhat.com>

sched/core: Use RCU to protect access of HK_TYPE_KERNEL_NOISE cpumask

This commit adds RCU protection to the HK_TYPE_KERNEL_NOISE cpumask in
get_nohz_timer_target(), as the mask can now be changed at runtime. It
also notes that housekeeping_cpumask() will warn if used in an invalid
context.

> As HK_TYPE_KERNEL_NOISE is going to be changeable at run time, use
> RCU to protect access to the cpumask when needed. Some access of the
> HK_TYPE_KERNEL_NOISE cpumask is done inside the tick code that has
> interrupt disabled which is a rcu_read_lock() critical section. Anyway,
> housekeeping_cpumask() will warn if they are used in invalid context.

Is this description accurate? Looking at housekeeping_dereference_check(),
it returns true for HK_TYPE_KERNEL_NOISE, which causes
rcu_dereference_all_check() to bypass the rcu_read_lock_held() validation.
This means lockdep will not warn about missing RCU read locks for this
specific mask.

Because the mask can now be replaced and freed dynamically after
synchronize_rcu(), does this introduce a use-after-free in other readers
that don't hold the RCU read lock?

For example, housekeeping_show() in drivers/base/cpu.c reads this mask to
print it to sysfs:

drivers/base/cpu.c:housekeeping_show() {
    ...
    return sysfs_emit(buf, "%*pbl\n",
                      cpumask_pr_args(housekeeping_cpumask(type)));
}

Since housekeeping_show() doesn't hold rcu_read_lock(), could a concurrent
update of the cpumask cause cpumask_pr_args() to access freed memory?

While the lockdep omission is patched later in this series by the commit
"sched/isolation: Extend housekeeping_dereference_check() to cover changes
in nohz_full or manged_irqs cpumasks", the underlying use-after-free
regression in drivers/base/cpu.c appears to remain unfixed throughout the
series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260421030351.2814=
36-1-longman@redhat.com?part=3D13

