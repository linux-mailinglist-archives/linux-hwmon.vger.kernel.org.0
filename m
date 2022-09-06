Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79AE5AE2BD
	for <lists+linux-hwmon@lfdr.de>; Tue,  6 Sep 2022 10:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238569AbiIFIe7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 6 Sep 2022 04:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbiIFIev (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 04:34:51 -0400
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8B52EF01;
        Tue,  6 Sep 2022 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1662453291; x=1693989291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oyi6EGS0RoM4Eyx6YSslJOyRtutK7naD8OnMXFnZelk=;
  b=tAILHJisJwlYQukAC8klmFgFKHYGso4KOFPgwkmJKuwMwB0eA1Amkk/g
   HIRCfqbq0w014tkopHZeA+AJ+UpgmeR7brVkEUdzOGDqbpuUp3uww3pxe
   9LhGjmxxGbDgITs/lqC1jPlL/dYmF5Y8Mctgc7Ff/Y6fSexVeg1aQbczC
   E=;
X-IronPort-AV: E=Sophos;i="5.93,293,1654560000"; 
   d="scan'208";a="237979512"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-41c1ef8b.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 08:34:41 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1e-41c1ef8b.us-east-1.amazon.com (Postfix) with ESMTPS id 37B041609B4;
        Tue,  6 Sep 2022 08:34:37 +0000 (UTC)
Received: from EX19D013UWB004.ant.amazon.com (10.13.138.62) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 6 Sep 2022 08:33:59 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D013UWB004.ant.amazon.com (10.13.138.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.12; Tue, 6 Sep 2022 08:33:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Tue, 6 Sep 2022 08:33:58 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id C8C5E4D78; Tue,  6 Sep 2022 08:33:56 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <rtanwar@maxlinear.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        <andriy.shevchenko@intel.com>
Subject: [PATCH v4 06/21] hwmon: (mr75203) fix multi-channel voltage reading
Date:   Tue, 6 Sep 2022 08:33:41 +0000
Message-ID: <20220906083356.21067-7-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906083356.21067-1-farbere@amazon.com>
References: <20220906083356.21067-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix voltage allocation and reading to support all channels in all VMs.
Prior to this change allocation and reading were done only for the first
channel in each VM.
This change counts the total number of channels for allocation, and takes
into account the channel offset when reading the sample data register.

Fixes: 9d823351a337 ("hwmon: Add hardware monitoring driver for Moortec MR75203 PVT controller")
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V4 -> V3:
- Keep lines sorted according to length.

V3 -> V2:
- Remove configuration of ip-polling register to a separate commit.
- Explain the fix.

 drivers/hwmon/mr75203.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index 78dc471e843c..69f38c05b02d 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -68,8 +68,9 @@
 
 /* VM Individual Macro Register */
 #define VM_COM_REG_SIZE	0x200
-#define VM_SDIF_DONE(n)	(VM_COM_REG_SIZE + 0x34 + 0x200 * (n))
-#define VM_SDIF_DATA(n)	(VM_COM_REG_SIZE + 0x40 + 0x200 * (n))
+#define VM_SDIF_DONE(vm)	(VM_COM_REG_SIZE + 0x34 + 0x200 * (vm))
+#define VM_SDIF_DATA(vm, ch)	\
+	(VM_COM_REG_SIZE + 0x40 + 0x200 * (vm) + 0x4 * (ch))
 
 /* SDA Slave Register */
 #define IP_CTRL			0x00
@@ -115,6 +116,7 @@ struct pvt_device {
 	u32			t_num;
 	u32			p_num;
 	u32			v_num;
+	u32			c_num;
 	u32			ip_freq;
 	u8			*vm_idx;
 };
@@ -178,14 +180,15 @@ static int pvt_read_in(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct pvt_device *pvt = dev_get_drvdata(dev);
 	struct regmap *v_map = pvt->v_map;
+	u8 vm_idx, ch_idx;
 	u32 n, stat;
-	u8 vm_idx;
 	int ret;
 
-	if (channel >= pvt->v_num)
+	if (channel >= pvt->v_num * pvt->c_num)
 		return -EINVAL;
 
-	vm_idx = pvt->vm_idx[channel];
+	vm_idx = pvt->vm_idx[channel / pvt->c_num];
+	ch_idx = channel % pvt->c_num;
 
 	switch (attr) {
 	case hwmon_in_input:
@@ -196,7 +199,7 @@ static int pvt_read_in(struct device *dev, u32 attr, int channel, long *val)
 		if (ret)
 			return ret;
 
-		ret = regmap_read(v_map, VM_SDIF_DATA(vm_idx), &n);
+		ret = regmap_read(v_map, VM_SDIF_DATA(vm_idx, ch_idx), &n);
 		if (ret < 0)
 			return ret;
 
@@ -499,8 +502,8 @@ static int pvt_reset_control_deassert(struct device *dev, struct pvt_device *pvt
 
 static int mr75203_probe(struct platform_device *pdev)
 {
+	u32 ts_num, vm_num, pd_num, ch_num, val, index, i;
 	const struct hwmon_channel_info **pvt_info;
-	u32 ts_num, vm_num, pd_num, val, index, i;
 	struct device *dev = &pdev->dev;
 	u32 *temp_config, *in_config;
 	struct device *hwmon_dev;
@@ -541,9 +544,11 @@ static int mr75203_probe(struct platform_device *pdev)
 	ts_num = (val & TS_NUM_MSK) >> TS_NUM_SFT;
 	pd_num = (val & PD_NUM_MSK) >> PD_NUM_SFT;
 	vm_num = (val & VM_NUM_MSK) >> VM_NUM_SFT;
+	ch_num = (val & CH_NUM_MSK) >> CH_NUM_SFT;
 	pvt->t_num = ts_num;
 	pvt->p_num = pd_num;
 	pvt->v_num = vm_num;
+	pvt->c_num = ch_num;
 	val = 0;
 	if (ts_num)
 		val++;
@@ -580,7 +585,7 @@ static int mr75203_probe(struct platform_device *pdev)
 	}
 
 	if (vm_num) {
-		u32 num = vm_num;
+		u32 total_ch;
 
 		ret = pvt_get_regmap(pdev, "vm", pvt);
 		if (ret)
@@ -604,20 +609,20 @@ static int mr75203_probe(struct platform_device *pdev)
 			for (i = 0; i < vm_num; i++)
 				if (pvt->vm_idx[i] >= vm_num ||
 				    pvt->vm_idx[i] == 0xff) {
-					num = i;
 					pvt->v_num = i;
 					vm_num = i;
 					break;
 				}
 		}
 
-		in_config = devm_kcalloc(dev, num + 1,
+		total_ch = ch_num * vm_num;
+		in_config = devm_kcalloc(dev, total_ch + 1,
 					 sizeof(*in_config), GFP_KERNEL);
 		if (!in_config)
 			return -ENOMEM;
 
-		memset32(in_config, HWMON_I_INPUT, num);
-		in_config[num] = 0;
+		memset32(in_config, HWMON_I_INPUT, total_ch);
+		in_config[total_ch] = 0;
 		pvt_in.config = in_config;
 
 		pvt_info[index++] = &pvt_in;
-- 
2.37.1

