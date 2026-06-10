Return-Path: <linux-hwmon+bounces-14929-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvNYA0i7KGo4IwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14929-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 03:18:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59331665289
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 03:17:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14929-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14929-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83AA0307EA32
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 01:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146AD229B18;
	Wed, 10 Jun 2026 01:10:49 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33602264D9;
	Wed, 10 Jun 2026 01:10:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053849; cv=none; b=ccVywCd6SiyUT7t52GKrZTiV0pufaOzGRg9IU8oDYjfjaWnG4hk1dt3HyoGCOpQTCDuGofCylcqX4XRRablS+TkgnqeROEvBdKSK8KApuLjAtetV5A4K+GmWS2Eu6Ve2n6mkLw7jZGVG8AbVPInKn5NWvMS6mug722Q5eUbCGYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053849; c=relaxed/simple;
	bh=oVQZBJcgKKmiJSdMAgWZEIpuHRSN9TmyTjkiyQSIXPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GgfMvUwPqmpVHoN/T+WaLXNhG/Acdzc89fPSHpK3vLQBTNi3DpYeMx6KmqR1KNPhqUm5XrPvpxJDaqmvskN0RlTzxwmqTdV4Mm+exFWK4uf4YTJiQkyERBiDIxcptaOmtVtK58DZQTPRx84mbjA/dQ0kjXA4Vu9UHdfSccJNhL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
X-UUID: 32a647ba646911f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ead17a05-2c68-4da8-a42b-52d166f82f48,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:df4da319c0e1f5e30787a71289f2ac46,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:11|94|82|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 32a647ba646911f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2114591673; Wed, 10 Jun 2026 09:10:40 +0800
Message-ID: <e8bb6993-e533-406e-a389-5bf5d670a93e@kylinos.cn>
Date: Wed, 10 Jun 2026 09:10:38 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
To: Cryolitia PukNgae <cryolitia@uniontech.com>, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
 <305E2395B7027B5B+e851d97c-2af5-4752-8c1c-7f92884fe874@uniontech.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <305E2395B7027B5B+e851d97c-2af5-4752-8c1c-7f92884fe874@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kylinos.cn];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:cryolitia@uniontech.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xiaopei01@kylinos.cn,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14929-lists,linux-hwmon=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopei01@kylinos.cn,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59331665289



在 2026/6/9 23:41, Cryolitia PukNgae 写道:
>
> On 6/9/26 07:41, Pei Xiao wrote:
>> The EC firmware is expected to return values in [1, pwm_max]. A read of 0
>> is illegal and would cause underflow in the conversion formula. Explicitly
>> check for 0 and return -EIO.
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/hwmon/gpd-fan.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
>> index d1993cd645cb..decb61936b95 100644
>> --- a/drivers/hwmon/gpd-fan.c
>> +++ b/drivers/hwmon/gpd-fan.c
>> @@ -341,7 +341,11 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>>         gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
>>   -    // Match gpd_generic_write_pwm(u8) below
>> +    /* EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid
>> state */
>> +    if (unlikely(!var))
>> +        return -EIO;
>> +
>> +    /* Match gpd_generic_write_pwm() below */
>>       return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>>   }
>>   
>
> Have you ever tested the behavior on a real device? When it returns 0,
> what state is the device in? 
>
Hi Cryolitia,

Thanks for your  messages!
Yes, this is not an issue, but this problem was reported during the Sashiko
AI review.
 The maintainer suggested I take a look. After checking, I think it might
be better to add a check: 
if it's 0, just return directly. In case some EC returns 0 someday, causing
an underflow, 
returning an error code would be more intuitive than returning an incorrect
value.

https://sashiko.dev/#/patchset/cover.1780880972.git.xiaopei01@kylinos.cn?part=1

Pei.
>
> thanks,
>
> Cryolitia PukNgae


