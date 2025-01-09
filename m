Return-Path: <linux-hwmon+bounces-6002-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2717AA0809A
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jan 2025 20:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA211691A5
	for <lists+linux-hwmon@lfdr.de>; Thu,  9 Jan 2025 19:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AAB19C546;
	Thu,  9 Jan 2025 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+MMTJm0"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F014A2D
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736451255; cv=none; b=ovWBDQttniixt94rBLeTuJya9vIDF/3nc9LKNNPHubGbSN6AZvQbzNGX8yTihPR/Rbf6gkxeinjGQ3bFNg78pJk6uifL0c7PbftXvd9dGw5RO2C69iMhcHP/qQ99A/KCKF5byhpb0ceXMl4iCGU2DtT9RnDVEk3siVeQNggl7Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736451255; c=relaxed/simple;
	bh=rv8XZxL/KHxc71JhM8GDn/hnUrKzGXP6hVZk+B/w3LY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i3GzbEJB6ME7WkQiQRuNj1hGCt80lG1cjqBwbioc02WVsC9MO/zZ2QAhKQSuW+p8/yGHhenTBlB/W6nGj7uEWOKQRng/fZFh6v8kOcWzQf1XfuGFXIGDB6mHAeS5UsaH+SHtZVvao1EMH7yI2gP12UdAt7dJ2Kv/kg4WMY063sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+MMTJm0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736451253; x=1767987253;
  h=date:from:to:cc:subject:message-id;
  bh=rv8XZxL/KHxc71JhM8GDn/hnUrKzGXP6hVZk+B/w3LY=;
  b=F+MMTJm0KWdt6ALCOl9EFL4TQOUGqGU+CdguS+jRCB6pKaNkGY78yBph
   BkZw1Gs35fx+Irf83sNM/OK893GmRD8/7O3nCcu7jylnjXe2IZloqh38t
   1CNLEiivE423ji/cAagqXdNIIQfOnSJznicCa9XFlNj7Or/ZblzF0E9NW
   /b1jBfUKosJ/uqa5LlguRCs0uQF5GzdOi0Up7TaQWzTK4H6WU/VLCC/V/
   PpQErTyulUUHImenY1Q0/YlwOQJH91UKUNNcOz4L/Cm4+bDi06QEhwzv/
   5Shajf1BCWKj/2Hf6fQbKJeVUcZM6QPWFmKB0RKQx/MsVpb+GpsKNPhzB
   Q==;
X-CSE-ConnectionGUID: NJgwSwjyQWCrdk6DX8JW4g==
X-CSE-MsgGUID: j/IXAmsdQ+2LJ4/akX+s3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36016596"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36016596"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 11:34:12 -0800
X-CSE-ConnectionGUID: J4JxSTSSQV2klBRa3y5s0Q==
X-CSE-MsgGUID: rxyAh3lmSoWfUh3QfQQSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="134336704"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jan 2025 11:34:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVyIA-000I4b-1S;
	Thu, 09 Jan 2025 19:34:06 +0000
Date: Fri, 10 Jan 2025 03:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 f0799e1f0a16be414d09e92d41c4cb0a355ae4f7
Message-ID: <202501100304.umfW5FBb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: f0799e1f0a16be414d09e92d41c4cb0a355ae4f7  Merge branch 'fixes-v6.13' into testing

elapsed time: 1452m

configs tested: 94
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                   randconfig-001-20250109    gcc-13.2.0
arc                   randconfig-002-20250109    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                         assabet_defconfig    clang-20
arm                   randconfig-001-20250109    gcc-14.2.0
arm                   randconfig-002-20250109    clang-17
arm                   randconfig-003-20250109    clang-20
arm                   randconfig-004-20250109    gcc-14.2.0
arm                       versatile_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250109    gcc-14.2.0
arm64                 randconfig-002-20250109    clang-20
arm64                 randconfig-003-20250109    gcc-14.2.0
arm64                 randconfig-004-20250109    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250109    gcc-14.2.0
csky                  randconfig-002-20250109    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250109    clang-14
hexagon               randconfig-002-20250109    clang-20
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250109    gcc-12
i386        buildonly-randconfig-002-20250109    gcc-12
i386        buildonly-randconfig-003-20250109    clang-19
i386        buildonly-randconfig-004-20250109    clang-19
i386        buildonly-randconfig-005-20250109    clang-19
i386        buildonly-randconfig-006-20250109    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250109    gcc-14.2.0
loongarch             randconfig-002-20250109    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250109    gcc-14.2.0
nios2                 randconfig-002-20250109    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250109    gcc-14.2.0
parisc                randconfig-002-20250109    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250109    clang-15
powerpc               randconfig-002-20250109    gcc-14.2.0
powerpc               randconfig-003-20250109    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20250109    gcc-14.2.0
powerpc64             randconfig-002-20250109    clang-20
powerpc64             randconfig-003-20250109    clang-17
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250109    gcc-14.2.0
riscv                 randconfig-002-20250109    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250109    gcc-14.2.0
s390                  randconfig-002-20250109    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-14.2.0
sparc64               randconfig-001-20250109    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250109    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250109    clang-19
x86_64      buildonly-randconfig-002-20250109    gcc-12
x86_64      buildonly-randconfig-003-20250109    clang-19
x86_64      buildonly-randconfig-004-20250109    clang-19
x86_64      buildonly-randconfig-005-20250109    clang-19
x86_64      buildonly-randconfig-006-20250109    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

