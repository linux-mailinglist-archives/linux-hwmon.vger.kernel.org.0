Return-Path: <linux-hwmon+bounces-2463-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EC8FAC1C
	for <lists+linux-hwmon@lfdr.de>; Tue,  4 Jun 2024 09:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FF5B1C21317
	for <lists+linux-hwmon@lfdr.de>; Tue,  4 Jun 2024 07:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3217A1411CF;
	Tue,  4 Jun 2024 07:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i2Nkwnu4"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653B13DDD3
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Jun 2024 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486364; cv=none; b=HMvZA8jhEHpLxskt+AG5PzPpoDhKQUp9NW6Oxe9JRztzF/phRQVhOn52frdpVHO4M09EB4KouAkLTwpmwXhb/9Wr1RP+a3lj1xvBi3rww4zKtW+OUdnszZq9NCAMaqvjyLQVww2ykDw/QGUCR6mbI0LfssoawWSbHknBOAVmgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486364; c=relaxed/simple;
	bh=Ujz/zfpcQ6BLI2zjQe9Y+T2vISqVPbTtEhYczP4Jm38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0bbAeRXDhUikeDl/DFqSIk6vf8VssQYXABy/LKNu2b9a587lBshk/g6pzOfhI+xhaDecFcfWOkmIAuk/dJ3PVo2yl8SbDhbPBRRyaQnrL14OY9oz/MUG/AvcDns8otAOSLkohDSwBbRbzqvN/lgkT1tD8TC59sHcoY8RZQK++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i2Nkwnu4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ujz/
	zfpcQ6BLI2zjQe9Y+T2vISqVPbTtEhYczP4Jm38=; b=i2Nkwnu4Vr7pXlB1wZKm
	cw6WKvlQJXPe8Oqjl2a24yJV8V96FSX7FF/QtFQ2/AVmU7QZHtShIaBGqc7pX3NE
	WYy9dUOia4nE8qTMqwUGvdM8gdNgjXN+pC7n+6MjjMf/JSZ1wsM0MEl4URx02FS5
	JB/wg953ZPY64FeSZw+GNFWfHsFjmoSjewzBlRdLuDbCS9D8v92KU295q48t91V7
	PBfGrsCjrXD5fpiWMKzTMa2sgHEK2/zBgA73qzdK6ExzqAm8NpXoD9t6R5btHe5a
	zCeQGbBAG+K/i7wlPc5FQugznNN2kGDGCnAVCnttFCyk/WKMoL676Xl/TIEul2j1
	DQ==
Received: (qmail 2204332 invoked from network); 4 Jun 2024 09:32:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 09:32:32 +0200
X-UD-Smtp-Session: l3s3148p1@tAn0cwsaZOwgAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 09:32:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Message-ID: <54enqf5e5is5coam4zhtyfeozztbig4mutipx4ymiffiqzilku@vguwowy3eliw>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?utf-8?B?UmVuw6k=?= Rebe <rene@exactcode.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Armin Wolf <W_Armin@gmx.de>, 
	Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l23s5njp5c7tbgtc"
Content-Disposition: inline
In-Reply-To: <20240604040237.1064024-6-linux@roeck-us.net>


--l23s5njp5c7tbgtc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 03, 2024 at 09:02:36PM -0700, Guenter Roeck wrote:
> Detect DDR5 memory and instantiate the SPD5118 driver automatically.
>=20
> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--l23s5njp5c7tbgtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZewwwACgkQFA3kzBSg
KbaXKA/+Jh/G/GTAT7BTuVDgvpSkRWluGsnRWY5fO/M0cDwAHV+gcfuNMyIlkwpe
Z/eiKI8FKj5N9OlAQFH3NdRFS22poYU/DfI/GF0019GxvnJf/tGdF+zBRBmnwSRF
AXTU3DUkJjV5w0Ajh7UPQ8gJFqPJtTLm/zIpJfbPVfzLeB2xNmwWnU7BnhwfqX0S
HWJ8TJ3KIEppRYfoPXBUgWVGXo9I7trGkFuuWEO8N6iDv5/wl4mB56a72QpeHnIH
W7l1GPeIbwU/NLezIyG/q0od/8I+NTjKMtHI2BzPEO/qJUJ0Qzh1bHOkw6iGXwmO
NHFPXdK+4h1oV1n3KRj/j4gzaw0ew5T0r3SxusHKbLwnkf6VSdB8rT5Cxce1qsNf
4EIFw5yQis7PjC+LkGTzSZcxvJBHb9S9NOFh5YITZY9GlKMeenkX2TkVQbLllU1L
odAxeRX9fl2qUa6mXR9cKu+bAkgwKCfTMhnqkv1JaNevurgY+Xwe3e34DTkobaXr
bWRuPAa4mnkfk1n3kQPBXh6EZyMKbP0KD7P/OFH0UJdvFY2DT6A2Hj3jndurnDoO
Fu1iJtvGJY9nagwzF+sH1QnAnmThTUeorjrbQMLqVDyvLTeJBXIxdKy548wKyP8V
QGeobzBAl8oo0lH/BRZpeTRj20Ai6oJh5nBCKp6KwrSaX3OCNGI=
=FKVR
-----END PGP SIGNATURE-----

--l23s5njp5c7tbgtc--

