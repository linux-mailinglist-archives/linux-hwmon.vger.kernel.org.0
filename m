Return-Path: <linux-hwmon+bounces-13852-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBjVFT77/WnYlQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13852-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 08 May 2026 17:03:26 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBA4F8407
	for <lists+linux-hwmon@lfdr.de>; Fri, 08 May 2026 17:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0A6B30314FE
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 May 2026 15:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810C83FADFD;
	Fri,  8 May 2026 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqhRMr1b"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BF3FB7C0;
	Fri,  8 May 2026 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252501; cv=none; b=iAdejnzkx5gM8aKm/s95dLotIr55Rp5IyZecQhJSyaVYqU872dVmmvoJ4q5VNGxe0jElrWVoePmuX7Npes46Es4KfLfFTQde9AuYIhLAmzfgL3WMfvyvXfOYiWoSwAUEt14ic50QSeaCYy7R6ak9HwjUXY4zB/4T7NO/pRmKLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252501; c=relaxed/simple;
	bh=x952hfscGsSmbni9hM0bsGIMPmFiigAJ0E6obA852NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdVmhHC+xs8Gexy3wzZPedqwV2dyXetdEKxebnyPGpLllVAats8nPLejXhbrTaRcU8BVPXhYCS4tfD31Gyuy/mSS7ipnkf8LNx7QgjbnJfY+dKk+ChAq4es8xy+SVwqRZ/mqqv+W5XQzZ/xulNt2zkPgTZQfvo8jNqz3sywAIp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqhRMr1b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FF0C2BCB0;
	Fri,  8 May 2026 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252500;
	bh=x952hfscGsSmbni9hM0bsGIMPmFiigAJ0E6obA852NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqhRMr1br6ft0fjHI8t2T4VPWmfWBetFP5P/I6p1jjzMhdoQ90adJhwic6DXcsfaL
	 DnRUsS6OIdxk81WzCxU8z6X3o1hf72sWFvW7aTwzEnVNEfloi2wX4NZ3uExJ6xRN/+
	 5yHj+8QeYmITfGQ4AP1zqe0C28bdf1BZQAaCGi7nsnRUoZ3FCGLMAsWNAi2txqdvGG
	 VDRLgl/oxNbgq+ChofLVdxHekR0uVTsTk4XK/b1P+kBnJxuiJPCWGgCTze5nHQZ+rX
	 r5WMe+CaIQaBkF5e/HsYoDTUry7SwzSxGyLBjIpnPnbgcjeZgpUgT7nyEfK9D0wrCD
	 X6P8MZowlgDwA==
Date: Fri, 8 May 2026 16:01:36 +0100
From: Conor Dooley <conor@kernel.org>
To: u8813345@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: trivial-devices: Add Delta E50SN12051
Message-ID: <20260508-moustache-casually-c33a677ea535@spud>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FSGHFD/a/WG6Tis7"
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
X-Rspamd-Queue-Id: 0EFBA4F8407
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-13852-lists,linux-hwmon=lfdr.de];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--FSGHFD/a/WG6Tis7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FSGHFD/a/WG6Tis7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf360AAKCRB4tDGHoIJi
0jaYAP9L+e6NVAKuIcIxYP2lhSB0WRnVh6YsPvKhvs39Pd0RswEAhxoQ4Kf/ZCSD
8aFnuyjAgtWLq6dJxkVc5lWAOeJnSgw=
=Bdrb
-----END PGP SIGNATURE-----

--FSGHFD/a/WG6Tis7--

