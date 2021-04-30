Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7BD936FB71
	for <lists+linux-hwmon@lfdr.de>; Fri, 30 Apr 2021 15:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhD3N2i (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 30 Apr 2021 09:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhD3N2g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Apr 2021 09:28:36 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB023C06138B
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 06:27:46 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id di13so368022edb.2
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Apr 2021 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=feYF2FbCyxkIqd68yiyYplG01viadzbW5WvjP0MfKaU=;
        b=K9UhKixL3CZmTqi/xOWvTG2e1h6txyNPPel9HumPpa6QIdpmoZdfbSmdH+lK3zrZ0R
         QSxfoGESDmBnPpOceKCU2xbeOq9by0UeeDlXsM1/Pi81sjyGTKo5w0HbXlduZuiyGDSH
         ZIYQlOB2DQSThKZcSVmNY6/SN/cr5XCFQpzu0Cvu4sBiJF1hNQHc6rlH2KqHXypDnPXT
         9hCUjZZu1s2o8vEYNARqyj62v4djb1Qg2uUdyNwnnrvP9LDbj/dvthtqGQm/Q4u/QEMt
         n8oDjgSOzUE8DDTFvRz3et0qwGhBr4A9EY+4E7yEgCBN2WkARtfsIsk18cptTIlTn8Zl
         EamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=feYF2FbCyxkIqd68yiyYplG01viadzbW5WvjP0MfKaU=;
        b=fOrM/aqrbTOTMEQ6hb/0IbKHpIa9FQBVwDboQID7MB3KRReysZ31bjpOQe5+BONXsL
         6WvFf2ffvSx/WsuzmYTjD1JbySsfaw9mPnlzr3ShDZPwy7TzsLTM4/A7+VXG+U5RIT2g
         6HAiC8uUFXwtZS6W/2M7Fu0CaPIq2CxFCbqebQsfNs5fkagxMkmcV6+D2IMTwYQwL6QW
         DgB09+cIjDcH1/Gj/vCUGV6AKi7gZ8WCdLACD6frw3VZNtg37Pp/3+WEUo7F77frBJMb
         8J5F9VaxFeBD5kREmihojTui2jXg0yMBpl8u8HL7SE6/Cp7FHWJ56JtEQS7e0Hps50T7
         OS5A==
X-Gm-Message-State: AOAM531TSvgTV0diLFsxTREDoa6u8EgKBDAtjWyBCr0wCJ+2qG1vLNui
        PEojvsVzMz9VsZMfNQqAT3wPtA==
X-Google-Smtp-Source: ABdhPJyZrxGAkIaR69McYLjaEyF1mVKGb7UimXMCwpW+rvCfTEvOLab2kOi1pLDlX4VWcz9y0ExIfA==
X-Received: by 2002:a05:6402:35cd:: with SMTP id z13mr6014272edc.21.1619789265613;
        Fri, 30 Apr 2021 06:27:45 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-15.xnet.hr. [88.207.97.15])
        by smtp.googlemail.com with ESMTPSA id o6sm1245776edw.24.2021.04.30.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 06:27:45 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/3] dt-bindings: hwmon: pmbus: Add Delta DPS920AB PSU driver bindings
Date:   Fri, 30 Apr 2021 15:27:34 +0200
Message-Id: <20210430132735.127342-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430132735.127342-1-robert.marko@sartura.hr>
References: <20210430132735.127342-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add binding document for the Delta DPS920AB PSU driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/hwmon/pmbus/delta,dps920ab.yaml  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/delta,dps920ab.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,dps920ab.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,dps920ab.yaml
new file mode 100644
index 000000000000..e05363a8e455
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,dps920ab.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/delta,dps920ab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Delta DPS920AB power supply
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  Delta DPS920AB is a 920W 54V DC single output power supply
+  with active PFC capable of 16.88A on the 54V output.
+  It has a built in PWM capable fan with tachometer.
+  PMBus is used to expose information about the PSU.
+
+properties:
+  compatible:
+    enum:
+      - delta,dps920ab
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        psu@5a {
+            compatible = "delta,dps920ab";
+            reg = <0x5a>;
+        };
+    };
-- 
2.31.1

