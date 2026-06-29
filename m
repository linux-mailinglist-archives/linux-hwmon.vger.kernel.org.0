Return-Path: <linux-hwmon+bounces-15426-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /taBGwDGQmptBQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15426-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:22:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD746DE435
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 21:22:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nY7DaSor;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15426-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15426-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A8E13004D9E
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7782F1FDF;
	Mon, 29 Jun 2026 19:22:35 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8F2DB788
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760955; cv=none; b=Gq5zhbhq5MPLJoBXpW1j4eg13UbgXtCn8aHsa533PAupNUuRXlrogo+CybDrNZyPwGo7iRL/MxFboLOD8lNWRurRefapVvijYxxvJP7oHA9baXG5j+z6CZIPL7agM3Kmn5SDnTOWjRBs9O0YaXEMElkRzcGPq7Ph3oltfZ6KdOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760955; c=relaxed/simple;
	bh=cFu6hbfjL4JDQ5Jr0yK16VMYJJ+PACDaw//qPWQJ85c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ak1tyRuC4FDEx95tVYexXduEMr6qeaEVihAtZkEy9PSYEAJyKGTecYSGSqyiBXxB0KU1mOxndmCuPwwWDxPmbKnVnwkByNk/pa88ckDu0NsZG6m9IGj0exPK40VEgfccK5Lr/toUnLvqSl6mXHhu/v/pEqvVArM82Tx0Mk0bjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nY7DaSor; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F169F1F000E9;
	Mon, 29 Jun 2026 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782760954;
	bh=cFu6hbfjL4JDQ5Jr0yK16VMYJJ+PACDaw//qPWQJ85c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nY7DaSor+FHZcsj7NvzrTfuTQ06PhW47GV2nBgzilZtfPaV2ZNsrWCQCwy09EWbGB
	 FVcDYtitjQ1EtiRkzcrH1skDLfzhy+cDLF1Dv3WvfBr9Au/ZNS9c0IR3A2Re+5P/1Z
	 n5ghgZTx2BjgH4YJkriVMAsEVlm3ZM4YPLO4ay/xZYa92wXemSQpQ5RB5Z4Rr0214n
	 I0YWRk1ZpDtQ678swsDU9tWz8HrD+bti39EInkm8LLPqyvTYb8pwn20b11PougBsTh
	 awZNXmseGkq48/oYn/iy9z3L86pyq76tQZ4knvYJu7KSzDTbWr6znbwAORbPdugH+v
	 ZjVkPUKN4unSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (max6679) add missing 'select REGMAP_I2C' to
 Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:22:33 +0000
Message-Id: <20260629192233.F169F1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15426-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FD746DE435

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly references 'max6679' instead of 'max=
6697'.
--

commit 232f529a8bd06a5a57ba2d3974e729ff7df2ae67
Author: Joshua Crofts <joshua.crofts1@gmail.com>

hwmon: (max6679) add missing 'select REGMAP_I2C' to Kconfig

This commit adds a missing REGMAP_I2C selection to a Kconfig entry to preve=
nt
potential build failures when regmap has not been previously selected.

> hwmon: (max6679) add missing 'select REGMAP_I2C' to Kconfig
>
> The Kconfig entry for the MAX6679 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap

[Severity: Low]
This isn't a bug, but there appears to be a typo referencing max6679 and
MAX6679 in the commit subject and body. The code changes modify the entry f=
or
SENSORS_MAX6697, and the Fixes tag also correctly notes max6697. Should the
commit message be updated to max6697 to accurately reflect the configuratio=
n it
modifies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-add-kconfi=
g-deps-v1-0-8104df929b1a@gmail.com?part=3D3

