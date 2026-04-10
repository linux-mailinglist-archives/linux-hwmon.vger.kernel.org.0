Return-Path: <linux-hwmon+bounces-13234-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNcjLwE62WkjnggAu9opvQ
	(envelope-from <linux-hwmon+bounces-13234-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2026 19:57:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9B3DB3EC
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2026 19:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0263E302C37E
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2026 17:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51C13E3C7F;
	Fri, 10 Apr 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSIIXLDp"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFFD3E3159;
	Fri, 10 Apr 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843836; cv=none; b=Jq64krHGL5vQ/V+zrDAqCZwMvkMg4XbkP3+dxWrEJopdpkoq86IIupkK/Q8MG/gjGEgXQtA4g7LkSEr4RkuKJLwRpfBhXB0VdZhR/lap/UXPxrLdWyaK+ERTSWMQdw+CzjAxdOu6QK20W5vF2DSvL08eFowFZA9TkMgFSzP8IM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843836; c=relaxed/simple;
	bh=Z46jNy3zMikW7iBo76BbUshBkpQRyUU0KwiACKtRe34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4QqkKHTUxAETrtulC4cpqORsDRArfFY/W9mtQTpoyif+JXQvK2EulonMTaOsf3eO/cEyKQ+ROWOvd983+CnMAAVqxN8ocv+QmJfNZTWJ8nE5yY9EUYdfhV78MDSEPZQnAGMVrrJloYo9GO4fzao1Ezlh5CZZhA2SdqmzsL47co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSIIXLDp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B21C19421;
	Fri, 10 Apr 2026 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775843836;
	bh=Z46jNy3zMikW7iBo76BbUshBkpQRyUU0KwiACKtRe34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZSIIXLDpf3abvueGwnQ4Rd9u4CYBeOgs69QrLWccbHvhHTN1UvQc0cevaHuojoPXc
	 S9wyCpBVIA2PuwhkXP7vPW9uTN1vRLZGXpVHzvablouYZTYMTvz/cy4g5obIBcRTlm
	 CYyHRiobS3cwbinA58pyGr4bIrFWSjCvHUZ0zfswtpmsTcHnrEzVcJ84WwHqcNQtH5
	 DRp324lV4fLmstYKpntHovwDkAV3dz/iwrnueyqn0bFpewd8BVBYWs/bMZkgXHh+Mp
	 BWqguUW7HgoZOqIDvNWu20NkubpY1snoOVUSEmIDKT+v96TynGmFFtXNeQ12esnUEc
	 aAGGaBRmQEyzA==
Date: Fri, 10 Apr 2026 18:57:12 +0100
From: Conor Dooley <conor@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
Message-ID: <20260410-confess-coaster-6f2392ea535e@spud>
References: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
 <20260410070154.3313-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F2JKZR6jBQ29qu7S"
Content-Disposition: inline
In-Reply-To: <20260410070154.3313-2-Ashish.Yadav@infineon.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13234-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 2EE9B3DB3EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--F2JKZR6jBQ29qu7S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 12:31:53PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP720 eFuse.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--F2JKZR6jBQ29qu7S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadk5+AAKCRB4tDGHoIJi
0oFtAP9HEYTCgHINOEmYTVn1BNQBbzwayrc7yGs5O2Z9Pv0sUgEAyJ+jQu76V/qB
VM22eXaONv2UqZsMJxSQBbTwA0wDswM=
=3QpT
-----END PGP SIGNATURE-----

--F2JKZR6jBQ29qu7S--

