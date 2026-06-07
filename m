Return-Path: <linux-hwmon+bounces-14801-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NB28BK8TJWrlDAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14801-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 08:46:07 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326864EF7A
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 08:46:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VtXSeHE+;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14801-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14801-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED6E4300E255
	for <lists+linux-hwmon@lfdr.de>; Sun,  7 Jun 2026 06:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10188282F26;
	Sun,  7 Jun 2026 06:46:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CBF507;
	Sun,  7 Jun 2026 06:46:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780814763; cv=none; b=JwoNzl7FL5rZE2qg62+ZFKSs9Q3UHis7EXcmKlKschRHC9POddVG856LzAhtknMwu3g/IJPRXAtydHWTBcxBgOshNobghUPkwn6Q+TMP2K0sz7lnUi0eadJDQjiJldvO2QfjLZtv7wyLs9SMOhGf9McLiWmryB+BcYxPJBqjSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780814763; c=relaxed/simple;
	bh=Sxt/qDs32fXU7cmEvoXiidbu3K9NKh+1N91D09w8spI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo2QbiMtbWI9nzXJy+CF6etOqIbrMikTA+cAJ9kEdWdE9V4oUO+eannSI4e/2uqE8FiUA2+9gO9yrhs0Lr0cPd6eL6vboOOr0NXSIMU+SKCK4Qt+1GwNt3SkbWDYnaJF4zHy8ugoZMAp7DUfarPmTjkIzS2iYWv0l/FV2iilwUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtXSeHE+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6811D1F00893;
	Sun,  7 Jun 2026 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780814761;
	bh=PApdoZfMW8oKRgZ8RFsBbTNxr2SOKJsmp4ERoMhWhVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VtXSeHE+nr+ehZXZFrCXNMboweHsAXDQctww4wPPtZ4Z1AcB2YAhSsq2V4Z5TRuzv
	 1iVaHYr7fZiHCgpwlJDvLq87Q/ujfNm38ZcatAUfmGnb9jfXsa2XnTuZRkfoSaZA57
	 240OzOlMStWHkkSoioNiT6mZ1WudNdOqLMDcU85gGPitI58Wuo+dwR9m45xSBHJRtn
	 CE5L1snKWuXevVbExlIYPtEFBLi6CxXs5HIgh8i/lxOG/QH2XtMmyWOyJwUkhYuJ8d
	 +rpreVd6EEFoAWYLOkK+30FFw0ugkdCMp4jz2ZJN6mFRYpzs4mZfCE1x/U4x6ZGQwr
	 U0tXrQm4+7ljQ==
Date: Sun, 7 Jun 2026 08:45:56 +0200
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v2 07/10] x86/msr: Switch rdmsr_safe_on_cpu() users to
 rdmsrq_safe_on_cpu()
Message-ID: <aiUTpBrQSQIDIS8c@gmail.com>
References: <20260605144314.3031049-1-jgross@suse.com>
 <20260605144314.3031049-8-jgross@suse.com>
 <aiPtnrkdHDHc0Iqz@gmail.com>
 <2db3e888-a675-474a-9d1a-bb9d9bb162bd@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2db3e888-a675-474a-9d1a-bb9d9bb162bd@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14801-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mingo@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-pm@vger.kernel.org,m:hpa@zytor.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:linux@roeck-us.net,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mingo@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6326864EF7A


* Jürgen Groß <jgross@suse.com> wrote:

> Okay, fine with me.
> 
> I'll send V3 after rc1 of 7.2 as Dave suggested.

Since these are really trivial with little value in postponing
them over a full cycle and generating conflicts, a -rc7 base
might work as well, as long as you send them in the next 1-2 days
or so. (Unless Dave feels strongly about the timing.)

> One final question (not directly for this series, but for a future one):
> 
> I'd like to switch rdmsrq() from a macro to an inline function, as a macro
> using one of its parameters as the destination for an assignment isn't
> nice.

So basically:

  - rdmsrq(MSR_CORE_PERF_GLOBAL_CTRL, ctrl);
  + ctrl = rdmsrq(MSR_CORE_PERF_GLOBAL_CTRL);

? Agreed with that.

> Additionally I'd like to replace rdmsr*() use cases with rdmsrq*()
> and wrmsr*() with wrmsrq*() (similar to the replacements done is this
> series).

Yeah.

> The rdmsrq() transformation into a function can easily be done via a
> coccinelle script. What would be your choice regarding the sequence doing
> this?
> 
> a) Start with rdmsrq() transformation into a function.
> b) First do the rdmsr/wrmsr -> rdmsrq/wrmsrq replacements, then do the
>    rdmsrq() transformation into a function (this will touch more code, as
>    the initial rdmsr() use cases will be affected, too).
> c) Leave rdmsrq() as a macro.

I'd prefer (b), because while it's technically a bit more work,
the flow is easier to review: the rdmsr/wrmsr replacements
basically do a:

  macro(u32, u32) =>> macro(u64)

replacement, while with (a) we do a:

  macro(u32, u32) => u64 = function()

replacement that is a bit more complex transformation and bit
harder to review/validate at a glance. So I think it's better
to do the two transformations separately.

Thanks,

	Ingo


