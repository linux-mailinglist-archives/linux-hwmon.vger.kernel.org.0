Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B28B6D5CA2
	for <lists+linux-hwmon@lfdr.de>; Tue,  4 Apr 2023 12:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbjDDKGU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 4 Apr 2023 06:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234324AbjDDKGT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Apr 2023 06:06:19 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822D42727
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Apr 2023 03:06:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id fi11so4825699edb.10
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Apr 2023 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680602776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxM7pHYaYfeSkBdBDN7aQqaAsu+9Matzg8m3QMGN1rI=;
        b=j5SStedHpTECGFWywLmPC52GuOUIrn9O2z99EVD38fkoZOAoRYvW/87/ggpABjeiyT
         znLCnLu1/8W/pmgcORHwd6DhZ9HEBY/Omu3kXiUH4LRI6SdK/T+Y2OHvJ/85E/linAzZ
         IhdTscR4J+3LJVOHTvpT/Xw1j+ZtIpyu6eGaTi2+mNA5r1oxZOQGHRci8//pN2Mr57a6
         62yxEKN6qDed6le3JEDw6x02QWkF45UBsMGnF7bp3K418ZajeCaCzUGeFjdYJIW5XUyG
         8sklu9Mct4hFVWbQCV0aHnw5paSyZknwqZFrmnNmvlg9+i5OFCfB2RrC6FHa7dM+pNMO
         Ktqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680602776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DxM7pHYaYfeSkBdBDN7aQqaAsu+9Matzg8m3QMGN1rI=;
        b=5iLEa2iK4lFfiGf8sHgKo78TZXNEHCMeYbzYclBl6WRBWkxFwtAVW7oLSDQl6LFgg8
         /3lPGx/CE9eJa8yHQdneK3xs/h+D7liChA+usRyPU3HNDrgFgKJkRY8I4/jDRhNsYJQs
         lBJBpQzhxTkhgcER21L7XOao4rEQ8fXJMjcaVKWcxQfOmG8xPQ47zD7GFoKp3iq0Lg1H
         IKohJA9rE/dk768K0VVtkccp3LA+Ik8TU9KDmpicAJStzQvMo2gCbf74EgBDoXXLjNEF
         5IQGyCAqae/0xqpvUzqb0Xe0xBXU7iUrIeDom2VVbzqTvm9HQUqn+1/nXkVswTIP0TXy
         qlCQ==
X-Gm-Message-State: AAQBX9e2pZC4T8vhI6ZVWFTVfONKJWf3BdcZaA1jV7cymY91dZrz9cfS
        6eOp421mfthdGlHU7TimGlXnoQ==
X-Google-Smtp-Source: AKy350Zh1SFhrfUf1rjLYpAofSLqfJ7X0dOlxbo2D8cQQ1H073suZ3iJ/Kfj/afUZBfGZEE+Se2YVg==
X-Received: by 2002:a17:906:99c8:b0:8b1:2bde:5c70 with SMTP id s8-20020a17090699c800b008b12bde5c70mr1880750ejn.2.1680602775988;
        Tue, 04 Apr 2023 03:06:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:99ed:4575:6001:8bda? ([2a02:810d:15c0:828:99ed:4575:6001:8bda])
        by smtp.gmail.com with ESMTPSA id sd19-20020a170906ce3300b00947499e0e4dsm5850768ejb.146.2023.04.04.03.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 03:06:15 -0700 (PDT)
Message-ID: <847cc6c8-e097-aa3a-2cd7-a6929bec18e9@linaro.org>
Date:   Tue, 4 Apr 2023 12:06:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] dt-bindings: rtc: add max313xx RTCs
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, a.zummo@towertech.it,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org,
        Zeynep Arslanbenzer <Zeynep.Arslanbenzer@analog.com>
References: <20230403154342.3108-1-Ibrahim.Tilki@analog.com>
 <20230403154342.3108-3-Ibrahim.Tilki@analog.com>
 <dd6f0842-519f-1bc9-f7f5-459863dc3dcd@linaro.org>
 <202304040710049c9cc01a@mail.local>
 <996b49ab-5e2e-76bc-efb1-38c6384871f6@linaro.org>
 <2023040407444619bf5596@mail.local>
 <0fd972bd-c5e7-65cc-6992-09c4c3e88f95@linaro.org>
 <202304040956056c59af98@mail.local>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <202304040956056c59af98@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 04/04/2023 11:56, Alexandre Belloni wrote:
> On 04/04/2023 10:14:33+0200, Krzysztof Kozlowski wrote:
>> On 04/04/2023 09:44, Alexandre Belloni wrote:
>>>>
>>>>> charging will always
>>>>> enable a diode, select a resistor and then have or not an extra diode.
>>>>> Figure2 of the MAX31329 datasheet is great.
>>>>
>>>> So the diode is in the max313xx? Then why enabling it is a property of
>>>> DT? Either this should be inferred from compatible or is even a policy,
>>>> not a DT property. Just because device has a register for something, is
>>>> not an argument that "something" should be in DT.
>>>
>>> Well, it depends on the battery that is installed on the board so it
>>> makes sense to have it in DT.
>>
>> OK, that would be a good reason, but I wonder why? Why choosing diode or
>> not depends on the battery? Wouldn't you always want to have the diode?
>>
> 
> It limits the maximum current used to charge the battery or supercap to
> not exceed what is allowed.

and I still wonder why someone would like to allow exceeding what is
allowed. IOW, what is the use case to disable the diode?

Best regards,
Krzysztof

