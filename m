Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EC6379DEE
	for <lists+linux-hwmon@lfdr.de>; Tue, 11 May 2021 05:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhEKDtv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 10 May 2021 23:49:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:34019 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhEKDtv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 23:49:51 -0400
IronPort-SDR: czaI3//+n/rtIcZe9eipJ95ZfuXu76GtuAC7GvYvY1rQqiyk+b5q3Ssj9zySSUUXZe7c/Ff15p
 ATwp64yqJdaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186482532"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="186482532"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 20:48:42 -0700
IronPort-SDR: HsMS7wSqcBxhbqkZ+7Tmuh583dHJ4kD0x+ujldFGdRHLz6lAaoNhtfe0C2DEW2W2sY2+WrCWgK
 eFFsMtpe9XVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="470996705"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2021 20:48:33 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgJNm-0000XZ-7G; Tue, 11 May 2021 03:48:30 +0000
Date:   Tue, 11 May 2021 11:48:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 7c9df4e6170ce94a63cf0c566827c38999675273
Message-ID: <6099fe8a.Thvk5Wjr58mxRE+9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7c9df4e6170ce94a63cf0c566827c38999675273  hwmon: (lm70) Use SPI_MODE_X_MASK

elapsed time: 729m

configs tested: 185
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                           spitz_defconfig
h8300                            alldefconfig
sh                          lboxre2_defconfig
nds32                               defconfig
m68k                                defconfig
powerpc                 mpc8272_ads_defconfig
mips                malta_qemu_32r6_defconfig
sh                     sh7710voipgw_defconfig
arm                          simpad_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                    sam440ep_defconfig
arm                       aspeed_g4_defconfig
sh                          polaris_defconfig
powerpc                     tqm5200_defconfig
arm                            xcep_defconfig
powerpc                      ppc44x_defconfig
mips                        workpad_defconfig
arm                       aspeed_g5_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
mips                          ath25_defconfig
riscv                            alldefconfig
arm                         lpc32xx_defconfig
mips                      maltaaprp_defconfig
sh                     magicpanelr2_defconfig
sh                           se7343_defconfig
openrisc                    or1ksim_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      chrp32_defconfig
arm                          pxa3xx_defconfig
sh                          kfr2r09_defconfig
m68k                       m5208evb_defconfig
sh                   sh7770_generic_defconfig
sh                            hp6xx_defconfig
arm                              alldefconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
sh                           se7751_defconfig
mips                            ar7_defconfig
ia64                          tiger_defconfig
powerpc                  mpc866_ads_defconfig
arm                            lart_defconfig
powerpc                    gamecube_defconfig
arm                            dove_defconfig
arm                        trizeps4_defconfig
arm                         at91_dt_defconfig
arm                       cns3420vb_defconfig
m68k                          sun3x_defconfig
mips                           ip28_defconfig
powerpc                    adder875_defconfig
arc                              alldefconfig
powerpc                     tqm8560_defconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
sh                   secureedge5410_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             allyesconfig
mips                  cavium_octeon_defconfig
ia64                             alldefconfig
arm                         cm_x300_defconfig
arm                         socfpga_defconfig
sh                   sh7724_generic_defconfig
arc                        nsim_700_defconfig
arm                         nhk8815_defconfig
powerpc                          g5_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
sh                        sh7757lcr_defconfig
mips                        nlm_xlp_defconfig
nios2                            alldefconfig
arm                       imx_v6_v7_defconfig
sh                          rsk7269_defconfig
powerpc                     skiroot_defconfig
mips                         cobalt_defconfig
arc                          axs103_defconfig
mips                     loongson2k_defconfig
arm                            hisi_defconfig
mips                         tb0226_defconfig
riscv                    nommu_k210_defconfig
arm                         bcm2835_defconfig
powerpc                       ebony_defconfig
sh                          r7785rp_defconfig
riscv                    nommu_virt_defconfig
arm                       versatile_defconfig
powerpc                 mpc834x_mds_defconfig
sh                               j2_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
arm                          ixp4xx_defconfig
sh                              ul2_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
powerpc                 canyonlands_defconfig
mips                 decstation_r4k_defconfig
sh                          rsk7201_defconfig
powerpc                    socrates_defconfig
powerpc                     pseries_defconfig
m68k                       m5275evb_defconfig
powerpc                     tqm8540_defconfig
mips                           gcw0_defconfig
m68k                            q40_defconfig
sh                        edosk7760_defconfig
mips                      pistachio_defconfig
mips                  decstation_64_defconfig
arm                      jornada720_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210510
x86_64               randconfig-a004-20210510
x86_64               randconfig-a001-20210510
x86_64               randconfig-a005-20210510
x86_64               randconfig-a002-20210510
x86_64               randconfig-a006-20210510
i386                 randconfig-a003-20210510
i386                 randconfig-a001-20210510
i386                 randconfig-a005-20210510
i386                 randconfig-a004-20210510
i386                 randconfig-a002-20210510
i386                 randconfig-a006-20210510
i386                 randconfig-a016-20210510
i386                 randconfig-a014-20210510
i386                 randconfig-a011-20210510
i386                 randconfig-a015-20210510
i386                 randconfig-a012-20210510
i386                 randconfig-a013-20210510
i386                 randconfig-a016-20210511
i386                 randconfig-a014-20210511
i386                 randconfig-a011-20210511
i386                 randconfig-a015-20210511
i386                 randconfig-a012-20210511
i386                 randconfig-a013-20210511
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210510
x86_64               randconfig-a012-20210510
x86_64               randconfig-a011-20210510
x86_64               randconfig-a013-20210510
x86_64               randconfig-a016-20210510
x86_64               randconfig-a014-20210510

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
