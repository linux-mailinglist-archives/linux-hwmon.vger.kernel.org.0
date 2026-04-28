Return-Path: <linux-hwmon+bounces-13557-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJxaJBAN8Wn1cAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13557-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Apr 2026 21:40:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906248B3AD
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Apr 2026 21:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F3BD301EAFB
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Apr 2026 19:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E029837FF75;
	Tue, 28 Apr 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5AE7uvx"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC492EA498
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777405193; cv=none; b=NlqaH006gJsscHL2jLCcbjycNx0g0SdP5e+AGZ0NLiCoaTYCQuc2Hk/q/So5tb0z8FRAE6MkAFSKCMcT/Pytkzmc0TBf5E/ec9N4Rib9nJyNb6z6ZX+lz3GmGuanKkhPe6ZYtQYV47BdzDFR7peG5Ry5OpiHKGzmAwDSrAWScM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777405193; c=relaxed/simple;
	bh=5IVD2FJAnntcmcoIhdfEOvitftADQ5jydBDOQCX+6ro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CMTlt2gisinU7K0y+2efb/+k43ZP135P2TQjkzstsLfbqBvE6rgvbxVjlPvpUWiVZCBSwXgMTyI13gmBuA3bHVcCWPm/cCqzjnoOPrAaXPeSs9X18iO2MovolWcXjfi6mj6jybbj2y1GY70ZddEkVjE6OaGkvmpPsrJ9zkZCttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5AE7uvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ED7C2BCAF;
	Tue, 28 Apr 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777405193;
	bh=5IVD2FJAnntcmcoIhdfEOvitftADQ5jydBDOQCX+6ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A5AE7uvx2u06Yy0FSCUtDQy/VQPuktNbknpP7hrwr+EZ1+D1Qw/ueaSTlE9heqaxT
	 Go7CyvyGJKG/9VrPAnovZwG1QAdkxLTNyMqqLROLY6g9N/yKJKGD+aFF6z+Av7QZ/F
	 JGYD5m5oBah+zPLX3CKpx/J4mNcBUWXOqpLSJTnTOQjDgwy7/3FPAsE9fzhqfS/qbr
	 fSt0vl/jMAPrA+6dE6jtPaD9H7UsxlgSLPShkulD9LcElI6nXUAJV12a9S53r9f4yk
	 ZFuLNbDUGiTWPA/4rE4R5mg0V+9cUYE/a4RjiyMJ2EvyIirgVuo+tz5B6ECac4vm0h
	 s/cymhiMt7MDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Reply-To: sashiko@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260428082337.743546-2-changhuang.liang@starfivetech.com>
References: <20260428082337.743546-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Apr 2026 19:39:52 +0000
Message-Id: <20260428193953.31ED7C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 5906248B3AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MISSING_MIME_VERSION(2.00)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13557-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.296];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,11be0000:email,sashiko.dev:url]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `tach-ch` property in the device tree example uses incorrect co=
mma-separated syntax that evaluates to a 5-byte array rather than the inten=
ded 2-byte array.
--

commit 4bf196984d444742e611042f289ee38d6b5ced8c
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

dt-bindings: hwmon: Add starfive,jhb100-fan-tach

This commit adds the compatible string "starfive,jhb100-fan-tach" and the
corresponding binding schema for the StarFive JHB100 Fan-Tach controller.
The controller supports up to 16 fan tach inputs.

> diff --git a/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-=
tach.yaml b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tac=
h.yaml
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/starfive,jhb100-fan-tach.ya=
ml
[ ... ]
> +examples:
> +  - |
> +    fan-tach-controller@11be0000 {
> +        compatible =3D "starfive,jhb100-fan-tach";
> +        reg =3D <0x11be0000 0x400>;
> +        interrupts =3D <128>;
> +        clocks =3D <&per2crg 33>;
> +        resets =3D <&per2crg 5>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        fan@0 {
> +            reg =3D <0>;
> +            tach-ch =3D /bits/ 8 <0x0>, <0x8>;

Is the comma-separated syntax in tach-ch intentional? In Device Tree Source
syntax, the /bits/ 8 directive applies only to the immediately following
angle-bracket block.

Because tach-ch =3D /bits/ 8 <0x0>, <0x8>; separates the values with a comm=
a,
the second block reverts to the default 32-bit cell size. This produces a
5-byte array [0x00, 0x00, 0x00, 0x00, 0x08] rather than the intended 2-byte
array.

If a developer copies this example into a real device tree, will the driver
incorrectly interpret it as 5 separate tachometer channels (0, 0, 0, 0, 8)
instead of the intended 2 channels (0, 8)?

Should this be written as /bits/ 8 <0x0 0x8>; or using byte array syntax
like [00 08] instead?

> +        };
> +        fan@1 {
> +            reg =3D <1>;
> +            tach-ch =3D /bits/ 8 <0x1>, <0x9>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260428082337.7435=
46-1-changhuang.liang@starfivetech.com?part=3D1

