Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0541D17DED8
	for <lists+linux-hwmon@lfdr.de>; Mon,  9 Mar 2020 12:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgCILlJ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 9 Mar 2020 07:41:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:22618 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgCILlJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 9 Mar 2020 07:41:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 04:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; 
   d="scan'208";a="265228762"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2020 04:41:01 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jBGmL-000Cv6-4t; Mon, 09 Mar 2020 19:41:01 +0800
Date:   Mon, 09 Mar 2020 19:40:25 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 86da28eed4fbc64dfdc386337f6cbac36c9c1ed2
Message-ID: <5e662b29.0Nj7UrSDU4j2vuT4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 86da28eed4fbc64dfdc386337f6cbac36c9c1ed2  hwmon: (adt7475) Add support for inverting pwm output

elapsed time: 481m

configs tested: 163
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
arm                              allmodconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
i386                 randconfig-a003-20200309
i386                 randconfig-a001-20200309
x86_64               randconfig-a001-20200309
x86_64               randconfig-a003-20200309
i386                 randconfig-a002-20200309
x86_64               randconfig-a002-20200309
riscv                randconfig-a001-20200309
m68k                 randconfig-a001-20200309
alpha                randconfig-a001-20200309
mips                 randconfig-a001-20200309
nds32                randconfig-a001-20200309
parisc               randconfig-a001-20200309
sparc64              randconfig-a001-20200309
microblaze           randconfig-a001-20200309
c6x                  randconfig-a001-20200309
nios2                randconfig-a001-20200309
h8300                randconfig-a001-20200309
openrisc             randconfig-a001-20200309
sh                   randconfig-a001-20200309
csky                 randconfig-a001-20200309
s390                 randconfig-a001-20200309
xtensa               randconfig-a001-20200309
x86_64               randconfig-b001-20200309
x86_64               randconfig-b002-20200309
i386                 randconfig-b001-20200309
i386                 randconfig-b003-20200309
x86_64               randconfig-b003-20200309
i386                 randconfig-b002-20200309
x86_64               randconfig-c001-20200309
x86_64               randconfig-c002-20200309
x86_64               randconfig-c003-20200309
i386                 randconfig-c001-20200309
i386                 randconfig-c002-20200309
i386                 randconfig-c003-20200309
i386                 randconfig-d001-20200309
x86_64               randconfig-d003-20200309
x86_64               randconfig-d001-20200309
i386                 randconfig-d003-20200309
x86_64               randconfig-d002-20200309
i386                 randconfig-d002-20200309
i386                 randconfig-e001-20200309
i386                 randconfig-e003-20200309
x86_64               randconfig-e002-20200309
x86_64               randconfig-e001-20200309
i386                 randconfig-e002-20200309
x86_64               randconfig-e003-20200309
i386                 randconfig-f003-20200309
x86_64               randconfig-f001-20200309
i386                 randconfig-f002-20200309
i386                 randconfig-f001-20200309
x86_64               randconfig-f002-20200309
x86_64               randconfig-f003-20200309
x86_64               randconfig-g003-20200309
i386                 randconfig-g001-20200309
i386                 randconfig-g003-20200309
x86_64               randconfig-g001-20200309
x86_64               randconfig-g002-20200309
i386                 randconfig-g002-20200309
i386                 randconfig-h001-20200308
x86_64               randconfig-h001-20200308
x86_64               randconfig-h002-20200308
x86_64               randconfig-h003-20200308
i386                 randconfig-h003-20200308
i386                 randconfig-h002-20200308
arc                  randconfig-a001-20200309
sparc                randconfig-a001-20200309
ia64                 randconfig-a001-20200309
arm                  randconfig-a001-20200309
arm64                randconfig-a001-20200309
powerpc              randconfig-a001-20200309
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
