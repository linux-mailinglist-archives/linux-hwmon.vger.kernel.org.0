Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7458754F37
	for <lists+linux-hwmon@lfdr.de>; Sun, 16 Jul 2023 17:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjGPPJN (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 16 Jul 2023 11:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjGPPJM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Jul 2023 11:09:12 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9053DE40;
        Sun, 16 Jul 2023 08:09:10 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2632336f75fso2500266a91.3;
        Sun, 16 Jul 2023 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689520150; x=1692112150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=n5PDaIpAANCh3dImlUrdQ4cOA2DKpllfiOSKKa1StHc=;
        b=dRUHAsZIXugbG6Xdc5bNkLLptKjGXPn9DvOTr9h/kc7FCwdSWU5bi/9vvWw0eeE/mM
         pux3d6nRfds0cnLGT41rBllFSVxLXkgCClliqZkYXJucNuIFGgHIU6SpoZEnhKYJOvPy
         gGzOqGZKz/1lkwDqpKvIWwL9KDnXFRTF2SHgT18qW/zU6v1C+KDzQs1eOrw1fZsDhwGk
         8htZoy1/qDUXg7XXiPpaxvYobLy0NGTuxgQEUQDdCwJsT2CNI6kI9Tgag3euyVPB24pe
         /P1Pn16/YYFhAdZ/NnxmPFnuiIfeT+Cr8nbtp4O52LpIgYfgkLpcNIytuX2t00Aj6wGh
         GD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689520150; x=1692112150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5PDaIpAANCh3dImlUrdQ4cOA2DKpllfiOSKKa1StHc=;
        b=GVDHJjAprlLmltuPKatxo4AMnLqZsml+ukM9XZAAUZ+SZQwChEVugF1bkLMIS5xy/D
         mBqzTLXU5gX1gVh72fvmYmnmPpLOTuf6j1S78EwwcpJ2of0alCX0SgSve6hMFYVxNJ/c
         Q1qhYAmjlQ3G1iBJDd8hN0OJThNd2b36UvznKLPDHjlhMBZUULE+Xszej7Iuq2BSm7yg
         Pr0myWQG3aDfXNe+/zkQVHOZFN4q804cZgybpK+U5l4zJ0XwMUwLizaYKqMy8V184OrU
         Y89nmmamBaRIL/Whzmn5VQ03nlogOp2IIILo1FIw9N/aGiPJTTqPRZzNtXcd2CcxIdLn
         FVbw==
X-Gm-Message-State: ABy/qLZ2TkD+NWhT4iom8jzzg8THyLCRJu0ZeBvaTOWYJ8pGt4uA5+R4
        iGPcpd7K6oTCjVhLXFTwSAM=
X-Google-Smtp-Source: APBJJlERHrTeFk+gF8T1x2LVoXbQFEZxt6AITlQFDVR5ZgM/COOx2X1ct8pHJLWmy4zqfNgrpH1jmg==
X-Received: by 2002:a17:90a:8d0b:b0:267:8012:b393 with SMTP id c11-20020a17090a8d0b00b002678012b393mr4300850pjo.34.1689520149805;
        Sun, 16 Jul 2023 08:09:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k17-20020a17090aaa1100b0025c2c398d33sm3678124pjq.39.2023.07.16.08.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 08:09:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77d79e58-f454-d63f-61cf-64462dfcfa08@roeck-us.net>
Date:   Sun, 16 Jul 2023 08:09:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] hwmon: (hs3001) Add driver for Renesas HS3001
Content-Language: en-US
To:     Andre Werner <werneazc@gmail.com>, jdelvare@suse.com,
        robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Andre Werner <andre.werner@systec-electronic.com>
References: <20230716150556.26155-1-andre.werner@systec-electronic.com>
 <20230716150556.26155-2-andre.werner@systec-electronic.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230716150556.26155-2-andre.werner@systec-electronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/16/23 08:05, Andre Werner wrote:
> Add base support for Renesas HS3001 temperature
> and humidity sensors and its compatibles HS3002,
> HS3003 and HS3004.
> 
> The sensor has a fix I2C address 0x44. The resolution
> is fixed to 14bit (ref. Missing feature).
> 
> Missing feature:
> - Accessing non-volatile memory: Custom board has no
>    possibility to control voltage supply of sensor. Thus,
>    we cannot send the necessary control commands within
>    the first 10ms after power-on.
> 
> Signed-off-by: Andre Werner <andre.werner@systec-electronic.com>
> 
> Changelog:
> v1: Initial version
> v2: Redesign following recommendations of reviewers; Bugfixes

That doesn't really mean anything. You force me to go back to v1
and check what exactly you changed, and that will take time.

Guenter

> ---
>   Documentation/hwmon/hs3001.rst |  37 +++++
>   MAINTAINERS                    |   6 +
>   drivers/hwmon/Kconfig          |  10 ++
>   drivers/hwmon/Makefile         |   1 +
>   drivers/hwmon/hs3001.c         | 259 +++++++++++++++++++++++++++++++++
>   5 files changed, 313 insertions(+)
>   create mode 100644 Documentation/hwmon/hs3001.rst
>   create mode 100644 drivers/hwmon/hs3001.c
> 
> diff --git a/Documentation/hwmon/hs3001.rst b/Documentation/hwmon/hs3001.rst
> new file mode 100644
> index 000000000000..703fb9c45313
> --- /dev/null
> +++ b/Documentation/hwmon/hs3001.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver HS3001
> +===================
> +
> +Supported chips:
> +
> +  * Renesas HS3001, HS3002, HS3003, HS3004
> +
> +    Prefix: 'hs3001'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
> +
> +Author:
> +
> +  - Andre Werner <andre.werner@systec-electronic.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for the Renesas HS3001 chips, a humidity
> +and temperature family. Temperature is measured in degrees celsius, relative
> +humidity is expressed as a percentage. In the sysfs interface, all values are
> +scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
> +
> +The device communicates with the I2C protocol. Sensors have the I2C
> +address 0x44 by default.
> +
> +sysfs-Interface
> +---------------
> +
> +===============================================================================
> +temp1_input:        temperature input
> +humidity1_input:    humidity input
> +===============================================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dfbb271f1667..4d8603436f9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9484,6 +9484,12 @@ S:	Maintained
>   W:	http://artax.karlin.mff.cuni.cz/~mikulas/vyplody/hpfs/index-e.cgi
>   F:	fs/hpfs/
>   
> +HS3001 Hardware Temperature and Humidity Sensor
> +M:	Andre Werner <andre.werner@systec-electronic.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/hs3001.c
> +
>   HSI SUBSYSTEM
>   M:	Sebastian Reichel <sre@kernel.org>
>   S:	Maintained
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 307477b8a371..ca6be5a23271 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -734,6 +734,16 @@ config SENSORS_HIH6130
>   	  This driver can also be built as a module. If so, the module
>   	  will be called hih6130.
>   
> +config SENSORS_HS3001
> +	tristate "Renesas HS3001 humidity and temperature sensors"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the Renesas HS3001,
> +	  to HS3004 humidity and temperature sensors.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called hs3001.
> +
>   config SENSORS_IBMAEM
>   	tristate "IBM Active Energy Manager temperature/power sensors and control"
>   	select IPMI_SI
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3f4b0fda0998..cdae4e1fc919 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_SENSORS_GSC)	+= gsc-hwmon.o
>   obj-$(CONFIG_SENSORS_GPIO_FAN)	+= gpio-fan.o
>   obj-$(CONFIG_SENSORS_GXP_FAN_CTRL) += gxp-fan-ctrl.o
>   obj-$(CONFIG_SENSORS_HIH6130)	+= hih6130.o
> +obj-$(CONFIG_SENSORS_HS3001)	+= hs3001.o
>   obj-$(CONFIG_SENSORS_ULTRA45)	+= ultra45_env.o
>   obj-$(CONFIG_SENSORS_I5500)	+= i5500_temp.o
>   obj-$(CONFIG_SENSORS_I5K_AMB)	+= i5k_amb.o
> diff --git a/drivers/hwmon/hs3001.c b/drivers/hwmon/hs3001.c
> new file mode 100644
> index 000000000000..af8ad72dccb0
> --- /dev/null
> +++ b/drivers/hwmon/hs3001.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* This is a non-complete driver implementation for the
> + * HS3001 humidity and temperature sensor and compatibles. It does not include
> + * the configuration possibilities, where it needs to be set to 'programming mode'
> + * during power-up.
> + *
> + *
> + * Copyright (C) 2022 SYS TEC electronic AG
> + * Author: Andre Werner <andre.werner@systec-electronic.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +/* Measurement times */
> +#define HS3001_WAKEUP_TIME		100		/* us */
> +#define HS3001_8BIT_RESOLUTION	550		/* us */
> +#define HS3001_10BIT_RESOLUTION	1310	/* us */
> +#define HS3001_12BIT_RESOLUTION	4500	/* us */
> +#define HS3001_14BIT_RESOLUTION	16900	/* us */
> +
> +#define HS3001_RESPONSE_LENGTH	4
> +
> +#define HS3001_FIXPOINT_ARITH	1000
> +#define HS3001_MIN_TEMPERATURE	(-40 * HS3001_FIXPOINT_ARITH)	/* milli degree */
> +#define HS3001_MAX_TEMPERATURE	(125 * HS3001_FIXPOINT_ARITH)	/* milli degree */
> +#define HS3001_MIN_HUMIDITY		(0 * HS3001_FIXPOINT_ARITH)	/* milli percent */
> +#define HS3001_MAX_HUMIDITY		(100 * HS3001_FIXPOINT_ARITH)	/* milli percent */
> +
> +#define HS3001_MASK_HUMIDITY_0X3FFF		0x3FFF
> +#define HS3001_MASK_TEMPERATURE_0XFFFC	0xFFFC
> +#define HS3001_MASK_STATUS_0XC0			0xC0
> +#define HS3001_STATUS_SHIFT				6
> +
> +/* Definitions for Status Bits of A/D Data */
> +#define HS3001_DATA_VALID	0x00	/* Valid Data */
> +#define HS3001_DATA_STALE	0x01	/* Stale Data */
> +
> +#define LIMIT_MAX	0
> +#define LIMIT_MIN	1
> +
> +enum hs3001_chips {
> +	hs3001,
> +};
> +
> +struct hs3001_data {
> +	struct i2c_client *client;
> +	enum hs3001_chips type;
> +	u32 wait_time;		/* in us */
> +	int temperature;	/* in milli degree */
> +	u32 humidity;		/* in milli % */
> +};
> +
> +static int hs3001_extract_temperature(u16 raw)
> +{
> +	/* fixpoint arithmetic 1 digit */
> +	int temp = ((raw & HS3001_MASK_TEMPERATURE_0XFFFC) >> 2) *
> +	    HS3001_FIXPOINT_ARITH;
> +
> +	temp /= (1 << 14) - 1;
> +
> +	return temp * 165 - 40 * HS3001_FIXPOINT_ARITH;
> +}
> +
> +static u32 hs3001_extract_humidity(u16 raw)
> +{
> +	int hum = (raw & HS3001_MASK_HUMIDITY_0X3FFF) * HS3001_FIXPOINT_ARITH;
> +
> +	hum /= (1 << 14) - 1;
> +
> +	return hum * 100;
> +}
> +
> +static int hs3001_data_fetch_command(struct i2c_client *client,
> +				     struct hs3001_data *data)
> +{
> +	int ret;
> +	u8 buf[HS3001_RESPONSE_LENGTH];
> +	u8 hs3001_status;
> +
> +	ret = i2c_master_recv(client, buf, HS3001_RESPONSE_LENGTH);
> +
> +	if (ret != HS3001_RESPONSE_LENGTH) {
> +		ret = ret < 0 ? ret : -EIO;
> +		dev_dbg(&client->dev,
> +			"Error in i2c communication. Error code: %d.\n", ret);
> +		return ret;
> +	}
> +
> +	hs3001_status = (buf[0] & HS3001_MASK_STATUS_0XC0) >>
> +	    HS3001_STATUS_SHIFT;
> +	if (hs3001_status == HS3001_DATA_STALE) {
> +		dev_dbg(&client->dev, "Sensor busy.\n");
> +		return -EBUSY;
> +	} else if (hs3001_status != HS3001_DATA_VALID) {
> +		dev_dbg(&client->dev, "Data invalid.\n");
> +		return -EIO;
> +	}
> +
> +	data->humidity =
> +	    hs3001_extract_humidity(be16_to_cpup((__be16 *)&buf[0]));
> +	data->temperature =
> +	    hs3001_extract_temperature(be16_to_cpup((__be16 *)&buf[2]));
> +
> +	return 0;
> +}
> +
> +umode_t hs3001_is_visible(const void *data, enum hwmon_sensor_types type,
> +			  u32 attr, int channel)
> +{
> +	/* Both, humidity and temperature can only be read. */
> +	return 0444;
> +}
> +
> +int hs3001_read(struct device *dev, enum hwmon_sensor_types type,
> +		u32 attr, int channel, long *val)
> +{
> +	struct hs3001_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int ret;
> +	unsigned char buf[1] = { 0x00 };
> +
> +	ret = i2c_master_send(client, buf, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Sensor needs some time to process measurement depending on
> +	 * resolution
> +	 */
> +	fsleep(data->wait_time);
> +
> +	ret = hs3001_data_fetch_command(client, data);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			*val = data->temperature;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case hwmon_humidity:
> +		switch (attr) {
> +		case hwmon_humidity_input:
> +			*val = data->humidity;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *hs3001_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(humidity, HWMON_H_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops hs3001_hwmon_ops = {
> +	.is_visible = hs3001_is_visible,
> +	.read = hs3001_read,
> +};
> +
> +static const struct hwmon_chip_info hs3001_chip_info = {
> +	.ops = &hs3001_hwmon_ops,
> +	.info = hs3001_info,
> +};
> +
> +/* device ID table */
> +static const struct i2c_device_id hs3001_ids[] = {
> +	{ "hs3001", hs3001 },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, hs3001_ids);
> +
> +static const struct of_device_id hs3001_of_match[] = {
> +	{.compatible = "renesas,hs3001",
> +	 .data = (void *)hs3001
> +	},
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, hs3001_of_match);
> +
> +static int hs3001_probe(struct i2c_client *client)
> +{
> +	struct hs3001_data *data;
> +	struct device *hwmon_dev;
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return -EOPNOTSUPP;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +
> +	if (client->dev.of_node)
> +		data->type = (enum hs3001_chips)of_device_get_match_data(&client->dev);
> +	else
> +		data->type = i2c_match_id(hs3001_ids, client)->driver_data;
> +
> +	/* Measurement time = wake-up time + measurement time temperature
> +	 * + measurment time humidity. This is currently static, because
> +	 * enabling programming mode is not supported, yet.
> +	 */
> +	data->wait_time = (HS3001_WAKEUP_TIME + HS3001_14BIT_RESOLUTION +
> +			   HS3001_14BIT_RESOLUTION);
> +
> +	/* Test access to device */
> +	ret = i2c_master_send(client, NULL, 0);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +				client->name, data, &hs3001_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon_dev))
> +		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
> +				     "Unable to register hwmon device.\n");
> +
> +	return 0;
> +}
> +
> +static struct i2c_driver hs3001_i2c_driver = {
> +	.driver = {
> +		   .name = "hs3001",
> +		   .of_match_table = hs3001_of_match,
> +	},
> +	.probe_new = hs3001_probe,
> +	.id_table = hs3001_ids,
> +};
> +
> +module_i2c_driver(hs3001_i2c_driver);
> +
> +MODULE_AUTHOR("Andre Werner <andre.werner@systec-electronic.com>");
> +MODULE_DESCRIPTION("HS3001 humidity and temperature sensor base  driver");
> +MODULE_LICENSE("GPL");

