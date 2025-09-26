Return-Path: <linux-hwmon+bounces-9731-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F0BA4840
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Sep 2025 17:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE271385660
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Sep 2025 15:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23B2223DF6;
	Fri, 26 Sep 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANBkJak1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047621D6195
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Sep 2025 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758902253; cv=none; b=YZWr9lVh1pYmzioKw9927DEgoRPCfARVInbjbq6PFEnV1BNBz6lJlSr6Ghmtc7xwx9CawsLt/3QVX349+gWYebEcVBHnYAfoJFj4C0BvuGk5E2Sc0E1KgZAdf2ajHbdyZO89R7IUE4bUc+Q3/xSCo0hwmFpl0qP7kn3J9RDpwdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758902253; c=relaxed/simple;
	bh=jLg0CxONFqY+BNsI+qmg26F4Al8WZFtfoIRWaZmR9zk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ct3o14JSVWp3NufGpUMzJUwxQB+oVjXwiAgo9Jv7YPw3XflPr83aITxid94QkBF8xeF+Jx3WTIhmj5nSSmrePQQMmO09SU4R0Tu9HXGZQ9nq7yaNpP42DDoE0K+XKaJNta5ely4WGaD73OijAULtixzii4NseG8mtn6vsTDUZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANBkJak1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758902252; x=1790438252;
  h=date:from:to:cc:subject:message-id;
  bh=jLg0CxONFqY+BNsI+qmg26F4Al8WZFtfoIRWaZmR9zk=;
  b=ANBkJak1TCxSe77y4M86K1IX0miTWHIzGrZX/R2Q8kPHeUMB5F7uPcJx
   sVAXL+EdqPRn88rwalxvPCpB5gBjMzUuDO9bicOGj4it//07vdjLm1w2t
   O+9AtgrLd0WQeM/UyMHBiIiM7r/oTqWGbo+oMVNZnlD7qUWu67iFruZnB
   reLEFRy08Ge2nJLYay18MBWLmEjIebdxr+HBJXMKi3TD9zVOMB69D3A0P
   ggzVgmjm0JvkZyriQyJ8e1MMwrgswoS4p8FoQmZDKGbSJHqhsRDZNJ3Jg
   uHZ2KNvlAmewOcCz3VRCNY15m69d+5qlMErfTX6HCacI7PpGHKo5ZeWN/
   g==;
X-CSE-ConnectionGUID: vmRD8NPPSwCcpTDnosxS8Q==
X-CSE-MsgGUID: 9kL5paLhSKu95J+Ww3pxGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61289008"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61289008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 08:57:32 -0700
X-CSE-ConnectionGUID: e1cbQ2PsQwutjeuXdzTs6A==
X-CSE-MsgGUID: H9HKebYbQum6Dd7o2kI2HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="181946682"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Sep 2025 08:57:30 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Ap5-0006O3-1M;
	Fri, 26 Sep 2025 15:57:27 +0000
Date: Fri, 26 Sep 2025 23:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 1e11552ee54d10c0b602c76b94db602e2581ce57
Message-ID: <202509262338.VeEAkbju-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 1e11552ee54d10c0b602c76b94db602e2581ce57  hwmon: (mlxreg-fan) Add support for new flavour of capability register

elapsed time: 1427m

configs tested: 222
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                         bcm2835_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          pxa168_defconfig    gcc-15.1.0
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-001-20250926    gcc-8.5.0
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-002-20250926    gcc-8.5.0
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-003-20250926    gcc-8.5.0
arm                   randconfig-004-20250926    clang-22
arm                   randconfig-004-20250926    gcc-8.5.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-002-20250926    gcc-8.5.0
arm64                 randconfig-003-20250926    gcc-8.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-004-20250926    clang-22
arm64                 randconfig-004-20250926    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250926    clang-22
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-002-20250926    clang-22
csky                  randconfig-002-20250926    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-002-20250926    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250926    clang-20
i386                  randconfig-002-20250926    clang-20
i386                  randconfig-003-20250926    clang-20
i386                  randconfig-004-20250926    clang-20
i386                  randconfig-005-20250926    clang-20
i386                  randconfig-006-20250926    clang-20
i386                  randconfig-007-20250926    clang-20
i386                  randconfig-011-20250926    gcc-12
i386                  randconfig-012-20250926    gcc-12
i386                  randconfig-013-20250926    gcc-12
i386                  randconfig-014-20250926    gcc-12
i386                  randconfig-015-20250926    gcc-12
i386                  randconfig-016-20250926    gcc-12
i386                  randconfig-017-20250926    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250926    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-002-20250926    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250926    clang-22
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-002-20250926    clang-22
nios2                 randconfig-002-20250926    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250926    clang-22
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-002-20250926    clang-22
parisc                randconfig-002-20250926    gcc-10.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      pasemi_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-002-20250926    clang-22
powerpc               randconfig-003-20250926    clang-22
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-002-20250926    clang-22
powerpc64             randconfig-003-20250926    clang-22
powerpc64             randconfig-003-20250926    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-001-20250926    gcc-15.1.0
riscv                 randconfig-002-20250926    clang-22
riscv                 randconfig-002-20250926    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-001-20250926    gcc-15.1.0
s390                  randconfig-002-20250926    gcc-15.1.0
s390                  randconfig-002-20250926    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-001-20250926    gcc-15.1.0
sh                    randconfig-002-20250926    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-001-20250926    gcc-15.1.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-001-20250926    gcc-15.1.0
sparc64               randconfig-002-20250926    clang-22
sparc64               randconfig-002-20250926    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-001-20250926    gcc-15.1.0
um                    randconfig-002-20250926    clang-22
um                    randconfig-002-20250926    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-001-20250926    gcc-14
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-002-20250926    gcc-14
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250926    gcc-14
x86_64                randconfig-002-20250926    gcc-14
x86_64                randconfig-003-20250926    gcc-14
x86_64                randconfig-004-20250926    gcc-14
x86_64                randconfig-005-20250926    gcc-14
x86_64                randconfig-006-20250926    gcc-14
x86_64                randconfig-007-20250926    gcc-14
x86_64                randconfig-008-20250926    gcc-14
x86_64                randconfig-071-20250926    gcc-14
x86_64                randconfig-072-20250926    gcc-14
x86_64                randconfig-073-20250926    gcc-14
x86_64                randconfig-074-20250926    gcc-14
x86_64                randconfig-075-20250926    gcc-14
x86_64                randconfig-076-20250926    gcc-14
x86_64                randconfig-077-20250926    gcc-14
x86_64                randconfig-078-20250926    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-001-20250926    gcc-15.1.0
xtensa                randconfig-002-20250926    gcc-15.1.0
xtensa                randconfig-002-20250926    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

