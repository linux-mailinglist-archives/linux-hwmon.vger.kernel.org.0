Return-Path: <linux-hwmon+bounces-14932-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EHIJFma+KGq7IwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14932-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 03:31:18 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CC66539E
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 03:31:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14932-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14932-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A658E30242A3
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 01:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B59282F15;
	Wed, 10 Jun 2026 01:30:19 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4D274641;
	Wed, 10 Jun 2026 01:30:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055019; cv=none; b=ZgWgYqvpb0M/rh6zMu7CJlGKcqdbt0M9ipivpYTVPbs+acW6DG3C19Sk1B+yMSF2XtCPp/GCU9Q4xVic4oPyngZ18KIsSHxvH62AC/saq4Ep746ES64I0OcqVIH7crCCerfQSFSOi6Lz6vzOF67l1rWWSJx3BDyhy0RX9Q6NlTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055019; c=relaxed/simple;
	bh=adyDg95CcbrCQItINGOQkFToVLkhhusPqPpEwHU2yCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EnRurlikAyDdaETzB2jrV1AVbJr1FiP45bp7B3AQ8H3ICjjQS0AESOXvyqdUd/6vxRGPlANWdbOokKPTKuxhgobQ5bMqaRBs4ml96KxWPkspwJZUtlXzG5mJHB5HXhXsCYS4+56+NbTSDgEBHtM+xrnCRa/jQKrs/JllG1/hXSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
X-UUID: ec5c6dcc646b11f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0c500c87-0653-46e9-bd26-7ea4ba86a9fe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:0a275638040955382dc145ab31fdca1c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ec5c6dcc646b11f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 147545425; Wed, 10 Jun 2026 09:30:11 +0800
Message-ID: <f0d42e9e-74f7-4b94-968c-a5a22e28f2d2@kylinos.cn>
Date: Wed, 10 Jun 2026 09:30:09 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] hwmon: (gpd-fan): drop global driver data and use
 per-device allocation
To: Guenter Roeck <linux@roeck-us.net>, xiaopeitux@foxmail.com,
 cryolitia@uniontech.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1780880972.git.xiaopei01@kylinos.cn>
 <tencent_E4CE09DC1CB1AB4C0411F71B9507E4A49706@qq.com>
 <e10eb414-082e-4747-8083-77b1a3b8c934@roeck-us.net>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <e10eb414-082e-4747-8083-77b1a3b8c934@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:xiaopeitux@foxmail.com,m:cryolitia@uniontech.com,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[roeck-us.net,foxmail.com,uniontech.com,vger.kernel.org];
	FORGED_SENDER(0.00)[xiaopei01@kylinos.cn,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-14932-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaopei01@kylinos.cn,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foxmail.com:email,vger.kernel.org:from_smtp,kylinos.cn:email,kylinos.cn:mid,kylinos.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 477CC66539E



在 2026/6/9 21:04, Guenter Roeck 写道:
> On 6/7/26 18:40, xiaopeitux@foxmail.com wrote:
>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>
>> replace the global state gpd_driver_priv with per-device private data
>> (struct gpd_fan_data) allocated in probe. This allows the driver to
>> support multiple instances in the future and aligns with kernel best
>> practices.
>>
>> No functional change intended.
>> ---
>
> I got:
>
> Commit
>
>   beb0e2d1add1e2 ("hwmon: (gpd-fan): drop global driver data and use
> per-device allocation")
>
> is missing a Signed-off-by from its author 
>
hi Guenter,
    Sorry for wasting your time.
    I made a mistake. I thought the content between the
first |---| delimiter and the second delimiter 
was invisible to |git am|, and the content between the second and third |


---| delimiters was visible, 
so I lost the |sob|. I will resend version 4 with my |sob|.

Pei 

> Since it is the first patch of the series I had to drop the entire
> series.
> Please resend with proper tags.
>
> Guenter


