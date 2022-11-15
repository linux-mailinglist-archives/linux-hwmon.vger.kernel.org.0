Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13ADB6298AA
	for <lists+linux-hwmon@lfdr.de>; Tue, 15 Nov 2022 13:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238203AbiKOMVT (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 15 Nov 2022 07:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238205AbiKOMVC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Nov 2022 07:21:02 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2848C25E98
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Nov 2022 04:20:28 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so3125918wma.3
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Nov 2022 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqZxBgmVFxK0RvfpAaJX1POwshKoiOnk2il2KX/mpC4=;
        b=Km0fNSp8psPEzNuTZwTN9hN+2UQhiyilmLv07sznLh91zL21JlJSmvDPq9ahnXRLIH
         US8qAKVP9pW9HWxuQH6k8G4OC7GxjAy4mv/TQj5+a9+7djwsVZdGFXgYeGjm3ZUunFRJ
         vPfmERv2Gto5ze6wrF1/CyzXh9Ubh3VYZJHx7DEYBGvfNUOFD0WsTBxTboiWaZGnBB9U
         BZksIaJen2wYsYY1swkGgXcTGL1QJBCooULzmzxHhkB5KUzhbrAw4RXx9Z4wM370ABK4
         X/ACtHNPYQfJ7AmRhFaTY09VUojD+iked5CH2IGPd1vUxZflbo5qgfMk/Vall1hkRWm8
         Q9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqZxBgmVFxK0RvfpAaJX1POwshKoiOnk2il2KX/mpC4=;
        b=B2JU9afyY77bf374pINUlxAD5lah8Nw5eYEiBx7a2A/dzamU7BqXrAzxE6V3o5Hojz
         TOMdDvBT1iAVL0Ptf7IOBLnkKpRSugfeWPouhjVLyNX8Pn6GB4OxEfGzQdOd+3EeuF56
         pbUNWA6YUoaNnppd46MlvAjuMjyYGi/dx+R6gaOosCKJtaDS52X5yvF8sxnJVW8Pb3X9
         +2wXN1DThEX6tQAWx6filJMo+Vx8irppCghwiMPQabcj28bAgNRGlADhYGduCBe5iKh2
         Bczjyw86bzZq3VT2Gs8miaro1Jh/Fg6prrTXbl6+1ngUHm6BzazvNk6d93dhS7fH3dgv
         Svqw==
X-Gm-Message-State: ANoB5pkP2nY4ace0AEX5UHa3R2OC7SonvODSaC+7zKMIaf2yMq1dasZ8
        IzTFfTX01pKuNwImczgAS6h71Q==
X-Google-Smtp-Source: AA0mqf7n9JR8JIprahuVlyhrGSgvTX+kEiYG7Z2XtC3G98cayuoYzA33yqgTi8lSmGMrE3et435Pzg==
X-Received: by 2002:a1c:540d:0:b0:3c6:c796:1071 with SMTP id i13-20020a1c540d000000b003c6c7961071mr128813wmb.138.1668514824556;
        Tue, 15 Nov 2022 04:20:24 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b435c41103sm27108954wmo.0.2022.11.15.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:20:24 -0800 (PST)
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
Subject: [PATCH v5 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date:   Tue, 15 Nov 2022 13:20:03 +0100
Message-Id: <20221115122005.758519-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221115122005.758519-1-Naresh.Solanki@9elements.com>
References: <20221115122005.758519-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
      $ref: fan-common.yaml#

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..1954882eed77
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
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
+      Max RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pulses-per-revolution:
+    description:
+      The number of pulse from fan sensor per revolution.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  target-rpm:
+    description:
+      Target RPM the fan should be configured during driver probe.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwms:
+    description:
+      PWM provider.
+
+  label:
+    description:
+      Optional fan label
+
+  fan-supply:
+    description:
+      Power supply for fan.
+
+additionalProperties: true
+
+...
-- 
2.37.3

