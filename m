Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F63D7790A1
	for <lists+linux-hwmon@lfdr.de>; Fri, 11 Aug 2023 15:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbjHKNSZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 11 Aug 2023 09:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236039AbjHKNSQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 09:18:16 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC4D35BD
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 06:18:12 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso12833255ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Aug 2023 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691759891; x=1692364691;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6YTkUhx6xbW39NKTE3ot81YReDzppkoEgv1BhdcmJw=;
        b=SO84fxep+LnaMFi4GwzODsWeVADIOmpRU7AjIVnugTLNeXd7m0l3fZwADf9Ks28FuI
         IXdjP3ym/YyjVj0SZbQOKeESdGKYhZblMrrSgLu2FRGzF+8oDbPYO+gCaPWnwTZIvhQJ
         U64UgBE+Mcx+3r7ylLJ3O8Sn/SMGv7VMfegZer/iv+aOMQdqHOfF6WC2awo5d0OGklaH
         +AqK5pti3/z394Gfa+z8jC1+RjZgo3khBituscDzoSL5WrLb771lk0ID/q4rl4y2+a9w
         wxfFgm9czxXk2tAmRHtj2mq+1Tiq74yO4+IkJwoX8baWr3SZjPapmQgkpUUhhqHW2hRd
         w1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691759891; x=1692364691;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6YTkUhx6xbW39NKTE3ot81YReDzppkoEgv1BhdcmJw=;
        b=jbS0G/6YVdIbubE/GT6aqTwe0vHbrzxbnYkySatoobobbTslAE0xI6QyUGD0fLCmXs
         d5Do/CkJSBAAeGwMDutUIkoLgLAs5wmllLgTrsBUJqlyXpCLRty+XFWnu2K1S17w+DF+
         Mlk9BInqXX+nQC9SxrFzKVhGXFwCEAGRtN0g9ts4PCUhcYi7o3ZRAGu2mzsTN2t6TGVe
         WAenkEew/VDxb1HlZN3Lk2F8ckrc8TXkIbkkoP28NI7Hd0IvAVHfsA9Y/LhYks2tK9Bw
         wostkHkmUEPiXNjnkPSwivWXq3IFBDxeqgZEAckDnFQq1Zv1qHHpG5VsA04fcwN5seaz
         lsXg==
X-Gm-Message-State: AOJu0YwDdq3lgmDEvBJk50Yg1zprrbZJfSZwm23TYvFwrqm05oXBrUBm
        5lKJhwkUNdIaV7ExhYP8lCA=
X-Google-Smtp-Source: AGHT+IHpUTYY8AIb4FvKQLAXVNi/LDKQmIFBDqZGj9YHZQGAVxjPtB1uCGwnjCZefaeT94akX4KGPw==
X-Received: by 2002:a17:902:c085:b0:1bb:a13a:c229 with SMTP id j5-20020a170902c08500b001bba13ac229mr1554054pld.38.1691759891179;
        Fri, 11 Aug 2023 06:18:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l3-20020a170903244300b001b9dadf8bd2sm3842848pls.190.2023.08.11.06.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 06:18:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6576769-11b6-c1d7-5b2f-c34a6802c8ac@roeck-us.net>
Date:   Fri, 11 Aug 2023 06:18:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Lothar Felten <lothar.felten@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jdelvare@suse.com
References: <20230811083222.15978-1-lothar.felten@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/2] hwmon: (ltc4271) new driver for LTC4271 PoE PSE
 controller
In-Reply-To: <20230811083222.15978-1-lothar.felten@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/11/23 01:32, Lothar Felten wrote:
> Driver for Analog Devices LTC4271 PoE PSE controller with I2C interface.
> The device monitors voltage, current (via shunt resistor) and controls
> power for each port.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/ltc4271.rst |  65 +++++
>   MAINTAINERS                     |   7 +
>   drivers/hwmon/Kconfig           |  11 +
>   drivers/hwmon/Makefile          |   1 +
>   drivers/hwmon/ltc4271.c         | 449 ++++++++++++++++++++++++++++++++
>   6 files changed, 534 insertions(+)
>   create mode 100644 Documentation/hwmon/ltc4271.rst
>   create mode 100644 drivers/hwmon/ltc4271.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f1fe75f59..0724b04fc 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -124,6 +124,7 @@ Hardware Monitoring Kernel Drivers
>      ltc4245
>      ltc4260
>      ltc4261
> +   ltc4271
>      max127
>      max15301
>      max16064
> diff --git a/Documentation/hwmon/ltc4271.rst b/Documentation/hwmon/ltc4271.rst
> new file mode 100644
> index 000000000..e65bc325b
> --- /dev/null
> +++ b/Documentation/hwmon/ltc4271.rst
> @@ -0,0 +1,65 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver ltc4271
> +======================
> +
> +Supported chips:
> +  * Analog Devices LTC4271
> +
> +    Prefix: 'ltc4271'
> +
> +    Datasheet: https://www.analog.com/en/products/ltc4271.html
> +
> +Author: Lothar Felten <lothar.felten@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for Analog Devices LTC4271 PoE PSE.
> +
> +LTC4271 is a quad port IEEE802.3at PSE controller with optional I2C control
> +and monitoring capabilities.
> +
> +This driver provides monitoring as well as enabling/disabling the four ports.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not probe for I2C devices. You will have to instantiate
> +devices explicitly, either by adding nodes to the device tree or by loading
> +the driver manually (see below).
> +
> +Example: the following commands will load the driver for the LTC4271 at address
> +0x20 on I2C bus #3:
> +
> +	# modprobe ltc4271
> +	# echo ltc4271 0x20 > /sys/bus/i2c/devices/i2c-3/new_device
> +
> +The lm-sensors tool can be use to display the current status
> +
> +Example:
> +	# sensors
> +	ltc4271-i2c-3-20
> +	Adapter: SMBus I801 adapter at f040
> +	Port1:        56.06 V
> +	Port2:         0.00 V
> +	Port3:         0.00 V
> +	Port4:         0.00 V
> +	Input:        55.57 V
> +	Port1:        57.00 mA
> +	Port2:         0.00 A
> +	Port3:         0.00 A
> +	Port4:         0.00 A
> +
> +Sysfs entries
> +-------------
> +
> +======================= =====================================================================

Did you pass this through "make htmldocs" ? It looks like that
should generate errors.

> +in[0-3]_input		Voltage on ports [1-4]
> +in[0-3]_label		"Port[1-4]"
> +in[0-3]_enable		Enable/disable ports [1-4]

Suspected attribute abuse. The enable attribute is intended to enable/disable
monitoring, not the port.

> +in4_input		IC input voltage
> +in4_label		"Input"
> +curr[1-4]_input		Current on ports [1-4]
> +curr[1-4]_label		"Port[1-4]"

I don't think it is a good idea to use the same labels for current and voltage.

> +======================= =====================================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c6545eb54..789742390 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12183,6 +12183,13 @@ S:	Maintained
>   F:	Documentation/hwmon/ltc4261.rst
>   F:	drivers/hwmon/ltc4261.c
>   
> +LTC4271 ANALOG DEVICES PoE PSE DRIVER
> +M:	Lothar Felten <lothar.felten@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/ltc4271.rst
> +F:	drivers/hwmon/ltc4271.c
> +
>   LTC4306 I2C MULTIPLEXER DRIVER
>   M:	Michael Hennerich <michael.hennerich@analog.com>
>   L:	linux-i2c@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5b3b76477..8254987bc 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -995,6 +995,17 @@ config SENSORS_LTC4261
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc4261.
>   
> +config SENSORS_LTC4271
> +	tristate "Analog Devices LTC4271 PoE PSE"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for Analog Devices LTC4271
> +	  802.3at PoE PSE chips.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called ltc4271.
> +
>   config SENSORS_LTQ_CPUTEMP
>   	bool "Lantiq cpu temperature sensor driver"
>   	depends on SOC_XWAY
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 88712b503..8b50361c5 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -132,6 +132,7 @@ obj-$(CONFIG_SENSORS_LTC4222)	+= ltc4222.o
>   obj-$(CONFIG_SENSORS_LTC4245)	+= ltc4245.o
>   obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>   obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
> +obj-$(CONFIG_SENSORS_LTC4271)	+= ltc4271.o
>   obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
>   obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>   obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
> diff --git a/drivers/hwmon/ltc4271.c b/drivers/hwmon/ltc4271.c
> new file mode 100644
> index 000000000..a95f5403c
> --- /dev/null
> +++ b/drivers/hwmon/ltc4271.c
> @@ -0,0 +1,449 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for the Analog Devices LTC4271 8/12 port PoE PSE controller
> + *
> + * The LTC4271 controls 8 ports when paired with the LTC4290 or 12 ports when
> + * paired with the LTC4270.
> + * The LTC4271 will appear as separate consecutive devices on the I2C bus
> + * controlling four ports each.

It would be much better to register the additional sets of channels
with i2c_new_dummy_device() and manage it from a single device
instance. See pmbus/max16601.c for an example on how to do that.

> + *
> + * Derived from the tps23861 driver by Robert Marko
> + *
> + * Copyright (C) 2023 Lothar Felten <lothar.felten@gmail.com>
> + *
> + * Datasheet: https://www.analog.com/en/products/ltc4271.html
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>
> +#include <linux/hwmon-sysfs.h>

Is this really needed ? What for ?

> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +#define ID                              0x1b
> +#define FIRMWARE_REVISION               0x41
> +#define VOLTAGE_CURRENT_MASK		GENMASK(13, 0)
> +#define INPUT_VOLTAGE_LSB		0x2e
> +#define PORT_1_CURRENT_LSB		0x30
> +#define PORT_1_VOLTAGE_LSB		0x32
> +#define PORT_2_CURRENT_LSB		0x34
> +#define PORT_2_VOLTAGE_LSB		0x36
> +#define PORT_3_CURRENT_LSB		0x38
> +#define PORT_3_VOLTAGE_LSB		0x3a
> +#define PORT_4_CURRENT_LSB		0x3c
> +#define PORT_4_VOLTAGE_LSB		0x3e

Consider something like

#define VOLTAGE_REG(n)	(0x2e + ((n) * 4)
#define CURRENT_REG(n)	(0x30 + ((n) * 4)

> +#define PORT_N_CURRENT_LSB_OFFSET	0x04
> +#define PORT_N_VOLTAGE_LSB_OFFSET	0x04
> +#define PORT_1_STATUS			0x0c
> +#define PORT_2_STATUS			0x0d
> +#define PORT_3_STATUS			0x0e
> +#define PORT_4_STATUS			0x0f

Consider

#define PORT_STATUS(n)	(0x0c + (n))

> +#define PORT_STATUS_CLASS_MASK		GENMASK(6, 4)
> +#define PORT_STATUS_DETECT_MASK		GENMASK(2, 0)
> +#define PORT_CLASS_UNKNOWN		0
> +#define PORT_CLASS_1			1
> +#define PORT_CLASS_2			2
> +#define PORT_CLASS_3			3
> +#define PORT_CLASS_4			4
> +#define PORT_CLASS_RESERVED		5
> +#define PORT_CLASS_0			6
> +#define PORT_CLASS_OVERCURRENT		7
> +#define PORT_DETECT_UNKNOWN		0
> +#define PORT_DETECT_SHORT		1
> +#define PORT_DETECT_RESERVED		2
> +#define PORT_DETECT_RESISTANCE_LOW	3
> +#define PORT_DETECT_RESISTANCE_OK	4
> +#define PORT_DETECT_RESISTANCE_HIGH	5
> +#define PORT_DETECT_OPEN_CIRCUIT	6
> +#define PORT_DETECT_RESERVED_2		7
> +#define PORT_DETECT_MOSFET_FAULT	8
> +#define PORT_DETECT_LEGACY		9
> +/* Measurement beyond clamp voltage */
> +#define PORT_DETECT_CAPACITANCE_INVALID_BEYOND	10
> +/* Insufficient voltage delta */
> +#define PORT_DETECT_CAPACITANCE_INVALID_DELTA	11
> +#define PORT_DETECT_CAPACITANCE_OUT_OF_RANGE	12
> +
> +#define DETECT_CLASS_RESTART		0x18
> +#define POWER_ENABLE			0x19
> +#define LTC4271_NUM_PORTS		4
> +
> +#define VOLTAGE_LSB			5835 /* 5.835 mV */

Add note explaining that value is in uV (e.g., 5,835 uV).
Specifying the value in uV and documenting it in mV is misleading.
Same everywhere below.

> +#define SHUNT_RESISTOR_DEFAULT		250000 /* 250 mOhm */
> +#define SHUNT_RESISTOR_250MOHMS		250000 /* 250 mOhm */
> +#define SHUNT_RESISTOR_500MOHMS		500000 /* 500 mOhm */

FWIW, this is even more misleading. The define says "MOHMS"
but the values are in uOhm.

> +#define CURRENT_LSB_250			122070 /* 122.07 uA */
> +#define CURRENT_LSB_500			61035 /* 61.035 uA */
> +
> +struct ltc4271_data {
> +	struct regmap *regmap;
> +	u32 shunt_resistor;
> +	struct i2c_client *client;

Drop. See note below.

> +	struct dentry *debugfs_dir;
> +};
> +
> +static struct regmap_config ltc4271_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +	.max_register = 0xed,
> +};
> +
> +static int ltc4271_read_voltage(struct ltc4271_data *data, int channel,
> +				 long *val)
> +{
> +	__le16 regval;
> +	long raw_val;
> +	int err;
> +
> +	if (channel < LTC4271_NUM_PORTS) {
> +		err = regmap_bulk_read(data->regmap,
> +				       PORT_1_VOLTAGE_LSB + channel * PORT_N_VOLTAGE_LSB_OFFSET,
> +				       &regval, 2);
> +	} else {
> +		err = regmap_bulk_read(data->regmap,
> +				       INPUT_VOLTAGE_LSB,
> +				       &regval, 2);
> +	}

It would be much better to model the input port as the first port.

> +	if (err < 0)
> +		return err;
> +
> +	raw_val = le16_to_cpu(regval);
> +	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * VOLTAGE_LSB) / 1000;
> +
> +	return 0;
> +}
> +
> +static int ltc4271_read_current(struct ltc4271_data *data, int channel,
> +				 long *val)
> +{
> +	long raw_val, current_lsb;
> +	__le16 regval;
> +
> +	int err;
> +
> +	if (data->shunt_resistor == SHUNT_RESISTOR_DEFAULT)
> +		current_lsb = CURRENT_LSB_250;
> +	else
> +		current_lsb = CURRENT_LSB_500;
> +

Consider storing current_lsb in struct ltc4271_data
do avoid the conditional.

> +	err = regmap_bulk_read(data->regmap,
> +			       PORT_1_CURRENT_LSB + channel * PORT_N_CURRENT_LSB_OFFSET,
> +			       &regval, 2);
> +	if (err < 0)
> +		return err;
> +
> +	raw_val = le16_to_cpu(regval);
> +	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * current_lsb) / 1000000;
> +
> +	return 0;
> +}
> +
> +static int ltc4271_port_disable(struct ltc4271_data *data, int channel)
> +{
> +	unsigned int regval = 0;
> +
> +	regval |= BIT(channel + 4);

Bit values need explanation.

> +
> +	return regmap_write(data->regmap, POWER_ENABLE, regval);
> +}
> +
> +static int ltc4271_port_enable(struct ltc4271_data *data, int channel)
> +{
> +	unsigned int regval = 0;
> +
> +	regval |= BIT(channel);
> +	regval |= BIT(channel + 4);
> +
> +	return regmap_write(data->regmap, DETECT_CLASS_RESTART, regval);
> +}

As mentioned above, suspected attribute abuse. The programming manual is not
available to the public. I requested access. but who knows if Analog will grant it.
Please note that I won't be able to accept this unless I have confirmation
that this controls the sensor(s), not the port.

> +
> +static umode_t ltc4271_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		case hwmon_in_enable:
> +			return 0200;

This must be readable.

default: missing.

> +		}
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_curr_label:
> +			return 0444;

default missing (doesn't gcc complain about that ?)

> +		}

default: missing.

> +	}
> +
> +	return 0;
> +}
> +
> +static int ltc4271_write(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long val)
> +{
> +	struct ltc4271_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_enable:
> +			if (val == 0)
> +				return ltc4271_port_disable(data, channel);
> +			else if (val == 1)
> +				return ltc4271_port_enable(data, channel);
> +			else

else after return is pointless.

> +				return -EINVAL;
> +		}

default: missing.

> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ltc4271_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct ltc4271_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			return ltc4271_read_voltage(data, channel, val);
> +		}
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			return ltc4271_read_current(data, channel, val);
> +		}

and again and everywhere.

> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const char * const ltc4271_port_label[] = {
> +	"Port1",
> +	"Port2",
> +	"Port3",
> +	"Port4",
> +	"Input",
> +};
> +
> +static int ltc4271_read_string(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +	case hwmon_curr:
> +		*str = ltc4271_port_label[channel];
> +
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static const struct hwmon_channel_info *ltc4271_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ltc4271_hwmon_ops = {
> +	.is_visible = ltc4271_is_visible,
> +	.write = ltc4271_write,
> +	.read = ltc4271_read,
> +	.read_string = ltc4271_read_string,
> +};
> +
> +static const struct hwmon_chip_info ltc4271_chip_info = {
> +	.ops = &ltc4271_hwmon_ops,
> +	.info = ltc4271_info,
> +};
> +
> +static const char *port_detect_status_string(uint8_t status_reg)
> +{
> +	switch (FIELD_GET(PORT_STATUS_DETECT_MASK, status_reg)) {
> +	case PORT_DETECT_UNKNOWN:
> +		return "Unknown device";
> +	case PORT_DETECT_SHORT:
> +		return "Short circuit";
> +	case PORT_DETECT_RESISTANCE_LOW:
> +		return "Too low resistance";
> +	case PORT_DETECT_RESISTANCE_OK:
> +		return "Valid resistance";
> +	case PORT_DETECT_RESISTANCE_HIGH:
> +		return "Too high resistance";
> +	case PORT_DETECT_OPEN_CIRCUIT:
> +		return "Open circuit";
> +	case PORT_DETECT_MOSFET_FAULT:
> +		return "MOSFET fault";
> +	case PORT_DETECT_LEGACY:
> +		return "Legacy device";
> +	case PORT_DETECT_CAPACITANCE_INVALID_BEYOND:
> +		return "Invalid capacitance, beyond clamp voltage";
> +	case PORT_DETECT_CAPACITANCE_INVALID_DELTA:
> +		return "Invalid capacitance, insufficient voltage delta";
> +	case PORT_DETECT_CAPACITANCE_OUT_OF_RANGE:
> +		return "Valid capacitance, outside of legacy range";
> +	case PORT_DETECT_RESERVED:
> +	case PORT_DETECT_RESERVED_2:
> +	default:
> +		return "Invalid";
> +	}
> +}
> +
> +static char *port_class_status_string(uint8_t status_reg)
> +{
> +	switch (FIELD_GET(PORT_STATUS_CLASS_MASK, status_reg)) {
> +	case PORT_CLASS_UNKNOWN:
> +		return "Unknown";
> +	case PORT_CLASS_0:
> +		return "0";
> +	case PORT_CLASS_1:
> +		return "1";
> +	case PORT_CLASS_2:
> +		return "2";
> +	case PORT_CLASS_3:
> +		return "3";
> +	case PORT_CLASS_4:
> +		return "4";
> +	case PORT_CLASS_OVERCURRENT:
> +		return "Overcurrent";
> +	case PORT_CLASS_RESERVED:
> +	default:
> +		return "Invalid";
> +	}

That makes me wonder if alarm attributes would be appropriate.

> +}
> +
> +static int ltc4271_port_status_show(struct seq_file *s, void *data)
> +{
> +	struct ltc4271_data *priv = s->private;
> +	unsigned int i, status;
> +
> +	for (i = 0; i < LTC4271_NUM_PORTS; i++) {
> +		regmap_read(priv->regmap, PORT_1_STATUS + i, &status);
> +
> +		seq_printf(s, "Port: \t\t%d\n", i + 1);
> +		seq_printf(s, "Detected: \t%s\n", port_detect_status_string(status));
> +		seq_printf(s, "Class: \t\t%s\n", port_class_status_string(status));
> +		seq_putc(s, '\n');
> +	}
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(ltc4271_port_status);
> +
> +static void ltc4271_init_debugfs(struct ltc4271_data *data,
> +				  struct device *hwmon_dev)
> +{
> +	const char *debugfs_name;
> +
> +	debugfs_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "%s-%s",
> +				      data->client->name, dev_name(hwmon_dev));

pass client as argument.

> +	if (!debugfs_name)
> +		return;
> +

Unnecessary (and undesirable) check.

Also, consider creating a single root directory for all LTC4271s in the system.
As it is, there will be lots of root directories. Look for various other drivers
to see how they implement that.

> +	data->debugfs_dir = debugfs_create_dir(debugfs_name, NULL);
> +
> +	debugfs_create_file("port_status",
> +			    0400,
> +			    data->debugfs_dir,
> +			    data,
> +			    &ltc4271_port_status_fops);
> +}
> +
> +static int ltc4271_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct ltc4271_data *data;
> +	struct device *hwmon_dev;
> +	u32 shunt_resistor;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	i2c_set_clientdata(client, data);
> +
> +	data->regmap = devm_regmap_init_i2c(client, &ltc4271_regmap_config);
> +	if (IS_ERR(data->regmap)) {
> +		dev_err(dev, "failed to allocate register map\n");

s/allocate/initialize/

Also consider using dev_err_probe().

> +		return PTR_ERR(data->regmap);
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "shunt-resistor-micro-ohms", &shunt_resistor)) {

Use device_property_read_u32().

> +		dev_warn(dev, "assuming default shunt resistor of 250mOhms\n");
> +		data->shunt_resistor = SHUNT_RESISTOR_250MOHMS;
> +	} else if ((shunt_resistor == SHUNT_RESISTOR_250MOHMS) ||
> +		(shunt_resistor == SHUNT_RESISTOR_500MOHMS))
> +		data->shunt_resistor = shunt_resistor;

Please refrain from unnecessary () in if statements.

> +	else {
> +		dev_err(dev, "invalid shunt resistor value: %i. supported values are 250mOhms or 500mOhms\n",
> +			shunt_resistor/1000);

dev_err_probe()

> +		return -EINVAL;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data, &ltc4271_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	ltc4271_init_debugfs(data, hwmon_dev);
> +
> +	return 0;
> +}
> +
> +static void ltc4271_remove(struct i2c_client *client)
> +{
> +	struct ltc4271_data *data = i2c_get_clientdata(client);
> +
> +	debugfs_remove_recursive(data->debugfs_dir);
> +}
> +
> +static const struct i2c_device_id ltc4271_id[] = {
> +	{ "ltc4271", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc4271_id);
> +
> +static const struct of_device_id __maybe_unused ltc4271_of_match[] = {
> +	{ .compatible = "adi,ltc4271", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ltc4271_of_match);
> +
> +static struct i2c_driver ltc4271_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.probe_new	= ltc4271_probe,

s/probe_new/probe/

> +	.remove		= ltc4271_remove,
> +	.driver = {
> +		.name		= "ltc4271",
> +		.of_match_table	= of_match_ptr(ltc4271_of_match),

Drop of_match_ptr() and _maybe_unused.

> +	},
> +	.id_table	= ltc4271_id,
> +};
> +module_i2c_driver(ltc4271_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Lothar Felten <lothar.felten@gmail.com>");
> +MODULE_DESCRIPTION("ltc4271 PoE PSE");

