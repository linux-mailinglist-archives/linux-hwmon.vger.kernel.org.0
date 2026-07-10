Return-Path: <linux-hwmon+bounces-15757-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i17OFn7YUGrJ6AIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15757-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 13:33:18 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404273A471
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 13:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kqVEJdkT;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15757-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15757-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B9773012E9A
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 11:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944FF4189C0;
	Fri, 10 Jul 2026 11:25:23 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F534195D7
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:25:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682722; cv=none; b=XKeBknMYDGkpmwr5TfqdRF7Fvv9Gb3Yf6mubzmH1SFlO6g157Haq4I7a6oMqBfzSKOJxSmuRLHcVwD/FFm+kKHVgs5DDryYTiXekNmn6YtZiK+6S2CpHGTXBA7nF5K6qOvWErlqZ8zyYD7CDrQn/R+ul/NBqDVxDkwNd+KOec8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682722; c=relaxed/simple;
	bh=kDCu1wuU7RxZMMntIXkRjFuZC3WCLuihGxnJFbWzi6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t4iF23eFLjFLyQk8Zoq8rl6OkyYr334XQnBYGsPJaPx6ScYMjFWWegMKd8ZWlVksdiYwW032gWo9I18anlr5PdJQdJlhY7Z5REL3Rc3/6QEyXvVl5vnm0GDkyWske827tZYdkI6wBDOE2XgAPkdYIEGQ1I9E+PEi7O2sfFj6Ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqVEJdkT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961EA1F000E9;
	Fri, 10 Jul 2026 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682714;
	bh=kDCu1wuU7RxZMMntIXkRjFuZC3WCLuihGxnJFbWzi6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqVEJdkTR3sKIm74xQzT1dJkaX80osP1rUysbmVPOSBWjl3+3dUhz9jYle+gYotz7
	 c/VKkzdJW22C3j5LlPsrT1tL6FlFNw4qoOqz+qtuwj0xW4aiA/ZU8dYHfw+SCPThT4
	 aPKHhFEedIWpwxrmSbDe/W7GyP5WvzWpI5w8B7u7rXDyj6n404fV5dOfGW1U1/Z2w7
	 P8+8l5rc13DbPnZ7rzTxCKwTPgsSYGeWb8CeHB8asfgWBjcUidXPPhPYmg5RcDjoOs
	 LhDs1nFgacV+KRqpqo+7AqjT4UW0Y/iyqZtuiTa+49bYfCPNHlhpcS5ljprol+9I5/
	 Qmettsfi4GbPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] misc: amd-sbi: Consolidate Common SBTSI Probe
 Path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-5-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-5-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:25:13 +0000
Message-Id: <20260710112514.961EA1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15757-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Akshay.Gupta@amd.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,amd.com:email,sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9404273A471

> From: Prathima <Prathima.Lk@amd.com>
>=20
> Refactor shared probe procedures into sbtsi_probe_common() to ensure
> that I2C and I3C probes focus solely on bus-specific allocation and
> device configuration.
> The utility function reads the configuration register via sbtsi_xfer(),
> initializes ext_range_mode and read_order, assigns the driver data,
> and registers the hwmon auxiliary device.
> Routing register access through sbtsi_xfer() keeps the probe path
> bus-agnostic, so no transfer logic has to be duplicated when SB-TSI over
> I3C support is added in a later patch.
>=20
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D4


