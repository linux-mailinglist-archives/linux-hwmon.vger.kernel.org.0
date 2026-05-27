Return-Path: <linux-hwmon+bounces-14533-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOQ6C8ziFmpbvQcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14533-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 14:25:48 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C005E4244
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 14:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFB683002D2F
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 12:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF911364E88;
	Wed, 27 May 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJqP5HZC"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B381A9B46
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884241; cv=none; b=cz7+TyGOsTSraPVD6qzf9r9dLWDasYBQQ7DwOq5ao9ctKE88hb3bHNrv3F55toPBTjJqUCrBhsYvKq/sG4WdgmKuFo0iXlXRsi97kZOtp34t7K1hxJ0rR9E2bUCOI1DSQVOUNGH77u5wwNSgV1RdWBUqogGG0PzYGmV6V3sSJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884241; c=relaxed/simple;
	bh=IFhCiB7ViOJIzRgtT1FuBaOx8lSqen25MDiMZbmxGVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VhW0IAhpG4X7ZRZL1ruJc5/lRzjgAF1RYXzkGt7YL5ZvcFO4qTjEdEWhLmJC3LN+3f3r9LlBcS+QRm1ipHEknxp1miCmNJMRdZDTHl0QxDR0f3teFSENbVv/eEQKGxV+mJKfMWjJW6V/URFTa8L/8i/df1JQmb1uWuEC+j2ADto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJqP5HZC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6161F000E9;
	Wed, 27 May 2026 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884240;
	bh=VrLDzUdeKYnZql0WobZxUkoM049YDG68k+UNBqVvLPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PJqP5HZCBjvAA6xNH8lPHyGh/VDDMMkv4/MfEQQWC5Uub2Osu9FG+J9JgimIbNw0Z
	 LrLk1H2E+Sb9QH5+PNFcFzvWFNx3SIVWez2wP70S/e5kG/B2t+LJgiEqaa2bqBaK0j
	 lfUqS4XqF2qgqDdPsw9rIoCsXwAyGiUyxTI7X1UAy6TuPfqmRm1TBqhrvEsmsUPkQm
	 cwISe3FQEb7A4DS9VwXew9kMqXTEfDpx4O6EyYUH8jTQY2EQWLaH3+8KLvrtTlh3ew
	 mE948oWbeGI/5b5ItnM4d+xZBaRe09ZQS6AJzB1tE3g4/905um6HtETkFjD0MJCDjI
	 JcMnmQun2qbTA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] drm/xe/hwmon: report a single fan for DG2 instead
 of two
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhan Wei" <zhanwei919@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260527115311.13398-1-zhanwei919@gmail.com>
References: <20260527115311.13398-1-zhanwei919@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 12:17:19 +0000
Message-Id: <20260527121720.5B6161F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14533-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 40C005E4244
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> xe_hwmon_pcode_read_fan_control() currently hardcodes *uval =3D 2 when
> queried with FSC_READ_NUM_FANS on DG2. This causes fan2_input to be
> exposed via sysfs, but on the tested Arc A750 LE (DG2 G10, PCI ID
> 0x56a1) fan2_input reads 0 RPM permanently while fan1_input correctly
> reports ~800 RPM with both physical fan physically spinning.
>=20
> The RPM is calculated delta-based from a tach pulse counter:
>=20
>     rotations =3D (reg_val - fi->reg_val_prev) / 2;
>=20
> so a constant-zero RPM means the register at offset 0x138170
> (BMG_FAN_2_SPEED) simply does not accumulate pulses on DG2 silicon.
> The i915 driver does not expose fan2 on DG2 at all -- it only maps
> PCU_PWM_FAN_SPEED (0x138140, identical to BMG_FAN_1_SPEED), consistent
> with the observation that only one fan tach register is wired on DG2.
>=20
> Report a single fan for DG2 to keep the phantom fan2_input out of
> sysfs.  Battlemage paths are unchanged.
>=20
> Tested on Arc A750 LE (DG2 G10): with this patch applied, fan2_input
> no longer appears in /sys/class/hwmon/hwmonX/ and `sensors xe-pci-0300`
> shows fan1 only.
>=20
> Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")
> Signed-off-by: Zhan Wei <zhanwei919@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527115311.1339=
8-1-zhanwei919@gmail.com?part=3D1


