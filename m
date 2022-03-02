Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9514CA13D
	for <lists+linux-hwmon@lfdr.de>; Wed,  2 Mar 2022 10:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238975AbiCBJuf (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 2 Mar 2022 04:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235450AbiCBJue (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Mar 2022 04:50:34 -0500
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034C0B91F0;
        Wed,  2 Mar 2022 01:49:49 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4K7q8r0hYCz9sTn;
        Wed,  2 Mar 2022 10:49:48 +0100 (CET)
From:   Marcello Sylvester Bauer <sylv@sylv.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1646214586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p97zePmp9d+cmIP2kHmhFQpvfjnvmtO8AdQThs+dFK8=;
        b=s+33/JYWZdAj57Xj18ul4qV9xcx4mhTjBA8VuTXp8kvndZU8fmi+PwnCBURlNmnbrmf/l0
        MJ7p4pZittWO6A1/c6ZqHB13l8/9sJqatK1BFbfoVZM9V5URikVeMhTvHESyafupKQObuf
        iUDJOrOEshz5AJh8JBRRKWOkjcNZVWrh6m4vmCtTmZXur8eqrjBAEPIgylA+RrzzOTNQ9K
        E/qzM1AErVeGRlwH0wLNRZF59E6EylJf/PxJxp1zWXmoEcTJ08faxgyMWZaiDCZFPaLQRS
        jELOqk6FFODN7S4V3DpetjkgptkNN2uD/Jn15RLzvGWr8261EIbOaJvaSef3Qg==
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: trivial-devices: Add xdpe11280
Date:   Wed,  2 Mar 2022 10:49:19 +0100
Message-Id: <81c0523ba790965a371d267bb1944652d80f5f72.1646214248.git.sylv@sylv.io>
In-Reply-To: <cover.1646214248.git.sylv@sylv.io>
References: <cover.1646214248.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add Infineon Multi-phase Digital Controller XDPE11280.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 1c49bbc654ee..da929cb08463 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -137,6 +137,8 @@ properties:
           - infineon,slb9645tt
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
+            # Infineon Multi-phase Digital VR Controller xdpe11280
+          - infineon,xdpe11280
             # Infineon Multi-phase Digital VR Controller xdpe12254
           - infineon,xdpe12254
             # Infineon Multi-phase Digital VR Controller xdpe12284
-- 
2.35.1

