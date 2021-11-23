Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A047F45A481
	for <lists+linux-hwmon@lfdr.de>; Tue, 23 Nov 2021 15:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236715AbhKWOLn (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 23 Nov 2021 09:11:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:23872 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236990AbhKWOLb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Nov 2021 09:11:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="215736062"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="215736062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 06:08:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="509422302"
Received: from romanagn-mobl.ger.corp.intel.com (HELO localhost) ([10.249.144.24])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 06:08:06 -0800
From:   Iwona Winiarska <iwona.winiarska@intel.com>
To:     linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Borislav Petkov <bp@alien8.de>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Zev Weiss <zweiss@equinix.com>,
        David Muller <d.mueller@elsoft.ch>,
        Dave Hansen <dave.hansen@intel.com>,
        Iwona Winiarska <iwona.winiarska@intel.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 02/13] dt-bindings: Add bindings for peci-aspeed
Date:   Tue, 23 Nov 2021 15:06:55 +0100
Message-Id: <20211123140706.2945700-3-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123140706.2945700-1-iwona.winiarska@intel.com>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add device tree bindings for the peci-aspeed controller driver.

Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/peci/peci-aspeed.yaml | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
new file mode 100644
index 000000000000..2929d1e000d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed PECI Bus Device Tree Bindings
+
+maintainers:
+  - Iwona Winiarska <iwona.winiarska@intel.com>
+  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+allOf:
+  - $ref: peci-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-peci
+      - aspeed,ast2500-peci
+      - aspeed,ast2600-peci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description:
+      Clock source for PECI controller. Should reference the external
+      oscillator clock.
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  cmd-timeout-ms:
+    minimum: 1
+    maximum: 1000
+    default: 1000
+
+  aspeed,clock-divider:
+    description:
+      This value determines PECI controller internal clock dividing
+      rate. The divider will be calculated as 2 raised to the power of
+      the given value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    default: 0
+
+  aspeed,msg-timing:
+    description:
+      Message timing negotiation period. This value will determine the period
+      of message timing negotiation to be issued by PECI controller. The unit
+      of the programmed value is four times of PECI clock period.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 1
+
+  aspeed,addr-timing:
+    description:
+      Address timing negotiation period. This value will determine the period
+      of address timing negotiation to be issued by PECI controller. The unit
+      of the programmed value is four times of PECI clock period.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 255
+    default: 1
+
+  aspeed,rd-sampling-point:
+    description:
+      Read sampling point selection. The whole period of a bit time will be
+      divided into 16 time frames. This value will determine the time frame
+      in which the controller will sample PECI signal for data read back.
+      Usually in the middle of a bit time is the best.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+    peci-controller@1e78b000 {
+      compatible = "aspeed,ast2600-peci";
+      reg = <0x1e78b000 0x100>;
+      interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
+      resets = <&syscon ASPEED_RESET_PECI>;
+      cmd-timeout-ms = <1000>;
+      aspeed,clock-divider = <0>;
+      aspeed,msg-timing = <1>;
+      aspeed,addr-timing = <1>;
+      aspeed,rd-sampling-point = <8>;
+    };
+...
-- 
2.31.1

