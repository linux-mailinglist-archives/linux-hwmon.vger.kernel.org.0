Return-Path: <linux-hwmon+bounces-14326-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMT8DMRXDGodfwUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14326-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 14:29:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328F757EB19
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 14:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A2F03010F3B
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 12:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518E44CA260;
	Tue, 19 May 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvXpgN8S"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA054C77A5;
	Tue, 19 May 2026 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193138; cv=none; b=VCxRjMw+NgL7/Tg/0rzd3po3ZEjBF0pf9dzo/UiG8kbuh+C8p1PLWkUwQHt8fmeYomOduzTlLBPDJhA78bfU7SEsus/jqOQj8kdcTgpvahed+6DeHgCr4OR2nejMWny2GqSuGbxcUtudrMi2MJzz5AGPYFgBV2JyJgDb/CsD7ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193138; c=relaxed/simple;
	bh=TAQMihxyh1v7M2T8LxF07q3AKpRNN3i+Y9MoOMeL/5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWHlD3wuyA93XUBbNzpvSCp3nEl9Gd977eniDw8rZwWKm3LPYm14f3zoNoPyL/1h2nujbxDS19nHlnfVzF6lkPLnjadsokaeHTdSfd5yUIcZFpzwnIZdHIDMRoyJMkRUYY6cJbh5u+0zhyyBn9PokShc49qw4kBUsybYDWQINxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvXpgN8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9339EC2BCB3;
	Tue, 19 May 2026 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193137;
	bh=TAQMihxyh1v7M2T8LxF07q3AKpRNN3i+Y9MoOMeL/5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvXpgN8S2a8a2MxCXy3mOz2nlrj5dXKaRaH2ZHqXoKvbIXsUXivCFPDPaC/j1OGYu
	 0rM2P5hjTIz+JctPYEfD5ZD5oKf6Su4ykQPe3o86+ylrJJ0cdVxpd6fpweABtXabII
	 hPhJvLeuAMlCiHtrOp3/heGHb/eYwIJgCQ4u7lE2UrVWG7QEU/NGfTZ00c4eEhUChZ
	 M9WSXc5E7ml/E4GU8RxhEilocIas62uMagp1yrAwd9g9MvvL9QlGaJmx/jcUiwF/Vy
	 BBzzKZ9PxXLJafZlkHrAXlGBbhCKwiJUulRvxR7OFynA0mtDIxV8ROXFqHGIcvzvKt
	 wsQcpfunfiZSA==
Date: Tue, 19 May 2026 13:18:53 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Adam Young <admiyo@os.amperecomputing.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Huisong Li <lihuisong@huawei.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] mailbox/pcc.c move shmem unmap to teardown
Message-ID: <20260519-annoying-athletic-mustang-cf3f02@sudeepholla>
References: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14326-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,huawei.com,vger.kernel.org,roeck-us.net,samsung.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 328F757EB19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 12:10:01PM -0400, Adam Young wrote:
> If the mailbox IRQ and shmems are not cleaned up atomically there is a
> race condition. If the shmem is torn down while the IRQ is active, a late
> interrupt can trigger a write to un-mapped memory.
> If the shmem is torn down after the IRQ, and another thread requests the
> channel again, we can end up with a channel that has had its shmem
> unmapped.
> 
> By moving the unmap to the teardown process, we can let the mailbox
> mechanism prevent re-entrance into the startup/teardown functions.
> 

The startup-failure path now pass NULL to iounmap() in
pcc_mbox_request_channel().

__mbox_bind_client() calls mbox_free_channel() before returning an error when
->startup() fails:

With this change, that mbox_free_channel() reaches pcc_shutdown() and clears
pcc_mchan->shmem.  Control then returns to pcc_mbox_request_channel(), which
still unconditionally calls iounmap(pcc_mchan->shmem) in the error path.

The startup and shutdown calls are symmetrical and similarly the
mbox_request and mbox_free. This change is removing that balance.

NACK from me.

-- 
Regards,
Sudeep

