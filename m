Return-Path: <linux-hwmon+bounces-14153-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LAGlLeduB2ox3QIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14153-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 21:07:19 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251155697A
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 21:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 269163009F97
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 19:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A06386C30;
	Fri, 15 May 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS83HECS"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4F3E2AA4;
	Fri, 15 May 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872027; cv=none; b=I7N9Pd2HfiJqiCrHxfghN21Gnsf+B+jCBjeQ7nhLEX8G4i0MWhGV5doIVs++hhEp0xfyXpui5vJbhfwl49g54LW8xCP87OuHht0UEunB/y6Uz/k823+4uy0mrtg3jhWHxucq5ovMv7ZzSq4J2/MOo3hPa6WngotaXwlVOAj3Pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872027; c=relaxed/simple;
	bh=UCSgOFk/WDNB3yJPWIDDr0ElsDABRh5hBg/X+bFtSAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EsvfheB4SVzK6HMC82NjRmqkhsT6yLKSLMbNhCSYkaQB7nieff13FHwPJqTQQalCCfWobdxTWPmYkdzY1xYo3gt31+daBrTTdVbToFmKsKiImdTHsyLbBuRGokPXdfr/28yoDDZfWB6BV7WijNkYdDbgMdRWqlS0o++BkeL1zHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS83HECS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033BDC2BCB0;
	Fri, 15 May 2026 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778872027;
	bh=UCSgOFk/WDNB3yJPWIDDr0ElsDABRh5hBg/X+bFtSAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TS83HECSN6sNoqtBW6RbhrTTWDcbck71aDL7qDBJSZZcPnIH5mH3V+2PZN9zK6uZY
	 CZUBIwTfQ4ENVgKmOWq+mtQwKOyRLVEQZ2i3xkYIbC+fxiLjQs0D5G4c1xJSGAQw3j
	 Hq3UzOnGCQAx36SLrHuDa1k0QKXpSnUTRtjBAOu5UXmagKPrfkXzqS5H16Xaakj5li
	 /VUfXQDc2LbGlnKR8ZA6t3uKF1ETPj818nVwmNwyBWF0DMwhKyKohDGNcLTeCeAtGG
	 krFfFRAZPj4r9vOBgl2uwi55H3k22bL84CNfEE0z5c7clCaIz+p0YBQRuy9T0PnLdP
	 DBME6VyKDPsPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515160537.115808-7-o.rempel@pengutronix.de>
References: <20260515160537.115808-7-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Fri, 15 May 2026 19:07:01 +0000
Message-Id: <20260515190707.033BDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 3251155697A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:email,smtp.kernel.org:mid];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14153-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Action: no action

> Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
> embedded in the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) devices.
> 
> Assisted-by: Gemini:gemini-3.1-pro Sashiko
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>


