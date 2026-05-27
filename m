Return-Path: <linux-hwmon+bounces-14546-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPePHMYIF2oo1wcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14546-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 17:07:50 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 345EC5E6942
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 17:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67227306C31B
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 15:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2878F426EA2;
	Wed, 27 May 2026 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXdY1fEo"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39DB3644C7;
	Wed, 27 May 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894096; cv=none; b=HpgR8TttugIuTJfwbpk5SeN9o/ByDOrZIydfPhiUtBLkfGXV+Zf4U8VoSn4smGQdOaStBuVxI2nyTVFv/fOZo9ALpGcmbAmgVV8XS1Ka4sFvLmRqW+vGCWPxuo2HVnBoKmY4V0erf0C8wxMeIqxv502RT7sMlrQ8AoqlOJrjif8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894096; c=relaxed/simple;
	bh=WS3ABEfIgslG9M/uQoFyZohv2yopZrqBBSJBKdGFpmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hg22uUmy82/pYcggPlNuZoPFCCmsthyU3Gtt70zy/LEPG3GIBA3LUtlrHZ7DL9p0wnkgRSJ0F8WHLg+PuoLwsQbMDfw7u3NYUtKgiPyqALPD/SkM4hgOXkXMbJgJNAsiWwlpW0Z6oeDXr5XAqKK5Xzr8WKLhff1An2fcRAvyxtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXdY1fEo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636961F00A3D;
	Wed, 27 May 2026 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779894094;
	bh=uYl0TJxlIadqN+zKSxKUjZz6auICAxfpr5ScEzskZpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jXdY1fEor1hVLhOWZODUJWnHv8EPYAOt4V5YurwtNTRBt14Q8ZVAv8YaE4SQBmvJH
	 beLjvaZpWTxh1tlE4ereL1nRs+ZjTU9bfyPVn6bW/lGC3I065UWWTEpOSVp2eCC6Lh
	 MNE9/UKe6gAQxZTEv2B5+m69riR0LQNjnyGdFstUkkdj4I6J4HWhdlxLNK9H71dzw7
	 EHHqNya4X/KyUCWfZx7a5xs/WRiDaOQgXEnlpkQKrVSuD01K2jcfjkNfjGzMYo5RYX
	 LJVROyzyLTMpdOuIwwi3aFmnnmOwreFaTjUE85lRK2PPFlRNd2h1jjPMciAwRDdNfw
	 rVb0i8QppRX4A==
Date: Wed, 27 May 2026 16:01:30 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <20260527-exuberant-broadband-052c3526847f@spud>
References: <20260527045409.9092-1-sanman.pradhan@hpe.com>
 <20260527045409.9092-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qLksySKIuLHjtvNL"
Content-Disposition: inline
In-Reply-To: <20260527045409.9092-2-sanman.pradhan@hpe.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14546-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.40:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,analog.com:url]
X-Rspamd-Queue-Id: 345EC5E6942
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--qLksySKIuLHjtvNL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 04:54:42AM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
>  .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max=
20860a.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.=
yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> new file mode 100644
> index 000000000000..d864fef210b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX20860A Step-Down Converter
> +
> +maintainers:
> +  - Sanman Pradhan <psanman@juniper.net>
> +
> +description: |
> +  The MAX20860A is a fully integrated step-down DC-DC switching regulator
> +  with PMBus interface for monitoring input/output voltage, output curre=
nt
> +  and temperature.
> +
> +  Datasheet: https://www.analog.com/en/products/max20860a.html
> +
> +properties:
> +  compatible:
> +    const: adi,max20860a
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg

How come no regulator properties are permitted here?

Cheers,
Conor.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        regulator@40 {
> +            compatible =3D "adi,max20860a";
> +            reg =3D <0x40>;
> +        };
> +    };
> --=20
> 2.34.1
>=20

--qLksySKIuLHjtvNL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahcHSgAKCRB4tDGHoIJi
0pkPAP9w1G2KVrDMw5cnDoXuGPsS8qnSEv0fxsyoXheFNLNzxQD/TkfTZu6jgyVS
oHdztD2ryrff2bFegM7w9r+Xa/Fjygo=
=g1Pl
-----END PGP SIGNATURE-----

--qLksySKIuLHjtvNL--

