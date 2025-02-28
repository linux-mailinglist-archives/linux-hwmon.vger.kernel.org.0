Return-Path: <linux-hwmon+bounces-6856-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA224A493A1
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Feb 2025 09:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797A618867BF
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Feb 2025 08:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EFB253B60;
	Fri, 28 Feb 2025 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iXbd+x7d"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68025335E
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Feb 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731612; cv=none; b=tJY2qk0oMxXver7PXfjOwWFCLG6BwH4J8LZKld799gQ8zjXTOPOb0BOhdGIZpCD3tBUwXx4MpI1nPDD/uRGgyicYvgrfbWUmlksuf2lELHk9hMaCDgsAP+IRsMBSh5QEx35cmP+1osusoYmAy/vMjnB/s4MakoqUrHJCdWKK4U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731612; c=relaxed/simple;
	bh=cu6AH0LorBeaUl23UBb152wb7dy61G0HE3t3ldDL6Js=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XED98VNvQhfcHMca57O6c4e+cm76yWnzMHt3VK4HeCtR5dQ3hELPOpoK+8SMJyqGDugzzdZo1KBvw9dmglLU1vZp4sCUdK2iLspQCG+QYrdXqKpw/gaAxzCbS/+2EgZzBAk3PkYi8Cr47Krp8iFJvoLiGIBPCaIjkM/Gb3sHN+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iXbd+x7d; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740731597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AtPhv23CDdC3cqvO+SDmiWTaamG+eaLu24Z75QAy0Dk=;
	b=iXbd+x7dggLGloIEF1pPuzZPzHoGCj+/7KP4rppWrmw8N17BQfVammHDPZLo3LRMcIcyut
	jx8Ys2HrTHgF4FscyQcpVzckPPSwvU7OT1OGt12zuB8iG9nbad//8L9niHPoDNpEGOFMc+
	/E67p0mCF1+FlcKG+ifHWQicatMNSZc=
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] hwmon: (pmbus/core) Replace deprecated strncpy() with
 strscpy()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <25793e9f-211e-4e4e-86ac-88e3b902fb68@roeck-us.net>
Date: Fri, 28 Feb 2025 09:33:04 +0100
Cc: Jean Delvare <jdelvare@suse.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Patryk Biel <pbiel7@gmail.com>,
 Ninad Palsule <ninad@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 linux-hardening@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <4916492F-AE8D-4153-B268-39B86A8CF57F@linux.dev>
References: <20250227173936.7746-2-thorsten.blum@linux.dev>
 <25793e9f-211e-4e4e-86ac-88e3b902fb68@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Migadu-Flow: FLOW_OUT

On 27. Feb 2025, at 23:37, Guenter Roeck wrote:
> On 2/27/25 09:39, Thorsten Blum wrote:
>> strncpy() is deprecated for NUL-terminated destination buffers; use
>> strscpy() instead.
>> Compile-tested only.
>> Link: https://github.com/KSPP/linux/issues/90
>> Cc: linux-hardening@vger.kernel.org
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
> 
> What guarantees that strlen(lstring) < sizeof(label->label) ?

Hi Guenter, I don't think it matters for this patch.

If lstring >= label, strscpy() behaves the same as strncpy() because the
size argument is now one byte larger.

If lstring < label, strscpy() NUL-terminates the destination buffer, but
doesn't add NUL-padding compared to strncpy(). However, this doesn't
matter because label is already zero-initialized.

Thanks,
Thorsten

