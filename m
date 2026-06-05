Return-Path: <linux-hwmon+bounces-14738-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YerfNtqMImo2aAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14738-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 10:46:18 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B673646884
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 10:46:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hNwgOdSd;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14738-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14738-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5EFF3013866
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F2E494A00;
	Fri,  5 Jun 2026 08:46:09 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38573CD8CA;
	Fri,  5 Jun 2026 08:46:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649169; cv=none; b=jCnWpLxge1D658PnFEPk4CIw514Mvlxx5VKIhdGU/YKIzQuIcXH3cXckWlnsmLEc5DWhPrxQo1sihsVSK/sRgmy4gNJlTzECCepXxWq7iPV69zabEZLWmHxVGzcUHomZ3rYWi3gfyw9YCi2jsm395Jtj8/vvgyTYCzYgkbvlArs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649169; c=relaxed/simple;
	bh=Y/Yn5a+st7jcNKLOamu7hkvlg/hwC0dcEladNw/0TeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sciaKSg5vieONOcBcbGz+/KN8rd+zehVSZZlGbVwuCdFXnmxJfMWDuUOVvZ82Ix8mhf4E7RqlE7x5NGpkgFupR89fYBP/hUfGE+hF7L4nMsiWi5RWjBeJHglij7YeQIocquKjRUmKDXWoMiX5Jz7qdHHY5AhvM/WgKPp3pI2fEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNwgOdSd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488A01F00898;
	Fri,  5 Jun 2026 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780649167;
	bh=cfYjhL+ONZtAyMzZiKF/rHsqkuzOareTCLYQL96UjO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hNwgOdSdPkbbMmFUGIMDQ9okUGHjSGLtIF+NCJXnaOG/rkeJW2og+h0EZEzVV+sQJ
	 a6yJmSMspbgJxRMlhynFDhezZD6dQTaaQChT9//1N/GwfTgy9kWn4q7pumMJ2OgDcJ
	 Bfa1Ye+PWX0zpyf0sa+3pqfSM0BD2VzqVBhz9Cf9Pk+9sh7ZLpNfQZwl91Grl15i6k
	 94lZ1bg3AlvwrFG5NMG+qGlXzX0WrxJ0/VWfWy75iixadH09qNC31eszWtrfJMbDEW
	 UI8EoLfLz7hr1eS78bCH+GOtS6H8w5BcPL4au9QtK0XQWBVm/oj08IGJ4EqxsmHj+p
	 cksUom8VtuDCA==
Date: Fri, 5 Jun 2026 10:46:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 5/8] x86/msr: Switch rdmsr_safe_on_cpu() to return a
 64-bit quantity
Message-ID: <aiKMytZNGHj0epSn@gmail.com>
References: <20260605070826.2995913-1-jgross@suse.com>
 <20260605070826.2995913-6-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605070826.2995913-6-jgross@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-pm@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:linux@roeck-us.net,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mingo@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-14738-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mingo@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B673646884


* Juergen Gross <jgross@suse.com> wrote:

> In order to prepare retiring rdmsrq_safe_on_cpu() switch
> rdmsr_safe_on_cpu() to have the same interface as rdmsrq_safe_on_cpu().

Patch #1.

> Switch all rdmsr_safe_on_cpu() callers to use the new interface.

Patch #2.

Thanks,

	Ingo

