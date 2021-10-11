Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A633429847
	for <lists+linux-hwmon@lfdr.de>; Mon, 11 Oct 2021 22:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbhJKUpt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 11 Oct 2021 16:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhJKUpt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Oct 2021 16:45:49 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD96C061570;
        Mon, 11 Oct 2021 13:43:48 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id m67so177989oif.6;
        Mon, 11 Oct 2021 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=UqFRfGIpwQTpTvcmKqRlbId8ZJI7lhuS9lLUKF6yrHo=;
        b=p435s0jQGibqmVimxwx2cpwHzIGs+XANeKvETEvVp/zS8QjtRtxbdr4ZPHLykhqioF
         wKo3aAKwFwanuKLKnWmMTAFcUjLszr4/3McgRkyWmF0r560WV/5MFzWQeSCL2tSih5s5
         JpRHNeRLbtqCTOkIHLp5suBdWG1UV2qQ9u9OKmdM2ZgEo00BrvuHNUlUqC0ITkevMyu9
         gF6S79QDAPwHpcMD0tjVhi09gj9oGar7nqA4N6g4J6fDYHCyIscJruwmazdYMGG1eo1F
         iC0LLCrkpcoCmN2fveRkv9FXhPZc2+GyxefJKpcxzCca34a6tPNw7RYVeRTaSlyAHhRm
         36kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:content-transfer-encoding;
        bh=UqFRfGIpwQTpTvcmKqRlbId8ZJI7lhuS9lLUKF6yrHo=;
        b=CTmOZKhIDaKuWsQrCyNS2piBmfToQpcxJg61z10baHDjFn+8MJFPsPJYY7yxxW9bMf
         hEMQXo6f4mBsQNn7kE1Yn0mJ4g4PUKmb51j+63bsQHD2yYLw7uzfhxX5hnwFS3cQDDXd
         uyuDEUuONDtO/ul4NHdStvEpDYRhvrmbfTJUCsATwDZxOOncy8zjOy0lkt6VpQ5pm0ea
         ep0wsXp1qzUDECGivJCec37KPHVVasUJVGZr2RxvVfJWdyB/2UTuwfxpquGuZZVyJLZf
         U6Llb0GRvzL/duHllZJL6kNvjp5tAFZ7y6rbJATvUo4/FE6PHQ968KdV26x+ldgG985m
         GEgA==
X-Gm-Message-State: AOAM530Lrvjh9D4AAw0b09qlPDQEmhKvq74EiG5zPltLkIx2NIa6ygz7
        S0UQ5s+uFdBwdFahY9TpntE=
X-Google-Smtp-Source: ABdhPJxtKwx6lSTlTeZ/0lclv1VHmaS2iYjgOBwRhSyXEy/7iyoVzZfBz4PW6whACOHV6bYiablMvA==
X-Received: by 2002:a05:6808:1454:: with SMTP id x20mr875998oiv.23.1633985027764;
        Mon, 11 Oct 2021 13:43:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e28sm987275oiy.10.2021.10.11.13.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 13:43:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 11 Oct 2021 13:43:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Denis Pauk <pauk.denis@gmail.com>
Cc:     eugene.shalygin@gmail.com, andy.shevchenko@gmail.com,
        platform-driver-x86@vger.kernel.org,
        Ed Brindley <kernel@maidavale.org>,
        kernel test robot <lkp@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (asus_wmi_sensors) Support X370 Asus WMI.
Message-ID: <20211011204345.GA1869030@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 11, 2021 at 10:55:02PM +0300, Denis Pauk wrote:
> Provides a Linux kernel module "asus_wmi_sensors" that provides sensor
> readouts via ASUS' WMI interface present in the UEFI of
> X370/X470/B450/X399 Ryzen motherboards.
> 
> Supported motherboards:
> * ROG CROSSHAIR VI HERO,
> * PRIME X399-A,
> * PRIME X470-PRO,
> * ROG CROSSHAIR VI EXTREME,
> * ROG CROSSHAIR VI HERO (WI-FI AC),
> * ROG CROSSHAIR VII HERO,
> * ROG CROSSHAIR VII HERO (WI-FI),
> * ROG STRIX B450-E GAMING,
> * ROG STRIX B450-F GAMING,
> * ROG STRIX B450-I GAMING,
> * ROG STRIX X399-E GAMING,
> * ROG STRIX X470-F GAMING,
> * ROG STRIX X470-I GAMING,
> * ROG ZENITH EXTREME,
> * ROG ZENITH EXTREME ALPHA.
> 
> Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
> Co-developed-by: Ed Brindley <kernel@maidavale.org>
> Signed-off-by: Ed Brindley <kernel@maidavale.org>
> Reported-by: kernel test robot <lkp@intel.com>
> 
> ---
> Changes in v5:
> - Fixes build issue reported by kernel test robot with disabled ACPI_WMI.
> - Remove sensor->name check as always eevaluated to true.
> 
> Changes in v4:
> - Implement wmi driver instead platform driver.
> - Update documentation.
> 
> Changes in v3:
> - Use MODULE_DEVICE_TABLE for match devices.
> - Add documentaion for driver.
> 
> Changes in v2:
> - Add module for boards with support of WMI interface returned sensor name and
>   value of sensor..
> ---
>  Documentation/hwmon/asus_wmi_sensors.rst |  74 +++

Also add to index.rst.

>  MAINTAINERS                              |   1 +
>  drivers/hwmon/Kconfig                    |  11 +
>  drivers/hwmon/Makefile                   |   1 +
>  drivers/hwmon/asus_wmi_sensors.c         | 621 +++++++++++++++++++++++
>  5 files changed, 708 insertions(+)
>  create mode 100644 Documentation/hwmon/asus_wmi_sensors.rst
>  create mode 100644 drivers/hwmon/asus_wmi_sensors.c
> 
> diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/hwmon/asus_wmi_sensors.rst
> new file mode 100644
> index 000000000000..e32bfb74289f
> --- /dev/null
> +++ b/Documentation/hwmon/asus_wmi_sensors.rst
> @@ -0,0 +1,74 @@
> +Kernel driver asus-wmi-sensors
> +=================================
> +
> +Supported boards:
> + * PRIME X399-A,
> + * PRIME X470-PRO,
> + * ROG CROSSHAIR VI EXTREME,
> + * ROG CROSSHAIR VI HERO,
> + * ROG CROSSHAIR VI HERO (WI-FI AC),
> + * ROG CROSSHAIR VII HERO,
> + * ROG CROSSHAIR VII HERO (WI-FI),
> + * ROG STRIX B450-E GAMING,
> + * ROG STRIX B450-F GAMING,
> + * ROG STRIX B450-I GAMING,
> + * ROG STRIX X399-E GAMING,
> + * ROG STRIX X470-F GAMING,
> + * ROG STRIX X470-I GAMING,
> + * ROG ZENITH EXTREME,
> + * ROG ZENITH EXTREME ALPHA.
> +
> +Authors:
> +        Ed Brindley <kernel@maidavale.org>
> +
> +Description:
> +------------
> +ASUS mainboards publish hardware monitoring information via WMI interface.
> +
> +ASUS WMI interface provides a methods to get list of sensors and values of
> +such, which is utilized by this driver to publish those sensor readings to the
> +HWMON system. The driver is aware of and reads the following sensors:
> + * CPU Core Voltage,
> + * CPU SOC Voltage,
> + * DRAM Voltage,
> + * VDDP Voltage,
> + * 1.8V PLL Voltage,
> + * +12V Voltage,
> + * +5V Voltage,
> + * 3VSB Voltage,
> + * VBAT Voltage,
> + * AVCC3 Voltage,
> + * SB 1.05V Voltage,
> + * CPU Core Voltage,
> + * CPU SOC Voltage,
> + * DRAM Voltage,
> + * CPU Fan RPM,
> + * Chassis Fan 1 RPM,
> + * Chassis Fan 2 RPM,
> + * Chassis Fan 3 RPM,
> + * HAMP Fan RPM,
> + * Water Pump RPM,
> + * CPU OPT RPM,
> + * Water Flow RPM,
> + * AIO Pump RPM,
> + * CPU Temperature,
> + * CPU Socket Temperature,
> + * Motherboard Temperature,
> + * Chipset Temperature,
> + * Tsensor 1 Temperature,
> + * CPU VRM Temperature,
> + * Water In,
> + * Water Out,
> + * CPU VRM Output Current.
> +
> +Known Issues:
> +* The WMI implementation in some of Asus' BIOSes is buggy. This can result in
> +   fans stopping, fans getting stuck at max speed, or temperature readouts
> +   getting stuck. This is not an issue with the driver, but the BIOS. The Prime
> +   X470 Pro seems particularly bad for this. The more frequently the WMI
> +   interface is polled the greater the potential for this to happen. Until you
> +   have subjected your computer to an extended soak test while polling the
> +   sensors frequently, don't leave you computer unattended. Upgrading to new
> +   BIOS version with method version greater than or equal to two should
> +   rectify the issue.
> +* A few boards report 12v voltages to be ~10v.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 05448435991d..46036c184330 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2943,6 +2943,7 @@ M:	Denis Pauk <pauk.denis@gmail.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	drivers/hwmon/asus_wmi_ec_sensors.c
> +F:	drivers/hwmon/asus_wmi_sensors.c
>  
>  ASUS WIRELESS RADIO CONTROL DRIVER
>  M:	Jo�o Paulo Rechi Vita <jprvita@gmail.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 430a438432a0..461328c4b00a 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2215,6 +2215,17 @@ config SENSORS_ATK0110
>  	  This driver can also be built as a module. If so, the module
>  	  will be called asus_atk0110.
>  
> +config SENSORS_ASUS_WMI
> +	tristate "ASUS WMI X370/X470/B450/X399"
> +	help
> +	  If you say yes here you get support for the ACPI hardware monitoring
> +	  interface found in X370/X470/B450/X399 ASUS motherboards. This driver
> +	  will provide readings of fans, voltages and temperatures through the system
> +	  firmware.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called asus_wmi_sensors.
> +
>  config SENSORS_ASUS_WMI_EC
>  	tristate "ASUS WMI B550/X570"
>  	help
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index aae2ff5c7335..656a6191a0f8 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_HWMON_VID)		+= hwmon-vid.o
>  # APCI drivers
>  obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
>  obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
> +obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
>  obj-$(CONFIG_SENSORS_ASUS_WMI_EC)	+= asus_wmi_ec_sensors.o
>  
>  # Native drivers
> diff --git a/drivers/hwmon/asus_wmi_sensors.c b/drivers/hwmon/asus_wmi_sensors.c
> new file mode 100644
> index 000000000000..a45fbec4e319
> --- /dev/null
> +++ b/drivers/hwmon/asus_wmi_sensors.c
> @@ -0,0 +1,621 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * HWMON driver for ASUS motherboards that provides sensor readouts via WMI
> + * interface present in the UEFI of the X370/X470/B450/X399 Ryzen motherboards.
> + *
> + * Copyright (C) 2018-2019 Ed Brindley <kernel@maidavale.org>
> + *
> + * WMI interface provides:
> + * CPU Core Voltage,
> + * CPU SOC Voltage,
> + * DRAM Voltage,
> + * VDDP Voltage,
> + * 1.8V PLL Voltage,
> + * +12V Voltage,
> + * +5V Voltage,
> + * 3VSB Voltage,
> + * VBAT Voltage,
> + * AVCC3 Voltage,
> + * SB 1.05V Voltage,
> + * CPU Core Voltage,
> + * CPU SOC Voltage,
> + * DRAM Voltage,
> + * CPU Fan RPM,
> + * Chassis Fan 1 RPM,
> + * Chassis Fan 2 RPM,
> + * Chassis Fan 3 RPM,
> + * HAMP Fan RPM,
> + * Water Pump RPM,
> + * CPU OPT RPM,
> + * Water Flow RPM,
> + * AIO Pump RPM,
> + * CPU Temperature,
> + * CPU Socket Temperature,
> + * Motherboard Temperature,
> + * Chipset Temperature,
> + * Tsensor 1 Temperature,
> + * CPU VRM Temperature,
> + * Water In,
> + * Water Out,
> + * CPU VRM Output Current.
> + *
> + */
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

This include seems unnecessary.

> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/units.h>
> +#include <linux/wmi.h>
> +
> +#define ASUSWMI_MONITORING_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
> +#define ASUSWMI_METHODID_GET_VALUE	0x52574543
> +#define ASUSWMI_METHODID_UPDATE_BUFFER	0x51574543
> +#define ASUSWMI_METHODID_GET_INFO	0x50574543
> +#define ASUSWMI_METHODID_GET_NUMBER		0x50574572
> +#define ASUSWMI_METHODID_GET_VERSION		0x50574574
> +
> +#define ASUS_WMI_MAX_STR_SIZE	32
> +
> +#define DMI_EXACT_MATCH_ASUS_BOARD_NAME(name) \
> +	{ \
> +		.matches = { \
> +			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, \
> +					"ASUSTeK COMPUTER INC."), \
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, name), \
> +		}, \
> +	}
> +
> +static const struct dmi_system_id asus_wmi_dmi_table[] = {
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME X399-A"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME X470-PRO"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VI EXTREME"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VI HERO"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VI HERO (WI-FI AC)"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VII HERO"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG CROSSHAIR VII HERO (WI-FI)"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B450-E GAMING"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B450-F GAMING"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B450-I GAMING"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X399-E GAMING"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-F GAMING"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X470-I GAMING"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG ZENITH EXTREME"),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG ZENITH EXTREME ALPHA"),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, asus_wmi_dmi_table);
> +
> +enum asus_wmi_sensor_class {
> +	VOLTAGE = 0x0,
> +	TEMPERATURE_C = 0x1,
> +	FAN_RPM = 0x2,
> +	CURRENT = 0x3,
> +	WATER_FLOW = 0x4,
> +};
> +
> +enum asus_wmi_location {
> +	CPU = 0x0,
> +	CPU_SOC = 0x1,
> +	DRAM = 0x2,
> +	MOTHERBOARD = 0x3,
> +	CHIPSET = 0x4,
> +	AUX = 0x5,
> +	VRM = 0x6,
> +	COOLER = 0x7
> +};
> +
> +enum asus_wmi_type {
> +	SIGNED_INT = 0x0,
> +	UNSIGNED_INT = 0x1,
> +	SCALED = 0x3,
> +};
> +
> +enum asus_wmi_source {
> +	SIO = 0x1,
> +	EC = 0x2
> +};
> +
> +static enum hwmon_sensor_types asus_data_types[] = {
> +	[VOLTAGE] = hwmon_in,
> +	[TEMPERATURE_C] = hwmon_temp,
> +	[FAN_RPM] = hwmon_fan,
> +	[CURRENT] = hwmon_curr,
> +	[WATER_FLOW] = hwmon_fan,
> +};
> +
> +static u32 hwmon_attributes[] = {
> +	[hwmon_chip] = HWMON_C_REGISTER_TZ,
> +	[hwmon_temp] = HWMON_T_INPUT | HWMON_T_LABEL,
> +	[hwmon_in] = HWMON_I_INPUT | HWMON_I_LABEL,
> +	[hwmon_curr] = HWMON_C_INPUT | HWMON_C_LABEL,
> +	[hwmon_fan] = HWMON_F_INPUT | HWMON_F_LABEL,
> +};
> +
> +/**
> + * struct asus_wmi_sensor_info - sensor info.
> + * @id: sensor id.
> + * @data_type: sensor class e.g. voltage, temp etc.
> + * @location: sensor location.
> + * @name: sensor name.
> + * @source: sensor source.
> + * @type: sensor type signed, unsigned etc.
> + * @cached_value: cached sensor value.
> + */
> +struct asus_wmi_sensor_info {
> +	u32 id;
> +	int data_type;
> +	int location;
> +	char name[ASUS_WMI_MAX_STR_SIZE];
> +	int source;
> +	int type;
> +	u32 cached_value;
> +};
> +
> +struct asus_wmi_wmi_info {
> +	u8 buffer;
> +	unsigned long source_last_updated[3];	/* in jiffies */
> +	int sensor_count;
> +

What is this empty line for ?

> +	const struct asus_wmi_sensor_info **info[hwmon_max];
> +	struct asus_wmi_sensor_info **info_by_id;
> +};
> +
> +struct asus_wmi_sensors {
> +	/* lock access to instrnal cache */
> +	struct mutex lock;
> +	struct asus_wmi_wmi_info wmi;
> +};
> +
> +/*
> + * Universal method for calling WMI method
> + */
> +static int asus_wmi_call_method(u32 method_id, u32 *args, struct acpi_buffer *output)
> +{
> +#if IS_ENABLED(CONFIG_ACPI_WMI)
> +	struct acpi_buffer input = {(acpi_size) sizeof(*args), args };
> +	acpi_status status;
> +
> +	status = wmi_evaluate_method(ASUSWMI_MONITORING_GUID, 0, method_id, &input, output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +
> +/*
> + * Gets the version of the ASUS sensors interface implemented
> + */
> +static int asus_wmi_get_version(u32 *version)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	u32 args[] = {0, 0, 0};
> +	union acpi_object *obj;
> +	int err;
> +
> +	err = asus_wmi_call_method(ASUSWMI_METHODID_GET_VERSION, args, &output);
> +	if (err)
> +		return err;
> +
> +	obj = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_INTEGER)

Doesn't this require releasing the output buffer ?
Same for other similar functions. If not, it might make sense to
add a comment explaining why the object doesn't need to be released
even though ACPI_ALLOCATE_BUFFER is specified.

> +		return -EIO;
> +
> +	*version = obj->integer.value;
> +
> +	return 0;
> +}
> +
> +/*
> + * Gets the number of sensor items
> + */
> +static int asus_wmi_get_item_count(u32 *count)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	u32 args[] = {0, 0, 0};
> +	union acpi_object *obj;
> +	int err;
> +
> +	err = asus_wmi_call_method(ASUSWMI_METHODID_GET_NUMBER, args, &output);
> +	if (err)
> +		return err;
> +
> +	obj = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_INTEGER)
> +		return -EIO;
> +
> +	*count = obj->integer.value;
> +
> +	return 0;
> +}
> +
> +static int asus_wmi_hwmon_add_chan_info(struct hwmon_channel_info *asus_wmi_hwmon_chan,
> +					struct device *dev, int num,
> +					enum hwmon_sensor_types type, u32 config)
> +{
> +	u32 *cfg;
> +
> +	cfg = devm_kcalloc(dev, num + 1, sizeof(*cfg), GFP_KERNEL);
> +	if (!cfg)
> +		return -ENOMEM;
> +
> +	asus_wmi_hwmon_chan->type = type;
> +	asus_wmi_hwmon_chan->config = cfg;
> +	memset32(cfg, config, num);
> +
> +	return 0;
> +}
> +
> +/*
> + * For a given sensor item returns details e.g. type (voltage/temperature/fan speed etc), bank etc
> + */
> +static int asus_wmi_sensor_info(int index, struct asus_wmi_sensor_info *s)
> +{
> +	union acpi_object name_obj, data_type_obj, location_obj, source_obj, type_obj;
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	u32 args[] = {index, 0};
> +	union acpi_object *obj;
> +	int err;
> +
> +	err = asus_wmi_call_method(ASUSWMI_METHODID_GET_INFO, args, &output);
> +	if (err)
> +		return err;
> +
> +	s->id = index;
> +
> +	obj = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE)
> +		return -EIO;
> +
> +	if (obj->package.count != 5)
> +		return 1;
> +
> +	name_obj = obj->package.elements[0];
> +
> +	if (name_obj.type != ACPI_TYPE_STRING)
> +		return 1;
> +
> +	strncpy(s->name, name_obj.string.pointer, sizeof(s->name) - 1);
> +
> +	data_type_obj = obj->package.elements[1];
> +
> +	if (data_type_obj.type != ACPI_TYPE_INTEGER)
> +		return 1;
> +
> +	s->data_type = data_type_obj.integer.value;
> +
> +	location_obj = obj->package.elements[2];
> +
> +	if (location_obj.type != ACPI_TYPE_INTEGER)
> +		return 1;
> +
> +	s->location = location_obj.integer.value;
> +
> +	source_obj = obj->package.elements[3];
> +
> +	if (source_obj.type != ACPI_TYPE_INTEGER)
> +		return 1;
> +
> +	s->source = source_obj.integer.value;
> +
> +	type_obj = obj->package.elements[4];
> +
> +	if (type_obj.type != ACPI_TYPE_INTEGER)
> +		return 1;
> +
> +	s->type = type_obj.integer.value;
> +
> +	return 0;
> +}
> +
> +static int asus_wmi_update_buffer(u8 source)
> +{
> +	u32 args[] = {source, 0};
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +	return asus_wmi_call_method(ASUSWMI_METHODID_UPDATE_BUFFER, args, &output);
> +}
> +
> +static int asus_wmi_get_sensor_value(u8 index, u32 *value)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	u32 args[] = {index, 0};
> +	union acpi_object *obj;
> +	int err;
> +
> +	err = asus_wmi_call_method(ASUSWMI_METHODID_GET_VALUE, args, &output);
> +	if (err)
> +		return err;
> +
> +	obj = output.pointer;
> +	if (!obj || obj->type != ACPI_TYPE_INTEGER)
> +		return -EIO;
> +
> +	*value = obj->integer.value;
> +
> +	return 0;
> +}
> +
> +static void asus_wmi_update_values_for_source(u8 source, struct asus_wmi_sensors *sensor_data)
> +{
> +	int ret = 0;
> +	int value = 0;
> +	int i;
> +	struct asus_wmi_sensor_info *sensor;
> +
> +	for (i = 0; i < sensor_data->wmi.sensor_count; i++) {
> +		sensor = sensor_data->wmi.info_by_id[i];
> +		if (sensor && sensor->source == source) {
> +			ret = asus_wmi_get_sensor_value(sensor->id, &value);
> +			if (!ret)
> +				sensor->cached_value = value;
> +		}
> +	}
> +}
> +
> +static int asus_wmi_scale_sensor_value(u32 value, int data_type)
> +{
> +	/* FAN_RPM and WATER_FLOW don't need scaling */
> +	switch (data_type) {
> +	case VOLTAGE:
> +		return DIV_ROUND_CLOSEST(value, 1000);
> +	case TEMPERATURE_C:
> +		return value * 1000;
> +	case CURRENT:
> +		return value * 1000;

There should still be a default: case, even if it does nothing.

> +	}
> +	return value;
> +}
> +
> +static int asus_wmi_get_cached_value_or_update(const struct asus_wmi_sensor_info *sensor,
> +					       struct asus_wmi_sensors *sensor_data,
> +					       u32 *value)
> +{
> +	int ret;
> +
> +	if (time_after(jiffies, sensor_data->wmi.source_last_updated[sensor->source] + HZ)) {
> +		ret = asus_wmi_update_buffer(sensor->source);
> +		if (ret)
> +			return -EIO;
> +
> +		sensor_data->wmi.buffer = sensor->source;
> +
> +		asus_wmi_update_values_for_source(sensor->source, sensor_data);
> +		sensor_data->wmi.source_last_updated[sensor->source] = jiffies;
> +	}
> +
> +	*value = sensor->cached_value;
> +	return 0;
> +}
> +
> +/*
> + * Now follow the functions that implement the hwmon interface
> + */
> +
> +static int asus_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, long *val)
> +{
> +	int ret;
> +	u32 value = 0;
> +	const struct asus_wmi_sensor_info *sensor;
> +

Please no empty lines between variable declarations.

> +	struct asus_wmi_sensors *sensor_data = dev_get_drvdata(dev);
> +
> +	sensor = *(sensor_data->wmi.info[type] + channel);
> +
> +	mutex_lock(&sensor_data->lock);
> +	ret = asus_wmi_get_cached_value_or_update(sensor, sensor_data, &value);
> +	mutex_unlock(&sensor_data->lock);
> +	if (!ret)
> +		*val = asus_wmi_scale_sensor_value(value, sensor->data_type);

Error handling first.

	if (ret)
		return ret;

	*val = asus_wmi_scale_sensor_value(value, sensor->data_type);
	return 0;

> +
> +	return ret;
> +}
> +
> +static int asus_wmi_hwmon_read_string(struct device *dev,
> +				      enum hwmon_sensor_types type, u32 attr,
> +				      int channel, const char **str)
> +{
> +	const struct asus_wmi_sensor_info *sensor;
> +	struct asus_wmi_sensors *sensor_data = dev_get_drvdata(dev);
> +
> +	sensor = *(sensor_data->wmi.info[type] + channel);
> +	*str = sensor->name;
> +
> +	return 0;
> +}
> +
> +static umode_t asus_wmi_hwmon_is_visible(const void *drvdata,
> +					 enum hwmon_sensor_types type, u32 attr,
> +					 int channel)
> +{
> +	const struct asus_wmi_sensor_info *sensor;
> +	const struct asus_wmi_sensors *sensor_data = drvdata;
> +
> +	sensor = *(sensor_data->wmi.info[type] + channel);
> +	if (sensor)
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops asus_wmi_hwmon_ops = {
> +	.is_visible = asus_wmi_hwmon_is_visible,
> +	.read = asus_wmi_hwmon_read,
> +	.read_string = asus_wmi_hwmon_read_string,
> +};
> +
> +static struct hwmon_chip_info asus_wmi_chip_info = {
> +	.ops = &asus_wmi_hwmon_ops,
> +	.info = NULL,
> +};
> +
> +static int asus_wmi_configure_sensor_setup(struct device *dev,
> +					   struct asus_wmi_sensors *sensor_data)
> +{
> +	int err;
> +	int i, idx;
> +	int nr_count[hwmon_max] = {0}, nr_types = 0;
> +	struct device *hwdev;
> +	struct hwmon_channel_info *asus_wmi_hwmon_chan;
> +	struct asus_wmi_sensor_info *temp_sensor;
> +	enum hwmon_sensor_types type;
> +	const struct hwmon_channel_info **ptr_asus_wmi_ci;
> +	const struct hwmon_chip_info *chip_info;
> +
> +	sensor_data->wmi.buffer = -1;
> +	temp_sensor = devm_kcalloc(dev, 1, sizeof(*temp_sensor), GFP_KERNEL);
> +	if (!temp_sensor)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < sensor_data->wmi.sensor_count; i++) {
> +		err = asus_wmi_sensor_info(i, temp_sensor);
> +		if (err)
> +			return -EINVAL;
> +
> +		switch (temp_sensor->data_type) {
> +		case TEMPERATURE_C:
> +		case VOLTAGE:
> +		case CURRENT:
> +		case FAN_RPM:
> +		case WATER_FLOW:
> +			type = asus_data_types[temp_sensor->data_type];
> +			if (!nr_count[type])
> +				nr_types++;
> +			nr_count[type]++;
> +			break;
> +		}
> +	}
> +
> +	if (nr_count[hwmon_temp])
> +		nr_count[hwmon_chip]++, nr_types++;

Please no ',' between assignments, and one assignment per line.

> +
> +	asus_wmi_hwmon_chan = devm_kcalloc(dev, nr_types,
> +					   sizeof(*asus_wmi_hwmon_chan),
> +					   GFP_KERNEL);
> +	if (!asus_wmi_hwmon_chan)
> +		return -ENOMEM;
> +
> +	ptr_asus_wmi_ci = devm_kcalloc(dev, nr_types + 1,
> +				       sizeof(*ptr_asus_wmi_ci), GFP_KERNEL);
> +	if (!ptr_asus_wmi_ci)
> +		return -ENOMEM;
> +
> +	asus_wmi_chip_info.info = ptr_asus_wmi_ci;
> +	chip_info = &asus_wmi_chip_info;
> +
> +	sensor_data->wmi.info_by_id = devm_kcalloc(dev, sensor_data->wmi.sensor_count,
> +						   sizeof(*sensor_data->wmi.info_by_id),
> +						   GFP_KERNEL);
> +
> +	if (!sensor_data->wmi.info_by_id)
> +		return -ENOMEM;
> +
> +	for (type = 0; type < hwmon_max; type++) {
> +		if (!nr_count[type])
> +			continue;
> +
> +		asus_wmi_hwmon_add_chan_info(asus_wmi_hwmon_chan, dev,
> +					     nr_count[type], type,
> +					     hwmon_attributes[type]);
> +		*ptr_asus_wmi_ci++ = asus_wmi_hwmon_chan++;
> +
> +		sensor_data->wmi.info[type] = devm_kcalloc(dev,
> +							   nr_count[type],
> +							   sizeof(*sensor_data->wmi.info),
> +							   GFP_KERNEL);
> +		if (!sensor_data->wmi.info[type])
> +			return -ENOMEM;
> +	}
> +
> +	for (i = sensor_data->wmi.sensor_count - 1; i >= 0 ; i--) {
> +		temp_sensor = devm_kzalloc(dev, sizeof(*temp_sensor), GFP_KERNEL);
> +		if (!temp_sensor)
> +			return -ENOMEM;
> +
> +		err = asus_wmi_sensor_info(i, temp_sensor);
> +		if (err)
> +			continue;
> +
> +		switch (temp_sensor->data_type) {
> +		case TEMPERATURE_C:
> +		case VOLTAGE:
> +		case CURRENT:
> +		case FAN_RPM:
> +		case WATER_FLOW:
> +			type = asus_data_types[temp_sensor->data_type];
> +			idx = --nr_count[type];
> +			*(sensor_data->wmi.info[type] + idx) = temp_sensor;
> +			sensor_data->wmi.info_by_id[i] = temp_sensor;
> +			break;
> +		}
> +	}
> +
> +	dev_dbg(dev, "board has %d sensors",
> +		sensor_data->wmi.sensor_count);
> +
> +	hwdev = devm_hwmon_device_register_with_info(dev, KBUILD_MODNAME,
> +						     sensor_data, chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwdev);
> +}
> +
> +static int asus_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct asus_wmi_sensors *sensor_data;
> +	struct device *dev = &wdev->dev;
> +	u32 version = 0;
> +
> +	if (!dmi_check_system(asus_wmi_dmi_table))
> +		return -ENODEV;
> +
> +	sensor_data = devm_kzalloc(dev, sizeof(struct asus_wmi_sensors),
> +				   GFP_KERNEL);
> +	if (!sensor_data)
> +		return -ENOMEM;
> +
> +	if (asus_wmi_get_version(&version))
> +		return -ENODEV;

asus_wmi_get_version() can reeturn the version and error code as return value;
there is no need to pass version as pointer argument. Also, the error
returned form asus_wmi_get_version() should be used and not replaced.

> +
> +	if (asus_wmi_get_item_count(&sensor_data->wmi.sensor_count))
> +		return -ENODEV;
> +
Same here.

> +	if (sensor_data->wmi.sensor_count  <= 0 || version < 2) {

double space before <=

> +		dev_info(dev, "version: %u with %d sensors is unsupported\n",
> +			 version, sensor_data->wmi.sensor_count);
> +
> +		return -ENODEV;
> +	}
> +
> +	mutex_init(&sensor_data->lock);
> +
> +	dev_set_drvdata(dev, sensor_data);
> +
> +	return asus_wmi_configure_sensor_setup(dev,
> +					       sensor_data);

Unnecessary continuation line.

> +}
> +
> +static const struct wmi_device_id asus_wmi_id_table[] = {
> +	{ ASUSWMI_MONITORING_GUID, NULL },
> +	{ }
> +};
> +
> +static struct wmi_driver asus_sensors_wmi_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +	},
> +	.id_table = asus_wmi_id_table,
> +	.probe = asus_wmi_probe,
> +};
> +module_wmi_driver(asus_sensors_wmi_driver);
> +
> +MODULE_AUTHOR("Ed Brindley <kernel@maidavale.org>");
> +MODULE_DESCRIPTION("Asus WMI Sensors Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.33.0
> 
