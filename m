Return-Path: <linux-hwmon+bounces-3092-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE72930D14
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jul 2024 05:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C99F1F212FA
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jul 2024 03:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC95132494;
	Mon, 15 Jul 2024 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTlvGzV3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B2A3F
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jul 2024 03:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721015171; cv=none; b=XNZ2w82iKb2GmV3XxpkFdVOXVM76EwtAsLsq6a2otKt1gwrj8Ehc2J/vYdDUD6aAymv3sLyyLqbt8k8WSR0oAC6fSCZS4q1sXkJhfJCS7aB5B1Qlm3ihAWBInSphtEuCdICRigU4yl5xxHIm23EQnXgbyVWgi2KQt+XsA3aLGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721015171; c=relaxed/simple;
	bh=q6hTg4nngeBF1Kr41yWe9t0XhE+sMap8MoQFCMLDDpE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u84hfDFE0v1WeORNONfjWRREoZoy/9KWOD2WYgTPMaFrCwl75dg/weOInPpvOqJf9q89Ke849Jz/TQBQFKyAY8vkGBM9XSzEZgHSbDtDqS2LXHmdOqvD/rBQJtdWujCrngSDJptsuxkBzHYhX5aitYOONGNEVDvjDpY6AYsHGEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTlvGzV3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721015168; x=1752551168;
  h=date:from:to:cc:subject:message-id;
  bh=q6hTg4nngeBF1Kr41yWe9t0XhE+sMap8MoQFCMLDDpE=;
  b=LTlvGzV349qwxzWAsC1B8nfq5iiTVQX7ePS3TGE+ce4XnJy/nlyNcTgI
   FsxJ8NazgPD19651rWe0iHFaGWQbMvzQ5LwZ+jK+9HFgim+MRCPvIapRc
   4bB9O8RRnMraZxk1IJF/GamZ1SkOt4BVuYyUI8pxtfBBdkSgRwkKwz6Q8
   gi+/6JGCLXy/UjLDrfd4ZngdV/xzUJK/cYtFMMDEKjXXB4NLlLDcXFCbi
   6b0OiVwjanx6lTOtje1VyW38/TUfadwZBdwdAVEQp94QDVhgtJJjMHwVA
   wjelVFr6H+xW+mFylMcWZ8jttLnC0I9p6BmznWpbEtVNJEaDuUuIqp+ys
   w==;
X-CSE-ConnectionGUID: PjSTz7ZpS16aYWaIt5BOqg==
X-CSE-MsgGUID: Sq1QFmXBRyK+E3TPlk6WPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="29057255"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="29057255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 20:46:08 -0700
X-CSE-ConnectionGUID: xZwJUSQ1TGOXpCHWwd7KQg==
X-CSE-MsgGUID: YSBIURiMSP+/wEQnVxJPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="49369761"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jul 2024 20:46:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTCf6-000dyr-2H;
	Mon, 15 Jul 2024 03:46:04 +0000
Date: Mon, 15 Jul 2024 11:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 e1dda5d92bda11969b935e238e5619ff67d8f6e0
Message-ID: <202407151151.9Hy1x6bu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: e1dda5d92bda11969b935e238e5619ff67d8f6e0  Merge branch 'hwmon-emc2103' into hwmon-staging

elapsed time: 1275m

configs tested: 230
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240714   gcc-13.2.0
arc                   randconfig-002-20240714   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                          gemini_defconfig   gcc-13.2.0
arm                       imx_v6_v7_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   clang-19
arm                      integrator_defconfig   clang-19
arm                   milbeaut_m10v_defconfig   gcc-13.2.0
arm                   randconfig-001-20240714   clang-19
arm                   randconfig-002-20240714   clang-15
arm                   randconfig-003-20240714   clang-17
arm                   randconfig-004-20240714   clang-15
arm                         s5pv210_defconfig   gcc-14.1.0
arm                           sunxi_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240714   clang-15
arm64                 randconfig-002-20240714   clang-19
arm64                 randconfig-003-20240714   clang-19
arm64                 randconfig-004-20240714   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240714   gcc-14.1.0
csky                  randconfig-002-20240714   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240714   clang-19
hexagon               randconfig-002-20240714   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240714   gcc-13
i386         buildonly-randconfig-002-20240714   clang-18
i386         buildonly-randconfig-003-20240714   gcc-11
i386         buildonly-randconfig-004-20240714   clang-18
i386         buildonly-randconfig-005-20240714   gcc-9
i386         buildonly-randconfig-006-20240714   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240714   clang-18
i386                  randconfig-002-20240714   clang-18
i386                  randconfig-003-20240714   clang-18
i386                  randconfig-004-20240714   clang-18
i386                  randconfig-005-20240714   clang-18
i386                  randconfig-006-20240714   gcc-7
i386                  randconfig-011-20240714   clang-18
i386                  randconfig-012-20240714   gcc-13
i386                  randconfig-013-20240714   clang-18
i386                  randconfig-014-20240714   gcc-10
i386                  randconfig-015-20240714   gcc-13
i386                  randconfig-016-20240714   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240714   gcc-14.1.0
loongarch             randconfig-002-20240714   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                           gcw0_defconfig   gcc-13.2.0
mips                           ip22_defconfig   gcc-13.2.0
mips                  maltasmvp_eva_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-13.2.0
nios2                            alldefconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240714   gcc-14.1.0
nios2                 randconfig-002-20240714   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240714   gcc-14.1.0
parisc                randconfig-002-20240714   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                    gamecube_defconfig   gcc-13.2.0
powerpc                        icon_defconfig   gcc-14.1.0
powerpc                     kilauea_defconfig   clang-19
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                      pasemi_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240714   clang-19
powerpc               randconfig-002-20240714   clang-19
powerpc               randconfig-003-20240714   gcc-14.1.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240714   gcc-14.1.0
powerpc64             randconfig-002-20240714   gcc-14.1.0
powerpc64             randconfig-003-20240714   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_virt_defconfig   clang-19
riscv                 randconfig-001-20240714   clang-19
riscv                 randconfig-002-20240714   clang-15
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240714   clang-19
s390                  randconfig-002-20240714   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240714   gcc-14.1.0
sh                    randconfig-002-20240714   gcc-14.1.0
sh                           se7722_defconfig   gcc-14.1.0
sh                           se7724_defconfig   gcc-14.1.0
sh                           se7780_defconfig   gcc-13.2.0
sh                           se7780_defconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240714   gcc-14.1.0
sparc64               randconfig-002-20240714   gcc-14.1.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-19
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240714   clang-19
um                    randconfig-002-20240714   clang-19
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240714   clang-18
x86_64       buildonly-randconfig-001-20240715   clang-18
x86_64       buildonly-randconfig-002-20240714   gcc-13
x86_64       buildonly-randconfig-002-20240715   clang-18
x86_64       buildonly-randconfig-003-20240714   gcc-13
x86_64       buildonly-randconfig-003-20240715   clang-18
x86_64       buildonly-randconfig-004-20240714   clang-18
x86_64       buildonly-randconfig-004-20240715   clang-18
x86_64       buildonly-randconfig-005-20240714   clang-18
x86_64       buildonly-randconfig-005-20240715   clang-18
x86_64       buildonly-randconfig-006-20240714   clang-18
x86_64       buildonly-randconfig-006-20240715   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240714   gcc-13
x86_64                randconfig-001-20240715   clang-18
x86_64                randconfig-002-20240714   clang-18
x86_64                randconfig-002-20240715   clang-18
x86_64                randconfig-003-20240714   gcc-13
x86_64                randconfig-003-20240715   clang-18
x86_64                randconfig-004-20240714   clang-18
x86_64                randconfig-004-20240715   clang-18
x86_64                randconfig-005-20240714   gcc-10
x86_64                randconfig-005-20240715   clang-18
x86_64                randconfig-006-20240714   gcc-10
x86_64                randconfig-006-20240715   clang-18
x86_64                randconfig-011-20240714   clang-18
x86_64                randconfig-011-20240715   clang-18
x86_64                randconfig-012-20240714   gcc-7
x86_64                randconfig-012-20240715   clang-18
x86_64                randconfig-013-20240714   clang-18
x86_64                randconfig-013-20240715   clang-18
x86_64                randconfig-014-20240714   clang-18
x86_64                randconfig-014-20240715   clang-18
x86_64                randconfig-015-20240714   gcc-13
x86_64                randconfig-015-20240715   clang-18
x86_64                randconfig-016-20240714   clang-18
x86_64                randconfig-016-20240715   clang-18
x86_64                randconfig-071-20240714   clang-18
x86_64                randconfig-071-20240715   clang-18
x86_64                randconfig-072-20240714   gcc-13
x86_64                randconfig-072-20240715   clang-18
x86_64                randconfig-073-20240714   clang-18
x86_64                randconfig-073-20240715   clang-18
x86_64                randconfig-074-20240714   clang-18
x86_64                randconfig-074-20240715   clang-18
x86_64                randconfig-075-20240714   clang-18
x86_64                randconfig-075-20240715   clang-18
x86_64                randconfig-076-20240714   clang-18
x86_64                randconfig-076-20240715   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240714   gcc-14.1.0
xtensa                randconfig-002-20240714   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

