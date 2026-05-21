Return-Path: <linux-hwmon+bounces-14386-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPYqGduNDmq6/gUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14386-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 06:45:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFF059EE1E
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 06:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 730F7300AB18
	for <lists+linux-hwmon@lfdr.de>; Thu, 21 May 2026 04:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F59357D10;
	Thu, 21 May 2026 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDv1DE6X"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAB351C1E
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779338712; cv=none; b=AjIiX2TAvps20dqAvR4rzxdRGZ+Irev/0EAcuhwSiSVrCYoUYcc1fUhOm97a9oVtG3p1p5ax+pt38luQbIpriAR5+bsV+qBCHRJ8V34bYk18najv7frz2sJ2GBIiRakx5NUnW09XMgc9vIkicXrRsFEKPuEtsQowMoC/zqbkM48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779338712; c=relaxed/simple;
	bh=f+SuW4wtmXabyvuk3MIXwyq36ZsAFMXKtJ2DLYB/C9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uHq4cZO76AMhar87NzR81zz3qGPOi9XoUr3GGfSiCbek3qSy/AxH4mswDlLc1ymvY+F8+rRsaKJMxzDsmYJFFAiZSW4DRKv2DO0PkwCq/G6L+JmE15IlzXIEMPLsz4K4tfpSSSLpQUIiYNH4/kPfNDahF10uqXVowi9/SETGfRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDv1DE6X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4ED1F000E9;
	Thu, 21 May 2026 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779338710;
	bh=gV20FZtO4CZkmQyBlw0tuTA5LRmV99fQ8A748zN8TBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDv1DE6Xm8HSauMSxzk5uTqhydyUwvC7FFJo1ajZmRIbqbYfd2YUoPc4p886gmhnR
	 pvvLsnoiEneCeeiLbs1553GAWV2nmursCVg60166jARprqAqGKQiT3Y+Y4D+wVnFVd
	 TTfFymT90eND/OWZi1ju4huodrCWgViSuW5cQcR7ROjWlAiLSRW+Ins8pb61ma7P58
	 1W6veLi79N5K/V3a3n/nysFDK+7M4EjEdZtHN9x4dlVlp7KbUH5EbFTflpQGEApdpk
	 AyHtpQjrW9r5q4fXnkDkCBNYh7fhNiVRNxeo5yM0cZYpGZgwkA0ZLCBRIW2tVjn92a
	 ZdFSwCeybHnlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (lenovo-ec-sensors): Fix EC "MCHP"
 signature  validation logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kean Ren" <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260521035228.533317-3-rh_king@163.com>
References: <20260521035228.533317-3-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 04:45:09 +0000
Message-Id: <20260521044510.8A4ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14386-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,squebb.ca:email,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: BBFF059EE1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> The EC signature check uses && instead of || between the four
> byte comparisons.  With &&, the condition is true only when ALL
> four bytes fail to match simultaneously, meaning the driver
> accepts a device as a valid Microchip EC if ANY single byte of
> the 4-byte "MCHP" signature happens to match.
>=20
> Due to short-circuit evaluation, if the first byte reads back as
> 'M' (0x4D, a very common register value), the remaining three
> comparisons are skipped entirely and the device is accepted.
>=20
> Change && to || so the check rejects devices that do not fully
> match the expected EC signature, as originally intended.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Kean Ren <rh_king@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521035228.5333=
17-1-rh_king@163.com?part=3D2


