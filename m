Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C342356BD1
	for <lists+linux-hwmon@lfdr.de>; Wed,  7 Apr 2021 14:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbhDGMME (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 7 Apr 2021 08:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhDGMMD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Apr 2021 08:12:03 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05B0C061756;
        Wed,  7 Apr 2021 05:11:52 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i81so18501537oif.6;
        Wed, 07 Apr 2021 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WIjn0AhTwwpTEtbdjQhQORR+T5+cXMTK7UrnuECBFAM=;
        b=CNs6DRffpuXCMVPbrFrtv07hUayfANj7GT1XCig4urJ/iDJngQ4P1gz39BcSyKnJom
         ShV8S1iWZQM27nZ04vJyehIKw41MRx7H+OSxtoIKub9FC75sMT7pQeuxvk/KL5EDXOix
         IIXIjwU7ovxlDb8k8Q3lRXp2UJVpmph0z2004DlfQKs59jact1Y64M7X0sAkYGwaiUXA
         yyXBZ+GIjVm5MLOSBLVoYGuwb1tHPfdQB7i0/2AASlCYKAv9Bw9ivbng2nIsBBuVc+DK
         X7jM+3hAO5sfYFZKCQy37xHI7ulOBRQ7Uit08iNl/+ZS1Y+l5LFkwB4/MB6mjnOneGXH
         dSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WIjn0AhTwwpTEtbdjQhQORR+T5+cXMTK7UrnuECBFAM=;
        b=izfQbneRFcy/VYA+NpCR4uB0Dct4e0i/qa6scGXlZB3vfbRS8FJX9sdPl8LryUy4IO
         wjr3h75YpN8ezDUhxFF4Ktm0C7Qd+XvD8ljLQ2/Mz6BkQhv68aFr6HVk4MtYjltsC24s
         /yHB+3DGpM/i4iTbJKfP43uc5tNftzEQcg9TgsxNAX06TKA11ezOQqCHHu5pMaLcOAk8
         rEPkEEOkPtmddK8Ao5Ul2TZzzplSjR6mtMkgbpPGQY7Heqnzxajiw8a8pU9d8hUxyC5d
         o4PywZSq8seZtg8QdnS3kUudkEHJ2V/iXnYDWHTcVjYG6uhbcL4XZGJFUDTvUvy6yUQs
         MuBg==
X-Gm-Message-State: AOAM532+Wx3Lt1oqTGeZuDrC5A49OHHHQRc7K6Pl7OQv8od7YaR/zpVC
        Jvxe/9WuXhR6EFEdg5bKizY=
X-Google-Smtp-Source: ABdhPJy1oxNYAiecRNIuLOcN0mlyS7k+p8U1hu5TBgm9PyyMXGacZeU59qzHRA9KGvT9kWJnHBBO/g==
X-Received: by 2002:aca:ebd7:: with SMTP id j206mr2078266oih.60.1617797512427;
        Wed, 07 Apr 2021 05:11:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w11sm4720629ooc.35.2021.04.07.05.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 05:11:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon
 driver
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org
Cc:     Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
 <20210329015238.19474-4-quan@os.amperecomputing.com>
 <bac92db0-3ef6-1615-0e92-aabd54fd0580@roeck-us.net>
 <136d036c-1d10-cecd-abcb-d206a0c6fa51@os.amperecomputing.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d9ef40ea-e4ee-cea8-96df-90ffabdff53c@roeck-us.net>
Date:   Wed, 7 Apr 2021 05:11:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <136d036c-1d10-cecd-abcb-d206a0c6fa51@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/7/21 12:41 AM, Quan Nguyen wrote:
[ ... ]
>>
>> But then why don't you just use reg_ext to store SOC_VR_HOT_THRESHOLD_REG
>> or MEM_HOT_THRESHOLD_REG ? It is already available, after all, and with it
>> the code could be simplified to
>>
>>         ret = regmap_read(hwmon->regmap, temperature[channel].reg_ext, &value);
>>         if (ret)
>>             return ret;
>>
> Thank you for the comment.
> 
> Will change code follow this suggestion, will include in next version
> 
>> I don't have a datasheet, but I do wonder what is in bit 9..15. Any idea ?
>> Main question is if there is a sign bit, as theoretic as it may be.
>>
> The original intention was to use this as 9-bit 2-complement value follow LM75, but the fact is that the operation temperature is 0-125 C degree, so we simply use it as-is.
> 

The operational temperature is not the question here. The question is if the
chip _reports_ a sign. If it does, it should be handled, even if it is outside
the operational range. The reported range is relevant here, not the operational
range. After all, the chip won't really blow apart at -1 degrees C.

Thanks,
Guenter
