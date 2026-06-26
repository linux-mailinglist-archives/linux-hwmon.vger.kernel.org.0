Return-Path: <linux-hwmon+bounces-15358-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id igMNOhspPmqiAgkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15358-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:24:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE46CAE82
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=dteVdm7Y;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15358-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15358-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BC51301E6DB
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35923DE453;
	Fri, 26 Jun 2026 07:24:09 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4433BE15F
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:24:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458649; cv=none; b=d9tJX6Nof7uNeVPN6MO6+U5wj1Yi9FGZ7lqV7LSNt1sGhXgEpG/7hdRVW0vi6uS7IXQScGcTDiBwvimOOZgELZCo/AjwVWq4YNhnim9QHcL86M6s3Nj1RHaFUw+JuhaJOXnDOidfKWmMIUB8Y4v6sz9DUNneGV7BVuv9kEKiNm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458649; c=relaxed/simple;
	bh=3mk64sg5qBuJAQQwNQPJF6/BQnjQqVFBnkfeCR3LIec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7E5bqjrXI2v6PZOXh6GJh0di0/nUBEBC8th5proa2T6Y6Esrl6eOouY43/c8W5DBnVkAO108MCl/rAU/ggdBe3PwiEaXn1AstRuAw+1dt9NEH/yQmdHBMFJLC9NIvqYr/F2DJMDudMfXRdoAWeMpWhK7K6YXDtFfgYHcJ5cIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dteVdm7Y; arc=none smtp.client-ip=91.218.175.174
Date: Fri, 26 Jun 2026 10:23:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458646; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=L5bRMjrT5WG98RwQ6TvQ1fnnJ+v2JJuVu5LHZ+hngrA=;
	b=dteVdm7Y/XTLsVvnHtnu0JAzs2drprUnngMK4JG68vbf4u6Y3AeWSJjggs2sSFYLcUcO3P
	698ZoYljFlXaowcUiFlgKJ0bdcSvmzAC4C0Oq1FMj6h+iiYxt/vBzrokX3Ed2mpoY/UtuA
	iDNLND8EJmd8e0vXyrna+bvMpR6Qvqg=
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
Subject: [PATCH v2 3/9] hwmon: adm1275: Detect coefficient overflow
Message-ID: <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OzRujVB5xWLjJVqa"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:dkim,linux.dev:from_mime];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-15358-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47CE46CAE82


--OzRujVB5xWLjJVqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko detected potential coefficient overflow if large shunt resistor
is used. When going unnoticed it can cause "drastically incorrect
telemetry scaling factors" as Sashiko put it.

I am not convinced such "drastically incorrect telemetry scaling
factors" could have gone unnoticed, so I suspect such large shunt
resistors aren't really used. Well, it shouldn't hurt to detect the
error and abort the probe before Really Wrong current / power -values
are reported to user by the hwmon.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> v2:
 - New patch

This patch returns -EOVERFLOW with an error print if overflow is
detected. IF there really are systems where the overflow truly occurs,
then this change will cause the probe to fail - which might hurt the
boot process. It might be safer to only print the warning. One could
also try changing the order of the shunt resistor value division (/1000)
and the multiplication and see if overflow goes away - but it'll be
somewhat more complex then. Hence, I just decided to error-out if this
happens, and leave this for the people facing the real overflow to fix
(if needed)... It's still fair to mention this might cause issues.
---
 drivers/hwmon/pmbus/adm1275.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 43baa5ded35e..ccc3ad21e38e 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -839,15 +839,25 @@ static int adm1275_probe(struct i2c_client *client)
 		info->R[PSC_VOLTAGE_OUT] =3D coefficients[voindex].R;
 	}
 	if (cindex >=3D 0) {
+		u32 m;
+
 		/* Scale current with sense resistor value */
-		info->m[PSC_CURRENT_OUT] =3D
-			coefficients[cindex].m * shunt / 1000;
+		if (unlikely(check_mul_overflow(coefficients[cindex].m, shunt, &m))) {
+			dev_err(&client->dev, "Current coefficient overflow\n");
+			return -EOVERFLOW;
+		}
+		info->m[PSC_CURRENT_OUT] =3D m / 1000;
 		info->b[PSC_CURRENT_OUT] =3D coefficients[cindex].b;
 		info->R[PSC_CURRENT_OUT] =3D coefficients[cindex].R;
 	}
 	if (pindex >=3D 0) {
-		info->m[PSC_POWER] =3D
-			coefficients[pindex].m * shunt / 1000;
+		u32 m;
+
+		if (unlikely(check_mul_overflow(coefficients[pindex].m, shunt, &m))) {
+			dev_err(&client->dev, "Power coefficient overflow\n");
+			return -EOVERFLOW;
+		}
+		info->m[PSC_POWER] =3D m / 1000;
 		info->b[PSC_POWER] =3D coefficients[pindex].b;
 		info->R[PSC_POWER] =3D coefficients[pindex].R;
 	}
--=20
2.54.0


--OzRujVB5xWLjJVqa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KQ4ACgkQeFA3/03a
ocW5UAf/R5pXrPZu+9E2rmqVb6V20XFW1O1M0BZDdchXJ1or0hjcrZ8lWjmzUco3
Ra2sdRpo6YK7FOUCCgO6rFhouaMam5AnNY/GqnVEFKiWpx1V+ZrRKatlndsf6fWY
DtC9CHqBOnZ1/inBHELhnSzo4uw4n3Liqs80HNutr6E41cHXOOFC7C19gR8g7jbo
X7DlpIsdA+kggDNkfdVO2A1zTwc3bxRmdwWzDex7IrMbVdLd14FKbAVSwcrTCz9a
K/4qpYdb5QZW8bSRFhWg3CDLbXsWV6bN8GsJLAWP4gkK0WpwVCmUmokfrom1rk2X
Oca60gnx19aWh79GOXKg1GicozfUmA==
=7M7B
-----END PGP SIGNATURE-----

--OzRujVB5xWLjJVqa--

