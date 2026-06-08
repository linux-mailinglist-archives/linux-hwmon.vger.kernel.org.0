Return-Path: <linux-hwmon+bounces-14865-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8pprMzHBJmoZkAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14865-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 15:18:41 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FB65689E
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 15:18:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D6cf1f0r;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14865-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14865-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 055DC303FFB4
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 13:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1C5347FEC;
	Mon,  8 Jun 2026 13:10:46 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E43382C9
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 13:10:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924246; cv=none; b=skuWXaARGMChbovHYEWKTdpXqLIU0L9BM0A5aPSyltp5AOB0w5nqHfknBI0n9Gq9hxSFgGlU93Cpn909elO35uTtyMRgELcdUXOwX0PP5w+ySNoY+SfOadQVctHtC7mETr0u0jBQW1F9M8hPW/mSjipYPmLkIxonmJbMOmpkGdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924246; c=relaxed/simple;
	bh=LfzGfrENXYrGYO+DshwwqcrJdI+dTgQNIOXWsrCrULo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QWwmMou2md1EVw/oQbkVuSi88axYTNddO13r/PUMmsyZG2DvF+LwjbMnNQveOCyCrdKqqJkXH6SSViN0HBzbAGjJ/gxb3Za1UfuPjYOVxASi0CzhI3WLhhti6DR4d6qmPGl8wQrAB59TlWC540b7ULoRaYocWDjc+5kKURBYXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6cf1f0r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4537A1F00898;
	Mon,  8 Jun 2026 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780924245;
	bh=LfzGfrENXYrGYO+DshwwqcrJdI+dTgQNIOXWsrCrULo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6cf1f0rwoBLQUPjgZix/Y3KNQQQ4wqitNxkNPZq/T1pyTkH/jaOYgtCayijeAU55
	 LhPN3W2NG5S1bCjbs8RCj4foEyxK+oBvivhAaQ7yhFmlxeSXPtzbqxqZSPl7Mujvz7
	 KMScOH+mUJ4h701mc++5fiG04YJO4ItlyA8VjZ1dS/jqstCcSOIddHfa7aV/94ZXze
	 RO0kBITb/HDlEd+XJOzHAbfY01ZLGb3cbdytWJL7GqzGUKqOMFADFYfmmTMsKSGafE
	 AMfybMtVic4+WAIoMkemOt1GUNt2/J2PvC88CNOampn03oAtjqcwNkzXz+H1zM6NMy
	 LzWTQr+MIXLdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: Add update_interval_us chip attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260608-hwmon-ina238-update-interval-us-v2-v2-2-2d939fbb2ea1@advastore.com>
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-2-2d939fbb2ea1@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 13:10:44 +0000
Message-Id: <20260608131045.4537A1F00898@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-14865-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devnull+ferdinand.schwenk.advastore.com@kernel.org,m:linux-hwmon@vger.kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,ferdinand.schwenk.advastore.com];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[advastore.com:email,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 239FB65689E

> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
>=20
> Some hardware monitoring chips support update intervals below one
> millisecond. The existing update_interval attribute uses millisecond
> granularity, which causes sub-millisecond steps to round to the same
> value and become inaccessible from userspace.
>=20
> Introduce update_interval_us, a companion chip-level attribute that
> expresses the same update interval in microseconds. Drivers
> implementing this attribute should also implement update_interval for
> compatibility with millisecond-based userspace interfaces.

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-hwmon-ina2=
38-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com?part=3D2


