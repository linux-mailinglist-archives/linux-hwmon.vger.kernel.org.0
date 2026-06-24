Return-Path: <linux-hwmon+bounces-15302-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N3lLOn2yO2oNbggAu9opvQ
	(envelope-from <linux-hwmon+bounces-15302-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:33:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 822486BD68C
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 12:33:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dNhkwowD;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15302-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15302-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22E42301F8D0
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2026 10:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3458528469B;
	Wed, 24 Jun 2026 10:33:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB41DE4FB;
	Wed, 24 Jun 2026 10:33:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297212; cv=none; b=X255w61yKiwh0PZk9mAj1gIAUownhFywL7D5H3CP70gHvxCokF3aGLZ8a9f3ltIrC+VN4dliNLj1TU9RkYNr4M2WlsNJ9v92NTWi6LaSxBcB43+9pX2XjgDZtTJsvFrqZ8LBv0D21+cen76aDYhpj55IqwaIrxnDKt7h4JXQF94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297212; c=relaxed/simple;
	bh=QprwepZLXAT5gLHrE6GyGbBtV3tiGZlNVbTYKnjkiTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=husmrcxmvhyw3X7IEQDuYZ+I1WESDfEGaJzKEvMTX9pVf7U8vIDKSFJKqgXlorz5bLV4LoYivTxFt2DTKMTsPMiIGyJl/JHTUBfn1abBd/noitUbTSiayui7RU7pw5MzEZX3X+CzwP3m2ktLPRKgQVJlzIfEjab38Ai1kl/+JIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNhkwowD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683E61F000E9;
	Wed, 24 Jun 2026 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297210;
	bh=QprwepZLXAT5gLHrE6GyGbBtV3tiGZlNVbTYKnjkiTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNhkwowDOt9/KRWv/v+jfYQ105T376d5r+js8Ad/wMjK6PZeVGhMRB0QjNcx2PPEq
	 bTJGvSiZ9rwmcoGx0YjmlHWqi3hve8XeJoolUjuOSduPy9t0CpJWeHsEU5BxEXRlOd
	 jMAK2oQJ03gutlhdfUdBrSvHGOG61T3o8TAFAEnKMNxrwZQTymOEPNhwZJVb39hhdo
	 xNUJWYVNNoZ+x5MGs/IcXj/nn0BcdnA/o7FtGuW5UsFE4zGYGOfgqwmduzzUD514Ls
	 FdZ0XiKS+nrrqGlIJP4Yo3TWLoxVsxSk51pzVV9nqOObvMVzRMKw0govJXpeNcmPbA
	 LnP9jUw022FQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-11-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:33:29 +0000
Message-Id: <20260624103330.683E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15302-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:linux-i3c@lists.infradead.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:Frank.Li@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,lists.linux.dev:replyto,smtp.kernel.org:mid,sashiko.dev:url,roeck-us.net:email,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 822486BD68C

> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out that I3C does not require reading the Legacy Mode register,
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections that support 16-bit addressing and prepare the driver to
> support I3C appropriately.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D10


