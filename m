Return-Path: <linux-hwmon+bounces-13573-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BnyA8m88WnGkAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13573-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 10:09:45 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74095490FEB
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 10:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C6C1300C258
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Apr 2026 08:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DC63A5E81;
	Wed, 29 Apr 2026 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kw94ycSe"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C374396B8C
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450180; cv=none; b=bvJWB4Ehv8tn6ghYwZJ78tmqURbzGBrGqj6+NVWmYbEc+xci58r7bUc0d/okUDMDiv70X2enDjbIF9hIPbi+TFq15y7h7UeUxsu/YACvmfnKlI9p12/zT5suyUAfHi3babbv4D6vJXv+8MFX27ZylrLqIlHFJdwauCiqMeIml5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450180; c=relaxed/simple;
	bh=8xaxgYhd7iw58dBaQGX0bsoBnmqpWun+LLIE6AyP4UE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I9kwKhOsHSA4Z6vLoRARPfoU92wALktFBSo4NKVMzphuagC63Mh6XGlmBTfmfwLyexWrxhSniuqz5qrYqlJK3/0Nevy6+yUotse3ltM5AFylqbD/Haneqqsa/jTHpgdpNzIsBikgk70MF/FCQ1gK9bliCEJHUIAGfxfox9TPX4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw94ycSe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C291BC19425;
	Wed, 29 Apr 2026 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777450180;
	bh=8xaxgYhd7iw58dBaQGX0bsoBnmqpWun+LLIE6AyP4UE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Kw94ycSerLRTDuIODoV2Ta4vr4z3G5FfjV+BzRbkzmGoP880zHRd2iu2iWIZ9ggHa
	 iPo9hNquYBRePkcfZfXgNGBgTNfahfiihx3VHinc3jwgzuknye+FyT95nxprGNtIWe
	 Gabnjisn8kPutARPk+DRL2oHslwwrC5KYRnUAyabAMn6pQwcdCdrXNYEmG7NwyVBrm
	 Jw4yp3TP2dYYsd/n0DTXZgZLRLe7/xfZ47CRqCV/28cGLh+Cm7LtI5nxmxLZAr4OCl
	 rImpqU9lMN5t81hGP6xunc0TKFTdMUPodQHvYjbY3iG7cPyZXHJ4v7RqeEHLoA2v8N
	 1FcSiQZ1vRCTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Reply-To: sashiko@lists.linux.dev
To: florin.leotescu@oss.nxp.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
References: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 08:09:38 +0000
Message-Id: <20260429080939.C291BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 74095490FEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13573-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `fan-shutdown-percent` property is redefined locally in the emc=
2305 binding instead of being moved to the common fan schema.
--

commit 0de7c28110f8526177da5d5c1903c8b485eec6ec
Author: Florin Leotescu <florin.leotescu@nxp.com>

dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property

The EMC2305 fan controller supports multiple independent PWM fan
outputs. Some systems require fans to enter a defined safe state
during system shutdown or reboot handoff.

> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.ya=
ml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> index d3f06ebc19fa..8c2548539d7f 100644
> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> @@ -54,6 +54,12 @@ patternProperties:
>            The fan number used to determine the associated PWM channel.
>          maxItems: 1
> =20
> +      fan-shutdown-percent:

This isn't a bug, but should this property be moved to the common fan
schema instead of being defined locally here?

The fan-shutdown-percent property already exists in
Documentation/devicetree/bindings/hwmon/pwm-fan.yaml to represent the same
hardware behavior. Unifying this property in fan-common.yaml would prevent
schema fragmentation and serve as a single source of truth, especially since
microchip,emc2305.yaml already references fan-common.yaml# for its child
nodes.

> +        description:
> +          PWM duty cycle in percent applied to the fan during shutdown.
> +        minimum: 0
> +        maximum: 100
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429065955.2113=
012-1-florin.leotescu@oss.nxp.com?part=3D2

