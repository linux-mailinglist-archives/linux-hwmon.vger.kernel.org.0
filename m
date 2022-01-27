Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1349DA49
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Jan 2022 06:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbiA0FjV (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 27 Jan 2022 00:39:21 -0500
Received: from webmail.amiindia.co.in ([14.98.235.2]:59183 "EHLO
        IMSVA.IN.MEGATRENDS.COM" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229801AbiA0FjU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 00:39:20 -0500
Received: from IMSVA.IN.MEGATRENDS.COM (IMSVA.IN.MEGATRENDS.COM [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1EA5782047;
        Thu, 27 Jan 2022 11:20:27 +0530 (IST)
Received: from IMSVA.IN.MEGATRENDS.COM (IMSVA.IN.MEGATRENDS.COM [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF95282046;
        Thu, 27 Jan 2022 11:20:26 +0530 (IST)
Received: from webmail.amiindia.co.in (venus1.in.megatrends.com [10.0.0.5])
        by IMSVA.IN.MEGATRENDS.COM (Postfix) with ESMTPS;
        Thu, 27 Jan 2022 11:20:26 +0530 (IST)
Received: from msgubuntu-OptiPlex-5060.in.megatrends.com (10.0.124.83) by
 VENUS1.in.megatrends.com (10.0.0.5) with Microsoft SMTP Server id 14.3.468.0;
 Thu, 27 Jan 2022 11:09:11 +0530
From:   krishnar4 <krishnar@ami.com>
To:     Krishna Raj <krishnar@ami.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-hwmon@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>,
        Deepak Kodihalli <dkodihalli@nvidia.com>,
        Shakeeb Pasha <spasha@nvidia.com>,
        Vinodhini J <vinodhinij@ami.com>,
        Pravinash Jeyapaul <pravinashj@ami.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH linux dev-5.15] hwmon: (pmbus) modify PSU fan_target convert value to false
Date:   Thu, 27 Jan 2022 11:09:08 +0530
Message-ID: <20220127053908.16587-1-krishnar@ami.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <git-send-email-krishnar@ami.com>
References: <git-send-email-krishnar@ami.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1817-8.6.0.1013-26114.002
X-TM-AS-Result: No--1.662-5.0-31-10
X-imss-scan-details: No--1.662-5.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1817-8.6.1013-26114.002
X-TMASE-Result: 10--1.662300-10.000000
X-TMASE-MatchedRID: 8muszqLoCjtHoOzJ1oF1dqiUivh0j2Pvljgw/8s6b3cHZBaLwEXlKGlF
        7OhYLlctcwePA9FSeTz9k6grZ0shf9zmfZUrwTrUngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
        Wy9W70AEnRE+fI6etkituBDgcniIfegbcIIrT/+G8mBZdhaNLqDiyY/5MU8oBTzs4VfHSjec5fl
        oBUgk06Ga7J9YRB75owdF1Ue2Jr/JPZRTsEKEvt4pebMSk1UmKlmXPgyQocYp5E1G2nFNyeETBf
        0diyKhk7DIVgUu7mCo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Description: PSU can't use sysfs fan_target to control PSU fan duty.

Signed-off-by: krishnar4 <krishnar@ami.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 776ee2237be2..a56c2e1c4079 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1889,7 +1889,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 
 	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
 				  0xff, PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
-				  false, false, true);
+				  false, false, false);
 
 	if (!sensor)
 		return -ENOMEM;
-- 
2.17.1

