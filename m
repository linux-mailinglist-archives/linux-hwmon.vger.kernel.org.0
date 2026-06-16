Return-Path: <linux-hwmon+bounces-15123-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /OZDFK3xMGp5ZAUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15123-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:48:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B389668CA1F
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:48:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=A9C2MXo6;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15123-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15123-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8D14301683E
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 06:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709B730D406;
	Tue, 16 Jun 2026 06:48:08 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B22E6116
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:48:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592488; cv=none; b=o10JxNWguCpPGOkoSP3S8fifK3HreK704BO8aAggJaIOf9mQEpJP0VXzIgWWQw4k7mfYb3lBlBsl23FZY3FrNZkRuAF7yHhrGxiZe563z9yWPDYTteiEuElDQ4O15158auVpVuZK+s2kV0csOZJkgEcKzvhRFPQmkwi2g7spy1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592488; c=relaxed/simple;
	bh=MeXaezTbO2/SM4Y3Lfxs549fInkNvDNsxlmuLBiqFdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5c1XLkXDysPgoYNMqgSwqzq7KN2zeB9PX798G4Ms3fKhNvx87AwR/0yG7+k1IQUY1n+gfZ+Sy847gab5YL1cqtD+U1+3JNHNT8dQJzMf9gAYWCpL2LYX5g0Iycca+BKONs7tv05Vc3E+CrAByBa8ggPmIvnzzywZh7dXCcmMQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A9C2MXo6; arc=none smtp.client-ip=95.215.58.176
Date: Tue, 16 Jun 2026 09:47:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781592484; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=A76gUiZ4aDyThGOGiHzqul9bR8XwEqccp8Tjwxep0U8=;
	b=A9C2MXo6BlCTjqJNoxD2x3Qs/v51eDZQNuZuYL8a4uclv1EEEP5N/vohkSCdVnD52mN31a
	7qsoKdvNAlWF59P0/A9c1+31r+Rp868Kecyo4Path2l8Q71xXAqpPj7cLVIkghCkhR7h+E
	A4ZOO9Rn8iPbIUKOmRAgWAyfSHYE9qY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	ChiShih Tsai <tomtsai764@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 7/7] hwmon: adm1275: Support module auto-loading
Message-ID: <634e76680ed93e58ebeb35db080138b791cb6c27.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1or0uwXb5QXqKjCD"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:kimseer.paller@analog.com,m:cedricjustine.encarnacion@analog.com,m:chris.packham@alliedtelesis.co.nz,m:Yuxi.Wang@monolithicpower.com,m:hsu.yungteng@gmail.com,m:tomtsai764@gmail.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hsuyungteng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15123-lists,linux-hwmon=lfdr.de];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,gmail.com,analog.com,alliedtelesis.co.nz,monolithicpower.com,vger.kernel.org];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:dkim,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B389668CA1F


--1or0uwXb5QXqKjCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Populating the spi_device_id -table is not enough to make the
driver module automatically load when device-tree node for the bd12780
is parsed at boot.

Adding the of_device_id tables causes the driver module to be
automatically load at boot. Testing has been done with rather old Debian
system.

When inspecting the generated module-aliases with the insmod, following
entries seem to be the difference:

alias:          of:N*T*Crohm,bd12780C*
alias:          of:N*T*Crohm,bd12780

I suspect these are required for the module loading to work.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---

I did not add of_device_ids for other supported ICs as I can't verify it
doesn't cause side-effects. Please let me know if you think those IDs
should be added as well. I would be glad if I got more educated opinion
on adding the of-IDs :) (I can squash this to 3/7 and 6/7 in next
revision, and add own patch for adding of-IDs for other ICs if
required).

---
 drivers/hwmon/pmbus/adm1275.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 9e21dd4083e9..c27bb0e49354 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -927,9 +927,17 @@ static int adm1275_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, info);
 }
=20
+static const struct of_device_id adm1275_of_match[] =3D {
+	{ .compatible =3D "rohm,bd12780", },
+	{ .compatible =3D "rohm,bd12790", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adm1275_of_match);
+
 static struct i2c_driver adm1275_driver =3D {
 	.driver =3D {
 		   .name =3D "adm1275",
+		   .of_match_table =3D adm1275_of_match,
 		   },
 	.probe =3D adm1275_probe,
 	.id_table =3D adm1275_id,
--=20
2.54.0


--1or0uwXb5QXqKjCD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow8ZgACgkQeFA3/03a
ocWU6AgAoT82nT1EGSpddrWfMks6Zk3mySD9Bdxz7pFfZrRN0JduV3ls/X16kvgI
qS3X6EnFyg7Gq1xjB7X8rZ45RODCcYnnQR3O3aw0HuTrsIubC4Q/AN4zhXkDYJNv
kgHO9RvYt4aS7ZZmKWHw4YIY3zIC3KEvC2MHyOzzhcQODy+5OIffHWLpkrvnuyM9
6CLBwOwzyEAhlfpTiA9xa4GpgLENoRh7DBcjdO4CFMl3UoKn20uJpXixeJvfZ+w7
Sj+aE6ow8JPjenAp6tf3bgAXHhh4yfN5hgy6/8dZaKiy0IQgmbq2vUuMPUUSWhZY
eDJovX0KLywjiTrriZN4XACxZuvWOQ==
=TKTs
-----END PGP SIGNATURE-----

--1or0uwXb5QXqKjCD--

