Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F9452060B
	for <lists+linux-hwmon@lfdr.de>; Mon,  9 May 2022 22:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiEIUoX (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 9 May 2022 16:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiEIUoU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 May 2022 16:44:20 -0400
Received: from inet10.abb.com (spf.hitachienergy.com [138.225.1.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C82285EC0
        for <linux-hwmon@vger.kernel.org>; Mon,  9 May 2022 13:40:24 -0700 (PDT)
Received: from gitsiv.ch.abb.com (gitsiv.keymile.net [10.41.156.251])
        by inet10.abb.com (8.14.7/8.14.7) with SMTP id 249DAING010687;
        Mon, 9 May 2022 15:10:18 +0200
Received: from ch10641.keymile.net.net (ch10641.keymile.net [172.31.40.7])
        by gitsiv.ch.abb.com (Postfix) with ESMTP id 7499265F9616;
        Mon,  9 May 2022 15:10:18 +0200 (CEST)
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Holger Brunck <holger.brunck@hitachienergy.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/2] dt-bindings: add extended-range-enable property to lm90.yaml
Date:   Mon,  9 May 2022 15:10:15 +0200
Message-Id: <20220509131016.29481-1-holger.brunck@hitachienergy.com>
X-Mailer: git-send-email 2.35.1.871.gab1f276
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add a boolean extended-range-enable to make the extented temperature
feature for some lm90 devices configurable.

Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
cc: Jean Delvare <jdelvare@suse.com>
cc: Guenter Roeck <linux@roeck-us.net>
cc: Rob Herring <robh+dt@kernel.org>
cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
---
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 30db92977937..98d01f6c9331 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -52,6 +52,10 @@ properties:
   vcc-supply:
     description: phandle to the regulator that provides the +VCC supply
=20
+  extended-range-enable:
+    description: Set to enable extended range temperature.
+    type: boolean
+
 required:
   - compatible
   - reg
--=20
2.34.1

