Return-Path: <linux-hwmon+bounces-15-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713F7E8BDE
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Nov 2023 18:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B551C20841
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Nov 2023 17:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62CA1BDC6;
	Sat, 11 Nov 2023 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He6Lqxfx"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0D1BDCB;
	Sat, 11 Nov 2023 17:22:55 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622FF3868;
	Sat, 11 Nov 2023 09:22:50 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-daec4e4c5eeso3078214276.1;
        Sat, 11 Nov 2023 09:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699723369; x=1700328169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9vgE6jUpyM/jO8ebHcp9RHvtf+5/dLpCugjMAJqw8iM=;
        b=He6LqxfxyKSGGPs5jFki/sX6R/iM/B157/gcgw86o9FDrcCMZ+GjwKCA5sQ+JAujYs
         AaupmyzmBAYqMB92QEc8kRWrIHK/is9QIlZDZGEuzN3No0n+0/Qqh3EJzTCKKKpNBl9P
         zXW1lFx7SQic6MD5OTOje2NYpbWZCBIoRgEZwO/gxxzrzeFKxrGgyRO9pMCaPHERMdJm
         lMgo+8l/7BzVAXBKIe8UglQlt4LCXdZGh7XFFWDlXsj4AHng7qAG8cSic3ykJ5aFphdF
         7NYW6tfxo/sx0ZTIQECC/+pCvYG2OweQgo4i24PaTCPNmzhaXSiWYu+63c5Sj9hgH/QZ
         I4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699723369; x=1700328169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vgE6jUpyM/jO8ebHcp9RHvtf+5/dLpCugjMAJqw8iM=;
        b=NkyAnL4GOLXWgd/vKeN80T0CYfq4QKdA2A+y/ZeuIV9FY8gkCcyUc6bdxj71tm5cQl
         p0IaSczeUMYbIkytyCkbEd6hwylSqkn/Msnhi7QavxhQW5f0N0W7xksNiquhCdX16rZZ
         7m6gQalSp7gJeRp55W7TlJWmlTLFx0g0m4LQpeI6sGdlAoJI165oxl/90MDWP3DuwtXy
         Xz7tsHZzHkkS8uZ44pEPJuR7BEEr/BEP36Tu4y+s27jw3XBA1fXJ6nSDvm+pN8PnU9sI
         xhGJEcq7Jiu743oC6EIV9Ke+nsOxb9J03QaEMSwi4xSk6fuf3sBOAcNw5zsA41M/p4b4
         GSWg==
X-Gm-Message-State: AOJu0YwrZ95dbSA+lg8l/+ydFwb8hZiLCwzNe9DQJ98m4QYVBZTBeJOs
	XeUv00f3rsfNWDCfDVyf5w+nJLBQR3I=
X-Google-Smtp-Source: AGHT+IFk0O1ZwELDEBCci4L/Et3f/mksGXI4TBPYT4O/I+5DciyITjGcijEWvnnW74q6fTeyDUWqvw==
X-Received: by 2002:a25:a126:0:b0:d9a:e6d3:ae1c with SMTP id z35-20020a25a126000000b00d9ae6d3ae1cmr2113669ybh.53.1699723369081;
        Sat, 11 Nov 2023 09:22:49 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x12-20020a0ce0cc000000b00674648411b3sm691226qvk.132.2023.11.11.09.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Nov 2023 09:22:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f03d0171-7da1-4823-8465-f276d90fbd0a@roeck-us.net>
Date: Sat, 11 Nov 2023 09:22:45 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Content-Language: en-US
To: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-3-nuno.sa@analog.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231110151905.1659873-3-nuno.sa@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/23 07:18, Nuno Sa wrote:
> The LTC4282 hot swap controller allows a board to be safely inserted and
> removed from a live backplane. Using one or more external N-channel pass
> transistors, board supply voltage and inrush current are ramped up at an
> adjustable rate. An I2C interface and onboard ADC allows for monitoring
> of board current, voltage, power, energy and fault status.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>   Documentation/hwmon/ltc4282.rst |  101 ++

As reported by 0-day, this must be added to index.rst.


Anyway, partial review only. Also, since it registers a gpio driver,
it will need to be reviewed by a gpio maintainer. I am not comfortable
with some of the gpio code.

>   MAINTAINERS                     |    2 +
>   drivers/hwmon/Kconfig           |   11 +
>   drivers/hwmon/Makefile          |    1 +
>   drivers/hwmon/ltc4282.c         | 1518 +++++++++++++++++++++++++++++++
>   5 files changed, 1633 insertions(+)
>   create mode 100644 Documentation/hwmon/ltc4282.rst
>   create mode 100644 drivers/hwmon/ltc4282.c
> 
> diff --git a/Documentation/hwmon/ltc4282.rst b/Documentation/hwmon/ltc4282.rst
> new file mode 100644
> index 000000000000..2fab5d165aa4
> --- /dev/null
> +++ b/Documentation/hwmon/ltc4282.rst
> @@ -0,0 +1,101 @@
> +Kernel drivers ltc4282
> +==========================================
> +
> +Supported chips:
> +
> +  * Analog Devices LTC4282
> +
> +    Prefix: 'ltc4282'
> +
> +    Addresses scanned: - I2C 0x40 - 0x5A (7-bit)
> +    Addresses scanned: - I2C 0x80 - 0xB4 with a step of 2 (8-bit)
> +
> +    Datasheet:
> +
> +        https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4282.pdf
> +
> +Author: Nuno Sá <nuno.sa@analog.com>
> +
> +Description
> +___________
> +
> +The LTC4282 hot swap controller allows a board to be safely inserted and removed
> +from a live backplane. Using one or more external N-channel pass transistors,
> +board supply voltage and inrush current are ramped up at an adjustable rate. An
> +I2C interface and onboard ADC allows for monitoring of board current, voltage,
> +power, energy and fault status. The device features analog foldback current
> +limiting and supply monitoring for applications from 2.9V to 33V. Dual 12V gate
> +drive allows high power applications to either share safe operating area across
> +parallel MOSFETs or support a 2-stage start-up that first charges the load
> +capacitance followed by enabling a low on-resistance path to the load. The
> +LTC4282 is well suited to high power applications because the precise monitoring
> +capability and accurate current limiting reduce the extremes in which both loads
> +and power supplies must safely operate. Non-volatile configuration allows for
> +flexibility in the autonomous generation of alerts and response to faults.
> +
> +Sysfs entries
> +_____________
> +
> +The following attributes are supported. Limits are read-write and all the other
> +attributes are read-only.
> +
> +======================= ==========================================
> +in0_input		Output voltage (mV).
> +in0_min			Undervoltage threshold
> +in0_max                 Overvoltage threshold
> +in0_lowest		Lowest measured voltage
> +in0_highest		Highest measured voltage
> +in0_min_alarm		Undervoltage alarm
> +in0_max_alarm           Overvoltage alarm
> +in0_label		Channel label (VSOURCE)
> +
> +in1_input		Input voltage (mV).
> +in1_lcrit_alarm         Critical Undervoltage alarm
> +in1_lcrit_fault_log     Undervoltage Fault Log. In some setups, clearing this
> +			fault (writing on the file) might be needed.
> +in1_crit_alarm          Critical Overvoltage alarm
> +in1_crit_fault_log	Overvoltage Fault Log. In some setups, clearing this
> +			fault (writing on the file) might be needed
> +in1_label		Channel label (VDD)
> +
> +in2_input		GPIO voltage (mV)
> +in2_min			Undervoltage threshold
> +in2_max			Overvoltage threshold
> +in2_lowest		Lowest measured voltage
> +in2_highest		Highest measured voltage
> +in2_min_alarm		Undervoltage alarm
> +in2_max_alarm		Overvoltage alarm
> +in2_label		Channel label (VGPIO)
> +
> +curr1_input		Sense current (mA)
> +curr1_min		Undercurrent threshold
> +curr1_max		Overcurrent threshold
> +curr1_lowest		Lowest measured current
> +curr1_highest		Highest measured current
> +curr1_min_alarm		Undercurrent alarm
> +curr1_max_alarm		Overcurrent alarm
> +curr1_crit_alarm        Critical Overcurrent alarm
> +curr1_crit_fault_log	Overcurrent Fault Log. In some setups, clearing this
> +			fault (writing on the file) might be needed
> +curr1_label		Channel label (ISENSE)
> +
> +power1_input		Power (in uW)
> +power1_min		Low power threshold
> +power1_max		High power threshold
> +power1_average          Average Power use
> +power1_input_lowest	Historical minimum power use
> +power1_input_highest	Historical maximum power use
> +power1_min_alarm	Low power alarm
> +power1_max_alarm	High power alarm
> +power1_good		Power considered good
> +power1_fault_log	Power bad Fault log
> +power1_label		Channel label (Power)
> +
> +energy1_input		Measured energy over time (in microJoule)
> +energy1_enable		Enable/Disable Energy accumulation
> +
> +fet_short_fault		FET short alarm
> +fet_short_fault_log	FET short Fault log
> +fet_bad_fault		FET bad alarm
> +fet_bad_fault_log	FET bad Fault log
> +======================= ==========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f9527f6057b..ba7f0439d8e8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12486,6 +12486,8 @@ M:	Nuno Sa <nuno.sa@analog.com>
>   L:	linux-hwmon@vger.kernel.org
>   S:	Supported
>   F:	Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> +F:	Documentation/hwmon/ltc4282.rst
> +F:	drivers/hwmon/ltc4282.c
>   
>   LTC4306 I2C MULTIPLEXER DRIVER
>   M:	Michael Hennerich <michael.hennerich@analog.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index cf27523eed5a..2f1a0cf2e1e4 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1027,6 +1027,17 @@ config SENSORS_LTC4261
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc4261.
>   
> +config SENSORS_LTC4282
> +	tristate "Analog Devices LTC4282"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for Analog Devices LTC4282
> +	  High Current Hot Swap Controller I2C interface.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ltc4282.
> +
>   config SENSORS_LTQ_CPUTEMP
>   	bool "Lantiq cpu temperature sensor driver"
>   	depends on SOC_XWAY
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index e84bd9685b5c..cbf22d1d736f 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_LTC4222)	+= ltc4222.o
>   obj-$(CONFIG_SENSORS_LTC4245)	+= ltc4245.o
>   obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
>   obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
> +obj-$(CONFIG_SENSORS_LTC4282)	+= ltc4282.o
>   obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
>   obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
>   obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> new file mode 100644
> index 000000000000..738312cf212e
> --- /dev/null
> +++ b/drivers/hwmon/ltc4282.c
> @@ -0,0 +1,1518 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Analog Devices LTC4282 I2C High Current Hot Swap Controller over I2C
> + *
> + * Copyright 2023 Analog Devices Inc.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +#define LTC4282_CTRL_LSB			0x00
> +  #define LTC4282_CTRL_OV_RETRY_MASK		BIT(0)
> +  #define LTC4282_CTRL_UV_RETRY_MASK		BIT(1)
> +  #define LTC4282_CTRL_OC_RETRY_MASK		BIT(2)
> +  #define LTC4282_CTRL_ON_ACTIVE_LOW_MASK	BIT(5)
> +  #define LTC4282_CTRL_ON_DELAY_MASK		BIT(6)
> +#define LTC4282_CTRL_MSB			0x01
> +  #define LTC4282_CTRL_VIN_MODE_MASK		GENMASK(1, 0)
> +  #define LTC4282_CTRL_OV_MODE_MASK		GENMASK(3, 2)
> +  #define LTC4282_CTRL_UV_MODE_MASK		GENMASK(5, 4)
> +#define LTC4282_FAULT_LOG			0x04
> +  #define LTC4282_OV_FAULT_MASK			BIT(0)
> +  #define LTC4282_UV_FAULT_MASK			BIT(1)
> +  #define LTC4282_OC_FAULT_MASK			BIT(2)
> +  #define LTC4282_POWER_BAD_FAULT_MASK		BIT(3)
> +  #define LTC4282_FET_SHORT_FAULT_MASK		BIT(5)
> +  #define LTC4282_FET_BAD_FAULT_MASK		BIT(6)
> +#define LTC4282_ADC_ALERT_LOG			0x05
> +  #define LTC4282_GPIO_ALARM_L_MASK		BIT(0)
> +  #define LTC4282_GPIO_ALARM_H_MASK		BIT(1)
> +  #define LTC4282_VSOURCE_ALARM_L_MASK		BIT(2)
> +  #define LTC4282_VSOURCE_ALARM_H_MASK		BIT(3)
> +  #define LTC4282_VSENSE_ALARM_L_MASK		BIT(4)
> +  #define LTC4282_VSENSE_ALARM_H_MASK		BIT(5)
> +  #define LTC4282_POWER_ALARM_L_MASK		BIT(6)
> +  #define LTC4282_POWER_ALARM_H_MASK		BIT(7)
> +#define LTC4282_FET_BAD_FAULT_TIMEOUT		0x06
> +  #define LTC4282_FET_BAD_MAX_TIMEOUT		255
> +#define LTC4282_GPIO_CONFIG			0x07
> +  #define LTC4282_GPIO_2_FET_STRESS_MASK	BIT(1)
> +  #define LTC4282_GPIO_1_OUT_MASK		BIT(3)
> +  #define LTC4282_GPIO_1_CONFIG_MASK		GENMASK(5, 4)
> +  #define LTC4282_GPIO_2_OUT_MASK		BIT(6)
> +  #define LTC4282_GPIO_3_OUT_MASK		BIT(7)
> +#define LTC4282_VGPIO_MIN			0x08
> +#define LTC4282_VGPIO_MAX			0x09
> +#define LTC4282_VSOURCE_MIN			0x0a
> +#define LTC4282_VSOURCE_MAX			0x0b
> +#define LTC4282_VSENSE_MIN			0x0c
> +#define LTC4282_VSENSE_MAX			0x0d
> +#define LTC4282_POWER_MIN			0x0e
> +#define LTC4282_POWER_MAX			0x0f
> +#define LTC4282_CLK_DIV				0x10
> +  #define LTC4282_CLK_DIV_MASK			GENMASK(4, 0)
> +  #define LTC4282_CLKOUT_MASK			GENMASK(6, 5)
> +#define LTC4282_ILIM_ADJUST			0x11
> +  #define LTC4282_GPIO_MODE_MASK		BIT(1)
> +  #define LTC4282_VDD_MONITOR_MASK		BIT(2)
> +  #define LTC4282_FOLDBACK_MODE_MASK		GENMASK(4, 3)
> +  #define LTC4282_ILIM_ADJUST_MASK		GENMASK(7, 5)
> +#define LTC4282_ENERGY				0x12
> +#define LTC4282_TIME_COUNTER			0x18
> +#define LTC4282_ALERT_CTRL			0x1C
> +  #define LTC4282_ALERT_OUT_MASK		BIT(6)
> +#define LTC4282_ADC_CTRL			0x1D
> +  #define LTC4282_FAULT_LOG_EN_MASK		BIT(2)
> +  #define LTC4282_METER_HALT_MASK		BIT(5)
> +  #define LTC4282_METER_RESET_MASK		BIT(6)
> +  #define LTC4282_RESET_MASK			BIT(7)
> +#define LTC4282_STATUS_LSB			0x1E
> +  #define LTC4282_OV_STATUS_MASK		BIT(0)
> +  #define LTC4282_UV_STATUS_MASK		BIT(1)
> +  #define LTC4282_VDD_STATUS_MASK		(LTC4282_OV_STATUS_MASK | LTC4282_UV_STATUS_MASK)
> +  #define LTC4282_OC_STATUS_MASK		BIT(2)
> +  #define LTC4282_POWER_GOOD_MASK		BIT(3)
> +  #define LTC4282_FET_SHORT_MASK		BIT(5)
> +  #define LTC4282_FET_BAD_STATUS_MASK		BIT(6)
> +#define LTC4282_STATUS_MSB			0x1F
> +  #define LTC4282_METER_TICK_OVERFLOW_MASK	GENMASK(1, 0)
> +  #define LTC4282_ALERT_STATUS_MASK		BIT(4)
> +  #define LTC4282_GPIO_1_STATUS_MASK		BIT(5)
> +  #define LTC4282_GPIO_2_STATUS_MASK		BIT(6)
> +  #define LTC4282_GPIO_3_STATUS_MASK		BIT(7)
> +#define LTC4282_RESERVED_1			0x32
> +#define LTC4282_RESERVED_2			0x33
> +#define LTC4282_VGPIO				0x34
> +#define LTC4282_VGPIO_LOWEST			0x36
> +#define LTC4282_VGPIO_HIGHEST			0x38
> +#define LTC4282_VSOURCE				0x3a
> +#define LTC4282_VSOURCE_LOWEST			0x3c
> +#define LTC4282_VSOURCE_HIGHEST			0x3e
> +#define LTC4282_VSENSE				0x40
> +#define LTC4282_VSENSE_LOWEST			0x42
> +#define LTC4282_VSENSE_HIGHEST			0x44
> +#define LTC4282_POWER				0x46
> +#define LTC4282_POWER_LOWEST			0x48
> +#define LTC4282_POWER_HIGHEST			0x4a
> +#define LTC4282_RESERVED_3			0x50
> +
> +#define LTC4282_CLKIN_MIN	(250 * KILO)
> +#define LTC4282_CLKIN_MAX	(15500 * KILO)
> +/* this assumes 12bit ADC */
> +#define LTC4282_TCONV_US	65535
> +#define LTC4282_GPIO_NR		4
> +/*
> + * relaxed version of FIELD_PREP() to be used when mask is not a compile time constant
> + * u32_encode_bits() can't also be used as the compiler needs to be able to evaluate
> + * mask at compile time.
> + */
> +#define LTC4282_FIELD_PREP(m, v)	(((v) << (ffs(m) - 1)) & (m))
> +
> +struct ltc4282_state {
> +	struct regmap *map;
> +	struct device *dev;

This is only used for an inappropriate warning message and during probe.
Pass it to initialization functions where needed.

> +	/* Protect against multiple accesses to the device registers */
> +	struct mutex lock;
> +	struct gpio_chip gc;
> +	u64 saved_energy;
> +	long power_max;

I do not understand how this is used in the code. It seems to avoid overflows
due to unreasonable values of rsense. That adds a lot of complexist to the code
and makes it hard to understand.

> +	u32 gpio_map[LTC4282_GPIO_NR];
> +	u32 rsense;
> +	u32 vin_mode;
> +	u16 vfs_out;
> +};
> +
> +struct ltc4282_gpio {
> +	u32 out_reg;
> +	u32 out_mask;
> +	u32 in_reg;
> +	u32 in_mask;
> +	bool active_high;
> +	u8 n_funcs;
> +};
> +
> +enum {
> +	LTC4282_VIN_3_3V,
> +	LTC4282_VIN_5V,
> +	LTC4282_VIN_12V,
> +	LTC4282_VIN_24V,
> +};
> +
> +enum {
> +	LTC4282_CHAN_VSOURCE,
> +	LTC4282_CHAN_VDD,
> +	LTC4282_CHAN_VGPIO,
> +};
> +
> +enum {
> +	LTC4282_GPIO_1,
> +	LTC4282_GPIO_2,
> +	LTC4282_GPIO_3,
> +	LTC4282_ALERT,
> +};
> +
> +static const struct ltc4282_gpio ltc4282_gpios[] = {
> +	[LTC4282_GPIO_1] = {
> +		.in_reg = LTC4282_STATUS_MSB,
> +		.in_mask = LTC4282_GPIO_1_STATUS_MASK,
> +		.out_reg = LTC4282_GPIO_CONFIG,
> +		.out_mask = LTC4282_GPIO_1_OUT_MASK,
> +		.active_high = true,
> +		.n_funcs = 3,
> +	},
> +	[LTC4282_GPIO_2] = {
> +		.in_reg = LTC4282_STATUS_MSB,
> +		.in_mask = LTC4282_GPIO_2_STATUS_MASK,
> +		.out_reg = LTC4282_GPIO_CONFIG,
> +		.out_mask = LTC4282_GPIO_2_OUT_MASK,
> +		.n_funcs = 3,
> +	},
> +	[LTC4282_GPIO_3] = {
> +		.in_reg = LTC4282_STATUS_MSB,
> +		.in_mask = LTC4282_GPIO_3_STATUS_MASK,
> +		.out_reg = LTC4282_GPIO_CONFIG,
> +		.out_mask = LTC4282_GPIO_3_OUT_MASK,
> +		.n_funcs = 2,
> +	},
> +	[LTC4282_ALERT] = {
> +		.in_reg = LTC4282_STATUS_MSB,
> +		.in_mask = LTC4282_ALERT_STATUS_MASK,
> +		.out_reg = LTC4282_ALERT_CTRL,
> +		.out_mask = LTC4282_ALERT_OUT_MASK,
> +	},
> +};
> +
> +static int ltc4282_gpio_input_set(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct ltc4282_state *st = gpiochip_get_data(chip);
> +	u32 gpio_pin = st->gpio_map[offset];
> +
> +	/* we can only control this for GPIO_1 */
> +	if (gpio_pin != LTC4282_GPIO_1)
> +		return 0;
> +
> +	return regmap_set_bits(st->map, LTC4282_GPIO_CONFIG, LTC4282_GPIO_1_CONFIG_MASK);
> +}
> +
> +static int ltc4282_gpio_output_set(struct gpio_chip *chip, unsigned int offset, int val)
> +{
> +	struct ltc4282_state *st = gpiochip_get_data(chip);
> +	u32 gpio_pin = st->gpio_map[offset];
> +	const struct ltc4282_gpio *gpio = &ltc4282_gpios[gpio_pin];
> +
> +	guard(mutex)(&st->lock);
> +	/*
> +	 * Explicitly setting the pin as output can only be done for GPIO_1. For the
> +	 * other pins we just pull the line down or high-z.
> +	 */
> +	if (gpio_pin == LTC4282_GPIO_1) {
> +		int ret;
> +
> +		ret = regmap_update_bits(st->map, LTC4282_GPIO_CONFIG, LTC4282_GPIO_1_CONFIG_MASK,
> +					 FIELD_PREP(LTC4282_GPIO_1_CONFIG_MASK, 2));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* GPIO_2,3 and the ALERT pin require setting the bit to 1 to pull down the line */
> +	if (!gpio->active_high)
> +		val = !val;
> +
> +	return regmap_update_bits(st->map, gpio->out_reg, gpio->out_mask,
> +				  LTC4282_FIELD_PREP(gpio->out_mask, val));
> +}
> +
> +static void ltc4282_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
> +{
> +	struct ltc4282_state *st = gpiochip_get_data(chip);
> +	u32 gpio_pin = st->gpio_map[offset];
> +	const struct ltc4282_gpio *gpio = &ltc4282_gpios[gpio_pin];
> +
> +	if (!gpio->active_high)
> +		val = !val;
> +
> +	regmap_update_bits(st->map, gpio->out_reg, gpio->out_mask,
> +			   LTC4282_FIELD_PREP(gpio->out_mask, val));
> +}
> +
> +static int ltc4282_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct ltc4282_state *st = gpiochip_get_data(chip);
> +	u32 gpio_pin = st->gpio_map[offset];
> +	const struct ltc4282_gpio *gpio = &ltc4282_gpios[gpio_pin];
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(st->map, gpio->in_reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	return !!(val & gpio->in_mask);
> +}
> +
> +static int ltc4282_read_voltage_word(const struct ltc4282_state *st, u32 reg, u32 fs, long *val)
> +{
> +	__be16 in;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &in, sizeof(in));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * This is also used to calculate current in which case fs comes in 10 * uV.
> +	 * Hence the ULL usage.
> +	 */
> +	*val = DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs, U16_MAX);
> +	return 0;
> +}
> +
> +static int ltc4282_read_voltage_byte(const struct ltc4282_state *st, u32 reg, u32 fs, long *val)
> +{
> +	int ret;
> +	u32 in;
> +
> +	ret = regmap_read(st->map, reg, &in);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(in * fs, U8_MAX);
> +	return 0;
> +}
> +
> +static int ltc4282_read_vdd(struct ltc4282_state *st, u32 fs, long *val)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* ADC now monitors VDD */
> +	ret = regmap_clear_bits(st->map, LTC4282_ILIM_ADJUST, LTC4282_VDD_MONITOR_MASK);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Wait for two ADC conversions so we are sure we get one full VDD
> +	 * measurement.
> +	 */
> +	msleep(2 * LTC4282_TCONV_US / MILLI);
> +
> +	ret = ltc4282_read_voltage_word(st, LTC4282_VSOURCE, st->vfs_out, val);
> +	if (ret)
> +		return ret;
> +
> +	/* back to VSOURCE */
> +	return regmap_set_bits(st->map, LTC4282_ILIM_ADJUST, LTC4282_VDD_MONITOR_MASK);

Handle this with _enable attributes if the chip only reports one measurement.
Sleeping 130+ ms for each reading is unacceptable. Besides, subsequent VSOURCE
readings would have to be delayed as well.

I'll have to read the datasheet in lore detail to understand how this translates
into limits. I see that the chip has limit registers for the various voltages,
which doesn't really make sense if the chip doesn't measure those voltages.

> +}
> +
> +static int ltc4282_read_alarm(struct ltc4282_state *st, u32 reg, u32 mask, long *val)
> +{
> +	u32 alarm;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* if not status, clear first the alarm by clearing the bit */
> +	if (reg != LTC4282_STATUS_LSB && reg != LTC4282_FAULT_LOG) {
> +		ret = regmap_clear_bits(st->map, reg, mask);
> +		if (ret)
> +			return ret;
> +
> +		msleep(LTC4282_TCONV_US / MILLI);
> +	}

Normally one would want to have historic alarms reported at least once,
even if the alarm since went away. This code seems to clear alarm bits
prior to reading them, which will result in under-reporting. This will
need to be explained, especially since it results in a 65+ ms delay for
each alarm report if alarms are active which seems excessive and
unnceessary.

> +
> +	ret = regmap_read(st->map, reg, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val = !!(alarm & mask);
> +
> +	return 0;
> +}
> +
> +static int ltc4282_read_in(struct device *dev, u32 attr, long *val, u32 channel)
> +{
> +	struct ltc4282_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_voltage_word(st, LTC4282_VSOURCE, st->vfs_out, val);
> +		if (channel == LTC4282_CHAN_VDD)
> +			return ltc4282_read_vdd(st, st->vfs_out, val);
> +
> +		return ltc4282_read_voltage_word(st, LTC4282_VGPIO, 1280, val);
> +	case hwmon_in_highest:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_voltage_word(st, LTC4282_VSOURCE_HIGHEST,
> +							 st->vfs_out, val);
> +
> +		return ltc4282_read_voltage_word(st, LTC4282_VGPIO_HIGHEST, 1280, val);
> +	case hwmon_in_lowest:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_voltage_word(st, LTC4282_VSOURCE_LOWEST,
> +							 st->vfs_out, val);
> +
> +		return ltc4282_read_voltage_word(st, LTC4282_VGPIO_LOWEST, 1280, val);
> +	case hwmon_in_max_alarm:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> +						  LTC4282_VSOURCE_ALARM_H_MASK, val);
> +
> +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, LTC4282_GPIO_ALARM_H_MASK,
> +					  val);
> +	case hwmon_in_min_alarm:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG,
> +						  LTC4282_VSOURCE_ALARM_L_MASK, val);
> +
> +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, LTC4282_GPIO_ALARM_L_MASK,
> +					  val);
> +	case hwmon_in_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB,
> +					  LTC4282_FET_BAD_STATUS_MASK, val);
> +	case hwmon_in_crit_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB, LTC4282_OV_STATUS_MASK, val);
> +	case hwmon_in_lcrit_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB, LTC4282_UV_STATUS_MASK, val);
> +	case hwmon_in_max:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_voltage_byte(st, LTC4282_VSOURCE_MAX,
> +							 st->vfs_out, val);
> +
> +		return ltc4282_read_voltage_byte(st, LTC4282_VGPIO_MAX, 1280, val);
> +	case hwmon_in_min:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_read_voltage_byte(st, LTC4282_VSOURCE_MIN,
> +							 st->vfs_out, val);
> +
> +		return ltc4282_read_voltage_byte(st, LTC4282_VGPIO_MIN, 1280, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_read_current_word(const struct ltc4282_state *st, u32 reg, long *val)
> +{
> +	long in;
> +	int ret;
> +
> +	/*
> +	 * We pass in full scale in 10 * micro (note that 40 is already millivolt) so we
> +	 * have better approximations to calculate current.
> +	 */
> +	ret = ltc4282_read_voltage_word(st, reg, DECA * 40 * MILLI, &in);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(in * MILLI, st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4282_read_current_byte(const struct ltc4282_state *st, u32 reg, long *val)
> +{
> +	long in;
> +	int ret;
> +
> +	ret = ltc4282_read_voltage_byte(st, reg, DECA * 40 * MILLI, &in);
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(in * MILLI, st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4282_read_curr(struct device *dev, const u32 attr, long *val)
> +{
> +	struct ltc4282_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		return ltc4282_read_current_word(st, LTC4282_VSENSE, val);
> +	case hwmon_curr_highest:
> +		return ltc4282_read_current_word(st, LTC4282_VSENSE_HIGHEST, val);
> +	case hwmon_curr_lowest:
> +		return ltc4282_read_current_word(st, LTC4282_VSENSE_LOWEST, val);
> +	case hwmon_curr_max:
> +		return ltc4282_read_current_byte(st, LTC4282_VSENSE_MAX, val);
> +	case hwmon_curr_min:
> +		return ltc4282_read_current_byte(st, LTC4282_VSENSE_MIN, val);
> +	case hwmon_curr_max_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, LTC4282_VSENSE_ALARM_H_MASK,
> +					  val);
> +	case hwmon_curr_min_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, LTC4282_VSENSE_ALARM_L_MASK,
> +					  val);
> +	case hwmon_curr_crit_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_STATUS_LSB, LTC4282_OC_STATUS_MASK, val);
> +	default:
> +		return -ENOTSUPP;

checkpatch:

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

Please run checkpatch --strict on your patches.

> +	}
> +}
> +
> +static int ltc4282_read_power_word(const struct ltc4282_state *st, u32 reg, long *val)
> +{
> +	u64 temp =  DECA * 40ULL * st->vfs_out * 1 << 16, temp_2;
> +	__be16 raw;
> +	u16 power;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, reg, &raw, sizeof(raw));
> +	if (ret)
> +		return ret;
> +
> +	power = be16_to_cpu(raw);
> +	/*
> +	 * Power is given by:
> +	 *	P = CODE(16b) * 0.040 * Vfs(out) * 2^16 / ((2^16 - 1)^2 * Rsense)
> +	 */
> +	if (check_mul_overflow(power * temp, MICRO, &temp_2)) {
> +		temp = DIV_ROUND_CLOSEST_ULL(power * temp, U16_MAX);
> +		*val = DIV64_U64_ROUND_CLOSEST(temp * MICRO, U16_MAX * (u64)st->rsense);
> +		return 0;
> +	}
> +
> +	*val = DIV64_U64_ROUND_CLOSEST(temp_2, st->rsense * int_pow(U16_MAX, 2));
> +
> +	return 0;
> +}
> +
> +static int ltc4282_read_power_byte(const struct ltc4282_state *st, u32 reg, long *val)
> +{
> +	u32 power;
> +	u64 temp;
> +	int ret;
> +
> +	ret = regmap_read(st->map, reg, &power);
> +	if (ret)
> +		return ret;
> +
> +	temp = power * 40 * DECA * st->vfs_out * 256ULL;
> +	*val = DIV64_U64_ROUND_CLOSEST(temp * MICRO, int_pow(U8_MAX, 2) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4282_read_energy(const struct ltc4282_state *st, u64 *val)
> +{
> +	u64 temp, energy;
> +	u32 status;
> +	__be64 raw;
> +	int ret;
> +
> +	ret = regmap_bulk_read(st->map, LTC4282_ENERGY, &raw, 6);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(st->map, LTC4282_STATUS_MSB, &status);
> +	if (ret)
> +		return ret;
> +
> +	if (status & LTC4282_METER_TICK_OVERFLOW_MASK) {
> +		dev_warn(st->dev, "Got overflow in meter/ticker counters\n");

This is a big no-go. A normal operation must not generate any messages,
much less warnings.

> +		/*
> +		 * This resets the meter and the tick counter and holds them
> +		 * reset.
> +		 */
> +		ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL,
> +				      LTC4282_METER_RESET_MASK);
> +		if (ret)
> +			return ret;
> +
> +		/* start accumulating again */
> +		ret = regmap_clear_bits(st->map, LTC4282_ADC_CTRL,
> +					LTC4282_METER_RESET_MASK);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Let the callers know a reset happened. Important when calling
> +		 * from power1_average.
> +		 */

Only I won't accept in-kernel calculated power average value attributes.
If the chip does not report averages, they must be calculated in
userspace.

> +		ret = 1;
> +	}
> +
> +	energy =  be64_to_cpu(raw) >> 16;
> +	/*
> +	 * The formula for energy is given by:
> +	 *	E = CODE(48b) * 0.040 * Vfs(out) * Tconv * 256 / ((2^16 - 1)^2 * Rsense)
> +	 *
> +	 * Since we only support 12bit ADC, Tconv = 0.065535s. Passing Vfs(out) and 0.040 to
> +	 * mV and Tconv to us, we can simplify the formula to:
> +	 *	E = CODE(48b) * 40 * Vfs(out) * 256 / (U16_MAX * Rsense)
> +	 *
> +	 * As Rsense is in tens of micro-ohm, we need to multiply by DECA to get
> +	 * microujoule.
> +	 */
> +	if (check_mul_overflow(DECA * st->vfs_out * 40 * 256, energy, &temp)) {
> +		temp = DIV_ROUND_CLOSEST(DECA * st->vfs_out * 40 * 256, U16_MAX);
> +		*val = DIV_ROUND_CLOSEST_ULL(temp * energy, st->rsense);
> +		return ret;

return 0

> +	}
> +
> +	*val = DIV64_U64_ROUND_CLOSEST(temp, U16_MAX * (u64)st->rsense);
> +
> +	return ret;

return 0

> +}
> +
> +static int ltc4282_read_power_average(struct ltc4282_state *st, long *val)
> +{
> +	u64 energy, temp;
> +	__be32 raw;
> +	u32 count;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret = ltc4282_read_energy(st, &energy);
> +	if (ret < 0)
> +		return ret;
> +	if (ret == 1) {
> +		/*
> +		 * reset happened... let's read the new energy value that
> +		 * together with the new tick counter should give a sane average
> +		 * value. Furthermore, we save whatever value we had accumulated
> +		 * so that the next energy read will have it into account.
> +		 */
> +		st->saved_energy = energy;
> +		/* give some time for accumulation... */
> +		msleep(2 * LTC4282_TCONV_US / MILLI);
> +		ret = ltc4282_read_energy(st, &energy);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	ret = regmap_bulk_read(st->map, LTC4282_TIME_COUNTER, &raw, sizeof(raw));
> +	if (ret)
> +		return ret;
> +
> +	count = be32_to_cpu(raw);
> +	if (!count) {
> +		*val = 0;
> +		return 0;
> +	}
> +
> +	/*
> +	 * AVG = E / (Tconv * counter)
> +	 * We get energy in microJoule, hence dividing it by microSeconds gives Watts. Therefore,
> +	 * multiplying by MICRO gives us microWatts.
> +	 */
> +	if (check_mul_overflow(energy, MICRO, &temp)) {
> +		temp = DIV_ROUND_CLOSEST_ULL(energy, LTC4282_TCONV_US);
> +		*val = DIV_ROUND_CLOSEST_ULL(temp * MICRO, count);
> +		return 0;
> +	}
> +
> +	*val = DIV64_U64_ROUND_CLOSEST(temp, LTC4282_TCONV_US * (u64)count);
> +	return 0;
> +}

No. If the chip doesn't report power averages, calculate it in userspace.

> +
> +static int ltc4282_read_power(struct device *dev, const u32 attr, long *val)
> +{
> +	struct ltc4282_state *st = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return ltc4282_read_power_word(st, LTC4282_POWER, val);
> +	case hwmon_power_input_highest:
> +		return ltc4282_read_power_word(st, LTC4282_POWER_HIGHEST, val);
> +	case hwmon_power_input_lowest:
> +		return ltc4282_read_power_word(st, LTC4282_POWER_LOWEST, val);
> +	case hwmon_power_max_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, LTC4282_POWER_ALARM_H_MASK,
> +					  val);
> +	case hwmon_power_min_alarm:
> +		return ltc4282_read_alarm(st, LTC4282_ADC_ALERT_LOG, LTC4282_POWER_ALARM_L_MASK,
> +					  val);
> +	case hwmon_power_average:
> +		return ltc4282_read_power_average(st, val);
> +	case hwmon_power_max:
> +		return ltc4282_read_power_byte(st, LTC4282_POWER_MAX, val);
> +	case hwmon_power_min:
> +		return ltc4282_read_power_byte(st, LTC4282_POWER_MIN, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_energy_enable(struct device *dev, long *val)
> +{
> +	const struct ltc4282_state *st = dev_get_drvdata(dev);
> +	u32 reg_val;
> +	int ret;
> +
> +	ret = regmap_read(st->map, LTC4282_ADC_CTRL, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	*val = !FIELD_GET(LTC4282_METER_HALT_MASK, reg_val);
> +
> +	return 0;
> +}
> +
> +static int ltc4282_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc4282_read_in(dev, attr, val, channel);
> +	case hwmon_curr:
> +		return ltc4282_read_curr(dev, attr, val);
> +	case hwmon_power:
> +		return ltc4282_read_power(dev, attr, val);
> +	case hwmon_energy:
> +		return ltc4282_energy_enable(dev, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_write_power_byte(const struct ltc4282_state *st, u32 reg, long val)
> +{
> +	u32 power;
> +	u64 temp;
> +
> +	if (val > st->power_max)
> +		val = st->power_max;
> +
> +	temp = val * int_pow(U8_MAX, 2) * st->rsense;
> +	power = DIV64_U64_ROUND_CLOSEST(temp, MICRO * DECA * 256ULL * st->vfs_out * 40);
> +
> +	return regmap_write(st->map, reg, power);
> +}
> +
> +static int ltc4282_write_power(const struct ltc4282_state *st, u32 attr,
> +			       long val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return ltc4282_write_power_byte(st, LTC4282_POWER_MAX, val);
> +	case hwmon_power_min:
> +		return ltc4282_write_power_byte(st, LTC4282_POWER_MIN, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_write_voltage_byte(const struct ltc4282_state *st, u32 reg, u32 fs, long val)
> +{
> +	u32 in;
> +
> +	if (val >= fs)
> +		in = U8_MAX;
> +	else
> +		in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);
> +
> +	return regmap_write(st->map, reg, in);
> +}
> +
> +static int ltc4282_write_in(const struct ltc4282_state *st, u32 attr, long val,
> +			    int channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_max:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_write_voltage_byte(st, LTC4282_VSOURCE_MAX,
> +							  st->vfs_out, val);
> +
> +		return ltc4282_write_voltage_byte(st, LTC4282_VGPIO_MAX, 1280, val);
> +	case hwmon_in_min:
> +		if (channel == LTC4282_CHAN_VSOURCE)
> +			return ltc4282_write_voltage_byte(st, LTC4282_VSOURCE_MIN,
> +							  st->vfs_out, val);
> +
> +		return ltc4282_write_voltage_byte(st, LTC4282_VGPIO_MIN, 1280, val);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_write_curr(const struct ltc4282_state *st, u32 attr,
> +			      long val)
> +{
> +	/* need to pass it in millivolt */
> +	u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
> +
> +	switch (attr) {
> +	case hwmon_curr_max:
> +		return ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MAX, 40, in);
> +	case hwmon_curr_min:
> +		return ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MIN, 40, in);
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_write(struct device *dev,
> +			 enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	const struct ltc4282_state *st = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_power:
> +		return ltc4282_write_power(st, attr, val);
> +	case hwmon_in:
> +		return ltc4282_write_in(st, attr, val, channel);
> +	case hwmon_curr:
> +		return ltc4282_write_curr(st, attr, val);
> +	case hwmon_energy:
> +		/* setting the bit halts the meter */
> +		return regmap_update_bits(st->map, LTC4282_ADC_CTRL,
> +					  LTC4282_METER_HALT_MASK,
> +					  FIELD_PREP(LTC4282_METER_HALT_MASK, !!!val));


> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_in_is_visible(const struct ltc4282_state *st, u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +	case hwmon_in_highest:
> +	case hwmon_in_lowest:
> +	case hwmon_in_max_alarm:
> +	case hwmon_in_min_alarm:
> +	case hwmon_in_label:
> +	case hwmon_in_lcrit_alarm:
> +	case hwmon_in_crit_alarm:
> +		return 0444;
> +	case hwmon_in_max:
> +	case hwmon_in_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int ltc4282_curr_is_visible(u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_curr_input:
> +	case hwmon_curr_highest:
> +	case hwmon_curr_lowest:
> +	case hwmon_curr_max_alarm:
> +	case hwmon_curr_min_alarm:
> +	case hwmon_curr_crit_alarm:
> +	case hwmon_curr_label:
> +		return 0444;
> +	case hwmon_curr_max:
> +	case hwmon_curr_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int ltc4282_power_is_visible(u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_power_input:
> +	case hwmon_power_input_highest:
> +	case hwmon_power_input_lowest:
> +	case hwmon_power_label:
> +	case hwmon_power_max_alarm:
> +	case hwmon_power_min_alarm:
> +	case hwmon_power_average:
> +		return 0444;
> +	case hwmon_power_max:
> +	case hwmon_power_min:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4282_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc4282_in_is_visible(data, attr);
> +	case hwmon_curr:
> +		return ltc4282_curr_is_visible(attr);
> +	case hwmon_power:
> +		return ltc4282_power_is_visible(attr);
> +	case hwmon_energy:
> +		/* hwmon_energy_enable */
> +		return 0644;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static const char * const ltc4282_in_strs[] = {
> +	"VSOURCE", "VDD", "VGPIO"
> +};
> +
> +static int ltc4282_read_labels(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		*str = ltc4282_in_strs[channel];
> +		return 0;
> +	case hwmon_curr:
> +		*str = "ISENSE";
> +		return 0;
> +	case hwmon_power:
> +		*str = "Power";
> +		return 0;
> +	default:
> +		return -ENOTSUPP;
> +	}
> +}
> +
> +static ssize_t ltc4282_show_energy(struct device *dev,
> +				   struct device_attribute *da, char *buf)
> +{
> +	struct ltc4282_state *st = dev_get_drvdata(dev);
> +	u64 energy;
> +	long en;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret = ltc4282_energy_enable(dev, &en);
> +	if (ret)
> +		return ret;
> +	if (!en)
> +		return -ENODATA;
> +

This should be stored in a flag. Reading it from the chip for each
energy reading is too expensive.

> +	ret = ltc4282_read_energy(st, &energy);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* see @ltc4282_read_power_average */
> +	if (st->saved_energy) {
> +		energy += st->saved_energy;
> +		st->saved_energy = 0;
> +	}
> +
> +	return sysfs_emit(buf, "%llu\n", energy);
> +}
> +
> +static ssize_t ltc4282_show_fault(struct device *dev,
> +				  struct device_attribute *da,
> +				  u32 reg, char *buf)
> +{
> +	struct ltc4282_state *st = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	long alarm;
> +	int ret;
> +
> +	ret = ltc4282_read_alarm(st, reg, attr->index, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", alarm);
> +}
> +
> +static ssize_t ltc4282_show_status(struct device *dev,
> +				   struct device_attribute *da, char *buf)
> +{
> +	return ltc4282_show_fault(dev, da, LTC4282_STATUS_LSB, buf);
> +}
> +
> +static ssize_t ltc4282_show_fault_log(struct device *dev,
> +				      struct device_attribute *da, char *buf)
> +{
> +	return ltc4282_show_fault(dev, da, LTC4282_FAULT_LOG, buf);
> +}
> +
> +static ssize_t ltc4282_clear_fault_log(struct device *dev,
> +				       struct device_attribute *da,
> +				       const char *buf, size_t len)
> +{
> +	struct ltc4282_state *st = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	int ret;
> +
> +	ret = regmap_clear_bits(st->map, LTC4282_FAULT_LOG, attr->index);
> +	if (ret)
> +		return ret;
> +
> +	return len;
> +}
> +
> +static int ltc4282_power_on(const struct ltc4282_state *st)
> +{
> +	u32 n_tries = 5, reg;
> +	int ret;
> +
> +	ret = devm_regulator_get_enable(st->dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(st->dev, ret, "Failed vdd get/enable\n");
> +
> +	/*
> +	 * Make sure vdd is stable. From the datasheet:
> +	 * The state of the UV and OV comparators is indicated by the STATUS register
> +	 * bits 0 and 1 and must be stable for at least 50ms to qualify for turn-on.
> +	 */
> +	do {
> +		ret = regmap_read_poll_timeout(st->map, LTC4282_STATUS_LSB, reg,
> +					       reg & LTC4282_VDD_STATUS_MASK, 10000, 50000);
> +		if (!ret)
> +			continue;
> +		if (ret != -ETIMEDOUT)
> +			return dev_err_probe(st->dev, ret, "Failed regmap read\n");
> +
> +		/* Alright. We got timeout which means UV and OV are stable for 50ms */
> +		break;
> +	} while (n_tries--);
> +
> +	if (!n_tries)
> +		return dev_err_probe(st->dev, -ETIMEDOUT, "VDD not stable\n");
> +
> +	return 0;
> +}


This is a hot swap controller. Turning it on in its hardware monitoring
driver is highly inappropriate. I don't know where and how it is supposed
to be turned on, but that can not be done here. Also, turning it off when
unloading the driver (presumably that will happen since it is turned on
with a device managed function) is even more inappropriate.

It is even more inappropriate to delay the probe function by at least 50 ms
just to check if two status register bits changed state.

> +
> +enum {
> +	LTC4282_CLKOUT_INT,
> +	LTC4282_CLKOUT_TICK,
> +};
> +
> +static int ltc428_clks_setup(const struct ltc4282_state *st)
> +{
> +	unsigned long rate;
> +	struct clk *clkin;
> +	u32 val;
> +	int ret;
> +
> +	ret = device_property_read_u32(st->dev, "adi,clkout-mode", &val);
> +	if (ret)
> +		return 0;
> +
> +	if (val > LTC4282_CLKOUT_TICK)
> +		return dev_err_probe(st->dev, -EINVAL,
> +				     "Invalid val(%u) for adi,clkout-mode\n", val);
> +
> +	ret = regmap_update_bits(st->map, LTC4282_CLK_DIV, LTC4282_CLKOUT_MASK,
> +				 FIELD_PREP(LTC4282_CLKOUT_MASK, val + 1));
> +	if (ret)
> +		return ret;
> +

If the chip generates a clock output, the driver needs to register a clock device.

> +	clkin = devm_clk_get_optional_enabled(st->dev, NULL);
> +	if (IS_ERR(clkin))
> +		return dev_err_probe(st->dev, PTR_ERR(clkin), "Failed to get clkin");
> +	if (!clkin)
> +		return 0;
> +
> +	rate = clk_get_rate(clkin);
> +	if (rate < LTC4282_CLKIN_MIN || rate > LTC4282_CLKIN_MAX)
> +		return dev_err_probe(st->dev, -EINVAL, "Invalid clkin range(%lu) [%lu %lu]\n",
> +				     rate, LTC4282_CLKIN_MIN, LTC4282_CLKIN_MAX);
> +
> +	/*
> +	 * Clocks faster than 250KHZ should be reduced to 250KHZ. The clock frequency
> +	 * is divided by twice the value in the register.
> +	 */
> +	val = rate / (2 * LTC4282_CLKIN_MIN);
> +
> +	return regmap_update_bits(st->map, LTC4282_CLK_DIV, LTC4282_CLK_DIV_MASK,
> +				  FIELD_PREP(LTC4282_CLK_DIV_MASK, val));
> +}
> +
> +static const int ltc4282_curr_lim_uv[] = {
> +	12500, 15625, 18750, 21875, 25000, 28125, 31250, 34375
> +};
> +
> +static int ltc4282_get_defaults(struct ltc4282_state *st, u32 *curr_lim_uv)
> +{
> +	u32 reg_val, ilm_adjust;
> +	int ret;
> +
> +	ret = regmap_read(st->map, LTC4282_CTRL_MSB, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	st->vin_mode = FIELD_GET(LTC4282_CTRL_VIN_MODE_MASK, reg_val);
> +
> +	ret = regmap_read(st->map, LTC4282_ILIM_ADJUST, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	ilm_adjust = FIELD_GET(LTC4282_ILIM_ADJUST_MASK, reg_val);
> +	*curr_lim_uv = ltc4282_curr_lim_uv[ilm_adjust];
> +
> +	return 0;
> +}
> +
> +/*
> + * Set max limits for ISENSE and Power as that depends on the max voltage on rsense
> + * that is defined in ILIM_ADJUST. This is specially important for power because for
> + * some rsense and vfsout values, if we allow the default raw 255 value, that would
> + * overflow long in 32bit archs when reading back the max power limit.
> + */

Wouldn't it make more sense to limit rsense to reasonable values instead ?

> +static int ltc4282_set_max_limits(struct ltc4282_state *st, u32 val_uv)
> +{
> +	int ret;
> +
> +	ret = ltc4282_write_voltage_byte(st, LTC4282_VSENSE_MAX, 40 * MILLI, val_uv);
> +	if (ret)
> +		return ret;
> +
> +	/* Power is given by ISENSE * Vout. */
> +	st->power_max = DIV_ROUND_CLOSEST(val_uv * DECA * MILLI, st->rsense) * st->vfs_out;
> +	return ltc4282_write_power_byte(st, LTC4282_POWER_MAX, st->power_max);
> +}
> +
> +/* valid GPIO functions */
> +enum {
> +	LTC4282_PIN_GPIO,
> +	/* Power functions only for GPIO_1*/
> +	LTC4282_PIN_POWER_BAD,
> +	LTC4282_PIN_POWER_GOOD,
> +	/* ADC monitor only for GPIO_2 and 3 */
> +	LTC4282_PIN_ADC = 2,
> +	/* Only for GPIO_2 */
> +	LTC4282_PIN_FET_STRESS,
> +};
> +
> +static int ltc4282_non_gpio_setup(struct ltc4282_state *st, u32 pin, u32 func, bool *adc_in)
> +{
> +	if (pin == LTC4282_GPIO_1) {
> +		u32 val = LTC4282_PIN_POWER_BAD;
> +
> +		if (func == LTC4282_PIN_POWER_GOOD)
> +			val = 0;
> +
> +		return regmap_update_bits(st->map, LTC4282_GPIO_CONFIG, LTC4282_GPIO_1_CONFIG_MASK,
> +					  FIELD_PREP(LTC4282_GPIO_1_CONFIG_MASK, val));
> +	}
> +
> +	if (func == LTC4282_PIN_FET_STRESS)
> +		return regmap_update_bits(st->map, LTC4282_GPIO_CONFIG,
> +					  LTC4282_GPIO_2_FET_STRESS_MASK,
> +					  FIELD_PREP(LTC4282_GPIO_2_FET_STRESS_MASK, 1));
> +
> +	/*
> +	 * Then, let's point the given GPIO to the ADC input. We need to ensure that
> +	 * function is only given once.
> +	 */
> +	if (*adc_in)
> +		return dev_err_probe(st->dev, -EINVAL,
> +				     "Only one gpio can be given to the ADC input\n");
> +
> +	*adc_in = true;
> +
> +	/* setting the bit to 1 cause the ADC to monitor GPIO2 */
> +	return regmap_update_bits(st->map, LTC4282_ILIM_ADJUST, LTC4282_GPIO_MODE_MASK,
> +				  FIELD_PREP(LTC4282_GPIO_MODE_MASK, pin == LTC4282_GPIO_2));
> +}
> +
> +static const char * const ltc4282_gpio_prop[] = {
> +	"adi,gpio1-mode", "adi,gpio2-mode", "adi,gpio3-mode"
> +};
> +
> +static int ltc4282_gpio_setup(struct ltc4282_state *st)
> +{
> +	struct device *dev = st->dev;
> +	u32 gpio, func, ngpios = 0;
> +	bool adc_in = false;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_GPIOLIB))
> +		return 0;
> +
> +	for (gpio = 0; gpio <= LTC4282_GPIO_3; gpio++) {
> +		ret = device_property_read_u32(dev, ltc4282_gpio_prop[gpio], &func);
> +		if (ret)
> +			continue;
> +		if (func >= ltc4282_gpios[gpio].n_funcs)
> +			return dev_err_probe(dev, ret, "Invalid func(%u >= %u) for gpio%u\n",
> +					     func, ltc4282_gpios[gpio].n_funcs, gpio + 1);
> +		if (func == LTC4282_PIN_GPIO) {
> +			st->gpio_map[ngpios++] = gpio;
> +			if (gpio == LTC4282_GPIO_1) {
> +				/* default to input GPIO */
> +				ret = regmap_set_bits(st->map, LTC4282_GPIO_CONFIG,
> +						      LTC4282_GPIO_1_CONFIG_MASK);
> +				if (ret)
> +					return ret;
> +			}
> +
> +			continue;
> +		}
> +
> +		ret = ltc4282_non_gpio_setup(st, gpio, func, &adc_in);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,gpio-alert"))
> +		st->gpio_map[ngpios++] = LTC4282_ALERT;
> +
> +	if (!ngpios)
> +		return 0;
> +
> +	st->gc.parent = dev;
> +	st->gc.base = -1;
> +	st->gc.ngpio = ngpios;
> +	st->gc.can_sleep = true;
> +	st->gc.label = "ltc4282";
> +	st->gc.direction_input = ltc4282_gpio_input_set;
> +	st->gc.direction_output = ltc4282_gpio_output_set;
> +	st->gc.set = ltc4282_gpio_set;
> +	st->gc.get = ltc4282_gpio_get;
> +
> +	return devm_gpiochip_add_data(dev, &st->gc, st);
> +}
> +
> +/* This maps the Vout full scale for the given Vin mode */
> +static const u16 ltc4282_vfs_milli[] = { 5540, 8320, 16640, 33280 };
> +
> +enum {
> +	LTC4282_DIV_EXTERNAL,
> +	LTC4282_DIV_5_PERCENT,
> +	LTC4282_DIV_10_PERCENT,
> +	LTC4282_DIV_15_PERCENT,
> +};
> +
> +static int ltc4282_setup(struct ltc4282_state *st)
> +{
> +	struct device *dev = st->dev;
> +	u32 val, curr_lim_uv;
> +	int ret;
> +
> +	/* The part has an eeprom so let's get the needed defaults from it */
> +	ret = ltc4282_get_defaults(st, &curr_lim_uv);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u32(dev, "adi,rsense-nano-ohms", &st->rsense);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read adi,rsense-nano-ohms\n");
> +
> +	/*
> +	 * The resolution for rsense is tens of micro which means we need nano in the bindings.

Assuming this is supposed to mean "tenths of micro", not "tens of micro", do such sense
resistors really exist in practice ? The smallest I was able to find has 25 micro-ohm.

> +	 * However, to make things easier to handle (with respect to overflows) we divide it by
> +	 * 100 as we don't really need the last two digits.
> +	 */
> +	st->rsense /= CENTI;
> +

This blindly accepts rsense values of < 100 which results in st->rsense == 0 and
division by zero crashes.

> +	ret = device_property_read_u32(dev, "vin-mode-microvolt", &val);

No adi, prefix ?

Anyway, this is really the input voltage range, or rather the maximum accepted input voltage.


> +	if (!ret) {
> +		switch (val) {
> +		case 3300000:
> +			st->vin_mode = LTC4282_VIN_3_3V;
> +			break;
> +		case 5000000:
> +			st->vin_mode = LTC4282_VIN_5V;
> +			break;
> +		case 12000000:
> +			st->vin_mode = LTC4282_VIN_12V;
> +			break;
> +		case 24000000:
> +			st->vin_mode = LTC4282_VIN_24V;
> +			break;
> +		default:
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid val(%u) for vin-mode-microvolt\n", val);
> +		}
> +
> +		ret = regmap_update_bits(st->map, LTC4282_CTRL_MSB,  LTC4282_CTRL_VIN_MODE_MASK,
> +					 FIELD_PREP(LTC4282_CTRL_VIN_MODE_MASK, st->vin_mode));
> +		if (ret)
> +			return ret;
> +
> +		/* Foldback mode should also be set to the input voltage */
> +		ret = regmap_update_bits(st->map, LTC4282_ILIM_ADJUST, LTC4282_FOLDBACK_MODE_MASK,
> +					 FIELD_PREP(LTC4282_FOLDBACK_MODE_MASK, st->vin_mode));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	st->vfs_out = ltc4282_vfs_milli[st->vin_mode];
> +
> +	ret = device_property_read_u32(dev, "adi,current-limit-microvolt",
> +				       &curr_lim_uv);

Current is measured in Ampere. Yes, that translates to volt through the sense resistor,
but it is still Ampere. No idea how that is normally handled in devicetree.

> +	if (!ret) {
> +		int reg_val;
> +
> +		switch (val) {
> +		case 12500:
> +			reg_val = 0;
> +			break;
> +		case 15625:
> +			reg_val = 1;
> +			break;
> +		case 18750:
> +			reg_val = 2;
> +			break;
> +		case 21875:
> +			reg_val = 3;
> +			break;
> +		case 25000:
> +			reg_val = 4;
> +			break;
> +		case 28125:
> +			reg_val = 5;
> +			break;
> +		case 31250:
> +			reg_val = 6;
> +			break;
> +		case 34375:
> +			reg_val = 7;
> +			break;
> +		default:
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid val(%u) for adi,current-limit-microvolt\n",
> +					     val);
> +		}
> +
> +		ret = regmap_update_bits(st->map, LTC4282_ILIM_ADJUST, LTC4282_ILIM_ADJUST_MASK,
> +					 FIELD_PREP(LTC4282_ILIM_ADJUST_MASK, reg_val));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = ltc4282_set_max_limits(st, curr_lim_uv);
> +	if (ret)
> +		return ret;
> +
> +	ret = device_property_read_u32(st->dev, "adi,overvoltage-dividers", &val);
> +	if (!ret) {
> +		if (val > LTC4282_DIV_15_PERCENT)
> +			return dev_err_probe(st->dev, -EINVAL,
> +					     "Invalid val(%u) for adi,overvoltage-divider\n", val);
> +
> +		ret = regmap_update_bits(st->map, LTC4282_CTRL_MSB, LTC4282_CTRL_OV_MODE_MASK,
> +					 FIELD_PREP(LTC4282_CTRL_OV_MODE_MASK, val));
> +	}
> +
> +	ret = device_property_read_u32(st->dev, "adi,undervoltage-dividers", &val);
> +	if (!ret) {
> +		if (val > LTC4282_DIV_15_PERCENT)
> +			return dev_err_probe(st->dev, -EINVAL,
> +					     "Invalid val(%u) for adi,undervoltage-divider\n", val);
> +
> +		ret = regmap_update_bits(st->map, LTC4282_CTRL_MSB, LTC4282_CTRL_UV_MODE_MASK,
> +					 FIELD_PREP(LTC4282_CTRL_UV_MODE_MASK, val));
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,overcurrent-retry")) {
> +		ret = regmap_set_bits(st->map, LTC4282_CTRL_LSB, LTC4282_CTRL_OC_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,overvoltage-retry-disable")) {
> +		ret = regmap_clear_bits(st->map, LTC4282_CTRL_LSB, LTC4282_CTRL_OV_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,undervoltage-retry-disable")) {
> +		ret = regmap_clear_bits(st->map, LTC4282_CTRL_LSB, LTC4282_CTRL_UV_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
> +		ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL, LTC4282_FAULT_LOG_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u32(dev, "adi,fet-bad-timeout-ms", &val);
> +	if (!ret) {
> +		if (val > LTC4282_FET_BAD_MAX_TIMEOUT)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid value(%u) for adi,fet-bad-timeout-ms", val);
> +
> +		ret = regmap_write(st->map, LTC4282_FET_BAD_FAULT_TIMEOUT, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ltc4282_gpio_setup(st);
> +}
> +
> +static bool ltc4282_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	if (reg == LTC4282_RESERVED_1 || reg == LTC4282_RESERVED_2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool ltc4282_writable_reg(struct device *dev, unsigned int reg)
> +{
> +	if (reg == LTC4282_STATUS_LSB || reg == LTC4282_STATUS_MSB)
> +		return false;
> +	if (reg == LTC4282_RESERVED_1 || reg == LTC4282_RESERVED_2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static const struct regmap_config ltc4282_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = LTC4282_RESERVED_3,
> +	.readable_reg = ltc4282_readable_reg,
> +	.writeable_reg = ltc4282_writable_reg,
> +};
> +
> +static const struct hwmon_channel_info * const ltc4282_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_MAX_ALARM | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			   HWMON_I_MAX_ALARM | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> +			   HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> +			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> +			   HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(power,
> +			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> +			   HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
> +			   HWMON_P_AVERAGE | HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> +			   HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(energy,
> +			   HWMON_E_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ltc4282_hwmon_ops = {
> +	.read = ltc4282_read,
> +	.write = ltc4282_write,
> +	.is_visible = ltc4282_is_visible,
> +	.read_string = ltc4282_read_labels,
> +};
> +
> +static const struct hwmon_chip_info ltc2947_chip_info = {
> +	.ops = &ltc4282_hwmon_ops,
> +	.info = ltc4282_info,
> +};
> +
> +/* energy attributes are 6bytes wide so we need u64 */
> +static SENSOR_DEVICE_ATTR(energy1_input, 0444, ltc4282_show_energy, NULL, 0);
> +/* power1_fault */
> +static SENSOR_DEVICE_ATTR(power1_good, 0444, ltc4282_show_status, NULL,
> +			  LTC4282_POWER_GOOD_MASK);
> +/* FET faults */
> +static SENSOR_DEVICE_ATTR(fet_short_fault, 0444, ltc4282_show_status, NULL,
> +			  LTC4282_FET_SHORT_MASK);
> +static SENSOR_DEVICE_ATTR(fet_bad_fault, 0444, ltc4282_show_status, NULL,
> +			  LTC4282_FET_BAD_STATUS_MASK);
> +/*
> + * Fault log failures. These faults might be important in systems where auto-retry is not enabled
> + * since they will cause the part to latch off until they are cleared. Typically that happens
> + * when the system admin is close enough so he can check what happened and manually clear the
> + * faults. Moreover, manually clearing the faults might only matter when ON_FAULT_MASK in the
> + * CONTROL register is set (which is the default) as in that case, a turn off signal from the
> + * ON pin won't clear them.
> + */

I'd argue that such an operator would only be interested in clearing all faults
at the same time. Your call, but all this does is making life hard for operators.

> +static SENSOR_DEVICE_ATTR(in1_crit_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_OV_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(in1_lcrit_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_UV_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(curr1_crit_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_OC_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(power1_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_POWER_BAD_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(fet_bad_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_FET_BAD_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(fet_short_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_FET_SHORT_FAULT_MASK);
> +
> +static struct attribute *ltc4282_attrs[] = {
> +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> +	&sensor_dev_attr_power1_good.dev_attr.attr,
> +	&sensor_dev_attr_fet_bad_fault.dev_attr.attr,
> +	&sensor_dev_attr_fet_short_fault.dev_attr.attr,
> +	&sensor_dev_attr_in1_crit_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_in1_lcrit_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_curr1_crit_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_power1_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_fet_bad_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_fet_short_fault_log.dev_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(ltc4282);
> +

Move all those except for energy1_input to debugfs.

> +static int ltc4282_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev = &i2c->dev, *hwmon;
> +	struct ltc4282_state *st;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate memory\n");
> +
> +	st->dev = dev;
> +	st->map = devm_regmap_init_i2c(i2c, &ltc4282_regmap_config);
> +	if (IS_ERR(st->map))
> +		return dev_err_probe(dev, PTR_ERR(st->map), "failed regmap init\n");
> +
> +	ret = ltc4282_power_on(st);
> +	if (ret)
> +		return ret;
> +
> +	/* Soft reset */
> +	ret = regmap_set_bits(st->map, LTC4282_ADC_CTRL, LTC4282_RESET_MASK);
> +	if (ret)
> +		return ret;
> +
> +	msleep(3200);
> +
> +	ret = ltc428_clks_setup(st);
> +	if (ret)
> +		return ret;
> +
> +	ret = ltc4282_setup(st);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&st->lock);
> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4282", st, &ltc2947_chip_info,
> +						     ltc4282_groups);
> +	return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static const struct of_device_id ltc4282_of_match[] = {
> +	{ .compatible = "adi,ltc4282" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ltc4282_of_match);
> +
> +static struct i2c_driver ltc4282_driver = {
> +	.driver = {
> +		.name = "ltc4282",
> +		.of_match_table = ltc4282_of_match,
> +	},
> +	.probe = ltc4282_probe,
> +};
> +module_i2c_driver(ltc4282_driver);
> +
> +MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC4282 I2C High Current Hot Swap Controller");
> +MODULE_LICENSE("GPL");


