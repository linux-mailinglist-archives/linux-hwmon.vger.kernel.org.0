Return-Path: <linux-hwmon+bounces-265-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B037FFC07
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Nov 2023 21:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84BF0281985
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Nov 2023 20:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D2453E20;
	Thu, 30 Nov 2023 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="d+Jj3VDN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA301707
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Nov 2023 12:11:52 -0800 (PST)
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id 8jr7rzSzsKOkL8nO4rzf5C; Thu, 30 Nov 2023 20:11:52 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 8nO2reF4Jb8Qn8nO3rNVpM; Thu, 30 Nov 2023 20:11:51 +0000
X-Authority-Analysis: v=2.4 cv=IuQNzZzg c=1 sm=1 tr=0 ts=6568ec87
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=8XV0R0IcXUXM6S+KMni/4w==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=D_DyhH66oRLAoVLZ2qgA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=nlm17XC03S6CtCLSeiRr:22 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VioC3Ta8ap+RuX1rn3nglyiT8PrIagtDDhEB/ESidJs=; b=d+Jj3VDNDyhm02DfgebKbxqgHA
	DhqFvPrhcDGjsr72KVOh3vt29CTvIWrC/gepfmjYbNBC9uOJlr+DhVDDKImA0ZXZ7rqkIK7SbJ9oa
	TIUpDnTZtIVSHoVe/CrpLCe9nSGTM0o1taLh4SNXlTfEpUrHOaiSnNIe5vYPmxk1A3XFrpT0EaF6X
	WPm9NAXuLrqHEt3uWAZ12GKz0Yb13sFZQeGzFSWx1zueMol6iliMsNytnHxpWITv+MdAhY7P2iePS
	B2wCCG4Ukhg1EGWh2D9r4QbNIbF9vdzsGbpnr8lGERrVwz2ShuyS8fMvRnjW2NR1I8NSmS6bklxfZ
	EjYFc4bw==;
Received: from 189.215.208.186.cable.dyn.cableonline.com.mx ([189.215.208.186]:2120 helo=[192.168.0.28])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r8nO2-0021Hn-0d;
	Thu, 30 Nov 2023 14:11:50 -0600
Message-ID: <cdc00899-cf44-44dd-b708-6cf7dc4b8375@embeddedor.com>
Date: Thu, 30 Nov 2023 14:11:49 -0600
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pc87360) Bounds check data->innr usage
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jim Cromie <jim.cromie@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20231130200207.work.679-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231130200207.work.679-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.215.208.186
X-Source-L: No
X-Exim-ID: 1r8nO2-0021Hn-0d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 189.215.208.186.cable.dyn.cableonline.com.mx ([192.168.0.28]) [189.215.208.186]:2120
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 17
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFBBWKSUShqRnxjDWD4VJSWXso9nI6R+2vA6Bikrj4S4rlkoeUp7IIzKbQmOKwfi5rjf46LtJB5VEwAOEmvlRrNxCx9ZC2iP5U+x/kNFxH6RrBF9mc2P
 E0jG9YIxd15j+oPNytbXeiqvTLPOh+gbBuZgGn60ia2bwbkMU0YV0MbFQlI7rtI6f+x3APPUhOTVzPZlr/9P1wHhhy6BTygg4vFqB2yGiacSUDcv8QsoeRQi



On 11/30/23 14:02, Kees Cook wrote:
> Without visibility into the initializers for data->innr, GCC suspects
> using it as an index could walk off the end of the various 14-element
> arrays in data. Perform an explicit clamp to the array size. Silences
> the following warning with GCC 12+:
> 
> ../drivers/hwmon/pc87360.c: In function 'pc87360_update_device':
> ../drivers/hwmon/pc87360.c:341:49: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
>    341 |                                 data->in_max[i] = pc87360_read_value(data,
>        |                                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
>    342 |                                                   LD_IN, i,
>        |                                                   ~~~~~~~~~
>    343 |                                                   PC87365_REG_IN_MAX);
>        |                                                   ~~~~~~~~~~~~~~~~~~~
> ../drivers/hwmon/pc87360.c:209:12: note: at offset 255 into destination object 'in_max' of size 14
>    209 |         u8 in_max[14];          /* Register value */
>        |            ^~~~~~
> 
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Looks good to me.

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/hwmon/pc87360.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pc87360.c b/drivers/hwmon/pc87360.c
> index 926ea1fe133c..db80394ba854 100644
> --- a/drivers/hwmon/pc87360.c
> +++ b/drivers/hwmon/pc87360.c
> @@ -323,7 +323,7 @@ static struct pc87360_data *pc87360_update_device(struct device *dev)
>   		}
>   
>   		/* Voltages */
> -		for (i = 0; i < data->innr; i++) {
> +		for (i = 0; i < min(data->innr, ARRAY_SIZE(data->in)); i++) {
>   			data->in_status[i] = pc87360_read_value(data, LD_IN, i,
>   					     PC87365_REG_IN_STATUS);
>   			/* Clear bits */

