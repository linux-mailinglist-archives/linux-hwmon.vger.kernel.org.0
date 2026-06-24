Return-Path: <linux-hwmon+bounces-15318-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GU72CQlKPGrrmAgAu9opvQ
	(envelope-from <linux-hwmon+bounces-15318-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 23:20:09 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE56C16DD
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 23:20:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mIwitUah;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15318-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15318-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB8B83031CFC
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 21:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755123E5ED4;
	Wed, 24 Jun 2026 21:18:40 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C41F03DE;
	Wed, 24 Jun 2026 21:18:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335920; cv=none; b=A8bsCneD+q6x67BxaKf4NRQmk6Q4QcTalPdF2qEz6n+cdnBEsTHQ+Igh35mIslellXMRqCwCXjnIl3INeaqnyGYgRFDLnutrSH9c3BCu7FpolPcvN/kZPI+87h4WbDFJ2qxNUSL4+zPYnJjHe3ldvbo1XCMYGGDMdL13u37yho4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335920; c=relaxed/simple;
	bh=WXbEjcVUchvdIyw0RDmLFDdqpRicQ8kzMmDuINn4+Oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KnlrUXfVGODjQHR7LTzZJS7tCQO4VrKU5sTCoiptuEh6gHxdXYCbtLr0oWtvoTDQ2CgMa6kP3t3OBsy1pa+IeicNuw87ZRgbRjRMvZbL8/yxRi8q3M8bPf7KVIxhLxY2FFSe22QTV8kZNbE3IP/QhAKa/Cksnk1PL+eqk5d9Mbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIwitUah; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C671F000E9;
	Wed, 24 Jun 2026 21:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782335918;
	bh=8FwebB3oW7JTIAx9c0KBhTkVtZ/0fMUZzm/iYF5ueQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mIwitUahzGXfS9Y7zEpAuWq+NfSagH25Fr3vAEZpRFiamKU2/NLT0VnjqFKPuKRu0
	 RxDA7wkiRnp6saaJLUvJ74V3ZB8KBkzoiOs7zGREZGWM0A7KOoupn7TtaWokbSml0I
	 S4PjbY9lbRmDZVjAyzW8JVbH9KO11Ng8SJTzL2/JJObn6D/EcJBWKPIzdO1R1+X5bq
	 43Z6kTUG/cFcQncJYLA+XmYMasWpYcn6J+BuNOxacV6HVz9URpXI0Ky7cHS2L9KLft
	 4PApI6gWsUf308wdOFTsDK6jG1H0p8N8Vh0wak1t7azmgN850LMTlOAP/b+RjiW+b0
	 gT7KphTMEB6zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 21:18:38 +0000
Message-Id: <20260624211838.A9C671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15318-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78AE56C16DD

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims the charging thermal zone uses 'multip=
le passive trip points' to 'progressively throttle the different CPU cluste=
rs', but the implementation provides only a single passive trip point that =
throttles all CPUs simultaneously.
--

commit 165036bedb34a29493f4bd0a7af23dab152aff0c
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and ch=
arging sensors

Add thermal zone descriptions for the keyboard skin temperature and battery
charging circuitry sensors exposed by the embedded controller.

>     - a charging circuitry temperature zone with multiple passive trip
>       points and CPU frequency mitigation levels.
>  =20
>   The charging thermal zone progressively throttles the different CPU
>   clusters as the charging circuitry temperature rises and triggers a hot
>   condition at the highest trip point.

[Severity: Medium]
Does the implementation match this commit message description?

The commit message claims there are multiple passive trip points and
progressive throttling across different CPU clusters. Is a chunk of the pat=
ch
missing, or should the commit message be updated to reflect the final design
shown below?

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
[ ... ]
> +	ec-charging-thermal {
> +		polling-delay =3D <5000>;
> +		polling-delay-passive =3D <2000>;
> +
> +		thermal-sensors =3D <&ec 3>;
> +
> +		trips {
> +			psv0: trip-point0 {
> +				temperature =3D <55000>;
> +				hysteresis =3D <0>;
> +				type =3D "passive";
> +			};
> +
> +			alert0: trip-point1 {
> +				temperature =3D <63000>;
> +				hysteresis =3D <0>;
> +				type =3D "hot";
> +			};
> +		};

[Severity: Medium]
Only a single passive trip point is defined here in ec-charging-thermal,
which doesn't match the "multiple passive trip points" mentioned in the
commit message.

> +
> +		cooling-maps {
> +			map0 {
> +				trip =3D <&psv0>;
> +				cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +
> +			};
> +		};

[Severity: Medium]
Additionally, all 12 CPUs are tied uniformly to this single trip point.
Should this define progressive throttling across different CPU clusters as
described in the commit message?

> +
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624210825.2644=
54-1-daniel.lezcano@oss.qualcomm.com?part=3D3

