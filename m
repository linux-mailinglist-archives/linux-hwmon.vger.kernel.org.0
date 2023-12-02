Return-Path: <linux-hwmon+bounces-315-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C811F801DAF
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Dec 2023 17:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27151C208CE
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Dec 2023 16:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD811C291;
	Sat,  2 Dec 2023 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbbJszcs"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A4CA2
	for <linux-hwmon@vger.kernel.org>; Sat,  2 Dec 2023 08:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701533786; x=1733069786;
  h=date:from:to:cc:subject:message-id;
  bh=1rnr0o2sgp71uXlF9555ZHUQo9hSRfFyStxjEC7bVTo=;
  b=YbbJszcsjWpJ5Wx/hkTVe1gXscm+fFcIYSs84kuvvmDT3c2ypK3KzqDY
   ipFNfhfntodnUd0zMBfLeG2vSM+pwznkHVLGXk1f5H+q2p9hy6C7uXYwm
   +2wGnD9ZHbEwtsBWU8bYR9AALhFC02klj3979fpQlT3talJVMpAcMXrsO
   2efEO441HxfrTxgEBEcM1hFXsQUX2H2dONI0IoY7oZl7Xv6kdf86nsmeM
   Gs35WXzsQtph/tfaDurknHFXIyok3nKwp5S32T7r9pYpJVvdhCiLgDzKZ
   z/jafi3exwOf6BvY25AstQLAHNj0RarGVwzuDii/CEY4qo3XTP2JJvK8q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="378640539"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="378640539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 08:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="11481509"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2023 08:16:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9SfG-0005Qq-0l;
	Sat, 02 Dec 2023 16:16:22 +0000
Date: Sun, 03 Dec 2023 00:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 31d16f6ced5d43ab5fc21dc4eec3739e46f1960a
Message-ID: <202312030058.MfM7Dnqx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 31d16f6ced5d43ab5fc21dc4eec3739e46f1960a  hwmon: (dell-smm) Add Optiplex 7000 to fan control whitelist

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-002-20231202
|   `-- include-linux-platform_data-cros_ec_commands.h:warning:field-within-struct-ec_params_motion_sense-is-less-aligned-than-union-ec_params_motion_sense::(anonymous-at-include-linux-platform_data-cros_ec_c
|-- arm-randconfig-003-20231202
|   `-- drivers-infiniband-core-mad_priv.h:warning:field-wc-within-struct-ib_mad_private_header-is-less-aligned-than-struct-ib_wc-and-is-usually-due-to-struct-ib_mad_private_header-being-packed-which-can-lead
|-- arm-randconfig-004-20231202
|   `-- include-linux-platform_data-cros_ec_commands.h:warning:field-within-struct-ec_params_motion_sense-is-less-aligned-than-union-ec_params_motion_sense::(anonymous-at-include-linux-platform_data-cros_ec_c
`-- powerpc-randconfig-003-20231202
    `-- fs-bcachefs-fsck.c:warning:stack-frame-size-()-exceeds-limit-()-in-reattach_inode

elapsed time: 1464m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231202   gcc  
arc                   randconfig-002-20231202   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                   randconfig-001-20231202   clang
arm                   randconfig-002-20231202   clang
arm                   randconfig-003-20231202   clang
arm                   randconfig-004-20231202   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231202   clang
arm64                 randconfig-002-20231202   clang
arm64                 randconfig-003-20231202   clang
arm64                 randconfig-004-20231202   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231202   gcc  
csky                  randconfig-002-20231202   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231202   clang
hexagon               randconfig-002-20231202   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231202   clang
i386         buildonly-randconfig-002-20231202   clang
i386         buildonly-randconfig-003-20231202   clang
i386         buildonly-randconfig-004-20231202   clang
i386         buildonly-randconfig-005-20231202   clang
i386         buildonly-randconfig-006-20231202   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231202   clang
i386                  randconfig-002-20231202   clang
i386                  randconfig-003-20231202   clang
i386                  randconfig-004-20231202   clang
i386                  randconfig-005-20231202   clang
i386                  randconfig-006-20231202   clang
i386                  randconfig-011-20231202   gcc  
i386                  randconfig-012-20231202   gcc  
i386                  randconfig-013-20231202   gcc  
i386                  randconfig-014-20231202   gcc  
i386                  randconfig-015-20231202   gcc  
i386                  randconfig-016-20231202   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231202   gcc  
loongarch             randconfig-002-20231202   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231202   gcc  
nios2                 randconfig-002-20231202   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231202   gcc  
parisc                randconfig-002-20231202   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   currituck_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20231202   clang
powerpc               randconfig-002-20231202   clang
powerpc               randconfig-003-20231202   clang
powerpc64             randconfig-001-20231202   clang
powerpc64             randconfig-002-20231202   clang
powerpc64             randconfig-003-20231202   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231202   clang
riscv                 randconfig-002-20231202   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231202   gcc  
s390                  randconfig-002-20231202   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20231202   gcc  
sh                    randconfig-002-20231202   gcc  
sh                           se7721_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231202   gcc  
sparc64               randconfig-002-20231202   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231202   clang
um                    randconfig-002-20231202   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231202   clang
x86_64       buildonly-randconfig-002-20231202   clang
x86_64       buildonly-randconfig-003-20231202   clang
x86_64       buildonly-randconfig-004-20231202   clang
x86_64       buildonly-randconfig-005-20231202   clang
x86_64       buildonly-randconfig-006-20231202   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231202   gcc  
x86_64                randconfig-002-20231202   gcc  
x86_64                randconfig-003-20231202   gcc  
x86_64                randconfig-004-20231202   gcc  
x86_64                randconfig-005-20231202   gcc  
x86_64                randconfig-006-20231202   gcc  
x86_64                randconfig-011-20231202   clang
x86_64                randconfig-012-20231202   clang
x86_64                randconfig-013-20231202   clang
x86_64                randconfig-014-20231202   clang
x86_64                randconfig-015-20231202   clang
x86_64                randconfig-016-20231202   clang
x86_64                randconfig-071-20231202   clang
x86_64                randconfig-072-20231202   clang
x86_64                randconfig-073-20231202   clang
x86_64                randconfig-074-20231202   clang
x86_64                randconfig-075-20231202   clang
x86_64                randconfig-076-20231202   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20231202   gcc  
xtensa                randconfig-002-20231202   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

