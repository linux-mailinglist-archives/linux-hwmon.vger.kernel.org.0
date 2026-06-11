Return-Path: <linux-hwmon+bounces-15024-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LGzuIuN6KmpUqgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15024-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 11:07:47 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7E67037B
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 11:07:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15024-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15024-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77F8230067A1
	for <lists+linux-hwmon@lfdr.de>; Thu, 11 Jun 2026 09:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5483639EF24;
	Thu, 11 Jun 2026 09:06:33 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C062F390226;
	Thu, 11 Jun 2026 09:06:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168793; cv=none; b=fdRvM/iKFHGkZuKpTGXqT6VghwO5WCzbIUDrtx8wL5xWxmqu0HixG4fpKv7ijfgvsAPdVJuLwskrsCBvx2jhkDsAkzOY9FhSc/MpZZT5OgKPqfNzuJtGGuTicySttYf3gsH9NosfX9xAsfeA//Bk6wUfZwwWvEVCUTZOT+0dgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168793; c=relaxed/simple;
	bh=k/nZRHfqbAt0qxRgkvRw4WOdiOIXdQqfm31GU3E1xv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4NhZ9oHqiTN3Rk01bkUYdy63/WtTFbWBCKyHJLVFazZnf+U0W5lOAwOuaqRmtMdVPe4nSOAEdBvGLLLAIiVoKgeRy+XwFE1if8kv2bQuDixs8K17gzJ3dkY1k4WFw8AsyptnVhQsneesHq9J8XVK0Ha1T/JuCaEGJokxJD5DJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.164.118
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app1 (Coremail) with SMTP id TAJkCgDnfHGEeipqwM0mAA--.31766S2;
	Thu, 11 Jun 2026 17:06:14 +0800 (CST)
From: hehuan1@eswincomputing.com
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com,
	dongxuyang@eswincomputing.com,
	Huan He <hehuan1@eswincomputing.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Date: Thu, 11 Jun 2026 17:06:10 +0800
Message-ID: <20260611090610.757-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
In-Reply-To: <20260611090505.734-1-hehuan1@eswincomputing.com>
References: <20260611090505.734-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDnfHGEeipqwM0mAA--.31766S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw43XrWrXF4fKr15KF1UGFg_yoW8tw4kpF
	4kCryDGr10qryxX3y7tF109F1ftws5CFW7Arn2q3WrKF1DJas0yr43Kr15Was7Cr1fXFW3
	ZFyaq34jya1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXJ5wUUUUU=
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:linmin@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:luyulin@eswincomputing.com,m:dongxuyang@eswincomputing.com,m:hehuan1@eswincomputing.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15024-lists,linux-hwmon=lfdr.de];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hehuan1@eswincomputing.com,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hehuan1@eswincomputing.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	R_DKIM_NA(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,eswincomputing.com:email,eswincomputing.com:mid,eswincomputing.com:from_mime,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29E7E67037B

From: Huan He <hehuan1@eswincomputing.com>

Add device tree binding documentation for ESWIN EIC7700 Voltage and
Temperature sensor.

The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
power domains respectively.

Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
Signed-off-by: Huan He <hehuan1@eswincomputing.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
new file mode 100644
index 000000000000..27cc90e52d4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/eswin,eic7700-pvt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EIC7700 PVT Sensor
+
+maintainers:
+  - Yulin Lu <luyulin@eswincomputing.com>
+  - Huan He <hehuan1@eswincomputing.com>
+
+description:
+  ESWIN EIC7700 SoC integrates embedded voltage and temperature sensors to
+  monitor the internal SoC environment. The system includes two PVT sensor
+  instances. The PVT0 monitors the main SoC power domain. The PVT1 sensor
+  monitors the DDR core power domain.
+
+allOf:
+  - $ref: /schemas/hwmon/hwmon-common.yaml#
+
+properties:
+  compatible:
+    const: eswin,eic7700-pvt
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+  - '#thermal-sensor-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sensor@50b00000 {
+      compatible = "eswin,eic7700-pvt";
+      reg = <0x50b00000 0x10000>;
+      clocks = <&clocks 244>;
+      interrupts = <349>;
+      interrupt-parent = <&plic>;
+      label = "pvt0";
+      resets = <&reset 111>;
+      #thermal-sensor-cells = <0>;
+    };
+...
-- 
2.25.1


