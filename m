Return-Path: <linux-hwmon+bounces-14776-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wfdGMkMgI2q6jAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14776-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:15:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D664AE0C
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 21:15:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Of9FjHDc;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14776-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14776-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7588B301AFF3
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 19:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14B7388E71;
	Fri,  5 Jun 2026 19:14:44 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C398423A7B
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686884; cv=none; b=C4uNcqnCxmxCIGpcA3xQlhIHICGaB9GfG2Uh4DMhZawaGIFplCuxS2JMCBP5KPW/agVM1oER85aCDjWHUTIppT7lKnA3Kv9ZZ+7Jo+D5xO1IOxKJ67EHMAV/tT7A+IbtNN1PEkA0EdYLCKDhLS9+I0A4aDWbmGEmAoQBCVxsUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686884; c=relaxed/simple;
	bh=QTbIWKFDDhudmoGvexw+8mfESaah2m/KUpzgl+GfGYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdGhDygUuL7oGVxjnDQKEMv2UeXFGp9zFNJVDtWZcHBPijgHmu1zTzv/W/r9pJOwG0B9VyvGfAP/TZz3BpBEXMfPz4e/mUivDNK8EHWkV1xW7fDhRdwmatzLsmCP9GgNbLxP/INNtE5cfGkusUoYlHAO7h0jt6dFskq51U3s/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of9FjHDc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EA51F0089B;
	Fri,  5 Jun 2026 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686878;
	bh=QTbIWKFDDhudmoGvexw+8mfESaah2m/KUpzgl+GfGYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Of9FjHDcsrN9/sH1qgi5rR3cqB+qY54TGSFc4bip0Q/D3gTw0+6f/XKdOQ3XTY7fd
	 vzHS/IkAkMV7mkWekLCccOnmQ0a7wIc2KFdRPobBq/lV2V6pOcGlIskdbx6uovbuH3
	 THZXzw8I0ou1H+DGFi1GMjjsgxf+StZ5z0M/XR+0ZuIokCv9D2Ew8g7RdghmhOIcbN
	 +jyebkFW/td/Kdy/vgymEkWl6/qB3GnVbtYLaQ45IfNVN6oqGWyJ/J0fJTVsLtCWNy
	 VGlklQMGCe/Y4mWcU9kSHs0nkn3NxszuCTfUUqY4c5mQmouvicfQiSEijDtu1vvgQM
	 pGIP0WGG5japw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/9] platform/wmi: Make sysfs attributes const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-9-W_Armin@gmx.de>
References: <20260605181433.188847-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:14:37 +0000
Message-Id: <20260605191437.D2EA51F0089B@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14776-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,smtp.kernel.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,gmx.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E6D664AE0C

> The sysfs core supports const attributes. Use this to mark all
> sysfs attributes as const so that they can be placed into read-only
> memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D8


