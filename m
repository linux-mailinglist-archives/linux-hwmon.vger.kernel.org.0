Return-Path: <linux-hwmon+bounces-14745-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vuFKIGGeImo7bAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14745-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 12:01:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14625647220
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 12:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ItxuLAe9;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14745-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14745-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7A0C3044C2A
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4393E3151;
	Fri,  5 Jun 2026 09:54:35 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D123C146588;
	Fri,  5 Jun 2026 09:54:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653274; cv=none; b=jZTQWj8mqi2OimTM34he3PoeKjGyT2owrupmSWN+Epmjcxyesk209vrCNi0rMkyzGIW7JKDfhFFX1ul5J8zQ3dSFXbyCi08uD/paMnFtwp6GhMnxpEwzbXh4uR6K21M8kxSfgGb9rsW6UPC5WRoOaonT4R9vsI9uuph63sk0f4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653274; c=relaxed/simple;
	bh=zsemo+nCnANnQh9AzY0tr1G4MASea6c3M4ybmMerCN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNw6hvuxhYwdKXiqs8SEjx1tC2l2jXUoASyF8+dVtQN7nPx8cuXgse7Mxoh6BGha0ORDGcjMk2tKG35z3+PVpVECV7SPxSza/gvoxRKrfpG1SJateZpt1BJPXftherVajI+aYaIOet4QK+sXDOvd+5IeWlkUD87v51UxTJjt/w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItxuLAe9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E011F00893;
	Fri,  5 Jun 2026 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780653273;
	bh=X0dOWmgUD1LSJK6kpD/WOVyas491n6hKvCdEV5X2dmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ItxuLAe9m6RzOhTLQPKP2060Vh0bFWjTmFMwCCIp5IZ0P8BcSr4ezt7ZSdyCDhz73
	 yc7GBg+BC/dnLgLFahp3/mge/TPdaz5YCqTfanzBenGg58GYr1IflgCw8s9LewwecG
	 PKc5QlZNrBIVGypQZA5pVBR5znWhsEfKQ2p3E8FEd6K6k95r+NwWMyfFAmVJ2AR7h9
	 Y82yYuP9E79tQ7YTMxQmpMBVtXGQMKRzFFxHN1EgK2PBpYeL/KpSA8ZMzL4x17LuWp
	 4Emwda9sOR39shGb62mCxhRHOOyfbDGvuDaX3lqUi0GeNlh21ay+gXS0WLQdkaarkF
	 mbcpMAvo7LtkA==
Date: Fri, 5 Jun 2026 11:54:23 +0200
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
Message-ID: <aiKcz6I8GO-TG8uq@gmail.com>
References: <20260605070826.2995913-1-jgross@suse.com>
 <aiKRbRHyDCjmqvGB@gmail.com>
 <a477aefe-e1c8-4652-b263-86c4cce09eba@suse.com>
 <aiKUenaT9VD0DrpW@gmail.com>
 <b7e799a6-1f1a-49ef-8aac-0d5fd4a06dc7@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7e799a6-1f1a-49ef-8aac-0d5fd4a06dc7@suse.com>
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
	TAGGED_FROM(0.00)[bounces-14745-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14625647220


* Jürgen Groß <jgross@suse.com> wrote:

> > Well, we had a similar discussion back when we standardized on
> > rdmsrq() and wrmsrq(), and we use them as our primary 64-bit
> > MSR handling APIs. Why have a different pattern in any of the
> > derived APIs? It should really use the same conceptual namespace,
> > not some confusing mixture of two naming schemes.
> 
> In the long run I'd like to do the same conversion for the rdmsr*() and
> wrmsr*() interfaces, too (so only offering and using the 64-bit variants).

Why? We had this discussion for the original MSR API namespace
cleanup a year ago, and decided to standardize on the rdmsrq()/wrmsrq()
namespace:

  c435e608cf59 x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'
  78255eb23973 x86/msr: Rename 'wrmsrl()' to 'wrmsrq()'
  6fe22abacd40 x86/msr: Rename 'rdmsrl_safe()' to 'rdmsrq_safe()'
  6fa17efe4544 x86/msr: Rename 'wrmsrl_safe()' to 'wrmsrq_safe()'
  5e404cb7ac4c x86/msr: Rename 'rdmsrl_safe_on_cpu()' to 'rdmsrq_safe_on_cpu()'
  27a23a544a55 x86/msr: Rename 'wrmsrl_safe_on_cpu()' to 'wrmsrq_safe_on_cpu()'
  d7484babd2c4 x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'
  c895ecdab2e4 x86/msr: Rename 'wrmsrl_on_cpu()' to 'wrmsrq_on_cpu()'
  ebe29309c4d2 x86/msr: Rename 'mce_rdmsrl()' to 'mce_rdmsrq()'
  8e44e83f57c3 x86/msr: Rename 'mce_wrmsrl()' to 'mce_wrmsrq()'
  e2b8af0c6939 x86/msr: Rename 'rdmsrl_amd_safe()' to 'rdmsrq_amd_safe()'
  604d15d15ebd x86/msr: Rename 'wrmsrl_amd_safe()' to 'wrmsrq_amd_safe()'
  7cbc2ba7c107 x86/msr: Rename 'native_wrmsrl()' to 'native_wrmsrq()'
  eef476f15c83 x86/msr: Rename 'wrmsrl_cstar()' to 'wrmsrq_cstar()'

There's several good reasons to use the 'q' suffix in the API names,
why relitigate this? :-)

Thanks,

	Ingo

