Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4176E6FBFE6
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 May 2023 09:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbjEIHE7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 May 2023 03:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235199AbjEIHEu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 May 2023 03:04:50 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F95449C2
        for <linux-hwmon@vger.kernel.org>; Tue,  9 May 2023 00:04:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so591104a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 May 2023 00:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683615888; x=1686207888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9je2FiauGBpFiGNJuwOsfynyz1TKYfPJaan1c/py7Y=;
        b=D4+9QhI/kNNxXPNutfq2ILahcxiAWKrUfsTo97PPROu9ivhwKFV3/E8RMciUASPo0n
         yG1kMKkT01JSU1bNXtmniTKcfILcFK80VlKurWmFbPGXg/flE4z1CvlcFOMkzmIX4Zl1
         TvCANS3/Xh7Nu+stOIn3rmFvwtxwh16enf07X4dr1bor+KNugP2/YbXqbPSmkDSRYjuC
         A9hHL6oytNsbxf2gVoG9Jtzb8TwTmrXFTa6h5vOujBKmGlpDLFqVcDjbi1fnKPpzHs6n
         zsRwlyXLHNo742n0yqEWeTpUqJLi5NFWuMIQkGnWmYm4h5Xb7/C+Q1o+m8Njd1XBTx61
         8YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615888; x=1686207888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R9je2FiauGBpFiGNJuwOsfynyz1TKYfPJaan1c/py7Y=;
        b=WVSuJZWWaG/5Uf9tY9MkTWnzP6CBPEx16E6UshkFBOM08my/SaDLZ/Pd+1VhWzUVxe
         ktHYd2DUnErRj8qds90Wg8vTRXqj3A+pVU3M/vIU7owzMSWKJtocEtsLyHUs99jVpa/9
         T2IUw9EEEQAIa13/g3AfErBteEY4B7pNHXv558DIx8HypnHZ1QvNiTEGBacknbFInYja
         17/VgPvLtXsv9Ho61dPV49IodBAtzA85aYsBBCP6Gqm2445cXs3lyArqxfh2otnPY0QW
         F1nuaGR+/zcb6K2oLLk6yb0pichCH0dbdvqBk1s0Mzya8qS2Ad+4R4GqgZm4DgZPYYk+
         g7Bg==
X-Gm-Message-State: AC+VfDwssVU1YGK2hOPIJS8EK+1pu2QFxAYhUu1RnEo/dzg6q0jcmKrO
        ghPeRw1txzSmZFZxBhxuAkHfwA==
X-Google-Smtp-Source: ACHHUZ6hzC1saOmkygWVMlKVmHxOKkKYHghk1vO57fI/ZQ+sGNQ4PG/m94tnvrs43zivvvCJqWc/XA==
X-Received: by 2002:a05:6402:12d5:b0:50c:9582:e968 with SMTP id k21-20020a05640212d500b0050c9582e968mr9527951edx.36.1683615887756;
        Tue, 09 May 2023 00:04:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7c70c000000b0050bd7267a5csm398739edq.58.2023.05.09.00.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 00:04:47 -0700 (PDT)
Message-ID: <fdea3d7d-b8a8-620c-6cfb-aee3600fa5a8@linaro.org>
Date:   Tue, 9 May 2023 09:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv2 6/6] arm64: dts: socfpga: add hwmon properties
Content-Language: en-US
To:     dinh.nguyen@linux.intel.com, linux-hwmon@vger.kernel.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net
References: <20230508212852.8413-1-dinh.nguyen@linux.intel.com>
 <20230508212852.8413-6-dinh.nguyen@linux.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508212852.8413-6-dinh.nguyen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/05/2023 23:28, dinh.nguyen@linux.intel.com wrote:
> From: Dinh Nguyen <dinh.nguyen@linux.intel.com>
> 
> Add the hardware monitoring properties for Stratix10 and Agilex.
> 
> Signed-off-by: Dinh Nguyen <dinh.nguyen@linux.intel.com>
> ---
> v2: add platform specific platforms to DTS files
> ---
>  .../boot/dts/altera/socfpga_stratix10.dtsi    |  4 ++
>  .../dts/altera/socfpga_stratix10_socdk.dts    | 31 +++++++++
>  arch/arm64/boot/dts/intel/socfpga_agilex.dtsi |  4 ++
>  .../boot/dts/intel/socfpga_agilex_n6000.dts   | 66 +++++++++++++++++++
>  .../boot/dts/intel/socfpga_agilex_socdk.dts   | 66 +++++++++++++++++++
>  .../dts/intel/socfpga_agilex_socdk_nand.dts   | 66 +++++++++++++++++++
>  .../boot/dts/intel/socfpga_n5x_socdk.dts      | 47 +++++++++++++
>  7 files changed, 284 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> index 41c9eb51d0ee..2526afa687d6 100644
> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> @@ -633,6 +633,10 @@ svc {
>  				fpga_mgr: fpga-mgr {
>  					compatible = "intel,stratix10-soc-fpga-mgr";
>  				};
> +
> +				hwmon: temp-volt {

Node names should be generic, so maybe just hwmon.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +					compatible = "intel,socfpga-stratix10-hwmon", "intel,socfpga-hwmon";

Test your bindings. Your bindings or this part do not match at all.
Driver does not match it either.

Best regards,
Krzysztof

