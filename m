Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F235B451D
	for <lists+linux-hwmon@lfdr.de>; Sat, 10 Sep 2022 10:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiIJIK6 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 10 Sep 2022 04:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJIK6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Sep 2022 04:10:58 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A162F82D3D
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Sep 2022 01:10:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id x10so4645956ljq.4
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Sep 2022 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=txFmNqivSGonl1t91BWxPpRyV6wFFoxPfmlb622zlU4=;
        b=A5TM8+1WniIN3PtwC3BZhC1jY1dASPxIPewi0arGlquPn/062oVa4wvFnMaDdQ66xH
         lLilxwCx+Oczx5jWgRyQAg2ip6OazqkWh4V1XGR+5gIyckfUpA9X8SqJjFyZ9pnRxktj
         2+zY2Wbhp317Cx2fosdt/tCEvQLJwCf3HpMROaX2tqvwQuaQZnNiWg3z/MJEsvvxSkeE
         DvFlwqgD3HwX/BAKIc4wnOuWTCDa/EAWxAAGuwbzVd41uc7TfsfZhmE6x6K+Fxk299rC
         NcqRotinLeaE2WIaVpi4zQ1ropa7GfNiFpkLdd1oK6uzUNnuzaig1dB0hts3oEkvc+Pf
         LL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=txFmNqivSGonl1t91BWxPpRyV6wFFoxPfmlb622zlU4=;
        b=daAA9BCOqejh7R734SqCks1TV7XXxAzh9PgzyXPAQ/OVPEldBkFdo3e/fQ/85Sob5o
         7G4iLHgaLDhoRS8Cb4y3FqzpU93SIge6fGylmwjVHFjjde3xD3EVRvJX1Kyjg2q5vmGZ
         gGHIvZAHGa5nrfMuvrLayO9aCZYSvtkW3iezhj1baPae/DfkLHyEhYYN5ZUWCnwwCFiw
         PdDXSpHvmntQpXlDK7NTbb4ogSAvEwJVzMc4LMlsRxRQAlxveeILz5ke9Ye7oyp0GQSw
         cEjNYmstjFB00T8aToT/cwOTVjcamb1p7frs3hOPOEvyDIpF86syVoz7BVA4pvqcxXp7
         6WHQ==
X-Gm-Message-State: ACgBeo0kZE5HwJ4VhfHOy1IiWWEVAUWZ+e2iqtCk9gv/ajSFkA1R7qw8
        e0OdB8wPVpHvAIuQ58pt2vOUvxhcS1fI5g==
X-Google-Smtp-Source: AA6agR7789VL7NQdhtwL2QwBsV2k2YfdkUDrGL8k0PU+vC77/8Ct9Y0/++AmZJIlkccmwRb2Sq7irw==
X-Received: by 2002:a2e:8541:0:b0:261:b44b:1a8b with SMTP id u1-20020a2e8541000000b00261b44b1a8bmr5409456ljj.46.1662797454999;
        Sat, 10 Sep 2022 01:10:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s16-20020a05651c201000b00267232d0652sm259553ljo.46.2022.09.10.01.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 01:10:54 -0700 (PDT)
Message-ID: <bd23014f-eb9b-31a5-f777-c1b15f65fd89@linaro.org>
Date:   Sat, 10 Sep 2022 10:10:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 3/4] dt-bindings: hwmon: Add bindings for max31760
Content-Language: en-US
To:     "Tilki, Ibrahim" <Ibrahim.Tilki@analog.com>,
        Rob Herring <robh@kernel.org>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220909133718.388213-1-Ibrahim.Tilki@analog.com>
 <20220909133718.388213-4-Ibrahim.Tilki@analog.com>
 <1662740789.477872.1507147.nullmailer@robh.at.kernel.org>
 <20220909164710.GA1537271-robh@kernel.org>
 <DM8PR03MB624727E043782EC34DBBE6B196439@DM8PR03MB6247.namprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DM8PR03MB624727E043782EC34DBBE6B196439@DM8PR03MB6247.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 09/09/2022 19:48, Tilki, Ibrahim wrote:
ded form is:
>>
>> reg:
>>   items:
>>     - items:
>>         - minimum: 0x50
>>           maximum: 0x57
>>
> 
> Actually it passes the check when I remove maxItems property:
> 
>   reg:
>     description: I2C address of slave device.
>     items:
>       minimum: 0x50
>       maximum: 0x57
> 
> I cannot find a way to specify both maxItems and min-max limits.
> Which one should I drop? Line below is from the output of dt_bindigs_check:
> 
> hint: "maxItems" is not needed with an "items" list

Use Rob's first syntax:

reg:
  minimum: 0x50
  maximum: 0x57

(this will expect only one item)


Best regards,
Krzysztof
