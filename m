Return-Path: <linux-hwmon+bounces-14732-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AAciJMB0ImqYXgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14732-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 09:03:28 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD43C645BE6
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 09:03:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=jGkmUauh;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14732-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14732-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0954B3008231
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 06:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EA74279E9;
	Fri,  5 Jun 2026 06:54:15 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD3413245;
	Fri,  5 Jun 2026 06:54:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642455; cv=none; b=P8y0M+jWBcUyU71hPriy68NzywdYo02xxBPRO+7X3q6dU+Z6NKBAcF7e7KVTP/yEVU5dRVR2Vs3bVj/Z2QVXKsuOVqXfNgNil7KB5M2+vyrH5ZZID2WGRm5x0avFHy0EeJmcKHZEwXn+6hTq35MfuDqUII8Ikpzc0P6H+sXzpEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642455; c=relaxed/simple;
	bh=Bfhxyeh0I+nLYaM2G8L9iOBrMI/5fCXfZhtYUW4UmJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRLAOcsYGOKBZHE2+4zcXWzFBqOAFHOZYvPLv7sWZzICwYG4u1KXUl1OjEaTbzvq0HotSCPu6I+5EqbrIVM4i4Jc3KYsPV0oZHzZ4p0gCS8sIINEkwAslJ2O9P9UaErUEUm8r2mnmHNre+CkxsiuXi5Fi3fRgHAtze1d+anlDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGkmUauh; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780642455; x=1812178455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfhxyeh0I+nLYaM2G8L9iOBrMI/5fCXfZhtYUW4UmJY=;
  b=jGkmUauhpQllDyd4WzK+AsTEOcZoUXdOAKQFYjpE5kk5EAdE1HVpqfBy
   r9pDMlUNkr9ih9uYvzfrPQFYa7N3cdhMUMN/vm88zZDzrLZtg8hx2OowR
   fdTrs7klng3ecvsfzNauJZ7z6NFnlWVluixzblvjL5kyiWHrH4A+NlPV6
   apGR2+UyV6HVdBS/wURk9a0Y2rv4hHxUjlO8v/+Gxnbtu+ZV0opQeik5H
   909bOPPiUOkzb5qYfvdhLzEHcINFx8UO3Sl7yfoH3B/R8hOZrIHKIGIz7
   mVCx6PQBUTjsVKudRzhqIfJSea3bVoasJaKPRQfsOkXwle6YelHJ1YX42
   g==;
X-CSE-ConnectionGUID: Eniqpp1aQhCKaaz/J41XOA==
X-CSE-MsgGUID: vIH7jGkJQueSVo867jDpuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81474441"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81474441"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:54:14 -0700
X-CSE-ConnectionGUID: igsVH0E/Q920RoFFPu5r2g==
X-CSE-MsgGUID: Mv2TdVCjQlahbFrWexy6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238412207"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 23:54:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVORU-000000002Uv-18Ka;
	Fri, 05 Jun 2026 06:54:08 +0000
Date: Fri, 5 Jun 2026 08:54:01 +0200
From: kernel test robot <lkp@intel.com>
To: Adam Young <admiyo@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Message-ID: <202606050825.2uv1FZrY-lkp@intel.com>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14732-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[os.amperecomputing.com,kernel.org,gmail.com,intel.com];
	FORGED_RECIPIENTS(0.00)[m:admiyo@os.amperecomputing.com,m:sudeep.holla@kernel.org,m:jassisinghbrar@gmail.com,m:rafael@kernel.org,m:saket.dumbre@intel.com,m:lenb@kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:andi.shyti@kernel.org,m:linux@roeck-us.net,m:lihuisong@huawei.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,01.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,git-scm.com:url,intel.com:mid,intel.com:dkim,intel.com:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD43C645BE6

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jassibrar-mailbox/for-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v6.16-rc1 next-20260604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Young/mailbox-pcc-c-add-query-channel-function/20260605-044323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20260604203749.168752-1-admiyo%40os.amperecomputing.com
patch subject: [PATCH v01] mailbox/pcc.c:  add query channel function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260605/202606050825.2uv1FZrY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050825.2uv1FZrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050825.2uv1FZrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

