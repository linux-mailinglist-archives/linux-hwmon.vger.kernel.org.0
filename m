Return-Path: <linux-hwmon+bounces-202-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8E7F85AC
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 22:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC1361C2129F
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 21:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC9D3C48E;
	Fri, 24 Nov 2023 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MszAn7gn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD23119A6;
	Fri, 24 Nov 2023 13:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700862893; x=1732398893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B0mCzO6TS9Ko3MQ4cDhtUSbWIQnKuE3JYcSyePFi9RI=;
  b=MszAn7gnwm3E6/g2tK99nsrzaTpYd/TwmMh/RmUbPMwEnJcObuC+vdqR
   qI4dFGHE0tfINPemjtEKeL7jKrcMfKLCyuGIgS4ujB7vWuv5rwjLCtc6Q
   vE+X7a5xLbDQkdNb3jVvs2lW656bpP0nMU15syBBQEczCesdrqk3RgCic
   0yNcq8ENLoM/eGAdFQAXIN9QnB/g3QzkkvGUsladbp4q7otZz3RrbFhn9
   f/gredCvj4sI1L7QM8x3EZcvaRl2dj2kYey5RV7ylmTeQtzGsNzLBipYV
   FBE0jI1Aj/T2hBynnLjhQvRMJR1dSMwqKou5Kk3BZzgFW5qw2w6UpS3nY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="372631394"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="372631394"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 13:54:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1099198251"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1099198251"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2023 13:54:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6e8O-0003Je-0B;
	Fri, 24 Nov 2023 21:54:48 +0000
Date: Sat, 25 Nov 2023 05:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <202311250203.ZhAso6Dj-lkp@intel.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/hwmon-ltc4282-add-support-for-the-LTC4282-chip/20231124-231842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231124-ltc4282-support-v2-2-952bf926f83c%40analog.com
patch subject: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
config: i386-randconfig-r081-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250203.ZhAso6Dj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250203.ZhAso6Dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250203.ZhAso6Dj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/ltc4282.c:347:6: warning: no previous prototype for function 'ltc4282_round_rate' [-Wmissing-prototypes]
   long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
        ^
   drivers/hwmon/ltc4282.c:347:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
   ^
   static 
>> drivers/hwmon/ltc4282.c:356:15: warning: no previous prototype for function 'ltc4282_recalc_rate' [-Wmissing-prototypes]
   unsigned long ltc4282_recalc_rate(struct clk_hw *hw, unsigned long parent)
                 ^
   drivers/hwmon/ltc4282.c:356:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long ltc4282_recalc_rate(struct clk_hw *hw, unsigned long parent)
   ^
   static 
   2 warnings generated.


vim +/ltc4282_round_rate +347 drivers/hwmon/ltc4282.c

   346	
 > 347	long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
   348				unsigned long *parent_rate)
   349	{
   350		int idx = find_closest(rate, ltc4282_out_rates,
   351				       ARRAY_SIZE(ltc4282_out_rates));
   352	
   353		return ltc4282_out_rates[idx];
   354	}
   355	
 > 356	unsigned long ltc4282_recalc_rate(struct clk_hw *hw, unsigned long parent)
   357	{
   358		struct ltc4282_state *st = container_of(hw, struct ltc4282_state,
   359							clk_hw);
   360		u32 clkdiv;
   361		int ret;
   362	
   363		ret = regmap_read(st->map, LTC4282_CLK_DIV, &clkdiv);
   364		if (ret)
   365			return 0;
   366	
   367		clkdiv = FIELD_GET(LTC4282_CLKOUT_MASK, clkdiv);
   368		if (!clkdiv)
   369			return 0;
   370		if (clkdiv == LTC4282_CLKOUT_INT)
   371			return LTC4282_CLKOUT_SYSTEM;
   372	
   373		return LTC4282_CLKOUT_CNV;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

