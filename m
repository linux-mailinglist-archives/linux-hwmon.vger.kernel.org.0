Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F985763C3B
	for <lists+linux-hwmon@lfdr.de>; Wed, 26 Jul 2023 18:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbjGZQTZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 26 Jul 2023 12:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232514AbjGZQTY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 12:19:24 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFAC26AE;
        Wed, 26 Jul 2023 09:19:22 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3476c902f2aso31655155ab.3;
        Wed, 26 Jul 2023 09:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388361; x=1690993161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jM2xtn0fAlfgkKdu7dlS+5oMEYvqbhGaP2iP04On7Sg=;
        b=NCgT5PMyJNChWYxjK1q0sQDhJFEWo3vWvu8BZRRmWPwRYQS+YbNAxbN4FxKlURSGi2
         P4e9SrgAenvIG0I6m3Q33wbInskatDAHJ/N6e/45eJnlVHYfdTT/qMAFXlW1x84i6x3Q
         IkH8ecTPsxvdOsQNNCUVA+KTEnQ2/SMK5Yp87nwoAP9bp34bZYV/mWXisZd1TLE1jFz/
         XQBowDGsU0TumEHkHvXmN3vpHY1xtcKk5B1YDWIbC/d4jdown+eXIoKaMoyAgFVZgmHJ
         9wHzpt9z9bbax28gouJZmtIWtd1UKGbO9eXoFHH0fDVuUf0zm3SdZboUr3rjtpHQDek8
         m8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388361; x=1690993161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM2xtn0fAlfgkKdu7dlS+5oMEYvqbhGaP2iP04On7Sg=;
        b=Ub3Sx8w+UxV26IluUVYUDOWeOvuFCdt+1+sdWzeRf0MBFloR2Bgh/Pxr1OCHwoesfI
         9YNJqTbf4/QuI3rEnEYgFsZ7Jn0dUrFUu6wLWMrtctME/WbvhLVND4Sj86Y0MLxC9b2Y
         c1MXi5TK+IAwFbVd0UFuH4nj629fFPEWb/ZvGyBcUw7LRVa552V9s6HLSw36oIunXq8O
         Gd8RvtZDqZUkHQLclK2NPZDUsggWe8gvN38fh0VuU7kCJCKqkGri4o0R49d32jNoW3Au
         pL+M9DM092PTTCVFx1Fd41hlkmFInDmc+uRrVjzPpHjEWaGgfLn7BICtkw57KPSYU1lP
         XlpA==
X-Gm-Message-State: ABy/qLb7bUJbVLJ59nNXJyQ8IBPGnPotH4++bxfHGkcRWJX4kim278TD
        ERXsrjgz1G7CTRO8pBILMEw=
X-Google-Smtp-Source: APBJJlGSYZ+P3aCwSvU3fEr6+CO4DdYqLSBpyGkvfQnmLPh6T0wddPbJm3+fixY4ymIx7PU7FD8GDA==
X-Received: by 2002:a05:6e02:1ca5:b0:348:1a1d:79a5 with SMTP id x5-20020a056e021ca500b003481a1d79a5mr3106795ill.15.1690388361373;
        Wed, 26 Jul 2023 09:19:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y1-20020a92c741000000b00345ca94df01sm4477137ilp.35.2023.07.26.09.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 09:19:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bbf1aba4-48ce-289d-aaa9-bc861effaffd@roeck-us.net>
Date:   Wed, 26 Jul 2023 09:19:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] hwmon: (isl28022) new driver for ISL28022 power
 monitor
Content-Language: en-US
To:     =?UTF-8?Q?Carsten_Spie=c3=9f?= <mail@carsten-spiess.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230726152235.249569-1-mail@carsten-spiess.de>
 <20230726152235.249569-2-mail@carsten-spiess.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230726152235.249569-2-mail@carsten-spiess.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/26/23 08:22, Carsten Spieß wrote:
> Driver for Renesas ISL28022 power monitor with I2C interface.
> The device monitors voltage, current via shunt resistor
> and calculated power.
> 
> Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>

Please provide a register dump (using i2cdump) for this chip. I strongly suspect
that the conversions will result in overflows and that they are not always correct.
I'll want to write unit test code before accepting the driver.

Guenter

> ---
>   Documentation/hwmon/index.rst    |   1 +
>   Documentation/hwmon/isl28022.rst |  56 +++++
>   MAINTAINERS                      |   7 +
>   drivers/hwmon/Kconfig            |  11 +
>   drivers/hwmon/Makefile           |   1 +
>   drivers/hwmon/isl28022.c         | 405 +++++++++++++++++++++++++++++++
>   6 files changed, 481 insertions(+)
>   create mode 100644 Documentation/hwmon/isl28022.rst
>   create mode 100644 drivers/hwmon/isl28022.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index d11924667f76..c9548fc5c40e 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -90,6 +90,7 @@ Hardware Monitoring Kernel Drivers
>      ir35221
>      ir38064
>      ir36021
> +   isl28022
>      isl68137
>      it87
>      jc42
> diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
> new file mode 100644
> index 000000000000..84c27ddcd33e
> --- /dev/null
> +++ b/Documentation/hwmon/isl28022.rst
> @@ -0,0 +1,56 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver isl28022
> +======================
> +
> +Supported chips:
> +
> +  * Renesas ISL28022
> +
> +    Prefix: 'isl28022'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: Publicly available at the Renesas website
> +
> +	       https://www.renesas.com/us/en/www/doc/datasheet/isl28022.pdf
> +
> +Author:
> +    Carsten Spieß <mail@carsten-spiess.de>
> +
> +Description
> +-----------
> +
> +The ISL28022 is a power monitor with I2C interface. The device monitors
> +voltage, current via shunt resistor and calculated power.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +device explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +The shunt value in micro-ohms, shunt gain and averaging can be set
> +via device tree at compile-time.
> +Please refer to the Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
> +for bindings if the device tree is used.
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported. All attributes are read-only.
> +
> +======================= =======================================================
> +in0_input		shunt voltage (micro Volt)
> +in1_input		bus voltage (milli Volt)
> +
> +curr1_input		current (milli Ampere)
> +power1_input		power (micro Watt)
> +
> +note			current and power attributes are supported only when
> +			shunt value is configured via device tree
> +
> +			shunt voltage is in micro Volt, not milli Volt,
> +			to get useful values
> +======================= =======================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7abb5710e1bb..c61aa688cd11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11072,6 +11072,13 @@ S:	Maintained
>   F:	Documentation/filesystems/isofs.rst
>   F:	fs/isofs/
>   
> +ISL28022 HARDWARE MONITORING DRIVER
> +M:	Carsten Spieß <mail@carsten-spiess.de>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/isl28022.rst
> +F:	drivers/hwmon/isl28022.c
> +
>   IT87 HARDWARE MONITORING DRIVER
>   M:	Jean Delvare <jdelvare@suse.com>
>   L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2913299c2c9e..3049c519e6ac 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -800,6 +800,17 @@ config SENSORS_CORETEMP
>   	  sensor inside your CPU. Most of the family 6 CPUs
>   	  are supported. Check Documentation/hwmon/coretemp.rst for details.
>   
> +config SENSORS_ISL28022
> +	tristate "Renesas ISL28022"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for ISL28022 power monitor.
> +	  Check Documentation/hwmon/isl28022.rst for details.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called isl28022.
> +
>   config SENSORS_IT87
>   	tristate "ITE IT87xx and compatibles"
>   	depends on !PPC
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index ff6bfd109c72..4046fed7f48d 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -98,6 +98,7 @@ obj-$(CONFIG_SENSORS_INA2XX)	+= ina2xx.o
>   obj-$(CONFIG_SENSORS_INA238)	+= ina238.o
>   obj-$(CONFIG_SENSORS_INA3221)	+= ina3221.o
>   obj-$(CONFIG_SENSORS_INTEL_M10_BMC_HWMON) += intel-m10-bmc-hwmon.o
> +obj-$(CONFIG_SENSORS_ISL28022)	+= isl28022.o
>   obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>   obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
>   obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> new file mode 100644
> index 000000000000..67cf47c31600
> --- /dev/null
> +++ b/drivers/hwmon/isl28022.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * isl28022.c - driver for Renesas ISL28022 power monitor chip
> + *	 monitoring
> + * Copyright (c) 2023 Carsten Spieß <mail@carsten-spiess.de>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/err.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/util_macros.h>
> +#include <linux/regulator/consumer.h>
> +
> +/* ISL28022 registers */
> +#define ISL28022_REG_CONFIG	0x00
> +#define ISL28022_REG_SHUNT	0x01
> +#define ISL28022_REG_BUS	0x02
> +#define ISL28022_REG_POWER	0x03
> +#define ISL28022_REG_CURRENT	0x04
> +#define ISL28022_REG_CALIB	0x05
> +#define ISL28022_REG_SHUNT_THR	0x06
> +#define ISL28022_REG_BUS_THR	0x07
> +#define ISL28022_REG_INT	0x08
> +#define ISL28022_REG_AUX	0x09
> +#define ISL28022_REG_MAX	ISL28022_REG_AUX
> +
> +/* ISL28022 config flags */
> +/* mode flags */
> +#define ISL28022_MODE_SHIFT	0
> +#define ISL28022_MODE_MASK	0x0007
> +
> +#define ISL28022_MODE_PWR_DOWN	0x0
> +#define ISL28022_MODE_TRG_S	0x1
> +#define ISL28022_MODE_TRG_B	0x2
> +#define ISL28022_MODE_TRG_SB	0x3
> +#define ISL28022_MODE_ADC_OFF	0x4
> +#define ISL28022_MODE_CONT_S	0x5
> +#define ISL28022_MODE_CONT_B	0x6
> +#define ISL28022_MODE_CONT_SB	0x7
> +
> +/* shunt ADC settings */
> +#define ISL28022_SADC_SHIFT	3
> +#define ISL28022_SADC_MASK	0x0078
> +
> +#define ISL28022_BADC_SHIFT	7
> +#define ISL28022_BADC_MASK	0x0780
> +
> +#define ISL28022_ADC_12		0x0	/* 12 bit ADC */
> +#define ISL28022_ADC_13		0x1	/* 13 bit ADC */
> +#define ISL28022_ADC_14		0x2	/* 14 bit ADC */
> +#define ISL28022_ADC_15		0x3	/* 15 bit ADC */
> +#define ISL28022_ADC_15_1	0x8	/* 15 bit ADC, 1 sample */
> +#define ISL28022_ADC_15_2	0x9	/* 15 bit ADC, 2 samples */
> +#define ISL28022_ADC_15_4	0xA	/* 15 bit ADC, 4 samples */
> +#define ISL28022_ADC_15_8	0xB	/* 15 bit ADC, 8 samples */
> +#define ISL28022_ADC_15_16	0xC	/* 15 bit ADC, 16 samples */
> +#define ISL28022_ADC_15_32	0xD	/* 15 bit ADC, 32 samples */
> +#define ISL28022_ADC_15_64	0xE	/* 15 bit ADC, 64 samples */
> +#define ISL28022_ADC_15_128	0xF	/* 15 bit ADC, 128 samples */
> +
> +/* shunt voltage range */
> +#define ISL28022_PG_SHIFT	11
> +#define ISL28022_PG_MASK	0x1800
> +
> +#define ISL28022_PG_40		0x0	/* +/-40 mV */
> +#define ISL28022_PG_80		0x1	/* +/-80 mV */
> +#define ISL28022_PG_160		0x2	/* +/-160 mV */
> +#define ISL28022_PG_320		0x3	/* +/-3200 mV */
> +
> +/* bus voltage range */
> +#define ISL28022_BRNG_SHIFT	13
> +#define ISL28022_BRNG_MASK	0x6000
> +
> +#define ISL28022_BRNG_16	0x0	/* 16 V */
> +#define ISL28022_BRNG_32	0x1	/* 32 V */
> +#define ISL28022_BRNG_60	0x3	/* 60 V */
> +
> +/* reset */
> +#define ISL28022_RESET		0x8000
> +
> +struct isl28022_data {
> +	struct i2c_client	*client;
> +	struct regmap		*regmap;
> +	u32			shunt;
> +	u32			gain;
> +	u32			average;
> +	u16			config;
> +	u16			calib;
> +};
> +
> +static int isl28022_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct isl28022_data *data = dev_get_drvdata(dev);
> +	unsigned int regval;
> +	int err;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			err = regmap_read(data->regmap,
> +					  ISL28022_REG_SHUNT + channel, &regval);
> +			if (err < 0)
> +				return err;
> +			*val = (channel == 0) ?
> +					(long)((s16)((u16)regval)) * 10 :
> +					(long)(((u16)regval) & 0xFFFC);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			err = regmap_read(data->regmap,
> +					  ISL28022_REG_CURRENT, &regval);
> +			if (err < 0)
> +				return err;
> +			if (!data->shunt)
> +				return -EINVAL;
> +			*val = ((long)regval * 10000L * (long)data->gain) /
> +				(long)(8 * data->shunt);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +			err = regmap_read(data->regmap,
> +					  ISL28022_REG_POWER, &regval);
> +			if (err < 0)
> +				return err;
> +			if (!data->shunt)
> +				return -EINVAL;
> +			*val = ((long)regval * 409600000L * (long)data->gain) /
> +				(long)(8 * data->shunt);
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
> +static umode_t isl28022_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			return 0444;
> +		}
> +		break;
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			return 0444;
> +		}
> +		break;
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +			return 0444;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *isl28022_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT,	/* channel 0: shunt voltage (µV) */
> +			   HWMON_I_INPUT),	/* channel 1: bus voltage (mV) */
> +	NULL
> +};
> +
> +static const struct hwmon_channel_info *isl28022_info_shunt[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT,	/* channel 0: shunt voltage (µV) */
> +			   HWMON_I_INPUT),	/* channel 1: bus voltage (mV) */
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT), /* channel 1: current (mA) */
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT),	/* channel 1: power (µW) */
> +	NULL
> +};
> +
> +static const struct hwmon_ops isl28022_hwmon_ops = {
> +	.is_visible = isl28022_is_visible,
> +	.read = isl28022_read,
> +};
> +
> +static const struct hwmon_chip_info isl28022_chip_info = {
> +	.ops = &isl28022_hwmon_ops,
> +	.info = isl28022_info,
> +};
> +
> +static const struct hwmon_chip_info isl28022_chip_info_shunt = {
> +	.ops = &isl28022_hwmon_ops,
> +	.info = isl28022_info_shunt,
> +};
> +
> +static bool isl28022_is_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case ISL28022_REG_CONFIG:
> +	case ISL28022_REG_CALIB:
> +	case ISL28022_REG_SHUNT_THR:
> +	case ISL28022_REG_BUS_THR:
> +	case ISL28022_REG_INT:
> +	case ISL28022_REG_AUX:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool isl28022_is_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case ISL28022_REG_CONFIG:
> +	case ISL28022_REG_SHUNT:
> +	case ISL28022_REG_BUS:
> +	case ISL28022_REG_POWER:
> +	case ISL28022_REG_CURRENT:
> +	case ISL28022_REG_INT:
> +	case ISL28022_REG_AUX:
> +		return true;
> +	}
> +	return true;
> +}
> +
> +static const struct regmap_config isl28022_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = ISL28022_REG_MAX,
> +	.writeable_reg = isl28022_is_writeable_reg,
> +	.volatile_reg = isl28022_is_volatile_reg,
> +	.val_format_endian = REGMAP_ENDIAN_BIG,
> +	.cache_type = REGCACHE_RBTREE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +static const struct i2c_device_id isl28022_ids[] = {
> +	{ "isl28022", 0},
> +	{ /* LIST END */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, isl28022_ids);
> +
> +static int isl28022_config(struct device *dev)
> +{
> +	struct isl28022_data *data = dev_get_drvdata(dev);
> +
> +	if (!dev || !data)
> +		return -EINVAL;
> +				;
> +	data->config = (ISL28022_MODE_CONT_SB << ISL28022_MODE_SHIFT) |
> +			(ISL28022_BRNG_60 << ISL28022_BRNG_SHIFT);
> +
> +	switch (data->gain) {
> +	case 1:
> +		data->config |= (ISL28022_PG_40 << ISL28022_PG_SHIFT);
> +		break;
> +	case 2:
> +		data->config |= (ISL28022_PG_80 << ISL28022_PG_SHIFT);
> +		break;
> +	case 4:
> +		data->config |= (ISL28022_PG_160 << ISL28022_PG_SHIFT);
> +		break;
> +	default:
> +		data->config |= (ISL28022_PG_320 << ISL28022_PG_SHIFT);
> +		data->gain = 8;
> +		break;
> +	}
> +
> +	data->calib = data->shunt ? 0x8000 / data->gain : 0;
> +
> +	switch (data->average) {
> +	case 128:
> +		data->config |= (ISL28022_ADC_15_128 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_128 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 64:
> +		data->config |= (ISL28022_ADC_15_64 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_64 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 32:
> +		data->config |= (ISL28022_ADC_15_32 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_32 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 16:
> +		data->config |= (ISL28022_ADC_15_16 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_16 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 8:
> +		data->config |= (ISL28022_ADC_15_8 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_8 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 4:
> +		data->config |= (ISL28022_ADC_15_4 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_4 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 2:
> +		data->config |= (ISL28022_ADC_15_2 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_2 << ISL28022_BADC_SHIFT);
> +		break;
> +	case 1:
> +		data->config |= (ISL28022_ADC_15_1 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15_1 << ISL28022_BADC_SHIFT);
> +		break;
> +	default:
> +		data->config |= (ISL28022_ADC_15 << ISL28022_SADC_SHIFT) |
> +				(ISL28022_ADC_15 << ISL28022_BADC_SHIFT);
> +		data->average = 0;
> +		break;
> +	}
> +
> +	regmap_write(data->regmap, ISL28022_REG_CONFIG, data->config);
> +	regmap_write(data->regmap, ISL28022_REG_CALIB, data->calib);
> +
> +	return 0;
> +}
> +
> +static int isl28022_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct isl28022_data *data;
> +	int status;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA))
> +		return -EIO;
> +
> +	data = devm_kzalloc(dev, sizeof(struct isl28022_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +
> +	of_property_read_u32(dev->of_node, "shunt-resistor-micro-ohms", &data->shunt);
> +	of_property_read_u32(dev->of_node, "shunt-gain", &data->gain);
> +	of_property_read_u32(dev->of_node, "average", &data->average);
> +
> +	data->regmap = devm_regmap_init_i2c(client, &isl28022_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "isl28022_hwmon",
> +							 data, data->shunt ?
> +							 &isl28022_chip_info_shunt :
> +							 &isl28022_chip_info, NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	status = isl28022_config(hwmon_dev);
> +	if (status)
> +		return status;
> +
> +	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused isl28022_of_match[] = {
> +	{ .compatible = "renesas,isl28022"},
> +	{ /* LIST END */ }
> +};
> +MODULE_DEVICE_TABLE(of, isl28022_of_match);
> +
> +static struct i2c_driver isl28022_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "isl28022",
> +		.of_match_table = of_match_ptr(isl28022_of_match),
> +	},
> +	.probe_new	= isl28022_probe,
> +	.id_table	= isl28022_ids,
> +};
> +
> +module_i2c_driver(isl28022_driver);
> +
> +MODULE_AUTHOR("Carsten Spiess <mail@carsten-spiess.de>");
> +MODULE_DESCRIPTION("ISL28022 driver");
> +MODULE_LICENSE("GPL");

