Return-Path: <linux-hwmon+bounces-14919-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CK4QI6lvKGp2EgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14919-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 21:55:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B36663F06
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 21:55:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BWUdP7Wv;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14919-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14919-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B31173001AC8
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 19:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1BA3E450E;
	Tue,  9 Jun 2026 19:50:37 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DA2381AEF
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 19:50:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034637; cv=none; b=Yr5zuHH2CcD04Xitd/LSua+gKVLXLeZh+ucxemVfk6LEKUsFGHpEYIX6BmhJt9id6dlX/U+Alev3qociYI3RGyGw4Tci1+DfFsVkZKEr5u21sQSnV7t7FeSyA1honxO7SvbrJlRApzpG6TErS4K9VGXytmWp/YRUZPeiTDNnAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034637; c=relaxed/simple;
	bh=jPYoPC38/T38VCqf4QadWb/x8SxzacFj7GC2w5vfqMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D37v6/6JiiudwTf9yBJeHvartgt24JBYfo3MxfPrVuB2Khq8BSMrRPuYiWT7ES2Vu1ArWQsnJtpwVZB1Pl48IQkTjWhvSr/32fHOwVcLBDnGDNGIWmODK74Jv4Py9DLAQePUVcot/HwpCgPsgE0IicFS5uoHx+Ivk/rDBtr0uSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWUdP7Wv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C241F00898;
	Tue,  9 Jun 2026 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034632;
	bh=HGmH/toiexWqEmY6GetsmCOC6/5P67SpuflKB8wedlk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BWUdP7WvFLQRI3/bgToNMDm+oHhw0ReVkcJ3oB/VEpcb29RP65zrj9INlmfOZcvZ+
	 p1xF1wZD7a3IXTq9vkXe3gIGlqDapp2fxVPEFGKOOAIG/6f0Uyu18nW2dFBf/d884k
	 aBNEi7ZNKoHgGD4P6/NM4y1s5N1aWxrSxmb5ZqDV/qYEUX3KzI6EI49Gi15CI6obpM
	 vsSjbVWeCfUr2JtiiBCjIjIKSvaMSNbeNzde4/qnXjPjqKGN0HzmA7r0TY5DB42Ekq
	 7pHesjx9Fn2GaVcP6PtU3hQqn2Aa6HLf9NIrRwVZa1YUFvoJVIOGRfytE14fp4cdcW
	 +mPQ1uWgm+AAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: ina238: add support for samples and
 update_interval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-1-016b55567950@advastore.com>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-1-016b55567950@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:50:31 +0000
Message-Id: <20260609195032.13C241F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14919-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnull+ferdinand.schwenk.advastore.com@kernel.org,m:linux-hwmon@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,ferdinand.schwenk.advastore.com];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,advastore.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1B36663F06

> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
>=20
> Expose INA238 ADC averaging count (AVG) and conversion timing
> (VBUSCT/VSHCT/VTCT) through chip-level hwmon attributes:
>=20
>   chip/samples
>   chip/update_interval
>=20
> Use per-chip conversion-time lookup tables so the same helpers work
> for INA228/INA237/INA238/INA700/INA780 and SQ52206. Cache ADC_CONFIG
> in driver data and update it on writes to avoid extra register reads
> during read-modify-write updates.
>=20
> Report update_interval in milliseconds as required by the hwmon ABI.
> Compute it from raw ADC cycle time multiplied by the active averaging
> count, and apply the inverse mapping on writes so programmed conversion
> time tracks the selected sample count.
>=20
> Clamp user-provided update_interval before unit scaling to prevent
> overflow in arithmetic conversions.
>=20
> Also combine chip attributes in HWMON_CHANNEL_INFO using a bitwise OR
> for a single logical chip channel.
>=20
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-hwmon-ina2=
38-update-interval-us-v2-v3-0-016b55567950@advastore.com?part=3D1


