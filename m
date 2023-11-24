Return-Path: <linux-hwmon+bounces-196-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788A7F7638
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 15:18:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AB671C20FA3
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 14:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775F22D60F;
	Fri, 24 Nov 2023 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqMpE9+W"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C52D03D;
	Fri, 24 Nov 2023 14:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBEFBC433CA;
	Fri, 24 Nov 2023 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700835506;
	bh=aPHy+qeTdF90rjUwBCivA+w2Kks4lGAc9/2OBXiOdGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eqMpE9+W/iwe5BSU4Ht6GiqSk5BxYYBq+tq1q8p2KHQI8AIS+38OH8iIczA2tk1Td
	 mIlRXsSUQ4hAeVfb2LS47LgDKNuL7QcMn43TnakKdkRy9lT9fDUgUQLvUyzkjckUjw
	 CKsmVqpBpzOTMGHbQIgZGoPUNZ4No2e+OYjVzMSjbioTQk1U/ouTh8aV6T+2bfdwux
	 YDegVFXwWZGTCdtITLeEGABHcosRFS74JmiCWunKQNkA2JEXXzT++rEltl2R5N9qkq
	 Fmb4D8yvyf/VM5I5CIDx9QouZXIbl0Uj2AqjsoHtp5RPVqecEmTWywlicq9jdxu1m9
	 LjFGtJYwjczRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4167C624B4;
	Fri, 24 Nov 2023 14:18:26 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Fri, 24 Nov 2023 15:18:16 +0100
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add LTC4282 bindings
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
In-Reply-To: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700835504; l=7583;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=OsmBFs3WX3gV38NkMDwvqrVkUAAW0yysY75GmZvn7xY=;
 b=AaYiW0WTAAKx7mUkzlCLaxn6Q9O0c5gdLWcEfM47PnPF5O9Xeb9TZAikjqdVHlbnEku1ugrKt
 iR2uHGxMpAmCHTWi2LY2oryMswM/n72pU7VVzbtmpuGDcWkr86I/Okg
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received:
 by B4 Relay for nuno.sa@analog.com/20231116 with auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: <nuno.sa@analog.com>

From: Nuno Sa <nuno.sa@analog.com>

Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
Compatible Monitoring.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     | 206 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 212 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
new file mode 100644
index 000000000000..6c979f70687e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C
+
+maintainers:
+  - Nuno Sa <nuno.sa@analog.com>
+
+description: |
+  Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4282.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ltc4282
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  adi,rsense-nano-ohms:
+    description: Value of the sense resistor.
+
+  adi,vin-mode-microvolt:
+    description:
+      Selects operating range for the Undervoltage, Overvoltage and Foldback
+      pins. Also for the ADC. Should be set to the nominal input voltage.
+    enum: [3300000, 5000000, 12000000, 24000000]
+    default: 12000000
+
+  adi,fet-bad-timeout-ms:
+    description:
+      From the moment a FET bad conditions is present, this property selects the
+      wait time/timeout for a FET-bad fault to be signaled. Setting this to 0,
+      disables FET bad faults to be reported.
+    default: 255
+    maximum: 255
+
+  adi,overvoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
+    default: 0
+
+  adi,undervoltage-dividers:
+    description: |
+      Select which dividers to use for VDD Overvoltage detection. Note that
+      when the internal dividers are used the threshold is referenced to VDD.
+      The percentages in the datasheet are misleading since the actual values
+      to look for are in the "Absolute Maximum Ratings" table in the
+      "Comparator Inputs" section. In there there's a line for each of the 5%,
+      10% and 15% settings with the actual min, typical and max tolerances.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [external, vdd_5_percent, vdd_10_percent, vdd_15_percent]
+    default: 0
+
+  adi,current-limit-sense-microvolt:
+    description:
+      The current limit sense voltage of the chip is adjustable between
+      12.5mV and 34.4mV in 3.1mV steps. This effectively limits the current
+      on the load.
+    enum: [12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375]
+    default: 25000
+
+  adi,overcurrent-retry:
+    description:
+      If set, enables the chip to auto-retry 256 timer cycles after an
+      Overcurrent fault.
+    type: boolean
+
+  adi,overvoltage-retry-disable:
+    description:
+      If set, disables the chip to auto-retry 50ms after an Overvoltage fault.
+      It's enabled by default.
+    type: boolean
+
+  adi,undervoltage-retry-disable:
+    description:
+      If set, disables the chip to auto-retry 50ms after an Undervoltage fault.
+      It's enabled by default.
+    type: boolean
+
+  adi,fault-log-enable:
+    description:
+      If set, enables the FAULT_LOG and ADC_ALERT_LOG registers to be written
+      to the EEPROM when a fault bit transitions high and hence, will be
+      available after a power cycle (the chip loads the contents of
+      the EE_FAULT_LOG register - the one in EEPROM - into FAULT_LOG at boot).
+    type: boolean
+
+  adi,gpio-alert:
+    description: Use the ALERT pin as a GPIO.
+    type: boolean
+
+  adi,gpio1-mode:
+    description: Defines the function of the Pin.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [gpio, power_bad, power_good]
+
+  adi,gpio2-mode:
+    description: Defines the function of the Pin.
+          0 - GPIO Mode.
+          1 - Acts as an input pin and it is feeded into the ADC.
+          2 - Pulls Low when the MOSFET is dissipating power (stress).
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [gpio, adc_input, stress_fet]
+
+  adi,gpio3-mode:
+    description: Defines the function of the Pin.
+          0 - GPIO Mode.
+          1 - Acts as an input pin and it is feeded into the ADC.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [gpio, adc_input]
+
+  gpio-controller:
+    description:
+      This property applies if some of the pins are used as GPIOs.
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - adi,rsense-nano-ohms
+
+dependencies:
+  adi,alert-as-gpio: [gpio-controller, '#gpio-cells']
+
+allOf:
+  - if:
+      required:
+        - adi,gpio1-mode
+    then:
+      allOf:
+        - if:
+            properties:
+              adi,gpio1-mode:
+                const: gpio
+          then:
+            dependencies:
+              adi,gpio1-mode: [gpio-controller, '#gpio-cells']
+  - if:
+      required:
+        - adi,gpio2-mode
+    then:
+      allOf:
+        - if:
+            properties:
+              adi,gpio2-mode:
+                const: gpio
+          then:
+            dependencies:
+              adi,gpio2-mode: [gpio-controller, '#gpio-cells']
+  - if:
+      required:
+        - adi,gpio3-mode
+    then:
+      allOf:
+        - if:
+            properties:
+              adi,gpio3-mode:
+                const: gpio
+          then:
+            dependencies:
+              adi,gpio3-mode: [gpio-controller, '#gpio-cells']
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@50 {
+            compatible = "adi,ltc4282";
+            reg = <0x50>;
+            adi,rsense-nano-ohms = <500>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            adi,gpio1-mode = "power_good";
+            adi,gpio2-mode = "gpio";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 97f51d5ec1cf..4a2b84ea1274 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12629,6 +12629,12 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4282 HARDWARE MONITOR DRIVER
+M:	Nuno Sa <nuno.sa@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
+
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-i2c@vger.kernel.org

-- 
2.41.0


