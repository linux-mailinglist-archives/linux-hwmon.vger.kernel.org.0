Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1AA1A3BE0
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Apr 2020 23:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgDIVXt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 9 Apr 2020 17:23:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37064 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgDIVXt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Apr 2020 17:23:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id u65so114265pfb.4
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2020 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yL0OhmUu6d0arJqT+Bp+sovcnmZw2sYB3OolA8stCrc=;
        b=OIdeT5PaB0TJwD9WYhy8NNJ3hNNKrcGaHTzLKJi8lEpEqRkzL1fj/AIYepfn4eCgoj
         YejDUW+hV7SzOZo6lAIcgzP/I5dVzLT2Wfh/Rj1w+HkuqaLy696T7Tm4DJmW+YSsQET/
         THAWHuV6QRa8NfikhJ/Is78PSGXLdvcxNE6MioHzQ88iZbUrcYM8aGspKMr5Tao2+JgG
         477bIqig+75tqia6thsJsYCLoqlG8nVdPRCCdFixFnc/OiRAuR2jDZToy+UdSUQJ8gFS
         3B7c8F5AveQ+0WBM9w4kFnXKYIPV/ptT3zddxm/R7dI8/h9ui4MhE1GnX6wuVKKE7TsY
         6XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yL0OhmUu6d0arJqT+Bp+sovcnmZw2sYB3OolA8stCrc=;
        b=XsN17Dd0h60/LibzUI0cyB4A9S2fx02iBSRqNFRtnpKRM6ucX3i3zUyM+xUfxP1ewe
         XtretsqSMXyIcLFHY00HDU27hz9Mnv0ijDIdOFOYC9/EtytkCzx/ERURaO5aG6ZxEb1f
         YwPY3hssH9ZRDv9qjIkGeFMTpDrWucwo4Qo21FxkdnRKnA28k+UdI2sex0sbO7ipBmHP
         Qtm9uU/JcvtqM10zQyRARNlGXbCfh2E+GlZHWUTEyApmpUMnAjc/TQUt6+1JUMd2mEr6
         MYYFJNPBrk7sIFiMouQuarm07JBstBWyLDG/1dSpKITXkMoNGG/kHLdZGQX2kAEVHLWU
         PkXg==
X-Gm-Message-State: AGi0PuYQECWPLL+a4TwX5GhCb25uz2V5pq1YEZJdqNaOu5f2jFqZlvWG
        ZV0ZT5AIjzKgbMI4swKyHVH/1sV4
X-Google-Smtp-Source: APiQypKO3OgizsKJt5KnSTWSIhs5YVSW54xg8bmrswuEfspJFcIZv2CBAPrxFBNuNyWSr537L2t94A==
X-Received: by 2002:aa7:9698:: with SMTP id f24mr1686174pfk.94.1586467427795;
        Thu, 09 Apr 2020 14:23:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h24sm17334pfo.190.2020.04.09.14.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 14:23:47 -0700 (PDT)
Subject: Re: Linux driver for IRPS5401 - status reg not found
To:     Robert Hancock <hancock@sedsystems.ca>, monstr@monstr.eu,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-hwmon@vger.kernel.org
References: <e303166b-4d7a-d2b9-a5c0-fd4de8d22a49@xilinx.com>
 <44d8631a-618c-a061-d9ca-d8030dd8a420@roeck-us.net>
 <52d41b38-8af9-1496-65dc-c36179a9d286@sedsystems.ca>
 <299872b6-0fcf-3ef1-5b52-41fceb2dcdc0@roeck-us.net>
 <3b1750d0-bb1c-0a37-e1a0-d7c25b4bc525@sedsystems.ca>
 <20200330194859.GA12459@roeck-us.net>
 <b4322641-5918-40c4-a887-dcfa20db1733@xilinx.com>
 <7a10a855-53a2-0743-be7d-86f6030626ca@seznam.cz>
 <087f0821-bcd5-0f85-3e02-2b95721d1c2d@roeck-us.net>
 <8afd61bc-9a67-0f22-2931-5ac9d084ee3f@sedsystems.ca>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ff6483cf-7513-8a2c-f686-5c6782fa50cc@roeck-us.net>
Date:   Thu, 9 Apr 2020 14:23:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8afd61bc-9a67-0f22-2931-5ac9d084ee3f@sedsystems.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/9/20 8:30 AM, Robert Hancock wrote:
> On 2020-04-09 9:16 a.m., Guenter Roeck wrote:
>> Hi Michal,
>>
>> On 4/9/20 7:29 AM, Michal Simek wrote:
>> [ ... ]
>>>
>>> Just to let you know issue is with i2c driver. Here is my output for the
>>> record.
>>>
>> Thanks a lot for the update.
>>
>>> irps5401-i2c-3-43
>>> Adapter: i2c-0-mux (chan_id 2)
>>> vin1:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>>> vin2:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>>> vin3:         11.56 V  (min =  +9.00 V, crit max = +14.00 V)
>>> vin4:             N/A
>>
>> This is interesting; it means that the rail is not active (?) or
>> not supported, or maybe even that the driver has a bug. The second
>> chip reports a value here, so I guess the rail is inactive.
>> If possible, it would be desirable to detect this during probe
>> and not try to report values for this rail. It would be great if
>> you can find the time to figure out what is going on.
> 
> I would assume that either that rail is not used in that board design and was disabled in the non-volatile config on the chip, or alternately the chip allows combining outputs C and D (i.e. 3 and 4) into a single output in which case only one will report valid data. Not sure offhand if there is a way to detect those cases from the PMBus interface at probe time.
> 
I think it may be the output disable register (0x38). One would have
to know the i2c address, read the register, and set page bits
accordingly. Overall, I am not sure if it is worth the trouble.
Maybe we should just just add a note to the driver documentation.

Thanks,
Guenter
