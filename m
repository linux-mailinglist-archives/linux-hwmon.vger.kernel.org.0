Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F75D243A17
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Aug 2020 14:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgHMMto (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Aug 2020 08:49:44 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:57741 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgHMMs7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Aug 2020 08:48:59 -0400
Received: from mwalle01.sab.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 77C8B23E4A;
        Thu, 13 Aug 2020 14:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1597322935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vMi+RtpPjwmerV7+3qzoqMeDfgHSefflf9g/rpFl8iY=;
        b=osDYlma2XSyAdwMchHlAZpWdcQPYBpAo2IV5Gr7CdKVDXWEE7Vj4+xsSSiyBp8jwyWcJ8u
        CsQTXSAFCo0ZM9FVogGtbAcQFqA3+H1+ssCz6a+ggny3l2Wq/HlRyfrx6nmZpUeiHM+6d3
        obL73Yaa8CSTKGhALjrXncZpl/lmPXU=
From:   Michael Walle <michael@walle.cc>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v8 09/13] arm64: dts: freescale: sl28: enable sl28cpld
Date:   Thu, 13 Aug 2020 14:48:28 +0200
Message-Id: <20200813124832.17349-10-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200813124832.17349-1-michael@walle.cc>
References: <20200813124832.17349-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the board management controller node.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since v7:
 - none

Changes since v6:
 - renamed "sl28cpld-r1" to "sl28cpld"
 - moved "reg" and "compatible" properties to the top of a node

Changes since v5:
 - none

Changes since v4:
 - none

Changes since v3:
 - see cover letter

 .../freescale/fsl-ls1028a-kontron-sl28.dts    | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
index 360b3a168c10..9f9834eafe65 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 #include "fsl-ls1028a.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Kontron SMARC-sAL28";
@@ -170,6 +171,107 @@
 		reg = <0x32>;
 	};
 
+	sl28cpld@4a {
+		compatible = "kontron,sl28cpld";
+		reg = <0x4a>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		watchdog@4 {
+			compatible = "kontron,sl28cpld-wdt";
+			reg = <0x4>;
+			kontron,assert-wdt-timeout-pin;
+		};
+
+		hwmon@b {
+			compatible = "kontron,sl28cpld-fan";
+			reg = <0xb>;
+		};
+
+		sl28cpld_pwm0: pwm@c {
+			compatible = "kontron,sl28cpld-pwm";
+			reg = <0xc>;
+			#pwm-cells = <2>;
+		};
+
+		sl28cpld_pwm1: pwm@e {
+			compatible = "kontron,sl28cpld-pwm";
+			reg = <0xe>;
+			#pwm-cells = <2>;
+		};
+
+		sl28cpld_gpio0: gpio@10 {
+			compatible = "kontron,sl28cpld-gpio";
+			reg = <0x10>;
+			interrupts-extended = <&gpio2 6
+					       IRQ_TYPE_EDGE_FALLING>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"GPIO0_CAM0_PWR_N", "GPIO1_CAM1_PWR_N",
+				"GPIO2_CAM0_RST_N", "GPIO3_CAM1_RST_N",
+				"GPIO4_HDA_RST_N", "GPIO5_PWM_OUT",
+				"GPIO6_TACHIN", "GPIO7";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		sl28cpld_gpio1: gpio@15 {
+			compatible = "kontron,sl28cpld-gpio";
+			reg = <0x15>;
+			interrupts-extended = <&gpio2 6
+					       IRQ_TYPE_EDGE_FALLING>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"GPIO8", "GPIO9", "GPIO10", "GPIO11",
+				"", "", "", "";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		sl28cpld_gpio2: gpio@1a {
+			compatible = "kontron,sl28cpld-gpo";
+			reg = <0x1a>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"LCD0 voltage enable",
+				"LCD0 backlight enable",
+				"eMMC reset", "LVDS bridge reset",
+				"LVDS bridge power-down",
+				"SDIO power enable",
+				"", "";
+		};
+
+		sl28cpld_gpio3: gpio@1b {
+			compatible = "kontron,sl28cpld-gpi";
+			reg = <0x1b>;
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"Power button", "Force recovery", "Sleep",
+				"Battery low", "Lid state", "Charging",
+				"Charger present", "";
+		};
+
+		sl28cpld_intc: interrupt-controller@1c {
+			compatible = "kontron,sl28cpld-intc";
+			reg = <0x1c>;
+			interrupts-extended = <&gpio2 6
+					       IRQ_TYPE_EDGE_FALLING>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	eeprom@50 {
 		compatible = "atmel,24c32";
 		reg = <0x50>;
-- 
2.20.1

