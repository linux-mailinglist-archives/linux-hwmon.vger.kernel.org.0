Return-Path: <linux-hwmon+bounces-1339-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC4875DF8
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 Mar 2024 07:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCB97282E9F
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 Mar 2024 06:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EA7374E9;
	Fri,  8 Mar 2024 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kc4mqt47"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53E3611F
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Mar 2024 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709879264; cv=none; b=kIkZvOjAUJ8aZOobICXamgFOp/l5lqQDGuFsa7bd9E4K4NTvrbKPPGl35asc5BLCj/2IEe2vJVbqtBypQ7wpP5kKIWYlB/+9k+iBYz9kAylX4Qpl/R1IAT/KVWFMqi1TwUE+J7hpI2IwamsBjQRbgNjSG1ivV9GDJFiqy6E9LuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709879264; c=relaxed/simple;
	bh=apoYIJNJKrAOoQlcDcj5XycEU7ZI9i97QzIHgz5bgHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KcJ6ebvS+4JhDzq6Puw1yj3hHgwn4DQ1DZvpaQ9kt5ieuyF/zPyVZZt423D8pMukM9XsgeGIn0t3AU5XMNXxD4YzrcS5jhDqfY1/dYLjXGiQ/9wCp+B7QXzU7m0ng2f/zvdteWgCwLPsJukh4sCM+Ah5pAaxGVJe/QJa9z/FU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kc4mqt47; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709879261; x=1741415261;
  h=date:from:to:cc:subject:message-id;
  bh=apoYIJNJKrAOoQlcDcj5XycEU7ZI9i97QzIHgz5bgHQ=;
  b=kc4mqt47E6roeedwQfZ1ZHK/F51VDT1aH0uk/jMuaUyxbKM3jNVXrdPL
   20SlrL6nV1btzBjQyoECmJTOp3XJALOek+QAWPnAOKaLBCLz6awdbmynt
   cYpNHBCUrY12RyojYYhrNsmGTqGuqaF67o7tvGAXh5S64k6E3Ax7/43yZ
   HQgC+rFbqm/4yo3Dayf2+Vmx7KBO/5SyLr5WouC7eyWhvkivdjmZuMYeN
   hKSl8W1B2E9a3d9wErz7BLvhwiU8gq75eKZ+dveC6eU0YR9HWRj9WhVZS
   whFH1cXfUg/1oaZ/Pn0M+CM4ehNnftXc5DawJXiJaWKlblzRg8ilRXnGT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4440315"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4440315"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 22:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="41346470"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2024 22:27:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riThh-00066D-0n;
	Fri, 08 Mar 2024 06:27:37 +0000
Date: Fri, 08 Mar 2024 14:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 b581b94c330b7b62db5cfae71b36ae75ef84f721
Message-ID: <202403081448.0a1FrBeO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: b581b94c330b7b62db5cfae71b36ae75ef84f721  Merge branch 'kunit' into testing

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-001-20240308
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- csky-randconfig-002-20240308
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
`-- loongarch-randconfig-002-20240308
    `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
clang_recent_errors
|-- hexagon-randconfig-002-20240308
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
`-- x86_64-buildonly-randconfig-001-20240308
    `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner

elapsed time: 738m

configs tested: 128
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
arc                   randconfig-001-20240308   gcc  
arc                   randconfig-002-20240308   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240308   gcc  
arm                   randconfig-002-20240308   clang
arm                   randconfig-003-20240308   clang
arm                   randconfig-004-20240308   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240308   clang
arm64                 randconfig-002-20240308   clang
arm64                 randconfig-003-20240308   clang
arm64                 randconfig-004-20240308   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240308   gcc  
csky                  randconfig-002-20240308   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240308   clang
hexagon               randconfig-002-20240308   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240308   clang
i386         buildonly-randconfig-002-20240308   clang
i386         buildonly-randconfig-003-20240308   gcc  
i386         buildonly-randconfig-004-20240308   gcc  
i386         buildonly-randconfig-005-20240308   gcc  
i386         buildonly-randconfig-006-20240308   clang
i386                                defconfig   clang
i386                  randconfig-001-20240308   clang
i386                  randconfig-002-20240308   clang
i386                  randconfig-003-20240308   clang
i386                  randconfig-004-20240308   gcc  
i386                  randconfig-005-20240308   clang
i386                  randconfig-006-20240308   clang
i386                  randconfig-011-20240308   gcc  
i386                  randconfig-012-20240308   clang
i386                  randconfig-013-20240308   clang
i386                  randconfig-014-20240308   clang
i386                  randconfig-015-20240308   gcc  
i386                  randconfig-016-20240308   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240308   gcc  
loongarch             randconfig-002-20240308   gcc  
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
nios2                 randconfig-001-20240308   gcc  
nios2                 randconfig-002-20240308   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240308   gcc  
parisc                randconfig-002-20240308   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240308   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240308   clang
x86_64       buildonly-randconfig-002-20240308   gcc  
x86_64       buildonly-randconfig-003-20240308   gcc  
x86_64       buildonly-randconfig-004-20240308   clang
x86_64       buildonly-randconfig-005-20240308   gcc  
x86_64       buildonly-randconfig-006-20240308   gcc  
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

