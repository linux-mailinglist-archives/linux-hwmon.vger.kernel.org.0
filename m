Return-Path: <linux-hwmon+bounces-14751-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mMdWFJThImr+egEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14751-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 16:47:48 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B911E648F7B
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 16:47:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Z6VtePlh;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Z6VtePlh;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14751-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14751-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A12AB300A537
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 14:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF5638A73A;
	Fri,  5 Jun 2026 14:43:26 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC73C4B77
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 14:43:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670606; cv=none; b=d11nG19AhqvcGEVpKEIIAzeXijhBLHUsR8M4z6r0Yi/kcF4Wjj5ZapyD0L6P+ochfM2UYkIs4rcKx9tFB+5WfTJ1twEQSfQ67y1k3th25KXAh4pyCn6B0BI3WWd4r2qKdCMCJufy1O0+DoEAyWtNnAcgooUX8urQpZ/NIITni2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670606; c=relaxed/simple;
	bh=JqbgTnbghYa1+fRv7NPNAXfW9K3kAyCUafNN0Cy4GTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McbB1tWmZAc9e/v4AKoBRTrbrhW+fiF+0IrQ3yUXD9HOKLiGNOjDYKz80IpJqWcOhF6lBTPc6xSIgVIKcBSB7qaG7qPfcrl0dX6JTDRTmjUPelktPyuAtiVUd275RCbsFymlOWf5G1Y9aT9LH6wxVvq7Hzsht+fKH5PaF2ZJ0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Z6VtePlh; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Z6VtePlh; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3EEA075994;
	Fri,  5 Jun 2026 14:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780670598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HpEOzfpzcjzuP0x4lxSBQMRU2YmRM4anktQcV8bpWBY=;
	b=Z6VtePlhr3n+CGOw77JXL7ecovNWHrwVnpWnqln7iXDvVvsb2E5V7l69oXNBNOIcbgWfJR
	WKssSG1wBKeCWHnV/U7kFE/V2rp1lse9tdbd18o49yDH8ul/X8T5+7/mIcCA8K4SNn3Q5q
	sV+f0+smO5b9SbavaiChS5d35Wz8YWk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780670598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HpEOzfpzcjzuP0x4lxSBQMRU2YmRM4anktQcV8bpWBY=;
	b=Z6VtePlhr3n+CGOw77JXL7ecovNWHrwVnpWnqln7iXDvVvsb2E5V7l69oXNBNOIcbgWfJR
	WKssSG1wBKeCWHnV/U7kFE/V2rp1lse9tdbd18o49yDH8ul/X8T5+7/mIcCA8K4SNn3Q5q
	sV+f0+smO5b9SbavaiChS5d35Wz8YWk=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86193779A8;
	Fri,  5 Jun 2026 14:43:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LLeIH4XgImrdWwAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 05 Jun 2026 14:43:17 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/10] x86/msr: Drop 32-bit variants of *_on_cpu() MSR functions
Date: Fri,  5 Jun 2026 16:43:04 +0200
Message-ID: <20260605144314.3031049-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14751-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:x86@kernel.org,m:linux-edac@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:jgross@suse.com,m:ray.huang@amd.com,m:mario.limonciello@amd.com,m:perry.yuan@amd.com,m:kprateek.nayak@amd.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:tony.luck@intel.com,m:linux@roeck-us.net,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_SENDER(0.00)[jgross@suse.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B911E648F7B

Drop the variants using 2 32-bit values instead of a single 64-bit one
of the *_on_cpu() MSR access functions.

Changes in V2:
- patches 1+2 split out from other patch
- keep the *q() variants instead of those without suffix

Juergen Gross (10):
  x86/msr: Switch rdmsrl_on_cpu() users to rdmsrq_on_cpu()
  x86/msr: Remove rdmsrl_on_cpu()
  x86/msr: Switch rdmsr_on_cpu() users to rdmsrq_on_cpu()
  x86/msr: Remove rdmsr_on_cpu()
  x86/msr: Switch wrmsr_on_cpu() users to wrmsrq_on_cpu()
  x86/msr: Remove wrmsr_on_cpu()
  x86/msr: Switch rdmsr_safe_on_cpu() users to rdmsrq_safe_on_cpu()
  x86/msr: Remove rdmsr_safe_on_cpu()
  x86/msr: Switch wrmsr_safe_on_cpu() users to wrmsrq_safe_on_cpu()
  x86/msr: Remove wrmsr_safe_on_cpu()

 arch/x86/events/intel/ds.c                   | 11 +--
 arch/x86/include/asm/msr.h                   | 28 +-----
 arch/x86/kernel/cpu/mce/amd.c                |  6 +-
 arch/x86/kernel/cpu/mce/inject.c             |  8 +-
 arch/x86/kernel/msr.c                        |  8 +-
 arch/x86/lib/msr-smp.c                       | 89 +++-----------------
 drivers/cpufreq/amd-pstate.c                 |  2 +-
 drivers/cpufreq/amd_freq_sensitivity.c       |  6 +-
 drivers/cpufreq/p4-clockmod.c                | 32 +++----
 drivers/cpufreq/speedstep-centrino.c         | 27 +++---
 drivers/hwmon/coretemp.c                     | 44 +++++-----
 drivers/hwmon/via-cputemp.c                  | 16 ++--
 drivers/thermal/intel/intel_tcc.c            | 43 +++++-----
 drivers/thermal/intel/x86_pkg_temp_thermal.c | 25 +++---
 14 files changed, 128 insertions(+), 217 deletions(-)

-- 
2.54.0


