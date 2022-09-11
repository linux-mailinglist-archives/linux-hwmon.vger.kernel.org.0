Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6095B4F1B
	for <lists+linux-hwmon@lfdr.de>; Sun, 11 Sep 2022 15:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiIKNfa (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 11 Sep 2022 09:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiIKNf2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 11 Sep 2022 09:35:28 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E94E2E9CD
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Sep 2022 06:35:26 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id p5so7593878ljc.13
        for <linux-hwmon@vger.kernel.org>; Sun, 11 Sep 2022 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KICw7UMl7zN23PIkXw/yJP4KTrozrVApXevGldlrPOo=;
        b=FvkMmM0nF9BOpltwukZ1eETLa9lu+wZbzCJEwXswmP3jC7vtJqvX3Lwd5drKZPSwQa
         0A012OE5i9Jc8TNKsM30kebAXaiqKK4qziLLe1O0GCDvLkMHNcqT/0PufQa0+EO8khgT
         UZkX3uAlqssIECsMGJw+B4F63Jg93Z0ybKR4xKMDYqC9G94xZE8+kyuSPI+wS6h3yG1n
         OLVUXwkvXOjMuCOwn+OLmHMCVxZhT3kGOnf9gm8EYayMHhqows1ZImqrddu9ZfZSr7ex
         XqADU2RSkmAHup/Nrty5QZFQIjNFNd4uhURlLFXXoejAG1nB9IZbgVmvaDJ6i0Ww8NKy
         GmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KICw7UMl7zN23PIkXw/yJP4KTrozrVApXevGldlrPOo=;
        b=01OmI2/8YRSF0H7BPkcngDFYXw54ZdhH+K3RQFz/kNzalsVXRk7JTgHddy/lyJzqL5
         8fZu9uC6jQX6X9I3W0EIuvc/qxDKQdF6vjsVI6zk+vNIV/1q5a/E2F+fLhflLGHFoet8
         VDOCEyBCefO8A5cTL0Cyk235Axecv9SmazvZ+rjIDAOpBwu6oWZoUR1AIojODOHfmn1d
         roE1kACyluxAfJ/BWtA1qizq656ld9TsBbALN8f8Z27hUVY/bz9tXRmj9A7gmK53wfVv
         u7cPd8ucfsILSoVoggyhL5VD9QlqWBqpO0LXwARJ3HPJa3xbc8+W6smHPaF0rcfVyzoa
         Dicg==
X-Gm-Message-State: ACgBeo3V7E2Rs8NOhwMczQMnvP97jc/1/eTpO49I37NWQmt+oCEYaAdM
        a04Rd/eNaMU5sZJTjsFpBL9Nsw==
X-Google-Smtp-Source: AA6agR7ht56AETrc67OcWwjk2ZdTN89lNQG6sdK7NhjVDq+yGtmrt31v3dYPncjALQdQHUUg3ZF0PA==
X-Received: by 2002:a2e:8709:0:b0:26b:eb1d:a811 with SMTP id m9-20020a2e8709000000b0026beb1da811mr2510375lji.64.1662903324811;
        Sun, 11 Sep 2022 06:35:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v9-20020a05651203a900b004946bec4e61sm614338lfp.140.2022.09.11.06.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:35:24 -0700 (PDT)
Message-ID: <f32df517-ce96-d461-89a9-df16b46ebcc2@linaro.org>
Date:   Sun, 11 Sep 2022 15:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 3/4] dt-bindings: hwmon: Add bindings for max31760
Content-Language: en-US
To:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>, jdelvare@suse.com,
        linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220910171945.48088-1-Ibrahim.Tilki@analog.com>
 <20220910171945.48088-4-Ibrahim.Tilki@analog.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910171945.48088-4-Ibrahim.Tilki@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/09/2022 19:19, Ibrahim Tilki wrote:
> Adding bindings for Analog Devices MAX31760 Fan-Speed Controller
> 
> Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> ---
>  .../bindings/hwmon/adi,max31760.yaml          | 42 +++++++++++++++++++

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof
