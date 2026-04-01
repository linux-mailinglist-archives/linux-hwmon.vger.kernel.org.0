Return-Path: <linux-hwmon+bounces-12983-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM1tIOPKzGn5WgYAu9opvQ
	(envelope-from <linux-hwmon+bounces-12983-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Apr 2026 09:36:03 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC02376043
	for <lists+linux-hwmon@lfdr.de>; Wed, 01 Apr 2026 09:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C95F30F7693
	for <lists+linux-hwmon@lfdr.de>; Wed,  1 Apr 2026 07:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF7C392C23;
	Wed,  1 Apr 2026 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBcP5VxT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137163806AB;
	Wed,  1 Apr 2026 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028643; cv=none; b=QgFFZR0O/tnAcguFs8mhFdy2D+s501vyTsjy1KpaIsjxJU02cC+K1EKFyG8JsMjBMh6BdWQoCeB46eO81yspnyrHp153R8T///oSbfXbwP3DFA0JQsG+dT+z4c0KNTfmbd9zg67M3HPJy0v8U97Rx4T8mzHIQ45A8EbQiznRKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028643; c=relaxed/simple;
	bh=L73nS6oMrPdKteMWnmYHL6RfHKPTssTEXNzH4IVY5gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Useu34/hFBsFT1+E3wuZHuDt2528+bLNBFpq6XBlwTgKYzy2vT7f0IulQZp7QdnDTMPvfszwaix303OHVllQfMz/AvtyxpeAm1++RkJKJBrpuNJZWB5kma1l846bZW44UnSmkZWuT7zLwrD89tyVG0UwAABy/FtdLGgQokTeQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBcP5VxT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E5DC2BCB2;
	Wed,  1 Apr 2026 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775028642;
	bh=L73nS6oMrPdKteMWnmYHL6RfHKPTssTEXNzH4IVY5gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBcP5VxTs39Pr5v9YOhLUQtoGE4xjr/GYUhJYSA43bpLPVqlaz5riAtuaQcRcvPoR
	 7czvJi0cwngk+NR7ykfGQMJlpseppyY/KGqc+nGGPFnMj6aJk7UJpuxAiX53feX3zb
	 W2P9v5wyRTcmGthrCg9PCebnJkp2lHpWIQiHNsuUw3nhMEMUrpp3+ExFJVYBMhhV07
	 cdPlAsObV9U+vCtLYJMuk6j5vOt/MKNKl3ss1T+6tBq+JBWdMxKCYszxqvpVvsCM8L
	 gwlTQLKBL1owc/fz5Cn85U75gA1nVwgSdWMUuTDb4MMcGlQH2Z4+8FiVLAx8CUxaF2
	 Mlgaoc/7JfoRg==
Date: Wed, 1 Apr 2026 09:30:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@roeck-us.net, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add sony,aps-379
Message-ID: <20260401-rich-placid-bat-896ab7@quoll>
References: <20260401024214.804237-1-chris.packham@alliedtelesis.co.nz>
 <20260401024214.804237-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401024214.804237-2-chris.packham@alliedtelesis.co.nz>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12983-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alliedtelesis.co.nz:email]
X-Rspamd-Queue-Id: 0EC02376043
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 03:42:11PM +1300, Chris Packham wrote:
> Add the compatible string for the sony,aps-379. This is a simple PMBus
> (I2C) device that requires no additional attributes.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


