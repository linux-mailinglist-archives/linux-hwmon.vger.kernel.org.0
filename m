Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A105AE2E5
	for <lists+linux-hwmon@lfdr.de>; Tue,  6 Sep 2022 10:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239257AbiIFIhI (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 6 Sep 2022 04:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239224AbiIFIgr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 04:36:47 -0400
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407FD76940;
        Tue,  6 Sep 2022 01:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1662453330; x=1693989330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ITh4dnSsT8Tur8fQ0l3TRk5T+2gkpFre/IaJcGH8k0s=;
  b=pOIJjQN2vR6MsJruY1ydebEyKBGAhcy27rJ5u1CAaejGHSF+jboJFALP
   gR3bZpWNWkwc/qOX3OQSH5KT0SDFcUEv28cCoTmq6jbecgwGhr/KrNz6z
   6dsUu+Ju5eg8AkaAHftQ4Pv3AGy6sjKAqxHhohKzlVERLlPpWoetdcRup
   I=;
X-IronPort-AV: E=Sophos;i="5.93,293,1654560000"; 
   d="scan'208";a="1051603363"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-bbd95331.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 08:34:39 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1a-bbd95331.us-east-1.amazon.com (Postfix) with ESMTPS id 1BBEDC1C27;
        Tue,  6 Sep 2022 08:34:36 +0000 (UTC)
Received: from EX19D013UWA002.ant.amazon.com (10.13.138.210) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 6 Sep 2022 08:33:59 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D013UWA002.ant.amazon.com (10.13.138.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Tue, 6 Sep 2022 08:33:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Tue, 6 Sep 2022 08:33:59 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id CB0174D8D; Tue,  6 Sep 2022 08:33:57 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <rtanwar@maxlinear.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        <andriy.shevchenko@intel.com>
Subject: [PATCH v4 13/21] hwmon: (mr75203) add VM active channel support
Date:   Tue, 6 Sep 2022 08:33:48 +0000
Message-ID: <20220906083356.21067-14-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906083356.21067-1-farbere@amazon.com>
References: <20220906083356.21067-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-11.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add active channel support per voltage monitor.
The number of active channels is read from the device-tree.
When absent in device-tree, all channels are assumed to be used.

This shall be useful to expose sysfs only for inputs that are connected
to a voltage source.

Setting number of active channels to 0, means that entire VM sensor is
not used.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V4 -> V3:
- Convert comments to kernel doc.
- Repalce for loop with memset.
- Add {} to outer for loop.

V3 -> V2:
- Refactor the code changes (move code to a new function and group
  parameters in dedicated structure).

V2 -> V1:
- Fix compilation error for patch 08/16:
  "warning: ISO C90 forbids variable length array"

 drivers/hwmon/mr75203.c | 121 ++++++++++++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index c94e89c94cb3..5aa694fd9118 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -29,6 +29,8 @@
 #define CH_NUM_MSK	GENMASK(31, 24)
 #define CH_NUM_SFT	24
 
+#define VM_NUM_MAX	(VM_NUM_MSK >> VM_NUM_SFT)
+
 /* Macro Common Register */
 #define CLK_SYNTH		0x00
 #define CLK_SYNTH_LO_SFT	0
@@ -106,6 +108,31 @@
 #define PVT_N_CONST		90
 #define PVT_R_CONST		245805
 
+/**
+ * struct voltage_device - VM single input parameters.
+ * @vm_map: Map channel number to VM index.
+ * @ch_map: Map channel number to channel index.
+ *
+ * The structure provides mapping between channel-number (0..N-1) to VM-index
+ * (0..num_vm-1) and channel-index (0..ch_num-1) where N = num_vm * ch_num.
+ */
+struct voltage_device {
+	u32 vm_map;
+	u32 ch_map;
+};
+
+/**
+ * struct voltage_channels - VM channel count.
+ * @total: Total number of channels in all VMs.
+ * @max: Maximum number of channels among all VMs.
+ *
+ * The structure provides channel count information across all VMs.
+ */
+struct voltage_channels {
+	u32 total;
+	u8 max;
+};
+
 struct pvt_device {
 	struct regmap		*c_map;
 	struct regmap		*t_map;
@@ -113,12 +140,12 @@ struct pvt_device {
 	struct regmap		*v_map;
 	struct clk		*clk;
 	struct reset_control	*rst;
+	struct voltage_device	*vd;
+	struct voltage_channels	vm_channels;
 	u32			t_num;
 	u32			p_num;
 	u32			v_num;
-	u32			c_num;
 	u32			ip_freq;
-	u8			*vm_idx;
 };
 
 static umode_t pvt_is_visible(const void *data, enum hwmon_sensor_types type,
@@ -184,11 +211,11 @@ static int pvt_read_in(struct device *dev, u32 attr, int channel, long *val)
 	u32 n, stat;
 	int ret;
 
-	if (channel >= pvt->v_num * pvt->c_num)
+	if (channel >= pvt->vm_channels.total)
 		return -EINVAL;
 
-	vm_idx = pvt->vm_idx[channel / pvt->c_num];
-	ch_idx = channel % pvt->c_num;
+	vm_idx = pvt->vd[channel].vm_map;
+	ch_idx = pvt->vd[channel].ch_map;
 
 	switch (attr) {
 	case hwmon_in_input:
@@ -388,7 +415,7 @@ static int pvt_init(struct pvt_device *pvt)
 		if (ret)
 			return ret;
 
-		val = (BIT(pvt->c_num) - 1) | VM_CH_INIT |
+		val = (BIT(pvt->vm_channels.max) - 1) | VM_CH_INIT |
 		      IP_POLL << SDIF_ADDR_SFT | SDIF_WRN_W | SDIF_PROG;
 		ret = regmap_write(v_map, SDIF_W, val);
 		if (ret < 0)
@@ -513,6 +540,60 @@ static int pvt_reset_control_deassert(struct device *dev, struct pvt_device *pvt
 	return devm_add_action_or_reset(dev, pvt_reset_control_assert, pvt);
 }
 
+static int pvt_get_active_channel(struct device *dev, struct pvt_device *pvt,
+				  u32 vm_num, u32 ch_num, u8 *vm_idx)
+{
+	u8 vm_active_ch[VM_NUM_MAX];
+	int ret, i, j, k;
+
+	ret = device_property_read_u8_array(dev, "moortec,vm-active-channels",
+					    vm_active_ch, vm_num);
+	if (ret) {
+		/*
+		 * Incase "moortec,vm-active-channels" property is not defined,
+		 * we assume each VM sensor has all of its channels active.
+		 */
+		memset(vm_active_ch, ch_num, vm_num);
+		pvt->vm_channels.max = ch_num;
+		pvt->vm_channels.total = ch_num * vm_num;
+	} else {
+		for (i = 0; i < vm_num; i++) {
+			if (vm_active_ch[i] > ch_num) {
+				dev_err(dev, "invalid active channels: %u\n",
+					vm_active_ch[i]);
+				return -EINVAL;
+			}
+
+			pvt->vm_channels.total += vm_active_ch[i];
+
+			if (vm_active_ch[i] > pvt->vm_channels.max)
+				pvt->vm_channels.max = vm_active_ch[i];
+		}
+	}
+
+	/*
+	 * Map between the channel-number to VM-index and channel-index.
+	 * Example - 3 VMs, "moortec,vm_active_ch" = <5 2 4>:
+	 * vm_map = [0 0 0 0 0 1 1 2 2 2 2]
+	 * ch_map = [0 1 2 3 4 0 1 0 1 2 3]
+	 */
+	pvt->vd = devm_kcalloc(dev, pvt->vm_channels.total, sizeof(*pvt->vd),
+			       GFP_KERNEL);
+	if (!pvt->vd)
+		return -ENOMEM;
+
+	k = 0;
+	for (i = 0; i < vm_num; i++) {
+		for (j = 0; j < vm_active_ch[i]; j++) {
+			pvt->vd[k].vm_map = vm_idx[i];
+			pvt->vd[k].ch_map = j;
+			k++;
+		}
+	}
+
+	return 0;
+}
+
 static int mr75203_probe(struct platform_device *pdev)
 {
 	u32 ts_num, vm_num, pd_num, ch_num, val, index, i;
@@ -564,7 +645,6 @@ static int mr75203_probe(struct platform_device *pdev)
 	pvt->t_num = ts_num;
 	pvt->p_num = pd_num;
 	pvt->v_num = vm_num;
-	pvt->c_num = ch_num;
 	val = 0;
 	if (ts_num)
 		val++;
@@ -601,44 +681,41 @@ static int mr75203_probe(struct platform_device *pdev)
 	}
 
 	if (vm_num) {
-		u32 total_ch;
+		u8 vm_idx[VM_NUM_MAX];
 
 		ret = pvt_get_regmap(pdev, "vm", pvt);
 		if (ret)
 			return ret;
 
-		pvt->vm_idx = devm_kcalloc(dev, vm_num, sizeof(*pvt->vm_idx),
-					   GFP_KERNEL);
-		if (!pvt->vm_idx)
-			return -ENOMEM;
-
-		ret = device_property_read_u8_array(dev, "intel,vm-map",
-						    pvt->vm_idx, vm_num);
+		ret = device_property_read_u8_array(dev, "intel,vm-map", vm_idx,
+						    vm_num);
 		if (ret) {
 			/*
 			 * Incase intel,vm-map property is not defined, we
 			 * assume incremental channel numbers.
 			 */
 			for (i = 0; i < vm_num; i++)
-				pvt->vm_idx[i] = i;
+				vm_idx[i] = i;
 		} else {
 			for (i = 0; i < vm_num; i++)
-				if (pvt->vm_idx[i] >= vm_num ||
-				    pvt->vm_idx[i] == 0xff) {
+				if (vm_idx[i] >= vm_num || vm_idx[i] == 0xff) {
 					pvt->v_num = i;
 					vm_num = i;
 					break;
 				}
 		}
 
-		total_ch = ch_num * vm_num;
-		in_config = devm_kcalloc(dev, total_ch + 1,
+		ret = pvt_get_active_channel(dev, pvt, vm_num, ch_num, vm_idx);
+		if (ret)
+			return ret;
+
+		in_config = devm_kcalloc(dev, pvt->vm_channels.total + 1,
 					 sizeof(*in_config), GFP_KERNEL);
 		if (!in_config)
 			return -ENOMEM;
 
-		memset32(in_config, HWMON_I_INPUT, total_ch);
-		in_config[total_ch] = 0;
+		memset32(in_config, HWMON_I_INPUT, pvt->vm_channels.total);
+		in_config[pvt->vm_channels.total] = 0;
 		pvt_in.config = in_config;
 
 		pvt_info[index++] = &pvt_in;
-- 
2.37.1

