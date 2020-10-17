Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4542914A5
	for <lists+linux-hwmon@lfdr.de>; Sat, 17 Oct 2020 23:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439520AbgJQVLE (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 17 Oct 2020 17:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439522AbgJQVLC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Oct 2020 17:11:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7781C0613DA
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2020 14:11:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b8so7283499wrn.0
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2020 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L1eT9+f8E9Rdu5LlhMetVCscQccHc6i1e7dX0+vR0H0=;
        b=QvBPgA4zMo1Ac5XxV3ZS7OrTFr9zWbKxigEzLhBUqPUEkK3SeyaObNvqGbqgWbVeo7
         bj0HezSRSt0p0rsgWnEPdGaFRB9wfUaGSDgKzjA57D9pEoT+y/mCI/1LsTXggp5FRrLe
         2HOv/LHkKx/C7wzB8BWJ0sKVRfFGJRIf4x1iQaXHD6idU80otNstDmK+T8bZ4EEBAhsA
         TI7oAu1aDMzLFvpKnofhoCVOf1ke1QJgSLaHmYwZsWxKhWiFm1JWi4OTy9TiDdJ/JOY0
         V5/XxV4FIj56PgmsSWdFRTK+VT/EJ9st1PiTy1GBzwDADeSvwF8cmM0/umh05lm2CtcD
         hdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1eT9+f8E9Rdu5LlhMetVCscQccHc6i1e7dX0+vR0H0=;
        b=D42vLFZ3tCTE7kC4Eiwybl3Hv3s227v+cPzIJI16i5YSpCfE48/a6gkKd50Yjj2w3k
         xAquO0dIcwOuRHU2vpz7kIsiNUOYyLSKc+Hb/FdrpYGdUkKxlhqXcSR6ffFWUFlE1Aj1
         9jJDo6ADUXhXN10RRqYAo1i6DjxFbISkdZjmVNkOZ2gbnZGd7RwZAvjjTtKEmskKPeab
         787Mo9HwOHWUg6lLBS7hLwlJ1FL5g4bwGwp5NhSu1f8e2tdCda4CoN4tXp5YU18voHKn
         muI9+F/2DNYiPVl0WMet7q/OPinSrbV3mjJmZkO3Fno7BZmzYFwq9uj2Csl9i6FCd1Tk
         Trkg==
X-Gm-Message-State: AOAM532mPZLEzpPOI4vgDMav4HmC8vgB4wUlMq1jTBLv9zD+UQR20PcI
        JbiVU9YI3hEOH71qMFEWGCO0PA==
X-Google-Smtp-Source: ABdhPJx8y3SLQ40fKimn0jlNfNZaMx9fbCDfNHNse9V3wrQi+N67/Ius/D0M/Bfg1ceGPrLwzIe0eQ==
X-Received: by 2002:adf:f101:: with SMTP id r1mr12435330wro.392.1602969060563;
        Sat, 17 Oct 2020 14:11:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id w11sm10337137wrs.26.2020.10.17.14.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 14:10:59 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        robert.marko@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v5 6/6] MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver
Date:   Sat, 17 Oct 2020 23:10:35 +0200
Message-Id: <20201017211035.257110-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201017211035.257110-1-luka.kovacic@sartura.hr>
References: <20201017211035.257110-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add an entry for the iEi WT61P803 PUZZLE driver (MFD, HWMON, LED drivers).

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 867157311dc8..d56fdc300066 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8460,6 +8460,20 @@ F:	include/net/nl802154.h
 F:	net/ieee802154/
 F:	net/mac802154/
 
+IEI WT61P803 M801 MFD DRIVER
+M:	Luka Kovacic <luka.kovacic@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
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
2.26.2

