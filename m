Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652EB18D976
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 Mar 2020 21:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgCTUgB (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 20 Mar 2020 16:36:01 -0400
Received: from lists.gateworks.com ([108.161.130.12]:58107 "EHLO
        lists.gateworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbgCTUgA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Mar 2020 16:36:00 -0400
Received: from 68-189-91-139.static.snlo.ca.charter.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by lists.gateworks.com with esmtp (Exim 4.82)
        (envelope-from <tharvey@gateworks.com>)
        id 1jFOOT-0004rF-MC; Fri, 20 Mar 2020 20:37:25 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Jones <rjones@gateworks.com>
Cc:     Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v7 1/3] dt-bindings: mfd: Add Gateworks System Controller bindings
Date:   Fri, 20 Mar 2020 13:35:48 -0700
Message-Id: <1584736550-7520-2-git-send-email-tharvey@gateworks.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584736550-7520-1-git-send-email-tharvey@gateworks.com>
References: <1584736550-7520-1-git-send-email-tharvey@gateworks.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds documentation of device-tree bindings for the
Gateworks System Controller (GSC).

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
v7:
 - change divider from mili-ohms to ohms
 - add constraints for voltage divider and offset
 - remove unnecessary ref for offset
 - renamed fan to fan-controller and changed base prop to reg

v6:
 - fix typo
 - drop invalid description from #interrupt-cells property
 - fix adc pattern property
 - add unit suffix
 - replace hwmon/adc with adc/channel
 - changed adc type to mode and enum int
 - add unit suffix and drop ref for voltage-divider
 - moved fan to its own subnode with base register

v5:
 - resolve dt_binding_check issues

v4:
 - move to using pwm<n>_auto_point<m>_{pwm,temp} for FAN PWM
 - remove unncessary resolution/scaling properties for ADCs
 - update to yaml
 - remove watchdog

v3:
 - replaced _ with -
 - remove input bindings
 - added full description of hwmon
 - fix unit address of hwmon child nodes
---
 .../devicetree/bindings/mfd/gateworks-gsc.yaml     | 173 +++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
new file mode 100644
index 00000000..0457137
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gateworks System Controller multi-function device
+
+description: |
+  The GSC is a Multifunction I2C slave device with the following submodules:
+   - Watchdog Timer
+   - GPIO
+   - Pushbutton controller
+   - Hardware Monitor with ADC's for temperature and voltage rails and
+     fan controller
+
+maintainers:
+  - Tim Harvey <tharvey@gateworks.com>
+  - Robert Jones <rjones@gateworks.com>
+
+properties:
+  $nodename:
+    pattern: "gsc@[0-9a-f]{1,2}"
+  compatible:
+    const: gw,gsc
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+  adc:
+    type: object
+    description: Optional Hardware Monitoring module
+
+    properties:
+      compatible:
+        const: gw,gsc-adc
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^channel@[0-9]+$":
+        type: object
+        description: |
+          Properties for a single ADC which can report cooked values
+          (ie temperature sensor based on thermister), raw values
+          (ie voltage rail with a pre-scaling resistor divider).
+
+        properties:
+          reg:
+            description: Register of the ADC
+            maxItems: 1
+
+          label:
+            description: Name of the ADC input
+
+          gw,mode:
+            description: |
+              conversion mode:
+                0 - temperature, in C*10
+                1 - pre-scaled voltage value
+                2 - scaled voltage based on an optional resistor divider
+                    and optional offset
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2]
+
+          gw,voltage-divider-ohms:
+            description: values of resistors for divider on raw ADC input
+            maxItems: 2
+            items:
+             minimum: 1000
+             maximum: 1000000
+
+          gw,voltage-offset-microvolt:
+            description: |
+              A positive voltage offset to apply to a raw ADC
+              (ie to compensate for a diode drop).
+            minimum: 0
+            maximum: 1000000
+
+        required:
+          - gw,mode
+          - reg
+          - label
+
+    required:
+      - compatible
+      - "#address-cells"
+      - "#size-cells"
+
+  fan-controller:
+    type: object
+    description: Optional FAN controller
+
+    properties:
+      compatible:
+        const: gw,gsc-fan
+
+      reg:
+        description: The fan controller base address
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gsc@20 {
+            compatible = "gw,gsc";
+            reg = <0x20>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <4 GPIO_ACTIVE_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            adc {
+                compatible = "gw,gsc-adc";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                channel@0 { /* A0: Board Temperature */
+                    reg = <0x00>;
+                    label = "temp";
+                    gw,mode = <0>;
+                };
+
+                channel@2 { /* A1: Input Voltage (raw ADC) */
+                    reg = <0x02>;
+                    label = "vdd_vin";
+                    gw,mode = <1>;
+                    gw,voltage-divider-ohms = <22100 1000>;
+                    gw,voltage-offset-microvolt = <800000>;
+                };
+
+                channel@b { /* A2: Battery voltage */
+                    reg = <0x0b>;
+                    label = "vdd_bat";
+                    gw,mode = <1>;
+                };
+            };
+
+            fan-controller {
+                compatible = "gw,gsc-fan";
+                reg = <0x2c>;
+            };
+        };
+    };
-- 
2.7.4

