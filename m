Return-Path: <linux-hwmon+bounces-6469-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A67A28A5B
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Feb 2025 13:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0D573A319A
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Feb 2025 12:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6929021D5AD;
	Wed,  5 Feb 2025 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QlxGwEcp"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9A8151987
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Feb 2025 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758911; cv=none; b=asNtJzVN+s4i0F/30UD4s4ajDvT18BOytHbJ3wdTXTmqd0Ww15W8L3heSE2P3Jgg0XBvvz4U3aaU8qPrkLCzF4Ry23R7nHgdwMVsRV9CXiANccEGadxMeXpbyXAI2ncFNnXe59lNANbPFZxOynAFDnFd/Kxk7TQL3f/QSuqBlMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758911; c=relaxed/simple;
	bh=HKtk7nun/CDX+ZLZBXi9GMOYS8u7yI+Qth8N4E7VTYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzYs+wo1Mj0Apufb2Vxi/CDa0b4i2v2vAo78wtG0NxYEVze75R710M6/fG43Lyh4EDy95aZ1FyJZVrNQ8DIYDzEXxXVoLre6SFIt1xj+miMaDyMAbjXeQdSEtJoUqJlAnmzt9YuslvZmdPtBlo3ACd4B7twxxBghwdjrjLb7Mow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QlxGwEcp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HKtk
	7nun/CDX+ZLZBXi9GMOYS8u7yI+Qth8N4E7VTYk=; b=QlxGwEcp81SuzZ7Jow2e
	Qk15EmxRFsmgukMmIlJGoOC3UCbZ1ZYuR7JsxtcOo/GhUOl/n7ZltdEjr/8DC0ak
	aG59PtOwQKsbZQUHQUgxPKmS13Exck/dOf5V8azscso6DhJURcV8j1jVZwV43JR4
	yyKsjQpIoHrvQot+3AdWBmgaR1efOMP9KTJg9OMzs6GOjOthM1QwVzt3bnPdwJoT
	m8YjKbWfASW8adade/xA6gYDGE/1EQl1FPGPXAt+b/xdIWxvmYDc+OFwo6Onf9/s
	jSBf0tzZpGko2qVpZj9eVQham/WjiRYFNiMXvRvn7wCdoJ7Vp+G2YNKgmFc05r22
	wQ==
Received: (qmail 3387770 invoked from network); 5 Feb 2025 13:34:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Feb 2025 13:34:58 +0100
X-UD-Smtp-Session: l3s3148p1@PcV1WmQthtJtK3Ha
Date: Wed, 5 Feb 2025 13:34:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sg2042: add back module description/author tags
Message-ID: <Z6Na8fcitFSFGOVT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250205121419.373464-1-arnd@kernel.org>
 <kdvu3xjreyycftkbsomqzc3e3y6mkom5u25co5rqwqem4n7p47@xnmhg7mkxsmw>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IwZMQdqnEyYDIvBA"
Content-Disposition: inline
In-Reply-To: <kdvu3xjreyycftkbsomqzc3e3y6mkom5u25co5rqwqem4n7p47@xnmhg7mkxsmw>


--IwZMQdqnEyYDIvBA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 08:28:56PM +0800, Inochi Amaoto wrote:
> On Wed, Feb 05, 2025 at 01:14:08PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > A previous code reorganization inadvertently dropped the two tags,
> > which leads to a "make W=3D1" warning:

:( Very sloppy, I am sorry!

> > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/sg2042-=
mcu.o
> >=20
> > Add these back.
> >=20
> > Fixes: cd4db38c4368 ("hwmon: (sg2042) Use per-client debugfs entry")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Just wondering: Inochi Amaoto's email above is using gmail, below is
using outlook. Is the old one still valid?


--IwZMQdqnEyYDIvBA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmejWu0ACgkQFA3kzBSg
KbZulQ//VYN3RP286eEFUM9k2clOLNJ5NvYOYU32K1kB6CZCyycmXRmLewEh6ojP
QMHFMB3g8seYpZa8KeSGnMMR7DUwbPZbIbhk6wL2uiiz1+GD9R/AWAEmcYHPrb66
l8vxRehf/vVBRM+5lL1jjGTX4S+3B9iMff+Vs1AJo+2cIcwYJYQZDLWEICbMwYup
P9mHUy+KZRYrG0OTximtovL/WKFU7p/whPfKRXND+oz1TscdHcctJhCXyEQFND/U
3MmkcgNp9Si6AN+TOy/aWUGtOf0JKubB+D2cOFEUVfwVE91WjSwkSRJvBz4H+y+D
g+wiQq3Il9NdnXQeGwLJkJkk5YP66op/jYeDAiecD1VuhQX3CfeSW6hYnxCifomB
7n+Wd0uF2HHqeMgeOdYfVY3VjAYmhMGog4kZ7vn226WjIN6uuBeYbIJj8SyIn/Zn
R5uxvDrUNHAVND0izjiepz8BOKgNVasCak/qBxA8I50X4bTIGKhHO2v8aeacG0vm
ajBwkN6lnH13j3rw6IrtSTXIsUKauRxDpbVjG6gFo+gint8N7PRbKvvnDZ9MaZHc
ra7IP5FxfWKO6I03OPsHThnF2toQlzfXQi8mzfXipu+rAkUYInNFHtu/NQL4Zled
kNsU+YzGk9G72iGYPhv/+0meACZ3mzi4btYpHrC/ABk6KuC79OQ=
=p5Fk
-----END PGP SIGNATURE-----

--IwZMQdqnEyYDIvBA--

