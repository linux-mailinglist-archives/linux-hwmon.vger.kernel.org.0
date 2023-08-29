Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997C278CA9B
	for <lists+linux-hwmon@lfdr.de>; Tue, 29 Aug 2023 19:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbjH2RSB (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 29 Aug 2023 13:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237749AbjH2RRh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2023 13:17:37 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D946DE56
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Aug 2023 10:17:08 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52a069edca6so6458998a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Aug 2023 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329400; x=1693934200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TE6REv5FDMxXuFkdl9dtqRlOhG+PJjdbb94kPR4V9ZM=;
        b=q0oZlYNMgzrk7CKnGWIvUUk5pF0dAJ+oX1ToFAH4s4d2O7mxE+xbe8EjuOB0itTgrV
         pSLLnIzj5MiD33Ya+RTv9C6bKPjpzCRjm3lmomzrC4Ldr07F7bUJJxjF0dZ/6HtYoK5s
         GyhlNlo0yM9eASb/ZlGLzi2io3qgv0YgVM2oLEUr5YGANFCFAT4sWj8s79lJw+GL4A5K
         ELv+hSD7qPx2ngzm/JrjR8I5qKnljmLCNPMLLY82m4bsDhP4KuzdVmjksESvz6chUSMM
         4jxKATwXN+WDIh6w+2N0EylnYiksNVKrmHPgY1gfcqGcKdBFjOjGatumtEwvA1yD4HAx
         3S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329400; x=1693934200;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TE6REv5FDMxXuFkdl9dtqRlOhG+PJjdbb94kPR4V9ZM=;
        b=Qgs24W/q4Dn/2Wfr5XvjleSndEx0tC5r0Q7bExmv658Ih1UwSnFnlPoh5nNA6Ln5HD
         +KmXMnx8qEECVGJijfPQUZTkD+QwIN51RfYL10p9wj5kosfgLz+Ng1m9ZmsEbvQGdf0l
         fKizqq++zE/o2YlZUlPsgimMObHlLBAuRNtaHqmKsAgWbxU4RTFEKHyqR7znBOvtfU16
         3kAW8g2VASvdyIaqp/lAwuLqQqR2q9MwgiNb4GWTnGVWx/EnkpiQicG6TZM5H50hk+c/
         RP5QaPWyMRjXz8p+Sb4hL9gmHQrLG76b8hDJDdaj0YSZ+8jNs+wsKx0UYRgQH1IQV7E5
         /8FQ==
X-Gm-Message-State: AOJu0Yzzj4RWIHPZR/JT+G2Ng6/7dBrigiRsjvY50/rkPs09WabOVjcC
        ZpKH3Mo1QWp4jduNxcxXx3VYnQ==
X-Google-Smtp-Source: AGHT+IGnNDXZwwkJpyoypMuFWa907nIL1OBbnA2tbYmZfgtQnAyfBbRhrdhpCAfMIdlPdIobMjUBVQ==
X-Received: by 2002:a05:6402:1614:b0:522:1e2f:fa36 with SMTP id f20-20020a056402161400b005221e2ffa36mr20848714edv.28.1693329400031;
        Tue, 29 Aug 2023 10:16:40 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id m12-20020a056402050c00b0051bed21a635sm5878688edv.74.2023.08.29.10.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:16:39 -0700 (PDT)
Message-ID: <0b5dbcf1-fd5e-0052-9f08-bae067ceb463@linaro.org>
Date:   Tue, 29 Aug 2023 19:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to
 json-schema
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Ninad Malwade <nmalwade@nvidia.com>, jdelvare@suse.com,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <20230825164249.22860-2-nmalwade@nvidia.com>
 <05c115cc-ce7a-747a-2f91-045bb87db706@linaro.org>
 <c9a3f145-67e5-4ff5-19aa-809528586d9e@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c9a3f145-67e5-4ff5-19aa-809528586d9e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 29/08/2023 14:46, Jon Hunter wrote:
> it a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>> new file mode 100644
>>> index 000000000000..0c6d41423d8c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
>>> @@ -0,0 +1,109 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>
>> I assume you do not use standard license because of copying the description?
> 
> 
> Probably just an oversight. I assume we can just update to be dual licensed?

checkpatch would complain, which means it was not run?

Dual license, please, as asked by checkpatch.



Best regards,
Krzysztof

