Return-Path: <linux-hwmon+bounces-15304-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x+c4C7izO2o8bggAu9opvQ
	(envelope-from <linux-hwmon+bounces-15304-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:38:48 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880246BD6C6
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:38:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TkguZPjd;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15304-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15304-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7ABA83009F2D
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2F92857F0;
	Wed, 24 Jun 2026 10:38:44 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD9248F72;
	Wed, 24 Jun 2026 10:38:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297524; cv=none; b=M+KG929qe6TXVCPiIvszDp9si1u2VFvEQ/1oEYXKjcbHV3phBfEZVEIGsebt/HVdvKMQp6PL/A/cuTiAzK2oYqM0Cv5s4v7HMsywYLzmFcpqKCw1WTQyxjrOgzm5lBmSwNF/W5n7FsBb8OZRX/hE1vqkQVpug7WyBaEXIyS5JOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297524; c=relaxed/simple;
	bh=z3Jh5DdsxOixayV/P5ernUEaHyuGcHZeJjmYLYS9J9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cBmlA57xtYCLqppi26TdGuvTBdhTlMnd5Q5QN1A+oTMKHl8hrX146qxOVI7QppGYkf7tqgf/UoE/CRZc3FiJROgQgFG2mPO9dstP73Yb4kWvN9Dv+rKquLtJCYcx+4YYPVIaia47SD8VMyDsFXP27kC9zYMhzo14c4HPOf7KGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkguZPjd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7881F000E9;
	Wed, 24 Jun 2026 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297523;
	bh=z3Jh5DdsxOixayV/P5ernUEaHyuGcHZeJjmYLYS9J9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkguZPjdzfr55Zk6zR1Ryla2eImv4Y8FLHYHieOFoqAqN4ZcAYaJTeyNcDrKwnUIt
	 FRfCYlwlnGkVUg+AhzHbSxE4YC6L/4rbzT7cBqidogDlOKVwV3WcEblM6XvQWU8usf
	 lLebRdDbGNEFoikE+wyVdKOnGChn54kv/lbNk6477tPZpfs9WksxYRQo1knna7V+/J
	 VTXcu1kQLmIFyxCKx376W1vJM1pRUWzd1+hWjAcVLdQTy3QUrbrPFU813AyEUO9GiQ
	 6dCriHraK72DvNkJtRut6U0bAT+IsvCqyXLzaEibvhTJbHt28ikfWq5pk2PBHsarur
	 GJn90xPXSUoSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/12] i3c: master: Support ACPI enumeration of child
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-4-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-4-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:38:42 +0000
Message-Id: <20260624103842.AB7881F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15304-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:Frank.Li@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp.com:email,nvidia.com:email,mipi.org:url,sashiko.dev:url,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 880246BD6C6

> Although the existing subsystem allows host controllers to register
> through the ACPI table, it was not possible to describe I3C or I2C
> devices when using ACPI. This is because the driver relied on the reg
> property to retrieve the PID, static address, etc., whereas ACPI uses
> _ADR or serial resources to describe such devices.
>=20
> Read _ADR and LVR from ACPI resources and extract the data as per the
> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
> per the MIPI DISCO specifications [1] to get the static address to be
> used.
>=20
> Enable describing I3C or I2C devices in the ACPI table. This is required
> if the device uses a static address or if it needs device-specific
> properties.
>=20
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D3


