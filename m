Return-Path: <linux-hwmon+bounces-15281-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id njuFAVj3OmpxNQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15281-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 23 Jun 2026 23:15:04 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 800416BA386
	for <lists+linux-hwmon@lfdr.de>; Tue, 23 Jun 2026 23:15:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kZgljZL4;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15281-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15281-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CCAA3028353
	for <lists+linux-hwmon@lfdr.de>; Tue, 23 Jun 2026 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0D73AE6FA;
	Tue, 23 Jun 2026 21:14:40 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470263AE199;
	Tue, 23 Jun 2026 21:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249280; cv=none; b=F1lH9aYWcUl/VmrKCysa1WSx3YR3oOeyNOaMkT9LoFs+uc4QrHyuuZTQYk/3DPKhwMikT/nFOfnfp0pXaYqrpwSZS5wGpkSRjg44Z65ypWHVPNzAfew2+DPM9QH1qo4mHK2NWFg0Tl6MjUscm8kaDQJur/2CRAm+QLkeiBvryTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249280; c=relaxed/simple;
	bh=L545s0y/f5SRTt2r1MwPpF08m3pJeqJOFV+FfwuK8D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mILxrTcW2tWr9eCCuaRndGwZVchzf4t7QsX62VPI0rO5BonFoD3AQuWeoU0IB5OXEkSgjVK/0Yxl5ionW9setEJXoOvJac+GRc8mOHnTCrIYACSPtMutTUUH8T2eYe6HO32QXfh2gWkLzTcQoaCufhOpMnsi+Sua5gVMb7HVP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZgljZL4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F031F000E9;
	Tue, 23 Jun 2026 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782249278;
	bh=zcIIErkGjpS9gouJWmWe/uRTsPwJwxCtmfwJLTVE1Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kZgljZL4eEFYV3KFuxXkTE58t5e0Pp6/EX1FUdnGcIuLrR0GY/MVjttIyJlhBbHYh
	 /Ud+U2h8Z7fuEQd2Tq6wYrQ1IzmXtRUSTTLByk9dJdR824d8S2LRAm/noriXMjsUXq
	 4xVK2IzyIG2IUjE8q4Z7SQsnUgdx7SkIwGQzsekWPc08pyljbVu2UP3mKhvqzIyDvb
	 OHlH1LLzxBNWfP3fpKgHXQHGWCmCYWpvvDJC0HPTj7SXUfQ9x5cprQpR3Rc3jGxTqd
	 nDhC1LVoUQxkRbFno3ZCgN4P2XgnX3Enviqid9FiAbNCKP5W52hqVNyMyivCS0hDso
	 Y2RZkFknrweKQ==
Date: Tue, 23 Jun 2026 22:14:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
Message-ID: <20260623-scared-judgingly-7efc1c188670@spud>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
 <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpb6Ztvu8fvBKW7J"
Content-Disposition: inline
In-Reply-To: <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15281-lists,linux-hwmon=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Selvamani.Rajagopal@onsemi.com,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 800416BA386


--lpb6Ztvu8fvBKW7J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 09:01:32PM +0000, Selvamani Rajagopal wrote:
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi'=
s FD5121
> >=20
> >
> > > +
> > > +title: onsemi's multi-phase digital controllers
> >=20
> > Can someone explain to me what a "digital controller" actually is?
> > Seems very generi and that a word may have been left out, were it not
> > for the fact that this wording is used several times in the patch.
> >=20
>=20
> Thanks for reviewing.
>=20
> According to me, "digital controller" means the controller uses digital c=
ircuits to implement=20
> the features and functionality. We can remove "digital" and keep only con=
troller. It won't make any
> difference for Linux documentation.

My point is that what's actually being controlled is missing. Maybe it
is obvious to you, but it is not to me. Your nodename in your example is
> +      fd5121@50 {
which doesn't comply with node naming requirements and I wanted to come
up with a suggestion for what it should be.
I am assuming that its power or voltage that you're controlling so
either it should be hwmon@ or regulator@.=20

>=20
> > > +
> > > + enum:
> > > + - onnn,fd5121
> > > + - onnn,fd5123
> > > + - onnn,fd5125
> >=20
> > Your /OF/ match data in your driver suggests that you intended to permit
> > fallback compatibles here?
>=20
> Agree. Sorry about the discrepancy. Will fix it.
>=20
> >=20
> > |+#ifdef CONFIG_OF
> > |+static const struct of_device_id fd5121_of_match[] =3D {
> > |+ { .compatible =3D "onnn,fd5121" },
> > |+ { }
> > |+};
> > |+MODULE_DEVICE_TABLE(of, fd5121_of_match);
> > |+#endif
> >=20
>=20

--lpb6Ztvu8fvBKW7J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajr3NwAKCRB4tDGHoIJi
0p0RAQD36EDbuOtkF4cQhFpa/Fx2gItOFPFFN3q1M7BYekYz2AEAkPDxvFp9Qijd
Oorv2sjNmq/fbSd8xsRo5bBS62nxVgY=
=NHME
-----END PGP SIGNATURE-----

--lpb6Ztvu8fvBKW7J--

