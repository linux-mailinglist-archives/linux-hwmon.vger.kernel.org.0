Return-Path: <linux-hwmon+bounces-13607-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH61A/VL8mnNpQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13607-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 20:20:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54576498EAE
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 20:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9ED3033538
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 18:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8519E4218A6;
	Wed, 29 Apr 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CbfBDsW/"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6C413259;
	Wed, 29 Apr 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777486690; cv=none; b=jMQ/W/eMFYhMvlE/uWjqB6J1oxTSSVQURMkS+gNI4NwgCrsnMLKJmONOxQnH/xfMGcPJ/a75n8Unx5sz4VIlxJ5fmo+eN3YDGXr5aoIucI5BUj1y83EE9a2DBQkf+7pU84VlT205glPt3w4s8zGKrXRlri99HuPqgrS+12yRnA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777486690; c=relaxed/simple;
	bh=UdSAZ4Ed89EsgnscyKgKTV5jZmvavrICMX4k55nyzeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgWH92ZzOF7LetPaAaRU9X3U4V2aNAAoxtvI5M9VYDJMk2n3DZz50ZEbaWdQjc3bzVff0pX4BXMVwwooswstGbcnMqrr6oV4kCLAHdSkdSW1C9fbQLsmyK/0w3KlFF9a+EO9Ld+HZYTWmmCKQs17I2t2sH/h5c//vM0IeS3BwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CbfBDsW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD5BC2BCB8;
	Wed, 29 Apr 2026 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777486690;
	bh=UdSAZ4Ed89EsgnscyKgKTV5jZmvavrICMX4k55nyzeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbfBDsW/nyPye5VIbtgNiO28oc3SZxbKtVn2E3OWdbW/8KVI8GeIONNhieeZ/Z0hy
	 rlkPXrjvjPGCFiouw+FTywdjwyj9DC5DHI9MSwgKGpRNCH71Z4gfLHRdEqkO8g2gqv
	 rNq2ZrIotKFGd2U3KMTEk4auAnD9lH0Tou54X+TnEwUHXkYEAs329PYL4SGFgBepCR
	 2o+A7bgoRIih32zJtE5xIj4gD0fGPr6IfvNH8+SCn1G8F+VJcg+n31KzDtD+Ziej9N
	 gMCLSBlMxWQUvfsz3Wy20FMyFjWRirphFOCzPDs20giCnLZ6aNcuqksYnHX28BR9gX
	 Hv5CBJqO5Kefg==
Date: Wed, 29 Apr 2026 19:18:04 +0100
From: Conor Dooley <conor@kernel.org>
To: florin.leotescu@oss.nxp.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <20260429-shiftless-docile-e57509e967c4@spud>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O/6ha+tJR4ql1YNr"
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
X-Rspamd-Queue-Id: 54576498EAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.24 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13607-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,nvidia.com,vger.kernel.org,nxp.com,lists.infradead.org,lists.linux.dev,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.911];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,nxp.com:email,0.0.0.1:email]


--O/6ha+tJR4ql1YNr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>=20
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
>=20
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
>=20
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Why didn't you pick up my tag from here:
https://lore.kernel.org/all/20260407-slang-scoff-795164352c62@spud/

> ---
>  .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index d3f06ebc19fa..8c2548539d7f 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -54,6 +54,12 @@ patternProperties:
>            The fan number used to determine the associated PWM channel.
>          maxItems: 1
> =20
> +      fan-shutdown-percent:
> +        description:
> +          PWM duty cycle in percent applied to the fan during shutdown.
> +        minimum: 0
> +        maximum: 100
> +
>      required:
>        - reg
> =20
> @@ -80,12 +86,14 @@ examples:
>              fan@0 {
>                  reg =3D <0x0>;
>                  pwms =3D <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
> +                fan-shutdown-percent =3D <100>;
>                  #cooling-cells =3D <2>;
>              };
> =20
>              fan@1 {
>                  reg =3D <0x1>;
>                  pwms =3D <&fan_controller 26000 0 1>;
> +                fan-shutdown-percent =3D <50>;
>                  #cooling-cells =3D <2>;
>              };
> =20
> --=20
> 2.34.1
>=20

--O/6ha+tJR4ql1YNr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafJLXAAKCRB4tDGHoIJi
0gavAQCPTKrm8kliUt98l4rMdBj0rVjas+i0gGIqNsxjP1AXLgD/Vp1BZn+P5YxZ
Odh6zOWq9LiWRscCj2gLht0B4n8sWQk=
=7V1K
-----END PGP SIGNATURE-----

--O/6ha+tJR4ql1YNr--

