Return-Path: <linux-hwmon+bounces-15569-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qSUOHgBCSmrpAAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15569-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 05 Jul 2026 13:37:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 002EB709D5D
	for <lists+linux-hwmon@lfdr.de>; Sun, 05 Jul 2026 13:37:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DffWPyTL;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15569-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15569-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71FAD300A532
	for <lists+linux-hwmon@lfdr.de>; Sun,  5 Jul 2026 11:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972293793BE;
	Sun,  5 Jul 2026 11:37:17 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA382C08CF
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2026 11:37:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251437; cv=none; b=qjGi5933pxioExF3TX8YLSzpRfHP+pYS6rhw/eWLyKrLorwOaPGp7/cbzHD2CZSoRkCnq82xnpds5zNHcPIouthu6IHys3jfnN6XV5XBpt11iX8FUJ+UC1/DzBw8P53dhJ4NB4kVqjGbGcpFfHTViHstw+BpMxXpSNvmtBXL7Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251437; c=relaxed/simple;
	bh=4CJwV1SRxn2Pd7T0x15LMgrxFov+klFnCQUGNYgT9+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G9Cc82RhpFJ84vYz98tswIIL8R/z04SIYVKTMJVBDLmSfC7WrMQFLI41EGwnslJBvHbsHm9RGPtjZ4DvpifE41N5QKKH+ZSgfWNRfmF7ecjaay28HS0UzdkV7nvXVINtGY5bDSpZmUrsqaiyeoCJ4Uk+l93ERbxDX2rK5ukDCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DffWPyTL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6111F000E9;
	Sun,  5 Jul 2026 11:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783251436;
	bh=4CJwV1SRxn2Pd7T0x15LMgrxFov+klFnCQUGNYgT9+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DffWPyTLtg/JY+2sqrDE0FfoUGqjhPOvcI7In/THFsMvNHYKvacHPcdM2oLwT9Roz
	 RSxWAjRByAFlhY0nYgqupCQXB7bhGCoIRDVrQBpBPickj85XaAVxIafIBcXTXlXJyT
	 cnGOLRI+xW8kyTGNHRhvG5vCqyoAKOwPxwhdWguHA5gS97Dm4hmttR4igWmrlXjP02
	 0AmePS0wWXVX2OukwCBAceRgfM+mtSl17kL2vuYkRCecnqWGqSGKSNiUYky2JDtwOT
	 aQBi037QXsFtvpSXLZy0n89Gp/Ug6qb+AhPPx/Jf743CoNsRGq/J1QgoOkZLQoe0ZE
	 ig6Dks6fAv34A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260705113246.812500-1-eugene.shalygin@gmail.com>
References: <20260705113246.812500-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 11:37:15 +0000
Message-Id: <20260705113715.EE6111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.30 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.86)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15569-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 002EB709D5D

> From: Miska H=C3=A4m=C3=A4l=C3=A4inen <miska.hamalainen@hotmail.com>
>=20
> Add support for ROG CROSSHAIR X870E HERO
>=20
> Signed-off-by: Miska H=C3=A4m=C3=A4l=C3=A4inen <miska.hamalainen@hotmail.=
com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705113246.8125=
00-1-eugene.shalygin@gmail.com?part=3D1


