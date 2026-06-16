Return-Path: <linux-hwmon+bounces-15155-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 043KBiMnMWpScwUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15155-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:36:19 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDDF68E5EA
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:36:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H0phtaJn;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15155-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15155-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A6F304095C
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6506F42EEA2;
	Tue, 16 Jun 2026 10:30:58 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520303546E3;
	Tue, 16 Jun 2026 10:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605858; cv=none; b=PIuDFjxzA7jSgtcFSIO3uxYnySuDEehyj2IRk8iBekqdUmq5Qtiu3LRVoSNNXRTgPz/X07qQSadZCrXZMeYjAGFPfgwp4A8QIX5JXPV37/SRI5zVLSJWHbFuy6yKAmRgJnRWFNUgZkXz+iBf2NlgxAulUsTDTNFkgvflvdmC5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605858; c=relaxed/simple;
	bh=FwC59B4n0rf5OGJgDzl9cyHnls6ke/WWYBAyLmv+7gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QR7krIkGRBEfQEr3+fH1SqGYV/1ZIRm7S+j512QyIIf/TatoaAmkTqPexl2hSIsx9ywP5+AvcA7pj+EpEOss8qJ9LjrKa5NpolDWE7NJ7cck9otpwdoO+IZsEkeh4WhopxUa+lGUleiO2BeIFG3a5NLWan8PGSerNRnz04LyGps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0phtaJn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6161F00A3D;
	Tue, 16 Jun 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781605856;
	bh=FwC59B4n0rf5OGJgDzl9cyHnls6ke/WWYBAyLmv+7gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H0phtaJn/lZL+Gaioo/8scIgU1c0Y5hrikbqp9MQK7l2HUt6tS0inRk4Ir6u9u+aP
	 5WqqB0/f9ttMvqFTZV8rebA911Su7EDHqbNe6tM7GX0GErN8sshLvTbsvjDRAqs3sP
	 7yHElXO1GdySkuqT+gGcys1kURHh/DLkK0GXM/V4ZQ68ltgnz4swwM5sOXatVH7psy
	 xnRHCd3enQkBUVVt86R5GM8Pwc60OPyE7l574leThLexMTrJvmRknvMG1zP58OSbXY
	 PZyWFcXhaKaVLUv19c+aTNo3xQlxfwiFZ+IOTkt5mLPC7giQbu4McI+SobGucc2Utw
	 yaQsM79qQfDvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/12] hwmon: spd5118: Add I3C support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:30:55 +0000
Message-Id: <20260616103056.6F6161F00A3D@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15155-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:Frank.Li@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,smtp.kernel.org:mid,lists.linux.dev:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CDDF68E5EA

> Add a regmap config and a probe function to support I3C-based
> communication with SPD5118 devices.
>=20
> On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
> require an ACPI or device tree entry. Device matching is hence through
> the OF match tables only and does not need an I3C class match table. The
> device identity is verified in the type registers before proceeding to
> the common probe function.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D11


