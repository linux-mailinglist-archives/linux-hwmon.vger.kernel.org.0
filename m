Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64A566298A8
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Nov 2022 13:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238246AbiKOMVU (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 15 Nov 2022 07:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238235AbiKOMVD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Nov 2022 07:21:03 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE20A26110
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Nov 2022 04:20:28 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id h9so23983239wrt.0
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Nov 2022 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXBfYsOqYyi9DKVQGkMLwQ+xTrxC76f34l8uPcGALOo=;
        b=QVuhYKf18L0AoojtU6p/3rxD6GxXhFGOP1Xd/AwvRbNUvNqS/Q9FbOsKPJ/fTcKRiG
         0Pm4YQE6aECuWxAqkLca9LlwUWCIAQaVPYhbgzugvPiysQO0jLr2Y2O0C6H95GbbjFTa
         QcODlRj7+C6+R/GAJlcDbhLhvMBJ+4UbL/8i/aZve8Yqcv0AeBrg7mHJnm48Hph7pUHe
         64Gd1Jew+tJcF/acGn1RLJDFOvZV8Dkasdc4tMQzB/VQIMYCTk1EMfvE36a8LveyUBjh
         IObqLWJVfSijorgbHoDnFMCAaxkTwa/tQreBtEyZaZ0B51ndEcmubmJAy1i1SE0CLXyN
         qwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXBfYsOqYyi9DKVQGkMLwQ+xTrxC76f34l8uPcGALOo=;
        b=I0eVgg0yhyN8FMZP0p6Ik148DFU1h9x2ykNZwwgOMSb6iserl6AT6FZ+nntTcY24dw
         eEIsQ/vLJmFBolKpYuEHWmYw0AsD+LAckPMrhk7L7Vpd2OxqvN36/9qYWb/7LVePjdl9
         U06FDjo5/Ev750KxDHhso+jNy34eIOF+0WWwbK/d5TVTpv3Yiur8CENUCOSMeC5nGgNE
         aIOQ3/WOkxPmbZTV9A515smi4SKfos1S9p3RtZOVirBgPE6q+Bdp/pefsN83kHsT+8Ei
         S+9UftImYjC1iiVc2YAD4ofh67o52kHPPk3OTIg7ItailXJYZ2Go3w+Lnj04GToAWvjp
         XNjw==
X-Gm-Message-State: ANoB5pmWQsfQxRXl7qcUI/as8upjZ+Isqlsn1Q+OsxxvEgM3l5nDJpAh
        e/pvq4aSLyi0YW44IxQnMPaUkg==
X-Google-Smtp-Source: AA0mqf7j1Fo21UYRcFX4woKovJOTzba3enUtD3k+E0+gF7cNLcYCRUQcHtvoysCwtlAcoiA//j/0ig==
X-Received: by 2002:a5d:694c:0:b0:238:b29e:4919 with SMTP id r12-20020a5d694c000000b00238b29e4919mr10655303wrw.583.1668514827503;
        Tue, 15 Nov 2022 04:20:27 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b435c41103sm27108954wmo.0.2022.11.15.04.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:20:27 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roland Stigge <stigge@antcom.de>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v5 2/3] dt-bindings: hwmon: Add binding for max6639
Date:   Tue, 15 Nov 2022 13:20:04 +0100
Message-Id: <20221115122005.758519-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221115122005.758519-1-Naresh.Solanki@9elements.com>
References: <20221115122005.758519-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Marcello Sylvester Bauer <sylv@sylv.io>

Add Devicetree binding documentation for Maxim MAX6639 temperature
monitor with PWM fan-speed controller.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../bindings/hwmon/maxim,max6639.yaml         | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..da040b11d2ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/maxim,max6639.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max6639
+
+maintainers:
+  - Roland Stigge <stigge@antcom.de>
+
+description: |
+  The MAX6639 is a 2-channel temperature monitor with dual, automatic, PWM
+  fan-speed controller.  It monitors its own temperature and one external
+  diode-connected transistor or the temperatures of two external diode-connected
+  transistors, typically available in CPUs, FPGAs, or GPUs.
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
+
+properties:
+  compatible:
+    enum:
+      - maxim,max6639
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  '#pwm-cells':
+    const: 3
+
+required:
+  - compatible
+  - reg
+
+patternProperties:
+  "^fan@[0-1]$":
+    type: object
+    description: |
+      Represents the two fans and their specific configuration.
+
+    $ref: fan-common.yaml#
+
+    properties:
+      reg:
+        description: |
+          The fan number.
+        items:
+          minimum: 0
+          maximum: 1
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan1: fan-controller@10 {
+            compatible = "maxim,max6639";
+            reg = <0x10>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            #pwm-cells = <3>;
+
+            fan@0 {
+                reg = <0x0>;
+                pulses-per-revolution = <2>;
+                max-rpm = <4000>;
+                target-rpm = <1000>;
+                pwms = <&fan1 0 25000 0>;
+            };
+
+            fan@1 {
+                reg = <0x1>;
+                pulses-per-revolution = <2>;
+                max-rpm = <8000>;
+                pwms = <&fan1 1 25000 0>;
+            };
+            };
+    };
+...
-- 
2.37.3

