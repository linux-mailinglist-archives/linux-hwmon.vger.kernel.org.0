Return-Path: <linux-hwmon+bounces-15115-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7EbdCqm4MGp1WgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15115-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 04:44:57 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7887768B878
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 04:44:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kpt//OOo";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15115-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15115-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E2A53031034
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 02:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7592E3C1090;
	Tue, 16 Jun 2026 02:44:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D931FC7FB;
	Tue, 16 Jun 2026 02:44:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781577894; cv=none; b=O33q5Z5gOHkc/z4ioQ4ISAFMKZUmk7T68LMFdq6GigAo6B3aDWaqwy5eG/DCD4F5nYMsk+SZMjDxcM6y7ghO1jL9J6foCzWL+eRWXiRFoYjZqHDMWnoDd7veBZMASZ0EDLIlxRG7bLoBSJIRr7pAimup1RsaKNbjSjIqnki3/iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781577894; c=relaxed/simple;
	bh=xP6lAeeAz1EMGsbdlg8MTcBOPhIUACzWftzMgaWfwb0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fBgYpZt2ZTK2TqGnNRGyzZzP8iBBZCmE9VwIDCWmmNRuGolfxEoNMoNMyOQOF7rJ1Sd/1BE+wu7L+/nvl10lBBS98Gk/8ExAoHtxZb8ORx18Fmwcx2eAaCrLQF2BvOV88yiFj8ruJim2w/ylvMKgdUU6FWnonXXXKC22aGLtc6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpt//OOo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E461F000E9;
	Tue, 16 Jun 2026 02:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781577893;
	bh=7LGh55buG7rE7xkxObgIDfjUwVIQqBS1LQc79/0vpTQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kpt//OOoDqvhMRP5HADpYMcZfAlJvKlSYCVkCD8dJvbGGd1gTfwSiU4WK7Qy3r1/q
	 HiE5NEY5+lFShr5hzLcjiKiPkcOPrYJeJj4fQVAvszxp5Vn73OfWeVA1Ij8Wb9RqUw
	 KhU1TwBUmm6LuIkH8fhZEHyOISSUJSIgUZTeC/IYbfFk1GVTOMNVujoluqZ+gdGR98
	 XnvCRRlkavYa6db1s1wHy0V33eqRRa2uQ5vGI5Td270d0ngCrptEdT8QxIDQ2ZvqJL
	 16DPuFMNNREWF65BWpAEwkmsuUUHYZTk72dtQQbum08Ck6pQGgDpFlysl5y61MWohk
	 glF2aCMo170Rg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B093839A26;
	Tue, 16 Jun 2026 02:44:49 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260615155926.1959207-1-linux@roeck-us.net>
References: <20260615155926.1959207-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260615155926.1959207-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2
X-PR-Tracked-Commit-Id: 9955c92abe72564a49c293b1c15cd3b4f02ea6a0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc2ce3ee106f2d53eb344f5c4963c897bbb21634
Message-Id: <178157788777.405554.11838850345851879021.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 02:44:47 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15115-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:torvalds@linux-foundation.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7887768B878

The pull request you sent on Mon, 15 Jun 2026 08:59:25 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc2ce3ee106f2d53eb344f5c4963c897bbb21634

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

