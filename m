Return-Path: <linux-hwmon+bounces-14479-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K0vBmIIFGq6JAcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14479-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 25 May 2026 10:29:22 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D45C7C37
	for <lists+linux-hwmon@lfdr.de>; Mon, 25 May 2026 10:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8047A3045DD6
	for <lists+linux-hwmon@lfdr.de>; Mon, 25 May 2026 08:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085AD3E16A5;
	Mon, 25 May 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rrhr4FHc"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3A3CFF6A;
	Mon, 25 May 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697513; cv=none; b=FwfKN9U36eAzzVyy/3BvSHEnv0R7AsQKnE6LJy2YqvECPWKyEng7tGSIPny3O0/Y3DF7OGJbv5QL/fkv/b3ic7vi2htFMMONkvfQeduhRXxD/AVK1VABawthdosf8ZFh1qhGKc4VqmiTnAbI8IEdsgJqpzIKA9Ayr+1SLPDX7Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697513; c=relaxed/simple;
	bh=qK02sUtQCrBIbwZTzE/imEPtQVrAmD3WRrd6V3LryuQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nHsqA9UfsVgxWZB9/n/mSfrscwMNkI1NucfBe5WmGW7+foD+sM2D8Frgr9WZqblKV3V/WIm16S1vtobO32o0iquNPhf0G75WibQicVol37x8PQ4Y2Mg260f8TC8Y3pEGI7yoTruk2gmR3ptByeGBw/J7kw3pjBrd3mWeOindzeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rrhr4FHc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F61F1F000E9;
	Mon, 25 May 2026 08:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779697512;
	bh=NVJkDmmbZtEPk+Kqj4uE12KrfyY9Vb1oAXv6AbMWW1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rrhr4FHcA8DM5W9misj6s18CLnIev4M/mZVmBWmd69HVtoABmtEzEGjmm1BsfRH6H
	 dL81ujhGgs582+q2EapxrG6MY5gnKdsAaen+lv6fsQ9hHJApn8hOCOEbQrAhCg7g//
	 kRZYFJ88Yx9rTKYWVNoJlBqZT3dkLqvnBslpphByxAgrJ0zB0ocdqijXrwbFzr5Vkc
	 X3QGeq1Ag6kp/JlqNS9ItMtrV67MwQdtfNv28IC4pixTerJRsEI2I/ShgjUCzPRweB
	 9F6/QovZ3qH98MSOltXVTHPRh9lEtkoesqfKRxZ8wkQ+8COJF0V6DPjxNU4YxW9bXb
	 IOFEZ2w+rvrTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] mfd: nct6694: Move module type macros to shared
 header
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org
In-Reply-To: <20260525081736.2904310-2-a0282524688@gmail.com>
References: <20260525081736.2904310-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:25:12 +0000
Message-Id: <20260525082512.9F61F1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14479-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Queue-Id: DE2D45C7C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Move NCT6694_XXX_MOD  macro definitions from individual sub-device
> drivers into the shared header include/linux/mfd/nct6694.h.
>=20
> This is a prerequisite for supporting multiple transport interfaces
> (USB, HIF) without duplicating these definitions.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525081736.2904=
310-1-a0282524688@gmail.com?part=3D1


