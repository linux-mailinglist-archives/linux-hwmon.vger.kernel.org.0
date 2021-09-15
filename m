Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C19640C799
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Sep 2021 16:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237825AbhIOOj3 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 15 Sep 2021 10:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbhIOOj2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Sep 2021 10:39:28 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC14C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Sep 2021 07:38:09 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso3848287otv.3
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Sep 2021 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=sqQCafMDjTaEL5XrI+oL51IHrdZdTl0MezT0OA1jxMY=;
        b=ILzwYdi0dGdjr1KyM5qcPC0xuLKiPGE5eJ28pk13vuTfani15wNS09oLNfZU8dRE+J
         VcY58LbhoLBgCNaHy0+XscfCWIOguo8SAbMMM82hJKrOTXKDHxv3OAN3YTaTqZgUb3k9
         umHKEwDpAl/0pdZ2t0w8s++oE+11D6Yb22aULhiWrk8zQ0rN4xtI1lgcGpivOtKr31NI
         cl8Yxwr1F3nclaV2heuDUF0McAaJKYHMP3khea5ZDgorsA775nTs56vQzg9MqUszlk46
         bRShDBVa4MIm1hO0zVSmnauuI6BhVA3hqFzMJ1W5WQXvpgso9u6lwwn3079gd+rSZlxZ
         2XnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=sqQCafMDjTaEL5XrI+oL51IHrdZdTl0MezT0OA1jxMY=;
        b=vOiC9PVhynMlHCMcDdZQLQXxjnVV6748h2hjUiUXk5njHzObSG7wVUXpnQWALFJy2K
         0zKCB0+J/l1s/IJE87TiPk2nQSjJCHX1O9ZPVVnwTpiYBVYvHODDGmBdBb4TQcqdCRNF
         OK4wfhSD6953AgUnIifbMXhibqACzEP+AHJq5dEhsT1aclWAwQMX8CBx2TJWz1ugoyFY
         lCy7l4LTaht7iPtpo0nOG8Lye1167Ba4fMZSbbJwHA7bJpPCzm9i82bqqDXefHLJwvnP
         oOLM7bVxkRnwGjmmZyP5xf3S8cHkH9JBmaNoR0ki52SRg/Tso9rVftWG5ST7cbTvt00B
         7xzQ==
X-Gm-Message-State: AOAM533DSB7ykqMqkOgtSJuUNAxjlxIrAENIaeB+C9m4bANV/1QvRxem
        0KYiDzPh0bixEhsFWEo8H8I=
X-Google-Smtp-Source: ABdhPJxg0SQ6iE66R7StnNeLihh2JdKiJWKrPxIlsJDsNm83vtMMYmQ7ywczgaWqy346tAKGZKHdPg==
X-Received: by 2002:a9d:4589:: with SMTP id x9mr245617ote.52.1631716688317;
        Wed, 15 Sep 2021 07:38:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r7sm31598oog.48.2021.09.15.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 07:38:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 15 Sep 2021 07:38:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
Cc:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v5] hwmon: Add Maxim MAX6620 hardware monitoring driver
Message-ID: <20210915143806.GA2514096@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 13, 2021 at 01:40:15PM +0000, Balac, Arun Saravanan wrote:
> From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> 
> Add hardware monitoring driver for Maxim MAX6620 Fan controller
> 
> Originally-from: L. Grunenberg <contact@lgrunenberg.de>
> Originally-from: Cumulus Networks <support@cumulusnetworks.com>
> Originally-from: Shuotian Cheng <shuche@microsoft.com>
> Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>

Applied.

Thanks,
Guenter

> ---
> 
> Changelog:
> - Release update_lock while handling errors in fan*_alarm.
> 
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/max6620.rst |  46 +++
>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/max6620.c         | 514 ++++++++++++++++++++++++++++++++
>  5 files changed, 572 insertions(+)
>  create mode 100644 Documentation/hwmon/max6620.rst
>  create mode 100644 drivers/hwmon/max6620.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index bc01601ea81a..2bd8761326c2 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -129,6 +129,7 @@ Hardware Monitoring Kernel Drivers
>     max31785
>     max31790
>     max34440
> +   max6620
>     max6639
>     max6642
>     max6650
> diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max6620.rst
> new file mode 100644
> index 000000000000..84c1c44d3de4
> --- /dev/null
> +++ b/Documentation/hwmon/max6620.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver max6620
> +=====================
> +
> +Supported chips:
> +
> +    Maxim MAX6620
> +
> +    Prefix: 'max6620'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
> +
> +Authors:
> +    - L\. Grunenberg <contact@lgrunenberg.de>
> +    - Cumulus Networks <support@cumulusnetworks.com>
> +    - Shuotian Cheng <shuche@microsoft.com>
> +    - Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Maxim MAX6620 fan controller.
> +
> +The driver configures the fan controller in RPM mode. To give the readings more
> +range or accuracy, the desired value can be set by a programmable register
> +(1, 2, 4, 8, 16 or 32). Set higher values for larger speeds.
> +
> +The driver provides the following sensor access in sysfs:
> +
> +================ ======= =====================================================
> +fan[1-4]_alarm   ro      Fan alarm.
> +fan[1-4]_div     rw      Sets the nominal RPM range of the fan. Valid values
> +                         are 1, 2, 4, 8, 16 and 32.
> +fan[1-4]_input   ro      Fan speed in RPM.
> +fan[1-4]_target  rw      Desired fan speed in RPM.
> +================ ======= =====================================================
> +
> +Usage notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e3675377bc5d..74811fbaa266 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31730.
>  
> +config SENSORS_MAX6620
> +	tristate "Maxim MAX6620 fan controller"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the MAX6620
> +	  fan controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max6620.
> +
>  config SENSORS_MAX6621
>  	tristate "Maxim MAX6621 sensor chip"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d712c61c1f5e..9e50ff903931 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
>  obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
>  obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
> +obj-$(CONFIG_SENSORS_MAX6620)	+= max6620.o
>  obj-$(CONFIG_SENSORS_MAX6621)	+= max6621.o
>  obj-$(CONFIG_SENSORS_MAX6639)	+= max6639.o
>  obj-$(CONFIG_SENSORS_MAX6642)	+= max6642.o
> diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
> new file mode 100644
> index 000000000000..704aff97916b
> --- /dev/null
> +++ b/drivers/hwmon/max6620.c
> @@ -0,0 +1,514 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Maxim MAX6620
> + *
> + * Originally from L. Grunenberg.
> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
> + *
> + * Copyright (c) 2021 Dell Inc. or its subsidiaries. All Rights Reserved.
> + *
> + * based on code written by :
> + * 2007 by Hans J. Koch <hjk@hansjkoch.de>
> + * John Morris <john.morris@spirentcom.com>
> + * Copyright (c) 2003 Spirent Communications
> + * and Claus Gindhart <claus.gindhart@kontron.com>
> + *
> + * This module has only been tested with the MAX6620 chip.
> + *
> + * The datasheet was last seen at:
> + *
> + *        http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
> + *
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/*
> + * MAX 6620 registers
> + */
> +
> +#define MAX6620_REG_CONFIG	0x00
> +#define MAX6620_REG_FAULT	0x01
> +#define MAX6620_REG_CONF_FAN0	0x02
> +#define MAX6620_REG_CONF_FAN1	0x03
> +#define MAX6620_REG_CONF_FAN2	0x04
> +#define MAX6620_REG_CONF_FAN3	0x05
> +#define MAX6620_REG_DYN_FAN0	0x06
> +#define MAX6620_REG_DYN_FAN1	0x07
> +#define MAX6620_REG_DYN_FAN2	0x08
> +#define MAX6620_REG_DYN_FAN3	0x09
> +#define MAX6620_REG_TACH0	0x10
> +#define MAX6620_REG_TACH1	0x12
> +#define MAX6620_REG_TACH2	0x14
> +#define MAX6620_REG_TACH3	0x16
> +#define MAX6620_REG_VOLT0	0x18
> +#define MAX6620_REG_VOLT1	0x1A
> +#define MAX6620_REG_VOLT2	0x1C
> +#define MAX6620_REG_VOLT3	0x1E
> +#define MAX6620_REG_TAR0	0x20
> +#define MAX6620_REG_TAR1	0x22
> +#define MAX6620_REG_TAR2	0x24
> +#define MAX6620_REG_TAR3	0x26
> +#define MAX6620_REG_DAC0	0x28
> +#define MAX6620_REG_DAC1	0x2A
> +#define MAX6620_REG_DAC2	0x2C
> +#define MAX6620_REG_DAC3	0x2E
> +
> +/*
> + * Config register bits
> + */
> +
> +#define MAX6620_CFG_RUN		BIT(7)
> +#define MAX6620_CFG_POR		BIT(6)
> +#define MAX6620_CFG_TIMEOUT	BIT(5)
> +#define MAX6620_CFG_FULLFAN	BIT(4)
> +#define MAX6620_CFG_OSC		BIT(3)
> +#define MAX6620_CFG_WD_MASK	(BIT(2) | BIT(1))
> +#define MAX6620_CFG_WD_2	BIT(1)
> +#define MAX6620_CFG_WD_6	BIT(2)
> +#define MAX6620_CFG_WD10	(BIT(2) | BIT(1))
> +#define MAX6620_CFG_WD		BIT(0)
> +
> +/*
> + * Failure status register bits
> + */
> +
> +#define MAX6620_FAIL_TACH0	BIT(4)
> +#define MAX6620_FAIL_TACH1	BIT(5)
> +#define MAX6620_FAIL_TACH2	BIT(6)
> +#define MAX6620_FAIL_TACH3	BIT(7)
> +#define MAX6620_FAIL_MASK0	BIT(0)
> +#define MAX6620_FAIL_MASK1	BIT(1)
> +#define MAX6620_FAIL_MASK2	BIT(2)
> +#define MAX6620_FAIL_MASK3	BIT(3)
> +
> +#define MAX6620_CLOCK_FREQ	8192 /* Clock frequency in Hz */
> +#define MAX6620_PULSE_PER_REV	2 /* Tachometer pulses per revolution */
> +
> +/* Minimum and maximum values of the FAN-RPM */
> +#define FAN_RPM_MIN	240
> +#define FAN_RPM_MAX	30000
> +
> +static const u8 config_reg[] = {
> +	MAX6620_REG_CONF_FAN0,
> +	MAX6620_REG_CONF_FAN1,
> +	MAX6620_REG_CONF_FAN2,
> +	MAX6620_REG_CONF_FAN3,
> +};
> +
> +static const u8 dyn_reg[] = {
> +	MAX6620_REG_DYN_FAN0,
> +	MAX6620_REG_DYN_FAN1,
> +	MAX6620_REG_DYN_FAN2,
> +	MAX6620_REG_DYN_FAN3,
> +};
> +
> +static const u8 tach_reg[] = {
> +	MAX6620_REG_TACH0,
> +	MAX6620_REG_TACH1,
> +	MAX6620_REG_TACH2,
> +	MAX6620_REG_TACH3,
> +};
> +
> +static const u8 target_reg[] = {
> +	MAX6620_REG_TAR0,
> +	MAX6620_REG_TAR1,
> +	MAX6620_REG_TAR2,
> +	MAX6620_REG_TAR3,
> +};
> +
> +/*
> + * Client data (each client gets its own)
> + */
> +
> +struct max6620_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +	bool valid; /* false until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* register values */
> +	u8 fancfg[4];
> +	u8 fandyn[4];
> +	u8 fault;
> +	u16 tach[4];
> +	u16 target[4];
> +};
> +
> +static u8 max6620_fan_div_from_reg(u8 val)
> +{
> +	return BIT((val & 0xE0) >> 5);
> +}
> +
> +static u16 max6620_fan_rpm_to_tach(u8 div, int rpm)
> +{
> +	return (60 * div * MAX6620_CLOCK_FREQ) / (rpm * MAX6620_PULSE_PER_REV);
> +}
> +
> +static int max6620_fan_tach_to_rpm(u8 div, u16 tach)
> +{
> +	return (60 * div * MAX6620_CLOCK_FREQ) / (tach * MAX6620_PULSE_PER_REV);
> +}
> +
> +static int max6620_update_device(struct device *dev)
> +{
> +	struct max6620_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int i;
> +	int ret = 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		for (i = 0; i < 4; i++) {
> +			ret = i2c_smbus_read_byte_data(client, config_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->fancfg[i] = ret;
> +
> +			ret = i2c_smbus_read_byte_data(client, dyn_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->fandyn[i] = ret;
> +
> +			ret = i2c_smbus_read_byte_data(client, tach_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->tach[i] = (ret << 3) & 0x7f8;
> +			ret = i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
> +			if (ret < 0)
> +				goto error;
> +			data->tach[i] |= (ret >> 5) & 0x7;
> +
> +			ret = i2c_smbus_read_byte_data(client, target_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->target[i] = (ret << 3) & 0x7f8;
> +			ret = i2c_smbus_read_byte_data(client, target_reg[i] + 1);
> +			if (ret < 0)
> +				goto error;
> +			data->target[i] |= (ret >> 5) & 0x7;
> +		}
> +
> +		/*
> +		 * Alarms are cleared on read in case the condition that
> +		 * caused the alarm is removed. Keep the value latched here
> +		 * for providing the register through different alarm files.
> +		 */
> +		ret = i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
> +		if (ret < 0)
> +			goto error;
> +		data->fault |= (ret >> 4) & (ret & 0x0F);
> +
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static umode_t
> +max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
> +		   int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_alarm:
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_div:
> +		case hwmon_fan_target:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	     int channel, long *val)
> +{
> +	struct max6620_data *data;
> +	struct i2c_client *client;
> +	int ret;
> +	u8 div;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret = max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data = dev_get_drvdata(dev);
> +	client = data->client;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_alarm:
> +			mutex_lock(&data->update_lock);
> +			*val = !!(data->fault & BIT(channel));
> +
> +			/* Setting TACH count to re-enable fan fault detection */
> +			if (*val == 1) {
> +				val1 = (data->target[channel] >> 3) & 0xff;
> +				val2 = (data->target[channel] << 5) & 0xe0;
> +				ret = i2c_smbus_write_byte_data(client,
> +								target_reg[channel], val1);
> +				if (ret < 0) {
> +					mutex_unlock(&data->update_lock);
> +					return ret;
> +				}
> +				ret = i2c_smbus_write_byte_data(client,
> +								target_reg[channel] + 1, val2);
> +				if (ret < 0) {
> +					mutex_unlock(&data->update_lock);
> +					return ret;
> +				}
> +
> +				data->fault &= ~BIT(channel);
> +			}
> +			mutex_unlock(&data->update_lock);
> +
> +			break;
> +		case hwmon_fan_div:
> +			*val = max6620_fan_div_from_reg(data->fandyn[channel]);
> +			break;
> +		case hwmon_fan_input:
> +			if (data->tach[channel] == 0) {
> +				*val = 0;
> +			} else {
> +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val = max6620_fan_tach_to_rpm(div, data->tach[channel]);
> +			}
> +			break;
> +		case hwmon_fan_target:
> +			if (data->target[channel] == 0) {
> +				*val = 0;
> +			} else {
> +				div = max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val = max6620_fan_tach_to_rpm(div, data->target[channel]);
> +			}
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	      int channel, long val)
> +{
> +	struct max6620_data *data;
> +	struct i2c_client *client;
> +	int ret;
> +	u8 div;
> +	u16 tach;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret = max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data = dev_get_drvdata(dev);
> +	client = data->client;
> +	mutex_lock(&data->update_lock);
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_div:
> +			switch (val) {
> +			case 1:
> +				div = 0;
> +				break;
> +			case 2:
> +				div = 1;
> +				break;
> +			case 4:
> +				div = 2;
> +				break;
> +			case 8:
> +				div = 3;
> +				break;
> +			case 16:
> +				div = 4;
> +				break;
> +			case 32:
> +				div = 5;
> +				break;
> +			default:
> +				ret = -EINVAL;
> +				goto error;
> +			}
> +			data->fandyn[channel] &= 0x1F;
> +			data->fandyn[channel] |= div << 5;
> +			ret = i2c_smbus_write_byte_data(client, dyn_reg[channel],
> +							data->fandyn[channel]);
> +			break;
> +		case hwmon_fan_target:
> +			val = clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
> +			div = max6620_fan_div_from_reg(data->fandyn[channel]);
> +			tach = max6620_fan_rpm_to_tach(div, val);
> +			val1 = (tach >> 3) & 0xff;
> +			val2 = (tach << 5) & 0xe0;
> +			ret = i2c_smbus_write_byte_data(client, target_reg[channel], val1);
> +			if (ret < 0)
> +				break;
> +			ret = i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2);
> +			if (ret < 0)
> +				break;
> +
> +			/* Setting TACH count re-enables fan fault detection */
> +			data->fault &= ~BIT(channel);
> +
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static const struct hwmon_channel_info *max6620_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM),
> +	NULL
> +};
> +
> +static const struct hwmon_ops max6620_hwmon_ops = {
> +	.read = max6620_read,
> +	.write = max6620_write,
> +	.is_visible = max6620_is_visible,
> +};
> +
> +static const struct hwmon_chip_info max6620_chip_info = {
> +	.ops = &max6620_hwmon_ops,
> +	.info = max6620_info,
> +};
> +
> +static int max6620_init_client(struct max6620_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int config;
> +	int err;
> +	int i;
> +	int reg;
> +
> +	config = i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
> +	if (config < 0) {
> +		dev_err(&client->dev, "Error reading config, aborting.\n");
> +		return config;
> +	}
> +
> +	/*
> +	 * Set bit 4, disable other fans from going full speed on a fail
> +	 * failure.
> +	 */
> +	err = i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x10);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Config write error, aborting.\n");
> +		return err;
> +	}
> +
> +	for (i = 0; i < 4; i++) {
> +		reg = i2c_smbus_read_byte_data(client, config_reg[i]);
> +		if (reg < 0)
> +			return reg;
> +		data->fancfg[i] = reg;
> +
> +		/* Enable RPM mode */
> +		data->fancfg[i] |= 0xa8;
> +		err = i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
> +		if (err < 0)
> +			return err;
> +
> +		/* 2 counts (001) and Rate change 100 (0.125 secs) */
> +		data->fandyn[i] = 0x30;
> +		err = i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
> +		if (err < 0)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static int max6620_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct max6620_data *data;
> +	struct device *hwmon_dev;
> +	int err;
> +
> +	data = devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	mutex_init(&data->update_lock);
> +
> +	err = max6620_init_client(data);
> +	if (err)
> +		return err;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &max6620_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id max6620_id[] = {
> +	{ "max6620", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max6620_id);
> +
> +static struct i2c_driver max6620_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "max6620",
> +	},
> +	.probe_new	= max6620_probe,
> +	.id_table	= max6620_id,
> +};
> +
> +module_i2c_driver(max6620_driver);
> +
> +MODULE_AUTHOR("Lucas Grunenberg");
> +MODULE_DESCRIPTION("MAX6620 sensor driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: ff1176468d368232b684f75e82563369208bc371
> -- 
> 2.32.0
> 
