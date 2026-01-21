Return-Path: <linux-hwmon+bounces-11365-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLUxC+8NcWlEcgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11365-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 18:33:35 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE525A96B
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 18:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7E43AE6340
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1537E4C9019;
	Wed, 21 Jan 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="OhUlxv1j"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com [63.176.194.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D23849250E;
	Wed, 21 Jan 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.176.194.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769008817; cv=none; b=kWe+glW8A42tA7hiCJKdIPoATy/MMVziJ7fHpZUYXjy8CgOTIDkkAG0YjQrcAeJsaFKjWsiENPvDxkck82TI7ylcjUzAem5pusfuDFUEK1egYWDoIDbJLnninPopz11RJ86iVuqyIgDqYEtn/1tnFIZoc0AMNe1CAbEAHfszim0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769008817; c=relaxed/simple;
	bh=qO27uL9zZ+o9v61KUO6CGF6z1TLJMeFnTlhwtmrrULc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LFSMyuYlNGej/yNEE321q9P0Wfc5I3ionE+yrKe0vBMBt1yulARXYsru/1dCpR0/pnW6NyWz3vkk+QkfV0u0eNaGfK+/A2gZwIcmYYvzxcPRvLLzakm9WvjkQ9FMEhJYhpijLu5lRRISCze6EBy3iq7/l5GrUvkFWX23RP1hAl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=OhUlxv1j; arc=none smtp.client-ip=63.176.194.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1769008815; x=1800544815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hFO7A4s2JePRTkdn9h5WE2GYgmdjAN2L9FXVGZvIuZI=;
  b=OhUlxv1j/x5u++I/L/epzDx+zeCOS98kdH7htfAIwYQsX9mW9ycT+kJT
   /hddZ9z4ExqigfOhsf+qaxQKD6bBwTpwSRXc7eu+Ijztyw1DuwpF8eK5g
   W1AYFNyBTtbwCPw2vd+9+4vaiKdVKNLF6d7AXVFKhIcBbgQGmvl2l22he
   QQ1F+iRYoYC906c19i85yst5BPS/EMISDCz39A1lFBzAvqGEkG+c408M2
   3iRhKpDxvzqIxRZUJXz3xtAmjqikoAawqgYj0HrKiWc9ytdzlDCtbG5w/
   nLbmq/FIZKxQZfYIp2NOGFiwCZoDukm8F/euWb2ta4BA1e83f98d7x8NK
   w==;
X-CSE-ConnectionGUID: Uh6DVqPyT2OG2TAPY3O9XQ==
X-CSE-MsgGUID: XKC/OzDjRFyu4iBE1t+FVw==
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208";a="8247390"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 15:19:57 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:7254]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.16.24:2525] with esmtp (Farcaster)
 id c8a7da5c-d2eb-4d46-8d7e-a84c071ce546; Wed, 21 Jan 2026 15:19:57 +0000 (UTC)
X-Farcaster-Flow-ID: c8a7da5c-d2eb-4d46-8d7e-a84c071ce546
Received: from EX19D003EUB004.ant.amazon.com (10.252.51.121) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 21 Jan 2026 15:19:54 +0000
Received: from dev-dsk-almogbs-1b-998410db.eu-west-1.amazon.com
 (172.19.74.107) by EX19D003EUB004.ant.amazon.com (10.252.51.121) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 21 Jan 2026
 15:19:51 +0000
From: Almog Ben Shaul <almogbs@amazon.com>
To: <linux-hwmon@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <itamark@amazon.com>, <talel@amazon.com>,
	<farbere@amazon.com>, <ayalstei@amazon.com>, <dwmw@amazon.com>,
	<almogbs@amazon.com>
Subject: [PATCH 0/2] hwmon: Add JEDEC PMIC50x0 driver for DDR5 PMICs
Date: Wed, 21 Jan 2026 15:19:45 +0000
Message-ID: <20260121151947.37719-1-almogbs@amazon.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D003EUB004.ant.amazon.com (10.252.51.121)
X-Spamd-Result: default: False [-7.46 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[amazon.com,quarantine];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11365-lists,linux-hwmon=lfdr.de];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[almogbs@amazon.com,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-hwmon];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EE525A96B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for JEDEC PMIC50x0 compliant DDR5 Power
Management ICs. These devices provide comprehensive hardware monitoring
capabilities including voltage, current, power, and temperature
monitoring across multiple channels.

The driver implements:
- Voltage monitoring for 4 channels
- Current monitoring for 4 channels
- Power monitoring for 5 channels (including sum)
- Temperature monitoring
- Error detection and reporting with per-error counters

Tested on TI,TPS53830 DDR5 PMICs at I2C addresses 0x4a and 0x4b.

Almog Ben Shaul (2):
  dt-bindings: trivial-devices: Add jedec,pmic50x0
  hwmon: Add JEDEC PMIC50x0 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/pmic50x0.rst              | 113 +++
 MAINTAINERS                                   |   6 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/pmic50x0.c                      | 839 ++++++++++++++++++
 7 files changed, 972 insertions(+)
 create mode 100644 Documentation/hwmon/pmic50x0.rst
 create mode 100644 drivers/hwmon/pmic50x0.c

-- 
2.47.3


