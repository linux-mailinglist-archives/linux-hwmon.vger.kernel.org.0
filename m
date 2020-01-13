Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC76139454
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jan 2020 16:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgAMPIu (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 13 Jan 2020 10:08:50 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58632 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728688AbgAMPIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 10:08:50 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 13 Jan 2020 17:08:48 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 00DF8hqb006851;
        Mon, 13 Jan 2020 17:08:48 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 2/6] hwmon: (pmbus/core) Add support for Intel IMVP9 and AMD 6.25mV modes
Date:   Mon, 13 Jan 2020 15:08:37 +0000
Message-Id: <20200113150841.17670-3-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113150841.17670-1-vadimp@mellanox.com>
References: <20200113150841.17670-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend "vrm_version" with the type for Intel IMVP9 and AMD 6.25mV VID
modes.
Add calculation for those types.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 2bdebd0ea9c1..a7f90e18119c 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -377,7 +377,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_PAGE_VIRTUAL	BIT(31)
 
 enum pmbus_data_format { linear = 0, direct, vid };
-enum vrm_version { vr11 = 0, vr12, vr13 };
+enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
 
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 98226e84b351..811819e41a72 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -709,6 +709,14 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
 		if (val >= 0x01)
 			rv = 500 + (val - 1) * 10;
 		break;
+	case imvp9:
+		if (val >= 0x01)
+			rv = 200 + (val - 1) * 10;
+		break;
+	case amd625mv:
+		if (val >= 0x0 && val <= 0xd8)
+			rv = DIV_ROUND_CLOSEST(155000 - val * 625, 100);
+		break;
 	}
 	return rv;
 }
-- 
2.11.0

