Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98098277B59
	for <lists+linux-hwmon@lfdr.de>; Thu, 24 Sep 2020 23:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgIXVy4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 24 Sep 2020 17:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgIXVyx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Sep 2020 17:54:53 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC88FC0613CE
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2020 14:54:52 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id 135so289907pfu.9
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2020 14:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to;
        bh=2E/xrZXG4snTQvNN8sxghzfzhE3a0xWl+7B2al7VEYQ=;
        b=pEOtua9kRm7qArbE3RNJ2+Erz9ivP52Rq0skDG57m+FhTp9Nd/1U+9lKec8f22lqWg
         2WXSsCGkmwZdJ2QmeddXSV9JIEDPZSWxmFRDA6R1gI7dVK00H6VYEpfKxhT7/4kO4TiK
         yQXdwckSDQFrMX8B6M3mZJTPpJh0EtF9ZG9QTZawhBlpiPvEUDzKIfYVr0CwRmJ16PBF
         9CVlqSHR+HRr+nFDJiETIRwXTAzcLmWlQwU0utyLKDk8gX64LUCpnC1jW6ZO70n69MI2
         pzCEWx6u1j2+57KN92mRpMrrfkyNJBFN93hdqz5VG2p8qku8jC3fIEFhBgjqaWucf/bT
         OGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to;
        bh=2E/xrZXG4snTQvNN8sxghzfzhE3a0xWl+7B2al7VEYQ=;
        b=P0D0k8n8/zTYk85YIbjGFemoCMjSR2LvPUZougttivixU5W/0JFlC/JgziDjkKXTtl
         F6WwFpBXB+Fb+QjvIEQn2Q2bASC4U4CY8SGUJr0qN2U2APjSL+1IrTR0Qfmux7EdWJiN
         6HkqPzgrZ9vTYds5XpHNEqbfPwfBjPFguR0FqqzPagSj540miTLMxN69+gIUyrdF0nRV
         vg2TUF4Zsf1yb97DaJctxMVGnDKVAFu5bD1GLKppjq1b2/Ql0+QPv8ksZ5OTMlElTD35
         8iiLcQJvw8bgCJM7nuwnCOJXee4G1/9WDXEbBgaAVWBt7GA4AtX/uREss3sdPyhlWCy+
         +IMw==
X-Gm-Message-State: AOAM532Z91Z9CqdiFY+ohMs4lzegOeCYzjC6pMyC+/qGJq1QmjZOco9F
        +qpfTKb9GlfllcuUOg318Vli+jFaugZXSbrk
X-Google-Smtp-Source: ABdhPJxCEpZGKUe+br0m5BAiDOO8++/bbUvm0kfVYfjlQAxW7eZ48JBasD2RGg0kCCymB93FF3Q65dGvDi4KqHck
Sender: "linchuyuan via sendgmr" <linchuyuan@chu-dev.c.googlers.com>
X-Received: from chu-dev.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3cfb])
 (user=linchuyuan job=sendgmr) by 2002:a63:b47:: with SMTP id
 a7mr914923pgl.57.1600984492269; Thu, 24 Sep 2020 14:54:52 -0700 (PDT)
Date:   Thu, 24 Sep 2020 21:54:43 +0000
In-Reply-To: <20200924215444.2865885-1-linchuyuan@google.com>
Message-Id: <20200924215444.2865885-2-linchuyuan@google.com>
Mime-Version: 1.0
References: <20200924215444.2865885-1-linchuyuan@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 1/2] dt-bindings: hwmon: max20730: adding device tree doc
 for max20730
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@google.com, jdelvare@suse.com, linux@roeck-us.net,
        robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiongwang@google.com, zhongqil@google.com, jasonling@google.com,
        belgaied@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

max20730 Integrated, Step-Down Switching Regulator with PMBus

Signed-off-by: Chu Lin <linchuyuan@google.com>
---
 .../bindings/hwmon/maxim,max20730.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml
new file mode 100644
index 000000000000..7372b27334c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/maxim,max20730.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max20730
+
+maintainers:
+  - Jean Delvare <jdelvare@suse.com>
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The MAX20730 is a fully integrated, highly efficient switching regulator
+  with PMBus for applications operating from 4.5V to 16V and requiring
+  up to 25A (max) load. This single-chip regulator provides extremely
+  compact, highefficiency power-delivery solutions with high-precision
+  output voltages and excellent transient response
+
+  Datasheets:
+    https://datasheets.maximintegrated.com/en/ds/MAX20730.pdf
+    https://datasheets.maximintegrated.com/en/ds/MAX20734.pdf
+    https://datasheets.maximintegrated.com/en/ds/MAX20743.pdf
+
+properties:
+  compatible:
+    enum:
+      - maxim,max20730
+      - maxim,max20734
+      - maxim,max20743
+
+  reg:
+    maxItems: 1
+
+  vout-voltage-divider:
+    description: |
+      If voltage divider presents at vout, the voltage at voltage sensor pin
+      will be scaled. The properties will convert the raw reading to a more
+      meaningful number if voltage divider presents. It has two numbers,
+      the first number is the output resistor, the second number is the total
+      resistance. Therefore, the adjusted vout is equal to
+      Vout = Vout * output_resistance / total resistance.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      max20730@10 {
+        compatible = "maxim,max20730";
+        reg = <0x10>;
+        vout-voltage-divider = <1000 2000>; // vout would be scaled to 0.5
+      };
+    };
-- 
2.28.0.681.g6f77f65b4e-goog

