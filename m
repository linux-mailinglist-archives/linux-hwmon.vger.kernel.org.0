Return-Path: <linux-hwmon+bounces-15068-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vf0qD0V4K2q7+AMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15068-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 05:08:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E1067661F
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 05:08:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cwi4QO4N;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15068-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15068-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A0B930AF13E
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Jun 2026 03:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C628530C368;
	Fri, 12 Jun 2026 03:08:50 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F3D1F91D6;
	Fri, 12 Jun 2026 03:08:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233730; cv=none; b=urAfrV53NK57aV/jXwnEgHUdnaVhLcULIQ7zyE3hhgSNizzyEXdUT5AEtOB9cchgq30sB+TryEgaNliFW85+0gEqEqUDRLb+z87CZxj0OFupLv+UvQNgMsFhxWWXW6JJOTkK0Tr1irrGZumFH9SSDei/5lqrT9ZXSp6TBGrdBTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233730; c=relaxed/simple;
	bh=IUCdBT1RHDdnOU5Ymgefh3lSiBYmm8ptUnsSfE9f81U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fLxffjv6Sm2nGH9bssu4+1y6uVi1/NCyVbTWuO2fo4sFXGSD50OZBLqcaB/PtnZl0NP/r7N9mJRndSnDvL8prXadV7g/Wgj8fpdCU62PDLoJXmdTDJK64dQpevJYhf1KuAa3YMN5EQWABBQ5doNzKgxota0R/LvMu8Gom89aS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwi4QO4N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C931F000E9;
	Fri, 12 Jun 2026 03:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781233729;
	bh=IUCdBT1RHDdnOU5Ymgefh3lSiBYmm8ptUnsSfE9f81U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwi4QO4Nr0Sl25eJqno5CRLfqS31XmpzYHLR2wzBf5w0DwwMjMibeKSN+q7WC4y3i
	 ziaSlHtJ82KAVc+jXEKYndAshl58eTS8lGBXYLpnFUFkgTOXeDv2BaKbBqFwSzS3FB
	 rbfIARbCcaUz1IgqR6DWa5C4iVum4dUmY5TGDjeoNtBCrWGrJtPyanGJKNE2+6mEjI
	 x60ZdX/lWVVlWQM6QRgIz/A7I7EaQ8a7sRBguUBZNrZIIyrRE1B9kUkv/hnIgLLQl/
	 TKQfTei3F2tVxatJKL/4zAyfnXFqFBlxxDhuDq9UnVhWEd7e5atEzWnq/uazpp3NFC
	 CSzCnoSawjbuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: Add documentation for SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612030304.5165-4-zmzhu0630@163.com>
References: <20260612030304.5165-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 03:08:48 +0000
Message-Id: <20260612030849.46C931F000E9@smtp.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15068-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[silergycorp.com:email,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E1067661F

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612030304.5165=
-1-zmzhu0630@163.com?part=3D3


