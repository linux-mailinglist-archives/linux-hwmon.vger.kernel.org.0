Return-Path: <linux-hwmon+bounces-12801-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJXvCAdVxWkk9gQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12801-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 Mar 2026 16:47:19 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B66337D53
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 Mar 2026 16:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E51305BBFA
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 Mar 2026 15:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F08401A21;
	Thu, 26 Mar 2026 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FJppiSpM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ACE4014A2;
	Thu, 26 Mar 2026 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539883; cv=none; b=iGuvhLqb7I18xwHtzkUn2TBkQUDv6gGYhk8F9bUvwnMwRwvhEiQPlbT0e4CBCqcMhYro2XCHMRDc4AmPlZvIJOOXyFQr5vH9BqmhzuLiJr/HlS0J5umqOJShVuVWI+/RlCissZgrTCsvo10ZtT3qG5XCprTfJPuSRAOkj2tBIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539883; c=relaxed/simple;
	bh=fegKwxX/JUwCF2Lx6tujwh9Zba20d9CylFdb5bDXNpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLVpI74ZgIKW/X2dT1VkaHjpQ6r6RysT90arYiQ1d0c+QYtogf7/aDDr4L19OA+HrciTBfA4SkDhK4W0Sd/OLdqm7aTSFLIkfkn4XsZDyOsLhdbY1rlCl3x6hNhpaenxA0epH4Tou8ryIirHrZ28IJEJyaAWfaQckR/W4UURU3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FJppiSpM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 890941A3003;
	Thu, 26 Mar 2026 15:44:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59680601FA;
	Thu, 26 Mar 2026 15:44:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D012C10450519;
	Thu, 26 Mar 2026 16:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774539877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=LkNoR3D4UbafRdhgG19imB15t8UnwV/2QMs/xxLmVyU=;
	b=FJppiSpMFzTcwEj8BcylcxckqdLi3AAFThxTsgjf1VxD813E3aBkMGWgw/R8+eBpwILq49
	SIqEMogdAM0hHIpYOqpvRet+87Z47SIG9H9zRGzztKEagjZGSc4jC99LV/pEPGmnmE2hFR
	j0aicGJlzLGjkOyveHO/MPNtvWTEuOVTmXN354hbJc3sOB2XwIbuNT8VMVJ7XwtFWFcCiX
	WpySGxQl2dLbAeHYterMB/py0EmGIPFEY/G0Dr2QHaPgWHusv9ZuoJeS5EFUE01picFt2j
	WdKopCMVh7tFY8NZVxQFvXnJXyafnRHn+K9a5syQrIxj5hxsj0ZHxN/KF4wAqg==
Date: Thu, 26 Mar 2026 16:44:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <202603261544313f63018c@mail.local>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
 <20260318172820.13771-2-akhilrajeev@nvidia.com>
 <20260318-tweed-herbicide-eb924ef056b8@spud>
 <20260326150503.GA2360967-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326150503.GA2360967-robh@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12801-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mipi.org:url,nvidia.com:email]
X-Rspamd-Queue-Id: 71B66337D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 10:05:03-0500, Rob Herring wrote:
> On Wed, Mar 18, 2026 at 05:31:50PM +0000, Conor Dooley wrote:
> > On Wed, Mar 18, 2026 at 10:57:14PM +0530, Akhil R wrote:
> > > Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> > > Discovery and Configuration Specification [1] to specify which discovery
> > > method an I3C device supports during bus initialization. The property is
> > > a bitmap, where a bit value of 1 indicates support for that method, and 0
> > > indicates lack of support.
> > > Bit 0: SETDASA CCC (Direct)
> > > Bit 1: SETAASA CCC (Broadcast)
> > > Bit 2: Other CCC (vendor / standards extension)
> > > All other bits are reserved.
> > > 
> > > It is specifically needed when an I3C device requires SETAASA for the
> > > address assignment. SETDASA will be supported by default if this property
> > > is absent - which means for now the property just serves as a flag to
> > > enable SETAASA, but keep the property as a bitmap to align with the
> > > specifications.
> > > 
> > > [1] https://www.mipi.org/specifications/disco
> > > 
> > > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > > ---
> > >  .../devicetree/bindings/i3c/i3c.yaml          | 30 ++++++++++++++++---
> > >  1 file changed, 26 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > index e25fa72fd785..1705d90d4d79 100644
> > > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > > @@ -31,10 +31,12 @@ properties:
> > >        described in the device tree, which in turn means we have to describe
> > >        I3C devices.
> > >  
> > > -      Another use case for describing an I3C device in the device tree is when
> > > -      this I3C device has a static I2C address and we want to assign it a
> > > -      specific I3C dynamic address before the DAA takes place (so that other
> > > -      devices on the bus can't take this dynamic address).
> > > +      Other use-cases for describing an I3C device in the device tree are:
> > > +      - When the I3C device has a static I2C address and we want to assign
> > > +        it a specific I3C dynamic address before the DAA takes place (so
> > > +        that other devices on the bus can't take this dynamic address).
> > > +      - When the I3C device requires SETAASA for its discovery and uses a
> > > +        pre-defined static address.
> > >  
> > >    "#size-cells":
> > >      const: 0
> > > @@ -147,6 +149,26 @@ patternProperties:
> > >            through SETDASA. If static address is not present, this address is assigned
> > >            through SETNEWDA after assigning a temporary address via ENTDAA.
> > >  
> > > +      mipi-i3c-static-method:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 0x1
> > > +        maximum: 0xff
> > > +        default: 1
> > > +        description: |
> > > +          Bitmap describing which methods of Dynamic Address Assignment from a
> > > +          static address are supported by this I3C Target. A bit value of 1
> > > +          indicates support for that method, and 0 indicates lack of support.
> > 
> > I really am not keen on properties that are bitmaps, why can't we just
> > use the strings "setdasa", "setaasa" etc?
> 
> If this comes from a specification, then I'd tend to just copy it rather 
> than invent our own thing. Obviously if is something structured 
> fundamentally different from how DT is designed, then we wouldn't. But 
> this is just a simple property.
> 

The issue being that the specification is not public so it is difficult
to take any decision.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

