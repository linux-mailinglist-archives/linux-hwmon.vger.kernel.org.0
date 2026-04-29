Return-Path: <linux-hwmon+bounces-13571-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKQCLl618WmjjwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13571-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 09:38:06 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264049090B
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 09:38:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEB9030166F4
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 07:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC26D3A543C;
	Wed, 29 Apr 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrXYlAr6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541539D6CA;
	Wed, 29 Apr 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448075; cv=none; b=LE3+xI1IxJogJvkxOjmChxUO8y9hkSIdcHl/+ugod2ByWHP2uIswedtv69Wm9xsiDOWqXnC8uDR8+eYkYWOwzRXeh+QyF+QBaidbbpv5qpc6ltENtObwcWJk1qCMNLQ0mOGnEriACa9KKc5i5Ts5H/wEaPW8eOvEelfIrbZPzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448075; c=relaxed/simple;
	bh=n3mX0JpEdvKqLTQfsyaTpDRXbMbzGlZDgBum/n5q8ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UeJEqq8mfsa829F2+2zwZv443NB8jnhQsp5LTLECMCtFe49TaQoY7V2UixI3tRto5/fCDilk6w+6nvDGQbLJDde/R997B7O7cdO4FIMibWsiANWMNg/UOmKKWfx//qJqhdGdmeow0QF9LRyAs8QjQBX71h652vmjIJEHM3mkGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrXYlAr6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02D5C19425;
	Wed, 29 Apr 2026 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777448075;
	bh=n3mX0JpEdvKqLTQfsyaTpDRXbMbzGlZDgBum/n5q8ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrXYlAr6qW/SYfAcGPu8PXoUulmCgbEmVlmzGoGPQnsldFseGGVTqntnt44wSSkty
	 fKGBZ/434815rgVHguNGkSH4Dpx+dJ9EA0NOrsXHJa6fG2UQvVEdlnCcOUWxChgVNF
	 dRWzc/bd+sf18hsH9e8tzWcRz6Mo3PPiZ2E0PamTE62KHe4S+SrHRZlotNcvWP5TR8
	 PkMuiK1kTTRm7f8ZW6uTJE4A0Z6PegwVZs7c+0zeS1v6ht4pkogTIgi4cV5+cbPtLN
	 CQYqO9UZAJZMPP7l2A0oZDSoUGTYuOIwbGtw6fx8+ThhFYTwMlfnNw4eB85iqXHkxk
	 jKDgABSM9XrkA==
Date: Wed, 29 Apr 2026 09:34:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial: Add LX1308 support
Message-ID: <20260429-romantic-daffy-booby-acf544@quoll>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
 <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>
X-Rspamd-Queue-Id: 6264049090B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13571-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,inventec.com:email,qualcomm.com:email]

On Tue, Apr 28, 2026 at 12:19:28PM +0000, Brian Chiang wrote:
> Add device tree bindings for the Luxshare LX1308, a high-efficiency
> 12V 860W DC/DC power module with PMBus interface.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


