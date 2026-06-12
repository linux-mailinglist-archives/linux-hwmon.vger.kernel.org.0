Return-Path: <linux-hwmon+bounces-15074-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WngtMFYxLGqKNQQAu9opvQ
	(envelope-from <linux-hwmon+bounces-15074-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 18:18:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87867AD0C
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 18:18:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=biw5zaLg;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15074-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15074-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88E2431F1F64
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 16:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71BC219FC;
	Fri, 12 Jun 2026 16:12:37 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C638D3FE;
	Fri, 12 Jun 2026 16:12:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280757; cv=none; b=fP6fqZivAMeI/F8oh1JzwKczQf2rJ9X/Ml+EeRnqgxZxKDTBARTOSmSihpvRbwv1b6/63VTQOjJANQw2dijtfFz3EQx+98MrN25EJlVnhcRpr88InJNv/gm//30eMZ3jNp5Da9xXIBmrHhAmFEGv/FPT0VnuhoaP7IrbHyVls24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280757; c=relaxed/simple;
	bh=J9eyQs2CHRbvAhdaMfyGhbERyFF7Zxyw2mXhc8bHpUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpD5kDXeCDt7TjU39lCZ18647F+5Uo5cPTXx3CtsHXTJdfPamTGtJ3T6M+nKhD0PZFuBUF3ZIgfk4jLQXjVqN3pYiAhDX0dfo/j7kZ6iHZrWc4M9dF6ZpKPD3WTQgNtbMckoyAEbbbRT7o06HqLdIKGltjG7P2amy7MuX6P92pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biw5zaLg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED2A1F000E9;
	Fri, 12 Jun 2026 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280753;
	bh=z02Ls5D3gWOFaxVY1Vrlu09mzE4H0tHUI1xrrSHZ/To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=biw5zaLgZJCPCNZQGYbIQFDJHZEafNvamooNnpBrPI1VpXYh7Ru7yJA/DVbBgD024
	 ifVSs43LN/P8jXKk/96+B7KpQ8ZcXaP7ahZipJWyPqv0znFyqFOKfFe7x9EDNV9Vuc
	 Ir40WSD2ootjyhuElMZHjDJfTBjZBKIRvCbeoHrLyuI/N6RBKN+DcarUFncuDFRntt
	 oW7UWkGPe4/xKRFva46w7h/w/THuaMp/+suY7GNkgPJAK+UF23MfvxFgWgTq1Vj0tA
	 +81qCprPt9YmoL0jDzrMif2VIKjaJxOC+VM3dfpgpf/CsujgAXYjwdBXDZq9jJ+xnj
	 u4z2yid8INFmQ==
Date: Fri, 12 Jun 2026 17:12:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@qunatatw.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Message-ID: <20260612-lecturer-unclad-d80218119ae5@spud>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
 <20260611-mocha-strive-a7f3265dd3f4@spud>
 <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S4zO5QqditTU704k"
Content-Disposition: inline
In-Reply-To: <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:zev@bewilderbeest.net,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@qunatatw.com,m:potinlaipt@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15074-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spud:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B87867AD0C


--S4zO5QqditTU704k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 05:10:38PM +0800, Potin Lai wrote:
> On Fri, Jun 12, 2026 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
> > > Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boole=
an
> > > properties to configure the device's Current Limit (CL) behavior using
> > > SMBus settings instead of physical pins.
> > >
> > > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > > ---
> > >  .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++=
++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066=
=2Eyaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > > index a20f140dc79a..95ea7c26dec2 100644
> > > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > > @@ -46,6 +46,26 @@ properties:
> > >
> > >      additionalProperties: false
> > >
> > > +  ti,cl-smbus-high:
> > > +    description: |
> > > +      Configure the Current Limit (CL) to use the SMBus high setting.
> > > +    type: boolean
> > > +
> > > +  ti,cl-smbus-low:
> > > +    description: |
> > > +      Configure the Current Limit (CL) to use the SMBus low setting.
> > > +    type: boolean
> >
> > What's smbus specific about this? If the pin was connected to a GPIO,
> > you'd then need to have different properties or use these ones with an
> > inaccurate name.
> >
>=20
> The "smbus" in the property name was originally meant to indicate
> that the setting is configured via the internal register over the SMBus (=
I2C)
> interface, rather than physical pins.

Right, but if you do it via the physical pins using a gpio, you still
need a way to say what limit is. The status quo only works if the limit
pin is tied high or low.

>=20
> > Please also spell out "current-limit".
> >
>=20
> I will rename the properties to "ti,current-limit-high" and
> "ti,current-limit-low"
> in the next version.

Other thing that might be worth doing is making the property a string
and just having `ti,current-limit =3D "low"` etc.

--S4zO5QqditTU704k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiwv7QAKCRB4tDGHoIJi
0hrAAP9jl+N4lt/L2Aof9LFMvWZ4NkHJKwrlnrQChX8xVnY2iQD+IedBFc05axoQ
L7i0tC+Fntx5yWCb3pFiMWOxOhI3iwE=
=/Iuh
-----END PGP SIGNATURE-----

--S4zO5QqditTU704k--

