Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5AB46E1CA
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Dec 2021 06:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbhLIFPu (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 9 Dec 2021 00:15:50 -0500
Received: from mga04.intel.com ([192.55.52.120]:30218 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230441AbhLIFPr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 9 Dec 2021 00:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639026735; x=1670562735;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M4VnbqcOG4cnUG9SXKmXNdOLZJ0q/Cla3kKX14jhG6g=;
  b=lP8jFiCusNQXj6T8IYNZao1Q39vAulLB3+RqPdxPw5kVqZ89EOYk9CTP
   xI0iy91uvVKehTGeYvjLahUVSp1S8TTp/mEp/H03YHOs1aVLPDW8a0qIu
   Yb93igbe+vM4qYfuel+y+3iCyjoLuKVoadVopS/EFMP7TuEfsh0azHKbh
   JfoU9NRkhF1Smx718CMWmHCa1O5RIdjAF97BGT979SgPX1i46kBXjMHk/
   2LVesTo9h8VbBFyfXtgldX5GkmTdM68n/fH/TvrM6OAUvYKJKAADVl8f6
   WM2QJiEMDuRuYv1mCWOKbG054XVv5PeSES2sX/awFIHTgptrZyfMt+NP4
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="236756042"
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; 
   d="scan'208";a="236756042"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 21:11:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; 
   d="scan'208";a="463074709"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Dec 2021 21:11:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mvBi0-0001Vw-50; Thu, 09 Dec 2021 05:11:08 +0000
Date:   Thu, 09 Dec 2021 13:10:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 59a29872ed5c746bba5898ed8e77c3e33d3aa9b6
Message-ID: <61b18fde.HB0pBETjnU7a3OuS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 59a29872ed5c746bba5898ed8e77c3e33d3aa9b6  watchdog: mtk_wdt: use platform_get_irq_optional

possible Warning in current branch (please contact us if interested):

drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to 'PTR_ERR'

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- nios2-randconfig-m031-20211202
    `-- drivers-watchdog-s3c2410_wdt.c-s3c2410wdt_probe()-warn:passing-zero-to-PTR_ERR

elapsed time: 731m

configs tested: 189
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                               defconfig
arm                              allmodconfig
i386                 randconfig-c001-20211207
i386                 randconfig-c001-20211208
sh                        edosk7760_defconfig
riscv                            alldefconfig
arm                            xcep_defconfig
sh                           se7750_defconfig
arm                        shmobile_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        jmr3927_defconfig
sh                        sh7763rdp_defconfig
csky                             alldefconfig
arc                        nsim_700_defconfig
parisc                           alldefconfig
arm                        spear6xx_defconfig
arm                           h5000_defconfig
mips                          ath25_defconfig
arm                         orion5x_defconfig
m68k                        stmark2_defconfig
powerpc                    socrates_defconfig
arm                          iop32x_defconfig
arm                       versatile_defconfig
arm                        spear3xx_defconfig
powerpc                      pasemi_defconfig
arm                           sama5_defconfig
powerpc                     sequoia_defconfig
sh                          rsk7201_defconfig
nios2                               defconfig
powerpc                      chrp32_defconfig
arc                    vdk_hs38_smp_defconfig
mips                         tb0219_defconfig
mips                     loongson1c_defconfig
sparc64                          alldefconfig
arm                        magician_defconfig
powerpc                     tqm8540_defconfig
powerpc                      pcm030_defconfig
arm                         mv78xx0_defconfig
sh                           se7206_defconfig
arm                         palmz72_defconfig
mips                       rbtx49xx_defconfig
powerpc                 canyonlands_defconfig
um                           x86_64_defconfig
arc                     haps_hs_smp_defconfig
m68k                            q40_defconfig
arc                 nsimosci_hs_smp_defconfig
arm64                            alldefconfig
powerpc                       ppc64_defconfig
arc                        nsimosci_defconfig
arm                         shannon_defconfig
sh                           se7722_defconfig
arm                         lpc32xx_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                           se7619_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            zeus_defconfig
powerpc                      cm5200_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         hackkit_defconfig
powerpc                      acadia_defconfig
arm                          badge4_defconfig
powerpc                  iss476-smp_defconfig
xtensa                generic_kc705_defconfig
powerpc                        warp_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                     magicpanelr2_defconfig
arm                       aspeed_g4_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8540_ads_defconfig
sparc                       sparc64_defconfig
arm                  randconfig-c002-20211207
arm                  randconfig-c002-20211209
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
i386                 randconfig-a001-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a006-20211207
i386                 randconfig-a005-20211207
i386                 randconfig-a002-20211207
i386                 randconfig-a004-20211207
x86_64               randconfig-a016-20211208
x86_64               randconfig-a011-20211208
x86_64               randconfig-a013-20211208
x86_64               randconfig-a012-20211208
x86_64               randconfig-a015-20211208
x86_64               randconfig-a014-20211208
i386                 randconfig-a013-20211208
i386                 randconfig-a016-20211208
i386                 randconfig-a011-20211208
i386                 randconfig-a014-20211208
i386                 randconfig-a012-20211208
i386                 randconfig-a015-20211208
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211207
arm                  randconfig-c002-20211207
riscv                randconfig-c006-20211207
mips                 randconfig-c004-20211207
i386                 randconfig-c001-20211207
powerpc              randconfig-c003-20211207
s390                 randconfig-c005-20211207
arm                  randconfig-c002-20211209
x86_64               randconfig-c007-20211209
riscv                randconfig-c006-20211209
i386                 randconfig-c001-20211209
mips                 randconfig-c004-20211209
powerpc              randconfig-c003-20211209
s390                 randconfig-c005-20211209
x86_64               randconfig-a006-20211208
x86_64               randconfig-a005-20211208
x86_64               randconfig-a001-20211208
x86_64               randconfig-a002-20211208
x86_64               randconfig-a004-20211208
x86_64               randconfig-a003-20211208
x86_64               randconfig-a016-20211207
x86_64               randconfig-a011-20211207
x86_64               randconfig-a013-20211207
x86_64               randconfig-a014-20211207
x86_64               randconfig-a015-20211207
x86_64               randconfig-a012-20211207
i386                 randconfig-a016-20211207
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a014-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a015-20211207
hexagon              randconfig-r045-20211208
hexagon              randconfig-r041-20211208
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
riscv                randconfig-r042-20211207
hexagon              randconfig-r041-20211207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
