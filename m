Return-Path: <linux-hwmon+bounces-15890-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 68lQIiI7VmqY1wAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15890-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 15:35:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF232755365
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 15:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PvVcauhc;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15890-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15890-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB3923016C6A
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 13:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6607045BD7C;
	Tue, 14 Jul 2026 13:32:30 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891C3FADFD
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 13:32:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035950; cv=none; b=XhIKS1uk9fhMS9is2p8QPBeNE8m2H1v+Hg1sqt/NwP0n/7Gf/5ikF1kk4VodarlWRUZN4DRDB95yXpANcQqd4Jlx5M0nF3jpF7M2cFO0m4PE21+hYIzodxEFfzSpc4DILk/aLcJH6BzL1zbmmo4jEplZd445uZyJqRwLm1bAKV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035950; c=relaxed/simple;
	bh=oye/mWCajTKc0yacA+6swkGxga7tqtscCum11Lbe1Cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fFnT5EO91Pr8E7ntonLWhc3+xlPRC0wAG/fxjOKpDbfpmLsM1iuqc3q8onA97ZyyJqnDapwVv9g2ZRLUHUoUtVWWQJd+JiBPAzThzK2ES4CE9SWLOoiJXeVt/mEZ7Oa16lse3W/nMlIEcgITTn302x4BC+/OUFmQ/QgByx5U1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvVcauhc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C1E1F000E9;
	Tue, 14 Jul 2026 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035949;
	bh=oye/mWCajTKc0yacA+6swkGxga7tqtscCum11Lbe1Cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PvVcauhc5HGwCeB5DhCtFqBCLKpn9qczT6bVPnMso5iX7CQ0bprm90SYENaEKt9v0
	 ZE+YaMQLGDS/iLzlt9SYE7Fvsj19m/3YiXxvlLeP/+r9YB77Yl4rLeCC9JlePHVwZt
	 RIRakxmU6yfnEDbh6vOOoR2+TgfwiQZ5r1bkK9MkrJCiSR4Dc/H7SemH5+V2Zf0pB5
	 avSPsG+Qb6moowSO1AuqYaf5QKrWW7gtTAlPeviGnCtltotvy4sCkQqSglvx7Gls89
	 qBn8yVOVKJgx165R6TDS3KwwrJyKQqqCJr1lQSX+oaUXcPhxgxT+5ubHLbfyJz3GZ4
	 olOTRJFRP8nOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260714130228.449233-3-panchuang@vivo.com>
References: <20260714130228.449233-1-panchuang@vivo.com>
 <20260714130228.449233-3-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:32:28 +0000
Message-Id: <20260714133228.D3C1E1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15890-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:panchuang@vivo.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vivo.com:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF232755365

> The devm_request_threaded_irq() automatically logs detailed error
> messages on failure. Remove the now-redundant driver-specific
> dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714130228.4492=
33-1-panchuang@vivo.com?part=3D2


