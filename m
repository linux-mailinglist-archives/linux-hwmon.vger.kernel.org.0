Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D13479A300
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Sep 2023 07:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbjIKFqo (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 11 Sep 2023 01:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjIKFqn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2023 01:46:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E0E1AE;
        Sun, 10 Sep 2023 22:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694411199; x=1725947199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWthW3CAQOeR24yqLtHN12hyt+cgqArE3vdOGuNIP74=;
  b=aGGRWsZJnRY4xxiH+mk4ZOyZXtup42L4hv1pXyKncOUrqwNxWGpCPC3O
   onFGQIqcqJTRwaVcF3fGVcsBfaSOKlQH3Rh9Xsi/B65XmAQ+Wj9SjMVTO
   /rhflb0mfG0JKO9K9OBM3SvQP3G5TuJtwbCMfP4GjNkk9xi1u81MS8c28
   JFruAwDQaDm0n1s7JUO+iCQ9ytKZBSOyiIPlNcLP5duihTSw4K/LYQC1a
   GbnOCrLbh0/204KtTUziza0134+NMtF/tWNu8/rTkML0oPkKCCl0PcXs2
   bPt2FJkNE2SI7WEAFLfn+/teQgOHQ0r26jrNgcwQE3WVpvqygzsbCzv3Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="375353787"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="375353787"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 22:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858188074"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858188074"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2023 22:46:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfZkn-0005qa-1u;
        Mon, 11 Sep 2023 05:46:33 +0000
Date:   Mon, 11 Sep 2023 13:46:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Saravanan Sekar <saravanan@linumiz.com>, sravanhome@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@roeck-us.net, jdelvare@suse.com
Cc:     oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Saravanan Sekar <saravanan@linumiz.com>
Subject: Re: [PATCH 1/3] hwmon: (pmbus/mpq7932) Get page count based on chip
 info
Message-ID: <202309111345.BXkwu3pD-lkp@intel.com>
References: <20230911034150.181880-2-saravanan@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911034150.181880-2-saravanan@linumiz.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Saravanan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on broonie-regulator/for-next linus/master v6.6-rc1 next-20230911]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Saravanan-Sekar/hwmon-pmbus-mpq7932-Get-page-count-based-on-chip-info/20230911-114451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230911034150.181880-2-saravanan%40linumiz.com
patch subject: [PATCH 1/3] hwmon: (pmbus/mpq7932) Get page count based on chip info
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230911/202309111345.BXkwu3pD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111345.BXkwu3pD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111345.BXkwu3pD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/mpq7932.c: In function 'mpq7932_probe':
>> drivers/hwmon/pmbus/mpq7932.c:108:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     108 |         info->pages = (int)device_get_match_data(&client->dev);
         |                       ^


vim +108 drivers/hwmon/pmbus/mpq7932.c

    95	
    96	static int mpq7932_probe(struct i2c_client *client)
    97	{
    98		struct mpq7932_data *data;
    99		struct pmbus_driver_info *info;
   100		struct device *dev = &client->dev;
   101		int i;
   102	
   103		data = devm_kzalloc(dev, sizeof(struct mpq7932_data), GFP_KERNEL);
   104		if (!data)
   105			return -ENOMEM;
   106	
   107		info = &data->info;
 > 108		info->pages = (int)device_get_match_data(&client->dev);
   109		info->format[PSC_VOLTAGE_OUT] = direct;
   110		info->m[PSC_VOLTAGE_OUT] = 160;
   111		info->b[PSC_VOLTAGE_OUT] = -33;
   112		for (i = 0; i < info->pages; i++) {
   113			info->func[i] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
   114					| PMBUS_HAVE_STATUS_TEMP;
   115		}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
