Return-Path: <linux-hwmon+bounces-15229-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cgixMsLqNWpb6AYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15229-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 20 Jun 2026 03:20:02 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A1B6A826F
	for <lists+linux-hwmon@lfdr.de>; Sat, 20 Jun 2026 03:20:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C7+B3DkV;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15229-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15229-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCCFD303350A
	for <lists+linux-hwmon@lfdr.de>; Sat, 20 Jun 2026 01:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C664D13635E;
	Sat, 20 Jun 2026 01:19:59 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5383B640
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 01:19:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781918399; cv=none; b=RgQcXzqy8tS83bOOSbkLvka2ZcOtrBC3VcQwKY1P6RxMcJwkcjl9NYK/O8AEWdNX8ibR90Byk5h/dbR8ey3S0tftJBw/OS6WsOaS9YciPN2f+9z8KCwQZNCNaqC/JxfCU1yaaYCw+/U5gwMoDEItE4uiBRUN3ZE++zkOc/uqLGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781918399; c=relaxed/simple;
	bh=13m0O+4Q+lCquTUxM0miZwoWhd8Rnv9Bj05ELmKtr+s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X96w9FdB+7vDJKGy3NoPG7cP277hxrXTgXvgfLpfbBddrJ2Zar+jh96p5vRdaL1YI1NdA907oar+NEFxdjl6t59BV1ymlPNiDFWhwBUONNfuzacAdR7mCLVPyVmC/8jOCfsyC0QGeoU/nRk8HS9zz0OvwgBXJ8qlPK7k01yFjIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7+B3DkV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240211F000E9;
	Sat, 20 Jun 2026 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781918398;
	bh=pvWHv1My0qW57+WlKCCio2x0SePoov/r+ITZ2oG7LVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7+B3DkVTR1cPmIqsR5ku+ZcLpQUbWb9BmSHlnjS9kQBYK9u1HGk+cu44Yb5uTd6W
	 HAOln5Lb92eMSXW7PgFmCCLnk4OmuXKqlqu9vVyOz6gj55D3BJRGWtYYxHziFvPklc
	 5x3718VSZz2LJHP6Jidf9GoxYA1uTmg9jSYZVDWVY+OOrxC6FymtSD5kv4J6h938dZ
	 vdB1TOYekEUnsNSzubfQZFBQxKJuaDk+CZlssYeqSFEv9ibs8Fl1jJ9WYDbnI4wb/S
	 OYflg/n+EnXEGB1DxbvP50RyviUWmhESz0j4wHU0ws2qDXIxBuz9RKYNFrGtolPrXJ
	 McK0gXS/K+LCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: fix malformed table docs build error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Randy Dunlap" <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260620011833.3568693-1-rdunlap@infradead.org>
References: <20260620011833.3568693-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 01:19:57 +0000
Message-Id: <20260620011958.240211F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15229-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,infradead.org:email,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18A1B6A826F

> Expand the table borders (upper & lower) to prevent a documentation
> build error:
>=20
> Documentation/hwmon/ltc4283.rst:261: ERROR: Malformed table.
> Text in column margin in table line 3.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =
     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> power1_failed_fault_log         Set to 1 by a power1 fault occurring.
> power1_good_input_fault_log     Set to 1 by a power1 good input fault occ=
urring at PGIO3.
>=20
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Co=
ntroller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620011833.3568=
693-1-rdunlap@infradead.org?part=3D1


