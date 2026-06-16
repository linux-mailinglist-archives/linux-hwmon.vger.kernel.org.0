Return-Path: <linux-hwmon+bounces-15144-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 127wBOofMWoKcAUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15144-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:05:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992E68DDBC
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fK3meKxR;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15144-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15144-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FD1A301AB8E
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 10:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1571425CF4;
	Tue, 16 Jun 2026 10:04:06 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92E364E88;
	Tue, 16 Jun 2026 10:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604246; cv=none; b=UGbgl3vcFIGAdbPRZHcRxcUDSUmq+gGnDepSAmntEuoWCaj3YySxMSZb1ep3lAnKo/Fl6fK2VyfUE0o6NCupUpKa6r+rQ5r05NP30xlG5ZEMYXUlnxQ3k7vI4++nQnb41moVlkxvyQw0YiX5TKpSiivTo3XHsW57Sjz7W9wJ10A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604246; c=relaxed/simple;
	bh=HEwFa4w2a6Mj+KrVCMuA+0moVF/uSWn8wowviak+yEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FcW5FbJ05m+nSgXSIcFtCFM1KuPLuCYwN/fZzUOomJ4T1zVP53N9lrSNmd9eVvUZBd5fV/5d5TEaksNfmtOZGRA76lpd8FprbVCHHB/IbC4bDh31J51xJRaYytD5Opo8C/ywR+hvKt1kbQdBnxci156htBi+1Z5AH3EKVjPyoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK3meKxR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FA61F000E9;
	Tue, 16 Jun 2026 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604245;
	bh=HEwFa4w2a6Mj+KrVCMuA+0moVF/uSWn8wowviak+yEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fK3meKxRlXccqFHiTx9Z3XHvQzdmjZikrv9MPYV18xiAWoyyeO7tkhTCtuF5sGmm0
	 jrb0H2KK5COGkAzTCMf7CdFyj/ZBqQMuL3l2DuZ1RPSwWygRmBOlV6OSTxkhll2nFr
	 nBws/ox8QVELXsYstqXeUKjr2p39oN3uFsy4wePanpnxMgDEdfGC71/IOxE+d+6NZs
	 KQWE7s68LzcOHeHP1CnPFVCvyqaLbusxyXJ0Mid1v7dMoNv4gdwl5GTC6Z2tLmiTlL
	 PMo4IreofWajiOSn9kuTh79B6D2V9+1oXgfeREA4OVv9+TUKvRmYm7cfHre2/VQYnI
	 zTjB4uLtoH/dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <20260616095429.3947205-2-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:04:04 +0000
Message-Id: <20260616100405.08FA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15144-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:Frank.Li@kernel.org,m:linux-i3c@lists.infradead.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,nvidia.com:email,lists.linux.dev:replyto,mipi.org:url,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5992E68DDBC

> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
>=20
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
>=20
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
>=20
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D1


