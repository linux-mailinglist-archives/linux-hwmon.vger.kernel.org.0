Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0CE61A4805
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2020 17:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgDJP5r (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 10 Apr 2020 11:57:47 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34290 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgDJP5r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Apr 2020 11:57:47 -0400
Received: by mail-pg1-f195.google.com with SMTP id l14so1157452pgb.1
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2020 08:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mw5iRhcRTm4w6zDEklf+mqWxFAC/CxTIHdIJdE/3RCA=;
        b=d0rZkBOTWb5jBfVrKkEhCGLSgFaH8xzo3b5YUP82LsSBcQOgZnve/o1s9EKsWv7q6+
         59G6aXgIOuc+L4Kya7kJjczdHmWkTGmdGOO3g7AJrYaCvIy9p6d2hmvEiTzpDvsPlJI5
         UdYqZ6Mzo1eJUG2QZe5NW9UZl96IxtvW76U1EyBXPzvwKgVsb2XxZSFo1vyiu1nihx/P
         JCTI6EANI0dNd1hDZ5AWhDwqA22PnJCmu9+sR4SiX3TSO/jY7OM0KiqrZHRnlmaO3bOx
         5zRivqF9TVgGxV99+zuUsIVJjOF5Lg/WnQbrQsSOtp//CYGgm/Rop0Qmf2uQLeR2QPZA
         E8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mw5iRhcRTm4w6zDEklf+mqWxFAC/CxTIHdIJdE/3RCA=;
        b=JVxazuB8b/H19o36ItAukLjsKhbKLhOjqOnBET2+A+ImB3icUt+zMm7Wi0U9/qdYjK
         pl7bWh4ZnuTgKkMnAE7KhGZKxac0ieioAwD07lTTiVlyInm0KHfGAFcoaDAqmWwrv0Yw
         aINDvvD6ZuMnCZOMzOCsNEaC7sp/c27KtmIIgNNaar4INysiQi+IniWwPnjGyaeNfmzW
         CTUuPwWjSmAnRLhhl29xAFTihtfFvHUklOTesQurW1nSvf/WQVyF92KEff23XxPkTMh3
         ZuVOoyDjAGshehqjC8zbBogP3PCBFFpgjsUYx86bjAPiu5DqJu4f2zEqtmUlC0iDVAj2
         1zIw==
X-Gm-Message-State: AGi0PuayASqGzDPObm0VzXhUol/VAtx3SHu5Req9fwAsLOFSvWUUV5k7
        ldClaSuMF3bNzOaFHVc16jg=
X-Google-Smtp-Source: APiQypIrJNxXbow4TTckVeSTEhityVX9LdXNtXfXnDV4SyM8fGUvyHYaQApfcmeS+uyjuD1Ryl/41g==
X-Received: by 2002:a62:d10b:: with SMTP id z11mr5483389pfg.205.1586534265923;
        Fri, 10 Apr 2020 08:57:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o128sm2035080pfb.58.2020.04.10.08.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 08:57:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] hwmon: Add amd_energy driver to report energy
 counters
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com
References: <20200409153939.38730-1-nchatrad@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e0d1a13c-e475-2b9f-c951-92aeb1dce9c0@roeck-us.net>
Date:   Fri, 10 Apr 2020 08:57:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200409153939.38730-1-nchatrad@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/9/20 8:39 AM, Naveen Krishna Chatradhi wrote:
> This patch adds hwmon based amd_energy driver support for
> family 17h processors from AMD.
> 
> The driver provides following interface to the userspace
> 1. Reports the per core and per socket energy consumption
>    via sysfs entries created per core and per socket respectively.
>     * per core energy consumed via "core_energy%d_input"
>     * package/socket energy consumed via "sock_energy%d_input".
> 2. Uses topology_max_packages() to get number of sockets.
> 3. Uses num_present_cpus() to get the number of CPUs.
> 4. Reports the energy units via energy_unit sysfs entry
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/amd_energy.c | 273 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 284 insertions(+)
>  create mode 100644 drivers/hwmon/amd_energy.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 05a30832c6ba..d83f1403b429 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -324,6 +324,16 @@ config SENSORS_FAM15H_POWER
>  	  This driver can also be built as a module. If so, the module
>  	  will be called fam15h_power.
>  
> +config SENSORS_AMD_ENERGY
> +	tristate "AMD RAPL MSR based Energy driver"
> +	depends on X86
> +	help
> +	  If you say yes here you get support for core and package energy
> +	  sensors, based on RAPL MSR for AMD family 17h and above CPUs.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called as amd_energy.
> +
>  config SENSORS_APPLESMC
>  	tristate "Apple SMC (Motion sensor, light sensor, keyboard backlight)"
>  	depends on INPUT && X86
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b0b9c8e57176..318f89dc7133 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_ADT7411)	+= adt7411.o
>  obj-$(CONFIG_SENSORS_ADT7462)	+= adt7462.o
>  obj-$(CONFIG_SENSORS_ADT7470)	+= adt7470.o
>  obj-$(CONFIG_SENSORS_ADT7475)	+= adt7475.o
> +obj-$(CONFIG_SENSORS_AMD_ENERGY) += amd_energy.o
>  obj-$(CONFIG_SENSORS_APPLESMC)	+= applesmc.o
>  obj-$(CONFIG_SENSORS_ARM_SCMI)	+= scmi-hwmon.o
>  obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> new file mode 100644
> index 000000000000..ddb7073ae39b
> --- /dev/null
> +++ b/drivers/hwmon/amd_energy.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2019 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/device.h>
> +#include <linux/sysfs.h>
> +#include <linux/cpu.h>
> +#include <linux/list.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/processor.h>
> +#include <linux/platform_device.h>
> +#include <linux/cpumask.h>

Alphabetic include file order, please.

> +
> +#include <asm/cpu_device_id.h>
> +
> +#define DRVNAME	"amd_energy"
> +
> +#define ENERGY_PWR_UNIT_MSR	0xC0010299
> +#define ENERGY_CORE_MSR	0xC001029A
> +#define ENERGY_PCK_MSR		0xC001029B
> +
> +#define AMD_TIME_UNIT_MASK	0xF0000
> +#define AMD_ENERGY_UNIT_MASK	0x01F00
> +#define AMD_POWER_UNIT_MASK	0x0000F
> +
> +#define ENERGY_STATUS_MASK	0xffffffff
> +
> +#define AMD_FAM_17		0x17 /* ZP, SSP */
> +
> +/* Useful macros */
> +#define AMD_CPU_FAM_ANY(_family, _model)	\
> +{						\
> +	.vendor		= X86_VENDOR_AMD,	\
> +	.family		= _family,		\
> +	.model		= _model,		\
> +	.feature	= X86_FEATURE_ANY,	\
> +}
> +
> +#define AMD_CPU_FAM(_model)			\
> +	AMD_CPU_FAM_ANY(AMD_FAM_##_model, X86_MODEL_ANY)
> +
> +static struct device_attribute units_attr;
> +
> +struct sensor_data {
> +	unsigned int scale;
> +	union {
> +		unsigned int cpu_nr;
> +		unsigned int sock_nr;
> +	};
> +	struct device_attribute dev_attr_input;
> +	char input[32];
> +};
> +
> +struct amd_energy_sensors {
> +	struct sensor_data *data;
> +	struct attribute **attrs;
> +	struct attribute_group group;
> +	const struct attribute_group *groups[1];

Even if acceptable, this would be wrong. The list of groups
ends with an empty entry, meaning this array would have to have
at least two entries (one for the terminator).

> +};
> +
> +static ssize_t amd_units_u64_show(struct device *dev,
> +	struct device_attribute *dev_attr, char *buffer)
> +{
> +	uint64_t rapl_units;
> +	uint64_t energy_unit;
> +	int ret = 0;
> +
> +	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> +	if (ret)
> +		return -EAGAIN;
> +
> +	energy_unit = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> +
> +	return snprintf(buffer, 24, "%llu\n", energy_unit);
> +}
> +
> +static ssize_t amd_core_u64_show(struct device *dev,
> +		struct device_attribute *dev_attr, char *buffer)
> +{
> +	unsigned long long value;
> +	struct sensor_data *sensor;
> +	int ret = 0;
> +
> +	sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> +	ret = rdmsrl_safe_on_cpu(sensor->cpu_nr, ENERGY_CORE_MSR, &value);
> +	if (ret)
> +		return -EAGAIN;
> +
> +	return snprintf(buffer, 24, "%llu\n", value);

It seems to me this reports raw values. This is unacceptable. Values need
to be scaled to match the ABI. Energy is reported in microJoule.

> +}
> +
> +static ssize_t amd_sock_u64_show(struct device *dev,
> +		struct device_attribute *dev_attr, char *buffer)
> +{
> +	unsigned long long value;
> +	struct sensor_data *sensor;
> +	int ret = 0;
> +	int cpu, cpu_nr;
> +
> +	sensor = container_of(dev_attr, struct sensor_data, dev_attr_input);
> +
> +	for_each_possible_cpu(cpu) {
> +		struct cpuinfo_x86 *c = &cpu_data(cpu);
> +
> +		if (c->initialized && c->logical_die_id == sensor->sock_nr) {
> +			cpu_nr = cpu;
> +			break;
> +		}
> +		cpu_nr = 0;
> +	}
> +
> +	ret = rdmsrl_safe_on_cpu(cpu_nr, ENERGY_PCK_MSR, &value);
> +	if (ret)
> +		return -EAGAIN;
> +
> +	return snprintf(buffer, 24, "%llu\n", value);
> +}
> +
> +static int amd_energy_probe(struct platform_device *pdev)
> +{
> +	struct amd_energy_sensors *amd_sensors;
> +	struct device *hwdev, *dev = &pdev->dev;
> +	int nr_cpus, nr_socks, idx = 0;
> +
> +	nr_cpus = num_present_cpus();
> +	nr_socks = topology_max_packages();
> +
> +	amd_sensors = devm_kzalloc(dev, sizeof(*amd_sensors), GFP_KERNEL);
> +	if (!amd_sensors)
> +		return -ENOMEM;
> +
> +	amd_sensors->data = devm_kcalloc(dev, nr_cpus + nr_socks,
> +				sizeof(*amd_sensors->data), GFP_KERNEL);
> +	if (!amd_sensors->data)
> +		return -ENOMEM;
> +
> +	amd_sensors->attrs = devm_kcalloc(dev, nr_cpus + nr_socks,
> +				sizeof(*amd_sensors->attrs), GFP_KERNEL);
> +	if (!amd_sensors->attrs)
> +		return -ENOMEM;
> +
> +	/* populate attributes for number of cpus. */
> +	for (idx = 0; idx < ; idx++) {
> +		struct sensor_data *sensor = &amd_sensors->data[idx];
> +
> +		snprintf(sensor->input, sizeof(sensor->input),
> +				"core_energy%d_input", idx);
> +

This is unacceptable. Please use standard attributes (energyX_input).
If you want to report what the sensor is for, use labels.

> +		sensor->dev_attr_input.attr.mode = 0444;
> +		sensor->dev_attr_input.attr.name = sensor->input;
> +		sensor->dev_attr_input.show = amd_core_u64_show;
> +
> +		sensor->cpu_nr = idx;
> +		amd_sensors->attrs[idx] = &sensor->dev_attr_input.attr;
> +
> +		sysfs_attr_init(amd_sensors->attrs[idx]);
> +	}
> +
> +	/* populate attributes for number of sockets. */
> +	for (idx = 0; idx < nr_socks; idx++) {
> +		struct sensor_data *sensor =
> +			&amd_sensors->data[nr_cpus + idx];
> +
> +		snprintf(sensor->input,
> +			sizeof(sensor->input), "sock_energy%d_input", idx);
> +
> +		sensor->dev_attr_input.attr.mode = 0444;
> +		sensor->dev_attr_input.attr.name = sensor->input;
> +		sensor->dev_attr_input.show = amd_sock_u64_show;
> +
> +		sensor->sock_nr = idx;
> +		amd_sensors->attrs[nr_cpus + idx] =
> +			&sensor->dev_attr_input.attr;
> +
> +		sysfs_attr_init(amd_sensors->attrs[nr_cpus + idx]);
> +	}

This all makes me wonder what is reported for inactive/disabled CPUs.

> +
> +	amd_sensors->group.attrs = amd_sensors->attrs;
> +	amd_sensors->groups[0] = &amd_sensors->group;
> +
> +	platform_set_drvdata(pdev, amd_sensors);
> +
> +	hwdev = devm_hwmon_device_register_with_groups(dev,
> +			"amd_energy", amd_sensors, amd_sensors->groups);

Please rework the driver to use the devm_hwmon_device_register_with_info() API.

> +	if (!hwdev)
> +		return PTR_ERR_OR_ZERO(hwdev);
> +
> +	/* populate attributes for energy units */
> +	units_attr.attr.name = "energy_units";
> +	units_attr.attr.mode = 0444;
> +	units_attr.show = amd_units_u64_show;
> +
> +	return sysfs_create_file(&hwdev->kobj, &units_attr.attr);

This is irrelevant for this driver. Units are fixed. Besides, registering
sysfs attributes after driver registration is racy and won't be accepted.
Non-standard attributes can be added with the groups argument of
devm_hwmon_device_register_with_info() (not that I see any here).

> +}
> +
> +static int amd_energy_remove(struct platform_device *pdev)
> +{
> +	sysfs_remove_file(&pdev->dev.kobj, &units_attr.attr);
> +	return 0;
> +}
> +
> +static const struct platform_device_id amd_energy_ids[] = {
> +	{ .name = DRVNAME, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, amd_energy_ids);
> +
> +static struct platform_driver amd_energy_driver = {
> +	.probe = amd_energy_probe,
> +	.remove	= amd_energy_remove,
> +	.id_table = amd_energy_ids,
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +};
> +
> +static struct platform_device *amd_energy_platdev;
> +
> +static const struct x86_cpu_id cpu_ids[] __initconst = {
> +	AMD_CPU_FAM(17),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> +
> +static int __init amd_energy_init(void)
> +{
> +	const struct x86_cpu_id *id;
> +	int ret;
> +
> +	id = x86_match_cpu(cpu_ids);
> +	if (!id) {
> +		pr_err("driver does not support CPU family %d model %d\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +

This is not an error and thus does not warrant an error message.

> +		return -ENODEV;
> +	}
> +
> +	ret = platform_driver_register(&amd_energy_driver);
> +	if (ret < 0)
> +		return ret;
> +
> +	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> +	if (!amd_energy_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_energy_platdev);
> +	if (ret) {
> +		platform_device_unregister(amd_energy_platdev);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit amd_energy_exit(void)
> +{
> +	platform_device_unregister(amd_energy_platdev);
> +	platform_driver_unregister(&amd_energy_driver);
> +}
> +
> +module_init(amd_energy_init);
> +module_exit(amd_energy_exit);
> +
> +MODULE_DESCRIPTION("Driver for AMD Energy reporting from RAPL MSR via HWMON interface");
> +MODULE_AUTHOR("Naveen Krishna Chatradhi <nchatrad@amd.com>");
> +MODULE_LICENSE("GPL");
> 

