Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A792D1FB4C3
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2020 16:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgFPOnm (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 16 Jun 2020 10:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgFPOnl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Jun 2020 10:43:41 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC392C061573;
        Tue, 16 Jun 2020 07:43:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r18so9318071pgk.11;
        Tue, 16 Jun 2020 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=teNA2ECLoe4uArXM7ZRonheeONiyGBUzqM9TJU/zCBE=;
        b=rfgAoG+d9v2eRCytDibmeDPQTXO8GrmECpMocRAiZ1/YDKSuBVUpaW6Pr6L2dzZjp+
         N6MX1UB7G3xXlHFJn4aUOn8JCiGYhj+qd+ZGENNlDxGfuj1CI/T0nQdQZ8fWuIqOmiB7
         VaoTIlBdSuL8NV8Fv+xfsxjk79+UIX1+d5+h2TTi00aBftF/UwcEhqrKYV5wFzbM5EAg
         Is/UBITBTCb6jO47EwgfDKnaA47oQvY8XJXIlkBARkStk3ykBQWf+DenTsJzx4MpakAZ
         Ugw4NfNJlhKqk5nTGbxdizQcZ/VePX3qmq2A4+A7IfrS4AaGIWLUe/BwwfF5j6vdr8wC
         +/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=teNA2ECLoe4uArXM7ZRonheeONiyGBUzqM9TJU/zCBE=;
        b=j+AKIwZB6Olb+Wz+LybbMR9Dku9yJk4z2PcVGMzvRisPDd+5q4skKiFS+Da9QOsJkd
         BxVOArmFGIQC88IDlLkfZonhxhlDlkH5LFWYoqC2ENPDwmEnqbQlnw+LxbJPJCN1cYE8
         UBKMrWrAr166+tU23/Oni2GaGPnkJfpQERh1Vv3YwM25WxzQjW96M3bKTt5PHpY73Wk/
         STv8gP52xtMYL8LceVcJs+RQs45yZl6VNWav+Ni05iWVz0SWz80VLE1fTMt7KZLzS4X4
         6++7izfbwVOJBGT37q8EAJxvtJS0QmErJkLSBFQjvrNWhjI+Xq1yVw1g4xgOdRoVXdUQ
         1zkA==
X-Gm-Message-State: AOAM531cYNm8uvOh0w1V50PH9BLFx15t4H8kcFE4L0iEj7rK4rpIlU/H
        D6GxDPXGFjAyvFMCc7JHHFs=
X-Google-Smtp-Source: ABdhPJxJkbmOPoU7PGJc1tDn3jImcb3q/MB1iK31CaZXmrzorSXuncptlWBtS9czYc/KVnfemnSn1A==
X-Received: by 2002:a63:e550:: with SMTP id z16mr2274000pgj.92.1592318621126;
        Tue, 16 Jun 2020 07:43:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m15sm14735100pgv.45.2020.06.16.07.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 07:43:40 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] hwmon: sparx5: Add Sparx5 SoC temperature driver
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20200616082556.27877-1-lars.povlsen@microchip.com>
 <20200616082556.27877-4-lars.povlsen@microchip.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <b44120d8-67fe-4ba3-bc76-80a5a0970dad@roeck-us.net>
Date:   Tue, 16 Jun 2020 07:43:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616082556.27877-4-lars.povlsen@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/16/20 1:25 AM, Lars Povlsen wrote:
> This patch adds a temperature sensor driver to the Sparx5 SoC.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  drivers/hwmon/Kconfig       |  10 +++
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/sparx5-temp.c | 136 ++++++++++++++++++++++++++++++++++++

This will also require documentation in
	Documentation/hwmon/sparx5-temp.rst

>  3 files changed, 147 insertions(+)
>  create mode 100644 drivers/hwmon/sparx5-temp.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 288ae9f63588c..7fb5e0c6c6306 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -515,6 +515,16 @@ config SENSORS_I5K_AMB
>  	  This driver can also be built as a module. If so, the module
>  	  will be called i5k_amb.
>  
> +config SENSORS_SPARX5
> +	tristate "Sparx5 SoC temperature sensor"
> +	depends on ARCH_SPARX5 || COMPILE_TEST
> +	help
> +	  If you say yes here you get support for temperature monitoring
> +	  with the Microchip Sparx5 SoC.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called sparx5-temp.
> +
>  config SENSORS_F71805F
>  	tristate "Fintek F71805F/FG, F71806F/FG and F71872F/FG"
>  	depends on !PPC
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3e32c21f5efe3..857293f650412 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
>  obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
>  obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>  obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
> +obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
>  obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
>  obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>  obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
> diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
> new file mode 100644
> index 0000000000000..4ed8a2aec3ae9
> --- /dev/null
> +++ b/drivers/hwmon/sparx5-temp.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Sparx5 SoC temperature sensor driver
> + *
> + * Copyright (C) 2020 Lars Povlsen <lars.povlsen@microchip.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/bitfield.h>

Alphabetic order, please.

> +
> +#define TEMP_CTRL		0
> +#define TEMP_CFG		4
> +#define  TEMP_CFG_CYCLES	GENMASK(24, 15)
> +#define  TEMP_CFG_ENA		BIT(0)
> +#define TEMP_STAT		8
> +#define  TEMP_STAT_VALID	BIT(12)
> +#define  TEMP_STAT_TEMP		GENMASK(11, 0)
> +
> +struct s5_hwmon {
> +	void __iomem *base;
> +};
> +
> +static void s5_temp_enable(struct s5_hwmon *hwmon)
> +{
> +	u32 val = readl(hwmon->base + TEMP_CFG);
> +	u32 clk = 250;
> +

Unnecessary variable, and magic number. It would be better to use a define
or at least explain what the number is for. Also, if this is associated with
a system clock, would it make sense to use the clock subsystem API to get
the rate ?

> +	val &= ~TEMP_CFG_CYCLES;
> +	val |= FIELD_PREP(TEMP_CFG_CYCLES, clk);
> +	val |= TEMP_CFG_ENA;
> +
> +	writel(val, hwmon->base + TEMP_CFG);
> +}
> +
> +static int s5_read(struct device *dev, enum hwmon_sensor_types type,
> +		   u32 attr, int channel, long *temp)
> +{
> +	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
> +	int rc = 0, value;
> +	u32 stat;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		stat = readl_relaxed(hwmon->base + TEMP_STAT);
> +		if (!(stat & TEMP_STAT_VALID))
> +			return -EIO;
> +		value = stat & TEMP_STAT_TEMP;
> +		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;

A comment describing the calculation would be useful, not only to help
the reader but also to help me verify if the calculation is correct
(especially since datasheets don't seem to be public).

> +		value *= 100;
> +		*temp = value;
> +		break;
> +	default:
> +		rc = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return rc;
> +}
> +
> +static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
> +			     u32 attr, int channel)
> +{
> +	if (type != hwmon_temp)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *s5_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops s5_hwmon_ops = {
> +	.is_visible = s5_is_visible,
> +	.read = s5_read,
> +};
> +
> +static const struct hwmon_chip_info s5_chip_info = {
> +	.ops = &s5_hwmon_ops,
> +	.info = s5_info,
> +};
> +
> +static int s5_temp_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct s5_hwmon *hwmon;
> +
> +	hwmon = devm_kzalloc(&pdev->dev, sizeof(*hwmon), GFP_KERNEL);
> +	if (!hwmon)
> +		return -ENOMEM;
> +
> +	hwmon->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(hwmon->base))
> +		return PTR_ERR(hwmon->base);
> +
> +	s5_temp_enable(hwmon);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							 "s5_temp",
> +							 hwmon,
> +							 &s5_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +const struct of_device_id s5_temp_match[] = {
> +	{ .compatible = "microchip,sparx5-temp" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, s5_temp_match);
> +
> +static struct platform_driver s5_temp_driver = {
> +	.probe = s5_temp_probe,
> +	.driver = {
> +		.name = "sparx5-temp",
> +		.of_match_table = s5_temp_match,
> +	},
> +};
> +
> +module_platform_driver(s5_temp_driver);
> +
> +MODULE_AUTHOR("Lars Povlsen <lars.povlsen@microchip.com>");
> +MODULE_DESCRIPTION("Sparx5 SoC temperature sensor driver");
> +MODULE_LICENSE("GPL");
> 

