Return-Path: <linux-hwmon+bounces-78-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4497EDB6A
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Nov 2023 07:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BAC1C20403
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Nov 2023 06:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB5DD2F6;
	Thu, 16 Nov 2023 06:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1PxAmYN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAE48F;
	Wed, 15 Nov 2023 22:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700114684; x=1731650684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KABAEVgFZrxu2pEBhbPGDF1wNMsDX0OcmGmgAPEJroU=;
  b=Y1PxAmYNAyiXJdPmfl1P6dHGFAFLk1ysaXswdammE2zLzleDaoLEj4t0
   bI4NFJCw05swvxGQRoM63VqRlNNv2rvT/ZMnhICK/MHGO09U7swzLm87G
   cP5GFbsMV2ELasdhM1ppq1tn/LsYKX/snvOXbsTDzXxg5U/cr2Xv6Gyqk
   LD7PzGuo52wy7I5ORkRoiPaWMC/GMGIfh7DAak3y+h5Y/0VRzu5mFoqND
   LYsRnbwc0+FcdAJ3nGDySuy12OpKFYJoAkXp3Ok6j6LyrVKuXpQjwNk6h
   tBcpBiitdOOpGi8LOayTKgqOtMDhOciU432jBxmwnIZsnUGEfAyvYxUu9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12578878"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="12578878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 22:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758722570"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="758722570"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 22:04:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3VUS-0001Mv-0Y;
	Thu, 16 Nov 2023 06:04:36 +0000
Date: Thu, 16 Nov 2023 14:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: Henry Shi <henryshi2018@gmail.com>, hbshi69@hotmail.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	hdegoede@redhat.com, markgross@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, hb_shi2003@yahoo.com,
	henrys@silicom-usa.com, wenw@silicom-usa.com
Subject: Re: [PATCH v12] platform/x86: Add Silicom Platform Driver
Message-ID: <202311161352.CCZ1uNtB-lkp@intel.com>
References: <20231113210216.30237-1-henryshi2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113210216.30237-1-henryshi2018@gmail.com>

Hi Henry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on linus/master tip/auto-latest v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Shi/platform-x86-Add-Silicom-Platform-Driver/20231114-050431
base:   tip/master
patch link:    https://lore.kernel.org/r/20231113210216.30237-1-henryshi2018%40gmail.com
patch subject: [PATCH v12] platform/x86: Add Silicom Platform Driver
config: i386-kismet-CONFIG_LEDS_CLASS_MULTICOLOR-CONFIG_SILICOM_PLATFORM-0-0 (https://download.01.org/0day-ci/archive/20231116/202311161352.CCZ1uNtB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161352.CCZ1uNtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161352.CCZ1uNtB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR when selected by SILICOM_PLATFORM
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=n]
     Selected by [y]:
     - SILICOM_PLATFORM [=y] && X86_PLATFORM_DEVICES [=y] && HWMON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

