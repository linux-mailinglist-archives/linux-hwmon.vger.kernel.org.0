Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90061B627A
	for <lists+linux-hwmon@lfdr.de>; Thu, 23 Apr 2020 19:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbgDWRrX (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 23 Apr 2020 13:47:23 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:39037 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbgDWRqh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Apr 2020 13:46:37 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B38882327F;
        Thu, 23 Apr 2020 19:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1587663993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EocTTPpJcY7h/6HbuIM+vbFz7WjwfCwTb+lInWTqT2c=;
        b=FKRrbRTvPnBTns0hzoW5j3N4OQRKmNwrq3A9FoIJ50TV+qEB2+iCtyArJ52z1jv1S7wlR8
        OlscXDkBR9LUNgwaBmmipWlRTLfImAyMdXV/8DSk9mAVvaSKNKuIxNj2Lib9TwrV3bvFOs
        myWy8+CbJawVwbOkv6uRKBYHr3TcQuM=
From:   Michael Walle <michael@walle.cc>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
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
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 07/16] watchdog: add support for sl28cpld watchdog
Date:   Thu, 23 Apr 2020 19:45:34 +0200
Message-Id: <20200423174543.17161-8-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423174543.17161-1-michael@walle.cc>
References: <20200423174543.17161-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++
X-Spam-Level: ******
X-Rspamd-Server: web
X-Spam-Status: Yes, score=6.40
X-Spam-Score: 6.40
X-Rspamd-Queue-Id: B38882327F
X-Spamd-Result: default: False [6.40 / 15.00];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         NEURAL_SPAM(0.00)[1.006];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_TWELVE(0.00)[25];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:31334, ipnet:2a02:810c:8000::/33, country:DE];
         FREEMAIL_CC(0.00)[linaro.org,baylibre.com,kernel.org,suse.com,roeck-us.net,gmail.com,pengutronix.de,linux-watchdog.org,nxp.com,linutronix.de,lakedaemon.net,linuxfoundation.org,walle.cc];
         SUSPICIOUS_RECIPS(1.50)[]
X-Spam: Yes
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This adds support for the watchdog of the sl28cpld board management
controller. This is part of a multi-function device driver.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/watchdog/Kconfig        |  11 ++
 drivers/watchdog/Makefile       |   1 +
 drivers/watchdog/sl28cpld_wdt.c | 233 ++++++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+)
 create mode 100644 drivers/watchdog/sl28cpld_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0663c604bd64..6c53c1d0f348 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -340,6 +340,17 @@ config MLX_WDT
 	  To compile this driver as a module, choose M here: the
 	  module will be called mlx-wdt.
 
+config SL28CPLD_WATCHDOG
+	tristate "Kontron sl28 watchdog"
+	depends on MFD_SL28CPLD
+	select WATCHDOG_CORE
+	help
+	  Say Y here to include support for the watchdog timer
+	  on the Kontron sl28 CPLD.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sl28cpld_wdt.
+
 # ALPHA Architecture
 
 # ARM Architecture
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 6de2e4ceef19..b9ecdf2d7347 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -224,3 +224,4 @@ obj-$(CONFIG_MENF21BMC_WATCHDOG) += menf21bmc_wdt.o
 obj-$(CONFIG_MENZ069_WATCHDOG) += menz69_wdt.o
 obj-$(CONFIG_RAVE_SP_WATCHDOG) += rave-sp-wdt.o
 obj-$(CONFIG_STPMIC1_WATCHDOG) += stpmic1_wdt.o
+obj-$(CONFIG_SL28CPLD_WATCHDOG) += sl28cpld_wdt.o
diff --git a/drivers/watchdog/sl28cpld_wdt.c b/drivers/watchdog/sl28cpld_wdt.c
new file mode 100644
index 000000000000..2640084ace5c
--- /dev/null
+++ b/drivers/watchdog/sl28cpld_wdt.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sl28cpld watchdog driver.
+ *
+ * Copyright 2019 Kontron Europe GmbH
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/watchdog.h>
+
+/*
+ * Watchdog timer block registers.
+ */
+#define WDT_CTRL			0x00
+#define  WDT_CTRL_EN			BIT(0)
+#define  WDT_CTRL_LOCK			BIT(2)
+#define  WDT_CTRL_ASSERT_SYS_RESET	BIT(6)
+#define  WDT_CTRL_ASSERT_WDT_TIMEOUT	BIT(7)
+#define WDT_TIMEOUT			0x01
+#define WDT_KICK			0x02
+#define  WDT_KICK_VALUE			0x6b
+#define WDT_COUNT			0x03
+
+#define WDT_DEFAULT_TIMEOUT		10
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
+				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds");
+
+struct sl28cpld_wdt {
+	struct watchdog_device wdd;
+	struct regmap *regmap;
+	u32 offset;
+	bool assert_wdt_timeout;
+};
+
+static int sl28cpld_wdt_ping(struct watchdog_device *wdd)
+{
+	struct sl28cpld_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	return regmap_write(wdt->regmap, wdt->offset + WDT_KICK,
+			    WDT_KICK_VALUE);
+}
+
+static int sl28cpld_wdt_start(struct watchdog_device *wdd)
+{
+	struct sl28cpld_wdt *wdt = watchdog_get_drvdata(wdd);
+	unsigned int val;
+
+	val = WDT_CTRL_EN | WDT_CTRL_ASSERT_SYS_RESET;
+	if (wdt->assert_wdt_timeout)
+		val |= WDT_CTRL_ASSERT_WDT_TIMEOUT;
+	if (nowayout)
+		val |= WDT_CTRL_LOCK;
+
+	return regmap_update_bits(wdt->regmap, wdt->offset + WDT_CTRL,
+				  val, val);
+}
+
+static int sl28cpld_wdt_stop(struct watchdog_device *wdd)
+{
+	struct sl28cpld_wdt *wdt = watchdog_get_drvdata(wdd);
+
+	return regmap_update_bits(wdt->regmap, wdt->offset + WDT_CTRL,
+				  WDT_CTRL_EN, 0);
+}
+
+static unsigned int sl28cpld_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct sl28cpld_wdt *wdt = watchdog_get_drvdata(wdd);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(wdt->regmap, wdt->offset + WDT_COUNT, &val);
+
+	return (ret < 0) ? 0 : val;
+}
+
+static int sl28cpld_wdt_set_timeout(struct watchdog_device *wdd,
+				    unsigned int timeout)
+{
+	struct sl28cpld_wdt *wdt = watchdog_get_drvdata(wdd);
+	int ret;
+
+	ret = regmap_write(wdt->regmap, wdt->offset + WDT_TIMEOUT, timeout);
+	if (!ret)
+		wdd->timeout = timeout;
+
+	return ret;
+}
+
+static const struct watchdog_info sl28cpld_wdt_info = {
+	.options = WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.identity = "sl28cpld watchdog",
+};
+
+static struct watchdog_ops sl28cpld_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = sl28cpld_wdt_start,
+	.stop = sl28cpld_wdt_stop,
+	.ping = sl28cpld_wdt_ping,
+	.set_timeout = sl28cpld_wdt_set_timeout,
+	.get_timeleft = sl28cpld_wdt_get_timeleft,
+};
+
+static int sl28cpld_wdt_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdd;
+	struct sl28cpld_wdt *wdt;
+	struct resource *res;
+	unsigned int status;
+	unsigned int val;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
+	if (!wdt)
+		return -ENOMEM;
+
+	wdt->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!wdt->regmap)
+		return -ENODEV;
+
+	res = platform_get_resource(pdev, IORESOURCE_REG, 0);
+	if (!res)
+		return -EINVAL;
+	wdt->offset = res->start;
+
+	wdt->assert_wdt_timeout = device_property_read_bool(&pdev->dev,
+							    "kontron,assert-wdt-timeout-pin");
+
+	/* initialize struct watchdog_device */
+	wdd = &wdt->wdd;
+	wdd->parent = &pdev->dev;
+	wdd->info = &sl28cpld_wdt_info;
+	wdd->ops = &sl28cpld_wdt_ops;
+	wdd->min_timeout = 1;
+	wdd->max_timeout = 255;
+
+	watchdog_set_drvdata(wdd, wdt);
+	watchdog_stop_on_reboot(wdd);
+
+	/*
+	 * Read the status early, in case of an error, we haven't modified the
+	 * hardware.
+	 */
+	ret = regmap_read(wdt->regmap, wdt->offset + WDT_CTRL, &status);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Initial timeout value, may be overwritten by device tree or module
+	 * parmeter in watchdog_init_timeout().
+	 *
+	 * Reading a zero here means that either the hardware has a default
+	 * value of zero (which is very unlikely and definitely a hardware
+	 * bug) or the bootloader set it to zero. In any case, we handle
+	 * this case gracefully and set out own timeout.
+	 */
+	ret = regmap_read(wdt->regmap, wdt->offset + WDT_TIMEOUT, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val)
+		wdd->timeout = val;
+	else
+		wdd->timeout = WDT_DEFAULT_TIMEOUT;
+
+	watchdog_init_timeout(wdd, timeout, &pdev->dev);
+	sl28cpld_wdt_set_timeout(wdd, wdd->timeout);
+
+	/* if the watchdog is locked, we set nowayout */
+	if (status & WDT_CTRL_LOCK)
+		nowayout = true;
+	watchdog_set_nowayout(wdd, nowayout);
+
+	/*
+	 * If watchdog is already running, keep it enabled, but make
+	 * sure its mode is set correctly.
+	 */
+	if (status & WDT_CTRL_EN) {
+		sl28cpld_wdt_start(wdd);
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+	}
+
+	ret = devm_watchdog_register_device(&pdev->dev, wdd);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to register watchdog device\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "initial timeout %d sec%s\n",
+		 wdd->timeout, nowayout ? ", nowayout" : "");
+
+	return 0;
+}
+
+static const struct of_device_id sl28cpld_wdt_of_match[] = {
+	{ .compatible = "kontron,sl28cpld-wdt" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, sl28cpld_wdt_of_match);
+
+static const struct platform_device_id sl28cpld_wdt_id_table[] = {
+	{ "sl28cpld-wdt" },
+	{},
+};
+MODULE_DEVICE_TABLE(platform, sl28cpld_wdt_id_table);
+
+static struct platform_driver sl28cpld_wdt_driver = {
+	.probe = sl28cpld_wdt_probe,
+	.id_table = sl28cpld_wdt_id_table,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = sl28cpld_wdt_of_match,
+	},
+};
+module_platform_driver(sl28cpld_wdt_driver);
+
+MODULE_DESCRIPTION("sl28cpld Watchdog Driver");
+MODULE_AUTHOR("Michael Walle <michael@walle.cc>");
+MODULE_LICENSE("GPL");
-- 
2.20.1

