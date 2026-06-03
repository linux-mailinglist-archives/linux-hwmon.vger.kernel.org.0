Return-Path: <linux-hwmon+bounces-14676-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GZRyIij0H2qztAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-14676-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 11:30:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFF6362B8
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 11:30:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Xw5/kZqo";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14676-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14676-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6A363077708
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jun 2026 09:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6177238239F;
	Wed,  3 Jun 2026 09:11:55 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7137FF41
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 09:11:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477915; cv=none; b=WT0dY5tNyUOz/QIDBXncnEU5IS+0YwOPrM8cVyGcQMP7inEepIru9W/BUZatgpCMYQbGheZl99TydubriFn9ZZjGO2M4wEOcE+OXubiPCfluPgygA7QvrEzOIvUGmnZic4IKngd774Xs/IhjYhRZDNrtUTnwQsJfX73ZScOy5gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477915; c=relaxed/simple;
	bh=BCtto/ARFqBCM4wQYTN1ORz/k3Mj82MM6yOKf63M3JQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fhsqsAdakJEkwP+7Wad7k7VZnSuTgBdDicZN6UWRAa/1AQC0dVDzSMW7bHAdHzIqA8DKOwz7yl9jsEyMHbgi8/xXRg4ThN7GNpfD4CH2kmq9Xey0hAzy1MXSmi4IyXwM1KtljPx+pMjYPFEagSKzBqE29XCHkPHiksBz33wK/2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw5/kZqo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A321F00898;
	Wed,  3 Jun 2026 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477913;
	bh=BCtto/ARFqBCM4wQYTN1ORz/k3Mj82MM6yOKf63M3JQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xw5/kZqoMq1K+ebTK3zra5OSWxFKWD+1ZgAGYT+52vDVsqJUw/FWhNT6GShSNUllJ
	 1O9bWvAAuRQmNReCbkGdfX+7XksipOuhOn1NIgED/Ar6NDXbz0x4nbkIDiGJ8RxiO4
	 H3EoRI1MkBYeAG4b5+S3lmGjgHdzJqavjSWdP4+9TDO0SXwxZFpMuuH/DY1WuNsUXo
	 xtPgd3ZPM2TMCGkQr8dpq71lrD+8PtAh7EDefKVjLZxUJt/CQMv/1nmDpeuWPNX8iv
	 XRq4f1iWhazf2otJK5CrER+FiJi5xb0FZwCNoWm/ekrqiEPQ3xGwh83/84neJ+7DU/
	 bXyQKZ0kOnMUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] hwmon: (pmbus) Add support for Flex BMR316, BMR321,
 BMR350 and BMR351
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Nilsson" <linux@erq.se>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260603085712.659432-2-linux@erq.se>
References: <20260603085712.659432-2-linux@erq.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 09:11:52 +0000
Message-Id: <20260603091153.92A321F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14676-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@erq.se,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,erq.se:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEDFF6362B8

> Add support for BMR316, BMR321, BMR350 and BMR351 DC/DC converter
> modules from Flex to the pmbus driver.
>=20
> Signed-off-by: Daniel Nilsson <linux@erq.se>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603085712.6594=
32-1-linux@erq.se?part=3D1


