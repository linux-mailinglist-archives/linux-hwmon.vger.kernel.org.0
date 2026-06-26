Return-Path: <linux-hwmon+bounces-15359-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wJtdGkkpPmq2AgkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15359-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:24:57 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D49996CAEAE
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:24:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=grOK+Jg9;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15359-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15359-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFEE03027D9D
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E31B3DEAC0;
	Fri, 26 Jun 2026 07:24:33 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FAD3DC852
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:24:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458672; cv=none; b=Bl6y2oYbRg2cyuATYQnErCesuCNdmJdPTgzkT+9SsE1gI9dhEdN0iNM7xdmPumSu1IZNL6EfpJIULrwZ3Pyr1YRFA7AKHkI25HX5JrigUP+uUZpZ1YtuQDXXEcLzz2lPQdSm01ieFWbmIuqi22fVaWw81xyG9S4F96eE9lsK70E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458672; c=relaxed/simple;
	bh=+TkcyByXIsz+G5C5zA1M0W2rna0mseSf5sFmrlWVdYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1uRDiqlMag038+zzbAue6amxrwAp0AasNWBxpUzNDB8fQN1GLrifBskmvx+Zmwq+q+0OHzlSp6ssUtea5wQqB7mYorj2+mUuVZiLWwlKqEjH7wBuH44Bh03XHEamXhT6ipW9R9QI6S2vPdH9PIgQ+5QuE0X0Hwi1PirfoZlY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=grOK+Jg9; arc=none smtp.client-ip=91.218.175.184
Date: Fri, 26 Jun 2026 10:24:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458669; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=y9lauTujo3+b9EsJje89n8+Boh4b58XmlsS/SOzXP2E=;
	b=grOK+Jg9MQp6txvDabltPAntM1PexuC21HGrrLHrTZFJnAws4yuzkq1/1KlCEpuGHir2SL
	FgAFcIzCu6F7j7hWGNQ2CGlCmUmRxNf3IEz69eYeIGcGxplhZyJvS75Yw4B5KKzynHZQHE
	cjgsnK1EGlZMkL4L1iAnmRIMAyQ3BiY=
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
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 4/9] hwmon: adm1275: Support module auto-loading
Message-ID: <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eL90SqlSBXTOmepm"
Content-Disposition: inline
In-Reply-To: <cover.1782458224.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.24 / 15.00];
	SIGNED_PGP(-2.00)[];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-15359-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:vasileios.amoiridis@cern.ch,m:kimseer.paller@analog.com,m:tomtsai764@gmail.com,m:chris.packham@alliedtelesis.co.nz,m:robert.coulson@ericsson.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,lwn.net,linuxfoundation.org,yeah.net,gmail.com,infineon.com,cern.ch,analog.com,alliedtelesis.co.nz,ericsson.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D49996CAEAE


--eL90SqlSBXTOmepm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Populating the i2c_device_id -table is not enough to make the
driver module automatically load when device-tree node for the
power-monitor is parsed at boot.

Adding the of_device_id tables causes the driver module to be
automatically load at boot. Testing has been done with rather old Debian
system.

When inspecting the generated module-aliases with the insmod, following
entries seem to be the difference:

alias:          of:N*T*Cadi,adm1075C*
alias:          of:N*T*Cadi,adm1075

I suspect these are required for the module loading to work.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> v2:
 - New patch as discussed with Guenter here:
   https://lore.kernel.org/all/f080e20e-6ec7-4744-9794-0a92d03f48d8@roeck-u=
s.net/
---
 drivers/hwmon/pmbus/adm1275.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index ccc3ad21e38e..1ea2037711e1 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -870,9 +870,25 @@ static int adm1275_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, info);
 }
=20
+static const struct of_device_id adm1275_of_match[] =3D {
+	{ .compatible =3D "adi,adm1075", },
+	{ .compatible =3D "adi,adm1272", },
+	{ .compatible =3D "adi,adm1273", },
+	{ .compatible =3D "adi,adm1275", },
+	{ .compatible =3D "adi,adm1276", },
+	{ .compatible =3D "adi,adm1278", },
+	{ .compatible =3D "adi,adm1281", },
+	{ .compatible =3D "adi,adm1293", },
+	{ .compatible =3D "adi,adm1294", },
+	{ .compatible =3D "silergy,mc09c", },
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


--eL90SqlSBXTOmepm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KSUACgkQeFA3/03a
ocWShAgAj6XuP8HnTB2dr56OnUFuJvZ8GXSiKELgQ+wCG6FcNyqVYhU9xvNwCFWt
KdjmsqsJQMmrulr6TMogCw4K1+ZiWu1EZczu5B8FdQJpd1pMnQrc2zxApeCr10iv
ngCQQYt6nf4C0E8J+u3pDvPSRcJ/rW/M6T2WhfStEVOg8H3iWU0lEmtsH4/8Nu+D
7+uvJKMRFrR1Zk4Ea+su8aQ68+tg3y7dKkJgf2Z/noFje1lnRtYICuiiEYmZovQh
Ot9EufExfYOUjWwJ8tQZ+m2JWx7wyIdo4HDN0k9/uUmlUTH6KiV06iGjwEWpvIBY
s9dg0Ge+0rts5FSmu+O/rbM2LgOjJg==
=GhlZ
-----END PGP SIGNATURE-----

--eL90SqlSBXTOmepm--

