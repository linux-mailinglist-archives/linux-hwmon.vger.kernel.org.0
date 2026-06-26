Return-Path: <linux-hwmon+bounces-15357-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qGqaJAApPmqaAgkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15357-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:23:44 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CACA6CAE67
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:23:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=O5w4gPhT;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15357-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15357-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED793301E1AD
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEEB3E0251;
	Fri, 26 Jun 2026 07:22:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0299A3E00B8
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:22:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782458547; cv=none; b=rhUBXaDjgoBxstXx9IuDb8Q7AIavy5WwCx2SpvqP0t/gb+/oc3Ss4WaPLsvYlELgznZhyxcwzjXof5UfmHEtwIPYWuFLw9/c6XUWMNDtwPw6UkmqvYLwyK3zAcuKzi2k3FwTJA/i0e640oOsiTl5F7TlQcj5UT55PyQVM8vzBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782458547; c=relaxed/simple;
	bh=z4yql9e70Kg1vAKc9lAG7eBFmWgIPUcZda8u8jijXMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibc3VNQSlfmg/VgDUYQj8MDuT+OeoV+AKzQ4Hpa1tusFsYpaPUKLoWevQQpPR3AOTEsdktKUeldZ/F+RRoWd8gHFhhB7/ZMhj4OQK90S2FuiHJdcbZdR51ULfrz5mg/fgJVPNCf7EzT2Ty5feP1qD8+/DqSOGYoIdj34dC/10BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O5w4gPhT; arc=none smtp.client-ip=95.215.58.178
Date: Fri, 26 Jun 2026 10:22:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782458533; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=zknbTbyV1R4Zx01Hd07ZkxEU7EjCE/E5ciJKYfnqCAw=;
	b=O5w4gPhTmssM0GNMdz4FG0mqzpuPESbIfQx5nej4aVVbg+GHes3RjFM9Ss55WO3YM+7d7+
	ZP1f6XWDhlpCWJ3CIiQXj7vjsyLjg0UK8xcYBdBbpLkF/IRQx9P0PrKCFWjSyaYDoOl36q
	cwQbx6vXUmOWJWdIPsnoh1vrjQm7O/E=
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
Subject: [PATCH v2 2/9] hwmon: adm1275: Prevent reading uninitialized stack
Message-ID: <c8ad38e0cdb347261c6245de2b7965e747f28d22.1782458224.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O9Vrfo/4sqf6Rgck"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:dkim,linux.dev:from_mime];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-15357-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CACA6CAE67


--O9Vrfo/4sqf6Rgck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

While adding support for the ROHM BD127X0 hot-swap controllers, sashiko
reported an error in device-name comparison, which can lead to reading
uninitialized stack memory.

Quoting Sashiko:

This is a pre-existing issue, but I noticed that just before this block in
adm1275_probe(), there might be an out-of-bounds stack read:

    ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer=
);
    if (ret < 0) { ... }
    for (mid =3D adm1275_id; mid->name[0]; mid++) {
            if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
                    break;
    }

Since i2c_smbus_read_block_data() reads up to 32 bytes into the
uninitialized stack array block_buffer without appending a null
terminator, strncasecmp() could read past the valid bytes returned in ret.

For example, if the device returns a shorter string like "adm12", checking
it against "adm1275" up to the length of "adm1275" will continue reading
into uninitialized stack bounds.

Prevent reading uninitialized memory by zeroing the stack array.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Fixes: 87102808d039 ("hwmon: (pmbus/adm1275) Validate device ID")

---
Revision history:
v1 =3D> v2:
 - New patch
---
 drivers/hwmon/pmbus/adm1275.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index bc2a6a07dc3e..43baa5ded35e 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -512,7 +512,7 @@ static int adm1275_enable_vout_temp(struct adm1275_data=
 *data,
 static int adm1275_probe(struct i2c_client *client)
 {
 	s32 (*config_read_fn)(const struct i2c_client *client, u8 reg);
-	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1] =3D {0};
 	int config, device_config;
 	int ret;
 	struct pmbus_driver_info *info;
--=20
2.54.0


--O9Vrfo/4sqf6Rgck
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmo+KJwACgkQeFA3/03a
ocVvaAgAmfigKU6o5KcwnJ8L8dA6JKwE7f5uUfEJ/xrinXIwYyKLAxcMte8rDL0l
yqRup/hrsuHgn2S2ef6E1QY4C1yhd/jMhRgp8gM6DIr+t/Ge5jjtYZlJtp2dd9Fi
xy6V2IRsGLAz0ET69pjqAtNGhQZhw+ZABqkx7GC4uwIzeI8w22pYxvUvZulqqtqJ
PloWtFh1eqCiTTWQAyYN0jRGnm0D70M/09yTr55EcQjhz802Xosv/WKROzc0RJlc
22IU9KnU8aF5z4m1tHzGiCMKPHVkoo+82BaCCzH03CFwl1ac93WZCmA9veq2gayd
faKj/EQWvq1xd+JeoWdCjb6KvNUuPw==
=xLqm
-----END PGP SIGNATURE-----

--O9Vrfo/4sqf6Rgck--

