Return-Path: <linux-hwmon+bounces-4903-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20A9BBA68
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Nov 2024 17:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050672813F1
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Nov 2024 16:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E063A1C07E5;
	Mon,  4 Nov 2024 16:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3NuLSJT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2B720326;
	Mon,  4 Nov 2024 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730738172; cv=none; b=C73kHWPkXXwd4agImRswoQq75a74Lva2m8A8kMGyvAVF7nguKRqn8tVu7hGBNMRs6nSOdX7NtnZysN07PGGH2JMhDKkfBWnGC9a8GV50FxWkxxAw/Vmc7CCQaAtQOTbbK0wm3LU7QP5aKnmxrlyJ4IGlwb0G8x565XLGm2w60h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730738172; c=relaxed/simple;
	bh=w9fHs86soS50gPVMGfY2/X5aYVKIuNMrM1OGvYVnWqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eX1LDxtaI84MxOoaZtKFO6tOpi21gMFZmcpDqq+Hq4hf27esZuSJ1LL9WZEAssWWrJOBUnXN4zGqBcGDVBiTcr8su6fP4ZkrEEpgGNFjuRLKZKGrSxYHzT1DBujc6c1x5URr6unqmxrXEeDgwnk9CJIiwodohWoZEh4gYStLrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3NuLSJT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so3765562b3a.1;
        Mon, 04 Nov 2024 08:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730738170; x=1731342970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TyDo5ryDU3qYgKXJqmjPMOL+tV06QHxuugNNIJtPE50=;
        b=F3NuLSJT3tgQ6PI/gBLs7/2CSxK6D7wwYn7u7fLyoBgzdv57i7ozTb4XtB6t8+Khm0
         8WH6oFAL4S43rKuxpWcKF2G377y3MyfmRHmpt8q3G+8SZ4tRFpl+GL+2oREUAop/jajr
         59KUn8W1PWLZGNE3VZZ2D8mMNhwUqb5REZl6bKHCUzZUwWVSjzfhXqNYa7MSaT11vSt/
         J8H6w0rBchVmP4gU967ZYpvmrPXM7aav2qYMfTm4nlSU1yXb9qHSumN109U2gKXy/Yu/
         0N9Imw1TaTORNXYFGaa2IsFz4QVUox+ppGMid0RlsAH+LG9167nZFsCCW159WrWPot5v
         9c4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730738170; x=1731342970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyDo5ryDU3qYgKXJqmjPMOL+tV06QHxuugNNIJtPE50=;
        b=kOx3h7YtIHcksWEorycwT3FmSp+6ckLOUuWeuGQZ50kbOP23CvP5VnV8aO6C9xBcgr
         CuwgVXUW/wJa+0PiRGmnuZ6tsWaZASm6Wz3R2La7H8EyW5jl0BgVaP7mY+8rSNZl9UAe
         ZbRKWuVsp8Eh3aUZNBxWWfrQvm1/ZtJCorD9gQuLwh/vZBtQi61E5JqtNwphuCncy1Z2
         pGovWEFneykQn60FhIhwOxnZFErBpVcKxrRsRs4TZ/xjpPmny3iEYjzBi5MymLqyhrMe
         OJ1VRuGAJfpdPxY4Z3RzimQAyZ+mjTohaxMtTFnCkXUgQMWoJZ9CNbzDi9vrtFvcmxK+
         uShw==
X-Forwarded-Encrypted: i=1; AJvYcCWdK0uOQb9hGDvOlR2ImW6vaG2Tugt/SsxgCE1/RPVVKIT/YCnXpDrHg7cMwxMkevInAaS/EwRpj3fqFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycVZ3Ee6KTHWS01XXBpUm4NxK2BgeDisu26a2yVHjQfyWYbg8D
	AJ4pmov9XA0NM8fJ7MXFTM7KunqLWmFX4j3IppRZ+zQzfpOHoi2QJrIpyQ==
X-Google-Smtp-Source: AGHT+IEbu9hy8H7c6n5pfMyQMFsf+SLLpFJY42buZfSj5aGpyG+/dOAYsXZNuOWy2Ik5/OVuwiaYog==
X-Received: by 2002:a05:6a21:7894:b0:1db:e917:5755 with SMTP id adf61e73a8af0-1dbe91771e6mr1935510637.30.1730738169608;
        Mon, 04 Nov 2024 08:36:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc315ac5sm7548487b3a.200.2024.11.04.08.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 08:36:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d699cddc-a8ae-4094-b1b5-7af8cd7e91cd@roeck-us.net>
Date: Mon, 4 Nov 2024 08:36:07 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: Add Congatec Board Controller monitoring
 driver
To: Thomas Richard <thomas.richard@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
References: <20241104-congatec-board-controller-hwmon-v1-0-871e4cd59d8e@bootlin.com>
 <20241104-congatec-board-controller-hwmon-v1-1-871e4cd59d8e@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241104-congatec-board-controller-hwmon-v1-1-871e4cd59d8e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/24 07:48, Thomas Richard wrote:
> Add support for the Congatec Board Controller. This controller exposes
> temperature, voltage, current and fan sensors.
> 
> The available sensors list cannot be predicted. Some sensors can be
> present or not, depending the system.
> The driver has an internal list of all possible sensors, for all Congatec
> boards. The Board Controller gives to the driver its sensors list, and
> their status (active or not).
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
> ---
>   MAINTAINERS                |   1 +
>   drivers/hwmon/Kconfig      |   9 ++
>   drivers/hwmon/Makefile     |   1 +
>   drivers/hwmon/cgbc-hwmon.c | 287 +++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 298 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3507df3381b1..5e96646593b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5784,6 +5784,7 @@ CONGATEC BOARD CONTROLLER MFD DRIVER
>   M:	Thomas Richard <thomas.richard@bootlin.com>
>   S:	Maintained
>   F:	drivers/gpio/gpio-cgbc.c
> +F:	drivers/hwmon/cgbc-hwmon.c
>   F:	drivers/i2c/busses/i2c-cgbc.c
>   F:	drivers/mfd/cgbc-core.c
>   F:	drivers/watchdog/cgbc_wdt.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index cfb4e9314c62..c7b6e93aeb9b 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -463,6 +463,15 @@ config SENSORS_BT1_PVT_ALARMS
>   	  the data conversion will be periodically performed and the data will be
>   	  saved in the internal driver cache.
>   
> +config SENSORS_CGBC
> +	tristate "Congatec Board Controller Sensors"
> +	depends on MFD_CGBC
> +	help
> +	  Enables sensors support for the Congatec Board Controller.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called cgbc-hwmon.
> +
>   config SENSORS_CHIPCAP2
>   	tristate "Amphenol ChipCap 2 relative humidity and temperature sensor"
>   	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b827b92f2a78..318da6d8f752 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_SENSORS_ASUS_ROG_RYUJIN)	+= asus_rog_ryujin.o
>   obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
>   obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
>   obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
> +obj-$(CONFIG_SENSORS_CGBC)	+= cgbc-hwmon.o
>   obj-$(CONFIG_SENSORS_CHIPCAP2) += chipcap2.o
>   obj-$(CONFIG_SENSORS_CORETEMP)	+= coretemp.o
>   obj-$(CONFIG_SENSORS_CORSAIR_CPRO) += corsair-cpro.o
> diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
> new file mode 100644
> index 000000000000..3234c7590acb
> --- /dev/null
> +++ b/drivers/hwmon/cgbc-hwmon.c
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * cgbc-hwmon - Congatec Board Controller hardware monitoring driver
> + *
> + * Copyright (C) 2024 Thomas Richard <thomas.richard@bootlin.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/mfd/cgbc.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define CGBC_HWMON_TYPE_TEMP	1
> +#define CGBC_HWMON_TYPE_IN	2
> +#define CGBC_HWMON_TYPE_FAN	3
> +
> +#define CGBC_HWMON_CMD_SENSOR		0x77
> +#define CGBC_HWMON_CMD_SENSOR_DATA_SIZE	0x05
> +
> +#define CGBC_HWMON_TYPE_MASK	GENMASK(6, 5)
> +#define CGBC_HWMON_ID_MASK	GENMASK(4, 0)
> +#define CGBC_HWMON_ACTIVE_BIT	BIT(7)
> +#define CGBC_HWMON_DATA_HIGH	GENMASK(15, 8)
> +#define CGBC_HWMON_DATA_LOW	GENMASK(7, 0)
> +
> +struct cgbc_hwmon_sensor {
> +	enum hwmon_sensor_types type;
> +	bool active;
> +	u8 index;
> +	const char *label;
> +};
> +
> +struct cgbc_hwmon_data {
> +	struct cgbc_device_data *cgbc;
> +	u8 nb_sensors;

FWIW, using u8 here and in struct cgbc_hwmon_sensor doesn't save any memory,
it only makes the generated code more complex, at least on non-Intel
architectures. The same is true for using u8 for any index variables.
It would make much more sense to use natural data types.

> +	struct cgbc_hwmon_sensor *sensors;
> +};
> +
> +static const char * const cgbc_hwmon_labels_temp[] = {
> +	"CPU Temperature",
> +	"Box Temperature",
> +	"Ambient Temperature",
> +	"Board Temperature",
> +	"Carrier Temperature",
> +	"Chipset Temperature",
> +	"Video Temperature",
> +	"Other Temperature",
> +	"TOPDIM Temperature",
> +	"BOTTOMDIM Temperature",
> +};
> +
> +static const struct {
> +	enum hwmon_sensor_types type;
> +	const char *label;
> +} cgbc_hwmon_labels_in[] = {
> +	{ hwmon_in, "CPU Voltage" },
> +	{ hwmon_in, "DC Runtime Voltage" },
> +	{ hwmon_in, "DC Standby Voltage" },
> +	{ hwmon_in, "CMOS Battery Voltage" },
> +	{ hwmon_in, "Battery Voltage" },
> +	{ hwmon_in, "AC Voltage" },
> +	{ hwmon_in, "Other Voltage" },
> +	{ hwmon_in, "5V Voltage" },
> +	{ hwmon_in, "5V Standby Voltage" },
> +	{ hwmon_in, "3V3 Voltage" },
> +	{ hwmon_in, "3V3 Standby Voltage" },
> +	{ hwmon_in, "VCore A Voltage" },
> +	{ hwmon_in, "VCore B Voltage" },
> +	{ hwmon_in, "12V Voltage" },
> +	{ hwmon_curr, "DC Current" },
> +	{ hwmon_curr, "5V Current" },
> +	{ hwmon_curr, "12V Current" },
> +};
> +
> +static const char * const cgbc_hwmon_labels_fan[] = {
> +	"CPU Fan",
> +	"Box Fan",
> +	"Ambient Fan",
> +	"Chipset Fan",
> +	"Video Fan",
> +	"Other Fan",
> +};
> +
> +static int cgbc_hwmon_cmd(struct cgbc_device_data *cgbc, u8 id, u8 *data)
> +{
> +	u8 cmd[2] = {CGBC_HWMON_CMD_SENSOR, id};
> +
> +	return cgbc_command(cgbc, cmd, sizeof(cmd), data, CGBC_HWMON_CMD_SENSOR_DATA_SIZE, NULL);
> +}
> +
> +static int cgbc_hwmon_probe_sensors(struct device *dev, struct cgbc_hwmon_data *hwmon)
> +{
> +	struct cgbc_device_data *cgbc = hwmon->cgbc;
> +	struct cgbc_hwmon_sensor *sensor = hwmon->sensors;
> +	u8 data[CGBC_HWMON_CMD_SENSOR_DATA_SIZE], nb_sensors, i;
> +	int ret;
> +
> +	ret = cgbc_hwmon_cmd(cgbc, 0, &data[0]);
> +	if (ret)
> +		return ret;
> +
> +	nb_sensors = data[0];
> +
> +	hwmon->sensors = devm_kzalloc(dev, sizeof(*hwmon->sensors) * nb_sensors, GFP_KERNEL);
> +	sensor = hwmon->sensors;
> +
> +	for (i = 0; i < nb_sensors; i++) {
> +		u8 type, id;
> +
> +		ret = cgbc_hwmon_cmd(cgbc, i, &data[0]);

For the first loop, this essentially repeats the cgbc_hwmon_cmd() from above.
Is that how it works, i.e., that index == 0 returns both the number of sensors
in the first byte of return data plus the data for the first sensor ?

> +		if (ret)
> +			return ret;
> +
> +		type = FIELD_GET(CGBC_HWMON_TYPE_MASK, data[1]);
> +		id = FIELD_GET(CGBC_HWMON_ID_MASK, data[1]) - 1;
> +
> +		if (type == CGBC_HWMON_TYPE_TEMP && id < ARRAY_SIZE(cgbc_hwmon_labels_temp)) {
> +			sensor->type = hwmon_temp;
> +			sensor->label = cgbc_hwmon_labels_temp[id];
> +		} else if (type == CGBC_HWMON_TYPE_IN && id < ARRAY_SIZE(cgbc_hwmon_labels_in)) {
> +			/*
> +			 * The Board Controller doesn't do differences between current and voltage

doesn't differentiate

> +			 * sensors
> +			 */

This doesn't really explain what is happening. Please add something like
"Get the sensor type from cgbc_hwmon_labels_in[id].label instead".

> +			sensor->type = cgbc_hwmon_labels_in[id].type;
> +			sensor->label = cgbc_hwmon_labels_in[id].label;
> +		} else if (type == CGBC_HWMON_TYPE_FAN && id < ARRAY_SIZE(cgbc_hwmon_labels_fan)) {
> +			sensor->type = hwmon_fan;
> +			sensor->label = cgbc_hwmon_labels_fan[id];
> +		} else {
> +			dev_warn(dev, "Board Controller returned an unknown sensor (type=%d, id=%d), ignore it",
> +				 type, id);
> +			continue;
> +		}
> +
> +		sensor->active = FIELD_GET(CGBC_HWMON_ACTIVE_BIT, data[1]);
> +		sensor->index = i;
> +		sensor++;
> +		hwmon->nb_sensors++;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct cgbc_hwmon_sensor *cgbc_hwmon_find_sensor(struct cgbc_hwmon_data *hwmon,
> +							enum hwmon_sensor_types type, int channel)
> +{
> +	struct cgbc_hwmon_sensor *sensor = NULL;
> +	int i, cnt = 0;
> +
> +	for (i = 0; i < hwmon->nb_sensors; i++) {
> +		if (hwmon->sensors[i].type == type && cnt++ == channel) {

Isn't that a bit fragile ? It assumes that the nth reported sensor of a given type
reflects a specific named sensor. If that is indeed the case, why bother with
all the code in cgbc_hwmon_probe_sensors() ? The index to sensor association
should be well defined, and the sensor type plus the channel index should always
be a constant.

> +			sensor = &hwmon->sensors[i];
> +			break;
> +		}
> +	}
> +
> +	return sensor;
> +}
> +
> +static int cgbc_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			   long *val)
> +{
> +	struct cgbc_hwmon_data *hwmon = dev_get_drvdata(dev);
> +	struct cgbc_hwmon_sensor *sensor = cgbc_hwmon_find_sensor(hwmon, type, channel);
> +	struct cgbc_device_data *cgbc = hwmon->cgbc;
> +	u8 data[CGBC_HWMON_CMD_SENSOR_DATA_SIZE];
> +	int ret;
> +
> +	if (!sensor)
> +		return -ENODEV;

How would this ever happen ? Unless I am missing something, that means
there is a bug somewhere in the code. "No such device" is definitely
wrong here (and elsewhere). If you don't trust your code and think
this can happen, at least return -ENODATA.

> +
> +	ret = cgbc_hwmon_cmd(cgbc, sensor->index, &data[0]);
> +	if (ret)
> +		return ret;
> +
> +	*val = FIELD_PREP(CGBC_HWMON_DATA_HIGH, data[3]) | FIELD_PREP(CGBC_HWMON_DATA_LOW, data[2]);
> +

That is a pretty complex way of writing
	*val = (data[3] << 8) | data[2];
I'd say that is close to obfuscation, but that is your call.

> +	/* For the Board Controller 1lsb = 0.1 degree centigrade */

All other units are as expected (mV, mA, rpm) ?

> +	if (sensor->type == hwmon_temp)
> +		*val *= 100;
> +
> +	return 0;
> +}
> +
> +static umode_t cgbc_hwmon_is_visible(const void *_data, enum hwmon_sensor_types type, u32 attr,
> +				     int channel)
> +{
> +	struct cgbc_hwmon_data *data = (struct cgbc_hwmon_data *)_data;
> +	struct cgbc_hwmon_sensor *sensor;
> +
> +	sensor = cgbc_hwmon_find_sensor(data, type, channel);
> +	if (!sensor)
> +		return 0;
> +
> +	return sensor->active ? 0444 : 0;
> +}
> +
> +static int cgbc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +				  int channel, const char **str)
> +{
> +	struct cgbc_hwmon_data *hwmon = dev_get_drvdata(dev);
> +	struct cgbc_hwmon_sensor *sensor = cgbc_hwmon_find_sensor(hwmon, type, channel);
> +
> +	if (!sensor)
> +		return -ENODEV;
> +
> +	*str = sensor->label;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info * const cgbc_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LABEL, HWMON_C_INPUT | HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_LABEL, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL, HWMON_F_INPUT | HWMON_F_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops cgbc_hwmon_ops = {
> +	.is_visible = cgbc_hwmon_is_visible,
> +	.read = cgbc_hwmon_read,
> +	.read_string = cgbc_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info cgbc_chip_info = {
> +	.ops = &cgbc_hwmon_ops,
> +	.info = cgbc_hwmon_info,
> +};
> +
> +static int cgbc_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct cgbc_hwmon_data *data;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->cgbc = cgbc;
> +
> +	platform_set_drvdata(pdev, data);

What is this used for ? There are no suspend/resume functions,
so I don't see the use case.

> +
> +	ret = cgbc_hwmon_probe_sensors(dev, data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to probe sensors");
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cgbc_hwmon", data, &cgbc_chip_info,
> +							 NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver cgbc_hwmon_driver = {
> +	.driver = {
> +		.name = "cgbc-hwmon",
> +	},
> +	.probe = cgbc_hwmon_probe,
> +};
> +
> +module_platform_driver(cgbc_hwmon_driver);
> +
> +MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
> +MODULE_DESCRIPTION("Congatec Board Controller Hardware Monitoring Driver");
> +MODULE_LICENSE("GPL");
> 


