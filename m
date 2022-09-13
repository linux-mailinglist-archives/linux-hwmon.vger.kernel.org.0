Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351795B69DB
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Sep 2022 10:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiIMIuO (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 13 Sep 2022 04:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiIMIuN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Sep 2022 04:50:13 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21F312D0F
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Sep 2022 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663059011; x=1694595011;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=62Ot3yGOY/0GArSXxcawXn13GnI/Dc/39ivuwuUV+M4=;
  b=fcxBchosGloRXMnBpzmmFBbEy5JveOdVpukAmcAdssrE0Iw/fNtz6ijb
   WJq2y43E7BymdL65zvo4qyWk945QCGA8ZLa8Ugt1nntDCjYPZNI9p83oO
   PTbdMQ4HJR2vSq77E4MnHuD2fEIdDSJO+02hcsNjYLceUdIXaLYABdCDe
   pFcTmhp36knh3ke9gkKnrYfwxJyBYHa8FT6tYx5FJF56vrMmPnMPmIgeC
   9hP9IEtovQFCm0+7yPJcgQIPbNM44e6pFBWZSS2+64jd+3RW/TH+o31Tl
   evVnCCFsDAnFnzyDQ1wHdqgbYxwP/7KqSLXEN5fpt9ezmdnnfh5eh7l7K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="277816468"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="277816468"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 01:50:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="593855090"
Received: from greenoguewh4.ger.corp.intel.com (HELO [10.213.204.46]) ([10.213.204.46])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 01:50:10 -0700
Message-ID: <ec4dd4de-5e3a-5c4b-e318-f5afc4644d0a@linux.intel.com>
Date:   Tue, 13 Sep 2022 09:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 4/7] drm/i915/hwmon: Show device level energy
 usage
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org
References: <20220825132118.784407-1-badal.nilawar@intel.com>
 <20220825132118.784407-5-badal.nilawar@intel.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220825132118.784407-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 25/08/2022 14:21, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> Use i915 HWMON to display device level energy input.
> 
> v2:
>    - Updated the date and kernel version in feature description
> 
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |   8 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 119 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_hwmon.h             |   1 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   2 +
>   4 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 9a2d10edfce8..03d71c6869d3 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -25,3 +25,11 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		June 2022
> +KernelVersion:	5.19

Date and kernel version will need updating throughout I think.

But why I am here actually is to ask if there are plans to make 
intel_gpu_top support this? It would be nice to have since it reports 
power for integrated.

Regards,

Tvrtko

> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Energy input of device in microjoules.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 922463da65bf..e35f125be242 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -16,8 +16,10 @@
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - power  - microwatts
> + * - energy - microjoules
>    */
>   #define SF_POWER	1000000
> +#define SF_ENERGY	1000000
>   
>   #define FIELD_SHIFT(__mask)				    \
>   	(BUILD_BUG_ON_ZERO(!__builtin_constant_p(__mask)) + \
> @@ -29,12 +31,19 @@ struct hwm_reg {
>   	i915_reg_t pkg_power_sku_unit;
>   	i915_reg_t pkg_power_sku;
>   	i915_reg_t pkg_rapl_limit;
> +	i915_reg_t energy_status_all;
> +};
> +
> +struct hwm_energy_info {
> +	u32 reg_val_prev;
> +	long accum_energy;			/* Accumulated energy for energy1_input */
>   };
>   
>   struct hwm_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
> +	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
>   	char name[12];
>   };
>   
> @@ -43,6 +52,7 @@ struct i915_hwmon {
>   	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>   	struct hwm_reg rg;
>   	int scl_shift_power;
> +	int scl_shift_energy;
>   };
>   
>   static void
> @@ -102,9 +112,72 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>   					    bits_to_clear, bits_to_set);
>   }
>   
> +/*
> + * hwm_energy - Obtain energy value
> + *
> + * The underlying energy hardware register is 32-bits and is subject to
> + * overflow. How long before overflow? For example, with an example
> + * scaling bit shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and
> + * a power draw of 1000 watts, the 32-bit counter will overflow in
> + * approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + *
> + * The function significantly increases overflow duration (from 4.36
> + * minutes) by accumulating the energy register into a 'long' as allowed by
> + * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
> + * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
> + * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> + * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + */
> +static int
> +hwm_energy(struct hwm_drvdata *ddat, long *energy)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct hwm_energy_info *ei = &ddat->ei;
> +	intel_wakeref_t wakeref;
> +	i915_reg_t rgaddr;
> +	u32 reg_val;
> +
> +	rgaddr = hwmon->rg.energy_status_all;
> +
> +	if (!i915_mmio_reg_valid(rgaddr))
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_val = intel_uncore_read(uncore, rgaddr);
> +
> +	if (reg_val >= ei->reg_val_prev)
> +		ei->accum_energy += reg_val - ei->reg_val_prev;
> +	else
> +		ei->accum_energy += UINT_MAX - ei->reg_val_prev + reg_val;
> +	ei->reg_val_prev = reg_val;
> +
> +	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
> +				  hwmon->scl_shift_energy);
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return 0;
> +}
> +
> +int
> +i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy)
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +
> +	return hwm_energy(ddat, energy);
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>   	NULL
>   };
>   
> @@ -199,6 +272,32 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
>   	}
>   }
>   
> +static umode_t
> +hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	i915_reg_t rgaddr;
> +
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		rgaddr = hwmon->rg.energy_status_all;
> +		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_energy_input:
> +		return hwm_energy(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
> @@ -210,6 +309,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		return hwm_in_is_visible(ddat, attr);
>   	case hwmon_power:
>   		return hwm_power_is_visible(ddat, attr, channel);
> +	case hwmon_energy:
> +		return hwm_energy_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -226,6 +327,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return hwm_in_read(ddat, attr, val);
>   	case hwmon_power:
>   		return hwm_power_read(ddat, attr, channel, val);
> +	case hwmon_energy:
> +		return hwm_energy_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -261,19 +364,23 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon = i915->hwmon;
>   	struct intel_uncore *uncore = &i915->uncore;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
>   	intel_wakeref_t wakeref;
>   	u32 val_sku_unit;
> +	long energy;
>   
>   	if (IS_DG1(i915) || IS_DG2(i915)) {
>   		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
>   		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
>   	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
>   	}
>   
>   	with_intel_runtime_pm(uncore->rpm, wakeref) {
> @@ -291,9 +398,17 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>   		} else {
>   			val_sku_unit = 0;
>   		}
> -
> -		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   	}
> +
> +	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
> +
> +	/*
> +	 * Initialize 'struct hwm_energy_info', i.e. set fields to the
> +	 * first value of the energy register read
> +	 */
> +	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
> +		hwm_energy(ddat, &energy);
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> index 7ca9cf2c34c9..4e5b6c149f3a 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.h
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -17,4 +17,5 @@ static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
>   static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
>   #endif
>   
> +int i915_hwmon_energy_status_get(struct drm_i915_private *i915, long *energy);
>   #endif /* __I915_HWMON_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index b74df11977c6..1014d0b7cc16 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -191,7 +191,9 @@
>   
>   #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_ENERGY_UNIT                      REG_GENMASK(12, 8)
>   #define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +#define PCU_PACKAGE_ENERGY_STATUS              _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
>   #define GEN6_GT_PERF_STATUS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5948)
>   #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
