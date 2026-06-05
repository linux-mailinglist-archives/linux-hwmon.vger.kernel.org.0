Return-Path: <linux-hwmon+bounces-14723-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LXqVE+BSImpyVAEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14723-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 06:38:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D20876450D4
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 06:38:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=VG16cajz;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14723-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14723-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E193B3007F5E
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 04:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEE737756F;
	Fri,  5 Jun 2026 04:36:21 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EAD224234;
	Fri,  5 Jun 2026 04:36:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780634181; cv=none; b=ttWv85xjYSpqGJKaPeX6t4oSnNlBJulG+EW79aw4eMsVdpVNRzg7ylWNewrfx/aMiuIZK8cegbxeW5uVWbxYv3RREkJOLwzBJUu0j3br70+N5ta0qTGnpmPocbO+qLKn7yk8Vp5NFTwzBloHH7savVV4nqMWKJpXoIssz2PiONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780634181; c=relaxed/simple;
	bh=oxduxq9szg4PERgzx+80PHE84fuVUetm7puv7+IDhbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqgn2qrmrRJlEOQCbqVxRH/sHDP5oze3wiX5A/s/G7mmg8H9xstxRX2d0ZqtSaMhfvG3dbzFcByDAj6k5vhPi5REuNKr5xaCm40W7cdvJOvfDVim2WqwZA/99BCGrUZePZ/xK8z2MqgsSU6elLKSgrV5qYGhLqWZO8vQ4Van80U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VG16cajz; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8yg29xdfWEix29X7YVI5IhW6C7s2qrb4kLGfBOiza4w=; b=VG16cajz50ByIGB0wS4MuR43n1
	F54JyWb6zi5Fvo22iwAx4s09ss7fhwiPdzlmmqU4Cm0TZHHkld6fipejjJBneTWZSk5Kjt9Ryxjg0
	vg9HPuGsMycJWyX8h505+WGLsuXrOuZy2ObFoa7Esr28n+XkSpThmtUoJAvAt1JtDGbmgKWR8LD9M
	dXJkGOpojRsOCDI3uP6afLPUvYF230Bo9YP54SJFiBKAGcZ5ZdmXp/l8DSeKEBL0HgKbBes7uJ3jS
	oJ8EkkPLLqrLQFsfFF5IneKZWg+GZTiw8zcqDiHeIxEguE9X5QWrgjHl+Sn/BdCQQj/U9HQAqb6Uq
	J3VUnSwQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVMI4-000000004i1-4AW6;
	Fri, 05 Jun 2026 04:36:17 +0000
Message-ID: <e0193699-e5b2-4400-b55e-5dd0bd62b16a@infradead.org>
Date: Thu, 4 Jun 2026 21:36:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: Add documentation for SQ24860
To: Ziming Zhu <zmzhu0630@163.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
References: <20260605020450.89638-1-zmzhu0630@163.com>
 <20260605020450.89638-4-zmzhu0630@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260605020450.89638-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14723-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com,roeck-us.net];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D20876450D4



On 6/4/26 7:04 PM, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
> ---
>  Documentation/hwmon/index.rst   |  1 +
>  Documentation/hwmon/sq24860.rst | 96 +++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 Documentation/hwmon/sq24860.rst
> 

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

