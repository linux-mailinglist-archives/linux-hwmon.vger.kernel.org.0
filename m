Return-Path: <linux-hwmon+bounces-11697-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BCELisYjmlF/QAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11697-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Feb 2026 19:12:59 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F41302FD
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Feb 2026 19:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10D81302DE11
	for <lists+linux-hwmon@lfdr.de>; Thu, 12 Feb 2026 18:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6709274FC1;
	Thu, 12 Feb 2026 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvWGHK1a"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22331D63E4;
	Thu, 12 Feb 2026 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770919974; cv=none; b=EZxQ+4Q7GG5/EFXmw1FQXarF68zpOs7eHAYHddjZ9MJLU3NEEjWAyVNK9X+llKEofpnXHx2b904utj5OJ5lJ0RfLSA+ROvIt06sckgpWebTVc3dTeuQf6fNC/9jmifhu92MoOct8WCRf/ifDAMnSRRfPHGbFEEiIRe9Lpzs/v1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770919974; c=relaxed/simple;
	bh=M3cjgvS/ZhQs/TCeqlasGC66xOXSJARftgnCxWJua90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVHjYQNY1IbXhvvkQxJw0o48fShpUxU6xG4y3U37Jro0hXLGYGrD9KM0XKk0CyYrhjaiSOCx/t8QrPDvQsZ0B6JXS6GsFD+LgHgF4dQWKOFdxiGg65/Dqs3ysk5nNVb7RG8jXCNNz/j9tBznVYAA4sP7kEr+hBOSqXfVT2XYBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvWGHK1a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A0C4CEF7;
	Thu, 12 Feb 2026 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770919974;
	bh=M3cjgvS/ZhQs/TCeqlasGC66xOXSJARftgnCxWJua90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvWGHK1axMnijm8bv6w/0OX3bCimHzoVns1p0FmNPe6JHKGoPt14ZCKevDubWZ2yA
	 aNBVAJH8Fqo54UgEtAORIVRhuZ+ihFDPSBcNHk4FVlBTfp9909VdF9RnrMih6QdS9E
	 MnmmcMt16Nwkgh0s40hvQGYmzxGNQ3C0Udx8kjVEH5BpybNXoVp8qh9z9jcKkPbnhC
	 YAyahBUytDq2HgYeBQ74PnaGczBPKKHSl+8KIfj+qY1db1JOwkB1g9LJSdqTPf/qLy
	 YxL/tbplTo/TuJgeEq5evU33sTPQARdLbx2ty1VPUG1jY8YnJfO+9U+lxuaiQxaSjF
	 mVdGzXij2aC7g==
Date: Thu, 12 Feb 2026 18:12:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <20260212-unsaved-delta-a49468049f10@spud>
References: <20260212-hw_mon-emc1812-v6-0-e37e9b38d898@microchip.com>
 <20260212-hw_mon-emc1812-v6-1-e37e9b38d898@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WcLubc+h1xVO3Dkh"
Content-Disposition: inline
In-Reply-To: <20260212-hw_mon-emc1812-v6-1-e37e9b38d898@microchip.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11697-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A1F41302FD
X-Rspamd-Action: no action


--WcLubc+h1xVO3Dkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2026 at 11:54:07AM +0200, Marius Cristea wrote:
> +
> +  # EMC1815: 4 Channels, Supports APD, REC on 1-2 and 3-4
> +  - if:
> +      properties:
> +        compatible:
> +          const: microchip,emc1815
> +    then:
> +      # No restrictions needed, but explicitly allowing them is good documentation

Uh, I don't agree. If we applied this across the board in the name of
"good documentation" we'd end up bloating up so many bindings.

Other than this,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +      properties:
> +        microchip,enable-anti-parallel: true
> +        microchip,parasitic-res-on-channel1-2: true
> +        microchip,parasitic-res-on-channel3-4: true


--WcLubc+h1xVO3Dkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY4YIgAKCRB4tDGHoIJi
0io7AQDkOutIwPEj3td+X34ZdFu1SsITFTn7UcVxtL3pH+nOPgEAxu03PDgMYXlT
7Ehku15KQ38z7onzyYmCveIOY6r7TAE=
=DcpH
-----END PGP SIGNATURE-----

--WcLubc+h1xVO3Dkh--

