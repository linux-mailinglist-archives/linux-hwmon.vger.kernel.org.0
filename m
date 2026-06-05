Return-Path: <linux-hwmon+bounces-14743-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id liuJMRKaImoaawEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14743-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 11:42:42 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA9646F64
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 11:42:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XWHeFVne;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14743-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14743-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E87D317065F
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 09:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A349413637;
	Fri,  5 Jun 2026 09:19:02 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0563A413631;
	Fri,  5 Jun 2026 09:19:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651142; cv=none; b=bx+gZTlzzArVlULboM6m3tOu0260dM5M2DgvARQikGTXOujE+vdgx966bTMOuKX8iv0lhAH10GWYzIKtUooIiwu0H9LZuMQi2p0YoWqFbPpxRvWoi/E8qPfi/HM2CuY9BUTbPfZukYa676UqsAqrDLLmL8es3sM6u/zFjeK3bLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651142; c=relaxed/simple;
	bh=9MTYUwEhMlMeKxKYqDQjmJjoP+yc3vdCAPSCyMoXEe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M20lttsEFS4Wd73iY1KVPj3wER001O3sq7MbddCOuRQjZozn8L5XEOutTIV1NY7DiaAljk6vzKCbOpW3VloZRo3pccNUwcBJU7ZGstdEtBqaUX3LkROHDTdd4iWVo1bV4FpfkzLuiq54tqNrQAKycfZ342XnFyuWdZNnLzU+vCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWHeFVne; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B650A1F00893;
	Fri,  5 Jun 2026 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780651140;
	bh=dBTHQIFlG9MUvtqZXQks2hh60dfS5WjSfNsBJh90OGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XWHeFVneXA7rzW4sKycEYTkxgXWaWAG/2msrzRw8esPKurEZWt63sAfRaJyRz2pQ5
	 gToa6tTxyyoJ8kaBCjUK0oEdGeYNo5BJkc+5BYApgF6WNmpbFOzaBUSrNMevFbs39w
	 NHwpC2br/DR4TV1a5hksqVx717PLzNKxo4umbdRqiUEMruEz+2IRBBMIOYwKMPlH52
	 CBxSMx31vsi2DBY/Gq6gojE5jV7xXg7kAC8lewZL/EqtUfqXR85AEY3QZ7RQ5T15IS
	 oieh3Jg3W5F179W76p0WnoTHZrLbry/OxNi7zdDX/SINkaq/912u/v/GScfOzWV73y
	 +IH8hMqJVMyfQ==
Date: Fri, 5 Jun 2026 11:18:50 +0200
From: Ingo Molnar <mingo@kernel.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-perf-users@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 0/8] x86/msr: Drop 32-bit variants of *_on_cpu() MSR
 functions
Message-ID: <aiKUenaT9VD0DrpW@gmail.com>
References: <20260605070826.2995913-1-jgross@suse.com>
 <aiKRbRHyDCjmqvGB@gmail.com>
 <a477aefe-e1c8-4652-b263-86c4cce09eba@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a477aefe-e1c8-4652-b263-86c4cce09eba@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-edac@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:tony.luck@intel.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:linux@roeck-us.net,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:ray.huang@amd.com,m:mario.limonciello@amd.com,m:perry.yuan@amd.com,m:kprateek.nayak@amd.com,m:srinivas.pandruvada@linux.intel.com,m:lenb@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mingo@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	TAGGED_FROM(0.00)[bounces-14743-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41FA9646F64


* Jürgen Groß <jgross@suse.com> wrote:

> On 05.06.26 11:05, Ingo Molnar wrote:
> > 
> > * Juergen Gross <jgross@suse.com> wrote:
> > 
> > > Drop the variants using 2 32-bit values instead of a single 64-bit one
> > > of the *_on_cpu() MSR access functions.
> > > 
> > > Juergen Gross (8):
> > >    x86/msr: Switch rdmsr_on_cpu() to return a 64-bit quantity
> > >    x86/msr: Switch all callers of rdmsrq_on_cpu() to use rdmsr_on_cpu()
> > >    x86/msr: Switch wrmsr_on_cpu() to use a 64-bit quantity
> > >    x86/msr: Switch all callers of wrmsrq_on_cpu() to use wrmsr_on_cpu()
> > >    x86/msr: Switch rdmsr_safe_on_cpu() to return a 64-bit quantity
> > >    x86/msr: Switch all callers of rdmsrq_safe_on_cpu() to use rdmsr_safe_on_cpu()
> > >    x86/msr: Switch wrmsr_safe_on_cpu() to use a 64-bit quantity
> > >    x86/msr: Switch all callers of wrmsrq_safe_on_cpu() to use  wrmsr_safe_on_cpu()
> > 
> > To sum up my review feedback for the invididual patches, we want
> > to do this instead:
> > 
> >    x86/msr: Convert rdmsrl_on_cpu() users to rdmsrq_on_cpu()
> >    x86/msr: Drop the rdmsrl_on_cpu() alias to rdmsrq_on_cpu()
> > 
> >    x86/msr: Switch all callers of rdmsr_on_cpu() to use rdmsrq_on_cpu()
> >    x86/msr: Remove the unused rdmsr_on_cpu() API
> > 
> >    x86/msr: Switch all callers of wrmsr_on_cpu() to use wrmsrq_on_cpu()
> >    x86/msr: Remove unused wrmsr_on_cpu() API
> > 
> >    x86/msr: Switch all callers of rdmsr_safe_on_cpu() to use rdmsrq_safe_on_cpu()
> >    x86/msr: Remove unused rdmsr_safe_on_cpu() API
> > 
> >    x86/msr: Switch all callers of wrmsr_safe_on_cpu() to use wrmsrq_safe_on_cpu()
> >    x86/mrs: Remove unused wrmsrq_safe_on_cpu() API
> > 
> > Note how there's no "conversion" of the 32-bit API itself in this
> > approach, we just do a straightforward migration of the users to
> > the already existing 64-bit APIs, then remove any unused APIs.
> 
> Fine with me, but I just wanted to get rid of the "q" and "l" suffices
> completely, as they serve no special purpose after dropping all other
> variants.
> 
> OTOH if wanted such a switch could be done later easily.

Well, we had a similar discussion back when we standardized on
rdmsrq() and wrmsrq(), and we use them as our primary 64-bit
MSR handling APIs. Why have a different pattern in any of the
derived APIs? It should really use the same conceptual namespace,
not some confusing mixture of two naming schemes.

Thanks,

	Ingo

