Return-Path: <linux-hwmon+bounces-3736-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3161995E45A
	for <lists+linux-hwmon@lfdr.de>; Sun, 25 Aug 2024 18:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F2E81C2098F
	for <lists+linux-hwmon@lfdr.de>; Sun, 25 Aug 2024 16:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62AF13D25E;
	Sun, 25 Aug 2024 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDz9jGY/"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F4D1CD31
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Aug 2024 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724603327; cv=none; b=tzVDxmWxXSdh8J2osHVCAY2zrsq9duxEzum2eiMHWPj86AhvgOnhU3o+OSGj4XTW4IgjXA90cHGkgMR6Az1p8H9Ghppr9LFtNXpXw3NcdMzd2q6qJPHG51twiGNneROVMsz6NuIEpoCIdeYJb1mHZA1rUPl3enl3VtLgxlYLe9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724603327; c=relaxed/simple;
	bh=i5LlnzSCGtBWpRbFdjihFq63Cz8+Dbh6RAAYNPLRALQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S6QwTO85eHdl7clg02kvFW1Q7tQwxOpOKuc2cq5vbuOXnQOx/HaLAbsa8i2nVabeYUDjlf482ZqbsVuAKmfeS/X3MV9C0UUE1G7Otg/acpTblzUUmHcghub0wLs/fSOdson5oNOl1aBbJBRCBGh7DcIp5RT9pijsCcf4/Ic3MVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDz9jGY/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724603326; x=1756139326;
  h=date:from:to:cc:subject:message-id;
  bh=i5LlnzSCGtBWpRbFdjihFq63Cz8+Dbh6RAAYNPLRALQ=;
  b=oDz9jGY/LKvhJV2ZWkQmo7zvER57wNG8QRhm6iL1dy0IahIUZsWIoG2b
   7QX+vyAOCpeD2Bw8/s/z/2buSMYycEIJkUHzdJbtyTfmMlC7mwiCMaraB
   pYj7lovVHi4O+aJwE7gLh9L2vYF72+1x+w1c83cR3uQLmFTO8hZcUj+BB
   qBpFanUzWJDi2MYK3bumQB3LG1W4I66D2tN0/Yc8SPYsx692snIrdNWT2
   LgawCw4bN90YJ3d2az5d/Ihb3awru7LUFalGqcc9A0aSElo9AdgqNAAfW
   6LBpZoi8YGfjEFpsID4RkGswLB0LEPRT2c8XyOa6031OElU5xzhuI0/Yz
   w==;
X-CSE-ConnectionGUID: DOO7l6CNQLm40DEwDtKaNQ==
X-CSE-MsgGUID: vW8GeAIMTCW2jw1Pq2BkTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26897212"
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="26897212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 09:28:45 -0700
X-CSE-ConnectionGUID: 3fchIAPKTaOqWA+M6YV/Fg==
X-CSE-MsgGUID: fcIQTV47SqmLo9YgQisj/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,175,1719903600"; 
   d="scan'208";a="62432674"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Aug 2024 09:28:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siG6c-000FJ1-0z;
	Sun, 25 Aug 2024 16:28:42 +0000
Date: Mon, 26 Aug 2024 00:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 bd80f02bbe68758b0f31ae4808e80db069172b76
Message-ID: <202408260025.7hUA9y3G-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: bd80f02bbe68758b0f31ae4808e80db069172b76  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1404m

configs tested: 181
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240825   gcc-13.2.0
arc                   randconfig-002-20240825   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-14
arm                         mv78xx0_defconfig   clang-20
arm                             mxs_defconfig   clang-14
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240825   gcc-13.2.0
arm                   randconfig-002-20240825   gcc-13.2.0
arm                   randconfig-003-20240825   gcc-13.2.0
arm                   randconfig-004-20240825   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                         socfpga_defconfig   clang-14
arm                           sunxi_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240825   gcc-13.2.0
arm64                 randconfig-002-20240825   gcc-13.2.0
arm64                 randconfig-003-20240825   gcc-13.2.0
arm64                 randconfig-004-20240825   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240825   gcc-13.2.0
csky                  randconfig-002-20240825   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240825   clang-18
i386         buildonly-randconfig-002-20240825   clang-18
i386         buildonly-randconfig-003-20240825   clang-18
i386         buildonly-randconfig-004-20240825   clang-18
i386         buildonly-randconfig-004-20240825   gcc-12
i386         buildonly-randconfig-005-20240825   clang-18
i386         buildonly-randconfig-006-20240825   clang-18
i386         buildonly-randconfig-006-20240825   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240825   clang-18
i386                  randconfig-001-20240825   gcc-12
i386                  randconfig-002-20240825   clang-18
i386                  randconfig-002-20240825   gcc-12
i386                  randconfig-003-20240825   clang-18
i386                  randconfig-003-20240825   gcc-12
i386                  randconfig-004-20240825   clang-18
i386                  randconfig-004-20240825   gcc-12
i386                  randconfig-005-20240825   clang-18
i386                  randconfig-006-20240825   clang-18
i386                  randconfig-011-20240825   clang-18
i386                  randconfig-012-20240825   clang-18
i386                  randconfig-012-20240825   gcc-11
i386                  randconfig-013-20240825   clang-18
i386                  randconfig-014-20240825   clang-18
i386                  randconfig-015-20240825   clang-18
i386                  randconfig-016-20240825   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240825   gcc-13.2.0
loongarch             randconfig-002-20240825   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-14
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240825   gcc-13.2.0
nios2                 randconfig-002-20240825   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240825   gcc-13.2.0
parisc                randconfig-002-20240825   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-14
powerpc                 mpc8313_rdb_defconfig   clang-14
powerpc                      ppc44x_defconfig   clang-20
powerpc               randconfig-001-20240825   gcc-13.2.0
powerpc               randconfig-002-20240825   gcc-13.2.0
powerpc                        warp_defconfig   clang-14
powerpc64             randconfig-001-20240825   gcc-13.2.0
powerpc64             randconfig-002-20240825   gcc-13.2.0
powerpc64             randconfig-003-20240825   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   clang-20
riscv                 randconfig-001-20240825   gcc-13.2.0
riscv                 randconfig-002-20240825   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-14
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240825   gcc-13.2.0
s390                  randconfig-002-20240825   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240825   gcc-13.2.0
sh                    randconfig-002-20240825   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240825   gcc-13.2.0
sparc64               randconfig-002-20240825   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240825   gcc-13.2.0
um                    randconfig-002-20240825   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240825   gcc-12
x86_64       buildonly-randconfig-002-20240825   gcc-12
x86_64       buildonly-randconfig-003-20240825   gcc-12
x86_64       buildonly-randconfig-004-20240825   gcc-12
x86_64       buildonly-randconfig-005-20240825   gcc-12
x86_64       buildonly-randconfig-006-20240825   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240825   gcc-12
x86_64                randconfig-002-20240825   gcc-12
x86_64                randconfig-003-20240825   gcc-12
x86_64                randconfig-004-20240825   gcc-12
x86_64                randconfig-005-20240825   gcc-12
x86_64                randconfig-006-20240825   gcc-12
x86_64                randconfig-011-20240825   gcc-12
x86_64                randconfig-012-20240825   gcc-12
x86_64                randconfig-013-20240825   gcc-12
x86_64                randconfig-014-20240825   gcc-12
x86_64                randconfig-015-20240825   gcc-12
x86_64                randconfig-016-20240825   gcc-12
x86_64                randconfig-071-20240825   gcc-12
x86_64                randconfig-072-20240825   gcc-12
x86_64                randconfig-073-20240825   gcc-12
x86_64                randconfig-074-20240825   gcc-12
x86_64                randconfig-075-20240825   gcc-12
x86_64                randconfig-076-20240825   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240825   gcc-13.2.0
xtensa                randconfig-002-20240825   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

