Return-Path: <linux-hwmon+bounces-3578-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280994F903
	for <lists+linux-hwmon@lfdr.de>; Mon, 12 Aug 2024 23:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E371728341B
	for <lists+linux-hwmon@lfdr.de>; Mon, 12 Aug 2024 21:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7DF1953B9;
	Mon, 12 Aug 2024 21:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBKwRP6u"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1D194A49;
	Mon, 12 Aug 2024 21:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723498609; cv=none; b=JsVp0No0qtVyLS1QKJJ7js03Js7N0gMqZv+MYfTB/J+7Y59bqkGTqd6xf1oZA0/Ze5UIXqXGPsltkhvUkmU1qZoYn9/l+md+KgoE1xFzV7jUoN5LQOG0O9oNP6r1d8jvseR4QEB+gXxJlnnr7OKpF7gBuU/bHMbdehELq59yBwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723498609; c=relaxed/simple;
	bh=itQfS94FcJh8GxIRHkvD9FFvYgRh1KX7Z451gFHzrsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIEgDggxys5Tc5k+hJvOisgpiIrOkjtMkeJYwVQ01Dc9BKoCg2E/gNauf7dcdcEkPKAYh8oZEwP6SwsOTCJVTI05jMX/Hb9D96apCMJY2OV84SQQJflXhn+0Eq9FoPOA1eJpaM5WfFmkC60WqgNZM+EXGd3X5PHuI0E0AK7gEcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBKwRP6u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723498607; x=1755034607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=itQfS94FcJh8GxIRHkvD9FFvYgRh1KX7Z451gFHzrsc=;
  b=bBKwRP6ub7TgJQQatilwVV9SB0evk1apMgReuJUsioLfygU4bd7DEg97
   u8zWz8P/hgskmKSTL8aPcvXhpXmbhgLoKi2n1P4S+/3f7ESPPdKgPkox8
   tY6tsYihtphrg7Lwm+pH9p6agPqfQttnCnd3q2VulqMc6cgHmhl0oC1zx
   ai6nYpaidGaDdq6edfeDNwmg9Exv6AHmcB96Gdx2Gv/aj9gd2D+QUiKkM
   5uaXSgRrmObvc/+k0N+pp5KO1FwTjZ5Bw2HJc5WNKGrkkgMdnJT19owld
   LvtJ2/oCcxMOF1Dwl3zch7DhVkD0MPxYfJQ3JF151PG4TiQmofJMILXbC
   g==;
X-CSE-ConnectionGUID: rW0GWBq0SQe+NTlnSEhIiA==
X-CSE-MsgGUID: Z1QIum4ySvedXc7hbEOm/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21277883"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="21277883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 14:36:46 -0700
X-CSE-ConnectionGUID: S46l7mIZTg+OSy0krMwK5A==
X-CSE-MsgGUID: EJGVc5euStKKX+4vlua2SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="89263372"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2024 14:36:42 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdciV-000CCf-2P;
	Mon, 12 Aug 2024 21:36:39 +0000
Date: Tue, 13 Aug 2024 05:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tursulin@ursulin.net, airlied@gmail.com, daniel@ffwll.ch,
	linux@roeck-us.net, andi.shyti@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
	badal.nilawar@intel.com, riana.tauro@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5] drm/i915/hwmon: expose fan speed
Message-ID: <202408130500.SgCVoR2D-lkp@intel.com>
References: <20240812081538.1457396-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812081538.1457396-1-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.11-rc3 next-20240812]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/drm-i915-hwmon-expose-fan-speed/20240812-161645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20240812081538.1457396-1-raag.jadav%40intel.com
patch subject: [PATCH v5] drm/i915/hwmon: expose fan speed
config: i386-randconfig-012-20240813 (https://download.01.org/0day-ci/archive/20240813/202408130500.SgCVoR2D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130500.SgCVoR2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130500.SgCVoR2D-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/i915_hwmon.o: in function `hwm_fan_read':
>> drivers/gpu/drm/i915/i915_hwmon.c:675: undefined reference to `__udivdi3'


vim +675 drivers/gpu/drm/i915/i915_hwmon.c

   633	
   634	static int
   635	hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
   636	{
   637		struct i915_hwmon *hwmon = ddat->hwmon;
   638		struct hwm_fan_info *fi = &ddat->fi;
   639		u64 rotations, time_now, time;
   640		intel_wakeref_t wakeref;
   641		u32 reg_val, pulses;
   642		int ret = 0;
   643	
   644		if (attr != hwmon_fan_input)
   645			return -EOPNOTSUPP;
   646	
   647		wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
   648		mutex_lock(&hwmon->hwmon_lock);
   649	
   650		reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
   651		time_now = get_jiffies_64();
   652	
   653		/* Handle HW register overflow */
   654		if (reg_val >= fi->reg_val_prev)
   655			pulses = reg_val - fi->reg_val_prev;
   656		else
   657			pulses = UINT_MAX - fi->reg_val_prev + reg_val;
   658	
   659		/*
   660		 * HW register value is accumulated count of pulses from
   661		 * PWM fan with the scale of 2 pulses per rotation.
   662		 */
   663		rotations = pulses / 2;
   664	
   665		time = jiffies_delta_to_msecs(time_now - fi->time_prev);
   666		if (unlikely(!time)) {
   667			ret = -EAGAIN;
   668			goto exit;
   669		}
   670	
   671		/*
   672		 * Convert to minutes for calculating RPM.
   673		 * RPM = number of rotations * msecs per minute / time in msecs
   674		 */
 > 675		*val = DIV_ROUND_UP(rotations * (MSEC_PER_SEC * 60), time);
   676	
   677		fi->reg_val_prev = reg_val;
   678		fi->time_prev = time_now;
   679	exit:
   680		mutex_unlock(&hwmon->hwmon_lock);
   681		intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
   682		return ret;
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

