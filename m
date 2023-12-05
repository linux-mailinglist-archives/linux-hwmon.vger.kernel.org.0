Return-Path: <linux-hwmon+bounces-356-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8103E8056F6
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Dec 2023 15:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362161F2158C
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Dec 2023 14:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E08565EA0;
	Tue,  5 Dec 2023 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmmzY5C5"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C5CA1;
	Tue,  5 Dec 2023 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701785725; x=1733321725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GLanbkuh8qYU9HYqhRDh1oPSCT3uK7CWxgBK1a3Qrho=;
  b=VmmzY5C5tgTTxWKPECR/f7I5nkB2xZ9QgiOhWilLIMCSaeb6XF/D2F5K
   RSYEmHP7q2SLxVzAfoNVA+yqa3H8tGlq73JuOK0t+uPE2uFhPh09nomGB
   QxI0JUxjuy7Kp84QhJDdGtgpgs2wokH0E29mKvb2MgutQcb84cgV06bKh
   1ZoDNxNNdFTGkXdaEUWNNsjUYoa8ALAeUzoTQnZF/PaBM2PsFsFwXR6Ip
   RrF3eCZwkxLrEw7tifyK2luGjdCLpK5aVtf87mapQhJN+SZQEWc9pJ8VN
   MjMVaLG+vPyVt/elJzXnXRDl7Bf0vgRRjKKg2uP3V1OzJXs3e8SVDWJRn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378924932"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="378924932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 06:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799984123"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="799984123"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 06:15:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAWCi-000996-3B;
	Tue, 05 Dec 2023 14:15:16 +0000
Date: Tue, 5 Dec 2023 22:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: baneric926@gmail.com, jdelvare@suse.com, linux@roeck-us.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
	kwliu@nuvoton.com, kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com,
	Bonnie_Lo@wiwynn.com
Subject: Re: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
Message-ID: <202312052243.AbRqbNyT-lkp@intel.com>
References: <20231204055650.788388-3-kcfeng0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204055650.788388-3-kcfeng0@nuvoton.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc4 next-20231205]
[cannot apply to groeck-staging/hwmon-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/baneric926-gmail-com/dt-bindings-hwmon-Add-nct736x-bindings/20231204-135942
base:   linus/master
patch link:    https://lore.kernel.org/r/20231204055650.788388-3-kcfeng0%40nuvoton.com
patch subject: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
config: um-randconfig-001-20231205 (https://download.01.org/0day-ci/archive/20231205/202312052243.AbRqbNyT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052243.AbRqbNyT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052243.AbRqbNyT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/nct736x.c: In function 'nct736x_init_chip.constprop':
>> drivers/hwmon/nct736x.c:367:15: warning: 'gpio0_3' is used uninitialized [-Wuninitialized]
     367 |         ret = nct736x_write_reg(client, NCT736X_REG_GPIO_0_3, gpio0_3);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gpio0_3 +367 drivers/hwmon/nct736x.c

   334	
   335	static int nct736x_init_chip(struct i2c_client *client,
   336				     u32 pwm_mask, u32 fanin_mask, u32 wdt_cfg)
   337	{
   338		const struct i2c_device_id *id = i2c_match_id(nct736x_id, client);
   339		u8 i, gpio0_3, gpio4_7, gpio10_13, gpio14_17;
   340		int ret;
   341	
   342		for (i = 0; i < NCT736X_PWM_COUNT; i++) {
   343			if (i < 4) {
   344				if (pwm_mask & BIT_CHECK(i))
   345					gpio0_3 |= PWM_SEL(i);
   346				if (fanin_mask & BIT_CHECK(i))
   347					gpio10_13 |= FANIN_SEL(i);
   348			} else if (i < 8) {
   349				if (pwm_mask & BIT_CHECK(i))
   350					gpio4_7 |= PWM_SEL(i);
   351				if (fanin_mask & BIT_CHECK(i))
   352					gpio14_17 |= FANIN_SEL(i);
   353			} else if (i < 12) {
   354				if (pwm_mask & BIT_CHECK(i))
   355					gpio10_13 |= PWM_SEL(i);
   356				if (fanin_mask & BIT_CHECK(i))
   357					gpio0_3 |= FANIN_SEL(i);
   358			} else {
   359				if (pwm_mask & BIT_CHECK(i))
   360					gpio14_17 |= PWM_SEL(i);
   361				if (fanin_mask & BIT_CHECK(i))
   362					gpio4_7 |= FANIN_SEL(i);
   363			}
   364		}
   365	
   366		/* Pin Function Configuration */
 > 367		ret = nct736x_write_reg(client, NCT736X_REG_GPIO_0_3, gpio0_3);
   368		if (ret < 0)
   369			return ret;
   370		ret = nct736x_write_reg(client, NCT736X_REG_GPIO_4_7, gpio4_7);
   371		if (ret < 0)
   372			return ret;
   373		ret = nct736x_write_reg(client, NCT736X_REG_GPIO_10_13, gpio10_13);
   374		if (ret < 0)
   375			return ret;
   376		ret = nct736x_write_reg(client, NCT736X_REG_GPIO_14_17, gpio14_17);
   377		if (ret < 0)
   378			return ret;
   379	
   380		/* PWM and FANIN Monitoring Enable */
   381		ret = nct736x_write_reg(client, NCT736X_REG_PWMEN_0_7,
   382					pwm_mask & 0xff);
   383		if (ret < 0)
   384			return ret;
   385		ret = nct736x_write_reg(client,
   386					NCT736X_REG_PWMEN_8_15, (pwm_mask >> 8) & 0xff);
   387		if (ret < 0)
   388			return ret;
   389		ret = nct736x_write_reg(client, NCT736X_REG_FANINEN_0_7,
   390					fanin_mask & 0xff);
   391		if (ret < 0)
   392			return ret;
   393		ret = nct736x_write_reg(client, NCT736X_REG_FANINEN_8_15,
   394					(fanin_mask >> 8) & 0xff);
   395		if (ret < 0)
   396			return ret;
   397	
   398		/* Watchdog Timer Configuration */
   399		if (wdt_cfg != 0xff && id->driver_data == nct7363) {
   400			ret = nct736x_write_reg(client, NCT7363_REG_WDT, wdt_cfg);
   401			if (ret < 0)
   402				return ret;
   403		}
   404	
   405		return 0;
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

