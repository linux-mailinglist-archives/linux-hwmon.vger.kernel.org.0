Return-Path: <linux-hwmon+bounces-13750-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL+qIDaQ92k6jAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13750-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 03 May 2026 20:13:10 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7374B6EE5
	for <lists+linux-hwmon@lfdr.de>; Sun, 03 May 2026 20:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B6F63001598
	for <lists+linux-hwmon@lfdr.de>; Sun,  3 May 2026 18:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6845F39A818;
	Sun,  3 May 2026 18:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgMBReOV"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450E423E33D;
	Sun,  3 May 2026 18:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831985; cv=none; b=F5S3BCIqns241rVYT7Ezdikk//HX1zNO0l+JDG+JMEJFRG7fY1srf7ZjI5iMVxphyT4+ifrh8+KvuEar+el4ptn9SdsqeqomkuX6GhoZK0jyq7TmbLwRVgH3IhikyHhQHqt/adInuCT5n1vAoQMuCCepkh53wmgb57JF4J4OBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831985; c=relaxed/simple;
	bh=6klYnKC4RXHOdJ3ZuuclrwuTvOEpiEC/KlJrZ4KodOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBO7ViCgcLYpqjcv9VACu5WD98Nm3/1Zf04bWz7y2LuDxNNWCkxqUjSm9RxCraeNnkKPrCVA/MAf6ih3kBn5fqvilcU4qIkkDn2rtUtF1O5tGtGtxBdAeJrQWY0BC5YOkayyg0PJCt93EeY+rZ3s7qy1EyWIwxb5hlPwOtr/1F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgMBReOV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE02C2BCB4;
	Sun,  3 May 2026 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831985;
	bh=6klYnKC4RXHOdJ3ZuuclrwuTvOEpiEC/KlJrZ4KodOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgMBReOVIQqxZTLgYWJyxf+rLTn2fDZeQbxZHAYeMzS6Ece6sF/iExepd0VJyAi2U
	 wPT9CqaMrcD1oH57ZGu4tLb4V3L8Gbr7wwRrKeYoYyIVaMy1mAAElXI4QHsmYWkETF
	 YjvsQNAqZ/Ru7myxJWUoAnqXsRa9gyp5Dql6i7tNF9lLyb8tA3sqhTbq/2RG69MRrj
	 WM+V+cjJmIhfqqWbH/CIbI9ZDMaQto5RsALldjiMyhVsZ5HMliottF/6TvOwiAwIA9
	 YpaxX+g+CdpI0H6LLWgzk0M5g9EFE7QCTOkRerBYnCy/5Blai1ITaKpxQrSheZJ7H6
	 yN13oFVERHO8w==
Date: Sun, 3 May 2026 19:13:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: lm75: Add
 ti,alert-polarity-active-high property
Message-ID: <20260503-ravioli-spirits-476c1d1152bc@spud>
References: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
 <20260502190408.3577731-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j1lCQ+r1Alurczau"
Content-Disposition: inline
In-Reply-To: <20260502190408.3577731-2-markus.stockhausen@gmx.de>
X-Rspamd-Queue-Id: 7A7374B6EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13750-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gmx.de:email]


--j1lCQ+r1Alurczau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2026 at 09:04:07PM +0200, Markus Stockhausen wrote:
> The LM75 alert pin is asserted based on the value of alert polarity bit of
> the configuration register. The device/driver default is 0 which means al=
ert
> pin is configured to be active-low. A value of 1 maps to inverted (active=
-high).
>=20
> Add an optional boolean property "ti,alert-polarity-active-high" to
> override the alert pin polarity. When absent, the default active-low
> polarity is kept.
>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--j1lCQ+r1Alurczau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafeQLQAKCRB4tDGHoIJi
0rpEAP4gNXB8UozmLy3fgcBpQiGh/JAciUwbwkxxC0VcQs5YNgD/QnYoL4m6kQCc
Gqxznm5rGlmKbwLRwepqpawknoK50wc=
=LHJW
-----END PGP SIGNATURE-----

--j1lCQ+r1Alurczau--

