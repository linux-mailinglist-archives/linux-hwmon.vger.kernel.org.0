Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443E515517F
	for <lists+linux-hwmon@lfdr.de>; Fri,  7 Feb 2020 05:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgBGEXI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 6 Feb 2020 23:23:08 -0500
Received: from mga03.intel.com ([134.134.136.65]:43636 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726960AbgBGEXI (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 6 Feb 2020 23:23:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Feb 2020 20:23:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,411,1574150400"; 
   d="scan'208";a="250286643"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Feb 2020 20:23:04 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1izvAW-000Ank-8M; Fri, 07 Feb 2020 12:23:04 +0800
Date:   Fri, 07 Feb 2020 12:22:29 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 f354ee388573388398bee21c34fdb0baa7facd43
Message-ID: <5e3ce605.6tAxHLdeWuYB3dHf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: f354ee388573388398bee21c34fdb0baa7facd43  watchdog: da9062: do not ping the hw during stop()

elapsed time: 2884m

configs tested: 303
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
s390                             alldefconfig
riscv                    nommu_virt_defconfig
sparc64                             defconfig
h8300                       h8s-sim_defconfig
nds32                             allnoconfig
sparc64                          allmodconfig
powerpc                       ppc64_defconfig
ia64                             allyesconfig
riscv                               defconfig
m68k                          multi_defconfig
i386                              allnoconfig
h8300                    h8300h-sim_defconfig
sparc                               defconfig
alpha                               defconfig
parisc                              defconfig
um                             i386_defconfig
arc                                 defconfig
parisc                            allnoconfig
um                           x86_64_defconfig
microblaze                    nommu_defconfig
microblaze                      mmu_defconfig
i386                             alldefconfig
sh                                allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
csky                                defconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                          rhel-kconfig
powerpc                           allnoconfig
mips                             allmodconfig
mips                           32r2_defconfig
mips                             allyesconfig
mips                      malta_kvm_defconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                      fuloong2e_defconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200207
x86_64               randconfig-a002-20200207
x86_64               randconfig-a003-20200207
i386                 randconfig-a001-20200207
i386                 randconfig-a002-20200207
i386                 randconfig-a003-20200207
x86_64               randconfig-a001-20200206
x86_64               randconfig-a002-20200206
x86_64               randconfig-a003-20200206
i386                 randconfig-a001-20200206
i386                 randconfig-a002-20200206
i386                 randconfig-a003-20200206
i386                 randconfig-a003-20200204
i386                 randconfig-a002-20200204
x86_64               randconfig-a003-20200204
x86_64               randconfig-a002-20200204
i386                 randconfig-a001-20200204
x86_64               randconfig-a001-20200204
alpha                randconfig-a001-20200206
m68k                 randconfig-a001-20200206
mips                 randconfig-a001-20200206
nds32                randconfig-a001-20200206
parisc               randconfig-a001-20200206
riscv                randconfig-a001-20200206
alpha                randconfig-a001-20200207
m68k                 randconfig-a001-20200207
mips                 randconfig-a001-20200207
nds32                randconfig-a001-20200207
parisc               randconfig-a001-20200207
alpha                randconfig-a001-20200204
parisc               randconfig-a001-20200204
m68k                 randconfig-a001-20200204
nds32                randconfig-a001-20200204
mips                 randconfig-a001-20200204
riscv                randconfig-a001-20200204
c6x                  randconfig-a001-20200206
h8300                randconfig-a001-20200206
microblaze           randconfig-a001-20200206
nios2                randconfig-a001-20200206
sparc64              randconfig-a001-20200206
h8300                randconfig-a001-20200205
nios2                randconfig-a001-20200205
sparc64              randconfig-a001-20200205
microblaze           randconfig-a001-20200205
c6x                  randconfig-a001-20200205
csky                 randconfig-a001-20200205
openrisc             randconfig-a001-20200205
s390                 randconfig-a001-20200205
sh                   randconfig-a001-20200205
xtensa               randconfig-a001-20200205
csky                 randconfig-a001-20200206
openrisc             randconfig-a001-20200206
s390                 randconfig-a001-20200206
sh                   randconfig-a001-20200206
xtensa               randconfig-a001-20200206
csky                 randconfig-a001-20200207
openrisc             randconfig-a001-20200207
s390                 randconfig-a001-20200207
xtensa               randconfig-a001-20200207
x86_64               randconfig-b001-20200206
x86_64               randconfig-b002-20200206
x86_64               randconfig-b003-20200206
i386                 randconfig-b001-20200206
i386                 randconfig-b002-20200206
i386                 randconfig-b003-20200206
x86_64               randconfig-b001-20200205
x86_64               randconfig-b002-20200205
x86_64               randconfig-b003-20200205
i386                 randconfig-b001-20200205
i386                 randconfig-b002-20200205
i386                 randconfig-b003-20200205
x86_64               randconfig-b001-20200207
x86_64               randconfig-b002-20200207
x86_64               randconfig-b003-20200207
i386                 randconfig-b001-20200207
i386                 randconfig-b002-20200207
i386                 randconfig-b003-20200207
x86_64               randconfig-c001-20200207
x86_64               randconfig-c002-20200207
x86_64               randconfig-c003-20200207
i386                 randconfig-c001-20200207
i386                 randconfig-c002-20200207
i386                 randconfig-c003-20200207
x86_64               randconfig-c001-20200205
x86_64               randconfig-c002-20200205
x86_64               randconfig-c003-20200205
i386                 randconfig-c001-20200205
i386                 randconfig-c002-20200205
i386                 randconfig-c003-20200205
x86_64               randconfig-c003-20200204
i386                 randconfig-c002-20200204
x86_64               randconfig-c002-20200204
i386                 randconfig-c001-20200204
x86_64               randconfig-c001-20200204
i386                 randconfig-c003-20200204
x86_64               randconfig-d001-20200205
x86_64               randconfig-d002-20200205
x86_64               randconfig-d003-20200205
i386                 randconfig-d001-20200205
i386                 randconfig-d002-20200205
i386                 randconfig-d003-20200205
x86_64               randconfig-d001-20200206
x86_64               randconfig-d002-20200206
x86_64               randconfig-d003-20200206
i386                 randconfig-d001-20200206
i386                 randconfig-d002-20200206
i386                 randconfig-d003-20200206
x86_64               randconfig-d001-20200207
x86_64               randconfig-d002-20200207
x86_64               randconfig-d003-20200207
i386                 randconfig-d001-20200207
i386                 randconfig-d002-20200207
i386                 randconfig-d003-20200207
x86_64               randconfig-d003-20200204
i386                 randconfig-d001-20200204
x86_64               randconfig-d002-20200204
x86_64               randconfig-d001-20200204
i386                 randconfig-d003-20200204
i386                 randconfig-d002-20200204
x86_64               randconfig-e001-20200206
x86_64               randconfig-e002-20200206
x86_64               randconfig-e003-20200206
i386                 randconfig-e001-20200206
i386                 randconfig-e002-20200206
i386                 randconfig-e003-20200206
x86_64               randconfig-e001-20200207
x86_64               randconfig-e002-20200207
x86_64               randconfig-e003-20200207
i386                 randconfig-e001-20200207
i386                 randconfig-e002-20200207
i386                 randconfig-e003-20200207
i386                 randconfig-e003-20200204
i386                 randconfig-e002-20200204
x86_64               randconfig-e001-20200204
x86_64               randconfig-e003-20200204
i386                 randconfig-e001-20200204
x86_64               randconfig-e002-20200204
x86_64               randconfig-f001-20200204
x86_64               randconfig-f002-20200204
x86_64               randconfig-f003-20200204
i386                 randconfig-f001-20200204
i386                 randconfig-f002-20200204
i386                 randconfig-f003-20200204
x86_64               randconfig-f001-20200206
x86_64               randconfig-f002-20200206
x86_64               randconfig-f003-20200206
i386                 randconfig-f001-20200206
i386                 randconfig-f002-20200206
i386                 randconfig-f003-20200206
i386                 randconfig-f002-20200205
i386                 randconfig-f003-20200205
x86_64               randconfig-f002-20200205
i386                 randconfig-f001-20200205
x86_64               randconfig-f001-20200205
x86_64               randconfig-f003-20200205
x86_64               randconfig-f001-20200207
x86_64               randconfig-f002-20200207
x86_64               randconfig-f003-20200207
i386                 randconfig-f001-20200207
i386                 randconfig-f002-20200207
i386                 randconfig-f003-20200207
x86_64               randconfig-g001-20200205
x86_64               randconfig-g002-20200205
x86_64               randconfig-g003-20200205
i386                 randconfig-g001-20200205
i386                 randconfig-g002-20200205
i386                 randconfig-g003-20200205
x86_64               randconfig-g001-20200206
x86_64               randconfig-g002-20200206
x86_64               randconfig-g003-20200206
i386                 randconfig-g001-20200206
i386                 randconfig-g002-20200206
i386                 randconfig-g003-20200206
x86_64               randconfig-g001-20200207
x86_64               randconfig-g002-20200207
x86_64               randconfig-g003-20200207
i386                 randconfig-g001-20200207
i386                 randconfig-g002-20200207
i386                 randconfig-g003-20200207
x86_64               randconfig-h001-20200206
x86_64               randconfig-h002-20200206
x86_64               randconfig-h003-20200206
i386                 randconfig-h001-20200206
i386                 randconfig-h002-20200206
i386                 randconfig-h003-20200206
x86_64               randconfig-h001-20200205
x86_64               randconfig-h002-20200205
x86_64               randconfig-h003-20200205
i386                 randconfig-h001-20200205
i386                 randconfig-h002-20200205
i386                 randconfig-h003-20200205
x86_64               randconfig-h001-20200204
x86_64               randconfig-h002-20200204
x86_64               randconfig-h003-20200204
i386                 randconfig-h001-20200204
i386                 randconfig-h002-20200204
i386                 randconfig-h003-20200204
arc                  randconfig-a001-20200204
ia64                 randconfig-a001-20200204
sparc                randconfig-a001-20200204
arm64                randconfig-a001-20200204
arm                  randconfig-a001-20200204
arc                  randconfig-a001-20200206
arm                  randconfig-a001-20200206
arm64                randconfig-a001-20200206
ia64                 randconfig-a001-20200206
powerpc              randconfig-a001-20200206
sparc                randconfig-a001-20200206
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
