Return-Path: <linux-hwmon+bounces-11689-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M5mkJ3LCjWm26gAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11689-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Feb 2026 13:07:14 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18D12D488
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Feb 2026 13:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E8B7305AA9D
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Feb 2026 12:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA599356A11;
	Thu, 12 Feb 2026 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAzWr5wn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC93EBF24;
	Thu, 12 Feb 2026 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770897969; cv=none; b=jJuj6n5krPa8+TqgcLLfEdT++QHCbTTvXR2dyBMm7Pp9+04OMqIFuHXxKvQsK/61iTWRuYIFBxQYrjdQrRaNXJfv3rCt/+pwnNEgVnx0Il19Y//jswlfJGDLqkBw2fW26VBt9SRL+DUQC3KajIwtb1jegWPcFNpfH+NJwMUyWpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770897969; c=relaxed/simple;
	bh=L8E/2Fr+JWokQLZqBZkg1J2S7QjxwdU/qZsIn0+w1pA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UexOUl3tdtqflgFI7cjw5YhRGSAeXcgnhUUgC37q1eEMPcovshkuOW+6gT+5dZ8GttQCYDkPWKu+U9EgVANk50rwNh3qjz5tEDEkjJW2lcLV72rr/r+tR2DzwaGOYC6Ux/XS0TJT/eX/cxq6JdzAHGxI6nRJ06U94G5z4CSwTrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAzWr5wn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C814EC16AAE;
	Thu, 12 Feb 2026 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770897969;
	bh=L8E/2Fr+JWokQLZqBZkg1J2S7QjxwdU/qZsIn0+w1pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAzWr5wn50OG1sZHkmYquaHl3HRxDIQUSH0KJWhAgtaHRrdfPI1dtL4KxuFCqB2EE
	 ry91ghS/PWAj7dzA71Daff7UNsakVhUKMi+so27YM/LU2A2nhKDO6ATdsbKUGJxXTM
	 lHCpfrXvcd3vshsip1AtrooSfw6yYyux2zI1xMUwo3Q1FoRL3qLuqiPP0aN0vh3V+m
	 /PIStgpffBL/DM1+CpIKcX97l6T0I/hBqb2EnAeQO31z7XB7KKb6GtlgyIxaRnrA5Q
	 Z3pUe+mvQh6U3cXQbckGf2aRyGVxTekhp6NooqBJSjUwd10YDLAVv6yWGpRG5dCVFf
	 uw4TUJ771cyXA==
Date: Thu, 12 Feb 2026 13:06:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
 support
Message-ID: <20260212-private-hedgehog-of-elevation-953d91@quoll>
References: <20260212084502.1795-1-sbogdanov@baylibre.com>
 <20260212084502.1795-3-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212084502.1795-3-sbogdanov@baylibre.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11689-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 2F18D12D488
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 10:45:01AM +0200, Stoyan Bogdanov wrote:
> Add device compatible support for TPS1689
> 

Subject: Drop "support"


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


