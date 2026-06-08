Return-Path: <linux-hwmon+bounces-14832-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CwPPOYUfJmouSgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14832-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 03:48:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554765222E
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 03:48:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=W+6uGSPD;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14832-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14832-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 906FD3001078
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 01:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DAC2C11C6;
	Mon,  8 Jun 2026 01:48:48 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86ED42050
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 01:48:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780883328; cv=none; b=B4JxSqhe2yw0w2DlIW+nq8GtNru6ztoFjuICIgzWKhBQrnhp8GRHPIwUyirQeWGXQ0U+w9eQG9hfSoJiT6mZQMVZviMGyHpyC1SCmzcCBC3aTMjsnR8AnPbH0LjGWXIphtep5W2PcEgijYuSuZ4IE6t97aveUBgLIFxYZhtIRK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780883328; c=relaxed/simple;
	bh=FSaJmgC9YosgRtLqnaSpWn4+aVxVctQq1peFj7Svi+k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uykpW/mQFN8eF8jw+kOBo+qzMDCHKT9KSR+U4v2ev0yPS2jnXIr0AGcu7MJeenpw0Ylgu9kRqEBR7ZXqn6tNOHeo7wXLDXeKhqoA3gBqf/PbNycZPudbwU71I9WTF/ikNH1BvT6VRd2HLy/lnAmnSHAarAbPqnrX1oEGPNu5NFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+6uGSPD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378041F00893;
	Mon,  8 Jun 2026 01:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780883327;
	bh=FSaJmgC9YosgRtLqnaSpWn4+aVxVctQq1peFj7Svi+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+6uGSPDghFyMdRf8JIGIKwb7vj2jP0MnSouRSp1DNQhM0gkL88GoNn3G7x+3Yxqg
	 lCtW/JCGxky9+X4fmuiiNuGvRv3kaHTYqm64P6ZmxWHnDSatatFE469QPdHDTsoGkD
	 VUiRiSQz3IllcyEfVWvvSI0f8WpNfLrEhaaWISY6z41H3GmSNw6xNk9KvUsUL0Nxtn
	 EslChxiC+5AGaeVcGStJeADqLjaeR0vPfH6Ml+7lj2omU81Ys9ANSK2D/6f/Kn80DP
	 +laxyPzX0uNfuDa2LvNJpeVrNyK9+kgo4ze3ffcBnQvQWojlGTW9QbE2gic2xbLSmj
	 mWocrHP/WQakg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_91CA78C59FD4CDC1BB5A4524727B5145430A@qq.com>
References: <tencent_91CA78C59FD4CDC1BB5A4524727B5145430A@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 01:48:46 +0000
Message-Id: <20260608014847.378041F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14832-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[foxmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xiaopeitux@foxmail.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,kylinos.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4554765222E

> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> When platform_create_bundle() fails, the error is fatal and prevents the
> driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
> a critical failure.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780880972.gi=
t.xiaopei01@kylinos.cn?part=3D3


