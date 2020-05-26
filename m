Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722051C7973
	for <lists+linux-hwmon@lfdr.de>; Wed,  6 May 2020 20:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbgEFSco (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 6 May 2020 14:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729313AbgEFScn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 6 May 2020 14:32:43 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E68C061A0F
        for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2020 11:32:42 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id a4so1505980pgc.0
        for <linux-hwmon@vger.kernel.org>; Wed, 06 May 2020 11:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2sDqeZqC7ld2T14enYaGBZfz0cMHxgReQvtQdj+GE5A=;
        b=U6dwBxPLJZFNvq1MKSRKpp4FYIsKqMblcAv6h3TmVC8Tm3HEb16EVu2YEsSyYiTBzI
         O5LT7yaRLDUGeZBxeNxpYbek0aA4RWkMaPq0ZgnLJiDsHJHKHkV2NuELRZJsNDLHavBa
         exflkl/ki8WXjgMzx/UhXt8tU5H0AVyWSHIJdYSYUkmWKH0WjcGy3cio1IseDt7ETdt1
         p7f/zfCEZkekWA8/32cGs3ubV1wqd4fcEZ9iJOPW05UtcbFUcZF4ugYUnc9hGATUej57
         LmMYdcy0ozyErl7jF3QVcYWh9kRL4ipp7RzxMT1sa0ft0oAJ6U+hEEG/S24Dnw36abzB
         /GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2sDqeZqC7ld2T14enYaGBZfz0cMHxgReQvtQdj+GE5A=;
        b=HmwfKs39/bIvLzbbKjqO87CvOD97cgUZY+ioM0Jzq95pfNx99gkYWoIsB8lcOr98dC
         YCxvvvye+zkyapAwNq8NiaG7r+VaZcBit5YRk07C/qEflm+76sxj+oySuBtndSh2Ha+P
         W9645TwMPkecAW5mxB35S73WN30Mj87Da0snNCeZNEfEAcwrjP7qVBYjU/mfPKs98v8y
         s7N/MRCAPxA70oS0IILwol82ZOFxu93m0SeYPodppz2TQe+wTCa0NdAFkTCXrlE57FzK
         Gdi3QdDxEYL/NAr0rkmp9q6dgKPBIyMKGfmIWS6dnmFCuHnohe7YfnjiMGP/utWvPRce
         HAuA==
X-Gm-Message-State: AGi0PubC1GcUgaFGzmVrMMa39Gx1kRoKeaInXvbmcC/0FtH/3Ee50Pu6
        ngCvnyqnp8X8WmejzM9ZY9Q=
X-Google-Smtp-Source: APiQypLUEDHJW1h4ljnj7dbR5RlwaHpz67wJ96eHaKxIBJcddbkeO7GnUcNLAVeKCzI/0oCgSDiEMA==
X-Received: by 2002:a65:4c45:: with SMTP id l5mr7231082pgr.405.1588789961691;
        Wed, 06 May 2020 11:32:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y21sm2407340pfm.219.2020.05.06.11.32.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 May 2020 11:32:40 -0700 (PDT)
Date:   Wed, 6 May 2020 11:32:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH 1/3] hwmon: Add amd_energy driver to report energy
 counters
Message-ID: <20200506183239.GA246606@roeck-us.net>
References: <20200501175003.28613-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501175003.28613-1-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 01, 2020 at 11:20:01PM +0530, Naveen Krishna Chatradhi wrote:
> This patch adds hwmon based amd_energy driver support for
> family 17h processors from AMD.
> 
> The driver provides following interface to the userspace
> 1. Reports the per core consumption
> 	* file: "energy%d_input", label: "Ecore%03d"
> 2. Reports per socket energy consumption
> 	* file: "energy%d_input", label: "Esocket%d"
> 3. To, increase the wrap around time of the socket energy
>    counters, a 64bit accumultor is implemented.
> 4. Reports scaled energy value in Joules.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

When running the code, I still see that both hyperthreading siblings are
reported. On Ryzen 3900X:

amd_energy-isa-0000
Adapter: ISA adapter
Ecore000:    740.54 J
Ecore001:    618.91 J
Ecore002:    565.79 J
Ecore003:    629.43 J
Ecore004:    602.00 J
Ecore005:    610.42 J
Ecore006:    447.83 J
Ecore007:    443.74 J
Ecore008:    436.55 J
Ecore009:    445.41 J
Ecore010:    442.97 J
Ecore011:    445.35 J
Ecore012:    740.54 J	<--- everything from here is duplicates
Ecore013:    618.91 J
Ecore014:    565.79 J
Ecore015:    629.43 J
Ecore016:    602.00 J
Ecore017:    610.42 J
Ecore018:    447.83 J
Ecore019:    443.74 J
Ecore020:    436.55 J
Ecore021:    445.41 J
Ecore022:    442.97 J
Ecore023:    445.35 J
Esocket0:     74.62 kJ

That does not make sense. Please filter out hyperthreading siblings.

Also, adding up the individual cores from the output above results
in 6.428 kJ, which is far off the 74.62 kJ reported for the socket.
The driver was instantiated during boot, so I'd expect no overflow.
Also, a couple of minutes later I see 6.497 kJ vs. 87.73 kJ.
So the socket accumuulated some 13 kJ while the individual cores
only accumulated a miniscule .069 kJ.

Looking at my 3900X system with an uptime of 30 minutes, I see ~107 kJ
energy for the socket. That translates to an average power consumption
of ~60W, which seems high for an idle system. On the other side,
individual cores show 450 - 750 Joule, which translates to an average
power consumption between ~0.25W and ~0.41W per core.

Letting the system run for a minute under load, I noticed two things:
- The socket counter wrapped, even though the kernel thread is running
  (it reported 122.33 kJ initially and 77.85 kJ after one minute).
- Per-core energy consumption for one minute under load is ~500 Joule,
  which translates to ~8W, or ~96W total with 12 cores. That makes
  sense, but it suggests that the socket energy counter is way off.

Do you have an explanation for the difference and the numbers ?

Thanks,
Guenter

> ---
> Changes in v5:
> 1. To improve wrap around time. A kernel thread is implemented
>    to accumulate the socket energy counters into a 64bit.
> 2. Address other comments from Guenter.
> 
>  drivers/hwmon/Kconfig      |  10 ++
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/amd_energy.c | 329 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 340 insertions(+)
>  create mode 100644 drivers/hwmon/amd_energy.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 4c62f900bf7e..e165e10c49ef 100644
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
> index 000000000000..16364576f067
> --- /dev/null
> +++ b/drivers/hwmon/amd_energy.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2020 Advanced Micro Devices, Inc.
> + */
> +#include <asm/cpu_device_id.h>
> +
> +#include <linux/bits.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/processor.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#define DRVNAME			"amd_energy"
> +
> +#define ENERGY_PWR_UNIT_MSR	0xC0010299
> +#define ENERGY_CORE_MSR		0xC001029A
> +#define ENERGY_PKG_MSR		0xC001029B
> +
> +#define AMD_ENERGY_UNIT_MASK	0x01F00
> +
> +struct amd_energy_data {
> +	struct hwmon_channel_info energy_info;
> +	const struct hwmon_channel_info *info[2];
> +	struct hwmon_chip_info chip;
> +	/* Lock around the accumulator */
> +	struct mutex lock;
> +	/* Energy Status Units */
> +	u64 energy_units;
> +	/* An accumulator for each socket */
> +	u64 *energy_ctrs;
> +	u64 *prev_value;
> +};
> +
> +/* */
> +struct task_struct *wrap_accumulate;
> +static int nr_cpus, nr_socks;
> +
> +static int amd_energy_read_labels(struct device *dev,
> +				  enum hwmon_sensor_types type,
> +				 u32 attr, int channel,
> +				 const char **str)
> +{
> +	char *buf = devm_kcalloc(dev, 10, sizeof(char), GFP_KERNEL);
> +
> +	if (channel >= nr_cpus)
> +		scnprintf(buf, 9, "Esocket%u", channel - nr_cpus);
> +	else
> +		scnprintf(buf, 9, "Ecore%03u", channel);
> +
> +	*str = buf;
> +
> +	return 0;
> +}
> +
> +static int get_energy_units(struct amd_energy_data *data)
> +{
> +	u64 rapl_units;
> +	int ret;
> +
> +	ret = rdmsrl_safe(ENERGY_PWR_UNIT_MSR, &rapl_units);
> +	if (ret)
> +		return ret;
> +
> +	data->energy_units = (rapl_units & AMD_ENERGY_UNIT_MASK) >> 8;
> +	return 0;
> +}
> +
> +static int read_accumulate(struct amd_energy_data *data)
> +{
> +	int ret, cu;
> +	u64 input = 0;
> +
> +	for (cu = 0; cu < nr_socks; cu++) {
> +		int cpu;
> +
> +		cpu = cpumask_first_and(cpu_online_mask,
> +					cpumask_of_node(cu));
> +
> +		ret = rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> +		if (ret)
> +			return ret;
> +
> +		if (input > data->prev_value[cu])
> +			data->energy_ctrs[cu] +=
> +				input - data->prev_value[cu];
> +		else
> +			data->energy_ctrs[cu] +=
> +				UINT_MAX - data->prev_value[cu] + input;
> +
> +		data->prev_value[cu] = input;
> +	}
> +		return 0;
> +}
> +
> +static int amd_energy_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(dev);
> +	int ret, cpu;
> +	u32 reg;
> +	u64 input;
> +
> +	if (channel >= nr_cpus) {
> +		reg = ENERGY_PKG_MSR;
> +		cpu = cpumask_first_and(cpu_online_mask,
> +					cpumask_of_node
> +					(channel - nr_cpus));
> +	} else {
> +		reg = ENERGY_CORE_MSR;
> +		cpu = channel;
> +	}
> +
> +	if (!cpu_online(cpu))
> +		return -ENODEV;
> +
> +	if (data->energy_units == 0 && get_energy_units(data))
> +		return -EAGAIN;
> +
> +	mutex_lock(&data->lock);
> +	ret = rdmsrl_safe_on_cpu(cpu, reg, &input);
> +	if (ret)
> +		return -EAGAIN;
> +
> +	/* Accumulation is for sockets only */
> +	if (channel >= nr_cpus)
> +		input += data->energy_ctrs[channel - nr_cpus];
> +
> +	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) Joules */
> +	*val = (long)input * div64_ul(1000000UL,
> +				      BIT(data->energy_units));
> +	mutex_unlock(&data->lock);
> +
> +	return 0;
> +}
> +
> +static umode_t amd_energy_is_visible(const void *_data,
> +				     enum hwmon_sensor_types type,
> +				     u32 attr, int channel)
> +{
> +	return 0444;
> +}
> +
> +static int socket_accumulator(void *p)
> +{
> +	struct amd_energy_data *data = (struct amd_energy_data *)p;
> +
> +	while (!kthread_should_stop()) {
> +		mutex_lock(&data->lock);
> +		read_accumulate(data);
> +		mutex_unlock(&data->lock);
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		if (kthread_should_stop())
> +			break;
> +
> +		/*
> +		 * On a 240W system, the Socket Energy status
> +		 * register may wrap around in
> +		 * 2^32*15.3 e-6/240 = 273.8041 secs (~4.5 mins)
> +		 *
> +		 * let us accumulate for every 100secs
> +		 */
> +		schedule_timeout(msecs_to_jiffies(100000));
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_ops amd_energy_ops = {
> +	.is_visible = amd_energy_is_visible,
> +	.read = amd_energy_read,
> +	.read_string = amd_energy_read_labels,
> +};
> +
> +static int amd_create_sensor(struct device *dev,
> +			     struct amd_energy_data *data,
> +			     u8 type, u32 config)
> +{
> +	int i;
> +	u32 *s_config;
> +
> +	struct hwmon_channel_info *info = &data->energy_info;
> +
> +	nr_socks = num_possible_nodes();
> +	nr_cpus = num_present_cpus();
> +
> +	s_config = devm_kcalloc(dev, nr_cpus + nr_socks,
> +				sizeof(u32), GFP_KERNEL);
> +	if (!s_config)
> +		return -ENOMEM;
> +
> +	data->energy_ctrs = devm_kcalloc(dev, nr_socks,
> +					 sizeof(u64), GFP_KERNEL);
> +	if (!data->energy_ctrs)
> +		return -ENOMEM;
> +
> +	data->prev_value = devm_kcalloc(dev, nr_socks,
> +					sizeof(u64), GFP_KERNEL);
> +	if (!data->prev_value)
> +		return -ENOMEM;
> +
> +	info->type = type;
> +	info->config = s_config;
> +
> +	for (i = 0; i < nr_cpus + nr_socks; i++)
> +		s_config[i] = config;
> +
> +	return 0;
> +}
> +
> +static int amd_energy_probe(struct platform_device *pdev)
> +{
> +	struct device *hwmon_dev;
> +	struct amd_energy_data *data;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	data = devm_kzalloc(dev,
> +			    sizeof(struct amd_energy_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->chip.ops = &amd_energy_ops;
> +	data->chip.info = data->info;
> +
> +	/* Populate per-core energy reporting */
> +	data->info[0] = &data->energy_info;
> +	amd_create_sensor(dev, data,  hwmon_energy,
> +			  HWMON_E_INPUT | HWMON_E_LABEL);
> +
> +	mutex_init(&data->lock);
> +
> +	ret = get_energy_units(data);
> +	if (ret)
> +		return ret;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, DRVNAME,
> +							 data,
> +							 &data->chip,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	wrap_accumulate = kthread_run(socket_accumulator, data,
> +				      "%s", dev_name(hwmon_dev));
> +	if (IS_ERR(wrap_accumulate))
> +		return PTR_ERR(wrap_accumulate);
> +
> +	return 0;
> +}
> +
> +static int amd_energy_remove(struct platform_device *pdev)
> +{
> +	if (wrap_accumulate)
> +		kthread_stop(wrap_accumulate);
> +
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
> +	X86_MATCH_VENDOR_FAM(AMD, 0x17, NULL),
> +	X86_MATCH_VENDOR_FAM(AMD, 0x19, NULL),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, cpu_ids);
> +
> +static int __init amd_energy_init(void)
> +{
> +	int ret;
> +
> +	if (!x86_match_cpu(cpu_ids))
> +		return -ENODEV;
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
