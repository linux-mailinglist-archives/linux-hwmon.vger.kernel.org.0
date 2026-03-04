Return-Path: <linux-hwmon+bounces-12076-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v9zaJ4LDp2mYjgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12076-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 06:30:42 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 074D31FADA4
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 06:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BF65301E7C7
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Mar 2026 05:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDAB30E84D;
	Wed,  4 Mar 2026 05:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dEOCLdti"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980B18D636;
	Wed,  4 Mar 2026 05:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602230; cv=none; b=T9ML/p2BaqDcdFySh2+Z+MBtX6BmND1ZqPq5Am9SuQt/YWX/ywWaQdYO4WFr89arQq7gBzdNVy3yZ0j9+NEfXeXAcgvqAJ01rhxboIcXOwZQNQh7QPnbsGRM9cbFcGRLTSYC6UHkeZAr2PTn+iYHsz6SeSrMHXvyTqjBHw/LBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602230; c=relaxed/simple;
	bh=T0PRqwHUal1l7Jzsn2o3ukIkta4gVuZ4lUIBaH1M2n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kryj5U3/RH0WDsjH4kKfltbMMZUhFa6HcsL6k6CUTxJBD+XgY6KF+Lxm+REJjOa/btmx8Aa+mdGlRpx8HmAGuAd9KCmUcDpXNvubaiej5LGqGpIueCAVm13DHHewS8IGtA4d1ImCC9V2d5xJ4nJaNzKVRLMBeZ5UZceL7n2x6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dEOCLdti; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772602226; x=1804138226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T0PRqwHUal1l7Jzsn2o3ukIkta4gVuZ4lUIBaH1M2n0=;
  b=dEOCLdtijMeu6Nm+4CEdYozl3WvtOs4HDqalNpBuMVHJs0Ywnixhf24/
   9ihV3izAALJizS1CFA5U3t7a6quy3kO5gyT2su58tSV+mYGTYEhOd5h4f
   W3shpofmFCoiz3M2M/yO8Nj/D159tbAnvP3KTzyW7y/si2cBE0obPY5Ij
   EMRhySURzggKR1+Y+DvCYkADCDbe56o2vnOs+1t+nsgRmrYjJlJ/RSzu6
   R2g7xO7sW1EYSeEwtcWnJvgppHx+W0sVofe46jHSjO2CuaWlu+KORbLss
   EF4A1rgp7bVw8xRsWJWa7Re8FZwcZI8r9vBcMC9954Pg7TsxP/P6gh1uV
   A==;
X-CSE-ConnectionGUID: 3FijNpEwTvmqzYiDy3ASgQ==
X-CSE-MsgGUID: qWeFyasyQSCwmworQVT3eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84746185"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="84746185"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 21:30:26 -0800
X-CSE-ConnectionGUID: vhIjfLptSZO8a/GdY8/5vQ==
X-CSE-MsgGUID: HAzJVYa2QcyS8ylzqjrbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="248711125"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.127])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 21:30:24 -0800
Date: Wed, 4 Mar 2026 07:30:21 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanman Pradhan <psanman@juniper.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Pradhan, Sanman" <sanman.pradhan@hpe.com>
Subject: Re: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs
 read
Message-ID: <aafDbdT3lptQyt2_@ashevche-desk.local>
References: <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR05MB8708FB8CDA1A57DE77D158A7BA7CA@SA1PR05MB8708.namprd05.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 074D31FADA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12076-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,juniper.net:email,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:00:55AM +0000, Sanman Pradhan wrote:
> From 166d8a9220dc783b752cb212937a31e6e1adc811 Mon Sep 17 00:00:00 2001
> From: Sanman Pradhan <psanman@juniper.net>
> Date: Tue, 3 Mar 2026 16:22:08 -0800
> Subject: [PATCH] hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read

Something went wrong with your email.

Code wise the change LGTM.

> The q54sj108a2_debugfs_read function suffers from a stack buffer overflow
> due to incorrect arguments passed to bin2hex(). The function currently
> passes 'data' as the destination and 'data_char' as the source.
> 
> Because bin2hex() converts each input byte into two hex characters, a
> 32-byte block read results in 64 bytes of output. Since 'data' is only
> 34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end
> of the buffer onto the stack.
> 
> Additionally, the arguments were swapped: it was reading from the
> zero-initialized 'data_char' and writing to 'data', resulting in
> all-zero output regardless of the actual I2C read.
> 
> Fix this by:
> 1. Expanding 'data_char' to 66 bytes to safely hold the hex output.
> 2. Correcting the bin2hex() argument order and using the actual read count.
> 3. Using a pointer to select the correct output buffer for the final
>    simple_read_from_buffer call.

...

> -- 
> 2.34.1
> 
> 
> Thank you.
> 
> Regards,
> Sanman Pradhan

Ah, you copied and pasted the real email into another one. No, please use
proper tooling, exempli gratia `git send-email`.

-- 
With Best Regards,
Andy Shevchenko



