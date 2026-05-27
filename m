Return-Path: <linux-hwmon+bounces-14530-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IWPKtXRFmq+swcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14530-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 13:13:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60F5E3363
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 13:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D479A3024E0C
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 11:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDC93EA942;
	Wed, 27 May 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScWqFUm5"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40123EDAB0
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880222; cv=none; b=Brc5yiKhgrQ8/rWNvdIIVn9Im2yuavJR2DyFBjCgjKeUqa2vZbYEsAs07htFYVQvlNhmmXvkQS/Ga1JUFwAjoUT25AmiumYrhLoTCw6dRwIKZp5AVehbKsX7sq56JmisrIDt5lFwGiq6KT8j6ig5jLaH78HwNOvn3UYWHcWVLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880222; c=relaxed/simple;
	bh=vtzkqobRbDkXWztM3b9lHGFhpH109Tvp4F8TUFMaEWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LjPb2ybXz0TiYNYHLvZE4gN955YtWovhIKlYFHskXzlVphyxkhlZd0FoKEyncAjvM/sTo16Chg70Uukg3Yo3KZsmcvMImbUGwXXCkOLBDhllvTMIeADweqTJ9pdSKqU1HM+fD8F99SpOOWK1/u1TPGTL65b0GalZ5pgGYPCIWws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScWqFUm5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CF51F000E9;
	Wed, 27 May 2026 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779880221;
	bh=vtzkqobRbDkXWztM3b9lHGFhpH109Tvp4F8TUFMaEWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScWqFUm55zg6W3x1SDIbph+NK5XLDF4t2WmOlcxtjxCNmeFSYSZNU3wYPcH10zS5k
	 heu1xBRR1GyJ5AmYQkVo+00OZL/ej3f5n7Pg6HpPrwi5Pwv7t6Q8LvmBjlxq+FLlpb
	 8iMy1OaI/kNJspzyYFNsmVAHWqi/nBAvos3nwZSwJgzuoMTtIhkl/Vv6HsnStwtBuO
	 MmFn54znAPVryE6VwPC6qwnPqHyEN9gF26wy7D5EAZQsaJaGziJZEKT4CE0th+pFfp
	 hJ+OPTs1XAdwPec5LfSfP9RH2mG0+b+UHtFEh9hfAXgT8yjLwO+PDqZywGOn4KePGN
	 2uMc32gVbmxXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_BE546590D05E58278E73E2AE41117CDC8B08@qq.com>
References: <tencent_BE546590D05E58278E73E2AE41117CDC8B08@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 11:10:20 +0000
Message-Id: <20260527111021.42CF51F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-14530-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[foxmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,sashiko.dev:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 3D60F5E3363
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> When platform_create_bundle() fails, the error is fatal and prevents the
> driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
> a critical failure.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779876412.gi=
t.xiaopei01@kylinos.cn?part=3D3


