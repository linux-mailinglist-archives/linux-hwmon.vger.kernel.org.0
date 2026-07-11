Return-Path: <linux-hwmon+bounces-15805-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vl+cFJf5UWr+KwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15805-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 10:06:47 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75C740D86
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 10:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WdujfW7z;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15805-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15805-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B97E6301E7FB
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jul 2026 08:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91492857FA;
	Sat, 11 Jul 2026 08:06:43 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF75495E5
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 08:06:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757203; cv=none; b=dul7cuuU7c4tu/DvnqGSUinm3CjUQ3YTmI3HvN2hb4dFPY8rk+j9m4LZG8wnl4mYCu1oFNpovS72RQwVjkJY9e3uFMfkTJeeUGJnaMyY/Y4VFgWldYETIfs+MnhvfvKfG9rdO2HiInG/1FujSu2LjNi5OeBPuCcOWleS4EBHzuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757203; c=relaxed/simple;
	bh=tpAntsuH11oskamlovZCar6Pb5syrMQ+4on/aC5uOg8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4PZGfXxQzczQ4yfvG8U1lXhohHlBiMOp5FSO5MsT+AL6A5VWHEbVDGrax38lUG0yPTZSTz4WQ+BIBifJJxHadNVjJvy2gK0+nUtIhdsJV/bn+U59/m6uUfCzZiEOfu3q/GJJLhAfWBRbo7RKvb7NDEayLQ0/jCfq2te0+bWbvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdujfW7z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3869E1F000E9;
	Sat, 11 Jul 2026 08:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783757202;
	bh=tpAntsuH11oskamlovZCar6Pb5syrMQ+4on/aC5uOg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WdujfW7zq0t5ue6cBHZWx2iK3maEYh+EiSKHa4KwqJFqN+iL4NIIeWuAu85dlmTiV
	 m573byAncWUKWybitNYCAZTD5+OyooJBGbMmkA+VsTTrl/6sXgCwsgK6TUERDj0M7H
	 ccbXsqoRh+vAyq4m6t6QyKyzmEQkNiYP6oZRRNIA510HTD8KsFFxUdaG8PA6fkxor6
	 ZnHnXJZZbA9K7aN1gqpwuKxs9Lk/DjOr39kneKG64TBvyJ4JaNDFnjqmJkRqpTkWIF
	 sJhOVlgoRdWgF9MFQgRBtA3419J1P5ZRX2ET88VVIGUojTrpNM7aE/snFaM1MCBYPb
	 Vhwhkbyf+h7MQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] hwmon: (applesmc) Cache fan positions during
 register initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711075754.11358-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
 <20260711075754.11358-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 08:06:41 +0000
Message-Id: <20260711080642.3869E1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15805-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fourdollars@debian.org,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB75C740D86

> To support the read_string callback for fan labels in the modern HWMON
> API, load and cache the fan position names in smcreg.fan_positions
> during register initialization.
>=20
> Pre-pad fallback labels with four spaces to match the "+ 4" pointer
> arithmetic offset used by all fan labels in the read_string callback.
>=20
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711075754.1135=
8-1-fourdollars@debian.org?part=3D1


