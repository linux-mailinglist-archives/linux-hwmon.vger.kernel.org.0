Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB124ECDAB
	for <lists+linux-hwmon@lfdr.de>; Wed, 30 Mar 2022 22:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350808AbiC3UB4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 30 Mar 2022 16:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346007AbiC3UBv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Mar 2022 16:01:51 -0400
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com [192.185.149.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8684C2AC4D
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Mar 2022 13:00:05 -0700 (PDT)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 2E7D133185
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Mar 2022 15:00:03 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id ZeU5nkSVJXvvJZeU5nuIIZ; Wed, 30 Mar 2022 15:00:03 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eXKZchLq+5LAGT1CxaeWrPz836JWwoNXNHtPmYfC0Zo=; b=JCyTECsdx3bl2Vioe5IuGnejLk
        plknHaucGbgrqi0zPkmebDyQwB8l8dJzO9Aji68ic99WsSsg7lV8X6KeQQQAIPgVxqzn7WBO5XtuC
        ZfEPqFdPCKYYnUoezIDXs/ZbAtCZhSOvX9m+oqI63Wu0kQycj0Xh2EDsNn/HiE/2OFiShGkJQfhuc
        yC6q807BIaNz4sGTsq6w2ymycnwtW3D8jWRRF6o9UDPoAZLLLOv6vqNXRrNdfegvwlHKjDrnRIvvz
        Zz7xAfZGh264XVDuPE7Y5YTZsVoQpfkuLP2ksDisqi1EmAEonQZPE+dmcSIrskVdJ9iOuOuk82rnj
        WmYj9CzQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54580)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nZeU4-001VGm-VT; Wed, 30 Mar 2022 20:00:01 +0000
Message-ID: <2fbefb5f-a53c-ea68-0a1d-90c60f90d667@roeck-us.net>
Date:   Wed, 30 Mar 2022 12:59:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] hwmon: (bt1-pvt) use generic polynomial functions
Content-Language: en-US
To:     Michael Walle <michael@walle.cc>, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220328112505.3025374-1-michael@walle.cc>
 <20220328112505.3025374-3-michael@walle.cc>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220328112505.3025374-3-michael@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nZeU4-001VGm-VT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54580
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/28/22 04:25, Michael Walle wrote:
> The polynomial calculation function was moved into lib/ to be able to
> reuse it. Move over to this one.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/hwmon/Kconfig   |  1 +
>   drivers/hwmon/bt1-pvt.c | 50 +++++++++++------------------------------
>   2 files changed, 14 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 68a8a27ab3b7..be9773270e53 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -415,6 +415,7 @@ config SENSORS_ATXP1
>   config SENSORS_BT1_PVT
>   	tristate "Baikal-T1 Process, Voltage, Temperature sensor driver"
>   	depends on MIPS_BAIKAL_T1 || COMPILE_TEST
> +	select POLYNOMIAL
>   	help
>   	  If you say yes here you get support for Baikal-T1 PVT sensor
>   	  embedded into the SoC.
> diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
> index 74ce5211eb75..21ab172774ec 100644
> --- a/drivers/hwmon/bt1-pvt.c
> +++ b/drivers/hwmon/bt1-pvt.c
> @@ -26,6 +26,7 @@
>   #include <linux/mutex.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/polynomial.h>
>   #include <linux/seqlock.h>
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
> @@ -65,7 +66,7 @@ static const struct pvt_sensor_info pvt_info[] = {
>    *     48380,
>    * where T = [-48380, 147438] mC and N = [0, 1023].
>    */
> -static const struct pvt_poly __maybe_unused poly_temp_to_N = {
> +static const struct polynomial __maybe_unused poly_temp_to_N = {
>   	.total_divider = 10000,
>   	.terms = {
>   		{4, 18322, 10000, 10000},
> @@ -76,7 +77,7 @@ static const struct pvt_poly __maybe_unused poly_temp_to_N = {
>   	}
>   };
>   
> -static const struct pvt_poly poly_N_to_temp = {
> +static const struct polynomial poly_N_to_temp = {
>   	.total_divider = 1,
>   	.terms = {
>   		{4, -16743, 1000, 1},
> @@ -97,7 +98,7 @@ static const struct pvt_poly poly_N_to_temp = {
>    * N = (18658e-3*V - 11572) / 10,
>    * V = N * 10^5 / 18658 + 11572 * 10^4 / 18658.
>    */
> -static const struct pvt_poly __maybe_unused poly_volt_to_N = {
> +static const struct polynomial __maybe_unused poly_volt_to_N = {
>   	.total_divider = 10,
>   	.terms = {
>   		{1, 18658, 1000, 1},
> @@ -105,7 +106,7 @@ static const struct pvt_poly __maybe_unused poly_volt_to_N = {
>   	}
>   };
>   
> -static const struct pvt_poly poly_N_to_volt = {
> +static const struct polynomial poly_N_to_volt = {
>   	.total_divider = 10,
>   	.terms = {
>   		{1, 100000, 18658, 1},
> @@ -113,31 +114,6 @@ static const struct pvt_poly poly_N_to_volt = {
>   	}
>   };
>   
> -/*
> - * Here is the polynomial calculation function, which performs the
> - * redistributed terms calculations. It's pretty straightforward. We walk
> - * over each degree term up to the free one, and perform the redistributed
> - * multiplication of the term coefficient, its divider (as for the rationale
> - * fraction representation), data power and the rational fraction divider
> - * leftover. Then all of this is collected in a total sum variable, which
> - * value is normalized by the total divider before being returned.
> - */
> -static long pvt_calc_poly(const struct pvt_poly *poly, long data)
> -{
> -	const struct pvt_poly_term *term = poly->terms;
> -	long tmp, ret = 0;
> -	int deg;
> -
> -	do {
> -		tmp = term->coef;
> -		for (deg = 0; deg < term->deg; ++deg)
> -			tmp = mult_frac(tmp, data, term->divider);
> -		ret += tmp / term->divider_leftover;
> -	} while ((term++)->deg);
> -
> -	return ret / poly->total_divider;
> -}
> -
>   static inline u32 pvt_update(void __iomem *reg, u32 mask, u32 data)
>   {
>   	u32 old;
> @@ -324,9 +300,9 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>   	} while (read_seqretry(&cache->data_seqlock, seq));
>   
>   	if (type == PVT_TEMP)
> -		*val = pvt_calc_poly(&poly_N_to_temp, data);
> +		*val = polynomial_calc(&poly_N_to_temp, data);
>   	else
> -		*val = pvt_calc_poly(&poly_N_to_volt, data);
> +		*val = polynomial_calc(&poly_N_to_volt, data);
>   
>   	return 0;
>   }
> @@ -345,9 +321,9 @@ static int pvt_read_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>   		data = FIELD_GET(PVT_THRES_HI_MASK, data);
>   
>   	if (type == PVT_TEMP)
> -		*val = pvt_calc_poly(&poly_N_to_temp, data);
> +		*val = polynomial_calc(&poly_N_to_temp, data);
>   	else
> -		*val = pvt_calc_poly(&poly_N_to_volt, data);
> +		*val = polynomial_calc(&poly_N_to_volt, data);
>   
>   	return 0;
>   }
> @@ -360,10 +336,10 @@ static int pvt_write_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>   
>   	if (type == PVT_TEMP) {
>   		val = clamp(val, PVT_TEMP_MIN, PVT_TEMP_MAX);
> -		data = pvt_calc_poly(&poly_temp_to_N, val);
> +		data = polynomial_calc(&poly_temp_to_N, val);
>   	} else {
>   		val = clamp(val, PVT_VOLT_MIN, PVT_VOLT_MAX);
> -		data = pvt_calc_poly(&poly_volt_to_N, val);
> +		data = polynomial_calc(&poly_volt_to_N, val);
>   	}
>   
>   	/* Serialize limit update, since a part of the register is changed. */
> @@ -522,9 +498,9 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>   		return -ETIMEDOUT;
>   
>   	if (type == PVT_TEMP)
> -		*val = pvt_calc_poly(&poly_N_to_temp, data);
> +		*val = polynomial_calc(&poly_N_to_temp, data);
>   	else
> -		*val = pvt_calc_poly(&poly_N_to_volt, data);
> +		*val = polynomial_calc(&poly_N_to_volt, data);
>   
>   	return 0;
>   }

