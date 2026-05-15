Return-Path: <linux-hwmon+bounces-14118-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB6RBzvlBmoHowIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14118-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 11:19:55 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3009054C479
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 11:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1ADCE3047A87
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2026 08:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5007C426D20;
	Fri, 15 May 2026 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwdJwuu3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B541426D17
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 08:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835485; cv=none; b=B+9PKzZ2mEo5la70X0/0GxSm5uyzMPYQjSSjsFlmS/k6jAVH/fekQ5HwppdUIx+KVld/e0GFB09/ThUMx/tJ8zvkMdmYi3ULv4+5jSUFmERv9fikra7ZZRuFmlMUQYnQ+Nm+cAtH9vIW3uQZhTY9ftZt7zUEzrzw0fLbcXgW99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835485; c=relaxed/simple;
	bh=dyP4n9uPfOXLtZxIOJmI/uU/nI5UYjP6DCnh6DbN2Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XC8qy5UeiehWCfCWFXdu3KDKEOzl5sUP0GvLxRI6IFuLoTXnJVZjosVY1ic+yjaAa2muGVGrMxMnVzefD2Vi7hI3uSbBUjHNDo6oQYw4lbxF1GymAcEn8tUORc+Drms1xUAY5RSNOjsE+MiKU6r99cyZkBc25jn2X8nRlLgVaTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwdJwuu3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2babfd18435so45276755ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778835483; x=1779440283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JI5rbOuDA7OsqPK6rS6KZm2RpgqeyURJ5czLB7dxhv4=;
        b=IwdJwuu3fbspKY4M46qwfE07A8WvFOSz4mMgl34oOxhRdGNhwzqBAkAzgmDJONgcWO
         /rfrYcNtRiGEnyAdrmqYH84LLCQeREjdpE0zwj5994JUXOoj/DAkMppV2j5NZuXIPy/Z
         CAFd7/E9sd+mjo+k5Nh9NvOcNjYIuF/OZ+Fisj83doFwXoSObViUphY97xLhYncQSPUL
         VVtx2JdUsemqY9xKlxSj8mwZz7fPIlHoJFxZea9sY4qW5mhQiYPX7IhVOIB7DpFKo0sY
         igrikZblRT7S9fnn8mpMayBfG/pL35ZYWfBObHkmDZ5RJKXklCdxeH9Bg0OAftjaCVKH
         F+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835483; x=1779440283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JI5rbOuDA7OsqPK6rS6KZm2RpgqeyURJ5czLB7dxhv4=;
        b=EyfFa/VMKlfFhfEckSvZ45LiNgHsp6ihxZjv9HUeaI0r6c//fKVxtySk1EV82iQtIn
         RDZNLVZuOy7oyV8oa4aQoJ0kN1a5ntMxtWPl70ZJbanYdjUVszlziUkCvpY1eGZxWwZ6
         rslL5YXTf5QoXb0tP5W7LCtE8sKB76w29oXgXoBGkdQbZDEXbdZSvJJHGfNixmxTRZGc
         8DK0GADBQo0jMwVSWNZJWCiB2LeCmdRqLk0xEFCYnV+Q/LBtAb4KXEai2qCk4enMhunF
         gFcfl5mKhZtn3BuX1VuM8kgT5Z3fbjcPgmVZRih4gpg17N5dSHJKwJ9OtH4Sc4trJ7un
         P06Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EXH4xFapyR6DuUui1ayMFTf/W4R0A/O+sOnYxh0bsum7YlRbqkaxMcwV/0bzRWnwDwBPmKcpzsv0YvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2y2gqeV826GYWIpJvGsPZLHv7VlgdfJAHfSQiR5VnMCndrR6
	Y1ZZqMYJfKFbqxXAYRL3ivf2PLjBPz9nNI/4rtPF+MJ+5LqqphPnkHYi
X-Gm-Gg: Acq92OFifG5Gj4TTGfGwehWFf+JOgMXKhi401KbLNwaZWh+FaGPSiaFp5tIC5wiR2Vl
	l8ZSWvGg35JD2WmEWn4kLJoEVWJMNiExEzEFEfQyvO/YwiXXfd1EtAMx5d/QkwXeuoSTi/4FCYG
	SF6s3iIryt/2GrwjsVMleEL84I7LdyqOFrDn3BGYwzzvNow1Ad+4v2GWH6/+LjpgrnkZmYz3CDL
	xE12I+L1YSEPLAfPp8XyjD9pX2WPO5fqG6slToeNmxIhopPWS98mxxQPmf8yh7y4CR73DeUOPUH
	sUZMfQrayGVr7MCrL613lsNyVB7elHkgBpJmxsJ3Nt2OD/CP9w6uVss4u7GfLQ9Iyts7BVt9Ykt
	sT0F7sIWxdUZ6eKnAftfmZbcBk5x4RS1fFmrCtKdJygtCSEWs8fkz+uq+S2xgzjIVVcdKIUweUK
	a6lwUVQelkFGI2oKVIwejwsy7LvwtuX227sdrBhwP3pZJA5DJd32QE9P1H3D2Y1QnXew==
X-Received: by 2002:a17:903:390b:b0:2bd:1903:6ced with SMTP id d9443c01a7336-2bd7e93cf74mr34268585ad.41.1778835482629;
        Fri, 15 May 2026 01:58:02 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6512sm52249325ad.52.2026.05.15.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:58:02 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v4 0/1] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Fri, 15 May 2026 16:57:45 +0800
Message-Id: <20260515085746.114361-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3009054C479
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14118-lists,linux-hwmon=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-hwmon@vger.kernel.org]
X-Rspamd-Action: no action

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

Changes since version 3:
- Remove redundant module type macro definitions from sub-device drivers
  that are now provided by the shared header <linux/mfd/nct6694.h>,
  fixing -Wmacro-redefined warnings.

Changes since version 2:
- Restore per-device IDA and mfd_add_hotplug_devices()/PLATFORM_DEVID_AUTO
  to avoid child device ID conflicts with multiple NCT6694 chips.
- Validate irq_find_mapping() return value before dispatching IRQs.
- Check superio_enter() return value in nct6694_irq_init().

Changes since version 1:
- Reworked the Super-I/O access helpers.

Ming Yu (1):
  mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

 MAINTAINERS                         |   1 +
 drivers/gpio/gpio-nct6694.c         |   7 -
 drivers/hwmon/nct6694-hwmon.c       |  21 -
 drivers/i2c/busses/i2c-nct6694.c    |   7 -
 drivers/mfd/Kconfig                 |  47 +-
 drivers/mfd/Makefile                |   3 +-
 drivers/mfd/nct6694-hif.c           | 663 ++++++++++++++++++++++++++++
 drivers/mfd/nct6694.c               | 111 +++--
 drivers/net/can/usb/nct6694_canfd.c |   6 -
 drivers/rtc/rtc-nct6694.c           |   7 -
 drivers/watchdog/nct6694_wdt.c      |   7 -
 include/linux/mfd/nct6694.h         |  54 ++-
 12 files changed, 813 insertions(+), 121 deletions(-)
 create mode 100644 drivers/mfd/nct6694-hif.c

-- 
2.34.1


