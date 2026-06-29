Return-Path: <linux-hwmon+bounces-15424-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tch+LqbFQmo3BQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15424-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:21:10 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD456DE423
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:21:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VP2a3Cub;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15424-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15424-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D8853005309
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 19:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43152F1FDF;
	Mon, 29 Jun 2026 19:21:05 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE223ED5B
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:21:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760865; cv=none; b=VwpUOwLi3Vq9we+j5pk7xYFQVU5vYy6K9FiT+VeVs2qwl0+0AfBdIvuPcAg9kSkc2gUFQsvv40w/Z/4D1mD0Df0J/U8g17lXF0VVfHSjNNPwFEv0E2x59nTiGVShUMpoA3LeF4TL+jeCoSTSTV9en5kVNxEwVVD5la3zELt46UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760865; c=relaxed/simple;
	bh=ZaQtcP9ObGFJAkeMdAENi/JJL/+aOt7M3Cfg5LE8jL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SaUNpG8LOYEo7zu3lQUOloeo7fYR0EoFdjcLXl1wl1J3ACHijmWMwH9tupa0kfmk666UV/gw2U4VpdJMVGUvRRyh9NiaiRFZGbkc/1rwsO3tECv9X3a9Z3/iUfhPURxKfgN/QQB5BixyXg5yIGor8n5ErdOtMr6ejGayoti8VPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP2a3Cub; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7115D1F000E9;
	Mon, 29 Jun 2026 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782760864;
	bh=ZaQtcP9ObGFJAkeMdAENi/JJL/+aOt7M3Cfg5LE8jL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VP2a3CubmxA+fizRq4Mnn8iTZhQQmsRdiraaZqeJKB/z0D/MlSzAN0BrnbZEyiPV0
	 S2U+jhZ49C4hTQzjAitakO/r51HHQaYxyjp1Run56KbofDPRTPXI8924zjRpDXD2/F
	 tWtydNZuN8xnFOv+FLuKsEmOIEBpFVz10YQDbwkGYjKysTcGwZiuTEHDUhsO4Av9e5
	 6STcqmHhAzwnZKsQoxbPFoKohrIyfcJyJt9f2h3ETwbrSxil8aQiY7jYRIWVLgKXH6
	 i9zskhdb74tBrby4dqWMM42a7iRaKLkAPs+LUzlP3Gzktre+9zn657JRxoaRQ7Efa6
	 kF7Cv9TIwkipA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (max1619) add missing 'select REGMAP' to
 Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-1-8104df929b1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:21:03 +0000
Message-Id: <20260629192104.7115D1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15424-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joshua.crofts1@gmail.com,m:linux-hwmon@vger.kernel.org,m:joshuacrofts1@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BD456DE423

> The Kconfig entry for the MAX1619 sensor doesn't contain a
> `select REGMAP` parameter, causing build failures if regmap
> isn't selected previously during the build process.
>=20
> Fixes: f8016132ce49 ("hwmon: (max1619) Convert to use regmap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-add-kconfi=
g-deps-v1-0-8104df929b1a@gmail.com?part=3D1


