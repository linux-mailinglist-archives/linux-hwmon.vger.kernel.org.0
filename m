Return-Path: <linux-hwmon+bounces-14620-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHIONNfCGWqyywgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14620-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 18:46:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C1605E74
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 18:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B334B303E081
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EA03F44EE;
	Fri, 29 May 2026 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRqBF3vm"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116F3F39F1;
	Fri, 29 May 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073074; cv=none; b=VUoD6lmVWybCWDa/oo5aHRn/nidw4GbN8w+rfbwip+GIrGDsrbxdC+/HO2RB+87RUM9JhMhLIgXuJj8tpebEQXIy3wmd0/0FvjAnhkax11u66EZfuNWcOSs3Bw7jxegjXRq+TZ628Qm8vmq2IiTdy3sVAYucgPGHpmXTOrv1jKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073074; c=relaxed/simple;
	bh=MG765tz4pOgROB9LJzV2O9IUqpE2fX3TOV6kCIWSwI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJ+3ymnIjbnea4xE0LKUw1+V8hfq7T3KJQZhrZ9tH56kIc8sAHpVvFAjgMskd3GTQpr39lrnm4ivuKgcd8aAjgdIA2xwtmmIx6YdjOVoujxqczTmjUE9Bbk24Yp8GL2Ltb+RFWg3GJOE9VsUl3DuELUf9rYson9yzuoN7WaWhOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRqBF3vm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601871F00893;
	Fri, 29 May 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073072;
	bh=MG765tz4pOgROB9LJzV2O9IUqpE2fX3TOV6kCIWSwI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZRqBF3vmJoiRF7QgG74Axw2Q7BlzEogTPsR6erNkDZK2odXxTbxjQtXj+rueaRWrT
	 CtwGx+1rtdnAstLF38JA31b25nqXAvKRftaUzwh1nMi+XHrl9efwY4hBe+PaBkVE8V
	 baUxNZE8dRqe9poAY5OcEyiYmU3O8ZtNwqegOCtqXyx/JzaLuveRu9MUXBwgGHfd4T
	 S2FrorjsdCZtJe/3Gr16SkegHH/7KzLwHPAzvwT0h/osHHUxWza3Yj+6Cn/jk8Fnhx
	 I6Y5FNqZ9ASMVvCjGKxjj1mmAuMdrx5YNo2iKU0ASPDf2HT7RaCQiOEF4nNwJZVWqj
	 +kXcjFQdf24fw==
Date: Fri, 29 May 2026 17:44:28 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Syed, Arif" <arif.syed@hpe.com>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <20260529-elaborate-scroll-d57e68c2b24d@spud>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
 <20260529001903.625737-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="foRTfrb/RzR+apiY"
Content-Disposition: inline
In-Reply-To: <20260529001903.625737-2-sanman.pradhan@hpe.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14620-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7B0C1605E74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--foRTfrb/RzR+apiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--foRTfrb/RzR+apiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahnCbAAKCRB4tDGHoIJi
0u5xAP9efn1nWnm2BKbSt1GvSf7Rih59u/F2klwCAho7In616gEAjZAlXSaaUsj/
xZAXrxYpvRSAGdxznN63G5vtpHowgQs=
=/MPx
-----END PGP SIGNATURE-----

--foRTfrb/RzR+apiY--

