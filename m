Return-Path: <linux-hwmon+bounces-15125-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PktaBgLzMGo/ZQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15125-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:53:54 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3A68CA8F
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:53:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kZ8wUTQy;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15125-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15125-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472A53051C65
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 06:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC8B313E03;
	Tue, 16 Jun 2026 06:53:40 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5AA3101CE;
	Tue, 16 Jun 2026 06:53:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592820; cv=none; b=oRR2LTsSRzndXKiNXwxNZ5oHNPQ44SCtGhoI5/QmsTr1MbcZCIKQJIS+hNfnKWfnO40xxYyLPsN5JRkB+mF3yo6dWHUNP0z6F6HZ4sGgMiof3B/ScUb+70gb+pIxq6RKYfy4Ilu9Gwz9moMx1oo6ZHCIJUgJ362adoi9aLBU2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592820; c=relaxed/simple;
	bh=kv35WW7ZKJUy77kcHNbk/VR6AP7yfamINcJOhv3inuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rhm0AQC3V7w5R6QUs9Quy3VjYVMxiw3J7U4Zo+d6C3TqkeKX02D7NXJPwnIHhTe4epbWmPQAY80sz5ISgyfYRXD0csMbmWbNXJSENWz5DSSu7BGs4mXMmERWlkMHW52XpNyiOmh3rs86S8vw09e2AMsuqGRVGF0R7r57jNJt29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ8wUTQy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FF01F00A3E;
	Tue, 16 Jun 2026 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592818;
	bh=kv35WW7ZKJUy77kcHNbk/VR6AP7yfamINcJOhv3inuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kZ8wUTQy+SXvn09cq2FLVhuSaKl0bzW6zPUcxHFD+qwvYsYiAYSCygEoZrDeg2VRT
	 fInn97rDSs6vpzLdXhNfR9CB8kvnR6XeXuppam4qARxwYCdN/Gk5oogPhHABLeEZJl
	 F46Uoy1YxBCTrjTiIYT1sKKa/WjYH2g+Q3NUftiQoEPP52lZCdEz5R9DQzApzF7vno
	 8Y9jOP6/pDxveANEEF/Egmcxgku2Qkt03Jp4/RMn2nwOzeC74pFhY35ucYVt66NO2k
	 nuwVQMsVkYgahj0HGNGi6yn2IaQIqNZ9KqH6IQJbhb3B7TcS3d9rWEYTtt3574JXmM
	 LO/RzTNbZNMYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
References: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:53:37 +0000
Message-Id: <20260616065338.52FF01F00A3E@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15125-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EB3A68CA8F

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Support ROHM BD12790 hot-swap controller which is largely compatible
> with the Analog Devices adm1272.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D4


