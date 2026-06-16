Return-Path: <linux-hwmon+bounces-15127-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TUqDCz7zMGpiZQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15127-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:54:54 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9683168CAA8
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:54:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lMjlT8LN;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15127-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15127-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE1CF301915D
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 06:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE91A313E07;
	Tue, 16 Jun 2026 06:54:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7A1FC7FB;
	Tue, 16 Jun 2026 06:54:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592891; cv=none; b=Z27zM33/oGdbFpwJA7WSWlCZ3kMJsu3I8+4fYe4lpysV9Vk1kPIgcCiIVCsCDApgrz0uYAzIBfw3voDTfPx48SlXbmFclquVaud/i9usjHcnVeCoFsnRH0bVs1pn/C1fzBtGYkF7f6cZ1DxSJQX0R4dkNff1BKT5I0O0U66kOxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592891; c=relaxed/simple;
	bh=VpXUmHWrZIDp2H+dYkGv5mQ3jFYyEXc5DPh2SF8WQaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=smlgP5Hp5ZSs0nitaU+G2WiEUdNrxI87nYjTcxJZXU5+ppNoziVrt9ONkmKdfyMNAo7EXFlH/M0nB5RLBETqI9Tt6MunGWjtXzJlPndzX8Ysbxj6d89LxPoxyPmAPb31EqU4Aj1DQLXWYYq+IILzS5PNHwIvzDHD/jkTAw6f9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMjlT8LN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479F11F000E9;
	Tue, 16 Jun 2026 06:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592890;
	bh=VpXUmHWrZIDp2H+dYkGv5mQ3jFYyEXc5DPh2SF8WQaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMjlT8LNpvcaBI4phQg7SLWKbT3+Y8U5mvkjVz76tfkCgG0XKGYYpDgUi1TT5AYM3
	 XVUeFssfHRvS3L0xRd+j56MldLmyneBvc4DiDeK5PMYOp53VoLYuLLrmeV0yead1N6
	 kPWauAr9TcBfToux1NRyQ4rrwJx85YEXv8Uiz56UWsM2JbqTswmPVc6RlMMzn+KPeI
	 K2x2ba4Rf5KRAdioVWzfFBzlwX0v2dEjn8U8aeYX4ZSY8DDE2xrFOPvNTmyKSykrsb
	 RkYNQv+uuprlM6uB2Y5Q9LVvYiItCOD77x4mWQiv72rP976l4nPzjQgWbl60hSc52z
	 JOf9b47xqtwng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] doc: adm1275: Add ROHM BD12790
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <7bfa22c245b81c8027736019aff717cc1f5039c8.1781591132.git.mazziesaccount@gmail.com>
References: <7bfa22c245b81c8027736019aff717cc1f5039c8.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:54:49 +0000
Message-Id: <20260616065450.479F11F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15127-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9683168CAA8

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D5


