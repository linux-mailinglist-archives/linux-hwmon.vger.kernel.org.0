Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33808166E50
	for <lists+linux-hwmon@lfdr.de>; Fri, 21 Feb 2020 05:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbgBUEQr (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 20 Feb 2020 23:16:47 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:58132 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbgBUEQr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Feb 2020 23:16:47 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id ABC0C886BF;
        Fri, 21 Feb 2020 17:16:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1582258603;
        bh=mvvz71fd9ax1lJ7OsfFZtFfyACbY6CnOTOhmEvtEqTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Si4a9Ztq3hH7cS4ZNR3118mxghrEV/upozAQllv8LVMY7rHHwhB8vy/uLE9KLjDsd
         BJvL/NzzxYrUZMPlVP+KORQXnojn9RLPbyHe+GGH9YtBK55RbJ303vUqmcpZR4H04c
         EyB2/1BpCjKuBLtKxmfzt5PjKk378ACBCsrGbGc0pE9pNvID+Rb5sStt9qTQycpp3q
         lx59WEldjcVJD7lM81P15/jtkSutbq5Ku+6hSrY2VAlsXdz1GCYWXxpPVMnEFG8WXh
         E0jL5arLO2b6u4MnpvQBESUE8Ou45q1StLPoYWDSIeTf+6fFy2dVqhFoK1yCfEpu39
         vGq4RliV+/pBg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e4f59ac0000>; Fri, 21 Feb 2020 17:16:44 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id D7FA513EECD;
        Fri, 21 Feb 2020 17:16:42 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 6A8DB28006D; Fri, 21 Feb 2020 17:16:43 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, logan.shaw@alliedtelesis.co.nz,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 1/5] dt-bindings: hwmon: Document adt7475 binding
Date:   Fri, 21 Feb 2020 17:16:27 +1300
Message-Id: <20200221041631.10960-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221041631.10960-1-chris.packham@alliedtelesis.co.nz>
References: <20200221041631.10960-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Logan Shaw <logan.shaw@alliedtelesis.co.nz>

Add binding for adi,adt7475 and variants.
Remove from trivial-devices.

Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - split conversion to yaml from addition of new properties

 .../devicetree/bindings/hwmon/adt7475.yaml    | 57 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  8 ---
 2 files changed, 57 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Docum=
entation/devicetree/bindings/hwmon/adt7475.yaml
new file mode 100644
index 000000000000..2252499ea201
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/adt7475.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ADT7475 hwmon sensor
+
+maintainers:
+  - Jean Delvare <jdelvare@suse.com>
+
+description: |
+  The ADT7473, ADT7475, ADT7476, and ADT7490 are thermal monitors and mu=
ltiple
+  PWN fan controllers.
+
+  They support monitoring and controlling up to four fans (the ADT7490 c=
an only
+  control up to three). They support reading a single on chip temperatur=
e
+  sensor and two off chip temperature sensors (the ADT7490 additionally
+  supports measuring up to three current external temperature sensors wi=
th
+  series resistance cancellation (SRC)).
+
+  Datasheets:
+  https://www.onsemi.com/pub/Collateral/ADT7473-D.PDF
+  https://www.onsemi.com/pub/Collateral/ADT7475-D.PDF
+  https://www.onsemi.com/pub/Collateral/ADT7476-D.PDF
+  https://www.onsemi.com/pub/Collateral/ADT7490-D.PDF
+
+  Description taken from onsemiconductors specification sheets, with min=
or
+  rephrasing.
+
+properties:
+  compatible:
+    enum:
+      - adi,adt7473
+      - adi,adt7475
+      - adi,adt7476
+      - adi,adt7490
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c {
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      hwmon@2e {
+        compatible =3D "adi,adt7476";
+        reg =3D <0x2e>;
+      };
+    };
+
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
index 978de7d37c66..57173ec41c30 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -34,14 +34,6 @@ properties:
           - adi,adt7461
             # +/-1C TDM Extended Temp Range I.C
           - adt7461
-            # +/-1C TDM Extended Temp Range I.C
-          - adi,adt7473
-            # +/-1C TDM Extended Temp Range I.C
-          - adi,adt7475
-            # +/-1C TDM Extended Temp Range I.C
-          - adi,adt7476
-            # +/-1C TDM Extended Temp Range I.C
-          - adi,adt7490
             # Three-Axis Digital Accelerometer
           - adi,adxl345
             # Three-Axis Digital Accelerometer (backward-compatibility v=
alue "adi,adxl345" must be listed too)
--=20
2.25.0

