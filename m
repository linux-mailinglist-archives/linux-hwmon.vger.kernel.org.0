Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45AB438D9C
	for <lists+linux-hwmon@lfdr.de>; Mon, 25 Oct 2021 04:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhJYDAq (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 24 Oct 2021 23:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhJYDAq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Oct 2021 23:00:46 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF121C061764
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Oct 2021 19:58:24 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so10243612pji.5
        for <linux-hwmon@vger.kernel.org>; Sun, 24 Oct 2021 19:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:in-reply-to:references:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=ddY1h2eGYLfbs2x7Sg+P0Vwdzd/3/Mm7kKddSfpI7pQ=;
        b=AHBrJ5KE6Y2Mi5z06YeF8lYyOPStf/SCkOgfpCaGiZ4DbSsYUXSra3y/d7MoD7BpmO
         5jXeGEPaTvTCQ86SetdCZGR40VoUQHnjLB56n1d1m5D9YaalpNO3Ydb88KqOTW88rp1Q
         yCLuaz1DML2/Kszg4E4ywjAWiKi/8lJ9xdnLW48/Q+O7vzKtfceW2Nya9DUPS36Z5qdn
         ohTODuHwcE8DRgbwSZC7TUxX5cC+pMvOLU61ylLUGyOzMfGysQ/5T5vTqskW+2NJaBCs
         ieAkutMwtaWNSf8mvYU9I5RZ46Ay87rdhNuY9Gff2jx36cQaRfzCCsgwKZSJE0dMCAlu
         LnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
         :cc:subject:content-transfer-encoding:mime-version;
        bh=ddY1h2eGYLfbs2x7Sg+P0Vwdzd/3/Mm7kKddSfpI7pQ=;
        b=D9tmF56qfDhBQRMNSRhtw8U/rpzRrxWmZ+SxO2gRPUkGzcxyJvaakQUN+wdWtxpBqI
         oAuXcb4dnQ5hhpsMAghw3DDuaxVXEq0fXdNDxSmUPOLAibZi7FuJCx0iOXVUBr4Q+eAi
         QK12fRoj1400u5G94q4AH1XMYfN+Rxvd93PtfLl/gS8RbcUHV7r6U1uCyd1fE1iABFxQ
         CGD1WTO2DgWhLgLebGDoyZC+V4Y++RjrmwmNMLPKvan4/sgtgGb++/cnq44OaeGv1F6H
         Vlq0EtbnqHJoBn4Xo73dtKrrg4WCEcZgOvKc5jaaqLORuPK89Uf0CPT/krK7lDplEGvg
         5htw==
X-Gm-Message-State: AOAM533xCGPBhCKiYj19LS6I8XzWQaxg3zqsETNhp8dxZfmvPcOGLNl3
        E4Rf+louOFpmXKZJsrbcj3WYsA==
X-Google-Smtp-Source: ABdhPJyh3HMe9pEYdhmZNnbkTvBIROtfIOb1+hmM7zUTCw1tU4y3WX7lCNXWlQtJMZguU6i7v2KOyA==
X-Received: by 2002:a17:90b:4a81:: with SMTP id lp1mr1872303pjb.27.1635130704373;
        Sun, 24 Oct 2021 19:58:24 -0700 (PDT)
Received: from [127.0.1.1] (117-20-69-24.751445.bne.nbn.aussiebb.net. [117.20.69.24])
        by smtp.gmail.com with UTF8SMTPSA id me18sm16565321pjb.33.2021.10.24.19.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 19:58:24 -0700 (PDT)
Date:   Mon, 25 Oct 2021 02:58:05 +0000
Message-Id: <20211025025805.618566-1-nathan@nathanrossi.com>
In-Reply-To: <20211025025805.618566-0-nathan@nathanrossi.com>
References: <20211025025805.618566-0-nathan@nathanrossi.com>
From:   Nathan Rossi <nathan@nathanrossi.com>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nathan Rossi <nathan@nathanrossi.com>,
        Nathan Rossi <nathan.rossi@digi.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: ti,ina2xx: Document ti,ina238
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Nathan Rossi <nathan.rossi@digi.com>

Document the compatible string for the Texas Instruments INA238, this
device is a variant of the existing INA2xx devices and has the same
device tree bindings (shunt resistor).

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 6f0443322a..180573f26c 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -26,6 +26,7 @@ properties:
       - ti,ina226
       - ti,ina230
       - ti,ina231
+      - ti,ina238
 
   reg:
     maxItems: 1
---
2.33.0
