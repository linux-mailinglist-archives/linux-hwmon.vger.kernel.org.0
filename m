Return-Path: <linux-hwmon+bounces-316-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4F801F17
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Dec 2023 23:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D778B20B32
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Dec 2023 22:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3222207F;
	Sat,  2 Dec 2023 22:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="cKXEG7Ps"
X-Original-To: linux-hwmon@vger.kernel.org
X-Greylist: delayed 364 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 02 Dec 2023 14:36:06 PST
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6244C11A;
	Sat,  2 Dec 2023 14:36:06 -0800 (PST)
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 2D5AD161295;
	Sat,  2 Dec 2023 23:30:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1701556200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w8RgVf3eXeZAKem0L618SQ0biYOfByDJvZecPoQGFuc=;
	b=cKXEG7PsiepHEcQrcXwInsk0YmYc4jFv+gYp+pmE9X0y1h3gZ9JBD5OzGMqM3W/n7N1IFK
	z/NClr0LGnfsUDRXPryZNHR5bPsmk0IL+nwOGlrJwD89Z927a1zGrEZ3vSemCGc7HRof3d
	piWBcTAZJjK3MmUjEwxrAJEEINUE9jU=
From: David Heidelberg <david@ixit.cz>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: arm: hwmon: gpio-fan: Convert txt bindings to yaml
Date: Sat,  2 Dec 2023 23:29:00 +0100
Message-ID: <20231202222934.137191-1-david@ixit.cz>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fan devices connected to GPIOs to the YAML syntax.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/hwmon/gpio-fan.txt    | 41 -----------
 .../devicetree/bindings/hwmon/gpio-fan.yaml   | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/gpio-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/gpio-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/gpio-fan.txt b/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
deleted file mode 100644
index f4cfa350f6a1..000000000000
--- a/Documentation/devicetree/bindings/hwmon/gpio-fan.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-Bindings for fan connected to GPIO lines
-
-Required properties:
-- compatible : "gpio-fan"
-
-Optional properties:
-- gpios: Specifies the pins that map to bits in the control value,
-  ordered MSB-->LSB.
-- gpio-fan,speed-map: A mapping of possible fan RPM speeds and the
-  control value that should be set to achieve them. This array
-  must have the RPM values in ascending order.
-- alarm-gpios: This pin going active indicates something is wrong with
-  the fan, and a udev event will be fired.
-- #cooling-cells: If used as a cooling device, must be <2>
-  Also see:
-  Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
-  min and max states are derived from the speed-map of the fan.
-
-Note: At least one the "gpios" or "alarm-gpios" properties must be set.
-
-Examples:
-
-	gpio_fan {
-		compatible = "gpio-fan";
-		gpios = <&gpio1 14 1
-			 &gpio1 13 1>;
-		gpio-fan,speed-map = <0    0
-				      3000 1
-				      6000 2>;
-		alarm-gpios = <&gpio1 15 1>;
-	};
-	gpio_fan_cool: gpio_fan {
-		compatible = "gpio-fan";
-		gpios = <&gpio2 14 1
-			 &gpio2 13 1>;
-		gpio-fan,speed-map =	<0    0>,
-					<3000 1>,
-					<6000 2>;
-		alarm-gpios = <&gpio2 15 1>;
-		#cooling-cells = <2>; /* min followed by max */
-	};
diff --git a/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml b/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
new file mode 100644
index 000000000000..0e220874bee6
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/gpio-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fan connected to GPIO lines
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    const: gpio-fan
+
+  gpios:
+    description: |
+      Specifies the pins that map to bits in the control value,
+      ordered MSB-->LSB.
+    minItems: 1
+    maxItems: 7
+
+  alarm-gpios:
+    maxItems: 1
+
+  gpio-fan,speed-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 2
+    maxItems: 127
+    items:
+      items:
+        - description: fan speed in RPMs
+        - description: control value
+    description: |
+      A mapping of possible fan RPM speeds and the
+      control value that should be set to achieve them. This array
+      must have the RPM values in ascending order.
+
+  '#cooling-cells':
+    const: 2
+
+required:
+  - compatible
+  - gpios
+  - gpio-fan,speed-map
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio_fan {
+      compatible = "gpio-fan";
+      gpios = <&gpio1 14 1
+               &gpio1 13 1>;
+      gpio-fan,speed-map = <    0 0>,
+                           < 3000 1>,
+                           <36000 2>;
+      alarm-gpios = <&gpio1 15 1>;
+    };
+  - |
+    gpio_fan_cool: gpio_fan {
+      compatible = "gpio-fan";
+      gpios = <&gpio2 14 1
+               &gpio2 13 1>;
+      gpio-fan,speed-map = <   0 0>,
+                           <3000 1>,
+                           <6000 2>;
+      alarm-gpios = <&gpio2 15 1>;
+      #cooling-cells = <2>; /* min followed by max */
+    };
-- 
2.42.0


