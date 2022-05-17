Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96BCF529B92
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 May 2022 09:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbiEQH5s (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 17 May 2022 03:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238275AbiEQH5o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 03:57:44 -0400
Received: from inet10.abb.com (spf.hitachienergy.com [138.225.1.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB16837A35
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 00:57:23 -0700 (PDT)
Received: from gitsiv.ch.abb.com (gitsiv.keymile.net [10.41.156.251])
        by inet10.abb.com (8.14.7/8.14.7) with SMTP id 24H7udmT011077;
        Tue, 17 May 2022 09:56:39 +0200
Received: from ch10641.keymile.net.net (ch10641.keymile.net [172.31.40.7])
        by gitsiv.ch.abb.com (Postfix) with ESMTP id 27F8265FAB06;
        Tue, 17 May 2022 09:56:39 +0200 (CEST)
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Holger Brunck <holger.brunck@hitachienergy.com>
Subject: [v3 1/3] dt-bindings: hwmon: lm90: add missing ti,tmp461
Date:   Tue, 17 May 2022 09:56:26 +0200
Message-Id: <20220517075626.16809-1-holger.brunck@hitachienergy.com>
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

This sensor is already supported from the driver, but is missing in the
list of compatible devices in the yaml file.

Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
---
changes for v3:
  - new in this patch serie

 Documentation/devicetree/bindings/hwmon/national,lm90.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 30db92977937..48b7065798b0 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -34,6 +34,7 @@ properties:
       - nxp,sa56004
       - onnn,nct1008
       - ti,tmp451
+      - ti,tmp461
       - winbond,w83l771
=20
=20
--=20
2.35.1.871.gab1f276

