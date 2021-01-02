Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9324E2E7DFD
	for <lists+linux-hwmon@lfdr.de>; Thu, 31 Dec 2020 05:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgLaEki (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 30 Dec 2020 23:40:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:36479 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgLaEki (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 23:40:38 -0500
IronPort-SDR: Fy5nmuFShEHyCCetG4K2iDKt6hBGtyBW73MLkDDixXkpUsfF+U8F5KZHbVOCyC5jIlGcngXkyl
 xoNEDSuWj8gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="238221954"
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="238221954"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 20:39:57 -0800
IronPort-SDR: AgtKzo6tTWYR7K9Av6smjC6ouikhSLaMjraRlI1P7YSK6L5bqRw52aOm9StUHvqSEtLLw6Gfhv
 Z9U29AcwOBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="396086069"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Dec 2020 20:39:56 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kupkh-0004h3-Mv; Thu, 31 Dec 2020 04:39:55 +0000
Date:   Thu, 31 Dec 2020 12:39:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 1eda52334e6d13eb1a85f713ce06dd39342b5020
Message-ID: <5fed5616.yQSoLOXARO29Rm0R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 1eda52334e6d13eb1a85f713ce06dd39342b5020  hwmon: (pwm-fan) Ensure that calculation doesn't discard big period values

elapsed time: 722m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
mips                         rt305x_defconfig
parisc                              defconfig
m68k                        m5407c3_defconfig
arm                             mxs_defconfig
mips                        qi_lb60_defconfig
arm                         vf610m4_defconfig
microblaze                          defconfig
sh                     sh7710voipgw_defconfig
arm                         s3c6400_defconfig
mips                           rs90_defconfig
h8300                    h8300h-sim_defconfig
sh                             shx3_defconfig
mips                   sb1250_swarm_defconfig
m68k                         apollo_defconfig
sh                          sdk7780_defconfig
mips                    maltaup_xpa_defconfig
arm                        cerfcube_defconfig
mips                      maltaaprp_defconfig
arm                  colibri_pxa300_defconfig
mips                      fuloong2e_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     mpc83xx_defconfig
mips                       lemote2f_defconfig
arm                          imote2_defconfig
s390                       zfcpdump_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
parisc                           allyesconfig
powerpc                  iss476-smp_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
x86_64                           alldefconfig
m68k                           sun3_defconfig
mips                           ip22_defconfig
powerpc                      ppc44x_defconfig
powerpc                    sam440ep_defconfig
arc                     haps_hs_smp_defconfig
ia64                             alldefconfig
powerpc                     tqm8541_defconfig
arm                      tct_hammer_defconfig
powerpc                      walnut_defconfig
arm                        mvebu_v5_defconfig
arm                           sunxi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20201230
x86_64               randconfig-a001-20201230
x86_64               randconfig-a006-20201230
x86_64               randconfig-a002-20201230
x86_64               randconfig-a004-20201230
x86_64               randconfig-a003-20201230
i386                 randconfig-a005-20201230
i386                 randconfig-a006-20201230
i386                 randconfig-a004-20201230
i386                 randconfig-a003-20201230
i386                 randconfig-a002-20201230
i386                 randconfig-a001-20201230
i386                 randconfig-a016-20201230
i386                 randconfig-a014-20201230
i386                 randconfig-a012-20201230
i386                 randconfig-a015-20201230
i386                 randconfig-a011-20201230
i386                 randconfig-a013-20201230
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201230
x86_64               randconfig-a014-20201230
x86_64               randconfig-a016-20201230
x86_64               randconfig-a011-20201230
x86_64               randconfig-a013-20201230
x86_64               randconfig-a012-20201230

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
