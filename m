Return-Path: <linux-hwmon+bounces-9926-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75263BD27E2
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Oct 2025 12:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D61F188F11D
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Oct 2025 10:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36891F4703;
	Mon, 13 Oct 2025 10:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZERVx38+"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA41946AA
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Oct 2025 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350520; cv=none; b=f8cCKo3K+QyAVgYZA/xZztpaL3jQN6OXJQYB+m70vJdoe+qm6MtB0iahUEVqzx4E1lTjuvnPQEzzXzuDa82YWksIU0pzoJLKQvE/vNHC4x2AWjICETpvFWMNFfVuen5p4asBjc/gXlkqIYZwjULT9hmfw1zt28M2jlzOr6papss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350520; c=relaxed/simple;
	bh=FShkKZvT1ziucIak4PTv9n8zfLQh4y07FK5RRU4VITA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A273lB3CZgFKghL5F+9Wy+aaPt2/2klBo/m/0BSp9N2PUREzZl+9yp3FR2/NnaB4goQMdAVJrKzTyEEvOSX/Zy2JXv3ltpdpR8Q+cb2k0kep7RdqoXykgno3HVS0z1VXUJEZDb8c89oXGa5ZSRp3g42ozZ0IED/3P8aP2LSvPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZERVx38+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760350519; x=1791886519;
  h=date:from:to:cc:subject:message-id;
  bh=FShkKZvT1ziucIak4PTv9n8zfLQh4y07FK5RRU4VITA=;
  b=ZERVx38+qV32rF2CIxDjAc/GnZKDPAGS1pDq7BO3ZIEb1bOfg4KZcydQ
   AkLgWnT0Jc2TvFB+JYPJ21ctkB2gV4vh5boc+U4mLqPIg0pquRVeNdnmN
   uAwl7K46iNrJiCOXs6aqAeBIvulPJssKRrBw5Yui2fwS+ryCGplirwRNN
   AdYYvSUi8sJOhE7qnPfStWgE3bEpf/N7qNfeRK5rYMPjeOD2SkJ1BYyN7
   LovZhRuTf8CGFbAoN8PaJwnO5uHc1VMjHPGaZkZY0OaDTm4VaDwCvwuq8
   2HzerdkAZbixPvtXFnSjdKFitnoQmHt42M5nmpjG7q8OSW+Fpkfu3zyO4
   g==;
X-CSE-ConnectionGUID: ZOfKr40IRwODQ1vNMyzkAg==
X-CSE-MsgGUID: OM6HnHnoS+WHBIP5BCnV1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87944788"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="87944788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 03:15:19 -0700
X-CSE-ConnectionGUID: GhtcNWmjQneosXLzgti9pA==
X-CSE-MsgGUID: j73IqVLrRMismhEx0RcNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="205247021"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 03:15:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Fa6-0000Lm-2a;
	Mon, 13 Oct 2025 10:15:10 +0000
Date: Mon, 13 Oct 2025 18:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2a364c163c1fa9fe62c2f06e84fb7d2f995e461f
Message-ID: <202510131837.EzEw6fuE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2a364c163c1fa9fe62c2f06e84fb7d2f995e461f  hwmon: (peci/cputemp) add Intel Emerald Rapids support

elapsed time: 724m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251013    gcc-8.5.0
arc                   randconfig-002-20251013    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                           imxrt_defconfig    clang-22
arm                   randconfig-001-20251013    gcc-10.5.0
arm                   randconfig-002-20251013    clang-22
arm                   randconfig-003-20251013    gcc-12.5.0
arm                   randconfig-004-20251013    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251013    clang-19
arm64                 randconfig-002-20251013    gcc-8.5.0
arm64                 randconfig-003-20251013    clang-22
arm64                 randconfig-004-20251013    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251013    gcc-15.1.0
csky                  randconfig-002-20251013    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251013    clang-22
hexagon               randconfig-002-20251013    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251013    gcc-13
i386        buildonly-randconfig-002-20251013    clang-20
i386        buildonly-randconfig-003-20251013    gcc-14
i386        buildonly-randconfig-004-20251013    clang-20
i386        buildonly-randconfig-005-20251013    gcc-14
i386        buildonly-randconfig-006-20251013    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251013    clang-18
loongarch             randconfig-002-20251013    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           mtx1_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251013    gcc-8.5.0
nios2                 randconfig-002-20251013    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251013    gcc-12.5.0
parisc                randconfig-002-20251013    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251013    clang-22
powerpc               randconfig-002-20251013    clang-18
powerpc               randconfig-003-20251013    clang-22
powerpc64             randconfig-001-20251013    gcc-10.5.0
powerpc64             randconfig-002-20251013    gcc-15.1.0
powerpc64             randconfig-003-20251013    clang-20
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251013    clang-22
riscv                 randconfig-002-20251013    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251013    gcc-8.5.0
s390                  randconfig-002-20251013    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20251013    gcc-10.5.0
sh                    randconfig-002-20251013    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251013    gcc-8.5.0
sparc                 randconfig-002-20251013    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251013    clang-20
sparc64               randconfig-002-20251013    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251013    gcc-14
um                    randconfig-002-20251013    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251013    gcc-13
x86_64      buildonly-randconfig-002-20251013    clang-20
x86_64      buildonly-randconfig-003-20251013    clang-20
x86_64      buildonly-randconfig-004-20251013    gcc-14
x86_64      buildonly-randconfig-005-20251013    clang-20
x86_64      buildonly-randconfig-006-20251013    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251013    gcc-11.5.0
xtensa                randconfig-002-20251013    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

