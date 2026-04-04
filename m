Return-Path: <linux-hwmon+bounces-13081-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMv3Giy40Gmu/QYAu9opvQ
	(envelope-from <linux-hwmon+bounces-13081-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 04 Apr 2026 09:05:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631939A2FC
	for <lists+linux-hwmon@lfdr.de>; Sat, 04 Apr 2026 09:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A9C9301BCCB
	for <lists+linux-hwmon@lfdr.de>; Sat,  4 Apr 2026 07:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0201D35F5EC;
	Sat,  4 Apr 2026 07:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rG/MF/QJ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B729D27A;
	Sat,  4 Apr 2026 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775286267; cv=none; b=uY/mZMYlOC9zex9YzrescTJ5uTHm03jGpuurSEeQwVyi15N8NisfvNcWtTC1bFCXZb6YPRtA3A+yL/rxd5wbR8q2ZXVtP5A5IwkmywhEuzDim1PZk4LiHwZ89zgidT0/T92bO/JylZCB3CUj/Tj9ECEsLbFddVU9Q8Swi6SIt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775286267; c=relaxed/simple;
	bh=g4ulReymsmUnl3J7OQb0CYj2AnQQkrXyzbEsQR2OgT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeMpzh/muHNKuDiKTgXmABMAfeNPHSPAZIymtvyROZx0bDVmzw9THsk/TOOAxwVkiqlgfq+4OwqedabSGLYeIGF8q0gLxceGIXwR5xqL7i7oAxncauoGudzO/5KE2cfVKUJZ05ZUacbIs1j12kmYO3NIZ4pQR2Aqndzrxk7e/R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rG/MF/QJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DE0C19423;
	Sat,  4 Apr 2026 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775286267;
	bh=g4ulReymsmUnl3J7OQb0CYj2AnQQkrXyzbEsQR2OgT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rG/MF/QJ8k6cdUaNHWXW3lB1GGa6SC8biMa9QI030QboI2Rp6IzXpZnuLkDil6nK2
	 43IF89kBH61akifxk6sTyHRYS99e4rXUrJvsqXlH3c50gmsn6D/U9S5GJ5YvctFTqH
	 uexeEX8X7cYL7Ons1Xs6Uk+y8zL3Wbxnt2uOA2rGDivZzLXh/ZU1a8d3Vt/VeZTWN+
	 R6aDeDtPqPg4/RvOh99ny4uTLvC+h4eH/05sYWbTXTZ0dXNhoh2yJW+xEgXcMlDms/
	 O/qKXe5/lag1egv6pdwBEDteG10N1qhJ27jl0fjLAcqaYWxIXArMslM9cWHU59txef
	 X6uPpAG+8Kf3w==
Date: Sat, 4 Apr 2026 09:04:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, marius.cristea@microchip.com
Subject: Re: [PATCH v12 1/2] dt-bindings: hwmon: add support for MCP998X
Message-ID: <20260404-accurate-discreet-poodle-2bf04f@quoll>
References: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
 <20260403-add-mcp9982-hwmon-v12-1-b3bfb26ff136@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-add-mcp9982-hwmon-v12-1-b3bfb26ff136@microchip.com>
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
	TAGGED_FROM(0.00)[bounces-13081-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: 0631939A2FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:32:16PM +0300, Victor Duicu wrote:
> Add devicetree schema for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---
>  .../bindings/hwmon/microchip,mcp9982.yaml          | 237 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 243 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


