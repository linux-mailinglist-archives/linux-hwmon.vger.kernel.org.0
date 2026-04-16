Return-Path: <linux-hwmon+bounces-13307-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD/eKTbP4GkkmQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13307-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 13:59:50 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5B40DB99
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 13:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0E34301153A
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Apr 2026 11:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8D43B3BEF;
	Thu, 16 Apr 2026 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKQSpSff"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778839D6D1;
	Thu, 16 Apr 2026 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340763; cv=none; b=qFHfouTkNLN47eztD5yWesgXo7EzaKkR6RG8evutD0Ngy0ypezbBNrCnRG0+eAtbsayz8sAaCrCKb61jxBEv+jNldKgM8srcGUttwEDh5lvrG0eBl2mpdGZDfKOuxPZ/6dgwS+vkKrDdD2/thoA/vAjI2LJI8NKpuhmgo9yhatQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340763; c=relaxed/simple;
	bh=py7wWhiWmBXGzlBtBHNVd2e7B5dJrS5FkveYE/aeNek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrPv4c5ddFFk3wgt85HzUlctA+Ip1R4pJ5Z4q7eqOVTHCTCV8dqDvqTnRoVO7LsPFt7QP+TRjF7EkCZc5gAbtzdY/mSEgcEBJLY8b1Jnk/S0z3M9OI/oZno3/S2hcXH6mqeCys+Jl8MiPZdKH7PtxHOWyP55nJfQAS/zlh1QHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKQSpSff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34ACAC2BCAF;
	Thu, 16 Apr 2026 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776340763;
	bh=py7wWhiWmBXGzlBtBHNVd2e7B5dJrS5FkveYE/aeNek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKQSpSffpiBziKTs2wrKLd54/U5m8YfRAOg7k9HlmeUGd0cqVQsHQmICDl1sS4fWw
	 7YxEtCqUdJ3/MMg2ymrm4NgXW185Jd+gcoFxX0mGJwVeJenMzT1VFgtZGuoU9cE2lb
	 hefo+YQtU9/oXiL9AyKUpgbzPvnCDLQCYsPil9MjvqVU+3ONKf15yRSE5eLwxA9lss
	 IClFfY+vWWpS/vOvKtoMcw9m1/40d0SRkN3aPIWBP0gdwreaAfdJofPlZEemcw8sk8
	 igPnINMEYDlNRCj7pupcdNWvr31ITdhrXpfd5GI9lpJc2pgWBQiXpx6Nqde0sazqrh
	 fPlu2DYfBWzrA==
Date: Thu, 16 Apr 2026 06:59:21 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260416115921.GA2724261-robh@kernel.org>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409105747.48158-2-akhilrajeev@nvidia.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13307-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mipi.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BC5B40DB99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 04:27:31PM +0530, Akhil R wrote:
> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
> 
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
> 
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> index e25fa72fd785..1705d90d4d79 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> @@ -31,10 +31,12 @@ properties:
>        described in the device tree, which in turn means we have to describe
>        I3C devices.
>  
> -      Another use case for describing an I3C device in the device tree is when
> -      this I3C device has a static I2C address and we want to assign it a
> -      specific I3C dynamic address before the DAA takes place (so that other
> -      devices on the bus can't take this dynamic address).
> +      Other use-cases for describing an I3C device in the device tree are:
> +      - When the I3C device has a static I2C address and we want to assign
> +        it a specific I3C dynamic address before the DAA takes place (so
> +        that other devices on the bus can't take this dynamic address).
> +      - When the I3C device requires SETAASA for its discovery and uses a
> +        pre-defined static address.
>  
>    "#size-cells":
>      const: 0
> @@ -147,6 +149,26 @@ patternProperties:
>            through SETDASA. If static address is not present, this address is assigned
>            through SETNEWDA after assigning a temporary address via ENTDAA.
>  
> +      mipi-i3c-static-method:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0x1
> +        maximum: 0xff

Looks like the max is 0x7 currently.

> +        default: 1
> +        description: |
> +          Bitmap describing which methods of Dynamic Address Assignment from a
> +          static address are supported by this I3C Target. A bit value of 1
> +          indicates support for that method, and 0 indicates lack of support.

blank line here.

> +          Bit 0: SETDASA CCC (Direct)
> +          Bit 1: SETAASA CCC (Broadcast)
> +          Bit 2: Other CCC (vendor / standards extension)
> +          All other bits are reserved.

Indent these by 2 more.

> +
> +          This property follows the MIPI I3C specification. The primary use
> +          of this property is to indicate support for SETAASA, i.e Bit 1, but
> +          will allow all values so that it is aligned with the specifications.
> +          SETDASA will remain as the default method even if this property is
> +          not present.
> +
>      required:
>        - reg
>  
> -- 
> 2.50.1
> 

