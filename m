Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC9B382A88
	for <lists+linux-hwmon@lfdr.de>; Mon, 17 May 2021 13:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbhEQLHX (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 17 May 2021 07:07:23 -0400
Received: from mga18.intel.com ([134.134.136.126]:7070 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236573AbhEQLHW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 May 2021 07:07:22 -0400
IronPort-SDR: a6O/BH5+itgMF8xbPLOdk0916f7tVsSQNB+aEc9ViZB2/2qW6jxVOpfgbgxVcebUfx9YuYcyVb
 TgI+skliwqNA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187844282"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187844282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:06:06 -0700
IronPort-SDR: lYYHwMDEL27N3o6zjdr0YN79uNLFDgfg3kIZU3BtI7pCuGuHDzM8p52KO4cj6yfxFE3mCd/EyM
 9XwCGaeNygOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="540375444"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 May 2021 04:06:05 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lib4W-0001lg-IC; Mon, 17 May 2021 11:06:04 +0000
Date:   Mon, 17 May 2021 19:05:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 2a29db088c7ae7121801a0d7a60740ed2d18c4f3
Message-ID: <60a24de9.vIRDC6GL/uPfOLHB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 2a29db088c7ae7121801a0d7a60740ed2d18c4f3  hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_3 for RAA228228

elapsed time: 722m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      fuloong2e_defconfig
arm                             mxs_defconfig
powerpc                      bamboo_defconfig
xtensa                  nommu_kc705_defconfig
m68k                             allyesconfig
sh                           se7780_defconfig
powerpc                     mpc5200_defconfig
mips                     loongson1c_defconfig
powerpc                   currituck_defconfig
sh                             shx3_defconfig
nios2                            allyesconfig
powerpc                    amigaone_defconfig
arc                      axs103_smp_defconfig
sh                         apsh4a3a_defconfig
riscv                            alldefconfig
ia64                      gensparse_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm5200_defconfig
powerpc                     ep8248e_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
arc                         haps_hs_defconfig
arm                       aspeed_g5_defconfig
alpha                               defconfig
mips                           ip22_defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
openrisc                  or1klitex_defconfig
mips                       bmips_be_defconfig
mips                      pistachio_defconfig
m68k                          amiga_defconfig
m68k                       m5249evb_defconfig
sh                            titan_defconfig
m68k                            mac_defconfig
arm                            mps2_defconfig
mips                         cobalt_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210517
i386                 randconfig-a001-20210517
i386                 randconfig-a004-20210517
i386                 randconfig-a005-20210517
i386                 randconfig-a002-20210517
i386                 randconfig-a006-20210517
x86_64               randconfig-a012-20210517
x86_64               randconfig-a015-20210517
x86_64               randconfig-a011-20210517
x86_64               randconfig-a013-20210517
x86_64               randconfig-a016-20210517
x86_64               randconfig-a014-20210517
i386                 randconfig-a016-20210517
i386                 randconfig-a014-20210517
i386                 randconfig-a011-20210517
i386                 randconfig-a012-20210517
i386                 randconfig-a015-20210517
i386                 randconfig-a013-20210517
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
