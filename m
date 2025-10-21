Return-Path: <linux-hwmon+bounces-10099-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14904BF4A17
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Oct 2025 07:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7E824E1188
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Oct 2025 05:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0E524168D;
	Tue, 21 Oct 2025 05:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fe+VzBCn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C1199FB0
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 05:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761024024; cv=none; b=Zj7bSzE1xn+yT89paTSjloV2cKEfUAbPBKYC9P/MYgf1+juCgSzPWk3Nl48ZtUP9o2BF3NA6qAeb74DdMUFOoHVuHlGkuCEr/tRfO27wv23+ZIaYICIsvZMF5O7RQ653SP91ZkgYN/u/W18JLQJxuzrZErCD9N8xywF/mOQNFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761024024; c=relaxed/simple;
	bh=OD+1+o6DeUnM3tPv65ZN9sFzwENKkbEa+AYmHvH2pgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oGk93QElbtrg81lfJCFjff87cYCiM9/pq+s6f3ogBI28VFPX9dAz6Csze/bwJSDQCe3JMFAkhzfKfLgzaea04u7bPeQiZC4CXS89xpfYEfKfmRh+NUGL54BzI7Yz4tU50PzU7afICcbrepWH81bSW1pR9Bt8vTAwjFDyAbi1mmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fe+VzBCn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761024022; x=1792560022;
  h=date:from:to:cc:subject:message-id;
  bh=OD+1+o6DeUnM3tPv65ZN9sFzwENKkbEa+AYmHvH2pgU=;
  b=fe+VzBCnDuEms8y9rTaCCmVfnrTj4mSbFsrmjJzL2t+P7vkRYANtrvaX
   b7o9p5+CX2O8PfILHOKnlQvdBNZyMPxunHwp0afqyWMpztiwcU2k0ScnW
   orSqraa6Z3DuqNfy5jkaUzTSVFnJNK863gxI5IqdxB5JNEDhjcjqS11bW
   i0POlwl5sb+aQVI8o7YFgVwSt3nPIYqlDDVkMPoDVrucXsSYKTAuxMYK4
   OI77d8/u7DwSuwRGB2ORHTJA+xBElrWLJbVjunDeGrS7UXN+huxKOwRvw
   3M4Nk7LNeXudWb7F/nXz2qaOIT917JujmlljD3o0GnxPp7dGd+27owQLE
   Q==;
X-CSE-ConnectionGUID: Jy+BAkBaQgO/zCWP0mGaaw==
X-CSE-MsgGUID: hpDSaRPJRNiJXoRLpFzx3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62176081"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="62176081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 22:20:21 -0700
X-CSE-ConnectionGUID: GoISn2YzTLGWQGX1LvbRiA==
X-CSE-MsgGUID: V5GjjoV/TEufkrZKNBZOvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="187768903"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2025 22:20:20 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB4nC-000AVN-09;
	Tue, 21 Oct 2025 05:20:18 +0000
Date: Tue, 21 Oct 2025 13:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 7b6ac49004ce16ac5753e7770b97209da2e5cff9
Message-ID: <202510211302.FLeqICbY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 7b6ac49004ce16ac5753e7770b97209da2e5cff9  Merge branch 'fixes-v6.18' into testing

elapsed time: 883m

configs tested: 242
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251020    gcc-14.3.0
arc                   randconfig-001-20251021    clang-22
arc                   randconfig-002-20251020    gcc-8.5.0
arc                   randconfig-002-20251021    clang-22
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                           imxrt_defconfig    gcc-15.1.0
arm                   randconfig-001-20251020    gcc-14.3.0
arm                   randconfig-001-20251021    clang-22
arm                   randconfig-002-20251020    clang-22
arm                   randconfig-002-20251021    clang-22
arm                   randconfig-003-20251020    clang-22
arm                   randconfig-003-20251021    clang-22
arm                   randconfig-004-20251020    clang-22
arm                   randconfig-004-20251021    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251020    clang-22
arm64                 randconfig-001-20251021    clang-22
arm64                 randconfig-002-20251020    gcc-12.5.0
arm64                 randconfig-002-20251021    clang-22
arm64                 randconfig-003-20251020    gcc-8.5.0
arm64                 randconfig-003-20251021    clang-22
arm64                 randconfig-004-20251020    gcc-10.5.0
arm64                 randconfig-004-20251021    clang-22
csky                              allnoconfig    clang-22
csky                                defconfig    clang-19
csky                  randconfig-001-20251020    gcc-15.1.0
csky                  randconfig-001-20251021    gcc-8.5.0
csky                  randconfig-002-20251020    gcc-15.1.0
csky                  randconfig-002-20251021    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251020    clang-22
hexagon               randconfig-001-20251021    gcc-8.5.0
hexagon               randconfig-002-20251020    clang-22
hexagon               randconfig-002-20251021    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251020    gcc-14
i386        buildonly-randconfig-001-20251021    clang-20
i386        buildonly-randconfig-002-20251020    clang-20
i386        buildonly-randconfig-002-20251021    clang-20
i386        buildonly-randconfig-003-20251020    gcc-14
i386        buildonly-randconfig-003-20251021    clang-20
i386        buildonly-randconfig-004-20251020    gcc-14
i386        buildonly-randconfig-004-20251021    clang-20
i386        buildonly-randconfig-005-20251020    clang-20
i386        buildonly-randconfig-005-20251021    clang-20
i386        buildonly-randconfig-006-20251020    clang-20
i386        buildonly-randconfig-006-20251021    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251021    gcc-14
i386                  randconfig-002-20251021    gcc-14
i386                  randconfig-003-20251021    gcc-14
i386                  randconfig-004-20251021    gcc-14
i386                  randconfig-005-20251021    gcc-14
i386                  randconfig-006-20251021    gcc-14
i386                  randconfig-007-20251021    gcc-14
i386                  randconfig-011-20251021    clang-20
i386                  randconfig-012-20251021    clang-20
i386                  randconfig-013-20251021    clang-20
i386                  randconfig-014-20251021    clang-20
i386                  randconfig-015-20251021    clang-20
i386                  randconfig-016-20251021    clang-20
i386                  randconfig-017-20251021    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251020    gcc-15.1.0
loongarch             randconfig-001-20251021    gcc-8.5.0
loongarch             randconfig-002-20251020    gcc-15.1.0
loongarch             randconfig-002-20251021    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251020    gcc-10.5.0
nios2                 randconfig-001-20251021    gcc-8.5.0
nios2                 randconfig-002-20251020    gcc-8.5.0
nios2                 randconfig-002-20251021    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251020    gcc-13.4.0
parisc                randconfig-001-20251021    gcc-8.5.0
parisc                randconfig-002-20251020    gcc-10.5.0
parisc                randconfig-002-20251021    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                          allyesconfig    clang-22
powerpc                        cell_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251020    clang-22
powerpc               randconfig-001-20251021    gcc-8.5.0
powerpc               randconfig-002-20251020    gcc-8.5.0
powerpc               randconfig-002-20251021    gcc-8.5.0
powerpc               randconfig-003-20251020    clang-22
powerpc               randconfig-003-20251021    gcc-8.5.0
powerpc64             randconfig-001-20251020    clang-19
powerpc64             randconfig-001-20251021    gcc-8.5.0
powerpc64             randconfig-002-20251020    gcc-11.5.0
powerpc64             randconfig-002-20251021    gcc-8.5.0
powerpc64             randconfig-003-20251020    gcc-8.5.0
powerpc64             randconfig-003-20251021    gcc-8.5.0
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251020    gcc-13.4.0
riscv                 randconfig-001-20251021    gcc-8.5.0
riscv                 randconfig-002-20251020    clang-22
riscv                 randconfig-002-20251021    gcc-8.5.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251020    gcc-11.5.0
s390                  randconfig-001-20251021    gcc-8.5.0
s390                  randconfig-002-20251020    clang-22
s390                  randconfig-002-20251021    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251020    gcc-15.1.0
sh                    randconfig-001-20251021    gcc-8.5.0
sh                    randconfig-002-20251020    gcc-15.1.0
sh                    randconfig-002-20251021    gcc-8.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251020    gcc-8.5.0
sparc                 randconfig-001-20251021    gcc-8.5.0
sparc                 randconfig-002-20251020    gcc-8.5.0
sparc                 randconfig-002-20251021    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251020    gcc-10.5.0
sparc64               randconfig-001-20251021    gcc-8.5.0
sparc64               randconfig-002-20251020    clang-22
sparc64               randconfig-002-20251021    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251020    clang-22
um                    randconfig-001-20251021    gcc-8.5.0
um                    randconfig-002-20251020    clang-22
um                    randconfig-002-20251021    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251020    gcc-14
x86_64      buildonly-randconfig-001-20251021    clang-20
x86_64      buildonly-randconfig-002-20251020    clang-20
x86_64      buildonly-randconfig-002-20251021    clang-20
x86_64      buildonly-randconfig-003-20251020    gcc-14
x86_64      buildonly-randconfig-003-20251021    clang-20
x86_64      buildonly-randconfig-004-20251020    gcc-14
x86_64      buildonly-randconfig-004-20251021    clang-20
x86_64      buildonly-randconfig-005-20251020    gcc-14
x86_64      buildonly-randconfig-005-20251021    clang-20
x86_64      buildonly-randconfig-006-20251020    gcc-14
x86_64      buildonly-randconfig-006-20251021    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251021    gcc-14
x86_64                randconfig-002-20251021    gcc-14
x86_64                randconfig-003-20251021    gcc-14
x86_64                randconfig-004-20251021    gcc-14
x86_64                randconfig-005-20251021    gcc-14
x86_64                randconfig-006-20251021    gcc-14
x86_64                randconfig-007-20251021    gcc-14
x86_64                randconfig-008-20251021    gcc-14
x86_64                randconfig-071-20251021    gcc-14
x86_64                randconfig-072-20251021    gcc-14
x86_64                randconfig-073-20251021    gcc-14
x86_64                randconfig-074-20251021    gcc-14
x86_64                randconfig-075-20251021    gcc-14
x86_64                randconfig-076-20251021    gcc-14
x86_64                randconfig-077-20251021    gcc-14
x86_64                randconfig-078-20251021    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251020    gcc-8.5.0
xtensa                randconfig-001-20251021    gcc-8.5.0
xtensa                randconfig-002-20251020    gcc-8.5.0
xtensa                randconfig-002-20251021    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

