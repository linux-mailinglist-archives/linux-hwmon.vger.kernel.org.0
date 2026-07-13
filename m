Return-Path: <linux-hwmon+bounces-15874-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zp3zHr5VVWojnAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15874-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 23:16:46 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7674F362
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 23:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AiE6Vkes;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15874-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15874-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 240F630BAA34
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 21:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378A9345736;
	Mon, 13 Jul 2026 21:16:04 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9FD2253EB
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 21:16:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977364; cv=none; b=EZh+ae0tOPP0ThtLqvRStMJ3KM0kjQvplh8ejHQZW+5Zg6sm37zWXsgGRHN2PC7Fhp91bQeW5qT2yJ0os03pnWKQ7WBJrZBBXj54E213/MSvWfcBI+Ffs+AhZZE2gJotic/3wZHwWuUNYfM4r0UZX5G3L9/IhYLLtslUcrjyb0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977364; c=relaxed/simple;
	bh=Nce2RMpK60p2h0+/KhqKynUjddmuEEyuCWKx7lYdv9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UA6i4sT5f/2tYlW8Awa5SuW+KwEeKR9HmB77bKU/EbnAnQkCtEpmMY7g6IN/CL/21+KCRhWFZFUpGHlP/oY8F2p7g5DxOD9rKbxwmi1MVpE4B0aTL8HEUTIIdQVMOhRYbu5J271aykEYlOcUzx1BX5ceyKwtDbQ60Q9oKPqMQwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiE6Vkes; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD45C1F000E9;
	Mon, 13 Jul 2026 21:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783977362;
	bh=Nce2RMpK60p2h0+/KhqKynUjddmuEEyuCWKx7lYdv9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AiE6VkesCZuUP+AIE2QdfLQZo1MBsinsJP3R+8fehngnn7H1CelHQZhb9aa0Dc+LU
	 +WIMS8IuL20Z4Wcg8rVMjbPkxyxBmuEw1iFasJnxbK3pQwNVBl/fqxmMP81dUkGIst
	 x+xHWct6ffJZWYcehgMslq+MxIcs5y9sH57yWcjQR/XVMEEaxl7Svyj+T8ZZcoPM3a
	 NwEgoedBYlxPHb5jsa4K1LYy6tqKlS32xv+MRi3hxOA+DHLRM5ivsdXdZVdvVr9htP
	 9UA6J1YvIGijn2sUXwRnnf61u0flQuX0Iv0+kF7bpzAicWI912tFqZE40JtEBlzVOA
	 qCt8oAHYrDxtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (tmp401) register with thermal subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260713-for-upstream-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr>
References: <20260713-for-upstream-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 21:16:02 +0000
Message-Id: <20260713211602.BD45C1F000E9@smtp.kernel.org>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15874-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vjardin@free.fr,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[free.fr];
	FORWARDED(0.00)[lists@lfdr.de];
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
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8D7674F362

> From: Vincent Jardin <vjardin@free.fr>
>=20
> tmp401 is missing HWMON_C_REGISTER_TZ. So a devicetree thermal
> zone referencing a such sensor ('thermal-sensors =3D <&tmp411 N>')
> fails to register it. Then its cooling-maps is not set, which means
> that the fans are not managed.
>=20
> Same as lm90 or jc42, set HWMON_C_REGISTER_TZ.
> Boards without the property into the DT keep the same behavior.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-for-upstre=
am-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr?part=3D1


