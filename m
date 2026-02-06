Return-Path: <linux-hwmon+bounces-11613-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKEgFYGAhWlmCgQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11613-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 06 Feb 2026 06:47:45 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F01FA709
	for <lists+linux-hwmon@lfdr.de>; Fri, 06 Feb 2026 06:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C4A3300D4F7
	for <lists+linux-hwmon@lfdr.de>; Fri,  6 Feb 2026 05:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580B22E9EDA;
	Fri,  6 Feb 2026 05:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7nr4AcS"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354512E973F;
	Fri,  6 Feb 2026 05:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770356801; cv=none; b=mgWOPKg3obHzQwauoIlS9n+xNfmvfFdL4Jodt43zL8lwihCsN0wK/NnTpHUrIU79K/JNmOvCUEZ5jtqnFAlPMNXrC75w968Ucd6f+sJ/Ahje4pxRF8xQVUvoIo/M7LVquASE+yHId0ntceVYIGjkCGiAMPgqu1ph9Mt9jRwlolo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770356801; c=relaxed/simple;
	bh=Ej1S2J8LLPya1TN6qj+WnHQgjFX/QdK5VChhjNDIihY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tGQ82mRYU5nkrXp08MmfXj8hCRL7Olvac3ZgP/mtIll259xN7WSsc6T7lrzfEij7H+i7b/kgTrId9U+GAshFTpLarurX6AhMmO+TwYZAf2PJIbh9OlU2bZLST1KfO2wE9hlXO0uAh0MJ/dsCKdzn9YEXnYG/TZ0Qx5EIbwoBdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7nr4AcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9686C116C6;
	Fri,  6 Feb 2026 05:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770356800;
	bh=Ej1S2J8LLPya1TN6qj+WnHQgjFX/QdK5VChhjNDIihY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=E7nr4AcSiDVkROC51nnAcdb+N5AfysabhaJNWL7aZlpurJfNVGblwI0X8lnYJtUIj
	 7m5O21opWgP3ATl+MtsrM8nCEq6GLTwjtrayxeYVXOot6pMimrb4/X5cXFpyoj30rp
	 vCXbGn40nBXqq3uIIDB87mBOJXcJsnwRqE0JsdNyNqfusOLq28KUfcrCZsrRG3NcBW
	 5pkexreZ3i8usOO5Esu3Il2wxVoiUso6cMA3Qt9l8fXd703zRNHXYqvMFUG16KkX7N
	 P3pF7Rupf3tlJeJJsbx9YUs4MsJl14AhufPWrWYub5+cLpRUbWxMEBxB1jXDL9L7uN
	 ZYHrlwqLH4PMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 852F93808200;
	Fri,  6 Feb 2026 05:46:39 +0000 (UTC)
Subject: Re: [GIT PULL] hwmon fixes for v6.19-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260206025449.3098124-1-linux@roeck-us.net>
References: <20260206025449.3098124-1-linux@roeck-us.net>
X-PR-Tracked-List-Id: <linux-hwmon.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260206025449.3098124-1-linux@roeck-us.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-final
X-PR-Tracked-Commit-Id: 831a2b27914cc880130ffe8fb8d1e65a5324d07f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7ff7151e653aa296ab6c5495b2c1ab7c21eb250
Message-Id: <177035679808.699553.10011556149320464492.pr-tracker-bot@kernel.org>
Date: Fri, 06 Feb 2026 05:46:38 +0000
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11613-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-hwmon@vger.kernel.org]
X-Rspamd-Queue-Id: 65F01FA709
X-Rspamd-Action: no action

The pull request you sent on Thu,  5 Feb 2026 18:54:49 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7ff7151e653aa296ab6c5495b2c1ab7c21eb250

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

