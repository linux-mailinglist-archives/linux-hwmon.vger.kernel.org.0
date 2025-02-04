Return-Path: <linux-hwmon+bounces-6450-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F5A2793E
	for <lists+linux-hwmon@lfdr.de>; Tue,  4 Feb 2025 19:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4113618833C6
	for <lists+linux-hwmon@lfdr.de>; Tue,  4 Feb 2025 18:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFCB216E1E;
	Tue,  4 Feb 2025 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="ci4wS7Br"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510641D516A
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Feb 2025 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692204; cv=none; b=DWVuXjBjkDnulKe8ToV/WntVJDBcvSqf5WyNvG/AEkJG3P3iD2Ty3Nk/5Sgwn/fy7Yw09n24abavDImjcTW860JLpgPpPIFQgQWc1dY/ArkQ7f1GWjC6kF9KouFWvWKYhzXduqKhVWpsZjfMfuRjRP2uSy0l5CbjOq/QRXmyrr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692204; c=relaxed/simple;
	bh=xfFeaA3aQ/gpQCUTZPba7AJ+HX38O5FL0YsuMNgMClk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tH811TQ5+8Qhruxl4qkU3kEJidA80ik2yjawWFKOapzFl+dzzDHF73WoRNZa3t6U8oHQfUYrkO9iqNAM/R2+LCs4Dbex3hunhpcBhhMZ1PixXJYBAxgth4aezJNiBNG2A54ly7YymIY+c6JMuxecHYmSztIaup1Y55F3NSxbGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=ci4wS7Br; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso60549895e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Feb 2025 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738692200; x=1739297000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyTJpLynAZ3x16CbnY5MWeiGrmP7Yk69R+UM5RrX7wA=;
        b=ci4wS7Br0lAx0ETJ0CjWFeEfRb/XsMLYek+Lz2QVvilttY15tX2cYZdELiWgg/DAms
         0dXb9ustUvPMtXTFcOWO/F+PJWETrPs3xwhwhUqUk0wnajUuC1cpu9kWO0GKg6MZk21N
         9SXCWUt8xKYzleZgb+45C817t//N4NRnJg/6GV2Eda9zb8XOjPkDZwFYnflh7dN1GknM
         Qr4pZXcZWCfgfIu1nQfgRvjFT81dDWr5/Eyf2DFR9IeFYA9freQO6ONTm2/WfiOxsdz3
         CkpZ5S6pmhDWyf/DbtCtNxrnKbAWBsNHcDnO6x1UgXfCWbvrC8fdVRV3zR+PD94nd6ML
         ki1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692200; x=1739297000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyTJpLynAZ3x16CbnY5MWeiGrmP7Yk69R+UM5RrX7wA=;
        b=SCKv3sYjbjWxYPDBqn4DwxfsczW9loOR4tIapzmQ7642/HBdTD9tCn2UBKpPexgM8t
         E1Og2s1U9wtu/jiG1nr23OtKBZGwxMpkZNMGpivc4HOnMvJMS8yAWhVGNXQlgkAdW6GL
         x9E5X1ud6uLkGaQpMG+b4BaCi1p5ifyfcATIr8+4F0B99cWZBIwoBDsKDZY7yay0pgJu
         GJHYzy0VaaKuaF+Yk2sY1Ec9k7x7nHZX9c/AlFCStBr1uomsB+lZQMF2o+p6Ab6OawAg
         xTmQeHCidkvwAU9Uab5Gvem11TF9UymDEWGEi8OdVt6UnF/E9U0tcEM7+G8FTlHNdGDH
         cZsg==
X-Gm-Message-State: AOJu0Yw8hENt+RjlUTP5TCEZiOva1mcZiS/1NYQNgsOThb8GhCKWHBdL
	tPuP8uUctm6vLytbhFewGBgj69IOXTbhT8CUvAhEIRHIv+HoGDfY1ySI17BOm1I=
X-Gm-Gg: ASbGncvigpVgs7p5j3bO8rgJTxd7rG0OjYD6rCrAwg/L/H0+ITLvH0O86U+4JrTZlp6
	hKWSMTvwG4nCfkV6REz86lH1KQx1kZ4wCDHk2sikUdPs88QYPktJuTVgqYOP98Ag79NRKlJGN9n
	lUf4yH5fWA9seZ6WzFfCIJXzwobc6bN6X4XHvryduXzsw85BPj5DaqTC5uSyKRGi+5/N9WfoV0w
	abw+oAp1QZFYgSb5J7NJ/nqrChB3cv/hSvvuu7zveqg9XFS503CWxRG40NdSvSKYMeEeHi9hS3z
	7GU/xMDTqVrAl1oYrqY40l6uKuDm0LvO3HAuBb2Mtb2ydk6bwDPgyrHs7eCrA5/vzNPK3wC00b3
	kvNFRpj9qCh0=
X-Google-Smtp-Source: AGHT+IEF5gLfCU74QaWjKlf6C+ew0dh1VudWuQXDuNCEip2RjcGq0sjA/qgAiNB9pJOUTiqQbpkMHg==
X-Received: by 2002:a05:6000:1869:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38db0515fe4mr1728729f8f.49.1738692200108;
        Tue, 04 Feb 2025 10:03:20 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm202687235e9.28.2025.02.04.10.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:03:18 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Date: Tue,  4 Feb 2025 23:33:03 +0530
Message-ID: <20250204180306.2755444-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move dt binding under hwmon/pmbus & align accordingly.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
 .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
 2 files changed, 61 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
new file mode 100644
index 000000000000..e1f683846a54
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon Buck Regulators with PMBUS interfaces
+
+maintainers:
+  - Not Me.
+
+properties:
+  compatible:
+    enum:
+      - infineon,ir38060
+      - infineon,ir38064
+      - infineon,ir38164
+      - infineon,ir38263
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@34 {
+            compatible = "infineon,ir38060";
+            reg = <0x34>;
+
+            regulators {
+                vout {
+                    regulator-name = "p5v_aux";
+                    regulator-min-microvolt = <437500>;
+                    regulator-max-microvolt = <1387500>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
deleted file mode 100644
index e6ffbc2a2298..000000000000
--- a/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
+++ /dev/null
@@ -1,45 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Infineon Buck Regulators with PMBUS interfaces
-
-maintainers:
-  - Not Me.
-
-allOf:
-  - $ref: regulator.yaml#
-
-properties:
-  compatible:
-    enum:
-      - infineon,ir38060
-      - infineon,ir38064
-      - infineon,ir38164
-      - infineon,ir38263
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
-
-      regulator@34 {
-        compatible = "infineon,ir38060";
-        reg = <0x34>;
-
-        regulator-min-microvolt = <437500>;
-        regulator-max-microvolt = <1387500>;
-      };
-    };

base-commit: bfbb730c4255e1965d202f48e7aa71baa9a7c65b
-- 
2.42.0


