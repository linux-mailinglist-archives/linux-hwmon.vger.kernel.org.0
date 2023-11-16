Return-Path: <linux-hwmon+bounces-92-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB2D7EE897
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Nov 2023 22:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F8FEB20AA4
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Nov 2023 21:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974D445017;
	Thu, 16 Nov 2023 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZpplQUh"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC82393;
	Thu, 16 Nov 2023 13:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700168446; x=1731704446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2gWWnk2VRah5A9Ok0AstpPn9yMDILghUr3W2/GKws0U=;
  b=iZpplQUhJx1L0pk5BO11Sl9Xb+x+9ZujQrK/jEggsERBsCuuOovAZtmz
   JFy1w5dIlMzLW6Pl2A9pe3zFw9rHN6D2vX7E9ePONcHO6nXTbmtfHEZLW
   W3i4stUgVYYpOnC0IuM8a+7h0DmODyugVX62n1lCEab3rpjBc9yNkXmq3
   qDE7qqVQTFthl3zYyFiQfKsHmNHaCC4nEUs7004kXsMwcUU4QXX7U0z3E
   PplaDNNWccEwM2P9o2JbxfSXizMLzT5UZt+BjN4dW+FCsxINzRJvUvZsB
   LV6lxVUMkPRZj4j1gHvzZvXu2M0IHS8EF6lpRyhgPNhnCUcQLiuc30ANI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477402110"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="477402110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 13:00:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1096902518"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="1096902518"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Nov 2023 13:00:41 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3jTa-00023j-1Y;
	Thu, 16 Nov 2023 21:00:38 +0000
Date: Fri, 17 Nov 2023 05:00:28 +0800
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
Message-ID: <202311170437.rhRtUQlh-lkp@intel.com>
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
config: i386-kismet-CONFIG_LEDS_CLASS_MULTICOLOR-CONFIG_SILICOM_PLATFORM-0-0 (https://download.01.org/0day-ci/archive/20231117/202311170437.rhRtUQlh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311170437.rhRtUQlh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311170437.rhRtUQlh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR when selected by SILICOM_PLATFORM
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS_MULTICOLOR
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=n]
     Selected by [y]:
     - SILICOM_PLATFORM [=y] && X86_PLATFORM_DEVICES [=y] && HWMON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

