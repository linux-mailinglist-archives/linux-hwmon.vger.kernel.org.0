Return-Path: <linux-hwmon+bounces-13302-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB39BFms4GkCkwAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13302-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 11:31:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEF40C63D
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 11:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C767303CE83
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 09:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE7339A056;
	Thu, 16 Apr 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2xzE2qK"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389BB3815DC;
	Thu, 16 Apr 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331529; cv=none; b=NxW8rrgrZKmPaAMG+old2lqakq+AlcfSrqU74I0gEvTqv0jka0uSzGvv62X7wVLDfrUk7TuuARcYrOKEz+Lye5ggbmvrbsE8d9jz8zDjkdzOtLYmXXXzayksKh9iR2x0R5zWxMz+CeWIvV+Ap60O0H6KKDRLTrjL/U4820kFu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331529; c=relaxed/simple;
	bh=hAgLdQYvJuLQwWj+BdR/kmPxsP+kO8N7F9Q1Ghp0XEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ+cAH1kcUjhQXCjnj3SgVtSAKKjs7QQIOGxSQ8MVPO+LchbKoEvUBZhxM3Ei8+Iwju03Fhn5xfxTglKVg75Dx3StErlwa5R0hr+FSxWPoIcwHtS8W0HhO1ftbrCeRtxXOLb85ujWDVpaHFTvE9mnSMyA3aij8dbX5fU3Si4WjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2xzE2qK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C48BC2BCAF;
	Thu, 16 Apr 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776331528;
	bh=hAgLdQYvJuLQwWj+BdR/kmPxsP+kO8N7F9Q1Ghp0XEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2xzE2qKeUjbOQLVlac5jyr/0LrafqNqeXVUlhChfOLk95jd9vYl2mZ6T5uPdvL+o
	 Gi4by8Yn0hl9mpeBZbqBtT+rexyCp9Tv4TlwN39dfdDa69ikGg7a8KyRLsvtDEeRF7
	 dYiY6rYgdiO4FvBtBAOVuyCRxjQv3rhzbF0EVUSPm19iEhCs0Ix00k/h6fGVrK4mPs
	 xBztR1rdy8HXYDFRsjOIpMn0VU1jlJwiHm3VqzNyde56eI0XR0xSr+/HEGER4WPZy4
	 oY+Hhm2+mJ2kSqEFCCgaI9KIHQj28no34UpQsHhxZLzWKjenvMGqCREEUfsPu32GHf
	 8ukIceU0xzzYA==
Date: Thu, 16 Apr 2026 11:25:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko@lists.linux.dev
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <20260416-winged-ivory-mandrill-f1e8b3@quoll>
References: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
 <20260414043841.1ED2AC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414043841.1ED2AC19425@smtp.kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13302-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68EEF40C63D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 04:38:40AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):
> - [Medium] Incomplete Regulator Schema
> - [Medium] Missing Hardware Capability (Interrupts)
> - [Low] Devicetree Best Practices Violation (Node Name)
> --
> 
> commit 20a4d8dcd2f3344ac22d7d2e974bae1ef57874ed
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> dt-bindings: hwmon: pmbus: add max20830
> 
> This commit adds device tree documentation for the MAX20830 step-down DC-DC
> switching regulator with PMBus interface. It allows monitoring of voltage,
> current, and temperature.

Sashiko devs,
Can we drop such comments? They are useless - we know what the commit is
doing, no point for reviewing tool to say it again.

Please send only useful feedback to mailing list, otherwise this will be
just noise and going to be ignored.

Best regards,
Krzysztof


