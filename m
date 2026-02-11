Return-Path: <linux-hwmon+bounces-11676-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOIxG5bmjGnquwAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11676-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Feb 2026 21:29:10 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B933127631
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Feb 2026 21:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F009302053D
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Feb 2026 20:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5846E357A3D;
	Wed, 11 Feb 2026 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsKH8RNs"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D483D76;
	Wed, 11 Feb 2026 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841683; cv=none; b=MXzCVPncqXDwv9UbVjvs1VzRKTRvjalSii1aJIrwaK0Xsc48x9mfoSHTAtGV2+APXV//jtOC3dAfTN0JN15xkuWpIBgfEQK4KBbAMRRlw+65BWZZqf6iXOCR0w+yaD76KPgi4/NgO8kO/ejnNmIuZBgbtLNwhMjyJYnN9CHl3t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841683; c=relaxed/simple;
	bh=2i9Sq3gDSBf+V7mYNp7gsQcUHc9/ibJ44j9YNydY9Lk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TjYg+XFg7fnAr8+wsWoM8P6aIcrqblFJUYo6PPmC9xV91MraLY2aTIXTxA874ob9zK2w7mvRCjewyY/eHVDSSImTBGK9nxstigh3FAEThAZSKiwktzlecQIN2awPAli6ShT4mz/W/bsO7T9BUmGTLndRUgHG+sMGiovpRSh3Jwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsKH8RNs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CAEC4CEF7;
	Wed, 11 Feb 2026 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841683;
	bh=2i9Sq3gDSBf+V7mYNp7gsQcUHc9/ibJ44j9YNydY9Lk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MsKH8RNsyQKpqrMs4TvY7OgKNiFznCFCxTPOxW9a3O+t+sb9GEbGRvQdImRJBbvW0
	 llizgufLnGH1lYx1NBtGlOYe0SaLTFK23Jyp93DqTcVHqGIBzzdR8JCr0UgcS/w5EO
	 52l2tVHgBzgZEzXYbsgqGQn+VwwKWVS3F7m558AhzyT9K7V1pNihzv+1a2GfQm+PnM
	 p75uoFyVHug84vkuZf4/S4KCyMtAW6HSUroAVg5SMmWjsJfx9vRpHa/y9fe+2BuZIe
	 cAt1+tIbLBPjkHX37yAbf/DaXcdRrZrjyIBk10a4/+ynFdfsDe3XVWfcrduFAP5ggF
	 arfQu/cvN7avA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B5D339EF964;
	Wed, 11 Feb 2026 20:27:59 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updated for hwmon-for-v7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260210153731.3719742-1-linux@roeck-us.net>
References: <20260210153731.3719742-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260210153731.3719742-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc1
X-PR-Tracked-Commit-Id: 9e33c1dba22431bea9b2bf48adf56859e52fc7ec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 532355a756103639816068b89f73cc7789b16275
Message-Id: <177084167763.710910.7857472580027017016.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:27:57 +0000
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11676-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B933127631
X-Rspamd-Action: no action

The pull request you sent on Tue, 10 Feb 2026 07:37:30 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/532355a756103639816068b89f73cc7789b16275

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

