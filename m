Return-Path: <linux-hwmon+bounces-15345-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fq6JLp1YPWqU1ggAu9opvQ
	(envelope-from <linux-hwmon+bounces-15345-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 18:34:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 405316C77EE
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 18:34:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hqM+geLq;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15345-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15345-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B18DF301AC1A
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Jun 2026 16:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAFD3B47E6;
	Thu, 25 Jun 2026 16:34:34 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18231684B0;
	Thu, 25 Jun 2026 16:34:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782405274; cv=none; b=S1tM83PEEsNnx/GcPRi3eq/sWVWgYYXCo4SF0vlqy+JLqdEptqx2Oj4igBrInvxhgQWWNEmsgx+K1Jeb9KH5DMuE/j3ReCTFZ86QHnnlgv5KSCi4+gr/bDOR9m5yxIXfPFV1LFgXe8MQc9Ih48k+Tnvk1OeAbS4HG1Ibar/tCV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782405274; c=relaxed/simple;
	bh=4G/LNNM3b1qOUplHc09UGSAyOeAo6risik2UZldc5cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck7GLBPrXtJf0P5LrdmQwq+w9Jf7Nxj22FFUevPblJTeqG2WJwcSVJjzSeCQZ5bk0UozAUbZvzTg0TjCqE8LV5gLkXccCN23Q8eZ5HZ0nRA0feT0AWp8W7Zyp0p/xvQd4muJGRwnQ9FbqfMqghJabplufHB0O1Ey4Px2PUX6esA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqM+geLq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7DC1F000E9;
	Thu, 25 Jun 2026 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782405273;
	bh=4G/LNNM3b1qOUplHc09UGSAyOeAo6risik2UZldc5cM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hqM+geLqLtKDwoPOmnGlO2HR7UprnhmjwnNic+QGVqzdjMYYukmI7R9J3ZlbCZHp7
	 jRT/oKg0HSN59NQxPPvSj5FjNTjI9kXZAky9dTz9GivTeu+g6dn4BHdlgAvCMqZHpO
	 xz3babkj8FJhZ1Zy0jneHq1qubU9o2ZROWVeuyp6FfMMn4L9sFkdeIcpNG55Gx+W2n
	 H+Z2PaCnl5iBcEG9Iq9LqehHdJjKOVGcwBu6dMesbUWAtcX2dEJ0J+8pd+Bn/MvXTQ
	 Xy1FkfPRszFXjTcywC06S7EZ1vCUtlqRJSgOLJOUqvRf22SXFpSWe1b+ZP7V4jKblL
	 xOQYjrptDfBvw==
Date: Thu, 25 Jun 2026 17:34:28 +0100
From: Conor Dooley <conor@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com, dongxuyang@eswincomputing.com
Subject: Re: [PATCH v8 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <20260625-koala-dedicator-96bd3057cf48@spud>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061147.1631-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3lS29/ShfriVpN9k"
Content-Disposition: inline
In-Reply-To: <20260625061147.1631-1-hehuan1@eswincomputing.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15345-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hehuan1@eswincomputing.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:linmin@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:luyulin@eswincomputing.com,m:dongxuyang@eswincomputing.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,microchip.com:email,spud:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 405316C77EE


--3lS29/ShfriVpN9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3lS29/ShfriVpN9k
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1YlAAKCRB4tDGHoIJi
0uV2AQDAPqTMDCyZZXKg5nEtT4hV/Ay+5GSNwwpMf3sXlpRKrAD+OZ1q0Rf1kP/G
LIHn6CDZjB3hAcU0yy5MmB7afhU+LQk=
=t2nx
-----END PGP SIGNATURE-----

--3lS29/ShfriVpN9k--

