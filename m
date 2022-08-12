Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21CAA59154A
	for <lists+linux-hwmon@lfdr.de>; Fri, 12 Aug 2022 20:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235403AbiHLSKx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 12 Aug 2022 14:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiHLSKw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Aug 2022 14:10:52 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F0066A68
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 11:10:51 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id l64so1445491pge.0
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Aug 2022 11:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=gIaWr1iQ6msaQo/1J+5iR4hLf1+TB/jKrT6hlsLJmFs=;
        b=Fwxn7nUdhfWQfcb7zZs87Xz3PmxEwVTCqA9T52Y6fh7d6/24bgb6BrR3igmK3dzloT
         KdtPbh3VfqkBeqVBD6pnGTQ0CS/eS45l3ggckCaoOqeHZQlUFFSszd9qvh3/IermGSrE
         LzSDj3vjP/I/5IYQeL6rzBnSPUL8tUxc7F1UXxZI9TxP0UtaehvabJZ5Wzq1zSPV4tww
         4eZvKrs+nk1akqlAUqtOX09ufrMgXfJGdVEw990nSqdol3Z9/vOHGhWftLy4xrK8O4T0
         F6gtDVJTMotoWAWHfq2VXjV2hMieZJQYf842O/pK1KdL3dClhixGJlUq9JCVw6KW6MOx
         suTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=gIaWr1iQ6msaQo/1J+5iR4hLf1+TB/jKrT6hlsLJmFs=;
        b=LOs63yhyRsgcmmQvstpjQCiAk7hKrnbqBIQgS+aYW167GU29Tym0uOd0/puSFKgYNb
         HhzwsOWMjhosqc3Iw1lAZXJufZcoM3LUdibUbLJyiHBi6WyV6CadNeK7+yGyE1ts2TOZ
         AcblWr/jmLXHoS0hHNz0kMstLIZJLr+b+mS5viKFy+Esoqni8fA4pld/sf6lSc9L/YFu
         amFGsd/aoGcrcN6wQj/tPrjgcnVQS2xT8u2nxpskbBon6YU01ve0ltr8iDRye88UAOOH
         fMflFNdPiRFAnaLHisUGNGkzOr7SGQ1df/TU/E9gEws9Ak6Wt0W5yCSV+PejIWIb5DFD
         EW8g==
X-Gm-Message-State: ACgBeo1yUpn6kBlJOyHwMElMNRfwJWLBrB8H4UL0+exAC7ZBllDrXFMN
        6Hx6/veYfa+jNkPtTYQWkmtP3WiCYJI=
X-Google-Smtp-Source: AA6agR5AuLyJKIZMNwyPIZAruEgIo7FGEH4OH93ffHYOhA652Oon4w3Pv9aWfiCPSErQPwHPL5LD3Q==
X-Received: by 2002:aa7:8e91:0:b0:52d:8ebf:29a4 with SMTP id a17-20020aa78e91000000b0052d8ebf29a4mr5072713pfr.1.1660327851110;
        Fri, 12 Aug 2022 11:10:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 22-20020a621516000000b0052ceaba7411sm1893495pfv.125.2022.08.12.11.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 11:10:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a23b1134-52a6-be6e-1be1-f820d0acc4db@roeck-us.net>
Date:   Fri, 12 Aug 2022 11:10:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/7] drm/i915/hwmon: Expose power1_max_interval
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, anshuman.gupta@intel.com,
        jon.ewins@intel.com
References: <20220812173715.2398586-1-badal.nilawar@intel.com>
 <20220812173715.2398586-7-badal.nilawar@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220812173715.2398586-7-badal.nilawar@intel.com>
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
> Expose power1_max_interval, that is the tau corresponding to PL1. Some bit
> manipulation is needed because of the format of PKG_PWR_LIM_1_TIME in
> GT0_PACKAGE_RAPL_LIMIT register (1.x * power(2,y)).
> 
> v2: Update date and kernel version in Documentation (Badal)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   9 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 128 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_reg.h               |   4 +-
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   4 +
>   4 files changed, 142 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index bb1101757154..34668f6c2dc4 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -26,6 +26,15 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		June 2022
> +KernelVersion:	5.19
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> +
>   What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
>   Date:		June 2022
>   KernelVersion:	5.19
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index b1a89a6aa220..6760133c7905 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -15,10 +15,12 @@
>   
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
> + * - time   - milliseconds
>    * - power  - microwatts
>    * - curr   - milliamperes
>    * - energy - microjoules
>    */
> +#define SF_TIME            1000
>   #define SF_POWER	1000000
>   #define SF_CURR		1000
>   #define SF_ENERGY	1000000
> @@ -56,6 +58,7 @@ struct i915_hwmon {
>   	u32 power_max_initial_value;
>   	int scl_shift_power;
>   	int scl_shift_energy;
> +	int scl_shift_time;
>   };
>   
>   static void
> @@ -177,6 +180,128 @@ i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy)
>   	return hwm_energy(ddat, energy);
>   }
>   
> +static ssize_t
> +hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 r, x, y, x_w = 2; /* 2 bits */
> +	u64 tau4, out;
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
> +
> +	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
> +	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
> +	/*
> +	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
> +	 *     = (4 | x) << (y - 2)
> +	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
> +	 * However because y can be < 2, we compute
> +	 *     tau4 = (4 | x) << y
> +	 * but add 2 when doing the final right shift to account for units
> +	 */
> +	tau4 = ((1 << x_w) | x) << y;
> +	/* val in hwmon interface units (millisec) */
> +	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	return sysfs_emit(buf, "%llu\n", out);
> +}
> +
> +static ssize_t
> +hwm_power1_max_interval_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	long val, max_win, ret;
> +	u32 x, y, rxy, x_w = 2; /* 2 bits */
> +	intel_wakeref_t wakeref;
> +	u64 tau4, r;
> +
> +#define PKG_MAX_WIN_DEFAULT 0x12ull
> +
> +	ret = kstrtoul(buf, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* val must be < max in hwmon interface units */
> +	if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku)) {
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +			r = intel_uncore_read64(ddat->uncore, hwmon->rg.pkg_power_sku);
> +		/*
> +		 * FIXME
> +		 * Wa_22015381490:pvc rg.pkg_power_sku value is incorrect on PVC
> +		 * at least. The following seems to work:
> +		 *	r <<= 8;
> +		 * However for now to be safe just use the default value
> +		 * below. Once issue is resolved remove the one line below.
> +		 */
> +		r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	} else {
> +		r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> +	}
> +
> +	/* Steps below are explained in i915_power1_max_interval_show() */
> +	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> +	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> +	tau4 = ((1 << x_w) | x) << y;
> +	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> +
> +	if (val > max_win)
> +		return -EINVAL;
> +
> +	/* val in hw units */
> +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> +	/* Convert to 1.x * power(2,y) */
> +	if (!val)
> +		return -EINVAL;
> +	y = ilog2(val);
> +	/* x = (val - (1 << y)) >> (y - 2); */
> +	x = (val - (1ul << y)) << x_w >> y;
> +
> +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> +
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> +					    PKG_PWR_LIM_1_TIME, rxy);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> +			  hwm_power1_max_interval_show,
> +			  hwm_power1_max_interval_store, 0);
> +
> +static struct attribute *hwm_attributes[] = {
> +	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t hwm_attributes_visible(struct kobject *kobj,
> +				      struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
> +	else
> +		return 0;
> +}
> +
> +static const struct attribute_group hwm_attrgroup = {
> +	.attrs = hwm_attributes,
> +	.is_visible = hwm_attributes_visible,
> +};
> +
> +static const struct attribute_group *hwm_groups[] = {
> +	&hwm_attrgroup,
> +	NULL
> +};
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> @@ -495,6 +620,7 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   
>   	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +	hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>   
>   	/*
>   	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> @@ -533,7 +659,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>   	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
>   						    ddat,
>   						    &hwm_chip_info,
> -						    NULL);
> +						    hwm_groups);
>   	if (IS_ERR(hwmon_dev)) {
>   		mutex_destroy(&hwmon->hwmon_lock);
>   		i915->hwmon = NULL;
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 041b858b95f4..05db98252a2f 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1879,8 +1879,8 @@
>   #define   PKG_MIN_PWR			GENMASK_ULL(30, 16)
>   #define   PKG_MAX_PWR			GENMASK_ULL(46, 32)
>   #define   PKG_MAX_WIN			GENMASK_ULL(54, 48)
> -#define     PKG_MAX_WIN_Y		GENMASK_ULL(54, 53)
> -#define     PKG_MAX_WIN_X		GENMASK_ULL(52, 48)
> +#define     PKG_MAX_WIN_X		GENMASK_ULL(54, 53)
> +#define     PKG_MAX_WIN_Y		GENMASK_ULL(52, 48)
>   
>   #define CHV_CLK_CTL1			_MMIO(0x101100)
>   #define VLV_CLK_CTL2			_MMIO(0x101104)
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index 18fcfc39ca2f..930cb4d76bbb 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -204,6 +204,10 @@
>   
>   #define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>   #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
> +#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
> +#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>   
>   /* snb MCH registers for priority tuning */
>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)

