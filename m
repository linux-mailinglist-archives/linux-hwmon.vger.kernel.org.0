Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520243A3B53
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Jun 2021 07:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbhFKF2x (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 11 Jun 2021 01:28:53 -0400
Received: from mga11.intel.com ([192.55.52.93]:58740 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229908AbhFKF2x (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Jun 2021 01:28:53 -0400
IronPort-SDR: BPJdUl+cfKfWAhUQuWIPOz4iLq5xzEoRqnK1su7SNCJhK/eTMAb0Vt3N6iHJI2nMBpppf3pUwF
 90MaVdRWZgGg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="202437970"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="202437970"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 22:26:52 -0700
IronPort-SDR: 4jn//ydwJco+veEFeeXFOEmabVPMLvuqUkJR6mbmPVvQbRlbHzIG0x5flsljfqRXbD8zGxFYWV
 vt93ZwLlzRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="450646994"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2021 22:26:50 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrZgw-0000Sf-Hk; Fri, 11 Jun 2021 05:26:50 +0000
Date:   Fri, 11 Jun 2021 13:26:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 301f543bf5d02c9db7db3bc775e6cbdcddf88b27
Message-ID: <60c2f40b.ad4eFVyuRjPXh15o%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 301f543bf5d02c9db7db3bc775e6cbdcddf88b27  MAINTAINERS: Add Delta DPS920AB PSU driver

elapsed time: 722m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         at91_dt_defconfig
sh                        edosk7760_defconfig
powerpc                    gamecube_defconfig
m68k                            mac_defconfig
powerpc                        cell_defconfig
arm                        clps711x_defconfig
sparc                            alldefconfig
sh                   sh7770_generic_defconfig
arm                          pxa910_defconfig
sh                          lboxre2_defconfig
arm                        shmobile_defconfig
arc                         haps_hs_defconfig
ia64                        generic_defconfig
powerpc                         wii_defconfig
mips                        vocore2_defconfig
h8300                     edosk2674_defconfig
sh                         ap325rxa_defconfig
powerpc                     asp8347_defconfig
xtensa                          iss_defconfig
arm                        oxnas_v6_defconfig
powerpc                    ge_imp3a_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
parisc                           alldefconfig
mips                            gpr_defconfig
sh                           se7712_defconfig
mips                      pistachio_defconfig
arm                       spear13xx_defconfig
sh                           se7780_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                 randconfig-a002-20210610
i386                 randconfig-a006-20210610
i386                 randconfig-a004-20210610
i386                 randconfig-a001-20210610
i386                 randconfig-a005-20210610
i386                 randconfig-a003-20210610
x86_64               randconfig-a015-20210610
x86_64               randconfig-a011-20210610
x86_64               randconfig-a012-20210610
x86_64               randconfig-a014-20210610
x86_64               randconfig-a016-20210610
x86_64               randconfig-a013-20210610
i386                 randconfig-a015-20210610
i386                 randconfig-a013-20210610
i386                 randconfig-a016-20210610
i386                 randconfig-a014-20210610
i386                 randconfig-a012-20210610
i386                 randconfig-a011-20210610
i386                 randconfig-a015-20210611
i386                 randconfig-a013-20210611
i386                 randconfig-a016-20210611
i386                 randconfig-a014-20210611
i386                 randconfig-a012-20210611
i386                 randconfig-a011-20210611
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210610
x86_64               randconfig-a001-20210610
x86_64               randconfig-a004-20210610
x86_64               randconfig-a003-20210610
x86_64               randconfig-a006-20210610
x86_64               randconfig-a005-20210610

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
