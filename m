Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA225AE324
	for <lists+linux-hwmon@lfdr.de>; Tue,  6 Sep 2022 10:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239303AbiIFIlC (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 6 Sep 2022 04:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239335AbiIFIj2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 04:39:28 -0400
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com [99.78.197.218])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9676E79A58;
        Tue,  6 Sep 2022 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1662453457; x=1693989457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QaZnKD4Usd+c2bBOUsV8NlLFsu3kyiAwP75GhWqBpac=;
  b=GCK9XOFfigdnu8WM/ZjnBNXX6RSsgq6vunuL7c9fftndVVgNQJ9CwBNl
   e6hAOMWZwDP2PR46xxi/BEAcJNksvMXCYcwTp7HJgDc8l6SYM5IiuhXux
   wg+Y19EH5BLO+QOgwK95N+0oYlxEVSAoNpKO8rpwZ1utrl4qcrVIdVGcD
   k=;
X-IronPort-AV: E=Sophos;i="5.93,293,1654560000"; 
   d="scan'208";a="127144293"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-828bd003.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 08:34:43 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
        by email-inbound-relay-iad-1a-828bd003.us-east-1.amazon.com (Postfix) with ESMTPS id 8889E803B1;
        Tue,  6 Sep 2022 08:34:39 +0000 (UTC)
Received: from EX19D013UWA004.ant.amazon.com (10.13.138.207) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.38; Tue, 6 Sep 2022 08:34:00 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D013UWA004.ant.amazon.com (10.13.138.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.12;
 Tue, 6 Sep 2022 08:34:00 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP
 Server id 15.0.1497.38 via Frontend Transport; Tue, 6 Sep 2022 08:33:59 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
        id D4AC74D82; Tue,  6 Sep 2022 08:33:57 +0000 (UTC)
From:   Eliav Farber <farbere@amazon.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>, <rtanwar@maxlinear.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <farbere@amazon.com>, <hhhawa@amazon.com>, <jonnyc@amazon.com>,
        <andriy.shevchenko@intel.com>
Subject: [PATCH v4 14/21] dt-bindings: hwmon: (mr75203) add "moortec,vm-pre-scaler-x2" property
Date:   Tue, 6 Sep 2022 08:33:49 +0000
Message-ID: <20220906083356.21067-15-farbere@amazon.com>
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

Add support for mr76006 pre-scaler which provides divide-by-2 scaling of
the input voltage, so that it can be  presented to the VM for measurement
within its range (the VM input range is limited to -0.1V to 1V).

The new "moortec,vm-pre-scaler-x2" property lists the channels that use
the mr76006 pre-scaler.

The driver will use this list to multiply the voltage result by 2, to
present to the user with the actual voltage input source.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V4 -> V3:
- Rename "moortec,vm-pre-scaler" to "moortec,vm-pre-scaler-x2".
- Added mximum number if items in description.

V3 -> V2:
- Add "moortec" prefix to property name.
- Change property format to be a single u8 array.
- Fix typo: scalar --> scaler.

 .../devicetree/bindings/hwmon/moortec,mr75203.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
index 2aa4c3618596..de92a21d5552 100644
--- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
+++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
@@ -79,6 +79,18 @@ properties:
       Minimum value of each item - 0 (which means entire VM sensor is nou used).
     $ref: /schemas/types.yaml#/definitions/uint8-array
 
+  moortec,vm-pre-scaler-x2:
+    description:
+      Defines the channels that use a mr76006 pre-scaler to divide the input
+      source by 2.
+      The pre-scaler is used for input sources that exceed the VM input range.
+      The driver uses this information to present to the user with the actual
+      value of the voltage source.
+      For channels that are not listed, no pre-scaler is assumed.
+      Maximum number of items - total number of channels in all VMs.
+      Each channel should not appear more than once.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
 required:
   - compatible
   - reg
@@ -101,5 +113,6 @@ examples:
         clocks = <&osc0>;
         resets = <&rcu0 0x40 7>;
         moortec,vm-active-channels = /bits/ 8 <0x10 0x05>;
+        moortec,vm-pre-scaler-x2 = /bits/ 8 <5 6 20>;
         #thermal-sensor-cells = <1>;
     };
-- 
2.37.1

