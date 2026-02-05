Return-Path: <linux-hwmon+bounces-11599-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGHKMhvkhGlC6QMAu9opvQ
	(envelope-from <linux-hwmon+bounces-11599-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 05 Feb 2026 19:40:27 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18350F67F1
	for <lists+linux-hwmon@lfdr.de>; Thu, 05 Feb 2026 19:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C4330086D5
	for <lists+linux-hwmon@lfdr.de>; Thu,  5 Feb 2026 18:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE493033D4;
	Thu,  5 Feb 2026 18:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ+h2QpK"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D4222575;
	Thu,  5 Feb 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770316825; cv=none; b=mAvy3d0L5pGmfe4qPGLBdUfWAkBTCSkPRd3MWjtYdcTc46xPAVoZ/7BLesoshVeXKWD8I/ze51Ig7wYS0FRZIw4fE9XGvi7+1ugUn6NJg2U28k6zLKvVZPVIZ3PQeGs99kuGbCa9zl48mHKNPN5Qq/pahi5UUm3MzhMPW1EAPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770316825; c=relaxed/simple;
	bh=S+i5FblNJQbHGB/LuAZ6zsUMPn9TsCtgzHeSToD4PCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IncxmFfPXOseSnYsNdMqCefwziYdNYjaSwONFIv9tSy5gKKhneQKZE0rl+1/bERqs/q+dY6g+yhGvCy0AxZ1X8lgKDc3kG2ggERV5SrWsbqRujfMPpYwWP4rUgInDy0Oqu6g78rhSkF25dyfXloky/XSVaAbAW+LWzsazxu+9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ+h2QpK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23774C4CEF7;
	Thu,  5 Feb 2026 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770316824;
	bh=S+i5FblNJQbHGB/LuAZ6zsUMPn9TsCtgzHeSToD4PCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQ+h2QpKxywhjtLFJndMJSrGY3FE8lfZhQcGwpAhQZmMcZfHsZ7GKXdl0l6WYurG4
	 4m+UTwuj3aOFD3d81oq58zzwSExoT13JN1mbIqKH83611ggOmXNZTUitsunBjc7lOx
	 2Lv5EXrRBcY0hIwJiWUyz9+zzefhwRHb8Llwx5uXPE86IOBFXZdjG5Dq6cjTpUdYro
	 h0d4XZt2jp4KecQ2UYEMTrLMCGsjVrHoXHc9/useRiwLauL0VVB+mCzBczZ+H5VDHq
	 /pbZcsxP+A2QUjyq5PuLlEQSidbY/oPWrNYzCKf2c96Gg4i2Yr1y0mGe2ZiU5cG+5o
	 PlDiwJvhWt9iA==
Date: Thu, 5 Feb 2026 18:40:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add Delta Q54SN120A1
 and Q54SW120A7
Message-ID: <20260205-quiet-preface-cfcb1fc456d4@spud>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
 <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nm8/3iV4YSXnfxTq"
Content-Disposition: inline
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11599-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18350F67F1
X-Rspamd-Action: no action


--nm8/3iV4YSXnfxTq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--nm8/3iV4YSXnfxTq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYTkEwAKCRB4tDGHoIJi
0kIFAP4pVB/Z6rbrb1UXk3+anmTyqg3Nn3SNiS4jTV9ektmi7AD7BJUBfcMUmXdr
IIwbKPlN05tf8q0VjPFP4UntIN/RXQs=
=WXdw
-----END PGP SIGNATURE-----

--nm8/3iV4YSXnfxTq--

