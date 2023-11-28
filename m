Return-Path: <linux-hwmon+bounces-237-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0FF7FC2F3
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Nov 2023 19:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7096B282A8F
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 Nov 2023 18:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43DB39AD6;
	Tue, 28 Nov 2023 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+ZzOBPR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56888198D;
	Tue, 28 Nov 2023 10:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701195528; x=1732731528;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gfT5KQfissXiBN9mHghCBzLBOJS2Qjr3rQzIqIxZpLY=;
  b=Q+ZzOBPR7+AJxIMipiD92Bi07slt0+z4xejBK1Q8VmtEbw6Up1fKWxC7
   qYlVBHhQUgfXxH5xYiotCrMMAUMgKf5EgJWaurbVYqofkW8zY8M4Ek3Pt
   u2nxLdlphu3GBrCr7x+eqyfv3SmZQ26bCFwdBBFvydbSO7/khVV1eagcY
   Uptfl9XeunB2VHYvbxNsHw8BfNCJw26CSFJclv/h/DBZvGB2P8mvEoxy/
   jSm1ZA8CieACD4w5ppjbsbULjn5n8hbB+ERafrIXRxdqQ1HQGpraBMPEA
   whP8HtxPN8/XrQpAkU00eD21fW7NQK+AlhBWcOkqTXMZq6LY7oPA6itSD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383375347"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="383375347"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 10:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886494446"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="886494446"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 28 Nov 2023 10:17:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E86BB23E; Tue, 28 Nov 2023 20:06:57 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eric Tremblay <etremblay@distech-controls.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/3] hwmon: tmp513: A few cleanups
Date: Tue, 28 Nov 2023 20:06:01 +0200
Message-ID: <20231128180654.395692-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing special, just a few random cleanups, but there is a dependency
due to closer lines changed.

Andy Shevchenko (3):
  hwmon: tmp513: Don't use "proxy" headers
  hwmon: tmp513: Simplify with dev_err_probe()
  hwmon: tmp513: Use SI constants from units.h

 drivers/hwmon/tmp513.c | 63 ++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


