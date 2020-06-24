Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553A4207710
	for <lists+linux-hwmon@lfdr.de>; Wed, 24 Jun 2020 17:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404525AbgFXPQI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 24 Jun 2020 11:16:08 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:5634 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404514AbgFXPQI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Jun 2020 11:16:08 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05OEvgrs023438;
        Wed, 24 Jun 2020 11:15:47 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 31uuqvjesg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Jun 2020 11:15:47 -0400
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 05OFFjte012595
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Wed, 24 Jun 2020 11:15:46 -0400
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Wed, 24 Jun
 2020 08:15:44 -0700
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Wed, 24 Jun 2020 08:15:44 -0700
Received: from localhost.localdomain ([10.48.65.12])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 05OFFdRr023607;
        Wed, 24 Jun 2020 11:15:42 -0400
From:   <alexandru.tachici@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <robh+dt@kernel.org>, <linux@roeck-us.net>,
        Alexandru Tachici <alexandru.tachici@analog.com>
Subject: [PATCH v5 2/7] hwmon: pmbus: adm1266: Add Block process call
Date:   Wed, 24 Jun 2020 18:17:31 +0300
Message-ID: <20200624151736.95785-3-alexandru.tachici@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151736.95785-1-alexandru.tachici@analog.com>
References: <20200624151736.95785-1-alexandru.tachici@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-24_08:2020-06-24,2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 cotscore=-2147483648 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240107
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Alexandru Tachici <alexandru.tachici@analog.com>

PmBus devices support Block Write-Block Read Process
Call described in SMBus specification v 2.0 with the
exception that Block writes and reads are permitted to
have up 255 data bytes instead of max 32 bytes (SMBus).

This patch adds Block WR process call support for ADM1266.

Signed-off-by: Alexandru Tachici <alexandru.tachici@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   |  1 +
 drivers/hwmon/pmbus/adm1266.c | 79 +++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index da34083e1ffd..c04068b665e6 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -28,6 +28,7 @@ config SENSORS_PMBUS
 
 config SENSORS_ADM1266
 	tristate "Analog Devices ADM1266 Sequencer"
+	select CRC8
 	help
 	  If you say yes here you get hardware monitoring support for Analog
 	  Devices ADM1266 Cascadable Super Sequencer.
diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index a7ef048a9a5c..381d89a8569f 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -6,6 +6,7 @@
  * Copyright 2020 Analog Devices Inc.
  */
 
+#include <linux/crc8.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -14,6 +15,82 @@
 
 #include "pmbus.h"
 
+#define ADM1266_PMBUS_BLOCK_MAX		255
+
+DECLARE_CRC8_TABLE(pmbus_crc_table);
+
+/* Different from Block Read as it sends data and waits for the slave to
+ * return a value dependent on that data. The protocol is simply a Write Block
+ * followed by a Read Block without the Read-Block command field and the
+ * Write-Block STOP bit.
+ */
+int pmbus_block_xfer(struct i2c_client *client, u8 cmd, u8 w_len,
+		     u8 *data_w, u8 *data_r)
+{
+	u8 write_buf[ADM1266_PMBUS_BLOCK_MAX + 2];
+	struct i2c_msg msgs[2] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.buf = write_buf,
+			.len = w_len + 2,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = ADM1266_PMBUS_BLOCK_MAX + 2,
+		}
+	};
+	u8 addr = 0;
+	u8 crc = 0;
+	int ret;
+
+	msgs[0].buf[0] = cmd;
+	msgs[0].buf[1] = w_len;
+	memcpy(&msgs[0].buf[2], data_w, w_len);
+
+	msgs[0].buf = i2c_get_dma_safe_msg_buf(&msgs[0], 1);
+	if (!msgs[0].buf)
+		return -ENOMEM;
+
+	msgs[1].buf = i2c_get_dma_safe_msg_buf(&msgs[1], 1);
+	if (!msgs[1].buf) {
+		i2c_put_dma_safe_msg_buf(msgs[0].buf, &msgs[0], false);
+		return -ENOMEM;
+	}
+
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret != 2) {
+		ret = -EPROTO;
+		goto cleanup;
+	}
+
+	if (client->flags & I2C_CLIENT_PEC) {
+		addr = i2c_8bit_addr_from_msg(&msgs[0]);
+		crc = crc8(pmbus_crc_table, &addr, 1, crc);
+		crc = crc8(pmbus_crc_table, msgs[0].buf,  msgs[0].len, crc);
+
+		addr = i2c_8bit_addr_from_msg(&msgs[1]);
+		crc = crc8(pmbus_crc_table, &addr, 1, crc);
+		crc = crc8(pmbus_crc_table, msgs[1].buf,  msgs[1].buf[0] + 1,
+			   crc);
+
+		if (crc != msgs[1].buf[msgs[1].buf[0] + 1]) {
+			ret = -EBADMSG;
+			goto cleanup;
+		}
+	}
+
+	memcpy(data_r, &msgs[1].buf[1], msgs[1].buf[0]);
+	ret = msgs[1].buf[0];
+
+cleanup:
+	i2c_put_dma_safe_msg_buf(msgs[0].buf, &msgs[0], true);
+	i2c_put_dma_safe_msg_buf(msgs[1].buf, &msgs[1], true);
+
+	return ret;
+}
+
 static int adm1266_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -24,6 +101,8 @@ static int adm1266_probe(struct i2c_client *client,
 	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
 			    GFP_KERNEL);
 
+	crc8_populate_msb(pmbus_crc_table, 0x7);
+
 	info->pages = 17;
 	info->format[PSC_VOLTAGE_OUT] = linear;
 	funcs = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
-- 
2.20.1

