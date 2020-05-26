Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878C91B2096
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Apr 2020 10:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDUIB2 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 21 Apr 2020 04:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728315AbgDUIBT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Apr 2020 04:01:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CBEC061A41
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x4so2482411wmj.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Apr 2020 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=exntrZVDrpNC4LfoF62zE8ED3Dungiic5pvW3+dqcrE=;
        b=masfNwGS8IZQ2541J1dwhk8GqCR2J55vlrTQssHEbTO9xZSvKw4jZzjNLJV4v1DYeg
         ubBwEzmaUyKD/nAjdgA2nIZ319L0eXWUFqw/8EGufNzLxABbA23/YIVLCBbCfBHqn1h1
         I8SnrdHtfrIDDG340w1zg/i66dRkz3EJ3pQzdTFMN65wwpFiUkRb6Mpfim9Dcx+6InWS
         hT8QIS2zrVKTrr9+5cLP7YFB2d0W2BN9mko24jNiwAw1B7b9/521qmpA/S+8J7fcAhDK
         SNd1tyts0TZBlubdtb8U1OEkIt8DMPHul1Lmd+0eiBGcfKaIooeFH0AiLWhFp+u2O3U6
         Yw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=exntrZVDrpNC4LfoF62zE8ED3Dungiic5pvW3+dqcrE=;
        b=R8cPou3fpPcryxdoAfIdINszUJpk68kH7vLKiVwst8Fz+DFVNvEorRIlKekUdjsQ/i
         t7bSrlm7Gr+4OekY2nX4n5+XkalG5A5ZUoy8ukPK1wtBOKMTjP7Ny2WOei279Ij/tq3O
         Tl1Zfc089Oj/jEcNBBnhx8voEdPP2hrEx2Jn/slrwJlfn1zd0wfNbguRdEicDVDH48Gc
         7pHDQ3VmoNg5s1zsMYNX+RhUFSqmHabSs85ZJPmRKXJYbzR9/reYTq1SiZIHsA4qSRbd
         aXpA4i84LCtJe7XKpGA+uaLUL0uVtYZRtsk0ZpV0hLOwLy7CdTHDRjF60fs2QQbMssoJ
         Gr6Q==
X-Gm-Message-State: AGi0PuaJDiet/W2XcEyVPP+CeuPVm4hyFkDD9WXXEYIR+NpUjDA4M0ua
        aItV2qgBNIDV5ecnqy1GIcEacQ==
X-Google-Smtp-Source: APiQypI9h94l+CZXcEb1aZ/OgizCqV8es3Sa3eybeGWtzOeDjtlLjSkfJia1v7tSyR5sX8sej1M55w==
X-Received: by 2002:a1c:96c6:: with SMTP id y189mr3785930wmd.106.1587456077312;
        Tue, 21 Apr 2020 01:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id x132sm2561552wmg.33.2020.04.21.01.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 01:01:16 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com
Cc:     nick@khadas.com, art@khadas.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 7/8] arm64: dts: meson-sm1: add cpu thermal nodes
Date:   Tue, 21 Apr 2020 10:01:01 +0200
Message-Id: <20200421080102.22796-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add thermal nodes for the Amlogic SM1 SoCs based on the G12A and G12B
thermal nodes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index d4ec735fb1a5..71317f5aada1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -56,6 +56,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -64,6 +65,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -72,6 +74,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -80,6 +83,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "psci";
 			next-level-cache = <&l2>;
+			#cooling-cells = <2>;
 		};
 
 		l2: l2-cache0 {
@@ -466,6 +470,26 @@
 	compatible = "amlogic,sm1-clkc";
 };
 
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			trip = <&cpu_passive>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+
+		map1 {
+			trip = <&cpu_hot>;
+			cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &ethmac {
 	power-domains = <&pwrc PWRC_SM1_ETH_ID>;
 };
-- 
2.22.0

