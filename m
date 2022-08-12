Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13588591541
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Aug 2022 20:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237768AbiHLSJ1 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 12 Aug 2022 14:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236842AbiHLSJ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Aug 2022 14:09:26 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC57B2D80
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 11:09:24 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id u133so1574675pfc.10
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 11:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=cvyQBL4SwFYRMmUi7qJfLzd05mnh+TREnEhjKGqaFbY=;
        b=e7flfwCJFm7lPbwoF76kElxAElWrlZtwh8A6notI4ToYnigeH3b9VZ2yFPZUfzGRJn
         lcp3n1ZyQknWTtsu2So3FO98qXedbLTwXtRnHLDweO6KpYKEpXOxr0msI64l5rYTH8le
         FtqsoHAOAe5EY/VEL1rJLtPApmFoRn2cIHiQhc4VSdSpVIO1YcSsKtbhbtOdEjKE8+d6
         Pwol8I2rCowEYd+mmd2ZqqicciA2gI+E8D31awYQ1N2l7nVO+vfNNrG7rnsRbwTWAZ45
         HIAhw9lUIJwRvJ9Qnk+aPcYwDpwGQL0Tnbmb1X70e6aiAXksrBMCgbzG732bMPdeWxxj
         GxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=cvyQBL4SwFYRMmUi7qJfLzd05mnh+TREnEhjKGqaFbY=;
        b=DG9xGQUUoV34FieEpCvHFfd+NDcNtwiZYwpwyuguWIWW0HdNWUZI6CgdgwhxHm+EfF
         JS2QdINwIR3ydZoNc4DI6r3gqa1fpJNCTpmMAbAMNouanaSoJKqsgsATu36FP6biGD8S
         E4xQ2QUNOmHPirMyZ4JvXenABeP+6PC1SersOxRfxf1Y5LtkQcjEoHcxYlD55zelBKrV
         ft4B+CShIvdfE+fbn4iplQX+6lZRkBhP6cPHIG0ChlfL214Q52d7VwunpBJo7ScycNpD
         yCe6nVrIIDAjuBQBFuGIuxuixLI23wJriU0jhdYDEeCtmFfCmYsjFYIFDlFpr8QJOLab
         WkZA==
X-Gm-Message-State: ACgBeo1wScTcS6nQU7j/9cvp0O/9aWFLiyC3dRbz68KzOlLJrlBQwq67
        Xm3+6NJGRq6TwhsQ4QPR05lxtSnFZ7I=
X-Google-Smtp-Source: AA6agR7cobk7eoDMMQno+4nupminUGBXKHVe3VLwoZfHkiRZnUxHXYeT4MFfkmbRti+07zoACLZZxA==
X-Received: by 2002:a05:6a00:1252:b0:52e:b81f:f70c with SMTP id u18-20020a056a00125200b0052eb81ff70cmr5131144pfi.5.1660327764310;
        Fri, 12 Aug 2022 11:09:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c83-20020a624e56000000b005251f4596f0sm1878660pfb.107.2022.08.12.11.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 11:09:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01ff566f-9b93-31ce-b8fa-be903fa7b3cc@roeck-us.net>
Date:   Fri, 12 Aug 2022 11:09:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] drm/i915/hwmon: Expose card reactive critical power
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com
References: <20220812173715.2398586-1-badal.nilawar@intel.com>
 <20220812173715.2398586-6-badal.nilawar@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220812173715.2398586-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/12/22 10:37, Badal Nilawar wrote:
> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Expose the card reactive critical (I1) power. I1 is exposed as
> power1_crit in microwatts (typically for client products) or as
> curr1_crit in milliamperes (typically for server).
> 
> v2: Add curr1_crit functionality (Ashutosh)
> v3:
>    - Use HWMON_CHANNEL_INFO to define power1_crit, curr1_crit (Badal)
>    - Update date and kernel version in Documentation.
> v4: Use hwm_ prefix for static functions (Ashutosh)
> 
> Acked-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon | 26 +++++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 95 ++++++++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h               |  6 ++
>   3 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 03d71c6869d3..bb1101757154 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,32 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
> +Date:		June 2022
> +KernelVersion:	5.19
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +
> +		Card reactive critical (I1) power limit in microwatts is exposed
> +		for client products. The power controller will throttle the
> +		operating frequency if the power averaged over a window exceeds
> +		this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
> +Date:		June 2022
> +KernelVersion:	5.19
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +
> +		Card reactive critical (I1) power limit in milliamperes is
> +		exposed for server products. The power controller will throttle
> +		the operating frequency if the power averaged over a window
> +		exceeds this limit.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>   What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
>   Date:		June 2022
>   KernelVersion:	5.19
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 416c77c89609..b1a89a6aa220 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -10,14 +10,17 @@
>   #include "i915_drv.h"
>   #include "i915_hwmon.h"
>   #include "intel_mchbar_regs.h"
> +#include "intel_pcode.h"
>   #include "gt/intel_gt_regs.h"
>   
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - power  - microwatts
> + * - curr   - milliamperes
>    * - energy - microjoules
>    */
>   #define SF_POWER	1000000
> +#define SF_CURR		1000
>   #define SF_ENERGY	1000000
>   
>   #define FIELD_SHIFT(__mask)				    \
> @@ -176,11 +179,25 @@ i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy)
>   
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>   	NULL
>   };
>   
> +/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
> +static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
> +{
> +	return snb_pcode_read_p(&i915->uncore, PCODE_POWER_SETUP,
> +				POWER_SETUP_SUBCOMMAND_READ_I1, 0, uval);
> +}
> +
> +static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
> +{
> +	return  snb_pcode_write_p(&i915->uncore, PCODE_POWER_SETUP,
> +				  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0, uval);
> +}
> +
>   static umode_t
>   hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
>   {
> @@ -214,13 +231,18 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   static umode_t
>   hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
>   {
> +	struct drm_i915_private *i915 = ddat->uncore->i915;
>   	struct i915_hwmon *hwmon = ddat->hwmon;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
>   		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
>   	case hwmon_power_rated_max:
>   		return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
> +	case hwmon_power_crit:
> +		return (hwm_pcode_read_i1(i915, &uval) ||
> +			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>   	default:
>   		return 0;
>   	}
> @@ -230,6 +252,8 @@ static int
>   hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   {
>   	struct i915_hwmon *hwmon = ddat->hwmon;
> +	int ret;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> @@ -248,6 +272,15 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
>   						hwmon->scl_shift_power,
>   						SF_POWER);
>   		return 0;
> +	case hwmon_power_crit:
> +		ret = hwm_pcode_read_i1(ddat->uncore->i915, &uval);
> +		if (ret)
> +			return ret;
> +		if (!(uval & POWER_SETUP_I1_WATTS))
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_POWER, POWER_SETUP_I1_SHIFT);
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -257,6 +290,7 @@ static int
>   hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   {
>   	struct i915_hwmon *hwmon = ddat->hwmon;
> +	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> @@ -267,6 +301,9 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   					  hwmon->scl_shift_power,
>   					  SF_POWER, val);
>   		return 0;
> +	case hwmon_power_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
> +		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -298,6 +335,56 @@ hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
>   	}
>   }
>   
> +static umode_t
> +hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct drm_i915_private *i915 = ddat->uncore->i915;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		return (hwm_pcode_read_i1(i915, &uval) ||
> +			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	int ret;
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		ret = hwm_pcode_read_i1(ddat->uncore->i915, &uval);
> +		if (ret)
> +			return ret;
> +		if (uval & POWER_SETUP_I1_WATTS)
> +			return -ENODEV;
> +		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
> +				       SF_CURR, POWER_SETUP_I1_SHIFT);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
> +{
> +	u32 uval;
> +
> +	switch (attr) {
> +	case hwmon_curr_crit:
> +		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
> +		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -311,6 +398,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_power_is_visible(ddat, attr, channel);
>   	case hwmon_energy:
>   		return hwm_energy_is_visible(ddat, attr);
> +	case hwmon_curr:
> +		return hwm_curr_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -329,6 +418,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_power_read(ddat, attr, channel, val);
>   	case hwmon_energy:
>   		return hwm_energy_read(ddat, attr, val);
> +	case hwmon_curr:
> +		return hwm_curr_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -343,6 +434,8 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	switch (type) {
>   	case hwmon_power:
>   		return hwm_power_write(ddat, attr, channel, val);
> +	case hwmon_curr:
> +		return hwm_curr_write(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0bc6ae0c8bd7..041b858b95f4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6788,6 +6788,12 @@
>   #define   DG1_PCODE_STATUS			0x7E
>   #define     DG1_UNCORE_GET_INIT_STATUS		0x0
>   #define     DG1_UNCORE_INIT_STATUS_COMPLETE	0x1
> +#define   PCODE_POWER_SETUP			0x7C
> +#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
> +#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
> +#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
> +#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
> +#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US	0x23
>   #define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
>   /* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */

