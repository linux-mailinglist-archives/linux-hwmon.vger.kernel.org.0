Return-Path: <linux-hwmon+bounces-1604-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F79894A2D
	for <lists+linux-hwmon@lfdr.de>; Tue,  2 Apr 2024 05:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 672F91C2234D
	for <lists+linux-hwmon@lfdr.de>; Tue,  2 Apr 2024 03:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE66156C2;
	Tue,  2 Apr 2024 03:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYPsAckR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80A1426F
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Apr 2024 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712029998; cv=none; b=S4y4kFd/mcPoJi+Cxy5hRzh/ngm/p+LPQpMscF1g5wE/AnQYdEZRuhuwiZpfylhjgAkWFehpKkRdOIPTvaPUd8q+iSSn/ehZVv7ZDVkwlT2RM4xQQyieABMQ6hXu8tfW8icjDPdsOH79skNSezmklYN2fqqcswXq2JxuQf4CmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712029998; c=relaxed/simple;
	bh=OB+6mf5y6puFbgHK1GjwxFAnPgr9RnGQDg11Wg1/fzk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GgucF+S+H7U3Xb9iUm863n0U4Iis0M7JZEzzqowLedDQkELHSKLA1yJ1FPLQNOzatAC9gZFcz+uVn6bFF/4Fgu+rrs5ffCKTGLChuGXXm0C2ygelw3N72Ch+FuKjNNaoVxkPFDodM34lxRDnpz4EZ8UVGyoemLMeOm0/hpyDI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYPsAckR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712029997; x=1743565997;
  h=date:from:to:cc:subject:message-id;
  bh=OB+6mf5y6puFbgHK1GjwxFAnPgr9RnGQDg11Wg1/fzk=;
  b=nYPsAckR9l8tcWsmuBpK0c20JOy7lD4kLOkOTBpriOG54P8Bq75qFNKD
   hn8q8vHenSbAEi4ZYHJIBRbjIBqnbLbYUvgW0lEgO1OX5eAvSX2Uh4AO4
   1VRLGSwXNqPLXAJ37t9ClRxABAyk89uMMhCoaT1onEk3CLpVzmhEKgoib
   1WQUECUTJSi/fujWZbTE2oME3dtQLy67XHdZzJmqxWp3ZLo4HXCU8LMVU
   p/O/momI4GDv6BkymNXL1/kXW/hkwZ/dnHjzJqWmrkGub6VCmZicKCqEW
   +8CmATkVQM8wkMnQmUvPQyj/yASIFS3cpbTY5GCKvhOJuAK+B9PunxkLY
   A==;
X-CSE-ConnectionGUID: N8ju3hdoQHq0LNHeF7Dh4g==
X-CSE-MsgGUID: C9e3UwV6Q4SjwLIQWmbJhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7045388"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7045388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 20:53:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="49138109"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2024 20:53:15 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrVCy-0000qk-2u;
	Tue, 02 Apr 2024 03:53:12 +0000
Date: Tue, 02 Apr 2024 11:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 0575ba3c0315984ae84538e0539f6be591e0f771
Message-ID: <202404021108.30pT33lf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 0575ba3c0315984ae84538e0539f6be591e0f771  Merge branch 'kunit-v3' into testing

elapsed time: 721m

configs tested: 182
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
arc                   randconfig-001-20240402   gcc  
arc                   randconfig-002-20240402   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240402   gcc  
arm                   randconfig-002-20240402   clang
arm                   randconfig-003-20240402   clang
arm                   randconfig-004-20240402   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240402   clang
arm64                 randconfig-002-20240402   clang
arm64                 randconfig-003-20240402   clang
arm64                 randconfig-004-20240402   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240402   gcc  
csky                  randconfig-002-20240402   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240402   clang
hexagon               randconfig-002-20240402   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240402   gcc  
i386         buildonly-randconfig-002-20240402   gcc  
i386         buildonly-randconfig-003-20240402   clang
i386         buildonly-randconfig-004-20240402   clang
i386         buildonly-randconfig-005-20240402   clang
i386         buildonly-randconfig-006-20240402   clang
i386                                defconfig   clang
i386                  randconfig-001-20240402   gcc  
i386                  randconfig-002-20240402   clang
i386                  randconfig-003-20240402   clang
i386                  randconfig-004-20240402   clang
i386                  randconfig-005-20240402   clang
i386                  randconfig-006-20240402   clang
i386                  randconfig-011-20240402   gcc  
i386                  randconfig-012-20240402   clang
i386                  randconfig-013-20240402   clang
i386                  randconfig-014-20240402   clang
i386                  randconfig-015-20240402   gcc  
i386                  randconfig-016-20240402   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240402   gcc  
loongarch             randconfig-002-20240402   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240402   gcc  
nios2                 randconfig-002-20240402   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240402   gcc  
parisc                randconfig-002-20240402   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      chrp32_defconfig   clang
powerpc                       maple_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc               randconfig-001-20240402   clang
powerpc               randconfig-002-20240402   gcc  
powerpc               randconfig-003-20240402   clang
powerpc                    sam440ep_defconfig   gcc  
powerpc                     sequoia_defconfig   clang
powerpc64             randconfig-001-20240402   gcc  
powerpc64             randconfig-002-20240402   gcc  
powerpc64             randconfig-003-20240402   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240402   clang
riscv                 randconfig-002-20240402   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240402   gcc  
s390                  randconfig-002-20240402   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                    randconfig-001-20240402   gcc  
sh                    randconfig-002-20240402   gcc  
sh                           se7206_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240402   gcc  
sparc64               randconfig-002-20240402   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240402   gcc  
um                    randconfig-002-20240402   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240402   clang
x86_64       buildonly-randconfig-002-20240402   clang
x86_64       buildonly-randconfig-003-20240402   clang
x86_64       buildonly-randconfig-004-20240402   clang
x86_64       buildonly-randconfig-005-20240402   clang
x86_64       buildonly-randconfig-006-20240402   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240402   clang
x86_64                randconfig-002-20240402   clang
x86_64                randconfig-003-20240402   gcc  
x86_64                randconfig-004-20240402   clang
x86_64                randconfig-005-20240402   gcc  
x86_64                randconfig-006-20240402   gcc  
x86_64                randconfig-011-20240402   gcc  
x86_64                randconfig-012-20240402   gcc  
x86_64                randconfig-013-20240402   clang
x86_64                randconfig-014-20240402   gcc  
x86_64                randconfig-015-20240402   clang
x86_64                randconfig-016-20240402   gcc  
x86_64                randconfig-071-20240402   clang
x86_64                randconfig-072-20240402   clang
x86_64                randconfig-073-20240402   clang
x86_64                randconfig-074-20240402   gcc  
x86_64                randconfig-075-20240402   clang
x86_64                randconfig-076-20240402   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240402   gcc  
xtensa                randconfig-002-20240402   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

