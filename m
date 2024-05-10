Return-Path: <linux-hwmon+bounces-2112-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 568FB8C2832
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 May 2024 17:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C911C204FB
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 May 2024 15:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755D1171E48;
	Fri, 10 May 2024 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBDzAwzq"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03716191A
	for <linux-hwmon@vger.kernel.org>; Fri, 10 May 2024 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356281; cv=none; b=KAUrhR81NyVbUco8ttxV4CtCfM/pGoT3zcStHjQP75xiZFdegM5gAXPn1x7MvU07WMbVQBF8MXOvFG3EkTxnPt2trHYuLGdpMFsLAcUdlZvzuUdlViayAPHOUb2tHOX4ZIqSACnMTgLTs8HlkjvZLlz+Ep9VSgAC/6VV/4+bxQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356281; c=relaxed/simple;
	bh=z1SGoKWkXyL4/ot8v6U5bglYrrTV++ATHqrvEFW6SqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OltKdS0cY+S6qmLGX/ctWw5kzOptKLAgvZvKH+Bo+ZRPTYR7srUt1rRqgb+FTHwd3LlZu8xz1VxT4BPgDBr9r/Fed+Y5x+MVR5nTyR0e7gkNrn2Twu4w5kFIwnGPnGtjaEGjqgjXmb3HGdmhf1sJ4Wqvv4bTLA0rcgl0c/mRFtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBDzAwzq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715356280; x=1746892280;
  h=date:from:to:cc:subject:message-id;
  bh=z1SGoKWkXyL4/ot8v6U5bglYrrTV++ATHqrvEFW6SqM=;
  b=CBDzAwzqsZzcoKpY6AgDCsqgnJA6dB+O5ysnMh/Q7lpsY/MnY2ks8azN
   FMNS21min1RavMaVVKP96rNqeDZMBS9vMVJeJDtEhvNdSy5e/2bLjhwpD
   NTxFnQwNfiEtDdA4BzQd+GOIpDBmzngGi7Tiuv7VcC0gLNomr42x5Mo48
   KmdO3WPNt9O590F5IDdzAmflZXwYdGBWsFA3s63zzzlX/UJ4Y4yGwq3Rn
   WrwA7QqyKMDXnWC4POpuOBea/GFK/KTo1F7nn7JRvxRL1tgQM7xiJrBR8
   tncGcF/twdXAKQBznaKsk5bS6Zm4IzbMrSPK3LrxB9o3+f7JGQC1wY1RK
   w==;
X-CSE-ConnectionGUID: pSnO+D0xSDeKYgHPU3N1/A==
X-CSE-MsgGUID: bnaAasTqSxSCwTi2K8WWEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11470943"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11470943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:51:20 -0700
X-CSE-ConnectionGUID: baI6WfSrQJGJhsM2wbj+Ng==
X-CSE-MsgGUID: IAg35MkiS+mEkUrbtj8O/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="67132066"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2024 08:51:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5SWh-0006IX-2Z;
	Fri, 10 May 2024 15:51:15 +0000
Date: Fri, 10 May 2024 23:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 26e8383b116d0dbe74e28f86646563ab46d66d83
Message-ID: <202405102323.dXLvSiQn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 26e8383b116d0dbe74e28f86646563ab46d66d83  hwmon: (pmbus/ucd9000) Increase delay from 250 to 500us

elapsed time: 1384m

configs tested: 148
configs skipped: 3

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
arc                   randconfig-001-20240510   gcc  
arc                   randconfig-002-20240510   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240510   gcc  
arm                   randconfig-002-20240510   clang
arm                   randconfig-003-20240510   gcc  
arm                   randconfig-004-20240510   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240510   clang
arm64                 randconfig-002-20240510   gcc  
arm64                 randconfig-003-20240510   clang
arm64                 randconfig-004-20240510   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240510   gcc  
csky                  randconfig-002-20240510   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240510   clang
hexagon               randconfig-002-20240510   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240510   clang
i386         buildonly-randconfig-002-20240510   gcc  
i386         buildonly-randconfig-003-20240510   clang
i386         buildonly-randconfig-004-20240510   clang
i386         buildonly-randconfig-005-20240510   clang
i386         buildonly-randconfig-006-20240510   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240510   clang
i386                  randconfig-002-20240510   clang
i386                  randconfig-003-20240510   gcc  
i386                  randconfig-004-20240510   gcc  
i386                  randconfig-005-20240510   clang
i386                  randconfig-006-20240510   clang
i386                  randconfig-011-20240510   clang
i386                  randconfig-012-20240510   clang
i386                  randconfig-013-20240510   gcc  
i386                  randconfig-014-20240510   clang
i386                  randconfig-015-20240510   gcc  
i386                  randconfig-016-20240510   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240510   gcc  
loongarch             randconfig-002-20240510   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240510   gcc  
nios2                 randconfig-002-20240510   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240510   gcc  
parisc                randconfig-002-20240510   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240510   gcc  
powerpc               randconfig-002-20240510   gcc  
powerpc               randconfig-003-20240510   clang
powerpc64             randconfig-001-20240510   clang
powerpc64             randconfig-002-20240510   clang
powerpc64             randconfig-003-20240510   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240510   clang
riscv                 randconfig-002-20240510   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240510   gcc  
s390                  randconfig-002-20240510   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240510   gcc  
sh                    randconfig-002-20240510   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240510   gcc  
sparc64               randconfig-002-20240510   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240510   gcc  
um                    randconfig-002-20240510   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240510   gcc  
x86_64       buildonly-randconfig-003-20240510   gcc  
x86_64       buildonly-randconfig-004-20240510   clang
x86_64       buildonly-randconfig-005-20240510   gcc  
x86_64       buildonly-randconfig-006-20240510   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240510   gcc  
x86_64                randconfig-002-20240510   clang
x86_64                randconfig-003-20240510   clang
x86_64                randconfig-004-20240510   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240510   gcc  
xtensa                randconfig-002-20240510   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

