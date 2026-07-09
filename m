Return-Path: <linux-hwmon+bounces-15714-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+g5OFHtT2q/qQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15714-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Jul 2026 20:49:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 717807347FB
	for <lists+linux-hwmon@lfdr.de>; Thu, 09 Jul 2026 20:49:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bgfO9R7p;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15714-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15714-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF87830747A5
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jul 2026 18:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB664E377E;
	Thu,  9 Jul 2026 18:42:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C559444712
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 18:42:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622571; cv=none; b=Pe29Th3l0MiyU0BCcDwwLuU4gfIlBMSTyA/Iuq2w3AoA7pIk30mStj+6tj5Fdy/+gPwN3VDaYArA4ruv+zPTmSEAg+IlNA3qS2S1BdxXixonBqLE27ZIc/ahBoOGrZFZJketZgI6H8uZ08mjrYrgFlprYHnoS2fgUaOQJ9Qrk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622571; c=relaxed/simple;
	bh=x7zybcjoMw0D9lyEgq4BdCy3VOk/kc4GjRfglmgMyMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AnKRhnGDRExx1FsF+7ePsQSWqDklx4PK09F50pmFNjDR7It4WMGe37oOz7Jy88L8hd06PH5qyzLsAtklBoA/jqyNzcPz84lt2WMUte8PSlzQf/6Feb1hK/pzK2iTmHP++2mbTdu+QDkoos+CkeQximKl+WJxcrVbK2rQPUz/qAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgfO9R7p; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC68B1F000E9;
	Thu,  9 Jul 2026 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622570;
	bh=x7zybcjoMw0D9lyEgq4BdCy3VOk/kc4GjRfglmgMyMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgfO9R7p9JRQJIWkDYXmrXQg/kpjYI3t9s5O9/sjilzDwGyPQgt0wb7vdZJzcXUke
	 NcmAUBskvFEitEQx8Vm2KpLyoj2NDe9YRvlm2vTvZSFrU/2v+IZHtcOoRrRR0eTKEr
	 pJ1K0u5toImPEVSaN83GTqDsSSUxidSdsoq3BjkmibOBZdEouBl33mP7mNHImHzGQz
	 246oKC6A0D0vWITIfiF3BKcw46TZtOe9L72kS6+pv32damwvc3vhtJqs3EVU3zBwuG
	 kCn0Zq5qfGfTMYtMYPnmf38Dp3HUgYq1H65Nvn19WLxtdz3/sRK7KUFO90q6pqkk2H
	 eaTxPVtZJiMjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo LOQ 15IAX9
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarbajit Sarkar" <sarbajitsarkar16108@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260709183500.13761-1-sarbajitsarkar16108@gmail.com>
References: <20260709183500.13761-1-sarbajitsarkar16108@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 18:42:48 +0000
Message-Id: <20260709184249.DC68B1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15714-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sarbajitsarkar16108@gmail.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 717807347FB

> Add the Lenovo LOQ 15IAX9 product family to the yogafan dmi_system_id
> table. Unlike the Legion series, ACPI table extraction reveals this LOQ
> utilizes an 8-bit EC architecture with a 100x multiplier, but maintains
> a dual-fan setup via the \_SB.PC00.LPCB.EC0.FA1S and FA2S paths.
>=20
> A new loq_15iax9_8bit_dual_cfg structure was added to properly map these
> hardware registers and calculate RPMs correctly while avoiding path
> conflicts with AMD-based LOQ variants.
>=20
> Signed-off-by: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709183500.1376=
1-1-sarbajitsarkar16108@gmail.com?part=3D1


