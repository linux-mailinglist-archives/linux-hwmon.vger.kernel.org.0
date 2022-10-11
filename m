Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 230F95FB0B4
	for <lists+linux-hwmon@lfdr.de>; Tue, 11 Oct 2022 12:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiJKKry (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 11 Oct 2022 06:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiJKKrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Oct 2022 06:47:51 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689F08C03A
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 03:47:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id k2so30503912ejr.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Oct 2022 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IuKg8wVBGTOsKpjKNW1EW8n9Vvxn6eTgyy2JmUPJws=;
        b=Zdu4c/yEdk9Q1KsO8XOxSRVVtxYl1S3hZSSZMDTIHSGD0mM65BQyyHjLxwWoWdjJ1p
         E0K1j9YXmp3dCssCobzhYsyEn5uBB4ThALFno2yaHSGPvrwsut7WlIlpsEBHgqKx2BuT
         bl5Yuy2/Y7k/FqXxftMl1dWZgz4yHR3Ey4B3fUOmTcjQWEEipButNyzRF11EhogBbQ1f
         VzCZ/kDAsdqPw0gveRuDXnTvN4+60KUdvGq3mgh8TXvBE17pLfQ+zROL8rf253NzKRtr
         Eq8iaIjFUFoGusUP/IEJBDsmDhR4ShJG9YTgS536mb8kUKVFzlk+14yel+OMK5eC6xPc
         wKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IuKg8wVBGTOsKpjKNW1EW8n9Vvxn6eTgyy2JmUPJws=;
        b=mbSnxPZocaXR6KNT2WudQttpMMOnMcigNUvLtKS8UP13iRazlw43qqoZWGWvwdU7oH
         FicU4pclE8MsVpn8eDZkc9/hS6MJ8tKIyIvOq/KNgb0VvYpM/8DXQ2PSvFenzk97qVQf
         nzSbt0gY08OeYEcauxymktOdHQT1HGQw1gcVIZ+DBmh10tvvDnBt3HOqc+l45teZb6ms
         nNMxTFTm8ZTooVA7h+CxiKyR9xwAgE3xH3atdPtTk9DX2KG+GlW99E67HSMaR5mojMYn
         AgJ2RrP5wt7jG/4Go/u8Y7DWvJApRNrt6BRf79L0Ojn8qIGWiQVe4rj6f8tG5EMDHfG8
         x88A==
X-Gm-Message-State: ACrzQf1Y7Rv/b65fiR8+d6196tKYuHwHubSWwvIPxxx8nfjF2w1wF7Ye
        T4fI9iG8ZpPiAVkm769iqb/JNQ==
X-Google-Smtp-Source: AMsMyM7SBina8z3wTZWqcXcJpTiUYLewnNd5JBT7fxJTNbNcLIRYIQeT3eTVulRtKmRASkiDNRhXsw==
X-Received: by 2002:a17:906:6a16:b0:78d:e4b3:5365 with SMTP id qw22-20020a1709066a1600b0078de4b35365mr1270116ejc.107.1665485268510;
        Tue, 11 Oct 2022 03:47:48 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id mf22-20020a1709071a5600b0074136cac2e7sm6753081ejc.81.2022.10.11.03.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:47:48 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Naresh Solanki <naresh.solanki@9elements.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH v2 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date:   Tue, 11 Oct 2022 12:47:37 +0200
Message-Id: <20221011104739.53262-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011104739.53262-1-Naresh.Solanki@9elements.com>
References: <20221011104739.53262-1-Naresh.Solanki@9elements.com>
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

Add common fan properties bindings to a schema.

Bindings for fan controllers can reference the common schema for the
fan

child nodes:

  patternProperties:
    "^fan@[0-2]":
      type: object
      allOf:
        - $ref: fan-common.yaml#

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..abc8375da646
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common fan properties
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+
+properties:
+  max-rpm:
+    description:
+      Max RPM supported by fan
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pulse-per-revolution:
+    description:
+      The number of pulse from fan sensor per revolution.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  target-rpm:
+    description:
+      Target RPM the fan should be configured during driver probe.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwm-frequency:
+    description:
+      PWM frequency for fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwm-polarity-inverse:
+    description:
+      PWM polarity for fan.
+    type: boolean
+
+  label:
+    description:
+      Optional fan label
+    $ref: /schemas/types.yaml#/definitions/string
+
+additionalProperties: true
+
+examples:
+  - |
+
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan-controller@30 {
+            compatible = "maxim,max6639";
+            reg = <0x30>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            fan@0 {
+                reg = <0>;
+                label = "CPU0_Fan";
+                max-rpm = <32000>;
+                pulse-per-revolution = <2>;
+                target-rpm = <2000>;
+                pwm-frequency = <25000>;
+            };
+
+            fan@1 {
+                reg = <1>;
+                label = "PCIe0_Fan";
+                max-rpm = <32000>;
+                pulse-per-revolution = <2>;
+                target-rpm = <2000>;
+                pwm-frequency = <25000>;
+            };
+
+        };
+    };
+
+...

base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
-- 
2.37.3

