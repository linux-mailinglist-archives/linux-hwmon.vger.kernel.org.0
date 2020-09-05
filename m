Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6A725E7B7
	for <lists+linux-hwmon@lfdr.de>; Sat,  5 Sep 2020 15:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgIENGj (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 5 Sep 2020 09:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728581AbgIENFx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 09:05:53 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8FFC06125E
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 06:05:52 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nw23so12092215ejb.4
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xl1nZLcljWKorqUvDwgUa0UsWvHQM15ZTxSDh1SpSqY=;
        b=W2udFh6H0fGb8JExN0UWSQKlS1DXkIQk+M5Vh1Bxng3XsDPo+2GqxNedSbYBRa9sY/
         1Xw9OqrUfNym3M8yBAkbzDm0OdHQ8Y2dHfZ5Uqjo327lfiEZE67lQZIqRDyLH6miYfC3
         7qakdhViyk3tnojIH5yqWu54lCBmzLfEVg0/nS/PnlFP+JV7eIiT+/9hrzXrVbVAdbLY
         3J9oNt2uvtxvJBo1pn6qRA1NQp/2HettB/EQEqaPGi4ml4GMzZTboxIWt4R+aT/td1yi
         T/EWJHY4aE09QaFf78AT3i+nStB7is6zb8SMi5WhSuMMGAg7cO8fRchx3fa+Jc2Dqmi5
         e1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xl1nZLcljWKorqUvDwgUa0UsWvHQM15ZTxSDh1SpSqY=;
        b=el/4NoTnN94aqTnRkRHDOVCgvgJqyh3O2cIOsSJlzqXU5Cu4anUF2iUEPWTwsGhTzv
         yT8hXy5Zl5wGyXlutm/1TFpNoQWnI7XL3w/+Q93r72BQiL1xelcM0KEx0mutTut+lIyq
         O+PxzbPbu5FxhlCNE42Ba16kLSjnsa/1qfdvxF+AMN+yBiVOn2c955TFLJqua3i7JO+7
         L9gmrdOHoS7K7pgU9Ov6vNewonyKJ+RVEuwIPGQXFvZ868DaqiIcQUg86VZPPYvOfbQu
         E+vXHckran/r8MQxn09+VpmC+4fCSM5h5zuvsbduN7U0lKAXXFKKSz1NzRd2McrwX0bG
         6kqw==
X-Gm-Message-State: AOAM533e1jMVfHKDycyI6PUj4SzqMYnbTaov3Zazrn+OirKWhxkt9/MP
        OHzWisDVeJhjJSbH5H+k1IWKOA==
X-Google-Smtp-Source: ABdhPJyn57saXGT3ibN2UnRya8QVjZ6lQI//dqkrhaGWTC5szTQdkMmJg4BwGuFqYw4OfEn6NtZA7g==
X-Received: by 2002:a17:906:841a:: with SMTP id n26mr12101849ejx.213.1599311151406;
        Sat, 05 Sep 2020 06:05:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id s18sm9372655ejd.54.2020.09.05.06.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:05:50 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH 6/7] MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver
Date:   Sat,  5 Sep 2020 15:03:35 +0200
Message-Id: <20200905130336.967622-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905130336.967622-1-luka.kovacic@sartura.hr>
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add an entry for the iEi WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4647c84c987..01a85d753d81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8436,6 +8436,19 @@ F:	include/net/nl802154.h
 F:	net/ieee802154/
 F:	net/mac802154/
 
+IEI WT61P803 M801 MFD DRIVER
+M:	Luka Kovacic <luka.kovacic@sartura.hr>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
+F:	Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
+F:	Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
+F:	Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
+F:	drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
+F:	drivers/leds/leds-iei-wt61p803-puzzle.c
+F:	drivers/mfd/iei-wt61p803-puzzle.c
+F:	include/linux/mfd/iei-wt61p803-puzzle.h
+
 IFE PROTOCOL
 M:	Yotam Gigi <yotam.gi@gmail.com>
 M:	Jamal Hadi Salim <jhs@mojatatu.com>
-- 
2.20.1

