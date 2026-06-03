Return-Path: <linux-hwmon+bounces-14680-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ruZcKPIOIGrovAAAu9opvQ
	(envelope-from <linux-hwmon+bounces-14680-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:24:34 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9238063700E
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:24:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AWcpYVIU;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14680-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14680-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 730C5303E20A
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jun 2026 11:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA04C439006;
	Wed,  3 Jun 2026 11:10:16 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74C3B8BD8;
	Wed,  3 Jun 2026 11:10:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485016; cv=none; b=qjCFS3HknW+3gJtGU2CqmhGDoZOsU68WgcHzpnEL/LC8LsORpPJaMqrVXi37uQ3tep7lE9LtUpZebLhB7uOaPjZD9Y6LLiN6XBMTeJIeyA+f9IYiJLDc37fnMhSsspqNUv4iOi1F+wKENzjfBL9hsAbN5i59KFI3Pf6509KFKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485016; c=relaxed/simple;
	bh=aRQXxzypH2ZdLFWAsvc2fqpGpeNDT3yfyxzxeJKm4ss=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJMVNUQalV9dp3n7Hk1bFYb9ANaYYWce7WwS9wCY5glgrNziZ0BOgwZ+M1G3BzRRmMd8mseX3E8P/uHkKJpGKiod0o/Qfj9IONCQPJ7zKgqNzNePwQlqAzAmzqu63T+hh+t3nBNiZrn0eKj4mIJ5SxUkylfMs+PCOUbBdebDAUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWcpYVIU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227F51F00893;
	Wed,  3 Jun 2026 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780485015;
	bh=aRQXxzypH2ZdLFWAsvc2fqpGpeNDT3yfyxzxeJKm4ss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWcpYVIUT+PaoPhe3kKhdUtC/UH1fnUSKSHOtvDIiLM8ManQMzvWRFEaHQK9k4DYb
	 hcogEyFu3VDUY1mAsVaQW5Q4m8Zw0TgceJ2Qw5F8QKlbnCi+ZEuQKuSJCmmukik1er
	 8TKQMDmET01p99g3VE+3jvJymzUt4yh05ERtBs2FZVSFXra6ncCn3SlDRWvLGuEPF7
	 k/wnr1vQysyO1dJPtsMH2MiNmcow6n7GopjPz0ye2d3ey94FqIVQdVn9E9nMnWkq8p
	 pDWSpH7heDkBlxyuhqap6YfmZ3hu8i8MyLuy/mNPj7it9/embS8bfJUbGT4pGZ05lY
	 5jdAr+n0WYNLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: pmbus: isl68137: Add support for RAA228234
Reply-To: sashiko-reviews@lists.linux.dev
To: "Naresh Solanki" <naresh.solanki@9elements.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260603110127.23930-2-naresh.solanki@9elements.com>
References: <20260603110127.23930-2-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:10:14 +0000
Message-Id: <20260603111015.227F51F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,9elements.com:email,lists.linux.dev:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,smtp.kernel.org:mid];
	TAGGED_FROM(0.00)[bounces-14680-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:naresh.solanki@9elements.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:conor+dt@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9238063700E

> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>=20
> The RAA228234 is an 8-phase PWM controller from Renesas. It uses the
> same DMPVR2 PMBus interface as the RAA228228 (a dual-output 20-phase
> controller), so it can share the raa_dmpvr2_2rail_nontc configuration.
>=20
> Add the device to the I2C and OF device ID tables.
>=20
> Tested on RAA228234 hardware; confirmed all sensor readings are correct.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603110127.2393=
0-1-naresh.solanki@9elements.com?part=3D2


