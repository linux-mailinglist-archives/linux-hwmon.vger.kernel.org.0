Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921DA7532BC
	for <lists+linux-hwmon@lfdr.de>; Fri, 14 Jul 2023 09:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbjGNHOK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 14 Jul 2023 03:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235316AbjGNHOE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jul 2023 03:14:04 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507D72733
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 00:13:59 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-313f1085ac2so1630478f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jul 2023 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689318837; x=1691910837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8K9L3dLhDzQTv7y7e0RVrZSX+FOOeLwX47IYpkosCNQ=;
        b=OC+YjhwBAquXA8bRTVqSc71oDkaWMW+X/CVE2b19QZwxMyZMKHAvPRMmvfaxAc4qjH
         wS7bNaVBc65aNTvjFBCqH8OBSvvBxi62KVint4c5u3f5LPVie/jV2eC+Cnb++NzUzrAA
         1WmPu1XVuNiQma+6ojXOFZSB2R3c3FD2ObygN3AbnrskivYYp264Mt3hLNiGN3o7ziS9
         Zp5AMIbOkQqdPvl3/2powKYJl/VMwFZs6r91+UKudYvK4oe5VoTtD+WXIvp3zAO3GKEB
         KYIRZB0B2uxWT66+BqOdlF2MALmKB4mznl4YuvMyV5H2X5vRACwCik0jnwWm2Fe4fqtO
         tEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689318837; x=1691910837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8K9L3dLhDzQTv7y7e0RVrZSX+FOOeLwX47IYpkosCNQ=;
        b=L0NM3TvMek0xROqpv1c5CwuykM2jSK26MQAULhmvCkIytakEbGod/Lf7e+gYmMZWK8
         I/1jYkq4f6MmDsmlfrKGFNcHD08bKP160YX+8xBe02/6PlrRPXeaGjkaGFoxubwcMXgk
         JFAqmFwr7WEba6/pGeFpATxjBynqpCOCg1EJDvfeaSKmsn0B2lW5LjNFvz1hnCP9ERLH
         o4ZuhmYgA1k8b37GEitv72WQttM0bK40AyqZ8x87+I7/e6swrNSKlq2rHqa603URqkvJ
         G7RlCqgw4EVGeEAgpXHRCLaiNEy1KtUU11Chl3fxgxkN24lG+TRbPGs0GaLAgbzqrcPR
         oW1w==
X-Gm-Message-State: ABy/qLYiz5yhJ4t3n3shzfNg1Z4VKFI6herk41BFGAhHVYjr9ssrGHL8
        dJYq3bHmYvB2c66zgpjXknyexQ==
X-Google-Smtp-Source: APBJJlFlh8jTiL5Fqlv9Labt5kPhUqu1Mydh9K2EVtifJxi6rOHGarAs9UJGSqlz51WFJVdcIGWexg==
X-Received: by 2002:a5d:67c9:0:b0:313:ece8:e05c with SMTP id n9-20020a5d67c9000000b00313ece8e05cmr3230412wrw.33.1689318837343;
        Fri, 14 Jul 2023 00:13:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d58ee000000b003143c532431sm10042716wrd.27.2023.07.14.00.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:13:56 -0700 (PDT)
Message-ID: <0b9dd5cf-f4ca-2e6b-624d-0b451bbc2f30@linaro.org>
Date:   Fri, 14 Jul 2023 09:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v6 2/4] dt-bindings: hwmon: Add ASPEED TACH Control
 documentation
To:     =?UTF-8?B?6JSh5om/6YGU?= <billyking19920205@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Billy Tsai <billy_tsai@aspeedtech.com>
References: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGUgbhCqOJaEPjS96o2au21uW4NhqFScm4Ayd8PzOQvqxQ94SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 14/07/2023 09:04, 蔡承達 wrote:

>         > This is because our register layout for PWM and Tach is not
> continuous.
> 
>         > PWM0 used 0x0 0x4, Tach0 used 0x8 0xc
> 
>         > PWM1 used 0x10 0x14, Tach1 used 0x18 0x1c
> 
>         > ...
> 
>         > Each PWM/Tach instance has its own controller register and is not
> dependent on others.

Your email reply quoting style is very difficult to read.

> 
> 
> 
> Hi Guenter,
> 
> 
> 
> Did you receive a response to my previous email?
> 
> I would like to inquire if you have any further concerns regarding the PWM
> and Tach with 16 instances.

But isn't like this in all PWMs in all SoCs?

Best regards,
Krzysztof

