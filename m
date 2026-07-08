Return-Path: <linux-hwmon+bounces-15679-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AiBzGtOuTmpcSQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15679-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 22:10:59 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B672A1C7
	for <lists+linux-hwmon@lfdr.de>; Wed, 08 Jul 2026 22:10:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lcalYUmu;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15679-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15679-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EF803051D68
	for <lists+linux-hwmon@lfdr.de>; Wed,  8 Jul 2026 20:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A43C3453;
	Wed,  8 Jul 2026 20:05:36 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B842E3FE
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 20:05:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541135; cv=none; b=JKAINg9xpcaVBN6J4i4cWFuE5pXU7qqukWLYFyYWUmO5JDonY/k7SK6It/JpnlIfaGr0pxuoXo8i9hoAPoxZV0V0AJTPGIk/tnCL689Wxqym0A7uldgK/SWzgFN9tvFUWQwF43eA6qDLPtFhmjBS7Z8/tfaWThodh0ebNlc8L90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541135; c=relaxed/simple;
	bh=EkbzQLQBesNIk/reNjZ4wlDPfW3vwid7gM5bnCQA1No=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yh1g3cRJY0V+xfz6p/1xXyuJ/o7bE+TSM5CY7CQTgVq1YdX0rQSXobt4DbvbtHghPhAu9JwDw2p320UhkgfPx2kajaaza+RF52elf0XUb9RcqHW/nP6oOsB/VjpB0EYku8A7WifLss2DQ3iKWuZ0BsYE66DLlKqzTfdtNXsDeUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcalYUmu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0861F000E9;
	Wed,  8 Jul 2026 20:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783541134;
	bh=EkbzQLQBesNIk/reNjZ4wlDPfW3vwid7gM5bnCQA1No=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lcalYUmuxLNfwt5BG2rnEFDHrMEquyBy9ESTcdQtClSoHnprWw+hqIn82OcItIdCo
	 v0ZMvJEMVTmWfXNjoH/E70q0/wEmN9LNk7gBfIBbzkX/3O9MYo6OKWhfqXDqV20tyT
	 kEKiCMHGiic2pe0kOArHUHNCKag3SqIwXyEFEzMi/2uYzWklImZMMwTvonEVjlQ3xy
	 rJ0Ifz6wmwRTs4Q2BC7+xiuchTXhXjfIR1M7ehF7V2tV0PwjMmWyHkFsdFrOTkv01q
	 yE3rvl+EJCotaN4yV9T5ph6kU35Sg/16eembBxxmq0HQAB6SEfSA5S6DOqlfjwT5ah
	 p2v3ObRdQ9ilg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
References: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 20:05:33 +0000
Message-Id: <20260708200534.5F0861F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15679-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,gmx.de:email,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B62B672A1C7

> From: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
>=20
> Add support for the ProArt Z690-CREATOR WIFI board
>=20
> Signed-off-by: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708195638.1324=
168-1-eugene.shalygin@gmail.com?part=3D1


