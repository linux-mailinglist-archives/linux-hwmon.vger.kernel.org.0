Return-Path: <linux-hwmon+bounces-14788-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mnfmCcE6I2rZlAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14788-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 23:08:17 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AB64B4E9
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 23:08:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JI++Vwjj;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14788-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14788-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AD743019454
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 21:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073A03793D3;
	Fri,  5 Jun 2026 21:06:13 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129C1280325
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:06:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693572; cv=none; b=oDC6FQRFOhslnd1M/St5Ef9SrwlLRA9e+BAG+afEAFb5Gqdg1IwyaDXBfHL41eVuU6Q1E6OXs+Aa2ZdNb90y89+s30EGQz0ToAs85gCU+vCt2YwVI323LV4XeJkehQdZO9yLt/8zTkIe3OvuvZI5ziy33RzzuScr1JCf172YZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693572; c=relaxed/simple;
	bh=wS8yrKnOHlgVvV5mIfbJDWM5aEF2S/cplCSu7kcWUPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAEWiWiP2ZUCKWcf7CtbKplm2gDkkr1YkyxYi0fNti0460a+i8c37GIqczox238fCBn/ft0i2bmVXwKTZO+hteoMRhiDoRi58kjCnaVU1I8mUlHkWUi8vY5DOcIA9LLoS7MdT+g1qsTBGbn+psrkRPMcNMeTeUt84XFZpy2dhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI++Vwjj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C45F1F00893;
	Fri,  5 Jun 2026 21:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693571;
	bh=wS8yrKnOHlgVvV5mIfbJDWM5aEF2S/cplCSu7kcWUPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JI++VwjjWmb1nI5r8TMJq4CWCD8Nft2zf2KKdCYNH6+swFCGgHVm9UwVKOEkEfAI5
	 gi6QjK1i4djr5r37CK+kNK3euD2fGntSvxi79cb7TB10j1RONIoz/i+QrgHvENpAWr
	 kKdJov8oMXxtYEuHEwfnNYdio2a1xhsj28vz6vL3m/gR75J5u76M4BwBTr7ipPwazt
	 Xr+QZI37Gq/xeJZgUF76Pp5qU4XasJsMEAQa9TzSYrwmdGeRZ3QCk6NKoqaPeT/HaS
	 NLc7rLD9Bk/g0JNA3Qvo1+QOfR+ZwyUNq3aa0QhzeVtWXgpAy8t0s53X1dkmnZrTfu
	 F5LAFhJYfAJ1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/9] platform/wmi: Make wmi_bus_class const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-8-W_Armin@gmx.de>
References: <20260605205937.530897-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:06:11 +0000
Message-Id: <20260605210611.8C45F1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14788-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,gmx.de:email,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A2AB64B4E9

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D7


