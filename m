Return-Path: <linux-hwmon+bounces-15159-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sTdVCFw/MWoVfQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15159-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 14:19:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F268F3C9
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 14:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Icr/G7Yc";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15159-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15159-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAFFB305FB99
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AC93168EE;
	Tue, 16 Jun 2026 12:17:57 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601F1E8320
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 12:17:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612277; cv=none; b=BzGbc19wWLoWTYZxGdD2+ri4qgK/UuY4/eYiZnry0EsGXctHGyrDFQlNeFJtFetT1JSVhWFdDDLkteYjpKq5qA2JH09/tl6F/tnhAUGV4P902j5pUizanhGJ7GNw/BBAjgse86mBHP/LG/QiAv684QUsqQL0IdKGQzBCm5AjK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612277; c=relaxed/simple;
	bh=1Ua5UYJAHVXuEEa+ZfTQQy0QLgpzC083adNvPICCHs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMpLlhLeNIMblRZDAUPPvK3SKJMQasiKM8FrmbBX/s8iJnexx7mZGHECBXTPIsk9YHznaQOOsx3fGnjZYv0pJ8sns3TGoC/hQCQ9FqbHTBgrD3G6JNLZ7/V+NPJpD3bta5shYTQuwCa0SE3NHU7666Q49tDIqGa651XbIVSOVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Icr/G7Yc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E041F000E9;
	Tue, 16 Jun 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781612276;
	bh=1Ua5UYJAHVXuEEa+ZfTQQy0QLgpzC083adNvPICCHs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Icr/G7YcsAIbRa7LtODHz7iF3gjpn7g9Cnacws4it8D7/ZeleBy1LvG+IiG0G8i53
	 cpfA6IEfccnlyonEONnU79NKshbIOgNiqPyo7yEBE6S9upp+qML2l0xz7oeoBLLYQA
	 z9dRMcN6IIBL59uqQ5xIxT2myX4OW/F99YPAMIPT5U8lPyJExPOWd2RXgjRPyV9pqB
	 IVM45YI441YCt4iGZIxaPEw8gv7FF7jOITcihdfDn7VZxZrm0wdJulWUJt1xTye0t2
	 tlp10hTxILn7l1QUcnfICeIb9vgkRYNm2iVBEWID7WxbjoOFykT0Y7Rau41GMxImjz
	 xYa5Z3ZoMGemA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: coretemp: Fix documentation wording
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ximing Zhang" <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260616121549.29484-1-xzhangjr@gmail.com>
References: <20260616121549.29484-1-xzhangjr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:17:55 +0000
Message-Id: <20260616121755.B9E041F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15159-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xzhangjr@gmail.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A55F268F3C9

> Fix two minor wording issues in the coretemp documentation.
>=20
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616121549.2948=
4-1-xzhangjr@gmail.com?part=3D1


