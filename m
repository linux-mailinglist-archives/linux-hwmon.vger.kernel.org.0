Return-Path: <linux-hwmon+bounces-7418-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B17A71D43
	for <lists+linux-hwmon@lfdr.de>; Wed, 26 Mar 2025 18:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 209D8178915
	for <lists+linux-hwmon@lfdr.de>; Wed, 26 Mar 2025 17:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E93D23C8BE;
	Wed, 26 Mar 2025 17:36:31 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7DE21577C
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Mar 2025 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010590; cv=none; b=i/gzElNZ8gFJqcHSduhnUgqZhAnupoDG06EpZz9wUeZu5H2P/VFRhU/qHC3Ex3yFcmJcBcA6Twg9t98l2KveFjtdROBO80nnslsguIAWxnHVuxNfk/QrysJQX1zx/m0zLnDZ8+1fxHMmFkzCQ1Z+rKcNbvVyruN5pgIpUbicE3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010590; c=relaxed/simple;
	bh=1VrlRkek0WqK4HdrG8gRnbeBPzHFXN/BnW7I901OUcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFKLE/MJ+m7ZbhI+9dysbpnwrhnGrgainKI5YpEpJwxKMC6s0D0F1xheovK3+0cjXFNsRYgIDP4O9GqGcxOCDNGouFNwShcvrQjhkMIIcDVNqblIB9Qai8Roapc6UlO8j8afBZNybvvybGxaspflVLUUYu7xl+guCabs0ghSpHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1txUfR-0000ck-SV; Wed, 26 Mar 2025 18:35:53 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1txUfO-001nHx-0b;
	Wed, 26 Mar 2025 18:35:50 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B6C7C3E7719;
	Wed, 26 Mar 2025 17:35:49 +0000 (UTC)
Date: Wed, 26 Mar 2025 18:35:47 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250326-utopian-mega-scallop-5f6899-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
 <20250317-outrageous-helpful-agama-39476f-mkl@pengutronix.de>
 <CAOoeyxVF9baa8UKJKWcbTLzvMo3Ma=GRCbdnBSoGOw0Lk5j4sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3fo4gps22dugmrwp"
Content-Disposition: inline
In-Reply-To: <CAOoeyxVF9baa8UKJKWcbTLzvMo3Ma=GRCbdnBSoGOw0Lk5j4sA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org


--3fo4gps22dugmrwp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 26.03.2025 10:37:11, Ming Yu wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=881=
7=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:01=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > +static int nct6694_can_start(struct net_device *ndev)
> > > +{
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > > +     struct nct6694_can_setting *setting __free(kfree) =3D NULL;
> > > +     const struct nct6694_cmd_header cmd_hd =3D {
> > > +             .mod =3D NCT6694_CAN_MOD,
> > > +             .cmd =3D NCT6694_CAN_SETTING,
> > > +             .sel =3D ndev->dev_port,
> > > +             .len =3D cpu_to_le16(sizeof(*setting))
> > > +     };
> > > +     int ret;
> > > +
> > > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > > +     if (!setting)
> > > +             return -ENOMEM;
> > > +
> > > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> >
> > I just noticed one thing that needs clarification/documentation.
> >
> > You have nct6694_can_bittiming_nominal_const and
> > nct6694_can_bittiming_data_const, but only pass the bit rates to your
> > device.
> >
> > Do the bit timing const really reflect the HW limitations of your
> > device?
> >
> > Are you sure your device uses the same algorithm as the kernel and
> > calculates the same bit timing parameters as the kernel, so that the
> > values given to the user space reflects the bit timing parameter chosen
> > by your device?
> >
>=20
> Originally, I only intended to provide NBR and DBR for user
> configuration. In the next patch, I will add code to configure
> NBTP(Nominal Bit Timing Prescaler) and DBTP(Data Bit Timing Prescaler)
> based on the setting of nct6694_can_bittiming_nominal_const and
> nct6694_can_bittiming_data_const.

Sounds good, but this doesn't answer my questions:

You have nct6694_can_bittiming_nominal_const and
nct6694_can_bittiming_data_const, but only pass the bit rates and the
prescaler to your device.

Do the bit timing const really reflect the HW limitations of your
device?

Are you sure your device uses the same algorithm as the kernel and
calculates the same bit timing parameters as the kernel, so that the
values given to the user space reflects the bit timing parameter chosen
by your device?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--3fo4gps22dugmrwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfkOvEACgkQDHRl3/mQ
kZzpHQgAgGRAJKZUC90pxD/IpTMDutPBbTPEyhq69hM419fjym5rJ4HxuM6meZHF
MCGE5zEy8fsC05K8QdtwmiAmvaGYg8b/Ky/4MTwj0R5AjFqfWFghJJ5hrypphQzB
ZKiyvcnkIAxTgkEZlMg9MBQf+OdN5Q3Z/nHLPvfk0OHrsz44UqxPAfWuMI6HWoaN
RTSbxLxlKoAWEDTzmyT6YAyehq42fVSdsC+FK82lQmloaAkq7dkQAUmaJn1pTEHL
+ea6VayK34n+e3kzz2OkTDrOIvJwDSdX0lMrIT9A97ju+hgzdQSY839BL5xOvDEe
9TFcEhv92TjknvV5PdmFfiwnNLDNHg==
=T1kB
-----END PGP SIGNATURE-----

--3fo4gps22dugmrwp--

