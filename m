Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBF06EDEB5
	for <lists+linux-hwmon@lfdr.de>; Tue, 25 Apr 2023 11:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbjDYJHN (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 25 Apr 2023 05:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjDYJHN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Apr 2023 05:07:13 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B015BA2
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Apr 2023 02:07:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-94f4b911570so823090166b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Apr 2023 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682413628; x=1685005628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LCVMEbF9OBiT9IqLI0a7Ll8JBgTJIKseELbvcgMa+QA=;
        b=Co2cU+wPJZR1SeYAhk4O3NhECwXRRGKYeIMirElj9M6t4dU8JRDhOtG2JGHDpmlGYd
         XJ+F5ox9wF2Nj80odVqTN9LBO9ek4cjOR3mAG4nSNu+YRbiLzZQDqT3RFVk0/5A041F7
         yYBvlillH7XimkXH5CWeeYWS6RCSf3N4MLW9tr9VZeWPtEMQki0/v2uTuQxLfOPqD9jR
         WIhl3SmFlF8p+RLYyP15yOtGKYcqhUw0DzGbofqvBci78ej2kn1NsxtGkIeU1JWOy/u+
         7WwrPk/MzMsRs3DbihkT69EkUEgph7VVvQuxvqclPjcXHZ4P0V3V88Ok/MuCq3ra9i/Z
         0+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682413628; x=1685005628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LCVMEbF9OBiT9IqLI0a7Ll8JBgTJIKseELbvcgMa+QA=;
        b=lYei+JhOPj0GyalTF7Y7GbkKsjXed40KQujxuCxjcNwL5LphctmcGdPDFHF2+8o8Iy
         tvG3RsxSPhKKQ5FudqTDU0XAT73dpvQN72A3K3SniIvEkeFIqv37YKyreO+ZCYVFr4Bh
         vfudYmZhe2fgugVkFyjHDNvjrwj3PKJYARQ9cO36pte+RQxzmJlI1D3IC2bXCBD9Iq68
         fH4LFTjX8W6uQVZ4PvOrHgnxKgdIf6h9Qw67/Lho2KqlN+hzyxX6Wka+t30PkU0hPrmz
         4nmwoL7Lo5am/81ztfGCKHdskJ4Ws5dXU4SA6AcFo+eesdJ7gePtSVhxtbwc0yoPSE7m
         gJBw==
X-Gm-Message-State: AAQBX9f9MCEcxsHM90HLCf7pc3MW5fJ3G5W20D3vKH6roqfQS47ZRj91
        ZA6yI7jdH6EK4C4dBZ6kqAzpAA==
X-Google-Smtp-Source: AKy350bjyupMOPUHuvbuOJ256AYJlB5ByBhqUmj8+IC3dYbt+xT2nHPx4Vqwiv4xCvayJ2aGpwMZog==
X-Received: by 2002:a17:907:9304:b0:958:4c75:705e with SMTP id bu4-20020a170907930400b009584c75705emr9621312ejc.17.1682413628283;
        Tue, 25 Apr 2023 02:07:08 -0700 (PDT)
Received: from [192.168.9.102] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id jt20-20020a170906ca1400b008e54ac90de1sm6476900ejb.74.2023.04.25.02.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 02:07:07 -0700 (PDT)
Message-ID: <8ae78a2c-bbf7-24ce-b47f-3d0b7a258ba0@linaro.org>
Date:   Tue, 25 Apr 2023 11:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: hwmon: esm: Add ESM support
 for TI K3 devices
To:     Guenter Roeck <linux@roeck-us.net>,
        Neha Malcom Francis <n-francis@ti.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, nm@ti.com, vigneshr@ti.com,
        u-kumar1@ti.com, kristo@kernel.org
References: <20230424105011.70674-1-n-francis@ti.com>
 <20230424105011.70674-2-n-francis@ti.com>
 <0ddd5777-cfd0-4b35-a724-681ef9e86d2b@roeck-us.net>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0ddd5777-cfd0-4b35-a724-681ef9e86d2b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 24/04/2023 16:44, Guenter Roeck wrote:
> On Mon, Apr 24, 2023 at 04:20:09PM +0530, Neha Malcom Francis wrote:
>> Document the binding for TI K3 ESM (Error Signaling Module) block.
>>
>> Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
> 
> I think I am missing what this has to do with hardware
> monitoring. I see a driver submission into drivers/misc,
> but that doesn't explain the suggested location of the
> devicetree bindings, and I kind of resist the idea that hwmon
> should be the dumping ground for bindings which don't have
> a home.

Hi Guenter,

This was my suggestion in the previous version, that this device could
look like something related to fault handling or hardware monitoring.
Whether it fits hwmon, I am no sure, just proposed it. Definitely I do
not think of hwmon as dumping ground, but I am rather trying to find
proper place for esm, instead of dumping it in misc (which is a dumping
ground :) ).

https://lore.kernel.org/all/eb6bfe2e-1e44-bfb5-01b9-bbf53eba6501@linaro.org/

Best regards,
Krzysztof

