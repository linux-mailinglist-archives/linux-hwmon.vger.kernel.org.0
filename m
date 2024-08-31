Return-Path: <linux-hwmon+bounces-3876-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A396734B
	for <lists+linux-hwmon@lfdr.de>; Sat, 31 Aug 2024 23:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62EC41F220F8
	for <lists+linux-hwmon@lfdr.de>; Sat, 31 Aug 2024 21:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895F017C9E3;
	Sat, 31 Aug 2024 21:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IyoTcNny"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46115C156
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Aug 2024 21:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725138316; cv=none; b=lWEVfIk8YjspBvpr4zWm6fYZrgPc/PHul0SvJVjdXJ3UNffEJ5dLP3kHdTKeS1qW5QxRVb/5qGnAARhA9c/hWimeQoabfRHRePjQ5gm19b+IJ9EEQqWDPW0weSrfs3XFOn9jsSkY2jqFT2Ng0Xpmh18GudHKOaVhuzNQFmCdi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725138316; c=relaxed/simple;
	bh=vdy9irpsNcTTyDq7ZzNHqsgF4Q1XutSFwTkVDozkiZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vB2GipjxnmODoSIG4OdRkdyEsKobk661wB8VbYEnzIQRR++gqEH0TGq5V50NSrMcGZarXAI4x+t5XLc8KJCtGGPA5vhpHSN93mOTMGvBpbpiK2u2/F76vfoBH1BBAyO5/orHEyXQo4KKpQu64/2endCW8P+ltm25hUt7q+73IE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IyoTcNny; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vdy9
	irpsNcTTyDq7ZzNHqsgF4Q1XutSFwTkVDozkiZY=; b=IyoTcNnyXOX2oCMoZn09
	nvbdCEWf+efnAswEsH1SVCHYRuTbAqsfsYP7mxGtOOU/W2RtLvS4Ql2/4u2LxO0H
	R5pxF3LMastWQ2Bl+15WgUPfL4YVUqPKGEiLcK4aAHRNbgygwmLIrSmVv97XyiMB
	mUYPBSWlpZGDXWkc5jElWQUuIKknmqtbtEJm/CJl9rLTaJDBagZ7ebTpZRCDcncr
	ORwl/Iok0sZSGhHP6ROFpvGLaQMOLEbeAb6sCUMMo+21nQ5SGYbGqXDWbY77GpCG
	e6K0HbncBPAPgdVTjKi4zDngWdrds4kAVDEAm+IgTqF9EnuePOHbUz81wmRBN/jc
	BQ==
Received: (qmail 3637232 invoked from network); 31 Aug 2024 23:05:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Aug 2024 23:05:11 +0200
X-UD-Smtp-Session: l3s3148p1@1bE8EAEhEU5tKnBL
Date: Sat, 31 Aug 2024 23:05:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 1/8] dt-bindings: i2c: add support for tsd,mule-i2c-mux
Message-ID: <ZtOFh5ooDARtYa-n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-1-f9f6d7b60fb2@cherry.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QboA3ZjoP/b+0a3w"
Content-Disposition: inline
In-Reply-To: <20240725-dev-mule-i2c-mux-v6-1-f9f6d7b60fb2@cherry.de>


--QboA3ZjoP/b+0a3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 03:27:47PM +0200, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which devices that are reachable through an I2C-mux. The devices
> on the mux can be selected by writing the appropriate device number to
> an I2C config register.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--QboA3ZjoP/b+0a3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbThYYACgkQFA3kzBSg
KbY5Sg//ceGQvqvVmSu+8f+frAs/yQN52m3m1nE4lVbRnHNKmRxFCArx2Fy522yk
KmK+P10Als0D9IJIV4eHOyGxPPQgU0X/hRw0CjzFwVa7gVh8vEvFRJImBNMEfu9Z
fYDTKdlXy+Bn33homk0bXumxAK1bzMClmRQtd43XQPvhhuoQ8E+a/kOqHyZ0pe3t
bOhsWJ43HNQkbxooqfDadc/WIEjX/QSFts63zwQ8FRGC7jcG436dXoi2ZIvyhokL
WmaHWjLYxJIgpSi9XD5iEKcQSShC1nXH7Z+z6iJNoJm5qEun6DzpTyQfTEsOGiiV
ZKWNgYYdg6sftOL0iN8YuV0EOg9mL2u3qldxrJ4XNmZ/4CRzDokdh01qUYkPPYAp
X4bjISpDNWaFqVuwZtG85EMQ/JfsjuhAetIDfjqBo5iNfpfy0fo1q3TEoLT9tYg0
JHRooxxBPvXplMeTzSjk568jAy+mwhzi2ByGENy5SnpGQQmrH435rRaSfrcLFrgm
BDy4Ym2hdwButcHUd9PqlRpohOQrZKT4R3CyPmJkgyrOpQSAOlhZzPzbyyVafpTy
FBe3918uwk8V1bh9HTL0IlkDVGMbXqRsJTudpLHi6pvi8lxGrAwZeKoICPf5UAZc
dlTK8Qn6sALes3NFX91ZLxpgFBIBLq0nhYD/DJiRoi6c6GenGdY=
=rzhb
-----END PGP SIGNATURE-----

--QboA3ZjoP/b+0a3w--

