Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094562799DA
	for <lists+linux-hwmon@lfdr.de>; Sat, 26 Sep 2020 15:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgIZNz7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 26 Sep 2020 09:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729371AbgIZNzr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Sep 2020 09:55:47 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9E8C0613D6
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2020 06:55:47 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id k14so5393451edo.1
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2020 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28FUZKoZYz47wTi4Du6Wo/Jzb9Zhvpik5CiYh9t+cJw=;
        b=KnkloJ+p6DKDGOBCm/g5keqgriGNP/BM7xaUE/gGEFViR8qmwLxrIZPYE8C3rEUnc5
         VBnASuVOVAWS3VOEFI/NfIVpoDlRPvawkOCsmYgdxx1Fu3ZK0nh2H22Om+yE3KxtneU7
         Ahj6c8UN6CnHuCtP+WgWfi3nIPuur9y7UyXhHt/p5Mb6EAWm2Lem8h91De1kjA1nxDxa
         pN3CHc3X6uRDjP0fUlnU5cmwKVrYGAMhmBGw8QBMt7kU2jo0Z4RQBGSpGwx3Ut9mK3BN
         Ay36vW4hzLMHN36Qwh0ZXmjGbydTeMmBN3f+UhobpiggMcwatbn/6Hr+T+WSfuAJ4NQo
         1iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28FUZKoZYz47wTi4Du6Wo/Jzb9Zhvpik5CiYh9t+cJw=;
        b=LtL9JcwzcmjAci11w9LiTYcsI7kCAKMk7ptNMgSAhCQBk/3xRr+PF4aEwT3HH8muhl
         3mzoKpLbqzPZfyCShr3g7fWzywJhj4MKPzYmokRwA576ws0Dbz/NoQOR+6N6e/wszg2I
         rQRCnlrGDhADnTxJHUti9jed6NvM7Qw+Qdkiee06b64lRuQCwjMVTzq94Mrcxpu6solj
         4ofJ8foDUlp6Cvfe7vCwLgazxsSTUqTCZ/FmGP7s5DEc0eYr1MSJP9DpcsCMSMKCslsm
         3UJnlfkQCWTKf/eSo3u3KqxFLV/TugIEJMPJCbwW8GZ20hxiumYd6VHcyhpe0JcgoQxq
         SumQ==
X-Gm-Message-State: AOAM532s1iM35fWsDeZhYnpFbXao2WT1eaetslX9z+Jl3KGwy5kKe3uq
        8Kp8zbHwkHJvZ9i0Jo3xlZvUKg==
X-Google-Smtp-Source: ABdhPJytUCxpHJBe00CWDlEIY8jGQKeMKbKbv16uj7s4hgiw/iyCnbjQ0EZXEBN/v5mH0x8dWE5g8Q==
X-Received: by 2002:a50:ba88:: with SMTP id x8mr6970279ede.234.1601128546246;
        Sat, 26 Sep 2020 06:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id oq8sm4165700ejb.32.2020.09.26.06.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:55:45 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v2 6/7] MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver
Date:   Sat, 26 Sep 2020 15:55:13 +0200
Message-Id: <20200926135514.26189-7-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200926135514.26189-1-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
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
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d746519253c3..6feacd8ad422 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8460,6 +8460,19 @@ F:	include/net/nl802154.h
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
2.26.2

