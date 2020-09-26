Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3AD279C71
	for <lists+linux-hwmon@lfdr.de>; Sat, 26 Sep 2020 22:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbgIZUuG (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 26 Sep 2020 16:50:06 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45468 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726311AbgIZUuG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Sep 2020 16:50:06 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 26 Sep 2020 23:50:01 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08QKnxqD000484;
        Sat, 26 Sep 2020 23:50:01 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v4 2/2] dt-bindings: Add MP2975 voltage regulator device
Date:   Sat, 26 Sep 2020 23:49:57 +0300
Message-Id: <20200926204957.10268-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200926204957.10268-1-vadimp@nvidia.com>
References: <20200926204957.10268-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Monolithic Power Systems, Inc. (MPS) dual-loop, digital, multi-phase
controller.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3
 - Fix after 'make dt_binding_check'.
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4ace8039840a..b2e994bc00af 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -80,6 +80,8 @@ properties:
           - fsl,mpl3115
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # Monolithic Power Systems Inc. multi-phase controller mp2975
+          - mps,mp2975
             # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
           - gmt,g751
             # Infineon IR38064 Voltage Regulator
-- 
2.11.0

