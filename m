Return-Path: <linux-hwmon+bounces-12211-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CG9jBw+ErGlUqQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-12211-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 07 Mar 2026 21:01:19 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8A22D73C
	for <lists+linux-hwmon@lfdr.de>; Sat, 07 Mar 2026 21:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E2CB3030EFD
	for <lists+linux-hwmon@lfdr.de>; Sat,  7 Mar 2026 20:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51CE37B40E;
	Sat,  7 Mar 2026 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+T/nnq6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221B37B024;
	Sat,  7 Mar 2026 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913643; cv=none; b=tELU4Spj0/T1fGv5gw3no4kL6n9AoIhA81KnmaKgeDzbMv3X3Y5e/BCHEI40JQLk7ZaG36HWyPlrs0M8vVjV2q4mnglZcv15ocmvirqWcYHzGcvhLKnIKnrQGTA2pDoEgTAyXzFzE8qsqfpm2a5GB2KD11dw1ZWF5JUQ6UApmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913643; c=relaxed/simple;
	bh=oQ4Ma5/JdeluFdPUWVfZqE/6SnjZiK1jiVMe10s5/tg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QpKObjS7wc/GolJ3FtsuznN5cOZqDfUXMVeTz3wvXb4B3I8iJ37pmHmOL1FO7cAS1G7cRyX0RzXGHvT8LpfQsfAAM785aJVhI+cySkkc/945Vvq4hJQZgQgs0SK+Dwf4Y2bOiMt8oNfYfBffXCNjHH3GS31mvT7ceBZ6YDWPRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+T/nnq6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8B1C19422;
	Sat,  7 Mar 2026 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772913643;
	bh=oQ4Ma5/JdeluFdPUWVfZqE/6SnjZiK1jiVMe10s5/tg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=R+T/nnq6Rm4S6+bUjW8IB7J1R0IQ2FqMJE9XmxgTWnzKnCWfB0znwqgVSCNtKdbt0
	 d+yOJ/dlfI+smkp2WxYcMIM/oUTR4BHDPhYCpgSF7M0iJcfVHh1VznSoKeunO2Q1WZ
	 sFIIag0ui05B36c3WiT8kjtAkZEn9PgJ6vbw8x4QhpGaHyAIwqO8TfGyVYUOo5kDid
	 3gwm5IPLgFA6/0n01Gsac9rhyKkNVyLwuEdCJ6BUO1xpZCdD3LB2AdDQLT3yaIwiK3
	 oBedC0kCzCCZ7ZAZbIj0UF0OAzERByJDLbLh9HZl3nD0leycyRfgQBx1YIbrQ8ZpOa
	 A78C3bbRVnUyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F273808200;
	Sat,  7 Mar 2026 20:00:43 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260307114320.1638058-1-linux@roeck-us.net>
References: <20260307114320.1638058-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260307114320.1638058-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc3
X-PR-Tracked-Commit-Id: 25dd70a03b1f5f3aa71e1a5091ecd9cd2a13ee43
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b6e48df8892e1f128473e6971b3b8b24eb39f4b
Message-Id: <177291364196.308260.15020464153907929146.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 20:00:41 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: ACA8A22D73C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-12211-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Sat,  7 Mar 2026 03:43:20 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b6e48df8892e1f128473e6971b3b8b24eb39f4b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

