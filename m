Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A6958DBFC
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Aug 2022 18:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245021AbiHIQ2M (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 9 Aug 2022 12:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245017AbiHIQ2D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Aug 2022 12:28:03 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA2A18359
        for <linux-hwmon@vger.kernel.org>; Tue,  9 Aug 2022 09:28:00 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x25so13512494ljm.5
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Aug 2022 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvjM538Lt57aPAtY3bjfgbW8emF1tmOhCzp45F4HTBs=;
        b=ICG/3Y0P4RWgA/0Gi/4UlpWVRyTdyma//p23F60dT0+Zmw3VXvEqVGA5ukzEv+cw2t
         PnWHJ99YeOEmlzLjMF9eAACAKuU7E1VvZ8UeYybhftlXIDyduv8eOqYd7Fm+zF+1mXws
         bzmQoxqiwasnz+YqZtVqpfpQacvrfybziWBylA2q9ia2G/5HJiSA+mqhSx4FIBF0yYEK
         b8Xkwbr0Mh61hsjdAUOMku/GiQW51z6ykQ/t9abh5f+VkoRpAP7VfIEEu0R2AAgysp7O
         UA1RmYBz2NzfEidhLjPpQ5vQ3muEqkJ5DE7PX6mVHQuay4bboakfxaxkS5MZB6JEhCuz
         SgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvjM538Lt57aPAtY3bjfgbW8emF1tmOhCzp45F4HTBs=;
        b=OIw8Ka2Cy6E4MUxTPPsF4IPD8f/9DsNIaxUH7OOwFkW4uy4XIkZG3U+62wJX7mWuRg
         VOLuQCC6Jx5gKMLf03olr8JfmaZvBykSnc13k2FVlNp0/iCrwWEQWZaB21y6vUcSKKDk
         GHOYIztTgZqoquf/+2Xt/38VodK1dP0oURFPOfPTHIX48vOPjzOo2ErVtk8RqrCTot6H
         VQAFLWsrY6GTf5LCGY4A/QFVdrD+Rj/f6KI2PHhgtnymRrwjKiE2zpMSra+MG6fuyfg8
         B9yDVcQY8QJ/A4EudsXUGfcQmxDdR87xfxZ07BvjDgf6Y+n0qWDz586Wznlcm5F7TsZW
         pjwg==
X-Gm-Message-State: ACgBeo0irZ2ea7qafWxQu5eqxHnIOgNwUFkhYBoZym7Sl0irMOhjAEv2
        KiVDVe8xiE3Qgy2mIsvDz2fZxA==
X-Google-Smtp-Source: AA6agR4nSP4Nvz03+ppBOMLl8U1WhyjNooB6UiKwR/ZbuBfV0W58Zp1a5YPASidYywxtpOignuTHhw==
X-Received: by 2002:a2e:a884:0:b0:25d:d8a2:d18c with SMTP id m4-20020a2ea884000000b0025dd8a2d18cmr6982978ljq.305.1660062478560;
        Tue, 09 Aug 2022 09:27:58 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 09:27:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Pavel Machek <pavel@ucw.cz>,
        Tim Harvey <tharvey@gateworks.com>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Andrew Davis <afd@ti.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 1/5] dt-bindings: iio: Drop Joachim Eastwood
Date:   Tue,  9 Aug 2022 19:27:48 +0300
Message-Id: <20220809162752.10186-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Emails to Joachim Eastwood bounce ("552 5.2.2 The email account that you
tried to reach is over quota and inactive.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
index 7c8f8bdc2333..9c7c66feeffc 100644
--- a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MMA7455 and MMA7456 three axis accelerometers
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
   - Jonathan Cameron <jic23@kernel.org>
 
 description:
diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
index 6404fb73f8ed..43abb300fa3d 100644
--- a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP LPC1850 ADC bindings
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description:
   Supports the ADC found on the LPC1850 SoC.
-- 
2.34.1

