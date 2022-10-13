Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F316D5FD74B
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Oct 2022 11:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiJMJsr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Oct 2022 05:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiJMJsq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 05:48:46 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5347104531
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 02:48:45 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id 13so2734819ejn.3
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTl7droVltKnXDsBoh0Qb/I0hZgySD4P2UJsI4/mO+E=;
        b=VcpBLoI2GZnFQeZ10p9jSVjI2ovSK6WLIhf1cD/WeK7vjOV+a/mi71G01oUTaDG9HY
         uX7LtYmSLtlo2i//Hg6RU7kr8zHq1eU+MJsqay6jTioLELp6ZxRV7DqHkKc5m0euXO/G
         ecXpb9faVxqjgYixI4uv7vejFPx9VqGQXV+JtBFegC52xyECEveXo4FVY0iA4qKp8HvY
         PQ8Ylyq4N90WcGHwYTSuIeBMWZpy/wYTc5T5KvmjKKHymXbajALB1/ZFCKI90+4ZlzE4
         l695xSHTF7Gm4tF3itf1YfVpy+TiyI/V2TA9fOeL6vpPspVqc366VkF8pyMpGKJoW968
         F9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTl7droVltKnXDsBoh0Qb/I0hZgySD4P2UJsI4/mO+E=;
        b=xKbwRpCYLcq9ciyW2kuBIuG/UXFOtCh0rabXMRAY0AXZZmBiTdBNKCkAJXTpMFmC+m
         AHVPjPJD9MAfEU2iSf+v1RUimbKi9XMcknjWL0ByAqrXqxHO4BqlDGnm96ivoQ5Ckp07
         DJh4NrCVi3zd0A+QtrIAb5b3Fa5xPUiOiruPwwE6k61kHd+TDg4JaalI/KE1n2t0S4Ia
         TiJQZYUuzt6qad4zwlLTsXVeK1XIHkyqWvUYXZyg47XMcR2i6Ga7WXeJ53Vtu5SR1WlY
         Tb8B+JwN1T4qJFEFXXgh7luJouwy8ufaBMFHbEcQHcjI+ahlUUjCWRBFPLBmfc4HITZp
         VLGQ==
X-Gm-Message-State: ACrzQf1k5YDvyQiGHVTn6F99Bt3F5UJ4wvqHVm8n6pJYOxtHURKZXdg5
        qXwIJmfdgtDn/i/dkJ02ODlGQA==
X-Google-Smtp-Source: AMsMyM789ERJ0LfcbR1x85Clgkt+MXg5q0WqipXrwNTkaf6aozBlkgvD95mFYi97DUcuvbhdtIWtaQ==
X-Received: by 2002:a17:906:7945:b0:73b:e605:f31 with SMTP id l5-20020a170906794500b0073be6050f31mr25947222ejo.129.1665654524224;
        Thu, 13 Oct 2022 02:48:44 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906080e00b0078d25e0f74bsm2685353ejd.46.2022.10.13.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 02:48:43 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date:   Thu, 13 Oct 2022 11:48:36 +0200
Message-Id: <20221013094838.1529153-2-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
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
      $ref: fan-common.yaml#

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..224f5013c93f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,48 @@
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
+  default-rpm:
+    description:
+      Target RPM the fan should be configured during driver probe.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwm-frequency:
+    description:
+      PWM frequency for fan in Hertz(Hz).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  pwm-polarity-inverse:
+    description:
+      Inverse PWM polarity for fan.
+    type: boolean
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

base-commit: 0cf46a653bdae56683fece68dc50340f7520e6c4
-- 
2.37.3

