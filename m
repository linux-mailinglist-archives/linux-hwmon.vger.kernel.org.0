Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E6215FE57
	for <lists+linux-hwmon@lfdr.de>; Sat, 15 Feb 2020 13:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgBOM0F (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 15 Feb 2020 07:26:05 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46962 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:05 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so4889913pll.13
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=A2U7OTQ3FtscG5Eao9pmn65OIcmgrXJt6TiWaVZ36Z8=;
        b=rQ4mC7RTHz/3n2Jo/vbisXbz/InUSspc3YTDr5+Z2wmR8wi1zH7jz76zTrmuH3aWq3
         jjN/zvYrnlC9n+hVwXR8N+uSB/bygIuwiEjXBpghQw2d5IMKFOQAMMnmgTDZeWI3B1Rz
         C1f1u8gxqGGJ5oMtnPX8pbKUNEOL+y7TsT2k/c0xTjT0NO5hCrTD6IgG1F8rgvFl3/xL
         t/GPwj0kAz/SW6o84x/Mt8Z2XL0Yqv9SexFFzNI+U0CI3Kxilf2PX1/AGx8sqI1TsHRy
         ZsKNXK5ezop9HgzuAaU2bIOUx04i6e7NNxjBCrEgH8adBDKsmgyfdOtBHU9mRtjWlt/4
         CpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=A2U7OTQ3FtscG5Eao9pmn65OIcmgrXJt6TiWaVZ36Z8=;
        b=fjh8C0X4lDzptLZqET3pTZ70fImHXI9gNsEJ4HvxjAC5rdfSVfsdWuNQuv+gAP3rss
         x+h2tzzrpC4wDfvdcrr2C0Nc2E+/B9BVly0bcKLi/LNdVAs1p1/B/tJpJJXfjdAnb4RA
         dBBIt2x2XuUKlcxVsPQCfB39xnH9b3RrS9v1c0pBZVs1sWl3WceS2og4/4svu4LITKGO
         8XCQrgX61d+H7QV8x4dAejwYGiBDah/3n2WA0CQFvLraM54/GhLh5rKyGFMFAGwLls7+
         0Baeu635+56sykf8Ou8YH/a6Es/xHvOxiA206lwbkAuFaLz65/HZFqBJ+Oes+ijnQQLz
         tdxg==
X-Gm-Message-State: APjAAAVViR8yS/NHxxpMcytwAWMWYXoJypWlxjwXo0A8lri/fK1WjWrI
        fEzUqEBkfNmKtTtSTplrZrjBD5/Z
X-Google-Smtp-Source: APXvYqy2vbNnRCO7bKzD5+uqYg0Wyt2J6J13/JMz7AL1vFkiTnvlfG8IthHq5Gh0cXYcHs7w/gs3zg==
X-Received: by 2002:a17:902:740c:: with SMTP id g12mr8271187pll.166.1581769564587;
        Sat, 15 Feb 2020 04:26:04 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s206sm10791620pfs.100.2020.02.15.04.26.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:04 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 1/8] hwmon: (pmbus) Add IC_DEVICE_ID and IC_DEVICE_REV command definitions
Date:   Sat, 15 Feb 2020 04:25:55 -0800
Message-Id: <20200215122602.14245-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Recent PMBus versions added IC_DEVICE_ID and IC_DEVICE_REV commands as
additional means to identify the chip. Add command definitions to
pmbus.h include file.

Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 13b34bd67f23..cbc47af732c2 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -119,6 +119,9 @@ enum pmbus_regs {
 	PMBUS_MFR_DATE			= 0x9D,
 	PMBUS_MFR_SERIAL		= 0x9E,
 
+	PMBUS_IC_DEVICE_ID		= 0xAD,
+	PMBUS_IC_DEVICE_REV		= 0xAE,
+
 /*
  * Virtual registers.
  * Useful to support attributes which are not supported by standard PMBus
-- 
2.17.1

