Return-Path: <linux-hwmon+bounces-15533-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BXksGSzwRGp83goAu9opvQ
	(envelope-from <linux-hwmon+bounces-15533-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Jul 2026 12:47:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D69966EC586
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Jul 2026 12:47:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CDg3+LI7;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15533-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15533-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 543ED30174D5
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Jul 2026 10:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2E7426D12;
	Wed,  1 Jul 2026 10:47:05 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A43603E9;
	Wed,  1 Jul 2026 10:47:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902825; cv=none; b=k39OQPV7io+yKg7gduGIFXHXOv7lz88xeMVJl+dvUUBkXsmjWmgFveTYYurWK5RirMpswcX4QGL53S92qOnaEecwd5TtcfBzf4CeKTrIcJKHw2TEF3OPECPFbHnz4J6oJS1TjwbPbq2YXY8L4wCwv7QxwzMuhfgEgYpdKPzwHf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902825; c=relaxed/simple;
	bh=3BPpKGMLuWytomcUw1bKBwVMgTyDrzZOPrlnMwyKibI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VCZhvCz+6RG6V7NlhpGblcaUm1xSxkG2ZWjxCnKoqfROAgTV0oBIxZhV3fqV5WCuVZvk6tuMdgaott/5TcNTj8XfgwnTm8X9VWM6d8Wlj04S859xQmHuuprZlT38mwf41fEo9SlOd/cWtsjaV5bVDHk/+3U+5SUi/rrppA9p3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDg3+LI7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CBD1F00A3A;
	Wed,  1 Jul 2026 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782902824;
	bh=01OrCu7K8dvwQygurNGqJke27cki3w45OjUA7Fc8Z2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CDg3+LI7HMu8FlB8b6KydlWX/a0o0RUIwSqyveigmYXA3+EiFZZX4B9eftwQmqE+/
	 B0gT1ixcOxyBeaCXg04xPICM2w5NX25STEHjKCA7fhoSunB7R9YNJMZ4hdthXhqCl8
	 Cycr1AQ8sliS/CC+ZQUItEP61e26OyNbZp0RY/OtKhTlQhUqogTnjAu+mihjZ4JWcK
	 uIHjs/I9Wke7O88WdvJurYKVgxZ8/WZv4DBqzh3Ddg2LRjPAJWj9XLqZD9fLlnDIKI
	 ddORkwwAGYnAVHxX+G0xvNcUv34t88pQNIIXMZiG6q6r6H86J8fxFjhTP+AFlsMSo1
	 GeFXjCmJEeNeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 10:47:03 +0000
Message-Id: <20260701104703.D7CBD1F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15533-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D69966EC586

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The DT thermal zones are completely non-functional because the bac=
king EC driver does not register its sensors with the thermal framework. Th=
e driver (`drivers/platform/arm64/lenovo-thinkpad-t14s.c`) registers a hwmo=
n device using `devm_hwmon_device_register_with_info()` but fails to includ=
e the `HWMON_C_REGISTER_TZ` attribute under a `hwmon_chip` channel, nor doe=
s it explicitly call `devm_thermal_of_zone_register()`. The hwmon core requ=
ires `HWMON_C_REGISTER_TZ` to automatically register thermal zones. Consequ=
ently, the DT thermal zones remain permanently unbound, and the CPU thermal=
 throttling described in the commit will not execute.
--

commit 7064bd8ea5ff8a561ac7494d4e760b120e4d6d03
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and ch=
arging sensors

This commit exposes the embedded controller temperature sensors as thermal
zones in the device tree for the Lenovo ThinkPad T14s. It maps the charging
thermal zone to CPU cooling devices, allowing the generic thermal framework
to apply throttling when temperatures exceed the passive threshold.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 5d49df41be02a..a19a363da9ed5 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi

[ ... ]

> @@ -1729,3 +1731,67 @@ &usb_mp_qmpphy1 {
> =20
>  	status =3D "okay";
>  };
> +
> +&thermal_zones {
> +	ec-keyboard-thermal {
> +		polling-delay =3D <5000>;
> +		polling-delay-passive =3D <1000>;
> +
> +		thermal-sensors =3D <&ec 1>;

[Severity: High]
Will these thermal zones successfully bind to the embedded controller?

Looking at the underlying driver in
drivers/platform/arm64/lenovo-thinkpad-t14s.c, it registers a hwmon device
using devm_hwmon_device_register_with_info() but does not appear to include
the HWMON_C_REGISTER_TZ attribute under a hwmon_chip channel. It also doesn=
't
seem to explicitly call devm_thermal_of_zone_register().

Without the HWMON_C_REGISTER_TZ attribute, the hwmon core will not
automatically register these thermal zones. Does this mean the DT thermal
zones remain permanently unbound, preventing the CPU thermal throttling
described in the commit message from actually executing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701103714.2258=
3-1-daniel.lezcano@oss.qualcomm.com?part=3D2

