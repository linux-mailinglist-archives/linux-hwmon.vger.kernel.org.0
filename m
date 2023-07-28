Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E86766397
	for <lists+linux-hwmon@lfdr.de>; Fri, 28 Jul 2023 07:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjG1FUk (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 28 Jul 2023 01:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjG1FUi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Jul 2023 01:20:38 -0400
Received: from mgamail.intel.com (unknown [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8183B30D6
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 22:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690521637; x=1722057637;
  h=date:from:to:cc:subject:message-id;
  bh=WY7XyBv6MNuLg/AZcF07c4NWUP/phCimJKsNHTp7twg=;
  b=FssTc6JczaWZNaINTe021V877QQDowjhfObs+ujkfHyQUhUVkNpri7gv
   3C2chWWihDWUfuNuf0DjGm/PbLhncQlDN8UZr20Vaym2qOGxBeWO9+r11
   7we8c/XLIcCGYkwnocjQ83Wx26r2jegCQ2Ci10+mrb5OdbBmUbrZsbSU6
   dkeZcmW0+snsvg/hw7A/3yvBmGbKNzpYK68j18HAG4p4lt7BtmLiBP4Ta
   PZpSfzRLxB67mfR8kJVv02SaP9ERAUB8ZZkro4Qa7Rp9XuNBZ3Fg2Toc9
   TPUBFopQf5NfWiMBsaYbRBJpJAh2GWfhirpQ+VetWG1dMxjOH06eOiD/F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="432321461"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="432321461"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 22:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="901088940"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="901088940"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Jul 2023 22:20:33 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qPFtw-0002uR-0s;
        Fri, 28 Jul 2023 05:20:32 +0000
Date:   Fri, 28 Jul 2023 13:20:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a4bb1ce5b9e3ca403c04e20ebeae77fd6447cb11
Message-ID: <202307281329.F3CezhIP-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a4bb1ce5b9e3ca403c04e20ebeae77fd6447cb11  hwmon: Add driver for Renesas HS3001

elapsed time: 727m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230727   gcc  
arc                  randconfig-r021-20230727   gcc  
arc                  randconfig-r034-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230727   gcc  
arm                  randconfig-r026-20230727   clang
arm                  randconfig-r046-20230727   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230727   gcc  
loongarch            randconfig-r032-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r024-20230727   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r035-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r016-20230727   gcc  
parisc               randconfig-r023-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230727   clang
riscv                randconfig-r022-20230727   gcc  
riscv                randconfig-r036-20230727   clang
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230727   clang
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230727   gcc  
sh                   randconfig-r002-20230727   gcc  
sh                   randconfig-r012-20230727   gcc  
sh                   randconfig-r025-20230727   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230727   gcc  
sparc                randconfig-r033-20230727   gcc  
sparc64              randconfig-r025-20230727   gcc  
sparc64              randconfig-r026-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r013-20230727   gcc  
x86_64               randconfig-r031-20230727   clang
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230727   gcc  
xtensa               randconfig-r021-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
