Return-Path: <linux-hwmon+bounces-14187-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDtkL11iCGoQmAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14187-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 14:26:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2721D55BB69
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 14:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B24B300D300
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 12:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E455C3E1699;
	Sat, 16 May 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zpa+KJ/8"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C237BE8E
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934362; cv=none; b=MsKXEpdqib+H+J/zQB2J3h6v/xFWjcsL4Qj45CnrQvEFiJ2elOY+R1MibAIRUUutK46Cm0B4YoEaVdm0bKtsA2+kGHgel1R/+ASLu22xC0rYflc1Q5a2GMC1KUGgrNTDNnYE3FS95D4M3YeQnAzEjEN8OIOq03PXzFRhHRJayjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934362; c=relaxed/simple;
	bh=TiUxjS4T/MLbcGALje09hm7FmXpNXFQIoX2sC3rexmI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qVkJWNU+nygugfIAOZt/6w89cFeAmL2D/R2PEI0cppCTAKw6bDtAImfjdVPReWb0lKBaF+0T4Leds2HS0YkxxgwoSHwDDcdnzJgsczJ5lSvqvuk6CPtOnEqgvF6Nxstw4/+VPh9lPR59BnT+yYARSPSNkRmY9ipJ+OL6918KJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zpa+KJ/8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C85C19425;
	Sat, 16 May 2026 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778934362;
	bh=TiUxjS4T/MLbcGALje09hm7FmXpNXFQIoX2sC3rexmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Zpa+KJ/8dFlEfO+qxsTbMDPKAMXDx3/V6kKOdkVlU2rayealgWt1bT4r1ukQV7Lr2
	 sNb/VB+PhkyxO72dc2Q21Bk616vRGE2oikqkmQIP1JegRs/ZkrXECYuS56//MOdSnS
	 3KhairM3Rvx94C3+aS2mljqC4hHGmtX5PFgRiuwStMZr8ZaGTkt0N9Cv641jBAbCoF
	 BAHOFWwhxYtIA7ZpUrQ3hu2S7QUNQqrt9M1I/X0fc9rGSMkZbsExGHUjcozp6As41G
	 yfpT/4CQkKsrRY5j00tBEi0KB9QTzhrZ4HrsRCT1BLFvy8esRRT6Z3zUXZ9oMgNm0r
	 KBxT1FwvcbPPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (coretemp) fix coding style issues
Reply-To: sashiko-reviews@lists.linux.dev
To: bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260516114253.5466-3-bakshansky.lists@gmail.com>
References: <20260516114253.5466-3-bakshansky.lists@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 12:26:01 +0000
Message-Id: <20260516122602.56C85C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 2721D55BB69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14187-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] A blank line was incorrectly added inside a contiguous block of dec=
larations in `create_core_attrs()`, splitting the variable declarations.
--

commit fd6a696ecbdee696c6e67fb77fb06e3c1baa31cc
Author: Roman Bakshansky <bakshansky.lists@gmail.com>

hwmon: (coretemp) fix coding style issues

This commit addresses several coding style warnings reported by checkpatch.=
pl.
It updates header inclusions, adds missing blank lines, combines split stri=
ngs,
and reorders the __initconst attribute.

> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index c722b1d8e4804..a79c2d65a2bee 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
[ ... ]
> @@ -424,6 +423,7 @@ static ssize_t show_temp(struct device *dev,
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev)
>  {
>  	int i;
> +

This isn't a bug, but does this newly added blank line split a contiguous
block of variable declarations?

The static array rd_ptr is also a variable declaration, so this separates it
from the int i declaration. It looks like checkpatch.pl might have misparsed
the complex function pointer array declaration as a statement.

>  	static ssize_t (*const rd_ptr[TOTAL_ATTRS]) (struct device *dev,
>  			struct device_attribute *devattr, char *buf) =3D {
>  			show_label, show_crit_alarm, show_temp, show_tjmax,
>  			show_ttarget };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516114253.5466=
-1-bakshansky.lists@gmail.com?part=3D2

