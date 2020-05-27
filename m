Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D511E3677
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2020 05:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbgE0DXc (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 26 May 2020 23:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgE0DXb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 May 2020 23:23:31 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7AE1C061A0F;
        Tue, 26 May 2020 20:23:30 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x18so8456352pll.6;
        Tue, 26 May 2020 20:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jpdwppDGX8MstjnP8VRZqQebs6Vku8HVmzBOYvGhB+c=;
        b=si5tT+13sqgQs3mkFdK85QyElcFv/vijbjgCpiCHEl8BHHhqfXl5e+aLEuOBL0Tgk1
         Ojq3VM9mNj0oy8m72fE363OWNxjntuhV3hPF55rbDnDzCLaX54cgia0Y3Nzfq+uJozwJ
         KPje2+//1yByfam3kQUVt8AKzWO2nyvO0e3utKDL7qoSjHl3VVnR7bTcYdW0MYIbtqPt
         pi4FJjIWvcZW9lW18OGrWp+eqoCkS53v9gx9IgbOVTOpO11+7VgKvB/aJgwVTe0FEu+9
         Vh7AmfvbxuMALjN4yFBtER+KQKT9fLai96maEGsoukuZ5QahvHcl/uvdyQPGPCvhwFWb
         +T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jpdwppDGX8MstjnP8VRZqQebs6Vku8HVmzBOYvGhB+c=;
        b=mND8Ap2ai0TfcXFjvVzcu+3xyIVdalVro4EF9XHMBql5Vp7swwCYCDVx0dTyaCPnsP
         /6NqHGST5yUfgPhtLOCpdfBuGUubEYnEjTzFTwh/cmYA68EbGAu/CrJ56lKtFGLlIjmQ
         d8AgSHz2a6PpkOg2BKBxyyKYYBEab0NtXtnkIJoFo1/aGltXAZcheNNu9rajvc2KjDb8
         KtKaQxx17oWr7XHgsXsazP/bmhZppPhriUbDknNb46fySEZw/DyCSLbsJWQqMoB9Gy9l
         +TbGx5v7hjGv2eLrS0571oWv1kDuq1AzJfqp2EV3j4r0C8eGT0KfhZcDkS7EBV+iqeoL
         o9kw==
X-Gm-Message-State: AOAM533QXME+Qa9334pCvXF8lDol/x769DnlqDzGRkBstAo4qpwGD+/M
        YJNDmZHmHpNe6NW13RUKMg4=
X-Google-Smtp-Source: ABdhPJylRQt/CPga0uPaST3n+k7RJRf7QMAm01HSTidDdckxjhG/HiJF2vcIufGefGvsp8nv55nW0A==
X-Received: by 2002:a17:90a:26a7:: with SMTP id m36mr2552425pje.28.1590549810383;
        Tue, 26 May 2020 20:23:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v9sm819179pgj.54.2020.05.26.20.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 20:23:29 -0700 (PDT)
Subject: Re: [PATCH -next] hwmon: amd_energy: Missing
 platform_driver_unregister() on error in amd_energy_init()
To:     Randy Dunlap <rdunlap@infradead.org>,
        "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
References: <20200527022417.105620-1-weiyongjun1@huawei.com>
 <BY5PR12MB42125FF6FEE5F146C428E295E8B10@BY5PR12MB4212.namprd12.prod.outlook.com>
 <5b96a406-3aea-fa63-03fb-580011728629@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
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
Message-ID: <8b55407a-f4e6-5333-efcb-c8ea453cb3b5@roeck-us.net>
Date:   Tue, 26 May 2020 20:23:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5b96a406-3aea-fa63-03fb-580011728629@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/26/20 7:32 PM, Randy Dunlap wrote:
> On 5/26/20 7:28 PM, Chatradhi, Naveen Krishna wrote:
>> [AMD Official Use Only - Internal Distribution Only]
>>
>> Hi Yongjun,
>>
>> Thanks,
>> Acked-by: Naveen krishna Chatradhi <nchatrad@amd.com>
>>
>> -----Original Message-----
>> From: linux-hwmon-owner@vger.kernel.org <linux-hwmon-owner@vger.kernel.org> On Behalf Of Wei Yongjun
>> Sent: Wednesday, May 27, 2020 7:54 AM
>> To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>
>> Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-hwmon@vger.kernel.org; kernel-janitors@vger.kernel.org; Hulk Robot <hulkci@huawei.com>
>> Subject: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregister() on error in amd_energy_init()
>>
>> [CAUTION: External Email]
>>
>> Add the missing platform_driver_unregister() before return from amd_energy_init() in the error handling case.
>>
>> Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counters")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
> 
> Hi Yongjun,
> 
> Does this Reported-by: say (imply) that hulkci is doing semantic analysis?
> 
> Is there any writeup or summary of what hulkci does?
> 
The tag is quite common nowadays.

$ git log | grep "Hulk Robot" | wc
    869    3476   41712

https://lwn.net/Articles/804119/:

"At the top of the "by changesets" column is Yue Haibing, who fixed a large number of small problems
 all over the kernel. The bulk of these problems, it seems, have been found using a system at Huawei
 called Hulk Robot, which uses various Coccinelle scripts and reports the results."

Guenter

>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>> ---
>>  drivers/hwmon/amd_energy.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c index bc8b643a37d5..e95b7426106e 100644
>> --- a/drivers/hwmon/amd_energy.c
>> +++ b/drivers/hwmon/amd_energy.c
>> @@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
>>                 return ret;
>>
>>         amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
>> -       if (!amd_energy_platdev)
>> +       if (!amd_energy_platdev) {
>> +               platform_driver_unregister(&amd_energy_driver);
>>                 return -ENOMEM;
>> +       }
>>
>>         ret = platform_device_add(amd_energy_platdev);
>>         if (ret) {
>>
> 
> 
> thanks.
> 

