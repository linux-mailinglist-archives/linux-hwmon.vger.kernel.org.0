Return-Path: <linux-hwmon+bounces-12380-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EfVNQflt2mzWwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-12380-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 16 Mar 2026 12:09:59 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E353929880E
	for <lists+linux-hwmon@lfdr.de>; Mon, 16 Mar 2026 12:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8AAD3002935
	for <lists+linux-hwmon@lfdr.de>; Mon, 16 Mar 2026 11:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33332276038;
	Mon, 16 Mar 2026 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJoecujV"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1034027281E;
	Mon, 16 Mar 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659390; cv=none; b=JSmXKl3D0OGTPfMjuhBIqsFKaQiJ4wIVEU0MZMGuxvvYB6nAXB/qlDFM+z+btObsBdQUU/mpAJjQ84QBB22KWjcT/WV2n0pno5wF+dsr6a3UbOEbfGLe4RPxc0RS7gwkhI9DsUfJCGAT3rzk9s1LR6xgMFjiyxlv4pIbm3cU7LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659390; c=relaxed/simple;
	bh=HBdCmmhHtctxj1golQhPltmCQklAUr8W6M2Q6tKeyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMphIxnp1edDrh9rYKIJgDombOSefUAon0RFat3XBYxCPTT0CbbftPJcPWIZ+uGL8tmlnr8Y5Lf3ZW2HfKp564WVLRGv4HhxytMfOOp76Ev2Iyh4Gz+LduIqBsdf9iRvBFh4kB2e1AR8DO61QOA75nh545ryKRGfXt7Jd87Tp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJoecujV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC91C19421;
	Mon, 16 Mar 2026 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773659389;
	bh=HBdCmmhHtctxj1golQhPltmCQklAUr8W6M2Q6tKeyGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJoecujV0GhhUofpqraiqNvaycUK2foFtkkhWG/1mZ62T4TLwbg5moDADqE6rzYgO
	 MlEsN7lus4cw/Y4hsYyxzsr8oAH4JRhtU9XAaU4ITQuxLZhs7YyUGNTIx2woO/3Zgv
	 mwTl+MrvvVspIY4QNM3UNGMzEPROiy3GfwHNbSuVkKveOtypeoN68jWceEFa+bZn4c
	 bD5Mk3Gjh70V3CBhlL535R/4c+MzmcbAXGrtojGhXXOzA4J4YBcrFerkmi614Aogv3
	 EuEww9OPB8zOaFIEYrRKSFBcgKMRH8R/FlL2ZGHIZQ95LN+ty5fz8h1DI/rsEY8nU9
	 9fS54PdTj/ATA==
Date: Mon, 16 Mar 2026 11:09:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260316-handshake-subdivide-9de6c4410927@spud>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
 <abbTwrAALGy3QbxN@gen8>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZWjbRAn/4RQId7UP"
Content-Disposition: inline
In-Reply-To: <abbTwrAALGy3QbxN@gen8>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12380-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[iscas.ac.cn,roeck-us.net,kernel.org,redhat.com,maxlinear.com,vger.kernel.org,lists.infradead.org,icenowy.me,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: E353929880E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ZWjbRAn/4RQId7UP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 15, 2026 at 08:44:02AM -0700, Drew Fustini wrote:
> On Sun, Mar 15, 2026 at 12:12:13PM +0000, Conor Dooley wrote:
> > On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> > > On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > > > The G and J coefficients provided by T-Head TH1520 manual (which ca=
lls
> > > > them A and C coefficients and calls H coefficient in the binding as=
 B)
> > > > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > > > respectively), however the binding currently only allows coefficien=
ts as
> > > > precise as 100 milli-Celsius (1/10 degree Celsius).
> > > >=20
> > > > Change the multipleOf value of these two coefficients to 10 (in the=
 unit
> > > > of milli-Celsius) to satisfy the need of TH1520.
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > > ---
> > > > Changes in v3:
> > > > - Added Drew's R-b.
> > > > - Fixed some typos in the commit message and slightly reworded the
> > > >   precision sentence.
> > > >=20
> > > >  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 +=
+--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr7520=
3.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > index 56db2292f062d..7d57c2934a8a1 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > @@ -105,7 +105,7 @@ properties:
> > > >        G coefficient for temperature equation.
> > > >        Default for series 5 =3D 60000
> > > >        Default for series 6 =3D 57400
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >      minimum: 1000
> > > >      $ref: /schemas/types.yaml#/definitions/uint32
> > > > =20
> > > > @@ -131,7 +131,7 @@ properties:
> > > >        J coefficient for temperature equation.
> > > >        Default for series 5 =3D -100
> > > >        Default for series 6 =3D 0
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >      maximum: 0
> > > >      $ref: /schemas/types.yaml#/definitions/int32
> > > > =20
> > > > --=20
> > > > 2.52.0
> > > >=20
> > >=20
> > > I have applied this to thead-dt-for-next.
> >=20
> > That's odd, why is a hwmon binding in your branch?
> >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/com=
mit/?h=3Dthead-dt-for-next&id=3Deb4fd43ff6793681f0a0a8e8ac861142caba2b19
> >=20
> > I don't see an ack on it from the relevant maintainer either?
>=20
> Sorry, my mistake, I should not have applied the binding. And you are
> right to point out that there was no ack from Guenter or Rahul Tanwar.

It was Guenter I was thinking of, but there's not one from myself, Rob
or Krzysztof either.

> I will drop both patches from thead-dt-for-next and wait for agreement
> on the binding.
>=20
> Thanks,
> Drew



--ZWjbRAn/4RQId7UP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfk+AAKCRB4tDGHoIJi
0hWfAQDZ0FufgisOFhUsbTsOfB8kghldgdUrVL5N9dOE+aRvqgD+NxMI7qC0YpnD
E1yazpn740hQ65uhnVmZxGGP4eLCwQ0=
=pOwF
-----END PGP SIGNATURE-----

--ZWjbRAn/4RQId7UP--

