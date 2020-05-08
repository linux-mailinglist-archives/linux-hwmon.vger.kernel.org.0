Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629721CA248
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 May 2020 06:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgEHE3p (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 8 May 2020 00:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgEHE3o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 May 2020 00:29:44 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EA5C05BD43
        for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2020 21:29:44 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l12so280906pgr.10
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2020 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q70Gf9WrXA/qKfHLxJiHpIF3YPi8AT+nl2pavMOq06w=;
        b=UmWKDVl3OT00Bdecps9FnUga8/PSTcGnja4DzQl56WFdNfpzwOPhvYzdOeQ2lMe1pu
         u5u6HZqrAYnGs15mbJU8k8pPzIQVf40MozV1BDMINFHwGNZVy98MGlNHAMvpcsJ89dvl
         UP91AWn6RL6+QM1O1FrEwm21CK69ElbxEGj7eWxkBV8uaphLQimnCl4KNaDfNHoR666O
         Dxnx3jQyuBHSUWgJXqEYIisKaEcO1yoXzq8ov72hQJtY1pBajKnW0r8tSiiOtpjaTj5B
         wHB4o6ZeWGPaujU30jMG7BEqAGB+oxBLd3A64SdfOqhoSmgoKsuWsE+lBskgiT7W7X4Q
         JEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=q70Gf9WrXA/qKfHLxJiHpIF3YPi8AT+nl2pavMOq06w=;
        b=jRUex/apef/Gya3flNfHAxHwedWxoQlltWCXJqEt+XQQ2celOo6R8nsPWLjC2n+eBi
         SSFi4ONS84HEuZEmbY8m6w6QDKl299Ao45Lzsj/gVfurtOCs2uC5wLlRxWu3aaYmrBkQ
         cc9jJSSwQhA0svmQS0FX313aMq/gslx2maf9HuXsb2E7oG2WaGI5/cP08fFZxBnl6fhG
         iN46Ua2UNJeKY1d3A3caQHsMQH9w5ZVIV54+YAoY8GDM0BfQcNOogoRks0UeqmNXqtRc
         Vyk4wZkvmKhv4NlgZXzgx8+/MgrUWGhxEY4WWClN7iKZ8iNkxgn5c2CLa83IsbgQZWm8
         wjHw==
X-Gm-Message-State: AGi0PuYOLhhpZKzFo9VuNI1dwuzRx2C5/c8TUzuXxMdC88LJEV7NCn+e
        LXgNwemCcLjFJyCx1sgC0GQ=
X-Google-Smtp-Source: APiQypK2kT7QFmJv+oHr3JiHsrkJLfndmDSRHB16O8wWgXCjV+ZQZqL+SxHUI3TAsE1jdpGSOs8cuA==
X-Received: by 2002:a63:1d11:: with SMTP id d17mr553148pgd.38.1588912183978;
        Thu, 07 May 2020 21:29:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 138sm375706pfz.31.2020.05.07.21.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 21:29:43 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus) Driver for Maxim MAX16601
To:     Alex Qiu <xqiu@google.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <20200506214949.175744-1-linux@roeck-us.net>
 <CAA_a9x+eBJFG7j5amUqS1PcP20jaTHuNysAJZW64Y=w47OtVeA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9040ddc2-8d8c-2849-441a-c21d10652d04@roeck-us.net>
Date:   Thu, 7 May 2020 21:29:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAA_a9x+eBJFG7j5amUqS1PcP20jaTHuNysAJZW64Y=w47OtVeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/7/20 5:54 PM, Alex Qiu wrote:
> Hi Guenter,
> 
> The drivers look good on our system, although more tests are ongoing.
> The patch LGTM with minor nit. Thank you very much!
> 
> On Wed, May 6, 2020 at 2:49 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> MAX16601 is a VR13.HC Dual-Output Voltage Regulator Chipset,
>> implementing a (8+1) multiphase synchronous buck converter.
>>
>> Cc: Alex Qiu <xqiu@google.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---

[ ... ]

>> +
>> +#define REG_SETPT_DVID         0xd1
>> +#define  DAC_10MV_MODE         BIT(4)
>> +#define REG_PHASE_ID           0xf3
>> +#define  CORE_RAIL_INDICATOR   BIT(7)
> 
> Maybe we can move the above two lines down, so the register addresses
> become sequential in the source file.
> 

Makes sense. Will do.

Thanks,
Guenter


