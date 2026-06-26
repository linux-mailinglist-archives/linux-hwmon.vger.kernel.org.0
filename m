Return-Path: <linux-hwmon+bounces-15374-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fk16OyYvPmo5BAkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15374-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:49:59 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E07926CB11E
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:49:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=dkGxPK9Y;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15374-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15374-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91D61302333F
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DD93E00A3;
	Fri, 26 Jun 2026 07:49:34 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED93DCDA6
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:49:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460174; cv=none; b=CZXY88xTImzTKnMSfafIRfu/tBupCVx0PTTx9tSvmAvFMTx4InYnIEsJqeAcv+xIImvPjLT8qOyO4IQW+n9L2u7E6n2XRPL77LtuQE0yv57LYDyh/zoDPewUtXV2fIbJimECH+KFVEmkPrI3Lds80caLsaSlzUT18MYeMBBX8NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460174; c=relaxed/simple;
	bh=dvFcYGe6L1idfk9wGMYrduqPaQs0l4aNwLSYhUvK3AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQA+jkEtuonXo1Sm4t1QBBwk/9AQeLhWoZRflYWg7gOouNZtaznxmRBpJg7oM/fgLZ99DCHdJc+pd8kdGyg1p5D+b0VvB1jcLToTLgo5MuSvKnXDz5AvTxRMFnJRuvzEm3GQ145Dr5Ov6gjmEhTdBAvtmy/cB9XLcQUmuFi+GEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dkGxPK9Y; arc=none smtp.client-ip=91.218.175.174
Message-ID: <2b620c1d-af40-4813-9df0-b63adb1161b5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782460170; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Di4YVjFIZfU5+zAiTbJY2s0en/y+uu5qey0tpETgvQ=;
	b=dkGxPK9YoXJRxPyNDIjKx9iLBIQYNTsCpeXMyGgXb0b9XB2wV78ochqztm7CbfsAK1GmkJ
	3vVmKr5xXIod8LEJJZPBspf0sNzRwT3I2i+8wsh9og6gPxRhX6WK/jlG7BFC0bXhGhTuMz
	+GmR5Wr/t4EJVAGtrBxxUSsrO8Hcfbk=
Date: Fri, 26 Jun 2026 10:49:25 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: mazziesaccount@gmail.com
Subject: Re: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
 <20260626073347.A06981F000E9@smtp.kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
In-Reply-To: <20260626073347.A06981F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15374-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matti.vaittinen@linux.dev,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	HAS_REPLYTO(0.00)[mazziesaccount@gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E07926CB11E

On 26/06/2026 10:33, sashiko-bot@kernel.org wrote:
> If we evaluate m = round(k / 10^(-3-R)) for a value of R=-2 and k=35119.94,
> it yields 351199.4. However, the actual code below correctly implements the
> value as 3512, which implies the formula should use multiplication rather
> than division.

Gah. I think Sashiko is right. The fixed comment should say:

m = round(k * 10^(-3-R))

-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

