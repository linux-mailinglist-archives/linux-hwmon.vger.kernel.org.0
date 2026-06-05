Return-Path: <linux-hwmon+bounces-14757-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oF3tGRj7Imo/gAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14757-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 18:36:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DEF649D4F
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 18:36:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SK6J4fvo;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14757-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14757-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C07EA3055910
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 16:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2303EF65B;
	Fri,  5 Jun 2026 16:13:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F0E3EEACE;
	Fri,  5 Jun 2026 16:13:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676034; cv=none; b=pqGShmXPuF87Ge0iG4PfYcDG89bWw9NplomUPYoQtdwWijxrROG7nuy33hBDaXjPqG3k2vJGl8dN4V7GEDVk2WY9+6x4xxp3DKcLWT8GB6iOHrQOqr7+rUwRAE/52KJqaKKVAOGhtmJGZlX3fDxg0efrgMzO3RwUBqSBvHiVIzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676034; c=relaxed/simple;
	bh=Te4GkXG1496fCyo+YbNpbRV83Yf9Z+2rfvybxXOJ4vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbJ+lA2LguSg8UU3bcmIP71pr7K2RB8NZT/h6wvtWBUXU44H4lNNbrmd0Rf5iXyE5Ixre9tHBvI50fN9H37VS5vkV7uFL/ZTaKJOII9ekObhCLi4opzuCy1dAP5OHYx5w+1ZL9PZCtDayuefIKDghGJnjnQ5hE9Y3ilphwyrP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK6J4fvo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7402D1F00893;
	Fri,  5 Jun 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780676033;
	bh=Te4GkXG1496fCyo+YbNpbRV83Yf9Z+2rfvybxXOJ4vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SK6J4fvojNgg//QQPQQZAQD7yZD0JD8Jf/3IwHM6dZJuna5gjKsMrSfCpCTmNOn3K
	 ifaZsNzHmcU+snqsil09WFKwNbfxwVPyFFRGFwIFynZMS2DBi5S8MBJ1IPfWuzn6HR
	 BaByoOToiJRnaA5mFat1X9jCNwV1yUlvWnTLUSz9sB62Zb6bbGvaOiAgTmj83J/D4K
	 7o+pCu3CrXB3tt1PnOqo6TguCrHHbesHA33f9Mv59xBIc9vM1ZGanOhWQ95Jun+Iws
	 F0w8JYFTr0KmRXMzF1X0vIRQS4v7VfjeNfFzICRIOM5VKsLY7gglPEJk3vvuwyIL2O
	 dNn9Y1xhtqC9Q==
Date: Fri, 5 Jun 2026 17:13:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Message-ID: <20260605-tumbling-defile-1a049164cd3c@spud>
References: <20260605063042.91776-1-zmzhu0630@163.com>
 <20260605063042.91776-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="deq8HtxXZ1lJn9DW"
Content-Disposition: inline
In-Reply-To: <20260605063042.91776-2-zmzhu0630@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-14757-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[silergycorp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,spud:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3DEF649D4F


--deq8HtxXZ1lJn9DW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 02:30:40PM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
>=20
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--deq8HtxXZ1lJn9DW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiL1vQAKCRB4tDGHoIJi
0usAAPwMzoVAl/jc9ydtaIuFi5HfL3I9MfmEwrd7FmNrnL0w+QD+KRV2ckmyss0j
buoo7AA6EPyU9pLDho0Ldt89M4de1QQ=
=HPMx
-----END PGP SIGNATURE-----

--deq8HtxXZ1lJn9DW--

