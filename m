Return-Path: <linux-hwmon+bounces-3155-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08926934141
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Jul 2024 19:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38E831C20DDB
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Jul 2024 17:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8A11822E1;
	Wed, 17 Jul 2024 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIc3rLk8"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74B181B9A
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236494; cv=none; b=bpKoj7lEFiWFLdx8+46Csvt1KV2aYwHb/AXLb9o5PrAG8ArhM61SamN+NX/3HU86M06BqUeqkHwhez+bh+AeBZdpgYVfMhvBeMWm61QOTMMdM5GfudyAbxdmF2d1VowjEI0P9wEa39Kx1eQUZ6dY3p0bP66L2KHz+yNk3B48TG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236494; c=relaxed/simple;
	bh=Uzs8OspFzmyITuCUQuTzVnyudfeeH2WxlWjnDqfhTgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+2SeuFxEN6wiTHzN2qq0GPlnzIjZzRXvJW0BJL9Q7NHy8YeKlXSWQLi6Eqtn2ilQDYwXsedIF5MNGN3a9XlBxxSKHcVp+Op7Uo/cbclXFO1vf98xlzXtDVqt2KxGKcEr6bCMOkBKZkETThsZMPJ82LVnY8d8wU2X+59x29dJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIc3rLk8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso487672a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721236492; x=1721841292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TURCm4Bc4EF8ZbvhY/Ve4x1FtqxdyGvfqCxGqxE90IE=;
        b=jIc3rLk8InwDpAJYBCvPV+dEZICys0OCmZV5dOV2GhiYlKofiwcvTqPdkn0R7XIl1v
         9qcE4sUAd69EIg8EIwVMGF9zuWY9y+pgRc6z23oFidOVTfpELKE/TqIOeBrXvasFgAcg
         NAe3mu+btctP/BOEZpA1MC9M6poazhmeElN+LBYUbADPzhnWdotmNh6mkM9eUEIk7DEb
         +xUk8vwfzuTrVnGrvOIt28DfIxOno6Mjm2NDIeV+vrGk5AnHFCUA+Lep+S8W3LVqIBhN
         DLB26KxWZR1M1WeXWW6fceCdCOj2xmY2wIvWTSbaFQBOE2awKwDq8ElrRTJTdcjgE+nA
         I61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721236492; x=1721841292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TURCm4Bc4EF8ZbvhY/Ve4x1FtqxdyGvfqCxGqxE90IE=;
        b=igxz2ODZtmac7uTxIRML+8lzDYdz/IDPYAN+muBHGVHrhsKyVkmTlM1fz0hg94Vq95
         UmgYILnQij6QqFH6QyvrJhEij7hsjM55wtuDCP6brOZpOeziy5I46ZuDrol9VXUmu/uM
         KzldmCArGq2Vpj9obun8tO3E0JcDafZD5It63p8y/zZzy6D+yq2b1QX0eprYBlzbOQ8D
         vTNL6i3EL7xydWowMVlpE0l7F/1IEyUcklDYgm+eqYrvdgeE9sa/5chfpFXPCgTsBWKk
         xO86ihRggK2NMFCkxcw3FGPtHdzMCOHAL0H6ig+yr/Mp/pHtbpJw1qC+HrPpb/dvVjpq
         kRnA==
X-Gm-Message-State: AOJu0Yzwo0wcnXFGgn1I0H0U1YmmYktVAFPkfvo4nZnOCJOcDVlAIHmP
	KB9eVrU2bH2HIfpNOVBFhFFt6eQBRTEX4+twwSGIydIbmmL9DqQsWr4ZWQ==
X-Google-Smtp-Source: AGHT+IF0oM181bQ8Of07yb2LL8cLkoCL+MMlRbzcE7Sbx9rltxpUJ03oFjjhecjGVCnfsBD846QylQ==
X-Received: by 2002:a17:90b:238a:b0:2c9:77d7:261c with SMTP id 98e67ed59e1d1-2cb529511camr1772444a91.44.1721236492100;
        Wed, 17 Jul 2024 10:14:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb60187871sm185530a91.48.2024.07.17.10.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 10:14:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee004cd9-6682-4049-8cc8-f6389ce5c835@roeck-us.net>
Date: Wed, 17 Jul 2024 10:14:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] hwmon: (max6639) Use multi-byte regmap operations
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-6-linux@roeck-us.net>
 <ZpfIwpmmte8PUrjk@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZpfIwpmmte8PUrjk@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/24 06:36, Tzung-Bi Shih wrote:
> On Tue, Jul 16, 2024 at 04:00:49PM -0700, Guenter Roeck wrote:
>> @@ -88,25 +88,16 @@ struct max6639_data {
>>   
>>   static int max6639_temp_read_input(struct device *dev, int channel, long *temp)
>>   {
>> +	u32 regs[2] = {MAX6639_REG_TEMP_EXT(channel), MAX6639_REG_TEMP(channel) };
>                         ^                                                       ^
> To be consistent, either drop the space or insert an extra space otherwise.
> 
Good point. I added the space.

Thanks,
Guenter


