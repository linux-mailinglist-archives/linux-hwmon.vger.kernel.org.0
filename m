Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02EC014163B
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Jan 2020 07:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgARGqS (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 18 Jan 2020 01:46:18 -0500
Received: from mga02.intel.com ([134.134.136.20]:46613 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbgARGqS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Jan 2020 01:46:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Jan 2020 22:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,333,1574150400"; 
   d="scan'208";a="265309511"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2020 22:46:16 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1ishs8-0003cY-0T; Sat, 18 Jan 2020 14:46:16 +0800
Date:   Sat, 18 Jan 2020 14:45:08 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 503ac4994688e2bb213807513659fd80d691f462
Message-ID: <5e22a974.OvPtn2TomfoU8Ia1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 503ac4994688e2bb213807513659fd80d691f462  MAINTAINERS: add entry for ADM1177 driver

elapsed time: 673m

configs tested: 152
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

csky                 randconfig-a001-20200118
openrisc             randconfig-a001-20200118
s390                 randconfig-a001-20200118
sh                   randconfig-a001-20200118
xtensa               randconfig-a001-20200118
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
arc                  randconfig-a001-20200118
arm                  randconfig-a001-20200118
arm64                randconfig-a001-20200118
ia64                 randconfig-a001-20200118
powerpc              randconfig-a001-20200118
sparc                randconfig-a001-20200118
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64               randconfig-e001-20200118
x86_64               randconfig-e002-20200118
x86_64               randconfig-e003-20200118
i386                 randconfig-e001-20200118
i386                 randconfig-e002-20200118
i386                 randconfig-e003-20200118
arm                              allmodconfig
arm                         at91_dt_defconfig
arm64                               defconfig
arm                        multi_v5_defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allmodconfig
arm                          exynos_defconfig
arm                        shmobile_defconfig
arm                        multi_v7_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
x86_64               randconfig-f001-20200118
x86_64               randconfig-f002-20200118
x86_64               randconfig-f003-20200118
i386                 randconfig-f001-20200118
i386                 randconfig-f002-20200118
i386                 randconfig-f003-20200118
c6x                  randconfig-a001-20200118
h8300                randconfig-a001-20200118
microblaze           randconfig-a001-20200118
nios2                randconfig-a001-20200118
sparc64              randconfig-a001-20200118
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
alpha                randconfig-a001-20200118
m68k                 randconfig-a001-20200118
mips                 randconfig-a001-20200118
nds32                randconfig-a001-20200118
parisc               randconfig-a001-20200118
riscv                randconfig-a001-20200118
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64               randconfig-b001-20200118
x86_64               randconfig-b002-20200118
x86_64               randconfig-b003-20200118
i386                 randconfig-b001-20200118
i386                 randconfig-b002-20200118
i386                 randconfig-b003-20200118
i386                             alldefconfig
i386                              allnoconfig
i386                                defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
ia64                                defconfig
x86_64               randconfig-g001-20200118
x86_64               randconfig-g002-20200118
x86_64               randconfig-g003-20200118
i386                 randconfig-g001-20200118
i386                 randconfig-g002-20200118
i386                 randconfig-g003-20200118
x86_64               randconfig-c001-20200118
x86_64               randconfig-c002-20200118
x86_64               randconfig-c003-20200118
i386                 randconfig-c001-20200118
i386                 randconfig-c002-20200118
i386                 randconfig-c003-20200118
x86_64               randconfig-h001-20200118
x86_64               randconfig-h002-20200118
x86_64               randconfig-h003-20200118
i386                 randconfig-h001-20200118
i386                 randconfig-h002-20200118
i386                 randconfig-h003-20200118
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
