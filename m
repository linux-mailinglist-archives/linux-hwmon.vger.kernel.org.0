Return-Path: <linux-hwmon+bounces-1066-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F3852814
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Feb 2024 05:56:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E63A91C23179
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Feb 2024 04:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DA9111A8;
	Tue, 13 Feb 2024 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/gG4wu1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882C9479
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Feb 2024 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707800183; cv=none; b=huc11rHeJ8wuLm2SLnZSTK7d15PDEy7WcBGGW1O3qWBkYGPLbydXZofFdPcCghVP9gi5FN2durApOJsxBPyDzK5mjkGdbh22UYNTUymb/6zwQjznsb3cJPFidoApv82uN3cX6wUUuAij+hl3dccDnhagpd1PAA2rxepBMkJcIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707800183; c=relaxed/simple;
	bh=u94O8h9AlV7KzmGBypG6ZBBstxlnfHqe40itEux6PQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tpw2DxlwNqnfGQQghnPgk3uYue7Eqv9kUHGrGffOKSCaFSyS8hbp+18tpmWQUd1XHyPVGG7vI6zDmW0QUFL0KIKlabPFFeziEUWL0ODeiboYECk08tBJUgVYLKtFyiBUFQNc0GW+N4Wmydr1WQ1FyXX22xrepI/mM38Hu9XEzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/gG4wu1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707800180; x=1739336180;
  h=date:from:to:cc:subject:message-id;
  bh=u94O8h9AlV7KzmGBypG6ZBBstxlnfHqe40itEux6PQU=;
  b=Y/gG4wu1/wbtwuJLE5/ldtXIkgtpftlc7pyFm8igeXUz0RgtvD45N29v
   gi5r0Q0u3XtCPwc2VpJ4LuCgR+bOgnX+L+SeQlsb7LAjcKaCqOTvvHqYw
   BvSpI+ytMAV6pRimkd2SIjg9mLIrCyrQ4YDCOK4pRQcG3tZ8qYQ+T4okW
   srL2pSbp5oTHOPsFhGN/lQn8LISqHwKLNhFoZR/PNVG/rCA4Q0L8PuMRv
   6hRKDZURXrniQnmM2POZgFTbfE2+Dk2V0Y4tI7LvmcAMoU1vksdZFer4U
   xxgD+wL+eSsKmXGYFIgIHojSYcVR2SyYHB4GvmB5y4nnI/gDIYJAc2aIJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1677030"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1677030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 20:56:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="3107427"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Feb 2024 20:56:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZkq8-0007WY-0b;
	Tue, 13 Feb 2024 04:56:16 +0000
Date: Tue, 13 Feb 2024 12:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 6b3b464fbc8c04d459023533f880b1bbcbba0b5e
Message-ID: <202402131237.Idr2sBR6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 6b3b464fbc8c04d459023533f880b1bbcbba0b5e  regmap: kunit: Ensure that changed bytes are actually different

elapsed time: 1443m

configs tested: 260
configs skipped: 4

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
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240212   gcc  
arc                   randconfig-001-20240213   gcc  
arc                   randconfig-002-20240212   gcc  
arc                   randconfig-002-20240213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                          moxart_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240212   gcc  
arm                   randconfig-001-20240213   gcc  
arm                   randconfig-002-20240212   clang
arm                   randconfig-002-20240213   gcc  
arm                   randconfig-003-20240212   clang
arm                   randconfig-003-20240213   gcc  
arm                   randconfig-004-20240212   clang
arm                        shmobile_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240212   clang
arm64                 randconfig-001-20240213   gcc  
arm64                 randconfig-002-20240212   clang
arm64                 randconfig-002-20240213   gcc  
arm64                 randconfig-003-20240212   clang
arm64                 randconfig-003-20240213   gcc  
arm64                 randconfig-004-20240212   clang
arm64                 randconfig-004-20240213   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240212   gcc  
csky                  randconfig-001-20240213   gcc  
csky                  randconfig-002-20240212   gcc  
csky                  randconfig-002-20240213   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240212   clang
hexagon               randconfig-002-20240212   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240212   clang
i386         buildonly-randconfig-002-20240212   gcc  
i386         buildonly-randconfig-002-20240213   gcc  
i386         buildonly-randconfig-003-20240212   gcc  
i386         buildonly-randconfig-003-20240213   gcc  
i386         buildonly-randconfig-004-20240212   clang
i386         buildonly-randconfig-005-20240212   gcc  
i386         buildonly-randconfig-005-20240213   gcc  
i386         buildonly-randconfig-006-20240212   clang
i386                                defconfig   clang
i386                  randconfig-001-20240212   gcc  
i386                  randconfig-002-20240212   clang
i386                  randconfig-002-20240213   gcc  
i386                  randconfig-003-20240212   clang
i386                  randconfig-003-20240213   gcc  
i386                  randconfig-004-20240212   gcc  
i386                  randconfig-005-20240212   clang
i386                  randconfig-005-20240213   gcc  
i386                  randconfig-006-20240212   gcc  
i386                  randconfig-006-20240213   gcc  
i386                  randconfig-011-20240212   gcc  
i386                  randconfig-012-20240212   gcc  
i386                  randconfig-012-20240213   gcc  
i386                  randconfig-013-20240212   gcc  
i386                  randconfig-013-20240213   gcc  
i386                  randconfig-014-20240212   gcc  
i386                  randconfig-014-20240213   gcc  
i386                  randconfig-015-20240212   gcc  
i386                  randconfig-015-20240213   gcc  
i386                  randconfig-016-20240212   clang
i386                  randconfig-016-20240213   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240212   gcc  
loongarch             randconfig-001-20240213   gcc  
loongarch             randconfig-002-20240212   gcc  
loongarch             randconfig-002-20240213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                       bmips_be_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   clang
mips                           ip22_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240212   gcc  
nios2                 randconfig-001-20240213   gcc  
nios2                 randconfig-002-20240212   gcc  
nios2                 randconfig-002-20240213   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240212   gcc  
parisc                randconfig-001-20240213   gcc  
parisc                randconfig-002-20240212   gcc  
parisc                randconfig-002-20240213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc                      pasemi_defconfig   clang
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-001-20240212   clang
powerpc               randconfig-002-20240212   gcc  
powerpc               randconfig-002-20240213   gcc  
powerpc               randconfig-003-20240212   clang
powerpc               randconfig-003-20240213   gcc  
powerpc                     sequoia_defconfig   clang
powerpc                     stx_gp3_defconfig   clang
powerpc64             randconfig-001-20240212   clang
powerpc64             randconfig-001-20240213   gcc  
powerpc64             randconfig-002-20240212   gcc  
powerpc64             randconfig-002-20240213   gcc  
powerpc64             randconfig-003-20240212   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240212   gcc  
riscv                 randconfig-001-20240213   gcc  
riscv                 randconfig-002-20240212   gcc  
riscv                 randconfig-002-20240213   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240212   clang
s390                  randconfig-001-20240213   gcc  
s390                  randconfig-002-20240212   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240212   gcc  
sh                    randconfig-001-20240213   gcc  
sh                    randconfig-002-20240212   gcc  
sh                    randconfig-002-20240213   gcc  
sh                          rsk7264_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240212   gcc  
sparc64               randconfig-001-20240213   gcc  
sparc64               randconfig-002-20240212   gcc  
sparc64               randconfig-002-20240213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240212   clang
um                    randconfig-002-20240212   clang
um                    randconfig-002-20240213   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240212   clang
x86_64       buildonly-randconfig-002-20240212   clang
x86_64       buildonly-randconfig-002-20240213   gcc  
x86_64       buildonly-randconfig-003-20240212   clang
x86_64       buildonly-randconfig-004-20240212   clang
x86_64       buildonly-randconfig-004-20240213   gcc  
x86_64       buildonly-randconfig-005-20240212   clang
x86_64       buildonly-randconfig-005-20240213   gcc  
x86_64       buildonly-randconfig-006-20240212   clang
x86_64       buildonly-randconfig-006-20240213   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240212   gcc  
x86_64                randconfig-001-20240213   gcc  
x86_64                randconfig-002-20240212   gcc  
x86_64                randconfig-003-20240212   gcc  
x86_64                randconfig-004-20240212   gcc  
x86_64                randconfig-004-20240213   gcc  
x86_64                randconfig-005-20240212   gcc  
x86_64                randconfig-006-20240212   gcc  
x86_64                randconfig-011-20240212   gcc  
x86_64                randconfig-012-20240212   gcc  
x86_64                randconfig-013-20240212   clang
x86_64                randconfig-014-20240212   gcc  
x86_64                randconfig-014-20240213   gcc  
x86_64                randconfig-015-20240212   gcc  
x86_64                randconfig-016-20240212   clang
x86_64                randconfig-071-20240212   gcc  
x86_64                randconfig-071-20240213   gcc  
x86_64                randconfig-072-20240212   gcc  
x86_64                randconfig-072-20240213   gcc  
x86_64                randconfig-073-20240212   clang
x86_64                randconfig-074-20240212   gcc  
x86_64                randconfig-074-20240213   gcc  
x86_64                randconfig-075-20240212   gcc  
x86_64                randconfig-075-20240213   gcc  
x86_64                randconfig-076-20240212   gcc  
x86_64                randconfig-076-20240213   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240212   gcc  
xtensa                randconfig-001-20240213   gcc  
xtensa                randconfig-002-20240212   gcc  
xtensa                randconfig-002-20240213   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

