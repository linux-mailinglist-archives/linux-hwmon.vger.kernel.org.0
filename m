Return-Path: <linux-hwmon+bounces-15485-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8NuND42PQ2rNbwoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15485-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 11:42:37 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA36E257A
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 11:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a9iBlf2z;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15485-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15485-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99778312977B
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 09:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C7337F01B;
	Tue, 30 Jun 2026 09:36:06 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3804C367B9D;
	Tue, 30 Jun 2026 09:36:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812166; cv=none; b=NpPu+Hov6dW6sRti99W86BNNwIFiOQRfRIC10/5a0/XRZqWO8eGOmwojPzFwGL1GKxlcQtvAirmz91aczgYpN1n2HSKcLrywv5AD48Xv7T5mo0xqX+Vqn3zc6zocQV+Gs5WU/7DUE3Wb2FgkO1WL5UASLR7ejPTxdSGB+Lo6Nco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812166; c=relaxed/simple;
	bh=RT7/6cIzCxpUH+LuBvNaCrYYzvBL9cNoNOjxER+dH90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gasgLUcMml79irBj7GZzxebVGpu6IMaFjWwT/Y1pSTRNPawjklBSsa0Fok+dtjXVbmh0EgmwrieA6ZusHvnA/anHf1Ac449psPDOVIkpqmtRnpqscHlwCjOY2lf3npm1NCaqc2MgrsYY7g2X49IbMyw4jihAdjbzEqwMtb3eqnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9iBlf2z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A72C1F000E9;
	Tue, 30 Jun 2026 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812164;
	bh=RT7/6cIzCxpUH+LuBvNaCrYYzvBL9cNoNOjxER+dH90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9iBlf2z9I+qfWLUuyZSUUGZcrAgLDo00f46vkmIslH4q3+4rFKyoZQiQM16seigc
	 feFVS/KpBnFQyVKulVa8GRd8C1SxqVts9UhwudMxE5/nIf7aDK5Np5//YARqTIs3Vq
	 U7LZF1MCdK9KCweX+RBtonZ4pAdyC2HSLIDuO/QXA01SOih08OKL5kxjrn7Rmbw0zK
	 xgxrn5qIZAN7sP9rdLXr2mAEOIQw+RhZFyFVLRZofQNyP0RNasNKWstKnRo5cheeq/
	 PxmzEY6U2deGo9IzOU4s7LDckg+9eDbHWW5CNU1neHLuff58P0tbsFjCM6jujx6tbB
	 e3MHk6bMBWmhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260630091220.1608-1-dongxuyang@eswincomputing.com>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091220.1608-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:36:03 +0000
Message-Id: <20260630093604.7A72C1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15485-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,eswincomputing.com:email];
	FORGED_RECIPIENTS(0.00)[m:dongxuyang@eswincomputing.com,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 83FA36E257A

> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
>=20
> The PVT IP contains one temperature sensor and one voltage sensor.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630091040.1407=
-1-dongxuyang@eswincomputing.com?part=3D2


