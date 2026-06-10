Return-Path: <linux-hwmon+bounces-14995-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WnRYB/DMKWo8dgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14995-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 22:45:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A94EA66CE86
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 22:45:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b6NeRXT2;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14995-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14995-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34BA63038941
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 20:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A4F480946;
	Wed, 10 Jun 2026 20:43:25 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4C372073
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:43:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124204; cv=none; b=DA8S224duFIvxfdLnwbtdT3WeNlXesN2/muWW3w8p2fTzcesE/NV0irixgyF4eU9Y0UXMbLrVMVCTpD7yz7n0tjuEegr0e/cwJPscxibWO1faDNbdBc/B75wmIm+R0PV+jffCjTNK6UWdtLGFiFH6w6IZ3O1erSywVgHlN/bSLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124204; c=relaxed/simple;
	bh=dlZ+S56nnzVh3A9MmqEVYvUq0BnUjGKJJjTwARyuNDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hcxwwdhnjHmK2MVAkZFBm6Fi3itsMGUXyKt7mtF65EgAmyxeAswwt1S+MXoSt07Ks3tnapyWBX+AAvnY+YAqH3xxR5X2oPVmx8ZLgLZscKTE9TAFz8VI681yZO6hrGTxc/3/RXmLtzjXsWOZBPHMu9HSShVBiG3i6oQQ1v/oRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6NeRXT2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2198A1F00893;
	Wed, 10 Jun 2026 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124202;
	bh=dlZ+S56nnzVh3A9MmqEVYvUq0BnUjGKJJjTwARyuNDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6NeRXT2DYCvD2AnIuewP2g8h4d6IxjJLscvarvm4wk7zQ5+nUXCXPtLvf3ibdmHH
	 280Jfk86yilLOt4vCZezdwVBL3emyzRRXEncC0ED28rq0SIY2WJIwx3OcpVu2ng1mJ
	 Ay/zOKrZjjTWWzRBxMxomBlWjixUhxdhHFvXPN4u9lNOXn4swsXOBh242i4e/ZXxFP
	 IesC3SLgUNpZuxBclm5FuCEJLZtuqkMe2cjstcW7ppcyRM5Jwy09PfDgzZq4gR33yI
	 m+5s6Ky4gTuVjCdYaPUyes+5DYv3Q1BK4PK7UmJyHMBAHPztiM7mXo82X2ardoAEzy
	 f6eXMybKV4hSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] platform/wmi: Make sysfs attributes const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-9-W_Armin@gmx.de>
References: <20260610203453.816254-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:43:21 +0000
Message-Id: <20260610204322.2198A1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14995-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,smtp.kernel.org:mid,intel.com:email,gmx.de:email,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A94EA66CE86

> The sysfs core supports const attributes. Use this to mark all
> sysfs attributes as const so that they can be placed into read-only
> memory for better security.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D8


