Return-Path: <linux-hwmon+bounces-14552-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sImaJk0OF2oR2gcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14552-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 17:31:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5A5E6E4A
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 17:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9785B3002F73
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 15:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5AE3815C3;
	Wed, 27 May 2026 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJxeCpG6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F03815E1
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895841; cv=none; b=Zg1/j2eF3evWmqY6jjeWthnBebAJh+Q0erm7wOB7b6/gZQgY3zeXYdjj7HGD7t/nVY8y9W/EiTHBVcfbZxC/eDR3R7OzIRRamVnHlV3LO0DJdATGSi8M8HCKw9Cm0nl0Bu23m5BviZ0oFvsFuZNwXrnAh7tp9EdOx+xKVIcnqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895841; c=relaxed/simple;
	bh=IGfvjIzfq17vbaAQkUVV7egGzzSP+77CdinfsSvaR/A=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AWCZSAPr6witsLdTI9Zxb6cHiMWl3aofb2X9AW+AWRcwIoRk9sXKNJKBO2Da96m2/c42bnv5gFjyAru/wtp8t+PdIK40sGBPXqwtyUJNxAuFa28mTaah05cp2rQiMNsfkzbqiOmOu0yhfjPXg1yhqvAGg/L5NABNY7Rrs8x1YxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJxeCpG6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EF81F000E9
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779895839;
	bh=8gnFi69cCxDDt+b/HssXsRWSan366sXdX2teMfXltqM=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=CJxeCpG6ji8WhSO/KCDe8Z+lW8REBHHrF60hQgICUCbUsU4xZyLqus3Fu92PEK0qu
	 BsxEtehsPaU6hNkCJnQ5ztRmJ2UOXUoMsqU/lsIzk1Cs302vYg68m//gPszcCmossU
	 bXITD1UzOsJW4I3iU72aj+STj1jlsgdxpJBmGOC+yHkkzpBUXP/Hh7tsKi0NPvGNRp
	 laD0WLthoOp2TLnP4NIyg3ZZGqX+AlaJsXPDqrW/+oa8bY4zDBZYvQ4+pboycA+hnb
	 TVLUblOUDQABaCeZbC5AX/+ciwV+Y7u0my5G9jkUYhb/ich+I/5FdDDlsNtm/O3UN+
	 QxF8qeFUGFX3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: Use named initializers for
 platform_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
References: <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 15:30:39 +0000
Message-Id: <20260527153039.B2EF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.84 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	MISSING_TO(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14552-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,baylibre.com:email]
X-Rspamd-Queue-Id: 8FF5A5E6E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message contains an incomplete sentence and a typo.
--

commit e80f82a6fd801f1724dea71e8261da2d0d65c1f4
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

hwmon: Use named initializers for platform_device_id arrays

This commit updates platform_device_id arrays in several hwmon drivers to u=
se
named initializers for better readability and robustness. This prepares the
code for a planned change to struct platform_device_id.

> hwmon: Use named initializers for platform_device_id arrays
>   =20
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.

[Severity: Low]
This isn't a bug, but there is a typo in the description. Did you mean=20
"anonymous union" instead of "anonymous unit"?

> While touching these arrays usage of commas.

[Severity: Low]
This isn't a bug, but this sentence appears to be incomplete. Could the
commit message be updated to clarify the intent regarding trailing commas?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779894738.gi=
t.u.kleine-koenig@baylibre.com?part=3D2

