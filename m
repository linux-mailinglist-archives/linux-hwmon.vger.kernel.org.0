Return-Path: <linux-hwmon+bounces-13564-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOgYEQWl8WnxjAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13564-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 08:28:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5EF48FC23
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 08:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 162AC302B3A2
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 06:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C19837BE60;
	Wed, 29 Apr 2026 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHx92N++"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C3D372B2A;
	Wed, 29 Apr 2026 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444082; cv=none; b=UH3v1uTwv7QRVPq5y5AWtzajq2DkfnbjuJ67vsA58TKuTFBnWbA37LdqKT4Zw3Yo6+ALFkaQRDxxIwhawtYtYF8UiD4ff70Uge1QwBotIHH6cFvOu8XgCf5t/qvTPBM7FbKm4cuRFeXcto+JaPnPfbHiuRE2j7QwBN6llFX/Nv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444082; c=relaxed/simple;
	bh=LT8myynW6kGdxIxR2WQv6JrUz/8u5m0XBQY34xwuj7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkAzHNfYWDcn8NHEZTCfKdKbIEcAJvhB6aSM+by8tCAblh973f7qudmFcXuLadXGAu5NQDV/AQbgaxFiIzajaFKBQfydL+1E4DSdSj+6kVWxyLwvsKSpCHcySOKk/2AhyM7tOjKNkP1GfzLzwGgipNZFHsYMiMOOkQBmW5oZRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHx92N++; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9F7C19425;
	Wed, 29 Apr 2026 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444081;
	bh=LT8myynW6kGdxIxR2WQv6JrUz/8u5m0XBQY34xwuj7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHx92N++oAnuubkXg6vcKY62HF/CghW1AG6STnwqRE9oA0e014jH444mwOyOtCe/G
	 nrqbCw1tN05rH8LdWvm0OxtgEuwasyMeZcaQgoknXWw3S51aja3y+qsOtbIkj41Azg
	 c1+hx+nrIb1VkMy8pWSNV4EhThcwu2xG/YrpfJPPP4Ng6VHmZiK6ONWj3k+ZoH5EyB
	 MPE+IsqQrKIrVzwFobi960ScKk+v+p/BLBK6ePGmhqUhyXw9iEYroA9Hp65jxJmTjq
	 ObCXuMJq18bjKnUEu1OLM9JHYFeTQk3BaTFsOkAT+sAGyJ9X1JgDpgzMB1uD/hoGrK
	 t9Pl7KNQQ/i9Q==
Date: Wed, 29 Apr 2026 08:27:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260429-free-oyster-of-whirlwind-eacf91@quoll>
References: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Rspamd-Queue-Id: DC5EF48FC23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13564-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 07:09:27PM +0800, Zaixiang Xu wrote:
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt connected to the ALERT pin.
> +
> +required:
> +  - compatible
> +  - reg

supply should not be optional.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;

Best regards,
Krzysztof


