Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64DC5FD74E
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Oct 2022 11:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJMJsu (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Oct 2022 05:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJMJst (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Oct 2022 05:48:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF2E103DBB
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 02:48:47 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id d26so2676679eje.10
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Oct 2022 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQDCrD9Wm+r98pdwjZiH7GxtGGcAJJYePNbhmCe7RnU=;
        b=cfJPdRFNi+UMtvBJXLGOdH4w/iLiMNeJS18XrNNGN3uzphv2jysSYrcT3geWWXi93i
         /R9/I46muO3Mfn6zDudIqsSsRoV14WtjCTADJlBUzGuI4hedpsKv8hvnTu9yzXbPyGeH
         xiedfSugTtsnEeSgbStUdJmIcwDY2AtVZXR5G2cPvgGH9/0rasOGiRfRCB800MvMbWd4
         ErUmWogCYPAaYwrTT4AYJQmMulJSea8/BvSzGKyHb0Mt8cWfKYf49pwAAeiRIrgbkVPk
         /q924vmYoujxM/+K0dZ5/KHmGz0vu6OZUylU+89csLn5n8cyHOe6xdEHirtr8sGEB88y
         eljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQDCrD9Wm+r98pdwjZiH7GxtGGcAJJYePNbhmCe7RnU=;
        b=wJrpsFU58+0p6OOrBseE0aCA6Bj4dODZAmQHC67Qyy+8bQ8LKj6YEngmAZnaH5nwHL
         iaRuJMK3VdqYqscpNvWzvIAdB3r+qQeoXfveJJPSSLc+0vdQJZaJQc8OpQPFhiA3w8u4
         GvL9SAs9q/jSgJJAmVfYav6di9gYX0ZVSvoCVNhRaeekD+4A5w8oHOul9isOI3XUd+Re
         EM7USvdKtAxT4L7M7KFViBxRnybdl8DsNJzt0joJiOqp92mw11WEOlZn7lkRNoyquiSc
         BhM6sX9g9N9w5vaetqjeBaNh+MxZLQWMr8mKPwI6e/wfGq/lOkAdqwJ/j70VP7BOy45q
         B2dQ==
X-Gm-Message-State: ACrzQf0R5u//N3zY9mQwnClDM31E1bSJiOHfQBcUQ+5nYyoSaNFe+F8a
        L9nEN68msco94VLd6ACkZcRN1A==
X-Google-Smtp-Source: AMsMyM57MX82CrF1Za+xMEdjXmQ23yokVaaB1x107t6Dniv67wvVZdyip/IlBUrHge9PVCZnD1tMoA==
X-Received: by 2002:a17:906:4783:b0:780:5be5:c81b with SMTP id cw3-20020a170906478300b007805be5c81bmr26275821ejc.76.1665654525464;
        Thu, 13 Oct 2022 02:48:45 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906080e00b0078d25e0f74bsm2685353ejd.46.2022.10.13.02.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 02:48:45 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: hwmon: Add binding for max6639
Date:   Thu, 13 Oct 2022 11:48:37 +0200
Message-Id: <20221013094838.1529153-3-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
References: <20221013094838.1529153-1-Naresh.Solanki@9elements.com>
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

From: Marcello Sylvester Bauer <sylv@sylv.io>

Add Devicetree binding documentation for Maxim MAX6639 temperature
monitor with PWM fan-speed controller.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../bindings/hwmon/maxim,max6639.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
new file mode 100644
index 000000000000..22065ea56880
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
@@ -0,0 +1,86 @@
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      fan-controller@10 {
+        compatible = "maxim,max6639";
+        reg = <0x10>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan@0 {
+          reg = <0x0>;
+          pulses-per-revolution = <2>;
+          max-rpm = <4000>;
+        };
+
+        fan@1 {
+          reg = <0x1>;
+          pulses-per-revolution = <2>;
+          max-rpm = <8000>;
+        };
+      };
+    };
+...
-- 
2.37.3

