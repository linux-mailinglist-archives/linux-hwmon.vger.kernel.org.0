Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B612F44E9
	for <lists+linux-hwmon@lfdr.de>; Wed, 13 Jan 2021 08:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbhAMHLp (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 13 Jan 2021 02:11:45 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:52878 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbhAMHLo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jan 2021 02:11:44 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 10D741ul005404;
        Wed, 13 Jan 2021 15:04:01 +0800 (GMT-8)
        (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 13 Jan
 2021 15:09:01 +0800
From:   Troy Lee <troy_lee@aspeedtech.com>
To:     <openbmc@lists.ozlabs.org>, Jean Delvare <jdelvare@suse.com>,
        "Guenter Roeck" <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
CC:     <chiawei_wang@aspeedtech.com>, <leetroy@gmail.com>,
        <troy_lee@aspeedtech.com>
Subject: [PATCH v2 3/4] ARM: dts: aspeed: Add Aspeed AST2600 PWM/Fan node in devicetree
Date:   Wed, 13 Jan 2021 07:08:47 +0000
Message-ID: <20210113070850.1184506-4-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
References: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10D741ul005404
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Create a common node in aspeed-g6.dtsi and add fan nodes for 
aspeed-ast2600-evb.dts file.

Changes since v1:
- rename properties name in child node

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 152 +++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi         |  10 ++
 2 files changed, 162 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
index 89be13197780..d94e70b957fb 100644
--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -23,6 +23,158 @@ memory@80000000 {
 	};
 };
 
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_tach0_default
+			&pinctrl_pwm1_default &pinctrl_tach1_default
+			&pinctrl_pwm2_default &pinctrl_tach2_default
+			&pinctrl_pwm3_default &pinctrl_tach3_default
+			&pinctrl_pwm4_default &pinctrl_tach4_default
+			&pinctrl_pwm5_default &pinctrl_tach5_default
+			&pinctrl_pwm6_default &pinctrl_tach6_default
+			&pinctrl_pwm7_default &pinctrl_tach7_default
+			&pinctrl_pwm8g1_default &pinctrl_tach8_default
+			&pinctrl_pwm9g1_default &pinctrl_tach9_default
+			&pinctrl_pwm10g1_default &pinctrl_tach10_default
+			&pinctrl_pwm11g1_default &pinctrl_tach11_default
+			&pinctrl_pwm12g1_default &pinctrl_tach12_default
+			&pinctrl_pwm13g1_default &pinctrl_tach13_default
+			&pinctrl_pwm14g1_default &pinctrl_tach14_default
+			&pinctrl_pwm15g1_default &pinctrl_tach15_default>;
+
+	fan@1 {
+		reg = <0x00>;
+		aspeed,pwm-freq = <25000>;
+		aspeed,falling-point = /bits/ 8 <100>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x00>;
+		aspeed,tacho-div = <3>;
+		pulses-per-revolution = <1>;
+	};
+
+	fan@2 {
+		reg = <0x01>;
+		aspeed,pwm-freq = <25000>;
+		aspeed,falling-point = /bits/ 8 <100>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x01>;
+		pulses-per-revolution = <1>;
+	};
+
+	fan@3 {
+		reg = <0x02>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x02>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@4 {
+		reg = <0x03>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x03>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@5 {
+		reg = <0x04>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x04>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@6 {
+		reg = <0x05>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x05>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@7 {
+		reg = <0x06>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x06>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@8 {
+		reg = <0x07>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x07>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@9 {
+		reg = <0x08>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x08>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@10 {
+		reg = <0x09>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x09>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@11 {
+		reg = <0x0a>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x0a>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@12 {
+		reg = <0x0b>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x0b>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@13 {
+		reg = <0x0c>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x0c>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@14 {
+		reg = <0x0d>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x0d>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@15 {
+		reg = <0x0e>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x0e>;
+		pulses-per-revolution = <2>;
+	};
+
+	fan@16 {
+		reg = <0x0f>;
+		aspeed,pwm-freq = <25000>;
+		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
+		fan-tach-ch = /bits/ 8 <0x0f>;
+		pulses-per-revolution = <2>;
+	};
+};
+
 &mdio0 {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 810b0676ab03..0369f8db123a 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -304,6 +304,16 @@ apb {
 			#size-cells = <1>;
 			ranges;
 
+			pwm_tacho: pwm-tacho-controller@1e610000 {
+				compatible = "aspeed,ast2600-pwm-tachometer";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e610000 0x100>;
+				clocks = <&syscon ASPEED_CLK_AHB>;
+				resets = <&syscon ASPEED_RESET_PWM>;
+				status = "disabled";
+			};
+
 			syscon: syscon@1e6e2000 {
 				compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
 				reg = <0x1e6e2000 0x1000>;
-- 
2.25.1

