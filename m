Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0414234BB8
	for <lists+linux-hwmon@lfdr.de>; Fri, 31 Jul 2020 21:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgGaTrC (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 31 Jul 2020 15:47:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:60165 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725767AbgGaTrC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Jul 2020 15:47:02 -0400
IronPort-SDR: bO2FJhRd2EsI9XieMv4BiVIF3TJja+ctaJ7tW2exRXyg8JvcsRT6W0F01zq1z5kHWvQhZ7lN3K
 hrDftPLt6jeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="236723881"
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="236723881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2020 12:47:00 -0700
IronPort-SDR: qBaEML052tdCHwaheOYNRqazZtds7eNGiCg37+AGNG3fdM9RXlgXtw1UzdieIrOX/85nPMCl33
 2LTOG6tG2Dsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,419,1589266800"; 
   d="scan'208";a="305032472"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP; 31 Jul 2020 12:47:00 -0700
Received: from zlukwins-pc.igk.intel.com (zlukwins-pc.igk.intel.com [10.91.127.224])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by linux.intel.com (Postfix) with ESMTPS id 404C958027C;
        Fri, 31 Jul 2020 12:46:59 -0700 (PDT)
From:   Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net,
        Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>
Subject: [PATCH 0/3] Extending hwmon ABI with attributes for rated values
Date:   Fri, 31 Jul 2020 21:37:14 +0200
Message-Id: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch series is about extending hwmon ABI with new attributes
for rated values. All of that is to cover PMBus specification which
provides registers reporting rated values:
PMBus Power System Mgt Protocol Specification - Part II – Revision 1.3.1,
chapters: 22.3.1 - 22.3.10, 22.3.15

Zbigniew Lukwinski (3):
  docs: hwmon: Add attributes to report rated values
  hwmon: (core) Add support for rated attributes
  hwmon: (pmbus/core) Add support for rated attributes

 Documentation/hwmon/pmbus.rst           | 15 ++++++-
 Documentation/hwmon/sysfs-interface.rst | 70 +++++++++++++++++++++++++++++++++
 drivers/hwmon/hwmon.c                   | 10 +++++
 drivers/hwmon/pmbus/pmbus.h             | 13 ++++++
 drivers/hwmon/pmbus/pmbus_core.c        | 49 +++++++++++++++++++----
 include/linux/hwmon.h                   | 20 ++++++++++
 6 files changed, 168 insertions(+), 9 deletions(-)

-- 
2.7.4

