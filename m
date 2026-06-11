Return-Path: <linux-hwmon+bounces-15044-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ANn/DI3CKmp/wQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15044-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 16:13:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3CF672A01
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 16:13:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MCbGFH1c;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15044-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15044-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C099C304168B
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 14:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F353C40683D;
	Thu, 11 Jun 2026 14:13:30 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEA2C0F93;
	Thu, 11 Jun 2026 14:13:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187210; cv=none; b=qFiMTB5xKOcB9E4KKrHoJB9p4r18AJZHFl0/Fptu7Roa5e4tvpZwGHWrPt5nCprfVCJx+Ceb7Q6MpnA5xgszClvSuMLD2YB9UfxMKL/QSK8OtS4r2FI2zPs9KXeS/eMfqJrBKbKXquFYQQhkM6b5HcKrpWjgxcOobKlos6BcTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187210; c=relaxed/simple;
	bh=hnGXitECXlwp9XtmvWfh2pp05QNuSAQmZeYC9z4Xp3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e3RTy3VQxajPcLunza6BfLLzdiUiSs/d7AKV7HhJAz6LLMbelDm0zrWvOSge+VmtrxBEysWPTQS7LMDKdcL+JN1bmqn1BfPFRG+Xop5s9L4dznd/twqm2Y7eYQYRMxT2IpslDvrATUAf2ba0GjcAcIvdzADBZqQyYdje6DOD3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCbGFH1c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216811F00893;
	Thu, 11 Jun 2026 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187209;
	bh=hnGXitECXlwp9XtmvWfh2pp05QNuSAQmZeYC9z4Xp3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCbGFH1cYiF+2XxhrZDcscDib4Uzn1n4nTiSVysS9skCHoM5IAYm1xFZCxJqxc9++
	 mQvYYflUlKIHFR/HMEpJUhWfkGihndcY4jKBkk/qB0SLmOYEkxT7DrSGIHg1fPJs8D
	 K43ZXAZdMjsTDyaZgWJVFnzw0ir11fCL9uLd0NznXQutvwWTSIsmM2omE1lZ7McXPD
	 8mpZ6WYG8yEqkHd5iDIszrnm9a6J3Dd0VFD9lGtn/cRO5ITq+EwRXyS8QcEPPRNEnC
	 80ULAZj/ppTjxObvyyygbq17BTG8Mc92QBmEKHE/JcPzjXYfrLp1fYdwKRjsZgYpNs
	 vU4UjGHHUs6bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 14:13:28 +0000
Message-Id: <20260611141329.216811F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15044-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,qualcomm.com:email,lists.linux.dev:replyto,arduino.cc:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA3CF672A01

> From: Martino Facchin <m.facchin@arduino.cc>
>=20
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
>=20
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-monza-ina2=
32-v2-0-e4375ce652d0@oss.qualcomm.com?part=3D1


