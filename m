Return-Path: <linux-hwmon+bounces-13752-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8wquE6mp92nckQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13752-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 03 May 2026 22:01:45 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 922614B7342
	for <lists+linux-hwmon@lfdr.de>; Sun, 03 May 2026 22:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 659FA3005145
	for <lists+linux-hwmon@lfdr.de>; Sun,  3 May 2026 20:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CBC1ACEDE;
	Sun,  3 May 2026 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ql8cHNjM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA201A681B
	for <linux-hwmon@vger.kernel.org>; Sun,  3 May 2026 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777838501; cv=none; b=jcb/JGndFrEBWcLMFfdm5wSiNdtO2plQgDLtVktmR/Jw4ddENFiC4EEHIjCWHeNCYx81sUcztk28EroH0+S/Z/Tu8NDrErggONInYlKWUd3XPnbwKIHUuVPRU1T28CJkRdJGguqhbsRk2sfr3NKawRtEfU2gRzMp/VtXFgD7wjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777838501; c=relaxed/simple;
	bh=3+JcXs0DU7Vca0rgkUCDmOVs2bqxPQPXGSWgClLDbaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ksWUbP97ORvx0uBYALjsYHSGc4v2DiGfwx6nAWEiU/f3JsUnpJ6tIq9jLR7RDQbSHsFs/8uqrDaJ8tBzTzZo8eJrbiN4K7u+muLu2EC6dXEpe+LS4k1ZcBuMg0UNhVhToCVmT4xSY0A8NanC1FSZm1F4hDA3XEtwVSBK3M9rZXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ql8cHNjM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777838500; x=1809374500;
  h=date:from:to:cc:subject:message-id;
  bh=3+JcXs0DU7Vca0rgkUCDmOVs2bqxPQPXGSWgClLDbaY=;
  b=Ql8cHNjM/my3EuKj2UYY36h3cJF08fHWUsKJ+SF9oca4Hkq3QxxOCECC
   5mPTSTtIZRJM2sY8kcpFxVU484TyzFVzNhVDieUlY8KjBg7WZ1ViToxHJ
   FxELWRM8FD4kJ9n/CBDude4tAvcxaWCBbzi4RzfAof2zc6FFmx7+HXBL8
   U/Zmw5PW8MgFm2qdGD6GlkXRMe3j9djVdZ8lO+T4YGEG/15Cj3U9iNLvD
   lvscLvmWGYdKfsKZ5ui8JGiSRZRo905VhVoo3t7nETxNCa0y8ezrbc0ZG
   fMn4SHl6Y3pR7TMVYi3bsMqVPuADR2zCvpqcdsSr0Vlo2MX5ZsIk3Fo4R
   w==;
X-CSE-ConnectionGUID: KqF8wLegSMytFkPXO6Y19g==
X-CSE-MsgGUID: N/PqyS60R0K2pYkW7sPdUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82322675"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="82322675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 13:01:40 -0700
X-CSE-ConnectionGUID: Pz3+96K1Sl+wrsY5z3YR6A==
X-CSE-MsgGUID: qG+9GyYiRyiZwuRchQXbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="258698515"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 13:01:35 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJd0G-000000002yv-0IWq;
	Sun, 03 May 2026 20:01:28 +0000
Date: Mon, 04 May 2026 04:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 30e6206b116294204dc0950a0b2f469257b36ad6
Message-ID: <202605040403.p1NCxtgw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 922614B7342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13752-lists,linux-hwmon=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 30e6206b116294204dc0950a0b2f469257b36ad6  hwmon: (ads7871) Use DMA-safe buffer for SPI writes

elapsed time: 1152m

configs tested: 278
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                            randconfig-001    gcc-8.5.0
arc                   randconfig-001-20260503    gcc-10.5.0
arc                   randconfig-001-20260503    gcc-8.5.0
arc                            randconfig-002    gcc-8.5.0
arc                   randconfig-002-20260503    gcc-10.5.0
arc                   randconfig-002-20260503    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            randconfig-001    gcc-8.5.0
arm                   randconfig-001-20260503    gcc-10.5.0
arm                   randconfig-001-20260503    gcc-8.5.0
arm                            randconfig-002    gcc-8.5.0
arm                   randconfig-002-20260503    gcc-10.5.0
arm                   randconfig-003-20260503    gcc-10.5.0
arm                   randconfig-003-20260503    gcc-8.5.0
arm                            randconfig-004    gcc-8.5.0
arm                   randconfig-004-20260503    gcc-10.5.0
arm                   randconfig-004-20260503    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                          randconfig-001    gcc-15.2.0
arm64                 randconfig-001-20260503    gcc-15.2.0
arm64                 randconfig-001-20260504    gcc-15.2.0
arm64                          randconfig-002    gcc-15.2.0
arm64                 randconfig-002-20260503    gcc-15.2.0
arm64                 randconfig-002-20260504    gcc-15.2.0
arm64                          randconfig-003    gcc-15.2.0
arm64                 randconfig-003-20260503    gcc-15.2.0
arm64                 randconfig-003-20260504    gcc-15.2.0
arm64                          randconfig-004    gcc-15.2.0
arm64                 randconfig-004-20260503    gcc-15.2.0
arm64                 randconfig-004-20260504    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                           randconfig-001    gcc-15.2.0
csky                  randconfig-001-20260503    gcc-15.2.0
csky                  randconfig-001-20260504    gcc-15.2.0
csky                           randconfig-002    gcc-15.2.0
csky                  randconfig-002-20260503    gcc-15.2.0
csky                  randconfig-002-20260504    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon                        randconfig-001    gcc-11.5.0
hexagon               randconfig-001-20260503    clang-23
hexagon               randconfig-001-20260503    gcc-11.5.0
hexagon               randconfig-001-20260504    clang-23
hexagon                        randconfig-002    gcc-11.5.0
hexagon               randconfig-002-20260503    clang-23
hexagon               randconfig-002-20260503    gcc-11.5.0
hexagon               randconfig-002-20260504    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                 buildonly-randconfig-001    clang-20
i386        buildonly-randconfig-001-20260503    clang-20
i386                 buildonly-randconfig-002    clang-20
i386        buildonly-randconfig-002-20260503    clang-20
i386                 buildonly-randconfig-003    clang-20
i386        buildonly-randconfig-003-20260503    clang-20
i386                 buildonly-randconfig-004    clang-20
i386        buildonly-randconfig-004-20260503    clang-20
i386                 buildonly-randconfig-005    clang-20
i386        buildonly-randconfig-005-20260503    clang-20
i386                 buildonly-randconfig-006    clang-20
i386        buildonly-randconfig-006-20260503    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260503    clang-20
i386                  randconfig-002-20260503    clang-20
i386                  randconfig-003-20260503    clang-20
i386                  randconfig-004-20260503    clang-20
i386                  randconfig-005-20260503    clang-20
i386                  randconfig-006-20260503    clang-20
i386                  randconfig-007-20260503    clang-20
i386                           randconfig-011    clang-20
i386                  randconfig-011-20260503    clang-20
i386                           randconfig-012    clang-20
i386                  randconfig-012-20260503    clang-20
i386                           randconfig-013    clang-20
i386                  randconfig-013-20260503    clang-20
i386                           randconfig-014    clang-20
i386                  randconfig-014-20260503    clang-20
i386                           randconfig-015    clang-20
i386                  randconfig-015-20260503    clang-20
i386                           randconfig-016    clang-20
i386                  randconfig-016-20260503    clang-20
i386                           randconfig-017    clang-20
i386                  randconfig-017-20260503    clang-20
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                      randconfig-001    gcc-11.5.0
loongarch             randconfig-001-20260503    clang-23
loongarch             randconfig-001-20260503    gcc-11.5.0
loongarch             randconfig-001-20260504    clang-23
loongarch                      randconfig-002    gcc-11.5.0
loongarch             randconfig-002-20260503    clang-23
loongarch             randconfig-002-20260503    gcc-11.5.0
loongarch             randconfig-002-20260504    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                          randconfig-001    gcc-11.5.0
nios2                 randconfig-001-20260503    clang-23
nios2                 randconfig-001-20260503    gcc-11.5.0
nios2                 randconfig-001-20260504    clang-23
nios2                          randconfig-002    gcc-11.5.0
nios2                 randconfig-002-20260503    clang-23
nios2                 randconfig-002-20260503    gcc-11.5.0
nios2                 randconfig-002-20260504    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260503    gcc-15.2.0
parisc                randconfig-001-20260504    gcc-13.4.0
parisc                randconfig-002-20260503    gcc-15.2.0
parisc                randconfig-002-20260504    gcc-13.4.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260503    gcc-15.2.0
powerpc               randconfig-001-20260504    gcc-13.4.0
powerpc               randconfig-002-20260503    gcc-15.2.0
powerpc               randconfig-002-20260504    gcc-13.4.0
powerpc64             randconfig-001-20260503    gcc-15.2.0
powerpc64             randconfig-001-20260504    gcc-13.4.0
powerpc64             randconfig-002-20260503    gcc-15.2.0
powerpc64             randconfig-002-20260504    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260503    clang-23
riscv                 randconfig-001-20260504    gcc-8.5.0
riscv                 randconfig-002-20260503    clang-23
riscv                 randconfig-002-20260504    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260503    clang-23
s390                  randconfig-001-20260504    gcc-8.5.0
s390                  randconfig-002-20260503    clang-23
s390                  randconfig-002-20260504    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260503    clang-23
sh                    randconfig-001-20260504    gcc-8.5.0
sh                    randconfig-002-20260503    clang-23
sh                    randconfig-002-20260504    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260503    gcc-15.2.0
sparc                 randconfig-001-20260504    gcc-8.5.0
sparc                 randconfig-002-20260503    gcc-15.2.0
sparc                 randconfig-002-20260504    gcc-8.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260503    gcc-15.2.0
sparc64               randconfig-001-20260504    gcc-8.5.0
sparc64               randconfig-002-20260503    gcc-15.2.0
sparc64               randconfig-002-20260504    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260503    gcc-15.2.0
um                    randconfig-001-20260504    gcc-8.5.0
um                    randconfig-002-20260503    gcc-15.2.0
um                    randconfig-002-20260504    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260503    clang-20
x86_64      buildonly-randconfig-002-20260503    clang-20
x86_64      buildonly-randconfig-003-20260503    clang-20
x86_64      buildonly-randconfig-004-20260503    clang-20
x86_64      buildonly-randconfig-005-20260503    clang-20
x86_64      buildonly-randconfig-006-20260503    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    clang-20
x86_64                randconfig-001-20260503    clang-20
x86_64                         randconfig-002    clang-20
x86_64                randconfig-002-20260503    clang-20
x86_64                         randconfig-003    clang-20
x86_64                randconfig-003-20260503    clang-20
x86_64                         randconfig-004    clang-20
x86_64                randconfig-004-20260503    clang-20
x86_64                         randconfig-005    clang-20
x86_64                randconfig-005-20260503    clang-20
x86_64                         randconfig-006    clang-20
x86_64                randconfig-006-20260503    clang-20
x86_64                         randconfig-011    clang-20
x86_64                randconfig-011-20260503    clang-20
x86_64                         randconfig-012    clang-20
x86_64                randconfig-012-20260503    clang-20
x86_64                         randconfig-013    clang-20
x86_64                randconfig-013-20260503    clang-20
x86_64                         randconfig-014    clang-20
x86_64                randconfig-014-20260503    clang-20
x86_64                         randconfig-015    clang-20
x86_64                randconfig-015-20260503    clang-20
x86_64                         randconfig-016    clang-20
x86_64                randconfig-016-20260503    clang-20
x86_64                randconfig-071-20260503    clang-20
x86_64                randconfig-072-20260503    clang-20
x86_64                randconfig-073-20260503    clang-20
x86_64                randconfig-074-20260503    clang-20
x86_64                randconfig-075-20260503    clang-20
x86_64                randconfig-076-20260503    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260503    gcc-15.2.0
xtensa                randconfig-001-20260504    gcc-8.5.0
xtensa                randconfig-002-20260503    gcc-15.2.0
xtensa                randconfig-002-20260504    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

