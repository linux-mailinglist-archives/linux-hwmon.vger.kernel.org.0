Return-Path: <linux-hwmon+bounces-15118-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JK4KEP7uMGq6YwUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15118-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:36:46 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7D68C8EC
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:36:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=IN28Aps3;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15118-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15118-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F5293033D21
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 06:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598F83EAC65;
	Tue, 16 Jun 2026 06:36:42 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE03E8C6A
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 06:36:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591802; cv=none; b=YLWcAhq3KPcqDmrPCU4OefrF9hp9EZ0JTyY//m+oJXkHK4eSCM1cRjuSpisx5FvchaP7BJcMNM1e3c4J8i22JMz2s3+AXLc8RASfMIwL25al3OpKhNGbtYpJiJRw+i8pA+ANI1AoGb6PPBO+S4LMVtlCJeCWLkp74LIhOYIMyJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591802; c=relaxed/simple;
	bh=3AupYPH6JWBXc1H5ZEb21dXv3XAXi1qkaxh49QOcQSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFbRH4NhRN2y1mFO2+m6pqr5RDUoiAaN0QI2KOyVG9ZcjnTjOnNQmC8AziagDxCV2ZJ6ECV1pUMahyPqmCxsaH/Dhumk7G35AiJ6DzzTI4UOZU5cC1YP2i2KIIDYSG7lQTTK05bmn/Q8TOL1DOucKz0V7rUJ/a5MfBWkBqoxxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IN28Aps3; arc=none smtp.client-ip=91.218.175.182
Date: Tue, 16 Jun 2026 09:36:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781591798; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=VyWYBbwI5iVCvKupUesrsClAx697PrMS2kFvgGqn5XE=;
	b=IN28Aps32nom3ojb8DrK/4nSG/fc116e0N/xWykHS2lVrEMwFoQIxaUi6CKzBRrJDhD8dw
	RhgqXehVCA9ZqteakT8c5Ld86ZEGhKyDqIEZ75L7lETjG9y/wLF/lOLJFbG3ZFJyfrOXeS
	uUdAFpdN2IQ5pgJXngyJ0kSv3pmpEmE=
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
Subject: [PATCH 2/7] doc: Add ROHM BD12780 and BD12780A
Message-ID: <be64833b78ab8f915fce6209cfab0a458991033b.1781591132.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1781591132.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3nD034APa0DDcV6J"
Content-Disposition: inline
In-Reply-To: <cover.1781591132.git.mazziesaccount@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:from_mime,rohm.com:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-15118-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:kimseer.paller@analog.com,m:cedricjustine.encarnacion@analog.com,m:chris.packham@alliedtelesis.co.nz,m:Yuxi.Wang@monolithicpower.com,m:hsu.yungteng@gmail.com,m:tomtsai764@gmail.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hsuyungteng@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,fi.rohmeurope.com,linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,gmail.com,analog.com,alliedtelesis.co.nz,monolithicpower.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linux.dev:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99F7D68C8EC


--3nD034APa0DDcV6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD12780 and the BD12780A to the list of the ICs supported by
the adm1275 driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 Documentation/hwmon/adm1275.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.=
rst
index cf923f20fa52..8a793dd2b412 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -67,6 +67,22 @@ Supported chips:
=20
     Datasheet: https://www.analog.com/media/en/technical-documentation/dat=
a-sheets/ADM1293_1294.pdf
=20
+  * ROHM Semiconductor BD12780
+
+    Prefix: 'bd12780'
+
+    Addresses scanned: -
+
+    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/po=
wer/power_switch/bd12780muv-lb-e.pdf
+
+  * ROHM Semiconductor BD12780A
+
+    Prefix: 'bd12780'
+
+    Addresses scanned: -
+
+    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/po=
wer/power_switch/bd12780amuv-lb-e.pdf
+
   * Silergy SQ24905C
=20
     Prefix: 'mc09c'
--=20
2.54.0


--3nD034APa0DDcV6J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmow7usACgkQeFA3/03a
ocWZAAf/YXX9RX0dcVSxQlV5Q6hpPn9Q2r+T6mDNKHArqLo9eB2JS16LCGe06ePd
keobQ9LMjNYHbYIGFiRu2eDnqL8IsbxLmbDgl+OLitm3NzMc0IRgsJt6inoeUmpi
S83ns5UAoeTQ8jYJ3w7yDUhcsppMlB+95ogKGda4qKzWljjNdokGSQzBpRJE1REM
JjYbWWkA/Eqv2LNnnXxhqrE0uxPmZocoWWXtaGCLiXGgg+6H+HfhF/JMWkZi7K+H
ZdUTBewlEH5kQcBWYii3bhY5jfOAjmr7sEXLnnTpfEDhhZTnk/Wjbl14IeTK2qZ3
bgm9wUdO/XoSNjwzYmtWzHJpWsWOsQ==
=L04+
-----END PGP SIGNATURE-----

--3nD034APa0DDcV6J--

