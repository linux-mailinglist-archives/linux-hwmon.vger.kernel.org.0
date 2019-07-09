Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88E6633AA
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jul 2019 11:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfGIJvE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 Jul 2019 05:51:04 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:53276 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGIJvE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 05:51:04 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkmm3-00066V-NF; Tue, 09 Jul 2019 10:50:59 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hkmm3-00025T-Ax; Tue, 09 Jul 2019 10:50:59 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH v1 3/5] hwmon: (lm75) Give write permission to hwmon_chip_update_interval
Date:   Tue,  9 Jul 2019 10:50:50 +0100
Message-Id: <20190709095052.7964-4-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709095052.7964-1-iker.perez@codethink.co.uk>
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

This is needed in order to later be able to write into update_time.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 80a11c33db77..1d4d060bd695 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -179,7 +179,7 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			return 0444;
+			return 0644;
 		}
 		break;
 	case hwmon_temp:
-- 
2.11.0

