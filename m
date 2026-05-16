Return-Path: <linux-hwmon+bounces-14170-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMcBEPsICGqVVgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14170-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 08:04:43 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AAF55A6DC
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 08:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA472300BD8E
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 May 2026 06:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30940372ED2;
	Sat, 16 May 2026 06:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0GM1I28"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE2372B52
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 06:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911357; cv=none; b=rIKuibXdg34jjpKhkDhy1ebtrVzt8nRArgX3dIQf0ER3+PlhVWU00haToLhSASEnuzx3eU3XA5ZkuvhxBMvFhDmVOMKGLP+vIgIIA4mf0CVodOBtOfKOin0Kg4Fo4afCBUIwsK8+h6ruegyb2ktYTHVhKpfzSo/ju33HiDXvaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911357; c=relaxed/simple;
	bh=T4xOe7jXYEGnQyng83CZJpoLVGIVM/OoB2d/IqsgST4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fd9+HwIsNv/561mCF5BmzYf+E5Cnm3DFmeF1zQrR1yhbrJd33ithKRsvrxrgfFUlCJmSNKoDVbHg2I8emYx2qG55wtrNgMM89fusGqwDwxLZiu2yRco1xNTPtKcdmORVGvsEZPKEe/7AE9RUk9Y/b65jQgr9bFexMClkP4JxDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0GM1I28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92E2C19425;
	Sat, 16 May 2026 06:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778911356;
	bh=T4xOe7jXYEGnQyng83CZJpoLVGIVM/OoB2d/IqsgST4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=A0GM1I28tk4aLw73GIiqpCZpIYjg0WXM/lTt2jJ1NncEU0Corj5u7j4JZ96yprhN7
	 oDp1yCpSd8ldtD4Q9El3pkn4YJjZcSOq1MdF23KtngFPbwJ6s9MysmTkQgE9fp7Ukq
	 RZgi070UqCQMJ4F2NRUkljRIKPzpp0/lDsR+ZhWB5P7NjOF3wOfLBGAAkhBuSaDz+g
	 VLIAkwvae/NNvH4ies4SDkoWI8o8MtO5vpLhemLxgO6LWjUYVfSyw+izVZRws1pU9E
	 CQh+5DEhkGmX/fuBWAVkBUObz2AaXA0xEApPLez0mkfLcb83/ei0/Ce4F2SJ98YkP7
	 3eLq9nK9W+3kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] Documentation: fix typo in heading for max31730
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hassan Maazu" <maazudev@proton.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Sat, 16 May 2026 06:02:36 +0000
Message-Id: <20260516060236.B92E2C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: C0AAF55A6DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14170-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,proton.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> Wrong device name used in heading.
> 
> Signed-off-by: Hassan Maazu <maazudev@proton.me>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>


