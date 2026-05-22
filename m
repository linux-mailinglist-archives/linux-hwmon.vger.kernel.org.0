Return-Path: <linux-hwmon+bounces-14406-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCqZE5joD2rTRQYAu9opvQ
	(envelope-from <linux-hwmon+bounces-14406-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 07:24:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2145AF1CD
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 07:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07B6E301D30D
	for <lists+linux-hwmon@lfdr.de>; Fri, 22 May 2026 05:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5413939B2;
	Fri, 22 May 2026 05:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2ZeLI19"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C6F389107;
	Fri, 22 May 2026 05:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779427447; cv=none; b=uBIDzV8IHxr0RUkzv0lU5PMfGLEHuA9VNfSPrZoUaGhOfLH0vp+OjeOYYg7ArR/JKx/3l8pKkftxqFLbshflercOcpR74a/gepf99LjpGHA/HBloU6T1T6lIItbCgDyoZ+JxnrNkm6y8hEQP+fpeiaE7hcbKdFbT7r45pobubMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779427447; c=relaxed/simple;
	bh=Fmt0bPk2u6cDfkfdh+ve2ehg5Sfq61uewGOB9CJv2sQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oImtGJIeT0bJ4fA1VIMkyQO+V08bXXnEkqwGAGH8HGEYW0zeMRDi7JQLhXbsRSkIf9G9V1bjQs5NWoyHp+jkKRw1Vbc+cKfMBPX29K7qO+GMm0NEe0oVYzb+pkrTFf+BRH93+qBgzXF4mBw5nM1fjAk1Yw5EwxPbzllP9p+I/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2ZeLI19; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197E81F000E9;
	Fri, 22 May 2026 05:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779427446;
	bh=vzZzFiGEMRTK/DE0DfwDjbTWysjgc1+1FLyYSie3bsk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n2ZeLI19fsHEd37e0zRJY1/3jeTvY7ivN2yuUKFPrri8GdDIrJzo+gCasemH1vapV
	 cXr9YYuag1MzxIGMq+EjqjzvsHUA7/ee9vuQK509JrXoawOMrg/6fPOSR3m+f9UE+1
	 tUcbujiFxfq4s9p23Lc0ufA8rt5a9IsPaHbk4dBwUss01s6JVM2OCxGGv/sypmRRzw
	 plpACh2EoRTEWJPXpQtjVkVK5xybNt1rOREZPlbVPYg8MAcu01MjZ0LlfQfzwdOO8a
	 fam0KJVcy43reTTg07LJQbsiqEzi44Sdlp9dTCbK5c0xqVWT60eYMEdVcOKKyXLEIC
	 iH/SRNrhp2Y0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 2/6] mfd: add NXP MC33978/MC34978 core driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522044855.1772639-3-o.rempel@pengutronix.de>
References: <20260522044855.1772639-3-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 05:24:05 +0000
Message-Id: <20260522052406.197E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url,pengutronix.de:email];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14406-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: BF2145AF1CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Add core Multi-Function Device (MFD) driver for the NXP MC33978 and
> MC34978 Multiple Switch Detection Interfaces (MSDI).
>=20
> The MC33978/MC34978 devices provide 22 switch detection inputs, analog
> multiplexing (AMUX), and comprehensive hardware fault detection.
>=20
> This core driver handles:
> - SPI communications via a custom regmap bus to support the device's
>   pipelined two-frame MISO response requirement.
> - Power sequencing for the VDDQ (logic) and VBATP (battery) regulators.
> - Interrupt demultiplexing, utilizing an irq_domain to provide 22 virtual
>   IRQs for switch state changes and 1 virtual IRQ for hardware faults.
> - Inline status harvesting from the SPI MSB to detect and trigger events
>   without requiring dedicated status register polling.
>=20
> Child devices (pinctrl, hwmon, mux) are instantiated by the core driver
> from match data.
>=20
> Note: The device currently lacks suspend/resume power management callback=
s.
> If the system enters a sleep state cutting power to VDDQ/VBATP, the device
> will wake up in POR state with hardware interrupt masks reset. Power
> management support is intentionally deferred for now.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522044855.1772=
639-1-o.rempel@pengutronix.de?part=3D2


