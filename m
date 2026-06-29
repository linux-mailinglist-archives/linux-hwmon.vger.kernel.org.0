Return-Path: <linux-hwmon+bounces-15425-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hm/HMzbGQmqQBQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15425-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:23:34 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37B6DE443
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:23:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eXqOI0Li;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15425-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15425-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26A123015E12
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 19:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A99388860;
	Mon, 29 Jun 2026 19:21:57 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2632EFD95
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:21:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760917; cv=none; b=bfsGkWaQwKvra1IlqjcznhobdsUFyGkxUaaNyyepZcrdziRo+te2Bp3TqLLHJOfz/ndkYalNS8blYywliaxCuu5sHGR7HN/+3z/FaheeSiIbD1SuWtBE0FCEmkpSN0DJUEECzvT4yP3yWxmiY/yKxKQbAq0ZixllKsiE7xI4kwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760917; c=relaxed/simple;
	bh=buDP2d0RToWDluWFdve++Ue/UOACphadfhW24eC0wYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SDb0TwLf1dLWo3HqDnEp6M+/4CQ6xbu0JicpqRnzFd3F68OYAJt6bjggWKZBIMe1LqfIla+PQLuRCReZl9YkGs08KNdKkGvArO7fsyvtum6/IaEsHZ2mkgjjr5s0/S/h2NwzYn20bEREdXtV9EIBgCGaUuMgWIRmVqLpm5Jsmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXqOI0Li; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814371F000E9;
	Mon, 29 Jun 2026 19:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782760916;
	bh=buDP2d0RToWDluWFdve++Ue/UOACphadfhW24eC0wYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXqOI0Li/CdL82U3VKiAF+jOt53dZkdHy2TeQFIYBbT25JttwX8UYA9AQtFRDzpug
	 lESumGrFqFbif5CQco/EhWAo7KhlrPNPSCOLPwQmeHd2yqXOAyClJoO//Ov303U3qm
	 R1Pn1zmeMROcFFYMy3/30umG5i0pphhhsxUR7URTn9Z2okEvNxCYR/tHrAVRAVs/je
	 lK1sYazheMBTKRCRq2iwbIhZadOYYbHGMTgTsDZqjUGEDMhBeMavQZM00ybzwKPsN5
	 6xyrY13KkhJRXj/U3jjg+crTuxK18nKlhKIeztOSNae2lNwro9wwtVALm6TsdudDC5
	 m3FmX2y3HfXNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (ltc2992) add missing 'select REGMAP_I2C' to
 Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-2-8104df929b1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:21:55 +0000
Message-Id: <20260629192156.814371F000E9@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15425-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joshua.crofts1@gmail.com,m:linux-hwmon@vger.kernel.org,m:joshuacrofts1@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E37B6DE443

> The Kconfig entry for the LTC2992 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap
> isn't selected previously during the build process.
>=20
> Fixes: b0bd407e94b0 ("hwmon: (ltc2992) Add support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-add-kconfi=
g-deps-v1-0-8104df929b1a@gmail.com?part=3D2


