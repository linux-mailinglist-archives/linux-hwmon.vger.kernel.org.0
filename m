Return-Path: <linux-hwmon+bounces-5434-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6FD9EA423
	for <lists+linux-hwmon@lfdr.de>; Tue, 10 Dec 2024 02:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2623F280E2D
	for <lists+linux-hwmon@lfdr.de>; Tue, 10 Dec 2024 01:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D7BA936;
	Tue, 10 Dec 2024 01:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLqwU9ux"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B48C1E
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Dec 2024 01:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733793349; cv=none; b=YoiF/tcX7lCCzUgggxiJLfKn9h8ZZIupvNmm2qgO9Ie4k6A3yQ2UI2uKf8a2c/rlJTrMabxNZSfvjoKtX/Lk419XdD/g0QfxOCRT1WtlPqM5XyAlHBwP7XgRA+y9dX/LCKh0GIGOLaAUENtTvfIO+CBA614TrvwVX9nK5pvIbfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733793349; c=relaxed/simple;
	bh=WxKSel/05OYk0PnoiaZlM5WlgJ73N/wxSxrTN2LUZ8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VfnPpDxCnZxusj1OABgh6UVKttDVL1Ca3FAe77Z3VGsUewPGUTR4fofR88TZk7eaz1sbxtK1qiF/lvwy/y2XjWpBUIINydAq3ALHHc2XRD+n6PvsJorqNzTSvv8ApmCgDSAEXJlkwlSL1kIcz8QQrs5JEafBaqERZyRVq4qxIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLqwU9ux; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733793347; x=1765329347;
  h=date:from:to:cc:subject:message-id;
  bh=WxKSel/05OYk0PnoiaZlM5WlgJ73N/wxSxrTN2LUZ8M=;
  b=JLqwU9uxk2wYWbT5d91TlC4rOPjONYtLbBn9VMZqlJkXqCyrwNZnPuzq
   TI4a6m//8ety80F0iJlusSY9X1saUfgDx/yOyKsdr6jngZFcQs6DBL95G
   7T41sFew6zaXycxK0uDfO3TZwJDQ4ei/oZ0Aae5l2v/QeH9Cb0b4zsS0g
   xrUtUazRsoB7TIxT/ss4vu9HaLPY9jYymiNGg/pt7A3+khTeIffpU61Gh
   BdAg8O0Pt8PemDQv19nB8OpfZbj6ZEbG6sV1dxfZXNEy57A/ClUgFq8b7
   O5VNe6eYblDGG1YiDwCxdmp63DpoPjExjXvfYjLSNkGmmRu9CKIrtLLYo
   w==;
X-CSE-ConnectionGUID: dAYYM3M6Q3GaI4j9DcDzMA==
X-CSE-MsgGUID: fgyCY8zRR0ScV6LYcuWqEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="36955099"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="36955099"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 17:15:46 -0800
X-CSE-ConnectionGUID: 3WM5YhIWRBKFTszXa6m6tQ==
X-CSE-MsgGUID: BPEhJDn7T3W2rf1Fvs4DhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100193544"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2024 17:15:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKoqk-0004zh-1e;
	Tue, 10 Dec 2024 01:15:42 +0000
Date: Tue, 10 Dec 2024 09:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 4ea915f3288756d829ba8abbd6cee10cf84a5a11
Message-ID: <202412100956.KuqS8JpI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: 4ea915f3288756d829ba8abbd6cee10cf84a5a11  openrisc: place exception table at the head of vmlinux

elapsed time: 1457m

configs tested: 341
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241209    clang-20
arc                   randconfig-001-20241209    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-14.2.0
arc                   randconfig-002-20241209    clang-20
arc                   randconfig-002-20241209    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-14.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-20
arm                           h3600_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-20
arm                           omap1_defconfig    clang-16
arm                          pxa3xx_defconfig    clang-16
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241209    clang-20
arm                   randconfig-001-20241210    gcc-14.2.0
arm                   randconfig-002-20241209    clang-20
arm                   randconfig-002-20241210    gcc-14.2.0
arm                   randconfig-003-20241209    clang-20
arm                   randconfig-003-20241210    gcc-14.2.0
arm                   randconfig-004-20241209    clang-20
arm                   randconfig-004-20241210    gcc-14.2.0
arm                        shmobile_defconfig    clang-20
arm                        spear6xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241209    clang-20
arm64                 randconfig-001-20241209    gcc-14.2.0
arm64                 randconfig-001-20241210    gcc-14.2.0
arm64                 randconfig-002-20241209    clang-20
arm64                 randconfig-002-20241210    gcc-14.2.0
arm64                 randconfig-003-20241209    clang-19
arm64                 randconfig-003-20241209    clang-20
arm64                 randconfig-003-20241210    gcc-14.2.0
arm64                 randconfig-004-20241209    clang-20
arm64                 randconfig-004-20241209    gcc-14.2.0
arm64                 randconfig-004-20241210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241209    clang-17
csky                  randconfig-001-20241209    gcc-14.2.0
csky                  randconfig-001-20241210    gcc-14.2.0
csky                  randconfig-002-20241209    clang-17
csky                  randconfig-002-20241209    gcc-14.2.0
csky                  randconfig-002-20241210    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241209    clang-16
hexagon               randconfig-001-20241209    clang-17
hexagon               randconfig-001-20241210    gcc-14.2.0
hexagon               randconfig-002-20241209    clang-17
hexagon               randconfig-002-20241209    clang-20
hexagon               randconfig-002-20241210    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241209    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-002-20241209    clang-19
i386        buildonly-randconfig-002-20241210    gcc-12
i386        buildonly-randconfig-003-20241209    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-004-20241209    clang-19
i386        buildonly-randconfig-004-20241210    gcc-12
i386        buildonly-randconfig-005-20241209    clang-19
i386        buildonly-randconfig-005-20241210    gcc-12
i386        buildonly-randconfig-006-20241209    clang-19
i386        buildonly-randconfig-006-20241210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241209    clang-19
i386                  randconfig-001-20241210    clang-19
i386                  randconfig-002-20241209    clang-19
i386                  randconfig-002-20241210    clang-19
i386                  randconfig-003-20241209    clang-19
i386                  randconfig-003-20241210    clang-19
i386                  randconfig-004-20241209    clang-19
i386                  randconfig-004-20241210    clang-19
i386                  randconfig-005-20241209    clang-19
i386                  randconfig-005-20241210    clang-19
i386                  randconfig-006-20241209    clang-19
i386                  randconfig-006-20241210    clang-19
i386                  randconfig-007-20241209    clang-19
i386                  randconfig-007-20241210    clang-19
i386                  randconfig-011-20241209    gcc-12
i386                  randconfig-011-20241210    clang-19
i386                  randconfig-012-20241209    gcc-12
i386                  randconfig-012-20241210    clang-19
i386                  randconfig-013-20241209    gcc-12
i386                  randconfig-013-20241210    clang-19
i386                  randconfig-014-20241209    gcc-12
i386                  randconfig-014-20241210    clang-19
i386                  randconfig-015-20241209    gcc-12
i386                  randconfig-015-20241210    clang-19
i386                  randconfig-016-20241209    gcc-12
i386                  randconfig-016-20241210    clang-19
i386                  randconfig-017-20241209    gcc-12
i386                  randconfig-017-20241210    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241209    clang-17
loongarch             randconfig-001-20241209    gcc-14.2.0
loongarch             randconfig-001-20241210    gcc-14.2.0
loongarch             randconfig-002-20241209    clang-17
loongarch             randconfig-002-20241209    gcc-14.2.0
loongarch             randconfig-002-20241210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    clang-20
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-20
mips                      bmips_stb_defconfig    clang-20
mips                         db1xxx_defconfig    clang-16
mips                         db1xxx_defconfig    clang-20
mips                        omega2p_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241209    clang-17
nios2                 randconfig-001-20241209    gcc-14.2.0
nios2                 randconfig-001-20241210    gcc-14.2.0
nios2                 randconfig-002-20241209    clang-17
nios2                 randconfig-002-20241209    gcc-14.2.0
nios2                 randconfig-002-20241210    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241209    clang-17
parisc                randconfig-001-20241209    gcc-14.2.0
parisc                randconfig-001-20241210    gcc-14.2.0
parisc                randconfig-002-20241209    clang-17
parisc                randconfig-002-20241209    gcc-14.2.0
parisc                randconfig-002-20241210    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    clang-16
powerpc                   motionpro_defconfig    clang-16
powerpc                     mpc83xx_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241209    clang-17
powerpc               randconfig-001-20241209    gcc-14.2.0
powerpc               randconfig-001-20241210    gcc-14.2.0
powerpc               randconfig-002-20241209    clang-15
powerpc               randconfig-002-20241209    clang-17
powerpc               randconfig-002-20241210    gcc-14.2.0
powerpc               randconfig-003-20241209    clang-17
powerpc               randconfig-003-20241210    gcc-14.2.0
powerpc                     sequoia_defconfig    clang-17
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241209    clang-17
powerpc64             randconfig-001-20241209    gcc-14.2.0
powerpc64             randconfig-001-20241210    gcc-14.2.0
powerpc64             randconfig-002-20241209    clang-17
powerpc64             randconfig-002-20241210    gcc-14.2.0
powerpc64             randconfig-003-20241209    clang-17
powerpc64             randconfig-003-20241209    clang-20
powerpc64             randconfig-003-20241210    gcc-14.2.0
riscv                            alldefconfig    clang-16
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241209    clang-19
riscv                 randconfig-001-20241209    gcc-14.2.0
riscv                 randconfig-001-20241210    gcc-14.2.0
riscv                 randconfig-002-20241209    clang-20
riscv                 randconfig-002-20241209    gcc-14.2.0
riscv                 randconfig-002-20241210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241209    clang-16
s390                  randconfig-001-20241209    gcc-14.2.0
s390                  randconfig-001-20241210    gcc-14.2.0
s390                  randconfig-002-20241209    gcc-14.2.0
s390                  randconfig-002-20241210    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    clang-20
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241209    gcc-14.2.0
sh                    randconfig-001-20241210    gcc-14.2.0
sh                    randconfig-002-20241209    gcc-14.2.0
sh                    randconfig-002-20241210    gcc-14.2.0
sh                          rsk7203_defconfig    clang-20
sh                          rsk7269_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241209    gcc-14.2.0
sparc                 randconfig-001-20241210    gcc-14.2.0
sparc                 randconfig-002-20241209    gcc-14.2.0
sparc                 randconfig-002-20241210    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241209    gcc-14.2.0
sparc64               randconfig-001-20241210    gcc-14.2.0
sparc64               randconfig-002-20241209    gcc-14.2.0
sparc64               randconfig-002-20241210    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241209    clang-19
um                    randconfig-001-20241209    gcc-14.2.0
um                    randconfig-001-20241210    gcc-14.2.0
um                    randconfig-002-20241209    gcc-12
um                    randconfig-002-20241209    gcc-14.2.0
um                    randconfig-002-20241210    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241209    gcc-12
x86_64      buildonly-randconfig-001-20241210    clang-19
x86_64      buildonly-randconfig-002-20241209    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-003-20241209    clang-19
x86_64      buildonly-randconfig-003-20241209    gcc-12
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-004-20241209    gcc-12
x86_64      buildonly-randconfig-004-20241210    clang-19
x86_64      buildonly-randconfig-005-20241209    clang-19
x86_64      buildonly-randconfig-005-20241209    gcc-12
x86_64      buildonly-randconfig-005-20241210    clang-19
x86_64      buildonly-randconfig-006-20241209    clang-19
x86_64      buildonly-randconfig-006-20241209    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241209    gcc-12
x86_64                randconfig-001-20241210    gcc-12
x86_64                randconfig-002-20241209    gcc-12
x86_64                randconfig-002-20241210    gcc-12
x86_64                randconfig-003-20241209    gcc-12
x86_64                randconfig-003-20241210    gcc-12
x86_64                randconfig-004-20241209    gcc-12
x86_64                randconfig-004-20241210    gcc-12
x86_64                randconfig-005-20241209    gcc-12
x86_64                randconfig-005-20241210    gcc-12
x86_64                randconfig-006-20241209    gcc-12
x86_64                randconfig-006-20241210    gcc-12
x86_64                randconfig-007-20241209    gcc-12
x86_64                randconfig-007-20241210    gcc-12
x86_64                randconfig-008-20241209    gcc-12
x86_64                randconfig-008-20241210    gcc-12
x86_64                randconfig-071-20241209    gcc-12
x86_64                randconfig-071-20241210    gcc-12
x86_64                randconfig-072-20241209    gcc-12
x86_64                randconfig-072-20241210    gcc-12
x86_64                randconfig-073-20241209    gcc-12
x86_64                randconfig-073-20241210    gcc-12
x86_64                randconfig-074-20241209    gcc-12
x86_64                randconfig-074-20241210    gcc-12
x86_64                randconfig-075-20241209    gcc-12
x86_64                randconfig-075-20241210    gcc-12
x86_64                randconfig-076-20241209    gcc-12
x86_64                randconfig-076-20241210    gcc-12
x86_64                randconfig-077-20241209    gcc-12
x86_64                randconfig-077-20241210    gcc-12
x86_64                randconfig-078-20241209    gcc-12
x86_64                randconfig-078-20241210    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                randconfig-001-20241209    gcc-14.2.0
xtensa                randconfig-001-20241210    gcc-14.2.0
xtensa                randconfig-002-20241209    gcc-14.2.0
xtensa                randconfig-002-20241210    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

