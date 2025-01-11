Return-Path: <linux-hwmon+bounces-6036-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAEAA0A065
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jan 2025 03:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FEF816B87F
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jan 2025 02:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F2913CFA6;
	Sat, 11 Jan 2025 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNDChSKf"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563940C03
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jan 2025 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736563242; cv=none; b=UHzEEDzydT751yurl5S9nJzw1XBIHbf7VReI8iSUsSuLu4l4dhkDV6W3pHUWWNj2weSvu3dWwv0y+2Yo1NUBWffdWwmTzVS70PrkXwlQwju0Aa3JpY6702R9jSpSYRc8DTFZA+Jjf7cD4sq0n6njwk4tozgVouBnH6QBbgqNCIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736563242; c=relaxed/simple;
	bh=5ol/Jlmq/tzTRDcuw2nJS6OOjWMNn+SGeK5woz05GW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RDo0KB/E1cQ6pTm9BSODs9d6mBGsr/YEJFj4IQlQ3X5Dn7xGsTO7EfLJncmaJ5lJ5MdgQQHHo/ZwDbGVFrhxe9+W/uxA4kHwDlzsOBdXgRtNEZlB0dzURdvc1kEALXXmXgR2z5DTCcyoNl5XrfnUeC6uQqcFmzKhnCUwKRrJjF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNDChSKf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736563240; x=1768099240;
  h=date:from:to:cc:subject:message-id;
  bh=5ol/Jlmq/tzTRDcuw2nJS6OOjWMNn+SGeK5woz05GW4=;
  b=XNDChSKfTGrK0ncICQON+k/ZfA4Q+O/K3XRH5Wilk2LKaO5fCT4kFEi8
   dbNZLYp8zyT9Cst0nqWpk8KZ5vjzMhurgMTVak2GsX30z4q8xH9LJu4fK
   0b29Vk6w3vYfAuYp4yyt7C/x5X1nyGX9pXDnRAG0ZQ7dgRIa0Y4TrIzXl
   4JLB9FZNc3XH9kU+LcZr6DVd5CpMlrYxs1Q84N1AnE17V8LsS9dlijWW1
   8WOFwQK6pZ2VDr8kBB2jPWyzCB09DcmCuSPGVM5N/fgTvsaKxlZ/ju+y0
   F+6b7oaIf8gPftnhSrD9nIOpfb7pFuoytLbgQnsNw2Da/48a6GaTnwE7f
   Q==;
X-CSE-ConnectionGUID: blKtb5zqT/mFakaDsIFdvQ==
X-CSE-MsgGUID: eweDxAYCSVSFVdSHvafQkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40550042"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="40550042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 18:40:40 -0800
X-CSE-ConnectionGUID: SHUCd6t6SjaFevDatUGMVw==
X-CSE-MsgGUID: IiTX4fDTQcql8jTCEGZ1dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="108903287"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 18:40:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWRQR-000K3h-2Z;
	Sat, 11 Jan 2025 02:40:35 +0000
Date: Sat, 11 Jan 2025 10:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 139c3e32b53bdb1ee06f2f67adeccbcb4ad9288c
Message-ID: <202501111040.4O2IW9c8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 139c3e32b53bdb1ee06f2f67adeccbcb4ad9288c  hwmon: pmbus: dps920ab: Add ability to instantiate through i2c

elapsed time: 1488m

configs tested: 234
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250110    gcc-13.2.0
arc                   randconfig-001-20250111    clang-18
arc                   randconfig-002-20250110    gcc-13.2.0
arc                   randconfig-002-20250111    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20250110    clang-20
arm                   randconfig-001-20250111    clang-18
arm                   randconfig-002-20250110    gcc-14.2.0
arm                   randconfig-002-20250111    clang-18
arm                   randconfig-003-20250110    clang-19
arm                   randconfig-003-20250111    clang-18
arm                   randconfig-004-20250110    gcc-14.2.0
arm                   randconfig-004-20250111    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250110    gcc-14.2.0
arm64                 randconfig-001-20250111    clang-18
arm64                 randconfig-002-20250110    gcc-14.2.0
arm64                 randconfig-002-20250111    clang-18
arm64                 randconfig-003-20250110    clang-17
arm64                 randconfig-003-20250111    clang-18
arm64                 randconfig-004-20250110    gcc-14.2.0
arm64                 randconfig-004-20250111    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250110    gcc-14.2.0
csky                  randconfig-001-20250111    gcc-14.2.0
csky                  randconfig-002-20250110    gcc-14.2.0
csky                  randconfig-002-20250111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250110    clang-20
hexagon               randconfig-001-20250111    gcc-14.2.0
hexagon               randconfig-002-20250110    clang-20
hexagon               randconfig-002-20250111    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250110    clang-19
i386        buildonly-randconfig-001-20250111    gcc-11
i386        buildonly-randconfig-002-20250110    clang-19
i386        buildonly-randconfig-002-20250111    gcc-11
i386        buildonly-randconfig-003-20250110    clang-19
i386        buildonly-randconfig-003-20250111    gcc-11
i386        buildonly-randconfig-004-20250110    gcc-12
i386        buildonly-randconfig-004-20250111    gcc-11
i386        buildonly-randconfig-005-20250110    gcc-12
i386        buildonly-randconfig-005-20250111    gcc-11
i386        buildonly-randconfig-006-20250110    clang-19
i386        buildonly-randconfig-006-20250111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20250111    clang-19
i386                  randconfig-002-20250111    clang-19
i386                  randconfig-003-20250111    clang-19
i386                  randconfig-004-20250111    clang-19
i386                  randconfig-005-20250111    clang-19
i386                  randconfig-006-20250111    clang-19
i386                  randconfig-007-20250111    clang-19
i386                  randconfig-011-20250111    clang-19
i386                  randconfig-012-20250111    clang-19
i386                  randconfig-013-20250111    clang-19
i386                  randconfig-014-20250111    clang-19
i386                  randconfig-015-20250111    clang-19
i386                  randconfig-016-20250111    clang-19
i386                  randconfig-017-20250111    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250110    gcc-14.2.0
loongarch             randconfig-001-20250111    gcc-14.2.0
loongarch             randconfig-002-20250110    gcc-14.2.0
loongarch             randconfig-002-20250111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                        vocore2_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250110    gcc-14.2.0
nios2                 randconfig-001-20250111    gcc-14.2.0
nios2                 randconfig-002-20250110    gcc-14.2.0
nios2                 randconfig-002-20250111    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250110    gcc-14.2.0
parisc                randconfig-001-20250111    gcc-14.2.0
parisc                randconfig-002-20250110    gcc-14.2.0
parisc                randconfig-002-20250111    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20250110    clang-20
powerpc               randconfig-001-20250111    gcc-14.2.0
powerpc               randconfig-002-20250110    clang-20
powerpc               randconfig-002-20250111    gcc-14.2.0
powerpc               randconfig-003-20250110    clang-20
powerpc               randconfig-003-20250111    gcc-14.2.0
powerpc64             randconfig-001-20250110    clang-17
powerpc64             randconfig-001-20250111    gcc-14.2.0
powerpc64             randconfig-002-20250110    clang-19
powerpc64             randconfig-002-20250111    gcc-14.2.0
powerpc64             randconfig-003-20250110    clang-17
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250110    clang-17
riscv                 randconfig-001-20250111    gcc-14.2.0
riscv                 randconfig-002-20250110    clang-20
riscv                 randconfig-002-20250111    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250110    gcc-14.2.0
s390                  randconfig-001-20250111    gcc-14.2.0
s390                  randconfig-002-20250110    gcc-14.2.0
s390                  randconfig-002-20250111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20250110    gcc-14.2.0
sh                    randconfig-001-20250111    gcc-14.2.0
sh                    randconfig-002-20250110    gcc-14.2.0
sh                    randconfig-002-20250111    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                          rsk7203_defconfig    clang-20
sh                           sh2007_defconfig    clang-20
sh                        sh7763rdp_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250110    gcc-14.2.0
sparc                 randconfig-001-20250111    gcc-14.2.0
sparc                 randconfig-002-20250110    gcc-14.2.0
sparc                 randconfig-002-20250111    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250110    gcc-14.2.0
sparc64               randconfig-001-20250111    gcc-14.2.0
sparc64               randconfig-002-20250110    gcc-14.2.0
sparc64               randconfig-002-20250111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250110    clang-20
um                    randconfig-001-20250111    gcc-14.2.0
um                    randconfig-002-20250110    gcc-12
um                    randconfig-002-20250111    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250110    gcc-12
x86_64      buildonly-randconfig-001-20250111    clang-19
x86_64      buildonly-randconfig-002-20250110    clang-19
x86_64      buildonly-randconfig-002-20250111    clang-19
x86_64      buildonly-randconfig-003-20250110    clang-19
x86_64      buildonly-randconfig-003-20250111    clang-19
x86_64      buildonly-randconfig-004-20250110    gcc-12
x86_64      buildonly-randconfig-004-20250111    clang-19
x86_64      buildonly-randconfig-005-20250110    clang-19
x86_64      buildonly-randconfig-005-20250111    clang-19
x86_64      buildonly-randconfig-006-20250110    clang-19
x86_64      buildonly-randconfig-006-20250111    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250111    clang-19
x86_64                randconfig-002-20250111    clang-19
x86_64                randconfig-003-20250111    clang-19
x86_64                randconfig-004-20250111    clang-19
x86_64                randconfig-005-20250111    clang-19
x86_64                randconfig-006-20250111    clang-19
x86_64                randconfig-007-20250111    clang-19
x86_64                randconfig-008-20250111    clang-19
x86_64                randconfig-071-20250111    gcc-12
x86_64                randconfig-072-20250111    gcc-12
x86_64                randconfig-073-20250111    gcc-12
x86_64                randconfig-074-20250111    gcc-12
x86_64                randconfig-075-20250111    gcc-12
x86_64                randconfig-076-20250111    gcc-12
x86_64                randconfig-077-20250111    gcc-12
x86_64                randconfig-078-20250111    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250110    gcc-14.2.0
xtensa                randconfig-001-20250111    gcc-14.2.0
xtensa                randconfig-002-20250110    gcc-14.2.0
xtensa                randconfig-002-20250111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

