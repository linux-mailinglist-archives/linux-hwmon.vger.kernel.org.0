Return-Path: <linux-hwmon+bounces-15607-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4/gDnPxS2q/dQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15607-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 20:18:27 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17C71466F
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 20:18:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BrtDmefA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15607-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15607-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC100303B723
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 16:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F83442F6F4;
	Mon,  6 Jul 2026 16:16:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A931B101;
	Mon,  6 Jul 2026 16:16:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354563; cv=none; b=L7riSwXqUQ5rCN5A83Kllkk0K4YKEjfnDuUNusaSAAh5UK18uajsxlreu37tnvI0X6xy1E6VFANPKFMCNhyWbD3g5A8HRIrpa/weD9MWHYxT+9YMvdYDKIYZ/DR3uljBf7fmuukK0E6wptxJBAzIe01u/ahG5bnymqp1mEuMLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354563; c=relaxed/simple;
	bh=N91VeW+ubG7x5vnljqP+WP6nDnCalzi8wLn+azKCEkc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZnzkNpiI8I4BqrUo+riI7alaC8TUZ0hKw1WS3TSBOQCwGt6wcHTo+nD07H4NDG1AcrgSXVRQVKxX7Ud0lrFhTvUOX4BTnyvhOPLCqR23rFBzvtz1Xd+xLe5RuBMtHa0f6Zk2bApz34KmrTse3Ui6K0pQYUoihwMuOwGr234m3oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrtDmefA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FE31F000E9;
	Mon,  6 Jul 2026 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783354562;
	bh=26eQQ0ZLM1UldWuXMtiJ00Vxg17kW/7dE/yA5OpapZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BrtDmefAIUaxTaOimph5oLyrhhyKLlvWnWcX3wP132DFrYy2+nCPcQ0Lxmn4ePl/P
	 C4VqkZ+stua1g4t9QqfZJ5TIA28rnAkKYUzwoqcKLQSPE4PesmHir3PgPeOaNKP/f4
	 WGm/bUObabyBUVwsOaOc9T7duHVPsytTevrnemHNanNpG0qoVLWdrEOQ2qQmSsbAke
	 +iusuRrWLuZrLZ4n6TWxGUQ6gJEu6sjX2wpDCJ1QbAeJ3Ou+Flb6ga9/BAX/2DF2cr
	 vQop1dxCC64hLyWuRXaTg8Z2SVEJBupTFnR8WD61p2oWmeEdO8XH24Yk53snNz6l4M
	 qXpsim9nOT9iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
 <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:16:00 +0000
Message-Id: <20260706161601.22FE31F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15607-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 8C17C71466F

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds the `#thermal-sensor-cells =3D <1>;` property to the=
 `embedded-controller@28` node without a corresponding update to the device=
 tree binding document (`lenovo,thinkpad-t14s-ec.yaml`), violating the DT s=
chema.
--

commit 6785b707e0b11ce8dd5032f0c96a9debef8c413f
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and ch=
arging sensors

This commit exposes the Lenovo ThinkPad T14s embedded controller as a therm=
al
sensor provider and adds thermal zones for the keyboard skin and charging
sensors in the device tree. It allows the thermal framework to apply CPU
throttling when the charging circuitry exceeds passive thresholds.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 5d49df41be02a..ed5ba3a428a8d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -979,7 +979,7 @@ &i2c6 {
> =20
>  	status =3D "okay";
> =20
> -	embedded-controller@28 {
> +	ec: embedded-controller@28 {
>  		compatible =3D "lenovo,thinkpad-t14s-ec";
>  		reg =3D <0x28>;
> =20
> @@ -988,6 +988,8 @@ embedded-controller@28 {
>  		pinctrl-0 =3D <&ec_int_n_default>;
>  		pinctrl-names =3D "default";
> =20
> +		#thermal-sensor-cells =3D <1>;

[Severity: Low]
Does adding this property to the embedded-controller@28 node without a
corresponding update to the binding schema cause make dtbs_check to emit
validation warnings?

Since the lenovo,thinkpad-t14s-ec.yaml binding does not define this property
and uses additionalProperties: false, it seems that adding it here will
trigger a warning. Should the schema be updated to allow this property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706160830.1769=
8-1-daniel.lezcano@oss.qualcomm.com?part=3D2

