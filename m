Return-Path: <linux-hwmon+bounces-14734-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UwrcC353ImqZXwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14734-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 09:15:10 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2C645D70
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 09:15:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iKjYggke;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iKjYggke;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14734-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14734-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DDF6302653E
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 07:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0916A44CAE6;
	Fri,  5 Jun 2026 07:08:33 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE93AEF2E
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 07:08:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643312; cv=none; b=Uy9eIOnT/bPQPlmy40ZeI9ypBxdGhPtQEffiFscWESW/fFzznHLtJfULT10C75Y6TvJszKSmq3/eDUkfWwRTpSRh3/3NbQ/M8w1TApo+XPXkNVk3KzC/Tcc84FORwLEuxUnE55TfwgIu3IG3mEmCDqZWue2kCrclpXKZT8+JAhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643312; c=relaxed/simple;
	bh=4hvsRn9Kp2CzHPwth+eNDSeQOsWa/Ckcpaciuv5v3HU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RFgkN2/fqiVi7R/GSKfhJaBB718f173Mdi/N9gy8BQxcwPb7OgCh8cjh7mShhO9PZMn7qYt8lfLOmKRG0oyDLs6JZD8FiivAa9IClz9NyMTfP7xOJyuLMD/SZu9mNRgs1NkjAPLer4qX0M1pGxlnYJ/eo9o/RtKBmSbNflYsxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=iKjYggke; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=iKjYggke; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D92917593A;
	Fri,  5 Jun 2026 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780643309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WN+1EqgKbEGm+Jlqz5BJMqJKAPMrZfGWpmYbaOaSum4=;
	b=iKjYggkeyd0GZUzAqkFLB4pGtPXBaZx1IpDKUVmqabC2LXYHwd8cAz/lMSJhTNLRDz9g8g
	WTjB7GUVsJ+bh6Z/izkQLAcxuwkp0XFoNejvkxa6k1y17q+fOyPepOPVR7+PK5t/W5JQy3
	ZOdYdIo1fEJ6ZuGbWmbYAdHMt3mUxH8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780643309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=WN+1EqgKbEGm+Jlqz5BJMqJKAPMrZfGWpmYbaOaSum4=;
	b=iKjYggkeyd0GZUzAqkFLB4pGtPXBaZx1IpDKUVmqabC2LXYHwd8cAz/lMSJhTNLRDz9g8g
	WTjB7GUVsJ+bh6Z/izkQLAcxuwkp0XFoNejvkxa6k1y17q+fOyPepOPVR7+PK5t/W5JQy3
	ZOdYdIo1fEJ6ZuGbWmbYAdHMt3mUxH8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 142B2779A8;
	Fri,  5 Jun 2026 07:08:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5/G9A+11ImqDHQAAD6G6ig
	(envelope-from <jgross@suse.com>); Fri, 05 Jun 2026 07:08:29 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
	James Clark <james.clark@linaro.org>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/8] x86/msr: Drop 32-bit variants of *_on_cpu() MSR functions
Date: Fri,  5 Jun 2026 09:08:18 +0200
Message-ID: <20260605070826.2995913-1-jgross@suse.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14734-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-edac@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:jgross@suse.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:tony.luck@intel.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:linux@roeck-us.net,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:jolsa@kernel.org,m:irogers@google.com,m:adrian.hunter@intel.com,m:james.clark@linaro.org,m:ray.huang@amd.com,m:mario.limonciello@amd.com,m:perry.yuan@amd.com,m:kprateek.nayak@amd.com,m:srinivas.pandruvada@linux.intel.com,m:lenb@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[jgross@suse.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:mid,suse.com:from_mime,suse.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36A2C645D70

Drop the variants using 2 32-bit values instead of a single 64-bit one
of the *_on_cpu() MSR access functions.

Juergen Gross (8):
  x86/msr: Switch rdmsr_on_cpu() to return a 64-bit quantity
  x86/msr: Switch all callers of rdmsrq_on_cpu() to use rdmsr_on_cpu()
  x86/msr: Switch wrmsr_on_cpu() to use a 64-bit quantity
  x86/msr: Switch all callers of wrmsrq_on_cpu() to use wrmsr_on_cpu()
  x86/msr: Switch rdmsr_safe_on_cpu() to return a 64-bit quantity
  x86/msr: Switch all callers of rdmsrq_safe_on_cpu() to use
    rdmsr_safe_on_cpu()
  x86/msr: Switch wrmsr_safe_on_cpu() to use a 64-bit quantity
  x86/msr: Switch all callers of wrmsrq_safe_on_cpu() to use
    wrmsr_safe_on_cpu()

 arch/x86/events/intel/ds.c                    | 11 +--
 arch/x86/events/intel/pt.c                    |  2 +-
 arch/x86/events/intel/uncore_discovery.c      |  2 +-
 arch/x86/events/intel/uncore_snbep.c          |  2 +-
 arch/x86/include/asm/msr.h                    | 44 +++--------
 arch/x86/kernel/acpi/cppc.c                   |  8 +-
 arch/x86/kernel/cpu/intel_epb.c               |  8 +-
 arch/x86/kernel/cpu/mce/amd.c                 |  6 +-
 arch/x86/kernel/cpu/mce/inject.c              | 12 +--
 arch/x86/kernel/cpu/microcode/intel.c         |  2 +-
 arch/x86/kernel/msr.c                         |  8 +-
 arch/x86/lib/msr-smp.c                        | 79 ++-----------------
 drivers/cpufreq/acpi-cpufreq.c                |  4 +-
 drivers/cpufreq/amd-pstate-ut.c               |  2 +-
 drivers/cpufreq/amd-pstate.c                  | 21 +++--
 drivers/cpufreq/amd_freq_sensitivity.c        |  4 +-
 drivers/cpufreq/intel_pstate.c                | 64 +++++++--------
 drivers/cpufreq/p4-clockmod.c                 | 32 ++++----
 drivers/cpufreq/speedstep-centrino.c          | 27 ++++---
 drivers/hwmon/coretemp.c                      | 44 +++++------
 drivers/hwmon/via-cputemp.c                   | 16 ++--
 drivers/platform/x86/amd/hfi/hfi.c            |  4 +-
 .../intel/speed_select_if/isst_if_common.c    | 13 ++-
 .../intel/uncore-frequency/uncore-frequency.c | 12 +--
 drivers/powercap/intel_rapl_msr.c             |  2 +-
 drivers/thermal/intel/intel_tcc.c             | 43 +++++-----
 drivers/thermal/intel/x86_pkg_temp_thermal.c  | 22 +++---
 27 files changed, 203 insertions(+), 291 deletions(-)

-- 
2.54.0


