Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4A23F5E58
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Aug 2021 14:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237505AbhHXMru (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 24 Aug 2021 08:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237370AbhHXMrk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Aug 2021 08:47:40 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AC4C061757
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Aug 2021 05:46:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so2231625wml.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Aug 2021 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ArWBFJ1RaF32EdQ/NueB7gKPzmXr+kwVIop3QVqUxRs=;
        b=Ufi48a29jDZjrvV+8B+VXP3rvPAkVno0vtQeqV5MVMAD9iLiuChkSGucyB9OxqFUSY
         7iWrFm4fxnTGeJej32pPdS8vgAPIP6q/DWeYolU//tNcUnYHQUqdA0yvhORbEu+bB2gd
         vAI8PsyRaWW+/6Ypo6+oYLUCRdG8LqP7rKKcVPmDCUvm19A+EYkF8f3zZgAOmnEMaLP+
         2/GmP5tzVWoKmR7oCBQdXHDT8PVE3l5uHwYqmIXC7sKTW9ARSpW36k4jwf9jqV/c8RPd
         9wAfj+xNGgCM68azJyIKZCCCYLSzqitYHvXOLQPgd6jVfmI7mBhSdhI4c2nXBlDHKPji
         Wikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ArWBFJ1RaF32EdQ/NueB7gKPzmXr+kwVIop3QVqUxRs=;
        b=Jv05HvfS2mXW4QRrCr+TrcLYeuu6xsAu9b8Qxm5+sgGI8mIro1+7OaumG7QRVgkToV
         D39O+UlPxs6xpADmgtbgy8Z3UV7WWuuOVKgv4WKy/6Dz95IeFMQS2lNU0WVqVjYov2FN
         jHck6R33+O5ba1DZ7USJcTd63+TJPwQy8HD6L0RxhqxWQu9Th/jg3sYps3w3/fD9gEyL
         TgKfzSorsC2XnJzlGCGpXjkKppxodcisd9cByoa/lXGADv9ayu2uyCxWt0TIUKR84b38
         Cq9XCU0jaT5HaF9YjpnLyk8y20Nb+xXHnzHl0Ec3xkXTpx4eeTCdmxoatVm+Jola3ch9
         3hxA==
X-Gm-Message-State: AOAM531vuXaj2kQjk+dicxm6fFgo5rj2hluiApULZflEh6TZWXlDiIVr
        9wLTRkbcqs9r7sj4jn5o+1Rijw==
X-Google-Smtp-Source: ABdhPJwyvpGgJIO/vl2H3Iizf0L2u/W6pSdFSRABXkB0sYKQ0falNVCpdQWB6d5rhfZT4tuftIl4oQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr3915546wme.158.1629809214976;
        Tue, 24 Aug 2021 05:46:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:54 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 7/7] MAINTAINERS: Add an entry for the IEI WT61P803 PUZZLE driver
Date:   Tue, 24 Aug 2021 14:44:38 +0200
Message-Id: <20210824124438.14519-8-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824124438.14519-1-luka.kovacic@sartura.hr>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add an entry for the IEI WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6b8a720c0bc..131a95aefe3b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8971,6 +8971,22 @@ F:	include/net/nl802154.h
 F:	net/ieee802154/
 F:	net/mac802154/
 
+IEI WT61P803 M801 MFD DRIVER
+M:	Luka Kovacic <luka.kovacic@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+M:	Goran Medic <goran.medic@sartura.hr>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
+F:	Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
+F:	Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
+F:	Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
+F:	Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
+F:	drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
+F:	drivers/leds/leds-iei-wt61p803-puzzle.c
+F:	drivers/mfd/iei-wt61p803-puzzle.c
+F:	include/linux/mfd/iei-wt61p803-puzzle.h
+
 IFE PROTOCOL
 M:	Yotam Gigi <yotam.gi@gmail.com>
 M:	Jamal Hadi Salim <jhs@mojatatu.com>
-- 
2.31.1

