Return-Path: <linux-hwmon+bounces-14805-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CUgsGq9RJWqtGwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14805-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 13:10:39 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E9650570
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 13:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kgcdNa8T;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14805-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14805-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 727F03002B0C
	for <lists+linux-hwmon@lfdr.de>; Sun,  7 Jun 2026 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8DA2D8767;
	Sun,  7 Jun 2026 11:10:37 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF3E38888B
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 11:10:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830637; cv=none; b=hnBTPq6eGMUioK7hXgMbsz4wvlBqfh7DyVIlGum/nuEso8PyDK0EoksRAPFqQlIcCAg6kHkN5yKUVaV+sYm+xLNdeXET+nQGsWPXJb1jdjS+hvcVm2YHaacMPLFLpAsVQSCUHkh/zFD5raNYg9WRGRrTbT5iaJswNiJEalMKW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830637; c=relaxed/simple;
	bh=t85Gij5X5NWVLqXBC4QutyNJDEjYVv4nkSRvTlXLe+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKAsntN6YK9its9xQ6Vc0ouPgKN7FGF+UN8Dnc47GhbBkQK0Ty94CSE3YpMbQKFW6DM3CQXwptZnZKdHddEEsmqVajMEs/AVhWmQ5u2XtgRdAhxAkQF7PaiEvn66AN7tYvYocITtOWtBkzuDvr1Pma4FlHCnjhFLZYZf0fgemb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgcdNa8T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C9B1F00893;
	Sun,  7 Jun 2026 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780830635;
	bh=t85Gij5X5NWVLqXBC4QutyNJDEjYVv4nkSRvTlXLe+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kgcdNa8TZe12tkpdEg1UPmW5lUL6gWviLOf43esTUPZc09j6p58dqqSZeg+XyyNln
	 fse4wR0oOZ7N7YRDe9h3C1Md0XjL3D9lPcvnrCDBa2+oIGZ0ZGoEvQS0KgQ2fC/xOr
	 6eJ9AB1jwlh4l0CGZcP3GqWm0QFR30lgyVJ93JTa0GD+4B/AzoRb0eXCxkL3a513bo
	 yOZaHdkdc00tIcezfo+kz9rRIRg6NHS5Ke4AdbYskCtoG7VzlRagk6NbaWfkGhkATc
	 ZF30+PN1tJjhbufwkZ3jc8R/HgfZQ5JOGUzxRSmPQ9Osou5Yuo8zRs4xvyN7v0KahQ
	 InvZQHSEGiwSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E
 GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260607110702.84599-2-eugene.shalygin@gmail.com>
References: <20260607110702.84599-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 11:10:34 +0000
Message-Id: <20260607111035.44C9B1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14805-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 076E9650570

> From: Veronika Kossmann <nanodesuu@gmail.com>
>=20
> Add support for ROG STRIX B650E-E GAMING WIFI
>=20
> Signed-off-by: Veronika Kossmann <nanodesuu@gmail.com>
> Co-developed-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
> Signed-off-by: Oleg Tsvetkov <oleg-tsv@yandex.ru>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607110702.8459=
9-2-eugene.shalygin@gmail.com?part=3D1


