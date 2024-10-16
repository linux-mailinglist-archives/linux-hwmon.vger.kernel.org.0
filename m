Return-Path: <linux-hwmon+bounces-4419-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B679A011C
	for <lists+linux-hwmon@lfdr.de>; Wed, 16 Oct 2024 08:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBFDFB21462
	for <lists+linux-hwmon@lfdr.de>; Wed, 16 Oct 2024 06:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4803018C33A;
	Wed, 16 Oct 2024 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1gxtvPp"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944B18B48D
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Oct 2024 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729059061; cv=none; b=K2SYegtzEWKYo7WEXgFMZNl+eOpuXsGTtp9YsGolcDOLN8MmYp/9q96f2uG1Vym1EsPnIghJoSXWfcqhqWfkHxNrdWtmUGoPbBMzGwWET1uJ/LCO0+GaWUi+G/zYilFnPfCuSWw75e9RMV1Eq+mXt1LD+m2MuV2SP7N9aKGbSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729059061; c=relaxed/simple;
	bh=6WkkK1uMGj0c7jO2+r3NFF0gpqbH1dvyYi+X389+JKw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FFdZjqt1e8I0hmP7PitMDzMhD1vM2aAlIph+QYC3XuYNU3kX8GzVBq5J8DiR7CXRZA7tMWhMSjHmsvCVF1kzXcdfMWkFfZlMiRtrOnTsNWQBydhPA0/qSVLXnX8FBANbZfR3qQLK6uBB0vJGHsCs4DJ3wS9iEMyqcOOXJsgOHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1gxtvPp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729059059; x=1760595059;
  h=date:from:to:cc:subject:message-id;
  bh=6WkkK1uMGj0c7jO2+r3NFF0gpqbH1dvyYi+X389+JKw=;
  b=l1gxtvPpTqOsqc5tVE62w9vyj3mVklvu9yIE1yp3xh9bQio+lC2l8w0V
   5i/YDYMtbd/elV52rfHLic8M96Xmagur7EHzcinh88ZQHxUQS52pZzL0g
   QciiEs6TAE4jc4AfdB2O9hGFAtJO0+elwsX8tpVJ1TxvOAGFr/EJIzr6N
   wHOVY4GS2NCqTz0meqRtQ97lceEioKX+qBx739LGW3YQydw/kySehjq/I
   pdVanQ0ZOIH/c8e1yaSKXM7nUP0FIc0WdsXh4PMrhhXZX2zlHnfX+63TO
   VSQv3X8L/C7hE5xBck2bqR5BLhnmFQnaGkCJ7EbxPpSq42F8UK+zYEMcr
   Q==;
X-CSE-ConnectionGUID: 205zdnD4RsG8wTXgCuvP8A==
X-CSE-MsgGUID: PWgx3QNpSuyxEysuf56dhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28375548"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28375548"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 23:10:58 -0700
X-CSE-ConnectionGUID: aMU59dzMTsqStU3KgWskgA==
X-CSE-MsgGUID: 6TnUmKMEQ5WEtUQIQu8cIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78074541"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Oct 2024 23:10:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0xFH-000KOz-0i;
	Wed, 16 Oct 2024 06:10:55 +0000
Date: Wed, 16 Oct 2024 14:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 eabb03810194b75417b09cff8a526d26939736ac
Message-ID: <202410161403.QDgxht9R-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: eabb03810194b75417b09cff8a526d26939736ac  [PATCH} hwmon: (jc42) Properly detect TSE2004-compliant devices again

elapsed time: 1629m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-13.2.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                        nsim_700_defconfig    clang-15
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                        vdk_hs38_defconfig    clang-15
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                     am200epdkit_defconfig    clang-15
arm                         at91_dt_defconfig    gcc-13.2.0
arm                         bcm2835_defconfig    clang-15
arm                                 defconfig    gcc-14.1.0
arm                            hisi_defconfig    clang-15
arm                   milbeaut_m10v_defconfig    gcc-13.2.0
arm                          pxa910_defconfig    gcc-13.2.0
arm                         s3c6400_defconfig    gcc-13.2.0
arm                          sp7021_defconfig    clang-15
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             alldefconfig    clang-15
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241016    gcc-11
i386        buildonly-randconfig-002-20241016    gcc-11
i386        buildonly-randconfig-003-20241016    gcc-11
i386        buildonly-randconfig-004-20241016    gcc-11
i386        buildonly-randconfig-005-20241016    gcc-11
i386        buildonly-randconfig-006-20241016    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20241016    gcc-11
i386                  randconfig-002-20241016    gcc-11
i386                  randconfig-003-20241016    gcc-11
i386                  randconfig-004-20241016    gcc-11
i386                  randconfig-005-20241016    gcc-11
i386                  randconfig-006-20241016    gcc-11
i386                  randconfig-011-20241016    gcc-11
i386                  randconfig-012-20241016    gcc-11
i386                  randconfig-013-20241016    gcc-11
i386                  randconfig-014-20241016    gcc-11
i386                  randconfig-015-20241016    gcc-11
i386                  randconfig-016-20241016    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-13.2.0
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-13.2.0
powerpc                      chrp32_defconfig    gcc-13.2.0
powerpc                     kmeter1_defconfig    clang-15
powerpc                 mpc832x_rdb_defconfig    gcc-13.2.0
powerpc                      pcm030_defconfig    clang-15
powerpc                      pcm030_defconfig    gcc-13.2.0
powerpc                     ppa8548_defconfig    clang-15
powerpc                      ppc44x_defconfig    clang-15
powerpc                         ps3_defconfig    clang-15
powerpc                  storcenter_defconfig    gcc-13.2.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-13.2.0
sh                        edosk7760_defconfig    gcc-13.2.0
sh                          sdk7780_defconfig    gcc-13.2.0
sh                   sh7770_generic_defconfig    gcc-13.2.0
sh                          urquell_defconfig    clang-15
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-13.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241016    gcc-12
x86_64      buildonly-randconfig-002-20241016    gcc-12
x86_64      buildonly-randconfig-003-20241016    gcc-12
x86_64      buildonly-randconfig-004-20241016    gcc-12
x86_64      buildonly-randconfig-005-20241016    gcc-12
x86_64      buildonly-randconfig-006-20241016    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241016    gcc-12
x86_64                randconfig-002-20241016    gcc-12
x86_64                randconfig-003-20241016    gcc-12
x86_64                randconfig-004-20241016    gcc-12
x86_64                randconfig-005-20241016    gcc-12
x86_64                randconfig-006-20241016    gcc-12
x86_64                randconfig-011-20241016    gcc-12
x86_64                randconfig-012-20241016    gcc-12
x86_64                randconfig-013-20241016    gcc-12
x86_64                randconfig-014-20241016    gcc-12
x86_64                randconfig-015-20241016    gcc-12
x86_64                randconfig-016-20241016    gcc-12
x86_64                randconfig-071-20241016    gcc-12
x86_64                randconfig-072-20241016    gcc-12
x86_64                randconfig-073-20241016    gcc-12
x86_64                randconfig-074-20241016    gcc-12
x86_64                randconfig-075-20241016    gcc-12
x86_64                randconfig-076-20241016    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

