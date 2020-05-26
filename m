Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171DC1A640A
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Apr 2020 10:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgDMIY5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 13 Apr 2020 04:24:57 -0400
Received: from mga06.intel.com ([134.134.136.31]:39888 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727971AbgDMIY4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Apr 2020 04:24:56 -0400
IronPort-SDR: tQ+ErCLh9dGsFNODh5IEsZZrEGeiTcRVInxDnk9/qcvYD8fQMWDL/xVIiilNHU9YxK4A7Au0rz
 2GirG7qB4hrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 01:24:55 -0700
IronPort-SDR: dfhqYwusCHccRouM8fWQKhoDZNSY/8Y9b0CDFs33VwZNSXb87Wg+1Zr373CsdUc/cRRq6K3nZa
 Z0hsHoPUajKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="243481811"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2020 01:24:52 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jNuOh-0001GH-Sh; Mon, 13 Apr 2020 16:24:51 +0800
Date:   Mon, 13 Apr 2020 16:24:33 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 4b86b0f144be5939a981f1d27f806c8a46b5182e
Message-ID: <5e9421c1.4irejuMiOObUXqLB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: 4b86b0f144be5939a981f1d27f806c8a46b5182e  watchdog: sp805: fix restart handler

elapsed time: 484m

configs tested: 182
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
openrisc                    or1ksim_defconfig
powerpc                       ppc64_defconfig
m68k                       m5475evb_defconfig
ia64                                defconfig
powerpc                             defconfig
sh                            titan_defconfig
mips                      malta_kvm_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200413
x86_64               randconfig-a002-20200413
x86_64               randconfig-a003-20200413
i386                 randconfig-a001-20200413
i386                 randconfig-a002-20200413
i386                 randconfig-a003-20200413
mips                 randconfig-a001-20200412
nds32                randconfig-a001-20200412
riscv                randconfig-a001-20200412
m68k                 randconfig-a001-20200412
parisc               randconfig-a001-20200412
alpha                randconfig-a001-20200412
c6x                  randconfig-a001-20200412
h8300                randconfig-a001-20200412
microblaze           randconfig-a001-20200412
nios2                randconfig-a001-20200412
sparc64              randconfig-a001-20200412
csky                 randconfig-a001-20200413
openrisc             randconfig-a001-20200413
s390                 randconfig-a001-20200413
sh                   randconfig-a001-20200413
xtensa               randconfig-a001-20200413
x86_64               randconfig-b001-20200412
x86_64               randconfig-b002-20200412
x86_64               randconfig-b003-20200412
i386                 randconfig-b001-20200412
i386                 randconfig-b002-20200412
i386                 randconfig-b003-20200412
x86_64               randconfig-b001-20200413
x86_64               randconfig-b002-20200413
x86_64               randconfig-b003-20200413
i386                 randconfig-b001-20200413
i386                 randconfig-b002-20200413
i386                 randconfig-b003-20200413
x86_64               randconfig-c001-20200413
x86_64               randconfig-c002-20200413
x86_64               randconfig-c003-20200413
i386                 randconfig-c001-20200413
i386                 randconfig-c002-20200413
i386                 randconfig-c003-20200413
i386                 randconfig-d002-20200412
x86_64               randconfig-d003-20200412
i386                 randconfig-d003-20200412
i386                 randconfig-d001-20200412
x86_64               randconfig-d002-20200412
x86_64               randconfig-e001-20200412
x86_64               randconfig-e002-20200412
x86_64               randconfig-e003-20200412
i386                 randconfig-e001-20200412
i386                 randconfig-e002-20200412
i386                 randconfig-e003-20200412
x86_64               randconfig-f001-20200413
x86_64               randconfig-f002-20200413
x86_64               randconfig-f003-20200413
i386                 randconfig-f001-20200413
i386                 randconfig-f002-20200413
i386                 randconfig-f003-20200413
x86_64               randconfig-f001-20200412
x86_64               randconfig-f002-20200412
x86_64               randconfig-f003-20200412
i386                 randconfig-f001-20200412
i386                 randconfig-f002-20200412
i386                 randconfig-f003-20200412
x86_64               randconfig-g003-20200413
i386                 randconfig-g003-20200413
x86_64               randconfig-g001-20200413
x86_64               randconfig-g002-20200413
i386                 randconfig-g002-20200413
i386                 randconfig-g001-20200413
x86_64               randconfig-h001-20200413
i386                 randconfig-h003-20200413
i386                 randconfig-h002-20200413
i386                 randconfig-h001-20200413
x86_64               randconfig-h002-20200413
x86_64               randconfig-h001-20200412
x86_64               randconfig-h002-20200412
x86_64               randconfig-h003-20200412
i386                 randconfig-h001-20200412
i386                 randconfig-h002-20200412
i386                 randconfig-h003-20200412
arm64                randconfig-a001-20200412
ia64                 randconfig-a001-20200412
arc                  randconfig-a001-20200412
arm                  randconfig-a001-20200412
sparc                randconfig-a001-20200412
powerpc              randconfig-a001-20200412
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
