Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432E316F130
	for <lists+linux-hwmon@lfdr.de>; Tue, 25 Feb 2020 22:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbgBYVeB (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 25 Feb 2020 16:34:01 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:59023 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726130AbgBYVeB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Feb 2020 16:34:01 -0500
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 25 Feb 2020 23:33:59 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 01PLXx2q024119;
        Tue, 25 Feb 2020 23:33:59 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [next v4] hwmon: (pmbus/xdpe12284) Add callback for vout limits conversion
Date:   Tue, 25 Feb 2020 23:33:36 +0200
Message-Id: <20200225213336.26527-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Provide read_word_data() callback for overvoltage and undervoltage
output readouts conversion. These registers are presented in
'slinear11' format, while default conversion for 'vout' class for the
devices is 'vid'. It is resulted in wrong conversion in pmbus_reg2data()
for in{3-4}_lcrit and in{3-4}_crit attributes.
)
Fixes: aaafb7c8eb1c ("hwmon: (pmbus) Add support for Infineon Multi-phase xdpe122 family controllers")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
 Comments pointed out by Guenter:
 - Drop reg2data() callback, provide conversion through
   read_word_data() callback instead.
v2->v3:
 Comments pointed out by Guenter:
 - Fix wrong conversion.
 - Add missed returns.
v3->v4
 Fixed by Vadim:
 - Rebase patch for 'hwmon' branch.
---
 drivers/hwmon/pmbus/xdpe12284.c | 54 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index ecd9b65627ec..660556b89e9f 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -18,6 +18,59 @@
 #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
 #define XDPE122_PAGE_NUM		2
 
+static int xdpe122_read_word_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	long val;
+	s16 exponent;
+	s32 mantissa;
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		ret = pmbus_read_word_data(client, page, reg);
+		if (ret < 0)
+			return ret;
+
+		/* Convert register value to LINEAR11 data. */
+		exponent = ((s16)ret) >> 11;
+		mantissa = ((s16)((ret & GENMASK(10, 0)) << 5)) >> 5;
+		val = mantissa * 1000L;
+		if (exponent >= 0)
+			val <<= exponent;
+		else
+			val >>= -exponent;
+
+		/* Convert data to VID register. */
+		switch (info->vrm_version[page]) {
+		case vr13:
+			if (val >= 500)
+				return 1 + DIV_ROUND_CLOSEST(val - 500, 10);
+			return 0;
+		case vr12:
+			if (val >= 250)
+				return 1 + DIV_ROUND_CLOSEST(val - 250, 5);
+			return 0;
+		case imvp9:
+			if (val >= 200)
+				return 1 + DIV_ROUND_CLOSEST(val - 200, 10);
+			return 0;
+		case amd625mv:
+			if (val >= 200 && val <= 1550)
+				return DIV_ROUND_CLOSEST((1550 - val) * 100,
+							 625);
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	default:
+		return -ENODATA;
+	}
+
+	return 0;
+}
+
 static int xdpe122_identify(struct i2c_client *client,
 			    struct pmbus_driver_info *info)
 {
@@ -70,6 +123,7 @@ static struct pmbus_driver_info xdpe122_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
 	.identify = xdpe122_identify,
+	.read_word_data = xdpe122_read_word_data,
 };
 
 static int xdpe122_probe(struct i2c_client *client,
-- 
2.11.0

