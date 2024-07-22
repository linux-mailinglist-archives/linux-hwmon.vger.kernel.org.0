Return-Path: <linux-hwmon+bounces-3223-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2F938A69
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jul 2024 09:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EDB528191C
	for <lists+linux-hwmon@lfdr.de>; Mon, 22 Jul 2024 07:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F4A1607BC;
	Mon, 22 Jul 2024 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LNhPfXYs"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0CF1607B5
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721634670; cv=none; b=Px0YxrRgVNiMaqJAod9CCRoFmYZcG/ku5jeT8rNwrfkGprAWAVpZjmux6VEHzAXL8fuuN2105E1ULhtc2MU/eACyxXDLjOfstU+hTMv4IVCjGkwhKZehiHmU/MPHKVTpDKd+dEDVAn7xXlh76f5HsmgfG7Y+6GfMpYFZZUZNPgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721634670; c=relaxed/simple;
	bh=EnH0hjCJsqenVdJIOwLmnk1ZdSWDskungvUxR29H0VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDE7/fd+Vd1igRj9qaM8b0j3KQxnlSW8BvgKp9OfmiRgnh1/MhKfBTIEEvcH6kI6iiMI+arQcfrWkRtneoRkQbNrXB5N6Hq2XI+vsMMU7yYwuVYuc3vMdy5zLKmE/NfYdVmtm9MwU+Ivc3LCe9NYM8xlm43ioOvXsTjBQ2X74f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LNhPfXYs; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so3350215a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721634666; x=1722239466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnH0hjCJsqenVdJIOwLmnk1ZdSWDskungvUxR29H0VE=;
        b=LNhPfXYsPOE2ObCRfUAb+CieFs0aVzwk5AX74GbnwvnvEZu0msTsRuDeJyq4fqPojr
         2F561P6tlczhQjxUGFrfiMsAik9JravoAP1mhhbDOozG1vxP+c5YvFuKJVDseth3ODTe
         jZbVhJ2Hw1JAyn/iisNmJU70mhshmI9qD8kXoHHTSLDrZQUN/5OsLeBNmobZFqdm0LPM
         iY2uvZLs42Xj80/z4PGpVN2DALDKguHpwswWsBj2ZLKwhcJCI4O+uGzt78TO4xzPVW++
         Amu3vRJO0Y1+v6PBcdvv9hBa0+KF/QWALD2yxcmWprN77uUI2yVvC9agm/UKyjE4v/gD
         sM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721634666; x=1722239466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnH0hjCJsqenVdJIOwLmnk1ZdSWDskungvUxR29H0VE=;
        b=p605YJg5mCoGseOdVKELA0nOj17xiIcefBuCvEpnsn1f4XTVX/UdXKBShhGDvK0WvM
         RWBqwnjWiUAjKWa84ZqwCoOuFwxUVcsuVZIONuHbRZQ5GZhVxlypO4sQPIxmbpeuh1Xr
         +8v+p6AvqNzca0Qcfpz3ZByCPkQJrMHWDbB5yEBOgV5+nZiFd/WS0u1LIXlSd+HVYw38
         ldtC5mM2wKz1aWJMdcPxCIZ94cMxOaoq4lBu7wlXeHcBymetL/bEfffudTXTwajECxTz
         5sYGz9IRBH7uU0nO9+n8whNbkR/9B+9U1TxnjgNDtRK1o/MUJrECqO4/wwUxITjqMVEv
         VqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdgHAY6EEFPMj2e1/uqjbOl9GV0tTi8dPOk5hsLqru+qf13NZrY0Sd/obBgurPTM9hWk50tWerj2ZMc6nTSK+rw5alc8TrRPDl4W0=
X-Gm-Message-State: AOJu0YyLBS37r8exVyxOshmXKovB/c6b38vEzWs5LPiwo1hq0wfhPoJ1
	1VrvBWWuEVhe2oLezwhvccWH5JgG3iEdcxpyPb6kE38XsPDZbHs1RkGN3d1dkpw=
X-Google-Smtp-Source: AGHT+IERPpuu0WjjXUrxYUbuy6duds0kLH+r0sY8euaPygoIAdU5GkvLdgJpcNxtsiPzvG1YmGPTUA==
X-Received: by 2002:a50:9b4a:0:b0:5a4:12ea:333f with SMTP id 4fb4d7f45d1cf-5a47ba979acmr3556532a12.37.1721634666398;
        Mon, 22 Jul 2024 00:51:06 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f8808sm5651235a12.78.2024.07.22.00.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 00:51:05 -0700 (PDT)
Date: Mon, 22 Jul 2024 09:51:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (adt7475) Add support for configuring
 initial PWM state
Message-ID: <5fnaskzlfybxiddwhm3fdm774ispvuxdmv4jb4wj5sts2btkf2@gmcfdzx3qvjy>
References: <20240722005825.1800403-1-chris.packham@alliedtelesis.co.nz>
 <20240722005825.1800403-4-chris.packham@alliedtelesis.co.nz>
 <15f4c51c-3f7d-4e93-9c3a-71ac1d626463@roeck-us.net>
 <c261c74f-6829-4888-9836-6f27ba87dc25@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r4x3fdstgdwascyl"
Content-Disposition: inline
In-Reply-To: <c261c74f-6829-4888-9836-6f27ba87dc25@alliedtelesis.co.nz>


--r4x3fdstgdwascyl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 04:09:46PM +1200, Chris Packham wrote:
>=20
> On 22/07/24 15:53, Guenter Roeck wrote:
> > On 7/21/24 17:58, Chris Packham wrote:
> > > By default the PWM duty cycle in hardware is 100%. On some systems th=
is
> > > can cause unwanted fan noise. Add the ability to specify the fan
> > > connections and initial state of the PWMs via device properties.
> > >=20
> > > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > > ---
> > >=20
> > > Notes:
> > > =A0=A0=A0=A0 Changes in v6:
> > > =A0=A0=A0=A0 - Use do_div() instead of plain /
> > > =A0=A0=A0=A0 - Use a helper function to avoid repetition between the =
of and
> > > non-of
> > > =A0=A0=A0=A0=A0=A0 code paths.
> > > =A0=A0=A0=A0 Changes in v5:
> > > =A0=A0=A0=A0 - Deal with PWM frequency and duty cycle being specified=
 in
> > > nanoseconds
> > > =A0=A0=A0=A0 Changes in v4:
> > > =A0=A0=A0=A0 - Support DT and ACPI fwnodes
> > > =A0=A0=A0=A0 - Put PWM into manual mode
> > > =A0=A0=A0=A0 Changes in v3:
> > > =A0=A0=A0=A0 - Use the pwm provider/consumer bindings
> > > =A0=A0=A0=A0 Changes in v2:
> > > =A0=A0=A0=A0 - Use correct device property string for frequency
> > > =A0=A0=A0=A0 - Allow -EINVAL and only warn on error
> > > =A0=A0=A0=A0 - Use a frequency of 0 to indicate that the hardware sho=
uld be
> > > left as-is
> > >=20
> > > =A0 drivers/hwmon/adt7475.c | 130 +++++++++++++++++++++++++++++++++++=
+++++
> > > =A0 1 file changed, 130 insertions(+)
> > >=20
> > > diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> > > index 4224ffb30483..fc5605d34f36 100644
> > > --- a/drivers/hwmon/adt7475.c
> > > +++ b/drivers/hwmon/adt7475.c
> > > @@ -21,6 +21,8 @@
> > > =A0 #include <linux/of.h>
> > > =A0 #include <linux/util_macros.h>
> > > =A0 +#include <dt-bindings/pwm/pwm.h>
> > > +
> > > =A0 /* Indexes for the sysfs hooks */
> > > =A0 =A0 #define INPUT=A0=A0=A0=A0=A0=A0=A0 0
> > > @@ -1662,6 +1664,130 @@ static int adt7475_set_pwm_polarity(struct
> > > i2c_client *client)
> > > =A0=A0=A0=A0=A0 return 0;
> > > =A0 }
> > > =A0 +struct adt7475_pwm_config {
> > > +=A0=A0=A0 int index;
> > > +=A0=A0=A0 int freq;
> > > +=A0=A0=A0 int flags;
> > > +=A0=A0=A0 int duty;
> > > +};
> > > +
> > > +static int _adt7475_pwm_properties_parse_args(u32 args[4], struct
> > > adt7475_pwm_config *cfg)
> > > +{
> > > +=A0=A0=A0 unsigned long freq_hz;
> > > +=A0=A0=A0 unsigned long duty;
> > > +
> > > +=A0=A0=A0 if (args[1] =3D=3D 0)
> > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > +
> > > +=A0=A0=A0 freq_hz =3D 1000000000UL;
> > > +=A0=A0=A0 do_div(freq_hz, args[1]);
> > > +=A0=A0=A0 duty =3D 255 * args[3];
> > > +=A0=A0=A0 do_div(duty, args[1]);
> > > +
> >=20
> > Gues I am a bit at loss here, just as 0-day. Why use do_div ? It is only
> > needed
> > for 64-bit divide operations.
>=20
> Mainly because of Uwe's comment on v5. I think I've avoided the original =
u64
> issue now that I'm converting fwnode_reference_args::args to a u32 array.

My comment was only about the build bot finding a division where the gcc
stub was missing with is an indication that do_div should be used.=20

Usually for PWMs perdiod and duty_cycle are u64, but here it's only
about values from the dtb, so they are u32 and a plain / should be fine.

> can probably get away with plain division, although 255 * args[3] / args[=
1]
> might overflow in theory but shouldn't in practice.

I don't like possible overflows, but I don't care enough for hwmon
drivers to object. Still a check for args[3] <=3D 0x1010101 would be easy
enough.

Best regards
Uwe

--r4x3fdstgdwascyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaeD2YACgkQj4D7WH0S
/k5n5AgAoiOFkhm/1XqNRpW8sFdlsQuirycWjHtM7CNcf9FXDizyShxG1sMeFYq4
hgfzlOKpzvMGZlrORtwH2cgZpK9baBzm2Z0jjRETdkHg9cFKhXzAlFWClNEnekwC
dHuQOeE/0a6CNVb2b2kIps+9AVHutvTqLf4BUxuUieWCmiMA33bJp/j11ieYvW80
9b/vXu5p8zgBACGJt8Jaz0DgKAbTuF/xorEUP+w5CKGS401cjkTQvD0pzCYFk0U8
HJ/tGE8GaT7xUkuWECmydZ3psWxTwkXJZ2AKtzUqstBREJiDRO9j9ywST8IBgZeD
glPw1K3wbIWgsueafREfGF/LF6f6+w==
=/pvZ
-----END PGP SIGNATURE-----

--r4x3fdstgdwascyl--

