Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6974B16D47
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 May 2019 23:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbfEGVtU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 7 May 2019 17:49:20 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46859 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbfEGVtU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 May 2019 17:49:20 -0400
Received: by mail-pg1-f193.google.com with SMTP id t187so4844842pgb.13;
        Tue, 07 May 2019 14:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MNXmqOJQAJof0zhxXE2E8ZtY5vE7SIeApoOEVP2KIPY=;
        b=IJ/47BT5wjxuMrJmS+QSbjNZtDkACxB9ZcOlVVQqttJFn8uYJzB/NddnJzVGVRxJPV
         nPFbYJUgFaO/jgGoa+5j80l6GwRpuVEsyeG+rFIwZnxT25xtSgmYG7U371DnhD3VpmYB
         U6UD2fA65peILKjpKCCKGV8yGRWzTDpiUG0l8AIwCdl7XvMHguJlEP0Orq17UhDl1uYS
         3gBnR/otf+WTOdMMeJJbnrdxnhuDdt9ob5UgBfsiRvFOrLB52vZkU1/xLiy1SNIvz2a6
         j/wR5RMzrg8BIr8++nDS0MpSJxa1Amdb6re+uxc++eLN6itVY6xcEvpGZfBur1nKNg7c
         Ozww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MNXmqOJQAJof0zhxXE2E8ZtY5vE7SIeApoOEVP2KIPY=;
        b=TLe+QsPrsYljSBhBWSRWP0mrddK/q8XLZnWdWCIbklhWeKzh6rvKm47zgyCQWU3Wlv
         WkEXz5xwFVGBPNkylx/rpujQHi/o/NmO4M+D8TI1fmp7oWozVKsfwzRR5tKr9RZDyEoq
         XhJl37OLkF3hCUkAbOJ9taER+Uyfm8+gZrbfUGeuEjNFyXIk+MBjxVi3+GnwN02K3TY5
         ffN/7UPFfEo7XD0UmyQCLFwBi2TZojDZxrMqXLtBG+1wbuLlSepYE1XXkwgEBxFIopic
         6zd1QpeNNS+8JQmZqC+uD1FJX5gQx3dJ95itjEsKjfPL9hojnkQRHW+wZddaIqfrHNhr
         PZYg==
X-Gm-Message-State: APjAAAWZ0LD3eOv9uxYs7Clh9jPPBt4n51+AUGodhKorE77bWsz43lQs
        rvJ/qWrSOVOnzdao1dB8zsY=
X-Google-Smtp-Source: APXvYqzE57ZUjJkVB4qLXv2F66a+UyTqqHVYCsSU1YS6xKgymKOIWxGT3r7/xLadpclo1kykJMgH4w==
X-Received: by 2002:a65:49c7:: with SMTP id t7mr19051626pgs.324.1557265759006;
        Tue, 07 May 2019 14:49:19 -0700 (PDT)
Received: from [10.67.49.27] ([192.19.223.250])
        by smtp.googlemail.com with ESMTPSA id i129sm18472897pfc.163.2019.05.07.14.49.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 14:49:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] kernel: Provide a __pow10() function
To:     Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com
References: <20190507193504.28248-1-f.fainelli@gmail.com>
 <20190507193504.28248-2-f.fainelli@gmail.com>
 <20190507210654.GA4951@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <b3c4fdd3-0c91-9681-e471-a9ddbbd256c8@gmail.com>
Date:   Tue, 7 May 2019 14:49:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507210654.GA4951@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/7/19 2:06 PM, Guenter Roeck wrote:
> On Tue, May 07, 2019 at 12:35:02PM -0700, Florian Fainelli wrote:
>> Provide a simple macro that can return the value of 10 raised to a
>> positive integer. We are going to use this in order to scale units from
>> firmware to HWMON.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  include/linux/kernel.h | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
>> index 2d14e21c16c0..62fc8bd84bc9 100644
>> --- a/include/linux/kernel.h
>> +++ b/include/linux/kernel.h
>> @@ -294,6 +294,17 @@ static inline u32 reciprocal_scale(u32 val, u32 ep_ro)
>>  	return (u32)(((u64) val * ep_ro) >> 32);
>>  }
>>  
>> +/* Return in f the value of 10 raise to the power x */
>> +#define __pow10(x, f)(					\
>> +{							\
>> +	typeof(x) __x = abs(x);				\
>> +	f = 1;						\
>> +	while (__x--)					\
>> +		f *= 10;				\
>> +	f;						\
>> +}							\
>> +)
> 
> Kind of unusual. I would have expected to use this like
> 	f = __pow10(x);
> ie without having to provide f as parameter. That would be much less
> confusing. I assume this is to make the result type independent, but
> I am not sure if that is worth the trouble.

Correct, that was the intent here.

> 
> Are there users outside the hwmon code ? If not, it might be simpler
> to keep it there for now.

There appears to be a few outside actually:

drivers/acpi/sbs.c::battery_scale
drivers/iio/common/hid-sensors/hid-sensor-attributes.c::pow_10

There could be others but those two came out as obvious candidates.

Would you be okay with a local pow10 function within scmi-hwmon.c and a
subsequent patch series providing a common function?
-- 
Florian
