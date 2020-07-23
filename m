Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF2A22A56A
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Jul 2020 04:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731405AbgGWCzP (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 22 Jul 2020 22:55:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:63776 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729401AbgGWCzP (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Jul 2020 22:55:15 -0400
IronPort-SDR: iYW/lERsGvPZWEds7olz5O4cOkFxld3jASdKGAhW56k101PIDo6gPpXpuEvUvwud7v4No6fxGF
 m/s0cby/tl5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="130015926"
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="130015926"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 19:55:14 -0700
IronPort-SDR: yhOPcbu+gtc2D7+GpI66plhJM2PfS6b+FJrfQ7toeRJl6PKek8bfEqQKDaYV0auTaIbGRFcu8c
 KVHALe8VaJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="284427852"
Received: from lkp-server01.sh.intel.com (HELO 7a9a14fb1d52) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jul 2020 19:55:13 -0700
Received: from kbuild by 7a9a14fb1d52 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jyRO4-0000B2-Kt; Thu, 23 Jul 2020 02:55:12 +0000
Date:   Thu, 23 Jul 2020 10:54:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 d653fb84aa5cc7095b816da30cfc2d68fe5101a4
Message-ID: <5f18fbef.vhuwgUKURnkNRqQV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: d653fb84aa5cc7095b816da30cfc2d68fe5101a4  hwmon: (sparx5) Make symbol 's5_temp_match' static

elapsed time: 1925m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm                            zeus_defconfig
sh                ecovec24-romimage_defconfig
arm                       netwinder_defconfig
mips                        nlm_xlr_defconfig
powerpc                        cell_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
