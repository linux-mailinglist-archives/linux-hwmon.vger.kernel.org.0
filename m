Return-Path: <linux-hwmon+bounces-14611-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAThHZKvGWqiyQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14611-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 17:24:02 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2349604984
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 17:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D88B3313158F
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 15:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5314F407579;
	Fri, 29 May 2026 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxelqqja"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9D403146
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066703; cv=none; b=dLcTbTtMW0lt7nCw/0c4bnrnzR6DtVSqul4qPSuoNS2eWUO3HqXe2xx8cdh+mSaK7Nc8tZmahApGwoq2WKOpHs0tf0B+8dpcyqFHltYOH+H3DZOe0tDLxXvXjl1OfLbOlu1aBeVFrOpQEuo3WGtcwupZ09LGcB9+CdCpzLIuqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066703; c=relaxed/simple;
	bh=gcWaHeEjwB+2vvhipKTXNylFHvWIJ0O+6KhycQ+UFh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nhi1aruwL4u2mSwgyHs7ocvEVDrKYUkQyEBVSddncZNc2aSchChUsiOLfE+tptkDrzKUrmhUCLtIO6sUs1giUOMBYEeJi99RdIqZP1RhkCYQWkdcCdfJce53cEcoDvmIKHJ0fcge/FZZ9Pkzz/S/PRQDWSL+4MYHLprkX+5+xrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxelqqja; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2D21F00893;
	Fri, 29 May 2026 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066701;
	bh=gcWaHeEjwB+2vvhipKTXNylFHvWIJ0O+6KhycQ+UFh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gxelqqja5monXtY6Zasspc6vcnH5JstBWGcYqTZI8IAD8KMBNyB+agh6yDrfS2Kd6
	 JHFIxdMZzLZSEeyKcVK+AXGYoIzI3+Lnn1RxPhoSNHuzYaULGVfFnEtmy3+RR3pdfL
	 IFaIv6uYvgKFkoc11Yjc24hnfjIPi+LRT+BdpRM2w20gNKL2dkG5PuRHqTZ2E85PQi
	 4U1CSi3Yr3pj5lbbaQZ5LvecqvtBdXOCyUFDvHDEdAHHaMrJHqO//GTpcLlssA5mNm
	 kLUndXcIPwBDo/YDRRaWAteC3E2lAMVxhBniwZsjWU24LKG8LiFYphtwrYDYK/2KEs
	 iEUfA1L4lDRJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: it87: Clamp negative values to zero in
 set_fan()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Zhandarovich" <n.zhandarovich@fintech.ru>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
References: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:58:21 +0000
Message-Id: <20260529145821.6D2D21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-14611-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,fintech.ru:email,linuxtesting.org:url,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: A2349604984
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> set_fan() parses user input with kstrtol() and passes the resulting
> value to FAN16_TO_REG() on chips with 16-bit fan support.
>=20
> Negative fan speeds are not meaningful and should be rejected before
> conversion. Worst scenario, one may be able to abuse undefined
> behaviour of signed overflow to possibly induce rpm * 2 =3D=3D 0 in
> FAN16_TO_REG(), thus causing a division by zero.
>=20
> Instead, clamp val < 0 to zero and keep the conversion in its valid
> input domain, avoiding unsafe arithmetic in the register conversion
> path.
>=20
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>=20
> Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529141839.1639=
287-1-n.zhandarovich@fintech.ru?part=3D1


