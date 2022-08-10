Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 215CD58EA68
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Aug 2022 12:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiHJKXt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 10 Aug 2022 06:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiHJKXs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 06:23:48 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99AB753BD
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 03:23:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id v5so7581972wmj.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 03:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ajVjVUaGWNCaKaO3r19Uu8Q8U4l2AUuUO90fz/AwnL8=;
        b=HoZlOqDCx5R2f32HqE6bhlWwFjrYSCvVlIeyAyTerJ12Gd0UrQn5i7/96ufGCuLKbL
         8x63BEVuwFJ67a2VT/lh8vLut91RDH8jJjbx6QtgxKO+G1EBQkklB+iX6a/LBr9NLBh+
         sgO5Y6tiUSog/rtPMjL6nPTWJ6yzFcWSpngU/ncXKQjK6p/gXBIiYt1/qiiZU2mWAzCp
         dTm8/XOqEVPihgvDY6KnTNPW4duy+ItwyhbnScrQnCNTodvbhmSHascBUWxG99Ex0U5/
         ZurGsqfeDo9mlu8Essbq5c8iBnk2nUZh8FrrZgU44JDYJgo6ldvO1zZWHOZmyIi35SAw
         RvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ajVjVUaGWNCaKaO3r19Uu8Q8U4l2AUuUO90fz/AwnL8=;
        b=fuDx8EBnPey+8PaF6Ca7fhvX4g6Sg4e3vzWWB1kZMQ2QnaWVZDNgd57O8QPUrbaJSY
         z5o+LXHct/W2SU0nRHMlVstDfCE/LFNBoqO/5Otnj/0fEkMKPM4hQd3Ei/vFoKP3R8tV
         gj46rs0moKOZRRyKTX7IDj2OTz09LTlvyiRF5D02RRA9q13voCN/PkdPV01xH14uvlkZ
         Z/Ca8RB0Qg5OnE7BI46lOWCW4HBi2F2FFcFixzo+/6TQMi04QoU3yAJwpNT2MRvtptbH
         CVpBlPbolhuKyONTOs5jraiae1UPYfGE1Atz3t+ba7BlFQ139/axsOEY0QvmjuR5fcUN
         noJA==
X-Gm-Message-State: ACgBeo1Xz0wO8tlbD37nNh1UddDjdEeR2fmBAfHp5L6Pex2jcHTiH/k0
        ZgA4xehb+c8R18xCyOcslByvXw==
X-Google-Smtp-Source: AA6agR4EVEbaz0ktI2X3vMprZNM7jPwwRft8+KH2jmXxs1Eoy2Cc7gjXHa3KXW4jZmuVzjJkcQdJ3w==
X-Received: by 2002:a05:600c:3487:b0:3a4:ecbf:4cb9 with SMTP id a7-20020a05600c348700b003a4ecbf4cb9mr1917640wmq.98.1660127025473;
        Wed, 10 Aug 2022 03:23:45 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v18-20020a5d6112000000b002207cec45cesm19695607wrt.81.2022.08.10.03.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 03:23:45 -0700 (PDT)
Message-ID: <61109578-8136-d544-0bdc-d65c0736c566@linaro.org>
Date:   Wed, 10 Aug 2022 12:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 26/33] hwmon/drivers/pm_bus: Switch to new of thermal
 API
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linexp.org>
Cc:     rafael@kernel.org, rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        abailon@baylibre.com, lukasz.luba@arm.com, broonie@kernel.org,
        damien.lemoal@opensource.wdc.com, heiko@sntech.de,
        hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
        talel@amazon.com, thierry.reding@gmail.com, digetx@gmail.com,
        jonathanh@nvidia.com, anarsoul@gmail.com, tiny.windzz@gmail.com,
        baolin.wang7@gmail.com, f.fainelli@gmail.com,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        glaroque@baylibre.com, miquel.raynal@bootlin.com,
        shawnguo@kernel.org, niklas.soderlund@ragnatech.se,
        matthias.bgg@gmail.com, j-keerthy@ti.com,
        Jean Delvare <jdelvare@suse.com>,
        "open list:PMBUS HARDWARE MONITORING DRIVERS" 
        <linux-hwmon@vger.kernel.org>
References: <20220804224349.1926752-1-daniel.lezcano@linexp.org>
 <20220804224349.1926752-27-daniel.lezcano@linexp.org>
 <20220808102949.GC1969424@roeck-us.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220808102949.GC1969424@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/08/2022 12:29, Guenter Roeck wrote:
> On Fri, Aug 05, 2022 at 12:43:42AM +0200, Daniel Lezcano wrote:
>> The thermal OF code has a new API allowing to migrate the OF
>> initialization to a simpler approach. The ops are no longer device
>> tree specific and are the generic ones provided by the core code.
>>
>> Convert the ops to the thermal_zone_device_ops format and use the new
>> API to register the thermal zone with these generic ops.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
> 
> Subject tag should be something like "hwmon: (pmbus) ...".
> 
> Also, from other patches it appears that this would or might result
> in a registration failure if a thermal zone for the sensor does not
> exist. This will need to be resolved before the patch is can be applied.

With the subject fixed, shall I add your Acked-by ?



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
