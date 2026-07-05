Return-Path: <linux-hwmon+bounces-15570-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aBLsLfhsSmqSCwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15570-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 05 Jul 2026 16:40:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE570A5A3
	for <lists+linux-hwmon@lfdr.de>; Sun, 05 Jul 2026 16:40:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kGa/7CQf";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15570-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15570-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 107FB300E25F
	for <lists+linux-hwmon@lfdr.de>; Sun,  5 Jul 2026 14:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638BD380FDA;
	Sun,  5 Jul 2026 14:40:54 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8C71F4C96;
	Sun,  5 Jul 2026 14:40:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783262454; cv=none; b=QH/WGo8FM1n4X20qVS66CDiMsrtBJcE85RYjCPO4ueO6E15MqvLEPfP0FRFJkRHgBpixFIjoSY1G/qcY8NOsfHqll+A0CdZrbbR6wkNbDQMsfzabGpVLfvEEJTJOddPO7WBH8GHdzKctPui27lltEwRSLcXEJ7kBwvIjzTIjIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783262454; c=relaxed/simple;
	bh=K7ZchmKtqLw/VLeOij+5v+pzaug/zC7GnO1AFQXGn+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1zL3HxV2s3ydDho5fjftU7E7Yfbeilh8fIL9VTxXdrYzgwXfa8nOmkdqnoUtJKG9xl1eWYIS1eQ00ttxFFa0wUMH6mc7f+kfqbMda0t7abLaVhGS4pkR9T4nMPOk6TlnGSrl7c4c4CAtvLF6EBRt2PfyfnxLBfnaz+n2lCQ2xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGa/7CQf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C341A1F000E9;
	Sun,  5 Jul 2026 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783262452;
	bh=K7ZchmKtqLw/VLeOij+5v+pzaug/zC7GnO1AFQXGn+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kGa/7CQf1ANNFg8pVeMouauE8RMKDJkWHsxiwJmQWjAIRzr65oWtpFtmSH/UYh5+j
	 gw3p1WKLa80RcEmJuokxg/uNder535GHnL+V/iRLtHHI1qLRb0UqYm8crC/jnewDWM
	 EcJwLjLTUTIcm9OQAaBSNNNLBxbUHvUkdrpI+XaG0JkDB5iMBawJ1zZnRJdzl0RtcY
	 +9G4biQ7HckxQ+b289MCU3pIe5ctkh/1eW+X168qYtn+kW1A5qY4d/kLsJTqWEQmCG
	 4ADqwjCB7vw3vKM7Jyq2GA49bP7ZrBc5CrfQFWJWw61+3gBnN69OXGAm0fHSvwlioW
	 ybU4t3kic4vAw==
Date: Sun, 5 Jul 2026 15:40:48 +0100
From: Conor Dooley <conor@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mpq82d00
Message-ID: <20260705-panning-decompose-92295a425e60@spud>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/RpRisE3gS1H3rlQ"
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-1-wenswang@yeah.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wenswang@yeah.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@roeck-us.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15570-lists,linux-hwmon=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[yeah.net];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,spud:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBBE570A5A3

--/RpRisE3gS1H3rlQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--/RpRisE3gS1H3rlQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakps8AAKCRB4tDGHoIJi
0m0pAP48+WeBMJ28PyrVs2G7B29N9fZv/4cc1n82Pz4F8hjWTwD8DXk3kfFfp4EX
8PbZrIXzF1wKPRjaHKGJlB5rUf6fcAo=
=2z0T
-----END PGP SIGNATURE-----

--/RpRisE3gS1H3rlQ--

