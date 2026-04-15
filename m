Return-Path: <linux-hwmon+bounces-13291-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGwDO8EK4Gn2bwAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13291-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 00:01:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AC4085DE
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 00:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4784830D63AC
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Apr 2026 22:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A81329C57;
	Wed, 15 Apr 2026 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p2uQsoMN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3051283FEA;
	Wed, 15 Apr 2026 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290456; cv=none; b=sjovDQ/nC4y6CvoD52nBhGiSEw3Vd9SwtYLLYFdOYeLIr6knX9Yl7MeVCWEZAYgcaeznhO/owo21aO1jaFmJO+DAUO69+Mg2Ph41UHTMgZW3325hazOvYKHZknI9dhPW4oosGKTNA0vH+97C9vOA6Hlu8nRzQbYDfVm/utI4H+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290456; c=relaxed/simple;
	bh=4/Y27tOl3fcRv2xgd+hOkjGanTTiRljHkCNwG4wPZNI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MEZudmbZ1hYHYnUCb9dG7mJiiWor5s3RMVsDGYyl+EMO1uwbFVunerJ/0kh9j2cmsOLqK1ypdDYChTn5sGR8vkPK/RKQ1JgFtcpX0tcJ+WtJEJJjSJGPn2IOrGDyh3na7xZbmkbjNrMF4fxGeCkPUb54es0qjmf5dxoCrL5JI+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p2uQsoMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A24BC2BCB3;
	Wed, 15 Apr 2026 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290456;
	bh=4/Y27tOl3fcRv2xgd+hOkjGanTTiRljHkCNwG4wPZNI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p2uQsoMNTAsZcU/yENaGu6koVg1WqG97HMWGRmes6HfiUUgAmFVA8GnAt8w3/pYY9
	 N56zyeZpw5frRmxWKC0ELYuj0MU07bOnn2yZg4UmrMACWEZeuvCLWcdXHhJghaQKLD
	 k7f97CNH3DUr19Z8ayjei9ZWol1Ns/EU6XkcQJivM0iGm2EZAiNjOBpMeeOrOe3hed
	 Mip4Q7gqLA658E8PKE/05MRBq6wehx866f7r5cJvMInRdRoW+DDiu/7QZqOygVrX8S
	 mh5nImq2J94nrgdbEScc9RrOTtdkBRkOsqxULa1F0JkdX4Boqr3bMkGlo5XKCcPhhi
	 GTPS/MLyInTgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2E3A7380A964;
	Wed, 15 Apr 2026 22:00:27 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon updates for v7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260412214518.254887-1-linux@roeck-us.net>
References: <20260412214518.254887-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260412214518.254887-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1
X-PR-Tracked-Commit-Id: fb447217c59a13b2fff22d94de2498c185cd9032
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46576fa32908043975471bd26fe833a7d8015b35
Message-Id: <177629042582.2457809.10064604207878492586.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 22:00:25 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13291-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org]
X-Rspamd-Queue-Id: 704AC4085DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 12 Apr 2026 14:45:16 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46576fa32908043975471bd26fe833a7d8015b35

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

