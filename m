Return-Path: <linux-hwmon+bounces-12611-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FBdJ1bZvmnZfgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-12611-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Mar 2026 18:45:58 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC82E6934
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Mar 2026 18:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B3D0300A313
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Mar 2026 17:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFF733BBCD;
	Sat, 21 Mar 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZACY42g"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B872FFDF8;
	Sat, 21 Mar 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774115151; cv=none; b=tXWmNc4PtnzRNfM48MC7Fx01/vmPYi9oo33Bhq0Q0+IBU+xdrgFQDpwcND8V4Aq5VKOWUsbCcOI5JBMC3TrGzMdx6Nu8ajtlEfhNGBtt9WGc7bCVi8wIjorQmZoJs0n8wa6b9zLKUX9OnzkncMOs1u0LlwuZu0USlz8KDXk6jTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774115151; c=relaxed/simple;
	bh=ezeyCkVSLtoowd1tIG9KvcdMxqJMUvSZNDMoDp3Jmgw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CHoIw9Ci7wG3/8Jp1rjQzawMb5SCcX5+K2U09TA5tyISG2iAbsu1BHK85/0gex4sZesxsYBu6OIqTlPsPNRtBfz/9enx8E0ML2gZdnoqXgtQFiO8qO3r0fGgk7VR+WKCAQuLqPwvtf7cKAujCj5IiAPJTgfq58p8J3wFyjt6NPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZACY42g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4FEC19421;
	Sat, 21 Mar 2026 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774115151;
	bh=ezeyCkVSLtoowd1tIG9KvcdMxqJMUvSZNDMoDp3Jmgw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iZACY42gPVBdRbA7mlOgpuIrc9zZ3bqH6rBYxFIiotWjQht+5ck0i6iFhA4owW/xf
	 W25dyylXPwW6nf1FuTQd1Rx/wxNh2fu4p8QZE1lFR/KtgbGwToPurpac/pPyzmiZ/F
	 ylhj3Z/ziXjWSx1AKO3QaKhYHXGkgeHObQlmZMgtZzIlECL+V1DnJOgS3mhsl9vPDe
	 elwTcWtcV24xrUDxotsmSxMpMWM0f5aE250COXlGg68h+PTAAR+p2tMc2IG8sTsqgO
	 svhHgaYEpvOmSytFVXEPvvyy972HiL6QGtP9aeMz97XknpS6CptQ8RMQZKv8KauU47
	 ctNWOCUA6uU7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D03A3808200;
	Sat, 21 Mar 2026 17:45:42 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for hwmon-for-v7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260321150037.1451623-1-linux@roeck-us.net>
References: <20260321150037.1451623-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260321150037.1451623-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc5
X-PR-Tracked-Commit-Id: e7bae9a7a5e1251ab414291f4e9304d702bb9221
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f
Message-Id: <177411514122.2921174.14915789037109320779.pr-tracker-bot@kernel.org>
Date: Sat, 21 Mar 2026 17:45:41 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-12611-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44BC82E6934
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sat, 21 Mar 2026 08:00:37 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/113ae7b4decc6c2d95bdbbe52e615a0137ef7f9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

