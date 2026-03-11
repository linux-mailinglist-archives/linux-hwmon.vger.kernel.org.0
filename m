Return-Path: <linux-hwmon+bounces-12298-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBWMNVhFsWlCtAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-12298-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Mar 2026 11:35:04 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAD2624A8
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Mar 2026 11:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77E343260830
	for <lists+linux-hwmon@lfdr.de>; Wed, 11 Mar 2026 10:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF1F3C197C;
	Wed, 11 Mar 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkp32s1z"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82543BED1D;
	Wed, 11 Mar 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773223282; cv=none; b=Jy8wBN7aep3jwjkREuj+ASFxyALPhS9h98N4ke+nGqeKzww8kk49JTBEWpirbfFqqCPG7/SGt3UMyFHmDnOL5O1pAJ/9J9M1l23rGI1apRBefGfQGn/JNHzVL4/96OhoJ60YR0Nvzv7xkZxIGcJNoNBXocbODArvchdGt4D3qO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773223282; c=relaxed/simple;
	bh=ulffV5/BKejV+qrmCDDCsRkAG0zi1YZGHgeohqakI2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9ay13fj9aZ9QsN7KlDzK/PBM08hqWEhhgb9s6p8vM+ISmg51jc2VtdClnVvkzrf+4Sq/ZtMvDi6JsgYHNZKLCNys+JBfGDfdSiFHIpriisxoSWlKJ23EB02f4osVn9BYz40POJ/bWTgJ1t/KQgpcCI1iuSb7oXeycKfcsJrTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkp32s1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ACEC4CEF7;
	Wed, 11 Mar 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773223282;
	bh=ulffV5/BKejV+qrmCDDCsRkAG0zi1YZGHgeohqakI2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkp32s1z/qDMTAsc90120NuWxDNSf3SdwpTtuZQ13SuRtVcqTTICS5kFnBpJkkMd0
	 hC3U+4H5OvgUZvmLBhZF+bY5HpH/RS7LcxMRaC8Vz4NjiKH5Ht/SsCXpDikklH+hUx
	 TIRI1x5RQeixIu9C2CTxYg8Y438kB4gSLaBNr5PPfrvYOoA8cXPqJ2GXYsSoyYCrwd
	 gjX0KWIS0owrN63vpfZKEXLwWaPfFagXUIvbm+r0gnA/pc5ZRjbKPJbL1YnsB1k0cs
	 gmOnmfk6OL9M69yKCx5tcDe5DgjCom7LJ6vRsHyLZmzdwQUeNLLisQp4r+ax0OyvkE
	 GXJG4802s6L8g==
Date: Wed, 11 Mar 2026 11:01:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mp2985
Message-ID: <20260311-provocative-vehement-macaw-45f9c1@quoll>
References: <20260309090041.452957-1-wenswang@yeah.net>
 <20260309090215.453396-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309090215.453396-1-wenswang@yeah.net>
X-Rspamd-Queue-Id: 4FAAD2624A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12298-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[yeah.net];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,yeah.net:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 05:02:14PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Please version your patches correctly. This looks like v2. You also need
to provide changelog under --- or in cover letter. I will ignore further
versions which are just same postings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


