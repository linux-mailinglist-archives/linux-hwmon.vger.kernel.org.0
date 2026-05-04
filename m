Return-Path: <linux-hwmon+bounces-13756-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDPULxt1+GlavgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13756-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 04 May 2026 12:29:47 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 551224BBBD9
	for <lists+linux-hwmon@lfdr.de>; Mon, 04 May 2026 12:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C74830158A5
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 May 2026 10:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD5E3A380B;
	Mon,  4 May 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh1i5ALX"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589533932D1;
	Mon,  4 May 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890583; cv=none; b=GPhfzetIclDUWGRh62IRRJglTmYLIZhMpSwqcRzocIpOimvAKMmfqvdSFyCpH9Q5/XQnWVvtYNMeP80uvIkkG297tVrhI742awbCNOahM1pyE1xwT/o5RUDVdl9oSMGMy/1G0VB1CUyaBnefHwlpDeHxV9+++7NVSdfrTWn59/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890583; c=relaxed/simple;
	bh=qCOTeSiJkyj/atJ5cX+qcXCY1JXohAgIRddRFVjHtsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeZHLZ+BCoQPieydTv61gPbvJgtPR8FDGNpxMQwcgnM5bRWQbDrOHZ96ZNhR7VD+Wl4pyNoQpZ0AFKailuoWUb8YIomBM5ryNvcaTx4n/LfPYd2sZAWQQdo9IaGtCDHDtHDbgdt/gwI32WgD5/P8mGk00wWH7dyvjQelU6zV4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh1i5ALX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66624C2BCB8;
	Mon,  4 May 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777890583;
	bh=qCOTeSiJkyj/atJ5cX+qcXCY1JXohAgIRddRFVjHtsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nh1i5ALXCUiQj1Dyq0qyOYmt/KZyqiO6B85SQ5WACiEpZxiTPhU6zsvOg8KlRM4LP
	 mWzGo+OSDecrI0q+2eoSbuN/lrKysq448WXDxY5OTCmiky1/aHy/M8cy6YKVbmj+j8
	 qc4s3prx6Hpgpvz1F9UNwouh/vghceIRK2owW1foBRPYa5mIIfbu/1ZVn0snY2bJde
	 NnGl9SwsHx/j/fR40KPzatR1wiK3GuDLZ6MM66BCa6D0EO2rKQozg4XXAtVLioFErm
	 9svYy3YMPgUjc3QqwY8eptpJ9hc3SF8jWBiAIj0CvwJnUPJhLkptPKYNRUacd/ined
	 j6HPycigpcX5g==
Date: Mon, 4 May 2026 12:29:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adam Baker <linux@baker-net.org.uk>
Cc: Manish Baing <manishbaing2789@gmail.com>, linux@roeck-us.net, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: zyxel,nsa320-mcu: convert to DT
 schema
Message-ID: <20260504-auspicious-grebe-of-awe-2f6ad2@quoll>
References: <20260501102116.8275-1-manishbaing2789@gmail.com>
 <56d985c5-e795-4108-9045-c7b3ab8f71ae@baker-net.org.uk>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56d985c5-e795-4108-9045-c7b3ab8f71ae@baker-net.org.uk>
X-Rspamd-Queue-Id: 551224BBBD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13756-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,roeck-us.net,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baker-net.org.uk:email]

On Fri, May 01, 2026 at 10:53:22PM +0100, Adam Baker wrote:
> Acked-By: Adam Baker <linux@baker-net.org.uk>

Difference in case: Acked-by.

Best regards,
Krzysztof


