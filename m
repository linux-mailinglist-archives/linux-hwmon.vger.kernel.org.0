Return-Path: <linux-hwmon+bounces-10081-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC88BED0C4
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Oct 2025 15:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1FC15E4A49
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Oct 2025 13:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F6A2773F9;
	Sat, 18 Oct 2025 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiPjqmCm"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3A276026
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760795563; cv=none; b=uBRxvj3p9hcNyv9pyDIPpFOfgEYmUM+NoCES41+RxyzEULxskpdkhTHAkReIAcTcvzfamykywkHv8T8LUePluNTmPswoO49mLKmlqdDmqBj+d4XYu56MBMoTfr8momBQRhTzkrjvHpTV4oB47sceBJ61mURmZEahiFrwmivn/fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760795563; c=relaxed/simple;
	bh=KMS4A1PpclNKdVJRc0krs4w1ZWslQ6Lf3VRCnuMmA4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OXSC3hqdKQIkdEO0md8ToQF3xnkUtCnc0375FRB/gHzHuIMLle4QrywPx9Yiv6iCOhaXLqf47+RuDFz40ExdRLxuzIgcyCVrBWtiX3Blh23YFBHH0eO2k15fF8oTb96uP2jLnl7cE2vnjen8x8ZAuWaoj7qxOa8Ldb/dop5Il5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiPjqmCm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760795561; x=1792331561;
  h=date:from:to:cc:subject:message-id;
  bh=KMS4A1PpclNKdVJRc0krs4w1ZWslQ6Lf3VRCnuMmA4o=;
  b=LiPjqmCmqtphru7LsGLjowUHbumborIdeNumfr0qVIOSgSYt0EEnVGrv
   L8fbeKm+dXcQHNzuVpHc563hZyvkFSKFEHl2CEIoQcIyF8vMMYmC2FxU3
   TdTrFHVFdBM4cvWlgmPYqOv46UCNdtvg9A4yt+EoGByy4eYt6YG4d4DDP
   L/e/0A6/DuleeVUkDkcROHRWTL4aP2L1thMbeIfJSUp1AAP8Y6WhgoM4i
   pFZ6QaCIRHnInVuFoZCi0NW89sihWGCoKD+yflNZkyWVVbtrawr398LYf
   I21q0QxT2akcJaamjLK3K2Zdk7VXEMdAJqERNsdtKuJvEqYtgrV4O+gHV
   w==;
X-CSE-ConnectionGUID: VxvV8RIuQIC1pxR6slw9Aw==
X-CSE-MsgGUID: zrxjFXGyQFmA1In5enri5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63031970"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="63031970"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 06:52:41 -0700
X-CSE-ConnectionGUID: udqglmbbThKgAvptRuG9sQ==
X-CSE-MsgGUID: EpvydUUaSQ2r4LBw18cdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182911170"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2025 06:52:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA7ML-0008JV-2Q;
	Sat, 18 Oct 2025 13:52:37 +0000
Date: Sat, 18 Oct 2025 21:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 be6514fa8b57fc8806eaf3398aa732f6693938bc
Message-ID: <202510182128.CE0GffNN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: be6514fa8b57fc8806eaf3398aa732f6693938bc  hwmon: (cgbc-hwmon) Add missing NULL check after devm_kzalloc()

elapsed time: 1450m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                        nsimosci_defconfig    clang-22
arc                   randconfig-001-20251017    gcc-8.5.0
arc                   randconfig-002-20251017    gcc-11.5.0
arm                              alldefconfig    clang-22
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    clang-22
arm                   randconfig-001-20251017    gcc-15.1.0
arm                   randconfig-002-20251017    clang-22
arm                   randconfig-003-20251017    clang-22
arm                   randconfig-004-20251017    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251017    clang-20
arm64                 randconfig-002-20251017    clang-22
arm64                 randconfig-003-20251017    gcc-15.1.0
arm64                 randconfig-004-20251017    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251017    gcc-15.1.0
csky                  randconfig-002-20251017    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251017    clang-22
hexagon               randconfig-002-20251017    clang-22
i386        buildonly-randconfig-001-20251017    clang-20
i386        buildonly-randconfig-001-20251018    clang-20
i386        buildonly-randconfig-002-20251017    clang-20
i386        buildonly-randconfig-002-20251018    clang-20
i386        buildonly-randconfig-003-20251017    clang-20
i386        buildonly-randconfig-003-20251018    clang-20
i386        buildonly-randconfig-004-20251017    clang-20
i386        buildonly-randconfig-004-20251018    clang-20
i386        buildonly-randconfig-005-20251017    clang-20
i386        buildonly-randconfig-005-20251018    clang-20
i386        buildonly-randconfig-006-20251017    clang-20
i386        buildonly-randconfig-006-20251018    clang-20
i386                  randconfig-001-20251018    gcc-14
i386                  randconfig-002-20251018    gcc-14
i386                  randconfig-003-20251018    gcc-14
i386                  randconfig-004-20251018    gcc-14
i386                  randconfig-005-20251018    gcc-14
i386                  randconfig-006-20251018    gcc-14
i386                  randconfig-007-20251018    gcc-14
i386                  randconfig-011-20251018    clang-20
i386                  randconfig-012-20251018    clang-20
i386                  randconfig-013-20251018    clang-20
i386                  randconfig-014-20251018    clang-20
i386                  randconfig-015-20251018    clang-20
i386                  randconfig-016-20251018    clang-20
i386                  randconfig-017-20251018    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251017    gcc-13.4.0
loongarch             randconfig-002-20251017    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5272c3_defconfig    clang-22
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251017    gcc-8.5.0
nios2                 randconfig-002-20251017    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251017    gcc-12.5.0
parisc                randconfig-002-20251017    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                       holly_defconfig    clang-22
powerpc               randconfig-001-20251017    gcc-14.3.0
powerpc               randconfig-002-20251017    clang-22
powerpc               randconfig-003-20251017    gcc-11.5.0
powerpc                     tqm8555_defconfig    clang-22
powerpc                 xes_mpc85xx_defconfig    clang-22
powerpc64             randconfig-001-20251017    clang-20
powerpc64             randconfig-002-20251017    gcc-15.1.0
powerpc64             randconfig-003-20251017    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251018    gcc-8.5.0
riscv                 randconfig-002-20251018    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-002-20251018    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20251018    gcc-13.4.0
sh                    randconfig-002-20251018    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251018    gcc-11.5.0
sparc                 randconfig-002-20251018    gcc-13.4.0
sparc64               randconfig-001-20251018    gcc-8.5.0
sparc64               randconfig-002-20251018    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20251018    gcc-14
um                    randconfig-002-20251018    gcc-14
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251017    gcc-14
x86_64      buildonly-randconfig-001-20251018    clang-20
x86_64      buildonly-randconfig-002-20251017    gcc-14
x86_64      buildonly-randconfig-002-20251018    clang-20
x86_64      buildonly-randconfig-003-20251017    clang-20
x86_64      buildonly-randconfig-003-20251018    clang-20
x86_64      buildonly-randconfig-004-20251017    gcc-14
x86_64      buildonly-randconfig-004-20251018    clang-20
x86_64      buildonly-randconfig-005-20251017    clang-20
x86_64      buildonly-randconfig-005-20251018    clang-20
x86_64      buildonly-randconfig-006-20251017    clang-20
x86_64      buildonly-randconfig-006-20251018    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20251018    clang-20
x86_64                randconfig-072-20251018    clang-20
x86_64                randconfig-073-20251018    clang-20
x86_64                randconfig-074-20251018    clang-20
x86_64                randconfig-075-20251018    clang-20
x86_64                randconfig-076-20251018    clang-20
x86_64                randconfig-077-20251018    clang-20
x86_64                randconfig-078-20251018    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    clang-22
xtensa                randconfig-002-20251018    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

