Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB0D3BBDCE
	for <lists+linux-hwmon@lfdr.de>; Mon,  5 Jul 2021 15:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhGENwv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 5 Jul 2021 09:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhGENuz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Jul 2021 09:50:55 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93016C06175F
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Jul 2021 06:48:18 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id gb6so12505669ejc.5
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jul 2021 06:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kP18nSL4yfHQv9ME+MUCjrKTP7rxaCdOPNmhAXPVmKI=;
        b=fmuGE1ysYO+Mobo+K0Vpwv/ccyW+mypGyqI4DtGOr0/IiAgkGTMK83a7ofHQ6tmwx5
         Bmp6ZDJxJlnczf2chLMXtYfkKMtIVVUsRLf9uVLUdjCPxK08fPXE58ty7SeOmnsi1Dwi
         Y7qcWjbEdM4wVXgnOlkLgx3kjlgdIi6NoGoBNlmf9cihxGDO4fo1DB69rd4nOx+A/SGU
         xAfM5nz9qCvWCZmlXwiuS/KmDPh4k29X8J0re7uGrga0eO31KjRnlxaykNdMDDX1CWs0
         ya9voAPuiBxwQW+UnC/3Ix1aiayVIwEVeYbxFqEvdrrpgW4+r7WBhLp8a/k4WijL8MOd
         zqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kP18nSL4yfHQv9ME+MUCjrKTP7rxaCdOPNmhAXPVmKI=;
        b=ZGkOqqE50cAWmZsl0hqpac7LQJV3t5/tMEObsoDdTsJ3LCAYa4qYeK42yulp6MaJYa
         16VvGeyJ4JWXFtYVGKi/o//oVknuaTc91TO5bVnWNxPHIx9xPlulEpUGIraBl1iO98vi
         Y+cBF1sxrAz9N0njozZJEFyMS2MhShYqZkdJG0fvYqsVtY/0ViCCDoXwt/X3dVxdWKi3
         zFnzyFCmfuY8bQLt2/CkQUtHeVqtpsH8PCOH7O/p7at/Sv4IdaksaDy0P8idw/h2gdKy
         XksaAyXWJaRf4AVzwtofxw4I3v6rbli9PIA2uvCx7NCoDBCfCrMsxlwyfgwuRxifRxzM
         y7Kg==
X-Gm-Message-State: AOAM531tcKeC90BGU9cqTng4NmFpv/WjXWnD+yLHJCsSWS+GxEIXALOT
        gwYrg7EPHQTsgMmRQiq+mMUkUw==
X-Google-Smtp-Source: ABdhPJxOhUS/fzy6YFFQmmWBdtQBVL8CVb03J52vY3k50zkwhi3g6jx3Ay48ggohYp5kAbAaIVAo/w==
X-Received: by 2002:a17:906:b10e:: with SMTP id u14mr3867154ejy.522.1625492897197;
        Mon, 05 Jul 2021 06:48:17 -0700 (PDT)
Received: from localhost.localdomain ([89.18.44.40])
        by smtp.gmail.com with ESMTPSA id cf29sm1557637edb.14.2021.07.05.06.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 06:48:16 -0700 (PDT)
From:   Pavo Banicevic <pavo.banicevic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        luka.kovacic@sartura.hr
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 7/7] MAINTAINERS: Add an entry for the IEI WT61P803 PUZZLE driver
Date:   Mon,  5 Jul 2021 15:49:39 +0200
Message-Id: <20210705134939.28691-8-pavo.banicevic@sartura.hr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
References: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Luka Kovacic <luka.kovacic@sartura.hr>

Add an entry for the IEI WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cce91cd5624..bc6d0a23658d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8827,6 +8827,22 @@ F:	include/net/nl802154.h
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

