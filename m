Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5279704B03
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 May 2023 12:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbjEPKq7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 16 May 2023 06:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjEPKq6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 May 2023 06:46:58 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF291BFC;
        Tue, 16 May 2023 03:46:56 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34G7ru2b003542;
        Tue, 16 May 2023 06:46:33 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3qj4d6b5yd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 06:46:33 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 34GAkWmp061588
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 May 2023 06:46:32 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 16 May
 2023 06:46:31 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 16 May 2023 06:46:31 -0400
Received: from daniel-Precision-5530.ad.analog.com ([10.48.65.214])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 34GAkHps016852;
        Tue, 16 May 2023 06:46:20 -0400
From:   Daniel Matyas <daniel.matyas@analog.com>
CC:     Daniel Matyas <daniel.matyas@analog.com>,
        Rob Herring <robh@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v9 1/2] dt-bindings: hwmon: add MAX31827
Date:   Tue, 16 May 2023 13:46:06 +0300
Message-ID: <20230516104609.7095-1-daniel.matyas@analog.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: MmjBDTxzrG3wWBVm2kvTt0eRChbFK2WY
X-Proofpoint-ORIG-GUID: MmjBDTxzrG3wWBVm2kvTt0eRChbFK2WY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160091
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

MAX31827 is a low-power temperature switch with I2C interface.

The device is a ±1°C accuracy from -40°C to +125°C
(12 bits) local temperature switch and sensor with I2C/SM-
Bus interface. The combination of small 6-bump wafer-lev-
el package (WLP) and high accuracy makes this temper-
ature sensor/switch ideal for a wide range of applications.

Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v8 -> v9: Removed the '--base' option when using 'git format-patch'

I really hope it will be ok this way... 

.../bindings/hwmon/adi,max31827.yaml          | 54 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31827.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
new file mode 100644
index 000000000000..2dc8b07b4d3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,max31827.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX31827, MAX31828, MAX31829 Low-Power Temperature Switch
+
+maintainers:
+  - Daniel Matyas <daniel.matyas@analog.com>
+
+description: |
+  Analog Devices MAX31827, MAX31828, MAX31829 Low-Power Temperature Switch with
+  I2C Interface
+  https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
+
+properties:
+  compatible:
+    oneOf:
+      - const: adi,max31827
+      - items:
+          - enum:
+              - adi,max31828
+              - adi,max31829
+          - const: adi,max31827
+
+  reg:
+    maxItems: 1
+
+  vref-supply:
+    description:
+      Must have values in the interval (1.6V; 3.6V) in order for the device to
+      function correctly.
+
+required:
+  - compatible
+  - reg
+  - vref-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@42 {
+            compatible = "adi,max31827";
+            reg = <0x42>;
+            vref-supply = <&reg_vdd>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..5d5359f59af5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12617,6 +12617,13 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
 
+MAX31827 TEMPERATURE SWITCH DRIVER
+M:	Daniel Matyas <daniel.matyas@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	http://ez.analog.com/community/linux-device-drivers
+F:	Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
+
 MAX6650 HARDWARE MONITOR AND FAN CONTROLLER DRIVER
 L:	linux-hwmon@vger.kernel.org
 S:	Orphan
-- 
2.34.1

