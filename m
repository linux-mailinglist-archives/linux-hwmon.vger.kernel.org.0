Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDCF5A9DD6
	for <lists+linux-hwmon@lfdr.de>; Thu,  1 Sep 2022 19:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbiIARLy (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 1 Sep 2022 13:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbiIARLu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 13:11:50 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A482E80502;
        Thu,  1 Sep 2022 10:11:49 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id z187so18038315pfb.12;
        Thu, 01 Sep 2022 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=YDC5tyBH7wmTL3j65AV3g9HNqXBKCTVoZvt49f51Mhg=;
        b=FFWEPn5yBKL8K+u0bzKsPjeK5DPBzNjR3mEbeFKIXjnSasDSkljtTfus1siS+pY4US
         +ogJ7QwAvGGK7kJKgwIV46iKIC1fxb3Kpn/K+g7uD60tbF2nzrvnCRkEff46xul3Vb0k
         KsNXvadKrsIvwbKBh/JUdYlubFL6APe8M0G5kJ/GdcdvYoyMsY664Y1RewhST2OJUu0X
         UTedGbfYicG8KLbvejMeeCRoPbeWrPjo9xzJnDxIvvwqC6ZRjt8RTomuRBH+egCHENH4
         UOUD/6NbFF/TILxpcdeO8Ucf3Z/+YUGzoEoGRKKeDnOLpsENwTt1OZEca8pYJdAacGYj
         Dhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=YDC5tyBH7wmTL3j65AV3g9HNqXBKCTVoZvt49f51Mhg=;
        b=DRjbAs7pZ7OH88xfcCBZPlv3/XRXA4V4Yw8kQt3/OpSFkzfaZrd+hQFeGaFAdH/qtc
         /d7buNN6OG7y6Tz9cUb9e/r932CghhUqs0wK9biSq8I1kBglshAMysADZntbYxIcm4pj
         fJEOTU5JZyC/sE5nIGwf2O9s9ZsNi7lc2RKHHAcaxvn3ka4CwYneTCXsIUel7gIJFwv8
         4vqXJBrorVxJXMEB8wYdxex2wXVePcaM0rDJCUgFfqkn9DsDBQZYx2EMij1nr7pTXHoa
         mAuasRdqc8Hf+Pk+ACzH+AG3PHGsHbRuwvhpZvlrBR9wo4qAxbPS9Wr5mx6icQMTdtGQ
         57gw==
X-Gm-Message-State: ACgBeo2dTPF5jZ4C/MGeqHboRU/a/TaYAvHr0R0RJcoCMSd3CKSTlYlA
        XptvU6yB0oPjzclKtwnjvq4=
X-Google-Smtp-Source: AA6agR5J2qfd+dwystlya3rM6FvZfroB70yZGLijJjcxrn44kTx+rcYKaXBHa2EQSxxa/wxRQ9Y9FQ==
X-Received: by 2002:a62:27c1:0:b0:536:32d2:d098 with SMTP id n184-20020a6227c1000000b0053632d2d098mr32306075pfn.63.1662052308996;
        Thu, 01 Sep 2022 10:11:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b0016ecc7d5297sm14180703plg.292.2022.09.01.10.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 10:11:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a48f6c26-232a-f3ae-01d1-277e5c9800ee@roeck-us.net>
Date:   Thu, 1 Sep 2022 10:11:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/19] hwmon: (mr75203) fix VM sensor allocation when
 "intel, vm-map" not defined
Content-Language: en-US
To:     "Farber, Eliav" <farbere@amazon.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, p.zabel@pengutronix.de,
        rtanwar@maxlinear.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        talel@amazon.com, hhhawa@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, ronenk@amazon.com, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dkl@amazon.com, andriy.shevchenko@intel.com
References: <20220830192212.28570-1-farbere@amazon.com>
 <20220830192212.28570-3-farbere@amazon.com>
 <cddebb5a-3b83-e89d-db00-9a59ddbd6741@roeck-us.net>
 <84a68eff-be64-71ce-1533-1e228d3da2a4@amazon.com>
 <71d6d57c-2165-5fe3-515d-9395022921e2@roeck-us.net>
 <2f5c5828-87b9-f3d2-e3d3-0200adbe830c@amazon.com>
 <20220901144434.GB3477025@roeck-us.net>
 <ceef1c33-1af5-53d1-5e5b-5aeb5d2679ca@amazon.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ceef1c33-1af5-53d1-5e5b-5aeb5d2679ca@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/1/22 08:24, Farber, Eliav wrote:
> On 9/1/2022 5:44 PM, Guenter Roeck wrote:
>> On Thu, Sep 01, 2022 at 11:39:58AM +0300, Farber, Eliav wrote:
>>> On 8/31/2022 2:48 PM, Guenter Roeck wrote:
>>> > On 8/30/22 22:49, Farber, Eliav wrote:
>>> > > On 8/31/2022 8:36 AM, Guenter Roeck wrote:
>>> > > > On 8/30/22 12:21, Eliav Farber wrote:
>>> > > > > Bug fix - in case "intel,vm-map" is missing in device-tree
>>> > > > > ,'num' is set
>>> > > > > to 0, and no voltage channel infos are allocated.
>>> > > > >
>>> > > > > Signed-off-by: Eliav Farber <farbere@amazon.com>
>>> > > > > ---
>>> > > > >   drivers/hwmon/mr75203.c | 28 ++++++++++++----------------
>>> > > > >   1 file changed, 12 insertions(+), 16 deletions(-)
>>> > > > >
>>> > > > > diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
>>> > > > > index 046523d47c29..0e29877a1a9c 100644
>>> > > > > --- a/drivers/hwmon/mr75203.c
>>> > > > > +++ b/drivers/hwmon/mr75203.c
>>> > > > > @@ -580,8 +580,6 @@ static int mr75203_probe(struct
>>> > > > > platform_device *pdev)
>>> > > > >       }
>>> > > > >
>>> > > > >       if (vm_num) {
>>> > > > > -             u32 num = vm_num;
>>> > > > > -
>>> > > > >               ret = pvt_get_regmap(pdev, "vm", pvt);
>>> > > > >               if (ret)
>>> > > > >                       return ret;
>>> > > > > @@ -594,30 +592,28 @@ static int mr75203_probe(struct
>>> > > > > platform_device *pdev)
>>> > > > >               ret = device_property_read_u8_array(dev, "intel,vm-map",
>>> > > > > pvt->vm_idx, vm_num);
>>> > > > >               if (ret) {
>>> > > > > -                     num = 0;
>>> > > > > +                     /*
>>> > > > > +                      * Incase intel,vm-map property is not
>>> > > > > defined, we
>>> > > > > +                      * assume incremental channel numbers.
>>> > > > > +                      */
>>> > > > > +                     for (i = 0; i < vm_num; i++)
>>> > > > > + pvt->vm_idx[i] = i;
>>> > > > >               } else {
>>> > > > >                       for (i = 0; i < vm_num; i++)
>>> > > > >                               if (pvt->vm_idx[i] >= vm_num ||
>>> > > > > - pvt->vm_idx[i] == 0xff) {
>>> > > > > -                                     num = i;
>>> > > > > + pvt->vm_idx[i] == 0xff)
>>> > > > >                                       break;
>>> > > >
>>> > > > So all vm_idx values from 0x00 to 0xfe would be acceptable ?
>>> > > > Does the chip really have that many registers (0x200 + 0x40 +
>>> > > > 0x200 * 0xfe) ?
>>> > > > Is that documented somewhere ?
>>> > > According to the code vm_num is limited to 32 because the mask is
>>> > > only 5 bits:
>>> > >
>>> > > #define VM_NUM_MSK    GENMASK(20, 16)
>>> > > #define VM_NUM_SFT    16
>>> > > vm_num = (val & VM_NUM_MSK) >> VM_NUM_SFT;
>>> > >
>>> > > In practice according to the data sheet I have:
>>> > > 0 <= VM instances <= 8
>>> > >
>>> > Sorry, my bad. I misread the patch and thought the first part of
>>> > the if statement was removed.
>>> >
>>> > Anyway, what is the difference between specifying an vm_idx value of
>>> > 0xff and not specifying anything ? Or, in other words, taking the dt
>>> > example, the difference between
>>> >        intel,vm-map = [03 01 04 ff ff];
>>> > and
>>> >        intel,vm-map = [03 01 04];
>>>
>>> The actual number of VMs is read from a HW register:
>>>     ret = regmap_read(pvt->c_map, PVT_IP_CONFIG, &val);
>>>     ...
>>>     vm_num = (val & VM_NUM_MSK) >> VM_NUM_SFT;
>>>
>>> Also, using:
>>>     ret = device_property_read_u8_array(dev, "intel,vm-map", vm_idx,
>>>                         vm_num);
>>> in the driver will fail if vm_num > sizeof array in device-tree.
>>>
>>> So, if for example vm_num = 5, but you will want to map only 3 of them
>>> you most set property to be:
>>>     intel,vm-map = [03 01 04 ff ff];
>>> otherwise if you set:
>>>     intel,vm-map = [03 01 04];
>>> it will assume the property doesn't, and will continue the flow in code
>>> as if it doesn’t exist (which is not what the user wanted, and before my
>>> fix also has a bug).
>>
>> There should be some error handling to catch this case (ie if the number
>> of entries does not match the expected count), or if a value in the array
>> is larger or equal to vm_num. Today the latter is silently handled as end
>> of entries (similar to 0xff), but that should result in an error.
>> This would avoid situations like
>>        intel,vm-map = [01 02 03 04 05];
>> ie where the person writing the devicetree file accidentally entered
>> index values starting with 1 instead of 0. A mismatch between vm_num
>> and the number of entries in the array is silently handled as if there
>> was no property at all, which is at the very least misleading and
>> most definitely unexpected and should also result in an error.
> 
> 
> I assume it is possible to tell according to the return value, if property
> doesn’t exist at all, or if it does exists and size of array in
> device-tree is smaller than vm_num.
> In [PATCH v3 17/19] Andy wrote that “code shouldn't be a YAML validator.
> Drop this and make sure you have correct DT schema” so I’m a bit confused
> if code should validate “intel,bm-map” or if it is the user responsibility.
> As this property was not added by me, I prefer not to fix it as part of
> this series of patches.
> 

You are changing the driver all over the place with 19 patches, including
this code, but you don't want to add code that validates the devicetree
data ? That seems odd.

> 
>> Also, what happens if the devicetree content is something like the
>> following ? Would that be valid ?
>>        intel,vm-map = [00 01 01 01 01 01];
> 
> If device-tree content would be:
>      intel,vm-map = [00 01 01 01 01 01];
> and assuming 16 channels for each VM, the hwmon sub-system will expose 90
> sysfs to read voltage values.
> In practice 16 – 31, 32 – 47, 48 – 63, 64 – 89 will all report the same
> input signals for VM1.
> 

Does that make any sense, and is there a valid reason to have a mapping
table like the one in this example ?

Thanks,
Guenter
