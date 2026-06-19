Return-Path: <linux-hwmon+bounces-15214-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sw7XAXkPNWoFmgYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15214-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 11:44:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D646A505B
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 11:44:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ljEotMxK;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15214-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15214-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 479423030287
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 09:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C56361DC3;
	Fri, 19 Jun 2026 09:44:22 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1134BA5B;
	Fri, 19 Jun 2026 09:44:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862262; cv=none; b=dEOgJ6QsgJk0tfmoaqsqzAWnSGkyfIz57Q2zJp0xlD9RrTDV2GIyG6IcqWycMdt9gxavlVAhLJdNAKLSufbhKflSucMMa9ijLPRgusikvF0shYRjUURgTxSXhjR/TBkljTdAOxGW6MmeCmUABCVYSrCFMdp2Cj3HXR1aJqbooVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862262; c=relaxed/simple;
	bh=Q1OWbMr02l7jrlMhkYC1M/4rdjypG+d3wiMACV8ghqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulRpjEZ7y4EGlsurkhyNqv9Xns0UKLBM3PlCA85cD3W5A5oCjJm3jnsZgAzpTyn9CKs/QqJwbnvXwg3RTz58D5XmgnZF/1Cshuh1oEmN3FCfONFLMaSVouGJEbX/qALkRuf+OSDFWTo26yCPMAkjHhriFGWl6duGl+f5BhAYspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljEotMxK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AE21F000E9;
	Fri, 19 Jun 2026 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781862261;
	bh=Q1OWbMr02l7jrlMhkYC1M/4rdjypG+d3wiMACV8ghqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ljEotMxKThQADj4ELxbuy1UTk6s9cAAsN/O0aBx43iKqSc38InCCCBID9OtX3+WFg
	 FOd0ZTkuPlqj8ZyfsOYLDWP3GEkMgfLYWdSt+bGqFtIZL3Hkp0p418/H5dHwlug2Sw
	 hULTQ4XstUz3uU6B8g3QHYPKg0e78HlQrsPb+i8asIrstoK6Q9spf5MdvFS65+4bwn
	 Rq4QBPDUcsmlST4GwM36SupIVjSsRF1Mm7FVb87ZPOgFKzRLyOxkysxh18kp9xP9G/
	 A9rLL33C2BPoLtBi44ruDZumpcRDfYvy0SWUd53yBimOELOwPMGkzH5KXoC8a7zvij
	 bEyV0oy+tDukw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: firmware: svc: add hwmon property
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:44:20 +0000
Message-Id: <20260619094420.F0AE21F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15214-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,altera.com:email,sashiko.dev:url,lists.linux.dev:replyto];
	FORGED_RECIPIENTS(0.00)[m:tze.yee.ng@altera.com,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71D646A505B

> From: Tze Yee Ng <tze.yee.ng@altera.com>
>=20
> Altera Stratix 10 SoCFPGA supports hardware monitor access through the
> service layer mailbox. Add an optional hwmon child node to the service
> layer binding so device trees can describe the hardware monitor.
>=20
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.co=
m>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D2


