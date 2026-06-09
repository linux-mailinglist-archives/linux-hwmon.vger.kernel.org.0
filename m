Return-Path: <linux-hwmon+bounces-14885-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WAQ6LxHCJ2qn1gIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14885-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 09:34:41 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB065D425
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 09:34:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iJwmYZoX;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14885-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14885-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A6BD3058741
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 07:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBA53D3D00;
	Tue,  9 Jun 2026 07:29:18 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0437BE6C;
	Tue,  9 Jun 2026 07:29:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990158; cv=none; b=b10eqa7ZH8DYR6HyLyDbqP8Cynnl/A+iDHel0y7jUy77fe20tsA8nzS3foiyY4ZVXE13Yw144zWb9eyuGc+2kA+CRPvSBE65oyMoIioFVNsyY/mEC/xdvKld/wThxcUQOtXjGZwD6i91lA6dKxQ6MNi/kkIdTPbrGwswiNSnM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990158; c=relaxed/simple;
	bh=xJNeymZSqfhYwhe8PQ6QvLRPb7IktUZX0Tsmq3QDNoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UV8TlX5AF3sQiOljR8zBS7cDMUdBmuBVwko6vWqm0tQh/53fxlfClp5SBzVe0XvJ+a49XFTfDI9/dEZ771aK8NNVW1cc9lloFOz4iGr6kRhQVwJs21paNO6XDM4BBeOR+2XB0slqBJhQZ6hkXhGDL1JBbAt7MWNIdtGATOPhpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJwmYZoX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9611D1F00893;
	Tue,  9 Jun 2026 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990157;
	bh=xJNeymZSqfhYwhe8PQ6QvLRPb7IktUZX0Tsmq3QDNoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iJwmYZoXIoCejzoJEc1gMi0ysRlRRKm+fV0ge2QY4QoRt/Gp3rTWlqtJbblKBb961
	 CZu0vulrYImuBWowH7ul+2456Qx1khAt5T6F1KJtTw+bQBsJTHAN4T0Af5iBNOnE3n
	 oso1CYxvJvuuvc9QApBpj2jV80m1FJ7UTFr8iBEmLc91sYR8Nv6s7gFTxJq+6Be0re
	 5SsQtB5yduR7H9tpUIQ9E8MhCwqi/ze+iipk3QqFSNT2tpoPudYFvWvhPQ/QgL6YpA
	 caKagK2dxFnQSd6f+jFS74jXWSEA3tUu7uyWvdMMh15oeKM0XSoT3JCk8q8TIXQjDe
	 1nvxzt2AKlXKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] hwmon:(pmbus/xdp720) Fix driver issues
 xdp720/730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609072231.15486-4-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-4-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:29:16 +0000
Message-Id: <20260609072916.9611D1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14885-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ashishyadav78@gmail.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44FB065D425

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Fix driver issues:
> - Adds the missing regulator and property files in include
> - Declares XDP720_DEFAULT_RIMON as unsigned constant
> - Declares struct pmbus_driver_info xdp720_info as constant
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609072231.1548=
6-1-Ashish.Yadav@infineon.com?part=3D3


