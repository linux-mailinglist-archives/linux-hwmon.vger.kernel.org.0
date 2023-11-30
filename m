Return-Path: <linux-hwmon+bounces-268-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6DD7FFE0D
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Nov 2023 22:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3270B281722
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Nov 2023 21:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588D15B5A8;
	Thu, 30 Nov 2023 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFbvk5rJ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C8D10DF;
	Thu, 30 Nov 2023 13:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701381234; x=1732917234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=szEhgwh4Idld7dvIWDY2z9wrG2QKjBvPHBigd0PVM6M=;
  b=XFbvk5rJIBsGranFm9lPqGqPKDgMZMjJH9USjnuAUtLV214BHRBAC5oG
   ww0uXvtWUK/yUOs/talrmOIO5m1SJtakF2hNUTFi11lTvv1JszDgpalhp
   MFrJXk/Lt0+35BQzMTUV+n9+PcVA86Hk3rFKQhye2T/3s7vVA17zgYJJ7
   6RixaXmVQ2hykYn3qrkdz76xAaBW7BfWqpOhyY+grdyh3XkwYl7QlCleK
   8qQh3yFuTGJMwH4RVTR9y4YJ9qnWurtiUeIaZfY3WNEBFoXKMQQJnresy
   ktJ2ram43nOOnBrbHml6EtozY5N0/fdMgA/zJkxltUsO/eWOjFh/Ljbor
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="6631891"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="6631891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:53:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="719263954"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="719263954"
Received: from araj-dh-work.jf.intel.com ([10.165.157.158])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 13:53:53 -0800
Date: Thu, 30 Nov 2023 13:51:27 -0800
From: Ashok Raj <ashok_raj@linux.intel.com>
To: Zhang Rui <rui.zhang@intel.com>
Cc: linux@roeck-us.net, jdelvare@suse.com, fenghua.yu@intel.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashok Raj <ashok.raj@intel.com>
Subject: Re: [PATCH 1/3] hwmon: (coretemp) Introduce enum for attr index
Message-ID: <ZWkDQ5y3e4oPONni@araj-dh-work.jf.intel.com>
References: <20231127131651.476795-1-rui.zhang@intel.com>
 <20231127131651.476795-2-rui.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127131651.476795-2-rui.zhang@intel.com>

On Mon, Nov 27, 2023 at 09:16:49PM +0800, Zhang Rui wrote:
> Introduce enum coretemp_attr_index to better describe the index of each
> sensor attribute and the maximum number of basic/possible attributes.
> 
> No functional change.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> ---
>  drivers/hwmon/coretemp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index ba82d1e79c13..6053ed3761c2 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -43,10 +43,18 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
>  #define BASE_SYSFS_ATTR_NO	2	/* Sysfs Base attr no for coretemp */
>  #define NUM_REAL_CORES		128	/* Number of Real cores per cpu */
>  #define CORETEMP_NAME_LENGTH	28	/* String Length of attrs */
> -#define MAX_CORE_ATTRS		4	/* Maximum no of basic attrs */
> -#define TOTAL_ATTRS		(MAX_CORE_ATTRS + 1)
>  #define MAX_CORE_DATA		(NUM_REAL_CORES + BASE_SYSFS_ATTR_NO)
>  
> +enum coretemp_attr_index {
> +	ATTR_LABEL,
> +	ATTR_CRIT_ALARM,
> +	ATTR_TEMP,
> +	ATTR_TJMAX,
> +	ATTR_TTARGET,
> +	TOTAL_ATTRS,			/* Maximum no of possible attrs */
> +	MAX_CORE_ATTRS = ATTR_TJMAX + 1	/* Maximum no of basic attrs */

This seems odd. TOTAL_ATTRS being the last entry seems fine, but defining a
MAX_CORE_ATTR the way above sounds a bit hacky.

> +};
> +
>  #ifdef CONFIG_SMP
>  #define for_each_sibling(i, cpu) \
>  	for_each_cpu(i, topology_sibling_cpumask(cpu))
> -- 
> 2.34.1
> 

