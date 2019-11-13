Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF084FA397
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Nov 2019 03:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbfKMCKh (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 12 Nov 2019 21:10:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:53584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730178AbfKMB7N (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 20:59:13 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BF4C22474;
        Wed, 13 Nov 2019 01:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610353;
        bh=km4X5vKqo7Inc5aIAMHNteD9crBieiW9GgVbiAH/MyE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UqOA7cT77gwFvbgtLVlipbbM5hCaRHHtUKh1bGP4YVg9x+F0PclPyiezcWZZ/ok/H
         IWJUYhzStcLl5aHdG215YgSftRG4uIVDI2aDr7LBoj3rpbSrxC8vHVgCNvIG2R/Djn
         0gaYLjsfcnhF/fRE0+CEgFYRzmZHmfJf24f4gRvw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 104/115] hwmon: (ina3221) Fix INA3221_CONFIG_MODE macros
Date:   Tue, 12 Nov 2019 20:56:11 -0500
Message-Id: <20191113015622.11592-104-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015622.11592-1-sashal@kernel.org>
References: <20191113015622.11592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Nicolin Chen <nicoleotsuka@gmail.com>

[ Upstream commit 791ebc9d34e9d212fc03742c31654b017d385926 ]

The three INA3221_CONFIG_MODE macros are not correctly defined here.
The MODE3-1 bits are located at BIT 2-0 according to the datasheet.

So this patch just fixes them by shifting all of them with a correct
offset. However, this isn't a crital bug fix as the driver does not
use any of them at this point.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/ina3221.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e6b49500c52ae..8c9555313fc3d 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -38,9 +38,9 @@
 #define INA3221_WARN3			0x0c
 #define INA3221_MASK_ENABLE		0x0f
 
-#define INA3221_CONFIG_MODE_SHUNT	BIT(1)
-#define INA3221_CONFIG_MODE_BUS		BIT(2)
-#define INA3221_CONFIG_MODE_CONTINUOUS	BIT(3)
+#define INA3221_CONFIG_MODE_SHUNT	BIT(0)
+#define INA3221_CONFIG_MODE_BUS		BIT(1)
+#define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
 
 #define INA3221_RSHUNT_DEFAULT		10000
 
-- 
2.20.1

