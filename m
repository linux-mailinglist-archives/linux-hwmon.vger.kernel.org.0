Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2A1741D60
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jun 2023 02:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjF2AvF (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 28 Jun 2023 20:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjF2AvF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2023 20:51:05 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E211FD5;
        Wed, 28 Jun 2023 17:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687999864; x=1719535864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZtDwz1dpFO9Rkw4NeGBtQuTcNaIevvwwYyoSd6yK944=;
  b=Dq+is7OR9K/WVxjD3tgeouk+RD7pjzAOyg8HN5jA/HwUH+wTtVbwb3jH
   C7WGBIjIsg8n/ugtSmF1t4N5hSPhd3h49BhsyWnfNVcjBwklK1xbd4lcQ
   6Us+RBU6M46f30uuRlt9pGDqPNG8k6ZBreZtOzaQr+eP82KS6RvbGGrYu
   glsQnvDiyZEXV/JtRZzgYpa2a5Io1QpHX3RZx2uO1H0dZi9OG7VRIpIgu
   rKefFlr/6b4lPlaV/JstQUIocIS3BtIiTk6Lg9ftnCwMcjDY8mMkMJA6P
   RT+/TAufmbobhqhATTdJQwutiDqVyYC8/ww00afF30kqI+2x16FP0ORfX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365457326"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="365457326"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 17:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="841278417"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="841278417"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jun 2023 17:51:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qEfsC-000DdZ-2p;
        Thu, 29 Jun 2023 00:51:00 +0000
Date:   Thu, 29 Jun 2023 08:50:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Eddie James <eajames@linux.ibm.com>, linux-hwmon@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux@roeck-us.net, jdelvare@suse.com, lakshmiy@us.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2] hwmon: (pmbus/acbel-fsg032) Add firmware version
 debugfs attribute
Message-ID: <202306290818.2IuC4QCQ-lkp@intel.com>
References: <20230628153453.122213-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628153453.122213-1-eajames@linux.ibm.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.4 next-20230628]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/hwmon-pmbus-acbel-fsg032-Add-firmware-version-debugfs-attribute/20230628-233840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230628153453.122213-1-eajames%40linux.ibm.com
patch subject: [PATCH v2] hwmon: (pmbus/acbel-fsg032) Add firmware version debugfs attribute
config: i386-randconfig-i012-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290818.2IuC4QCQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290818.2IuC4QCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290818.2IuC4QCQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/acbel-fsg032.c: In function 'acbel_fsg032_debugfs_read':
>> drivers/hwmon/pmbus/acbel-fsg032.c:25:13: warning: unused variable 'i' [-Wunused-variable]
      25 |         int i;
         |             ^


vim +/i +25 drivers/hwmon/pmbus/acbel-fsg032.c

    17	
    18	static ssize_t acbel_fsg032_debugfs_read(struct file *file, char __user *buf, size_t count,
    19						 loff_t *ppos)
    20	{
    21		struct i2c_client *client = file->private_data;
    22		char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
    23		char out[8];
    24		int rc;
  > 25		int i;
    26	
    27		rc = i2c_smbus_read_block_data(client, ACBEL_MFR_FW_REVISION, data);
    28		if (rc < 0)
    29			return rc;
    30	
    31		rc = snprintf(out, sizeof(out), "%*phN\n", min(rc, 3), data);
    32		return simple_read_from_buffer(buf, count, ppos, out, rc);
    33	}
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
