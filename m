Return-Path: <linux-hwmon+bounces-14720-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S3aPNVwwImqaTgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14720-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 04:11:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 568046449D3
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 04:11:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KERvGLZA;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14720-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14720-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71CF13019142
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 02:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49CD37C11C;
	Fri,  5 Jun 2026 02:11:37 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54413D75BA;
	Fri,  5 Jun 2026 02:11:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625497; cv=none; b=TRUwu5IrbslRXZXVV9AquqV+VwRebM8jCSmJjl5EZoxC11c0ZOe5ZRgo/rhr69s81DVTbsKhwj7C2RPL/6dGYZ/ITNxq5zbNVjfoC2lenWaJAPu8IIMgU0KyWljUuSbn39BqjVsDcpT4YcZiUC96187fF1RtC9NMCYSGeBcRqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625497; c=relaxed/simple;
	bh=jKovO3CROCcOXwR0pzwTym3N/IXDerF6NM/xl7HcPC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hEo4QXzqJ8meZ+BGm9Nbmb+Bl63VIwi3wGLpE+NFMnD+YgGBPclFoIcvGRMwtmEZ6eZp2JraYO6uc4NT/ioe4AXCIQxHCUEejo4mnAQu5GRKDfGsYWRFWeefTnYQK4pKg6fjl7lr2QM9uwlkbqjT5fPugk7FUr4/BuxYhWurpRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KERvGLZA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE4C1F00893;
	Fri,  5 Jun 2026 02:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625490;
	bh=jKovO3CROCcOXwR0pzwTym3N/IXDerF6NM/xl7HcPC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KERvGLZASuWypBffDPpiuwZDXdph+s80qnxojBt8urDKHa6PGzHipp5rM3bJCgf+n
	 ET9JdVZx2i/gXRKNIz8tchY9vnxz1b2aB2u8wEBPHm8FvaP/uQzUgx2C4FeVprjFPk
	 fLj6x8UEkvXO513UrigtzabhTxjlYm1BlfIPmoQtj3pROiPZ+T1sSS0t6IIQ5I39kI
	 a5S7YQMYWxoTMB1Jv0nTolnDT6MNcUrapgwJ7XXnAIFHBzv7veerDvxTBE8fPz//gS
	 FEllAlPcDjXtIEuTL82fYphcsSZ29ifBln6/PRsUaF0EEb6e7500+iVJJLWG5HLbSN
	 0vH/e1Q2Nkeug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy
 SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605020450.89638-2-zmzhu0630@163.com>
References: <20260605020450.89638-2-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:11:29 +0000
Message-Id: <20260605021129.DAE4C1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14720-lists,linux-hwmon=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[silergycorp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 568046449D3

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
>=20
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605020450.8963=
8-1-zmzhu0630@163.com?part=3D1


