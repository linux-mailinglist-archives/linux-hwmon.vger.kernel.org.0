Return-Path: <linux-hwmon+bounces-9066-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D621B20333
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Aug 2025 11:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 096663B236F
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Aug 2025 09:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739782BE7C2;
	Mon, 11 Aug 2025 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jh2k0pAO"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4A223DF5
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Aug 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904176; cv=none; b=kXp14PG5tRrqXRfDvlhxEEQcWZHNDQn5v0YOhGeAdAwRmkbCcJeOAjhXNovuC24w/itDCqluv1ntwLCtkzGQVN6Akff7jVdizbJnlQ667ye5INOKbmmPifPbUqm4sMfbIkr6YKdEV8sTkd1p9iutT5Zs06qs5/eHBND8fZwaSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904176; c=relaxed/simple;
	bh=cYEd0VZ+Y+fIg0SnmcrznU+0YUMXDEs/HhLK67R9DsQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DMybT/TAhZiUO40O7NYC3NuRxw65qAOWvyFBgmAK2qxZ1qvxGOIaqwsQOtTHiixRi3L0FXu37egQmW/Al+pT6cdKVpzjZKaUeIQ7HOLQKwL/1Vk5LewxgDjEtVmY9ilgFe+t4Qsaqiuwl7Bmb/V+TD3YN/YVNEyFTpn7c8IO7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jh2k0pAO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754904174; x=1786440174;
  h=date:from:to:cc:subject:message-id;
  bh=cYEd0VZ+Y+fIg0SnmcrznU+0YUMXDEs/HhLK67R9DsQ=;
  b=Jh2k0pAOj4J0qy0LB3rz4rH+uwobsSgP73xRzNXWMj9U/Jby3cA00IPj
   WYz/e9pjf/8bTNrwMJoEm9+zAaGZ8/kO+gClT0tSADZld6Bmc79hXHfxy
   pLFOU/nTSymU+eEOQZoZXZHoQQ4nR7RpzHo0Mff8t2G7ORuIL6u1Lymm2
   F1mZCeuklE52nlgdNQtkwcApBTWwLFH5GJ7twD54SihPs3tetX/Jinvqo
   B+Bp5JJVfLYsT60KTeN2Wdup46QMuFVbKIUW2dkvmkoWSHD54951MCk/u
   0v7XhGp52luk9yUHVAfeqTojLh7V61Sc1YZQFFQ7TQifi54wI+dv72UaD
   A==;
X-CSE-ConnectionGUID: cQUBkBHeTn63vI+SBSTCbw==
X-CSE-MsgGUID: vRxLdQwjR4me/WkVQIzH0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68521219"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68521219"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 02:22:54 -0700
X-CSE-ConnectionGUID: 442dhYa5T4Kgd97/yzDVoQ==
X-CSE-MsgGUID: 6UT4oRc3RQ6ubaPq+LnnXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="170305178"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Aug 2025 02:22:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulOja-0005iK-0h;
	Mon, 11 Aug 2025 09:22:32 +0000
Date: Mon, 11 Aug 2025 17:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 6d24d3a1a5c6585cb86e12b5e41c0c9b04b8ed79
Message-ID: <202508111730.soOL5p05-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 6d24d3a1a5c6585cb86e12b5e41c0c9b04b8ed79  hwmon: mlxreg-fan: Prevent fans from getting stuck at 0 RPM

elapsed time: 751m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250811    gcc-8.5.0
arc                   randconfig-002-20250811    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                            hisi_defconfig    gcc-15.1.0
arm                   randconfig-001-20250811    gcc-10.5.0
arm                   randconfig-002-20250811    gcc-13.4.0
arm                   randconfig-003-20250811    clang-22
arm                   randconfig-004-20250811    gcc-10.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250811    clang-22
arm64                 randconfig-002-20250811    clang-19
arm64                 randconfig-003-20250811    clang-20
arm64                 randconfig-004-20250811    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250811    gcc-15.1.0
csky                  randconfig-002-20250811    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250811    clang-17
hexagon               randconfig-002-20250811    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250811    clang-20
i386        buildonly-randconfig-002-20250811    clang-20
i386        buildonly-randconfig-003-20250811    gcc-12
i386        buildonly-randconfig-004-20250811    gcc-12
i386        buildonly-randconfig-005-20250811    gcc-12
i386        buildonly-randconfig-006-20250811    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250811    gcc-15.1.0
loongarch             randconfig-002-20250811    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250811    gcc-10.5.0
nios2                 randconfig-002-20250811    gcc-11.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250811    gcc-9.5.0
parisc                randconfig-002-20250811    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 linkstation_defconfig    clang-20
powerpc                  mpc866_ads_defconfig    clang-22
powerpc               randconfig-001-20250811    gcc-13.4.0
powerpc               randconfig-002-20250811    clang-22
powerpc               randconfig-003-20250811    gcc-13.4.0
powerpc                      tqm8xx_defconfig    clang-19
powerpc64             randconfig-001-20250811    clang-22
powerpc64             randconfig-002-20250811    clang-22
powerpc64             randconfig-003-20250811    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250811    gcc-8.5.0
riscv                 randconfig-002-20250811    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250811    gcc-8.5.0
s390                  randconfig-002-20250811    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250811    gcc-15.1.0
sh                    randconfig-002-20250811    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250811    gcc-8.5.0
sparc                 randconfig-002-20250811    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250811    clang-22
sparc64               randconfig-002-20250811    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250811    clang-18
um                    randconfig-002-20250811    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250811    gcc-12
x86_64      buildonly-randconfig-002-20250811    clang-20
x86_64      buildonly-randconfig-003-20250811    clang-20
x86_64      buildonly-randconfig-004-20250811    clang-20
x86_64      buildonly-randconfig-005-20250811    clang-20
x86_64      buildonly-randconfig-006-20250811    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250811    gcc-9.5.0
xtensa                randconfig-002-20250811    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

