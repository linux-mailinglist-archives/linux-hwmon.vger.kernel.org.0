Return-Path: <linux-hwmon+bounces-13070-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJUjCW/Cz2lH0QYAu9opvQ
	(envelope-from <linux-hwmon+bounces-13070-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 03 Apr 2026 15:36:47 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7E394927
	for <lists+linux-hwmon@lfdr.de>; Fri, 03 Apr 2026 15:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262453080124
	for <lists+linux-hwmon@lfdr.de>; Fri,  3 Apr 2026 13:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4B63BD655;
	Fri,  3 Apr 2026 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Qrs7oBdw"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE683BC666;
	Fri,  3 Apr 2026 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223278; cv=none; b=SMeRs12R8ykexMUdxnhcNS0lbGaGmUayS7zrNdj+FGjHz64a+H2/sZm+uZsN9BRcZvHU80mg82Ws6dg6Qe74wsM3vFHS0oLrriGocTXnAfXAJ0n97DivccIZBNEiFoD1XHbAHP4NiiIKEL7sq7nWtenOmBhYSop0uaAgCKUYehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223278; c=relaxed/simple;
	bh=L8p4XiFFsqMNGQtAqS9U6S46KPv7W4IR5GnOZCrN/p4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hoSRTYX6ySSwXDY0xjQ5ZxVFM8RcwHHLNvyr/mts48ibpqWK7y/LZnLyTWc/p9LWeSr2h8oT1VlHXHy7eaqgFCxHsAqts+wYkvFDaKn7BxZFEr001I79a6y11EK5ySdUMXu59eQBIRiBV3IR2py6YZ3reurHlfHXLEKOQYkQO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Qrs7oBdw; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775223275; x=1806759275;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=L8p4XiFFsqMNGQtAqS9U6S46KPv7W4IR5GnOZCrN/p4=;
  b=Qrs7oBdwe+zTFpNXcaoji21HGIsW7DnnUITeocfMGdummHraVbl20CnC
   QScoSNls2jkaZtgABwO0lSu2JEwtnLbbn4ml/TdacXoYA+pIT52wO4cG4
   WqHYUm/yOaEBpZSdi6RIUShy0DtzsV+JFTvsgGX/O6JkBhoT/OEhqD+Yj
   XuCKCkegtkWUMP/41JByPtLOXVE8HJJQ599wb4eIA9ZHqNbjMFOehxPMm
   I0TM038Qhy1jJk+tMSRn9mcBrsX9LTq6wfnMkU70aqn8GM9KEQL5GHKjw
   XWKN4wXslFvlSZBvuCCtVRsRDPPh81qZrhA0AEhiTEwty/Aop6bdo3RFd
   A==;
X-CSE-ConnectionGUID: af5oL4wRScqpqlSOtoYDHA==
X-CSE-MsgGUID: sPIn+N64SMObPQtng4KGdQ==
X-IronPort-AV: E=Sophos;i="6.23,157,1770620400"; 
   d="scan'208";a="54881213"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 06:34:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 3 Apr 2026 06:34:13 -0700
Received: from [127.0.1.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 06:34:10 -0700
From: Victor Duicu <victor.duicu@microchip.com>
Date: Fri, 3 Apr 2026 16:32:16 +0300
Subject: [PATCH v12 1/2] dt-bindings: hwmon: add support for MCP998X
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260403-add-mcp9982-hwmon-v12-1-b3bfb26ff136@microchip.com>
References: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
In-Reply-To: <20260403-add-mcp9982-hwmon-v12-0-b3bfb26ff136@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<marius.cristea@microchip.com>, <victor.duicu@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775223246; l=7599;
 i=victor.duicu@microchip.com; s=20260213; h=from:subject:message-id;
 bh=L8p4XiFFsqMNGQtAqS9U6S46KPv7W4IR5GnOZCrN/p4=;
 b=sL5RGc2e0rhEztLdT5/RlulOl8m/2AqIA+bo1rwzinAYj9H+BCnkq6eAXewQLYK+seFhu+lMN
 7nwX51zrrI6DXeDaTHqvW6T7QTAvakyvRLVKK/IO4pEOFJ7OZebT1O+
X-Developer-Key: i=victor.duicu@microchip.com; a=ed25519;
 pk=/o+aE26HN3Piv9T5t+efqb0aeJw9ErwMPeSC8lYXQsA=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13070-lists,linux-hwmon=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.duicu@microchip.com,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email,0.0.0.4:email,0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:dkim,microchip.com:mid,microchip.com:email,microchip.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: B6C7E394927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree schema for Microchip MCP998X/33 and MCP998XD/33D
Multichannel Automotive Temperature Monitor Family.

Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
---
 .../bindings/hwmon/microchip,mcp9982.yaml          | 237 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 243 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
new file mode 100644
index 000000000000..83dd2bf37e27
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
@@ -0,0 +1,237 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,mcp9982.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP998X/33 and MCP998XD/33D Temperature Monitor
+
+maintainers:
+  - Victor Duicu <victor.duicu@microchip.com>
+
+description: |
+  The MCP998X/33 and MCP998XD/33D family is a high-accuracy 2-wire
+  multichannel automotive temperature monitor.
+  The datasheet can be found here:
+    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/MCP998X-Family-Data-Sheet-DS20006827.pdf
+
+properties:
+  compatible:
+    enum:
+      - microchip,mcp9933
+      - microchip,mcp9933d
+      - microchip,mcp9982
+      - microchip,mcp9982d
+      - microchip,mcp9983
+      - microchip,mcp9983d
+      - microchip,mcp9984
+      - microchip,mcp9984d
+      - microchip,mcp9985
+      - microchip,mcp9985d
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    description:
+      The chip family has three different interrupt pins divided among them.
+      The chips without "D" have alert-therm and therm-addr.
+      The chips with "D" have alert-therm and sys-shtdwn.
+    minItems: 1
+    items:
+      - enum: [alert-therm, therm-addr, sys-shtdwn]
+      - enum: [therm-addr, sys-shtdwn]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  microchip,enable-anti-parallel:
+    description:
+      Enable anti-parallel diode mode operation.
+      MCP9984/84D/85/85D and MCP9933/33D support reading two external diodes
+      in anti-parallel connection on the same set of pins.
+    type: boolean
+
+  microchip,parasitic-res-on-channel1-2:
+    description:
+      Indicates that the chip and the diodes/transistors are sufficiently far
+      apart that a parasitic resistance is added to the wires, which can affect
+      the measurements. Due to the anti-parallel diode connections, channels
+      1 and 2 are affected together.
+    type: boolean
+
+  microchip,parasitic-res-on-channel3-4:
+    description:
+      Indicates that the chip and the diodes/transistors are sufficiently far
+      apart that a parasitic resistance is added to the wires, which can affect
+      the measurements. Due to the anti-parallel diode connections, channels
+      3 and 4 are affected together.
+    type: boolean
+
+  microchip,power-state:
+    description:
+      The chip can be set in Run state or Standby state. In Run state the ADC
+      is converting on all channels at the programmed conversion rate.
+      In Standby state the host must initiate a conversion cycle by writing
+      to the One-Shot register.
+      True value sets Run state.
+      Chips with "D" in the name can only be set in Run mode.
+    type: boolean
+
+  vdd-supply: true
+
+patternProperties:
+  "^channel@[1-4]$":
+    description:
+      Represents the external temperature channels to which
+      a remote diode is connected.
+    type: object
+
+    properties:
+      reg:
+        items:
+          maxItems: 1
+
+      label:
+        description: Unique name to identify which channel this is.
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9982d
+              - microchip,mcp9983d
+              - microchip,mcp9984d
+              - microchip,mcp9985d
+              - microchip,mcp9933d
+    then:
+      properties:
+        interrupt-names:
+          items:
+            enum:
+              - alert-therm
+              - sys-shtdwn
+      required:
+        - microchip,power-state
+        - microchip,parasitic-res-on-channel1-2
+    else:
+      properties:
+        microchip,power-state: true
+        interrupt-names:
+          items:
+            enum:
+              - alert-therm
+              - therm-addr
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9983d
+              - microchip,mcp9984d
+              - microchip,mcp9985d
+    then:
+      required:
+        - microchip,parasitic-res-on-channel3-4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9982
+              - microchip,mcp9982d
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+      patternProperties:
+        "^channel@[2-4]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9983
+              - microchip,mcp9983d
+    then:
+      properties:
+        microchip,enable-anti-parallel: false
+      patternProperties:
+        "^channel@[3-4]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9933
+              - microchip,mcp9933d
+    then:
+      patternProperties:
+        "^channel@[3-4]$": false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp9984
+              - microchip,mcp9984d
+    then:
+      properties:
+        channel@4: false
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@4c {
+            compatible = "microchip,mcp9985";
+            reg = <0x4c>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            microchip,enable-anti-parallel;
+            microchip,parasitic-res-on-channel1-2;
+            microchip,parasitic-res-on-channel3-4;
+            vdd-supply = <&vdd>;
+
+            channel@1 {
+                reg = <1>;
+                label = "Room Temperature";
+            };
+
+            channel@2 {
+                reg = <2>;
+                label = "GPU Temperature";
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..026510a4129c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17160,6 +17160,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
 F:	drivers/iio/adc/mcp3911.c
 
+MICROCHIP MCP9982 TEMPERATURE DRIVER
+M:	Victor Duicu <victor.duicu@microchip.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/microchip,mcp9982.yaml
+
 MICROCHIP MMC/SD/SDIO MCI DRIVER
 M:	Aubin Constans <aubin.constans@microchip.com>
 S:	Maintained

-- 
2.51.0


