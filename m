Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BDE7E77BC
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Nov 2023 03:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjKJCuw (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 9 Nov 2023 21:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjKJCuw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 9 Nov 2023 21:50:52 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55412D5E;
        Thu,  9 Nov 2023 18:50:49 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-66d264e67d8so9400996d6.1;
        Thu, 09 Nov 2023 18:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699584649; x=1700189449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SvQNvQgrqyBQ7iUvXLfQuGRA0FKxbjcTIdzbdX/QTz8=;
        b=Ksd4M7jq9kksyntqdOgko1crQ1bo4Ccv3iXSD3E+VGWjlHEbbl0LEslxs0AkypkSKt
         jUOE4MCacQ1xDt4g4jLli46XWau18rNE1mkKb8zT5q+SkoYL+RTMBntXcGd/Te6GZtE8
         KVGBS3TIW2lstYPAGHeeVq6NNvO511hcZzGQJ6XLz0no27D62xIavUJ1/tK1ioWCCO8m
         38cijOrKYt2H/43l6a4Q62cgF7koEES2EeL8zgrai28ST0Q+5RmY5vWCyrgsPx1W0JnO
         9Kpmygl/BX1hMZ+CFBgMUyYH4QlhF7moImNSHM+ufZwELFk6nsC+qu4I01Aakrsg7CiO
         VhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699584649; x=1700189449;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvQNvQgrqyBQ7iUvXLfQuGRA0FKxbjcTIdzbdX/QTz8=;
        b=rQrdHWFYPgAyivpPbKjVGvREjafEbzK1Te/OhqbZVKAET4lO5NAqnlYeYfcPqmc1LC
         ZVQlcTGMbWSqiCgyL/DPdLZ94c5lWZWcgZYqiRlMbIp+OWBQebRoL34scQe9YyBUEyhG
         kEwQ2lLxa6i66f4IY6V4gdFR3l1D/CxmDBRnXxTPuyM1o+nZr0tJ6F9bmjm8wD4pmBmc
         k+IRI6rN3D3wabOtPFalSLrxBaFlNrWUlefXWll1wyKbH7RIqZeemNzOVMktdUkuBvGQ
         A8YYFs0MIMSbk2cTvigm5ppD2JeQfY5pBhnc2M6RGWCPZ1CSrw3gop8GHm5UlNcfgDTn
         J3JQ==
X-Gm-Message-State: AOJu0Yxq/cq4DtNuo8ZgPafpcsFdjJeFbsnNppw9lH+QoiaNKFUw4AcW
        v8zonUl1MOXwBXY1u9LuxeG2dliVyaI=
X-Google-Smtp-Source: AGHT+IGgyQsvBiIDUl31JMsLzoT+sW7f3Mqnfju8kUTyTw4vs+aqNnSobg10EfNjGM9QrFJFTUHN6w==
X-Received: by 2002:a05:6214:2b0a:b0:66d:6705:5c50 with SMTP id jx10-20020a0562142b0a00b0066d67055c50mr7634614qvb.44.1699584648958;
        Thu, 09 Nov 2023 18:50:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5-20020ac87245000000b0041e211c5d0bsm198461qtp.6.2023.11.09.18.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 18:50:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0ddbc61b-8f66-46b0-801e-5bf57588e0d7@roeck-us.net>
Date:   Thu, 9 Nov 2023 18:50:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add a new macro sensor_sysfs_attr
Content-Language: en-US
To:     "Ma, Jun" <majun@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231109051429.2250774-1-Jun.Ma2@amd.com>
 <0ae6bcc2-a30d-4840-a21a-0de0b394c309@roeck-us.net>
 <50372d43-f89e-4969-a609-d8e1ff2afdf6@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <50372d43-f89e-4969-a609-d8e1ff2afdf6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/9/23 17:15, Ma, Jun wrote:
> Hi Guenter,
> 
> On 11/9/2023 1:28 PM, Guenter Roeck wrote:
>> On 11/8/23 21:14, Ma Jun wrote:
>>> The attribute definiations like &sensor_dev_attr_xx_xx.dev_attr.attr
>>> are widely used in drivers. So add a new macro sensor_sysfs_attr t
>>> to make it easier to understand and use.
>>>
>>> For example, user can use the sensor_sysfs_attr(xx_xx) instead of
>>> &sensor_dev_attr_xx_xx.dev_attr.attr
>>>
>>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>>> ---
>>>    include/linux/hwmon-sysfs.h | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/include/linux/hwmon-sysfs.h b/include/linux/hwmon-sysfs.h
>>> index d896713359cd..7feae637e3b5 100644
>>> --- a/include/linux/hwmon-sysfs.h
>>> +++ b/include/linux/hwmon-sysfs.h
>>> @@ -14,6 +14,10 @@ struct sensor_device_attribute{
>>>    	struct device_attribute dev_attr;
>>>    	int index;
>>>    };
>>> +
>>> +#define to_sensor_sysfs_attr(_name) \
>>> +	(&sensor_dev_attr_##_name.dev_attr.attr)
>>> +
>>>    #define to_sensor_dev_attr(_dev_attr) \
>>>    	container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
>>>    
>>
>> No. This would just invite people to submit patches converting existing code
>> to use this new macro. Instead of providing macros to support deprecated APIs,
>> convert drivers to use an API which is not deprecated. This would for the
> 
> Which API is not deprecated do you mean?
> 

[devm_]hwmon_device_register_with_info(). I don't want to encourage
the use of non-standard sysfs atributes either (and, no, I still
don't accept the idea that "frequency" would be a hardware monitoring
attribute).

Guenter

