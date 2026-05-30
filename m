Return-Path: <linux-hwmon+bounces-14650-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xgMALqhmG2rvBwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14650-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:37:28 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A7613AC2
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7121830058F8
	for <lists+linux-hwmon@lfdr.de>; Sat, 30 May 2026 22:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32922359A91;
	Sat, 30 May 2026 22:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT3yIyXS"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD4175A89
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780180646; cv=none; b=JaJmd7zqwFG43lMfJGgu1OrW88GbmEJatiSp1pmYpxWEZn5dpPjFmR5g0/4RCjMkxJLHE7JSzP4GL2nOc2oGuSNeUzDIcU3x+ZA8Ney9kPwpOyRthLJndqzaRizp7kL0m7FNQR2kFaQDZeQiiIx0x2xIpqn06Bl7nN0BYv8iFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780180646; c=relaxed/simple;
	bh=+A4spK3cBmovAmEV/W7Hh0GhNPZSPCvmR/SwP14QGLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dy3zw2AGZht+l2lUfC8nWE3N1aL0+LBlbIlcILKeCcSmJNdkuP12sAKQBANn0l2tkox+i08RmAYvAktFJBDwaTBqyMt1cK1rBY3rItlMDcAsIUpe309R3T5NdjXT6SiDbYxCViv9oaoJTRjPT9haaI+ElXoDmrCR3p0OS/OlA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT3yIyXS; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5933D1F00893;
	Sat, 30 May 2026 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780180644;
	bh=+A4spK3cBmovAmEV/W7Hh0GhNPZSPCvmR/SwP14QGLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZT3yIyXSbZh5GMCJzNFRupJuDD3rAMLhjEnBUiKDMMjfdpWQZcnTZaAptjwN/d5Pt
	 nspLwA7Jgm+TPtFUoz4Yp5DSjyHMH1xS5ZMV+09PrZro6Bi5u8pRWMCEKDtAdld9lf
	 TAbahale2OO5aWHK2FowFxRXDmjIUulmH6OPu7ypXBHPmyKugHY3UL6rbPSH8vAYMn
	 Rx+I5r2FMdBb8Jk84yl134lvQZGuvCVBw+LVQPx/cSSJqyAdCD/edwXsnsb5DBkWTm
	 ex6y/3SaT6XAFYCC5xhB8S3e8sBNPhDv1o14au02W1cWWQhFtM7El6PI/Ma7bB2bLg
	 MVpujR9zZPRiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] hwmon: nct6775-platform: Use zero-initialization
 instead of memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-6-manishbaing2789@gmail.com>
References: <20260530221353.159461-6-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:37:23 +0000
Message-Id: <20260530223724.5933D1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14650-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Queue-Id: 429A7613AC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Reduce the scope of 'struct resource res' by moving it inside the for-loop
> and using empty brace initialization (=3D {}). This ensures the structure=
 is
> safely zero-initialized on every iteration, allowing for the safe removal
> of explicit memset() call.
>=20
> No functional change.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530221353.1594=
61-1-manishbaing2789@gmail.com?part=3D5


