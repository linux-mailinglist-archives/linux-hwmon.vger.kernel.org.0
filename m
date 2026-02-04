Return-Path: <linux-hwmon+bounces-11559-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NBgBWOIg2niowMAu9opvQ
	(envelope-from <linux-hwmon+bounces-11559-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Feb 2026 18:56:51 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52431EB456
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Feb 2026 18:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02F423006B17
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Feb 2026 17:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8913A7F66;
	Wed,  4 Feb 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSsEtUM3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9038F931;
	Wed,  4 Feb 2026 17:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227564; cv=none; b=rzHPkbdAluw9JjHvg1y2gvTWOuCj5sV6xWAMP1oPCqdYdhHZsQ2GSwEOd8QkxasocxLzSLHlt8pTXmVeudT/PyYaO7s6kVj81K8S7MnByxt8iFgBXYs6BNhTpf0Bab2CqTHb/Ckgb/KztKlsJFcH1wVUKWqAf17ateGSdjgHMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227564; c=relaxed/simple;
	bh=mrFMucrzucfxbSgJ5DPr17O3xAFOGfA99TuHVE8WmnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDuPgiwqKFH7Jc06+2Y7pxY11w3sfW8N766cBvhqVysdTbVGXVqBIIllysGKpzGw1sY5cBl6SeSwvdvDUFONCzXIHa6D+uzJ1vwmP9UryNzYY2FRmqUz0ytu1psoB8cbS4PtBPyemA7zS+5cvj69FOebrSodohab1drUeiV5z7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSsEtUM3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3D0C4CEF7;
	Wed,  4 Feb 2026 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770227563;
	bh=mrFMucrzucfxbSgJ5DPr17O3xAFOGfA99TuHVE8WmnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSsEtUM3iLpiwz+DLB3WOY12DwOmt7nBGm7T3fji7kLKW/Jirv752LtDM1tTZxIk8
	 bXlYBqQV96pJolVMHaiCvrInnaFKnc5q/ZBbt/ugq/BNVtYGuPSCIapQXQKimAl3f2
	 tQW+x8dTBrs5A6Y+pYS3FV6XMyxoS3BXFBOdZ4oOvAEiKdHPijPtv0403f02y7NxSp
	 CiDoXsIj+h6uMtxHw6lvZIoMLOsClykChJCld5LfUWknwQ+3axt1GEdwDPKbq/kkHq
	 RZFXpYUi+QpBh9kyD1JIiGplAwhDWh6OfTj/sZaPdTKh2aQIyFP5UzT5v9fIs0v3rC
	 F6ItJGm09xYqA==
Date: Wed, 4 Feb 2026 17:52:38 +0000
From: Conor Dooley <conor@kernel.org>
To: carl.lee@amd.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	peter.shen@amd.com, colin.huang2@amd.com
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786 support
Message-ID: <20260204-sanction-lunacy-903e96c447e4@spud>
References: <20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="751yjr4bVVsIixNn"
Content-Disposition: inline
In-Reply-To: <20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,kernel.org,gmail.com,vger.kernel.org,amd.com];
	TAGGED_FROM(0.00)[bounces-11559-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 52431EB456
X-Rspamd-Action: no action


--751yjr4bVVsIixNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 04:15:18PM +0800, Carl Lee via B4 Relay wrote:
> From: Carl Lee <carl.lee@amd.com>
>=20
> Add device type support for MPQ8786

This doesn't seem very helpful on it's own, where's the corresponding
driver change?

>=20
> Signed-off-by: Carl Lee <carl.lee@amd.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.ya=
ml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> index 90970a0433e9..aec7397a29f9 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
> @@ -19,6 +19,7 @@ properties:
>        - mps,mpm3695-25
>        - mps,mpm82504
>        - mps,mpq8785
> +      - mps,mpq8786
> =20
>    reg:
>      maxItems: 1
> @@ -52,7 +53,9 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: mps,mpq8785
> +          enum:
> +            - mps,mpq8785
> +            - mps,mpq8786
>      then:
>        properties:
>          mps,vout-fb-divider-ratio-permille:
>=20
> ---
> base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
> change-id: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f=
48049e8411e
>=20
> Best regards,
> --=20
> Carl Lee <carl.lee@amd.com>
>=20
>=20

--751yjr4bVVsIixNn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOHZgAKCRB4tDGHoIJi
0r4FAQC1Syz3aGW2u20Zbu59J+al5xEALEiV6+Ak0pFlH9g+BgD9GogLBkMq3bC0
hLcdDa7hfKns8Hcl0G+CQqnOArDIjwo=
=rMDu
-----END PGP SIGNATURE-----

--751yjr4bVVsIixNn--

