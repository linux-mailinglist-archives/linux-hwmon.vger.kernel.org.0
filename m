Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0446F531A
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 May 2023 10:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjECI0k (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 3 May 2023 04:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjECI0i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 May 2023 04:26:38 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F33749FA
        for <linux-hwmon@vger.kernel.org>; Wed,  3 May 2023 01:26:35 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ab05018381so24334705ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 03 May 2023 01:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1683102395; x=1685694395;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M3Wq2mDsRiC5O9kPiuao8JNBBGj+hKSi0U89lJICwv0=;
        b=KihuyW8wJA705iNBCPswT43Qi2pU3apB5sMXuSFaKci8HTMeZPDWhgRBWAA3mZtUgU
         gqVjxigrkuyHGZp+GewzCniXQevtnOVJRwEm+oT4kipoWvn9Jnc7tSgKy49MTyxWpf14
         a/jrrytqp6LsURFxTVLSQZYdbTw78jBM3NkWjeDpRoXdsKzkEqvTHtKtMP8ItB+sCRXZ
         2JTzchWJOE985k5hJhBncb44t1Mo9BnFUCRedhJiMJs/rTa87KRT5XObnYkWk5dIiUD4
         mb6OsqUY7kzBw43FAMqI+LlJnDEVXZN9JscfDmQe9qVKIYZUjiIGSRayXp5nfg4hRFyl
         1bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683102395; x=1685694395;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3Wq2mDsRiC5O9kPiuao8JNBBGj+hKSi0U89lJICwv0=;
        b=Abzdl9wuXUM4WYFa7vnogUR6Mq47wvPHGo6milGxbDPmcR3gYHcOy+P9S7iqbl68Aw
         Dh1aJQ0lM0GubxaHKY1g/4Vv0zb+dujkQFNe/p5J1FfA5c4egdT9xi5nip1s0O4LXKPv
         4lCbbZ1tLxpQ2EnKCZgQgc97bGnTFdVzDHaIu8TX+y1O5X1AXpYPfu3Ymli4PhBUqzD1
         +dkOKx7Dithr/U5y5VzeXl4PK3rpVy5lITEG4Ld5X04OK6TMpNEWuBW9z4iOvOkXH2yC
         GYsx43Wj2g6zUaJwQX5zMK256YUCVxFl02CRUsMhRNHyOS3hXuIKUH5ee/zqlBNSD5X4
         7KzQ==
X-Gm-Message-State: AC+VfDx0wxZM/uV/PELe5eUHXgJzst8c7uH1B6r4dZb+qg/d3Y5j5uM4
        85RvGzpZ5m3ef7b4py/QvQhS6jDDbdKaQnLpEvI=
X-Google-Smtp-Source: ACHHUZ5v2z1eyR8cDV8ySn1KuW6MlrE14JuJaWVrzvi9x7m0y1TtQ0fwHxOS06Ky0WYMI04cicG1NA==
X-Received: by 2002:a17:903:32d2:b0:1aa:f6c3:bd39 with SMTP id i18-20020a17090332d200b001aaf6c3bd39mr1861176plr.20.1683102394672;
        Wed, 03 May 2023 01:26:34 -0700 (PDT)
Received: from ?IPV6:2405:201:d02f:d855:461d:14be:2cce:b776? ([2405:201:d02f:d855:461d:14be:2cce:b776])
        by smtp.gmail.com with ESMTPSA id x15-20020a170902b40f00b001a98f03af58sm13942331plr.17.2023.05.03.01.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:26:34 -0700 (PDT)
Message-ID: <bd45ea5d-e6e4-403a-e855-376e0f647f91@9elements.com>
Date:   Wed, 3 May 2023 13:56:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add max6639
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420111759.2687001-1-Naresh.Solanki@9elements.com>
 <76e57634-75dd-01e8-9c56-36ed7de17812@linaro.org>
 <c8d1b5db-318e-3401-0834-b89769831eca@9elements.com>
 <be129c4f-3ad7-c54b-936e-08b142608ebc@linaro.org>
 <88f9a008-2861-284c-76c4-7d416c107fbb@9elements.com>
In-Reply-To: <88f9a008-2861-284c-76c4-7d416c107fbb@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Krzysztof,

On 24-04-2023 03:23 pm, Naresh Solanki wrote:
> Hi Krzysztof,
> 
> On 24-04-2023 03:12 pm, Krzysztof Kozlowski wrote:
>> On 24/04/2023 11:18, Naresh Solanki wrote:
>>
>>>>> Changes in V2:
>>>>> - Update subject
>>>>> - Drop blank lines
>>>>> ---
>>>>>    .../bindings/hwmon/maxim,max6639.yaml         | 52 
>>>>> +++++++++++++++++++
>>>>>    1 file changed, 52 insertions(+)
>>>>>    create mode 100644 
>>>>> Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml 
>>>>> b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..1aaedfd7cee0
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
>>>>> @@ -0,0 +1,52 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Maxim max6639
>>>>
>>>> What is this device? fan controller?
>>> Yes Fan controller.
>>> Do you want me to update the title here as:
>>> "Maxim MAC6639 2 channel fan controller & temperature monitor" ?
>>
>> Enough would be:
>> Maxim MAX6639 Fan Controller
> Ack
>>
>>
>>>
>>>>
>>>>> +
>>>>> +maintainers:
>>>>> +  - Naresh Solanki <Naresh.Solanki@9elements.com>
>>>>> +
>>>>> +description: |
>>>>> +  The MAX6639 is a 2-channel temperature monitor with dual, 
>>>>> automatic, PWM
>>>>> +  fan-speed controller.  It monitors its own temperature and one 
>>>>> external
>>>>> +  diode-connected transistor or the temperatures of two external 
>>>>> diode-connected
>>>>> +  transistors, typically available in CPUs, FPGAs, or GPUs.
>>>>> +
>>>>> +  Datasheets:
>>>>> +    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - maxim,max6639
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  '#address-cells':
>>>>> +    const: 1
>>>>> +
>>>>> +  '#size-cells':
>>>>> +    const: 0
>>>>
>>>> Why do you need these two properties?
>>> Ack. Will remove them.
>>>>
>>>> Anyway, the binding looks incomplete. Where are the supplies? 
>>>> Interrupts?
>>> This patch just adds basic support to the existing platform driver.
>>> Intention is to be able to call the driver from DT with basic
>>> initialization from driver the existing driver.
>>
>> Bindings should be rather complete. Here the datasheet is accessible and
>> few properties quite obvious, so I don't see a reason to skip them.
> I agree with you. But currently the driver which is already merged 
> doesn't has it implemented.
> And will be working on separate patch to include this later.
Please let me know if this approach is acceptable, or if there are any 
other suggestions or concerns that you have.
Thanks,
Naresh
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Regards,
> Naresh.
