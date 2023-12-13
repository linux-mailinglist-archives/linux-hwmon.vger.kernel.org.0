Return-Path: <linux-hwmon+bounces-367-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9C805A3E
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Dec 2023 17:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 888B91C21169
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Dec 2023 16:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D742E3F8C3;
	Tue,  5 Dec 2023 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P282iOEz"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5EC60BBD;
	Tue,  5 Dec 2023 16:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C7FC433C8;
	Tue,  5 Dec 2023 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701794808;
	bh=VJiAFW0zow+mP/2B0hwLEDVsWXtN6IoHY8ReLDL8JlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P282iOEz8K2Ju0LZdIBBOG/m9d18TvElZa5agixz1ifQg9xJbhJfQXuz1q+NkPTHO
	 M87RZX+nvRGOluo/SHnrQTy7bLc3HCDIywdaHyDi8N+zFZTcNBwMhulWU0W4CArCzO
	 5d47c9BmzcWhXQ5Oaaeil2yShrx40ubgUkqTxyBBdk6jsZHYEzC2Hp8eg8NcFkhSOT
	 A03fSQw75jWkwGAZnhY+dNX3okf+ubJ/ncofOq+Hi+aLrauwG5zyXDt7HQm0mvG87V
	 SYUu5lwDMAZOq7T3XIhcOpRbdW3/eruFzy4bz2JAh8ETrmWXpEYELjwhAyg/q+1rMf
	 SKW2H/k5z8I1A==
Date: Tue, 5 Dec 2023 16:46:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net, heiko@sntech.de, jernej.skrabec@gmail.com,
	macromorgan@hotmail.com, linus.walleij@linaro.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pt516xx: add bindings
Message-ID: <20231205-moneyless-hash-202129b0c636@spud>
References: <20231205074723.3546295-1-chou.cosmo@gmail.com>
 <20231205074723.3546295-3-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="koWKZqbMUuzMweLA"
Content-Disposition: inline
In-Reply-To: <20231205074723.3546295-3-chou.cosmo@gmail.com>


--koWKZqbMUuzMweLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 03:47:22PM +0800, Cosmo Chou wrote:
> Add dt-bindings for pt516xx temperature monitor.
>=20
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

This can just go into trivial-devices.yaml, no?

Thanks,
Conor.

> ---
>  .../bindings/hwmon/asteralabs,pt516xx.yaml    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/asteralabs,pt=
516xx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/asteralabs,pt516xx.y=
aml b/Documentation/devicetree/bindings/hwmon/asteralabs,pt516xx.yaml
> new file mode 100644
> index 000000000000..5700d4c91a0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/asteralabs,pt516xx.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/asteralabs,pt516xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PT5161L hwmon sensor
> +
> +maintainers:
> +  - Cosmo Chou <cosmo.chou@quantatw.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asteralabs,pt5161l
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      sensor@24 {
> +        compatible =3D "asteralabs,pt5161l";
> +        reg =3D <0x24>;
> +      };
> +    };
> --=20
> 2.34.1
>=20

--koWKZqbMUuzMweLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9T8gAKCRB4tDGHoIJi
0rbeAP9UZFP4fQrMBKa9ZCWjhzEI9pPr4ESGnjJ4dXDulv1E8gD+NqAY1GCkH/3P
I4auC8gk0eePMBrRCQc6YDaQHAvdDAc=
=KY0u
-----END PGP SIGNATURE-----

--koWKZqbMUuzMweLA--

