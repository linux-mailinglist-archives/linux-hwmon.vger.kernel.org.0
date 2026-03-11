Return-Path: <linux-hwmon+bounces-12302-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A++ExJTsWn8tgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-12302-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Mar 2026 12:33:38 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B3262EF1
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Mar 2026 12:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98A7930398EB
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Mar 2026 11:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F573DDDAF;
	Wed, 11 Mar 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPXgoORF"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD453B47FB;
	Wed, 11 Mar 2026 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228812; cv=none; b=CDsCxA/zPQfvVwnUoJJRHiW3ibuK5k87aJqsCsqS6L6be3JztUEI2DYPb0IYqe91qkEAzR0+6LEiXjveDK7bMW26cEDYxlMpmY9OCqHY52rk6kpS67HKY5QZ6x+a3p9h10DQ6rSI7YoIGxPgwymBl9xiEOjrTioZEysGYKkcoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228812; c=relaxed/simple;
	bh=7ax8f8Z2suiY/ClnmYcNqzxiW1dr6PEtqi/ot5nvoOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kCHx5Vnhk/Au/pQQFKeYLClI2adRPQ87wrITwppJJxFrpT/rvXxNwMdyJ4vg577K8hhgh2soDl5ISLB234VcJQTTfQZ3QQ+iXEY8L3pWqWq4RnKQjQcgcW0/3WH62dLNf3rxkcaHR0lRFkPFcvxMWmmemAiAczG1JrlbNGCtI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPXgoORF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B8EC116C6;
	Wed, 11 Mar 2026 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773228811;
	bh=7ax8f8Z2suiY/ClnmYcNqzxiW1dr6PEtqi/ot5nvoOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GPXgoORFGrta/iwANuGICTrla35yAQ1ga0gDJllpRjNU4SsJDhgj0ZQUlJKdaFKSG
	 sxZsIg7qLtEx6QH/gdVk7mfsIwCSVcY/gmLqkHE1h6c7mdl5WYFOANsx21Nk0K31bY
	 GgdSoV6nl8fgV5pz+1cm4WIiVoeUVoKH9PUNJtrOqCXQwpGR01JIahBAhnrBHZjS6w
	 RIi9ZL6i4b7TJYMjCujXLxjPzoDP8Mh0BfRGpkBtcLRGoQGGv0PN45g9u6oRykW8GE
	 TDoSHY4KQEXPfUI1ZarqtsXY/0u1h9TCSPuFVON6Mee6/N0yrOjMNK+f9pv532od90
	 ESlo6scDTsnCw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Remove the Kontron SMARC-sAM67 board
Message-Id: <177322880885.2191403.16034538452371689446.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 11:33:28 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: EF1B3262EF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12302-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Mon, 02 Mar 2026 13:24:45 +0100, Michael Walle wrote:
> I was informed two weeks ago that this product is discontinued
> (without being ever released to the market). Unfortunately, this
> collided with the merge window and I had to wait two more weeks.
> 
> Pull the plug and let's not waste any more maintainers time.
> 
> On the bright side, the board upstreaming brought some driver fixes,
> too. I'm really sorry for any wasted time.
> 
> [...]

Applied, thanks!

[5/7] dt-bindings: nvmem: sl28cpld: Drop sa67mcu compatible
      commit: b7ad72258857a3afa0e116b26d0d3ff6ef42ba94

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


