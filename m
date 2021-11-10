Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2933044C4B6
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Nov 2021 16:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhKJP6Y (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 10 Nov 2021 10:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhKJP6X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Nov 2021 10:58:23 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC80C061764;
        Wed, 10 Nov 2021 07:55:36 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso4642976ote.0;
        Wed, 10 Nov 2021 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=33y2K1n4+a77pWOR3n6HeGOY3n+xOhILC5MDJChRPQs=;
        b=lNx1dXg/KoSTJEUrthhuuymEFJiI4KHW5wtQZ5wifVxeU5YV7hD/VMvKQ8u1f3nxp1
         UD1E0bCOK2aWK3ld6GztgOgLAli498Zgb0mHDrqCwwoW0DNvX/U9s430uxlshlG0mgHD
         WgX50vixrzGZXvZNaXnPrYpk1NXfTlAjEne5R6jA7Jtxxs6TRXPinKmtanj4jhQKdpjK
         s+Li88Fuu5avu+vraUlUifA/EjWlQ+xnuYLuXWiRY016aurqXGBjwMRws3GMYy8hF/Be
         LesgolfkxJvxgYDnk+NUAGGBKkGAso7/IXOcRMFiMTRaCJ+hQtbPcTXyWkckZyCZs56Z
         tTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=33y2K1n4+a77pWOR3n6HeGOY3n+xOhILC5MDJChRPQs=;
        b=DRljFTFmimh0wAXRgGSXuhATIkY/WVJIvyzFZoodc6YR/1JzK+LDlg4p4VU8ACY2wg
         AGoxUK9lkP3lCibNWcdJLarJv0iLE/tQDDJUjArUPISLj6Wss1MDkyab2h8GMUVBxSTz
         X3hxJ8HkGhjeO87XR+fnp6wATeuGVVCwbriosCn5GfzFRFGEoUdcC7050ovhTf1bpZzP
         +43bhr2QCAtTIIhGuTGH+6pEI0ekz+4FNAX+j7qDjy96RTX4nm1PXfMXtliQik3NUe9o
         KgzAnqNizxcWVFl3hDBaQ0fusLeK3ujebWZGsWuSzI3TTJy6XX9AOtJAcVleT0kH0D/a
         tfsA==
X-Gm-Message-State: AOAM530lwKkT9Br8ktPaQ6Ig//4qRQXO3sngmjGij1JrQ+anhnQ0YS6+
        RKYXxB9cWZI0TtQQITIYC00=
X-Google-Smtp-Source: ABdhPJyTsvfV3nJgDRLyuR7Gv6RwKoDLsSEonATegNm7ehO7yJyI+hv3yWf6/cLlDC08wXUuK+rWIA==
X-Received: by 2002:a05:6830:236b:: with SMTP id r11mr207666oth.145.1636559734819;
        Wed, 10 Nov 2021 07:55:34 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i15sm45851otu.67.2021.11.10.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 07:55:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 10 Nov 2021 07:55:30 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     lee.jones@linaro.org, broonie@kernel.org, kernel@pengutronix.de,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, rui.zhang@intel.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        s.hauer@pengutronix.de, linux-hwmon@vger.kernel.org,
        amitk@kernel.org, linux-pm@vger.kernel.org, linux-imx@nxp.com,
        alistair23@gmail.com, andreas@kemnade.info, shawnguo@kernel.org
Subject: Re: [PATCH v15 5/8] hwmon: sy7636a: Add temperature driver for
 sy7636a
Message-ID: <20211110155530.GA2341709@roeck-us.net>
References: <20211110122948.188683-1-alistair@alistair23.me>
 <20211110122948.188683-6-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110122948.188683-6-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 10, 2021 at 10:29:45PM +1000, Alistair Francis wrote:
> This is a multi-function device to interface with the sy7636a
> EPD PMIC chip from Silergy.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  Documentation/hwmon/index.rst         |   1 +
>  Documentation/hwmon/sy7636a-hwmon.rst |  24 ++++++
>  drivers/hwmon/Kconfig                 |   9 +++
>  drivers/hwmon/Makefile                |   1 +
>  drivers/hwmon/sy7636a-hwmon.c         | 108 ++++++++++++++++++++++++++
>  5 files changed, 143 insertions(+)
>  create mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
>  create mode 100644 drivers/hwmon/sy7636a-hwmon.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 7046bf1870d9..a887308850cd 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -180,6 +180,7 @@ Hardware Monitoring Kernel Drivers
>     smsc47m1
>     sparx5-temp
>     stpddc60
> +   sy7636a-hwmon
>     tc654
>     tc74
>     thmc50
> diff --git a/Documentation/hwmon/sy7636a-hwmon.rst b/Documentation/hwmon/sy7636a-hwmon.rst
> new file mode 100644
> index 000000000000..6b3e36d028dd
> --- /dev/null
> +++ b/Documentation/hwmon/sy7636a-hwmon.rst
> @@ -0,0 +1,24 @@
> +Kernel driver sy7636a-hwmon
> +=========================
> +
> +Supported chips:
> +
> + * Silergy SY7636A PMIC
> +
> +
> +Description
> +-----------
> +
> +This driver adds hardware temperature reading support for
> +the Silergy SY7636A PMIC.
> +
> +The following sensors are supported
> +
> +  * Temperature
> +      - SoC on-die temperature in milli-degree C
> +
> +sysfs-Interface
> +---------------
> +
> +temp0_input
> +	- SoC on-die temperature (milli-degree C)
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 64bd3dfba2c4..3139a286c35a 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1662,6 +1662,15 @@ config SENSORS_SIS5595
>  	  This driver can also be built as a module. If so, the module
>  	  will be called sis5595.
>  
> +config SENSORS_SY7636A
> +	tristate "Silergy SY7636A"
> +	help
> +	  If you say yes here you get support for the thermistor readout of
> +	  the Silergy SY7636A PMIC.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sy7636a-hwmon.
> +
>  config SENSORS_DME1737
>  	tristate "SMSC DME1737, SCH311x and compatibles"
>  	depends on I2C && !PPC
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index baee6a8d4dd1..8f8da52098d1 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -182,6 +182,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
>  obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
>  obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
>  obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
> +obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
>  obj-$(CONFIG_SENSORS_AMC6821)	+= amc6821.o
>  obj-$(CONFIG_SENSORS_TC74)	+= tc74.o
>  obj-$(CONFIG_SENSORS_THMC50)	+= thmc50.o
> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> new file mode 100644
> index 000000000000..84ceaae3a404
> --- /dev/null
> +++ b/drivers/hwmon/sy7636a-hwmon.c
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Functions to access SY3686A power management chip temperature
> + *
> + * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
> + *
> + * Authors: Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>
> + *          Alistair Francis <alistair@alistair23.me>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/machine.h>
> +
> +#include <linux/mfd/sy7636a.h>
> +
> +static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *temp)
> +{
> +	struct regmap *regmap = dev_get_drvdata(dev);
> +	int ret, reg_val;
> +
> +	ret = regmap_read(regmap,
> +			SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	*temp = reg_val * 1000;
> +
> +	return 0;
> +}
> +
> +static umode_t sy7636a_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	if (type != hwmon_temp)
> +		return 0;
> +
> +	if (attr != hwmon_temp_input)
> +		return 0;
> +
> +	return 0444;
> +}
> +
> +static const struct hwmon_ops sy7636a_hwmon_ops = {
> +	.is_visible = sy7636a_is_visible,
> +	.read = sy7636a_read,
> +};
> +
> +static const struct hwmon_channel_info *sy7636a_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info sy7636a_chip_info = {
> +	.ops = &sy7636a_hwmon_ops,
> +	.info = sy7636a_info,
> +};
> +
> +static int sy7636a_sensor_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	struct regulator *regulator;
> +	struct device *hwmon_dev;
> +	int err;
> +
> +	if (!regmap)
> +		return -EPROBE_DEFER;
> +
> +	regulator = devm_regulator_get(&pdev->dev, "vcom");
> +	if (IS_ERR(regulator)) {
> +		return PTR_ERR(regulator);
> +	}
> +
> +	err = regulator_enable(regulator);
> +	if (err) {
> +		regulator_put(regulator);

Is this needed ? I would have assumed that the devm_ function
above would ensure that the put is handled automatically.

Guenter

> +		return err;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +			"sy7636a_temperature", regmap, &sy7636a_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon_dev)) {
> +		err = PTR_ERR(hwmon_dev);
> +		dev_err(&pdev->dev, "Unable to register hwmon device, returned %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver sy7636a_sensor_driver = {
> +	.probe = sy7636a_sensor_probe,
> +	.driver = {
> +		.name = "sy7636a-temperature",
> +	},
> +};
> +module_platform_driver(sy7636a_sensor_driver);
> +
> +MODULE_DESCRIPTION("SY7636A sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.31.1
> 
