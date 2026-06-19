Return-Path: <linux-hwmon+bounces-15223-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2GBaAcQcNWqunAYAu9opvQ
	(envelope-from <linux-hwmon+bounces-15223-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 12:41:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B09B6A5459
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 12:41:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nxcVG09Y;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15223-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15223-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FA9A300B5A4
	for <lists+linux-hwmon@lfdr.de>; Fri, 19 Jun 2026 10:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34646375F76;
	Fri, 19 Jun 2026 10:41:06 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60D375F7C;
	Fri, 19 Jun 2026 10:41:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865666; cv=none; b=ow4UQsV/xZxcbLw2k9qecjefVTuTJWszMTCbBBByuILv0tHvBnz+W3fNJUwBSWU6x0/OAZHNWFhkLX5s4sgDIf3I4/PT//C/IvCcsnlcwh+LAxCbDfWBioZrOSMdrdA04v3bmJBmAzbfn8d3uUiv8+NH6/ockfXLvSbHiJV+rwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865666; c=relaxed/simple;
	bh=fgt8VBRVEoSs7HqWuXZBtTuu/ZeUcdXAMXC8VAtCniI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H6lJ2aQjoG4/kCcZqCcrGFwN67kp5sceHGIEU/nzGZ3ME/+3cmR0PajUMtqpOIaCcHZ/pezBp3WnYhBzmzvLCdZs2CfVCVdoYxIhMe0FpLvdLtkYU/DHUOxpPv4s/XimaYlH8YmRkuRsySvlYqv5I644yZJ00kl9I7e1GjGIYV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxcVG09Y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90D41F000E9;
	Fri, 19 Jun 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781865664;
	bh=fgt8VBRVEoSs7HqWuXZBtTuu/ZeUcdXAMXC8VAtCniI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxcVG09YidvgwW9d8yY93FttoCoNUe2CSoTN3Uu7kFcdWWib0jgpdu9KH9G/e7f5K
	 D0spP7ArRFA2WgHODQcFJl21AQA5luV1r1f9xl4kn3tWYODtX7lE8Fb3Xrg5Z1aV8u
	 th7vUFz1GbuHYQQK4G6kdID9VupCQtHWKb9x6tJDndOzqCEZinKXj+NSnNrDNlj50I
	 BXjNTCy789X+kMq3bhHfJ0b5nGPVEu6li80i8uke3pJGqU80sbwjTotw1br001J0BC
	 Ai41CtLr2fm1/NMbcjkokh881bbmYqUIKnmcvQBbaC3nHrUGP6/1F+ymVgRoeZMiVB
	 F5XEA1Q0pWqSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (emc1403) Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619103153.216444-4-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:41:03 +0000
Message-Id: <20260619104103.B90D41F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15223-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B09B6A5459

> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619103153.2164=
44-1-clamor95@gmail.com?part=3D3


