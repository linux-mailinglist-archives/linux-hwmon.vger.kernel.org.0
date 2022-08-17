Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 895595968D2
	for <lists+linux-hwmon@lfdr.de>; Wed, 17 Aug 2022 07:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238637AbiHQFoU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 17 Aug 2022 01:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238638AbiHQFoD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Aug 2022 01:44:03 -0400
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F5F7C51D;
        Tue, 16 Aug 2022 22:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1660715031; x=1692251031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jff7zFZy9d0ZfKOoOEHMeXHCib3VjD8wsOPjEMr1j1Q=;
  b=hDAkPyHyknrzzFPPmlaklAkdcXBvhMTPzUEhkEPS6NuAdukIvM7DwX6u
   c+pCAqGtv2vSHlvaWQP1IoTj+XbAZzo7opyBu4ExCKwE55SCbJrQsB+so
   fUnBIVBVbglw+lc/UjpTzqQBLPjjW4irk3fG3BU1XHBZpZpyZKKwhOVLO
   0=;
X-IronPort-AV: E=Sophos;i="5.93,242,1654560000"; 
   d="scan'208";a="120059432"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-7a21ed79.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 05:43:49 +0000
Received: from EX13MTAUWA001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-iad-1d-7a21ed79.us-east-1.amazon.com (Postfix) with ESMTPS id 3B934220502;
        Wed, 17 Aug 2022 05:43:45 +0000 (UTC)
Received: from EX19D013UWA004.ant.amazon.com (10.13.138.207) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Wed, 17 Aug 2022 05:43:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX19D013UWA004.ant.amazon.com (10.13.138.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Wed, 17 Aug 2022 05:43:22 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Wed, 17 Aug 2022 05:43:22
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id 911AA4C7D; Wed, 17 Aug 2022 05:43:21 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <talel@amazon.com>, <hhhawa@amazon.com>,
        <jonnyc@amazon.com>, <hanochu@amazon.com>, <ronenk@amazon.com>,
        <itamark@amazon.com>, <shellykz@amazon.com>, <shorer@amazon.com>,
        <amitlavi@amazon.com>, <almogbs@amazon.com>, <dwmw@amazon.co.uk>,
        <rtanwar@maxlinear.com>
Subject: [PATCH v2 12/16] hwmon: (mr75203) modify the temperature equation
Date:   Wed, 17 Aug 2022 05:43:17 +0000
Message-ID: <20220817054321.6519-13-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817054321.6519-1-farbere@amazon.com>
References: <20220817054321.6519-1-farbere@amazon.com>
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

Modify the equation and coefficients to convert the digital output to
temperature according to series 5 of the Moortec Embedded Temperature
Sensor (METS) datasheet:
T = G + H * (n / cal5 - 0.5) + J * F

The G, H and J coefficients are multiplied by 1000 to get the temperature
in milli-Celsius.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/hwmon/mr75203.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index e3191f590167..e500897585e4 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -102,9 +102,10 @@
 
 #define PVT_POLL_DELAY_US	20
 #define PVT_POLL_TIMEOUT_US	20000
-#define PVT_H_CONST		100000
-#define PVT_CAL5_CONST		2047
-#define PVT_G_CONST		40000
+#define PVT_H_CONST		60000
+#define PVT_G_CONST		200000
+#define PVT_J_CONST		-100
+#define PVT_CAL5_CONST		4094
 #define PVT_CONV_BITS		10
 #define PVT_N_CONST		90
 #define PVT_R_CONST		245805
@@ -158,7 +159,6 @@ static int pvt_read_temp(struct device *dev, u32 attr, int channel, long *val)
 	struct regmap *t_map = pvt->t_map;
 	u32 stat, nbs;
 	int ret;
-	u64 tmp;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -176,12 +176,13 @@ static int pvt_read_temp(struct device *dev, u32 attr, int channel, long *val)
 		nbs &= SAMPLE_DATA_MSK;
 
 		/*
-		 * Convert the register value to
-		 * degrees centigrade temperature
+		 * Convert the register value to degrees centigrade temperature:
+		 * T = G + H * (n / cal5 - 0.5) + J * F
 		 */
-		tmp = nbs * PVT_H_CONST;
-		do_div(tmp, PVT_CAL5_CONST);
-		*val = tmp - PVT_G_CONST - pvt->ip_freq;
+		*val = PVT_G_CONST;
+		*val += PVT_H_CONST * nbs / PVT_CAL5_CONST;
+		*val -= PVT_H_CONST / 2;
+		*val += PVT_J_CONST * pvt->ip_freq / HZ_PER_MHZ;
 
 		return 0;
 	default:
@@ -313,7 +314,7 @@ static int pvt_init(struct pvt_device *pvt)
 		    (key >> 1) << CLK_SYNTH_HI_SFT |
 		    (key >> 1) << CLK_SYNTH_HOLD_SFT | CLK_SYNTH_EN;
 
-	pvt->ip_freq = sys_freq * 100 / (key + 2);
+	pvt->ip_freq = clk_get_rate(pvt->clk) / (key + 2);
 
 	if (t_num) {
 		ret = regmap_write(t_map, SDIF_SMPL_CTRL, 0x0);
-- 
2.37.1

