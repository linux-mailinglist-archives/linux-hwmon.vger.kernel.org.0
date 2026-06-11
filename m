Return-Path: <linux-hwmon+bounces-15016-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J77eA11nKmo5owMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15016-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 09:44:29 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7BD66F7DA
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 09:44:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=UUKJ7FxL;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15016-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15016-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E47B0300AB02
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 07:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC5E368947;
	Thu, 11 Jun 2026 07:44:24 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765E4367F3D;
	Thu, 11 Jun 2026 07:44:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163864; cv=none; b=qyHfrXupClwSBGyt15TkkOHOdOV7hXwTYKCW+hBIIpHy86hbAFLEdRsTwyVoa3hlg9Bkbk54tV60+Mo8oZMIQIym+7mdZ33bet25mI+l+77RxI73nJGadgiB9pZUMUmGi9lDHXxzZOSwW8UcVIuNw+4h9hlOf7o1E4+rqahEmWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163864; c=relaxed/simple;
	bh=hKtJBj6NbpM+g6kmjkW4KSom4gFoNvlMbMdPkKuqkbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y+lU1IL/EuwCtdWWXJgZlHu7ADLyJ8w/OnwrwjT13VXxdGDIU4isdpKTbHY5Wfrpkxq0OqhJ9awmGMylYJSXiW1oyP7wqOfnCoWc6beJB28KrBRJefKCagI4eZutMk9jGGxiYyalXc0tHrhbZfm5aliKtRvXEDH6p7CMkl2PZqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UUKJ7FxL; arc=none smtp.client-ip=220.197.31.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PQ
	iPGhl1R3XE1rfbgWoU/FE0wGrBbGWg/k63y7WgUeQ=; b=UUKJ7FxLX5aYjFmiAC
	dPkcyEZaIdLE+L55jYIHshTW23JFrZXYzovbqQF7DyF+CsuFOznG2Sjp078juJEI
	v9GHDb+G9mNvfGTZnUSanN0NS6t7+AP2yWKHjEL9obyKvBDtl+cw8x47QAtoC9uN
	K78AmzpibTDHqiCDtcoR+keAA=
Received: from ZM.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3PvcqZypqI94RCw--.19273S3;
	Thu, 11 Jun 2026 15:43:40 +0800 (CST)
From: Ziming Zhu <zmzhu0630@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy SQ24860
Date: Thu, 11 Jun 2026 15:43:33 +0800
Message-Id: <20260611074335.4415-2-zmzhu0630@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260611074335.4415-1-zmzhu0630@163.com>
References: <20260611074335.4415-1-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3PvcqZypqI94RCw--.19273S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr18KF18uF15Xr4kWFy3Arb_yoW8Kw1DpF
	Z5uF9rJr48XryxWw47GFykZ3W5Zr1kAa1j9r9xJw1SyF98XFsYvrZIkrW5XF1UCr10yFy3
	ZFWqyryxt3s7Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOjjDUUUUU=
X-CM-SenderInfo: x2p2x3aqwtiqqrwthudrp/xtbCwA0KA2oqZy1OlwAA3X
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-15016-lists,linux-hwmon=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[zmzhu0630@163.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zmzhu0630@163.com,linux-hwmon@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url,silergycorp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C7BD66F7DA

From: Ziming Zhu <ziming.zhu@silergycorp.com>

Add devicetree binding documentation for the Silergy SQ24860 eFuse.

The device is a PMBus hardware monitoring device which reports voltage,
current, power, and temperature telemetry. The board-specific IMON
resistor value is described with silergy,rimon-micro-ohms.

Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
---
 .../bindings/hwmon/pmbus/silergy,sq24860.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
new file mode 100644
index 000000000000..03ef82c11e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/silergy,sq24860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silergy SQ24860 eFuse
+
+maintainers:
+  - Ziming Zhu <ziming.zhu@silergycorp.com>
+
+description:
+  The Silergy SQ24860 is an integrated, high-current circuit protection and
+  power management device with PMBus interface.
+
+properties:
+  compatible:
+    const: silergy,sq24860
+
+  reg:
+    maxItems: 1
+
+  silergy,rimon-micro-ohms:
+    description:
+      Micro-ohms value of the resistance installed between the IMON pin and
+      the ground reference.
+
+  interrupts:
+    description: PMBus SMBAlert interrupt.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - silergy,rimon-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hw-monitor@40 {
+            compatible = "silergy,sq24860";
+            reg = <0x40>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <42 8>;
+            silergy,rimon-micro-ohms = <1600000000>;
+
+            regulators {
+                cpu0_vout: vout {
+                    regulator-name = "main_cpu0";
+                };
+            };
+        };
+    };
-- 
2.25.1


