Return-Path: <linux-hwmon+bounces-13686-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJO4I3uc9GloCwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13686-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 14:28:43 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB44A4AC63E
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 14:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1FB0302F3A2
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 May 2026 12:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371043A256E;
	Fri,  1 May 2026 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChY9vrAJ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143681DE2D8
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777638260; cv=none; b=iDWTV/g/slcp+szE7VinqeFMJv/Npl4u1V00FYYK3cw2P9im2qGhsTvGgDK6infTVhWKFi0S6T1b5dcb8+LkNsLRw2/ZZ97rqvWylIoamRNolBGCpkVGpVEhlzxMEYtn0YrhQxUAGLW/7Q/Mtjs3dYgkdl5KeGqWLF0KSvD9azs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777638260; c=relaxed/simple;
	bh=ALIQfTV/AtctG3VYNtsLx9Ve0a7c3PHQLrG+b1Ag8FQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TsU7XU5tIFafXk/KMG4x9zAUD/NkC0z0i7iRv7b70ikOSJLztiYOJTGnSN7/Na7HIctkDU+Kk9skALmIABWtNyzjB7rqKID56mzuKnaQBr0gUNrkqkVdzJRxqcyRkyPSq7QQYG/vESUyQJGApE8TW9NC+kc6fiX7vPTB2p/oZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChY9vrAJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1A3C2BCB4;
	Fri,  1 May 2026 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777638259;
	bh=ALIQfTV/AtctG3VYNtsLx9Ve0a7c3PHQLrG+b1Ag8FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ChY9vrAJL023lBlcvoXsk8nKAG60ZKIw99aAp8W6JpfWgQ/y4HivVQJXPgXjP+XBe
	 tpmjK7JeLDFAPbxKA+V0ahazzMvpPfoJQDU8O6ddOQIbsMN4UK2LBwC9Rum4MSublN
	 UNjQtMUxnMdj92VCWC+0dP1YHuMwYm9Ix1dS1+9a9gyeqyoVk9K4F3DbcKPPU0w1lz
	 37XLpITgnAixbaOfHlkqI6kHc8vqA4smJ4brbTb4RHfwwTsS7RZY7UliocfSJs0XAw
	 jvGUZAo4/Nqm8Dede8MzTqg31L2pLKA2aPyOkuOEBp5eRX7H/5XL3fasO71PNrARmX
	 Zhf6ulCVESRpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add
 lm75,alert-polarity-active-high property
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260501120518.3085501-2-markus.stockhausen@gmx.de>
References: <20260501120518.3085501-2-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 01 May 2026 12:24:18 +0000
Message-Id: <20260501122419.8B1A3C2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: DB44A4AC63E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13686-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,gmx.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The custom Device Tree property `lm75,alert-polarity-active-high` u=
ses an unregistered and invalid vendor prefix.
--

commit 69df01a5031a4da5aac0d016930cd76771ff596c
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

dt-bindings: hwmon: lm75: Add lm75,alert-polarity-active-high property

This commit adds an optional boolean property to override the LM75 alert
pin polarity. It allows configuring the alert pin to be active-high instead
of the default active-low behavior.

> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Document=
ation/devicetree/bindings/hwmon/lm75.yaml
> index 0b9fda81e3ec5..173751a726f34 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -54,6 +54,13 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> +  lm75,alert-polarity-active-high:

Does this property use an unregistered vendor prefix?

Device tree conventions require using a valid, registered vendor prefix
from vendor-prefixes.yaml for device-specific properties. The string lm75
is a device part number rather than a registered vendor.

Should this property be named with the proper vendor prefix for the
original LM75, such as national,alert-polarity-active-high?

> +    description: Alert pin is asserted based on the value of alert polar=
ity
> +      bit of configuration register. Default value is normal (0 which ma=
ps to
> +      active-low). The other value is inverted (1 which maps to active-h=
igh).
> +      Specify this property to set the alert polarity to active-high.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
>  required:
>    - compatible
>    - reg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260501120518.3085=
501-1-markus.stockhausen@gmx.de?part=3D1

