Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033001D59C8
	for <lists+linux-hwmon@lfdr.de>; Fri, 15 May 2020 21:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgEOTP7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 15 May 2020 15:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOTP6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 May 2020 15:15:58 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C263EC061A0C
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2020 12:15:58 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y18so1415513pfl.9
        for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2020 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rtspSnptyFaJ3eYNapeXuSeWfYuCKAMnpFpECV5kiRw=;
        b=gYTym0cK2GL0jseyStPUWYEaNygmUe17j5speYbvijcxRMLaPIbPdc/f5gxhWt4I2M
         pJogldG1hUY90CiEzK+o1EcBB1YEtbitlVJTXqcN7XmqByccN77zW6VNC7mwwb4cNrIg
         iR8vMZdHOkQBwkGRiJQNPiXXAIP76oPqH327z4daZ5pYxXLbrUtYM7i1lB9gfs7I+49I
         A7XxbD+/7THwKn1RboedbseKGJiFm0KzHCj3FhogfRSq1Ai3ZE8KEdvHmbi3IF6nIVua
         ul1NmSt6OZevcGFhrspnPNb+WePXP/bbh+SQRBgsjt5Qrxtrb5vk9+uVoimKTLpe+Eiw
         6nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=rtspSnptyFaJ3eYNapeXuSeWfYuCKAMnpFpECV5kiRw=;
        b=s2YhJS7iLvDztegNGYd5TtqXK8FZTd+A3D1JSntziemhDW2z4mMDeIANAP/kYMkkA3
         ush0RWHafmA5ArawJqRoRHq/09QSI+EFmgRC+SOn23o1RTTMZf3avbpvALAotz2/QOtk
         hPJB2cUVe5jTRKibpcKMqVocNqysjN8D7WcxqHpp64rIjjcvpP6OjQBtGG1YTiQFvwOp
         cReLrFzCmPqCYvhoEtIkDDJTnzanIQ2kj4PfNoKLdE+6e/ij6lf0p7itKA+yAqewtxU+
         Y8YMCpPR/yIvDEUaHXKgKs56O89SD3rGmv+BvER8Ir9R2we4SRgz+cdWY8yJR0sHGemk
         noQw==
X-Gm-Message-State: AOAM530wFVm/L6c0z0cg8dLIOAk/JoU+0tW4h1LIqIxFrS7mW+pEPwQG
        c8oLnGuRjVfcEXTFIgoG3hio09ZS
X-Google-Smtp-Source: ABdhPJww2wJeB1Z304AyGFqSOt8yz6LNqgbiBVloH8A7o1oMy3SqMpnYgJ56TlGugyRLHy/a39Z5+w==
X-Received: by 2002:a63:ce10:: with SMTP id y16mr4432942pgf.368.1589570158108;
        Fri, 15 May 2020 12:15:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v189sm2472147pfv.176.2020.05.15.12.15.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 12:15:57 -0700 (PDT)
Date:   Fri, 15 May 2020 12:15:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     linux-hwmon@vger.kernel.org, naveenkrishna.ch@gmail.com
Subject: Re: [PATCH 1/3 v6] hwmon: Add amd_energy driver to report energy
 counters
Message-ID: <20200515191555.GA200810@roeck-us.net>
References: <20200515185234.30687-1-nchatrad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200515185234.30687-1-nchatrad@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 16, 2020 at 12:22:32AM +0530, Naveen Krishna Chatradhi wrote:
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
> ---
> Changes in v6:
> 1. Implement core accumulation
> 2. Remove enumurating sibling threads
> 3. Fix bug in accumulation
> 4. Few other minor comments addressed
> 
>  drivers/hwmon/Kconfig      |  10 +
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/amd_energy.c | 413 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 424 insertions(+)
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
> index 000000000000..f2cd5e2e1339
> --- /dev/null
> +++ b/drivers/hwmon/amd_energy.c
> @@ -0,0 +1,413 @@
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
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/processor.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/topology.h>
> +#include <linux/types.h>
> +
> +#define DRVNAME			"amd_energy"
> +
> +#define ENERGY_PWR_UNIT_MSR	0xC0010299
> +#define ENERGY_CORE_MSR		0xC001029A
> +#define ENERGY_PKG_MSR		0xC001029B
> +
> +#define AMD_ENERGY_UNIT_MASK	0x01F00
> +#define AMD_ENERGY_MASK		0xFFFFFFFF
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
> +	u64 *sock_energy_ctrs;
> +	u64 *core_energy_ctrs;
> +	u64 *sock_prev_value;
> +	u64 *core_prev_value;
> +};
> +
> +static struct task_struct *wrap_accumulate;
> +static int nr_cpus, nr_socks;

I don't think any of the above need to be static variables
and could be added to struct amd_energy_data.

> +static char buf[10];
> +
> +static int amd_energy_read_labels(struct device *dev,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel,
> +				  const char **str)
> +{
> +	if (channel >= nr_cpus)
> +		scnprintf(buf, 10, "Esocket%u", channel - nr_cpus);
> +	else
> +		scnprintf(buf, 10, "Ecore%03u", channel);
> +

That won't work. It assumes that the calling function is adding protection
against overwriting buf. If you run multiple threads in parallel which all
access different labels, you'll get more or less random data returned.
Worse, a thread may be busy writing into buf while another thread is
reading from it, enabling responses such as, say, "Esocke05". The only
solution I can imagine is a data structure referenced from truct
md_energy_data which points to a set of pre-allocated strings.

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
> +static void amd_accumulate_delta(struct amd_energy_data *data,
> +				 u64 input, int cu, bool is_core)
> +{
> +	input &= AMD_ENERGY_MASK;
> +
> +	mutex_lock(&data->lock);
> +	if (!is_core) {
> +		if (input >= data->sock_prev_value[cu])
> +			data->sock_energy_ctrs[cu] +=
> +				input - data->sock_prev_value[cu];
> +		else
> +			data->sock_energy_ctrs[cu] += UINT_MAX -
> +				data->sock_prev_value[cu] + input;
> +
> +		data->sock_prev_value[cu] = input;
> +	} else {
> +		if (input >= data->core_prev_value[cu])
> +			data->core_energy_ctrs[cu] +=
> +				input - data->core_prev_value[cu];
> +		else
> +			data->core_energy_ctrs[cu] += UINT_MAX -
> +				data->core_prev_value[cu] + input;
> +
> +		data->core_prev_value[cu] = input;
> +	}
> +	mutex_unlock(&data->lock);
> +}
> +
> +static int read_accumulate(struct amd_energy_data *data)
> +{
> +	int ret, cu;
> +	u64 input = 0, core_input = 0;
> +	static int core_id;

Any chance you can store core_id in struct amd_energy_data ?

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

Returning an error from this function is pretty pointless.

> +
> +		amd_accumulate_delta(data, input, cu, false);
> +	}
> +
> +	if (core_id >= nr_cpus)
> +		core_id = 0;
> +
> +	if (!cpu_online(core_id)) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	ret = rdmsrl_safe_on_cpu(core_id, ENERGY_CORE_MSR, &core_input);
> +	if (ret)
> +		goto out;
> +
> +	amd_accumulate_delta(data, core_input, core_id, true);
> +
> +out:
> +	core_id++;
> +	return ret;
> +}
> +
> +static void amd_add_delta(struct amd_energy_data *data,
> +			  u64 *input, int ch, bool is_core)
> +{
> +	mutex_lock(&data->lock);
> +	if (!is_core) {
> +		if (*input >= data->sock_prev_value[ch])
> +			*input += data->sock_energy_ctrs[ch] -
> +				  data->sock_prev_value[ch];
> +		else
> +			*input += UINT_MAX - data->sock_prev_value[ch] +
> +				  data->sock_energy_ctrs[ch];
> +	} else {
> +		if (*input >= data->core_prev_value[ch])
> +			*input += data->core_energy_ctrs[ch] -
> +				 data->core_prev_value[ch];
> +		else
> +			*input += UINT_MAX - data->core_prev_value[ch] +
> +				 data->core_energy_ctrs[ch];
> +	}
> +	mutex_unlock(&data->lock);
> +}
> +
> +static int amd_energy_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	struct amd_energy_data *data = dev_get_drvdata(dev);
> +	int ret, cpu;
> +	u64 input;
> +	bool is_core;
> +
> +	if (channel >= nr_cpus) {
> +		is_core = false;
> +		channel = channel - nr_cpus;
> +		cpu = cpumask_first_and(cpu_online_mask,
> +					cpumask_of_node
> +					(channel));
> +		ret = rdmsrl_safe_on_cpu(cpu, ENERGY_PKG_MSR, &input);
> +		if (ret)
> +			return -EAGAIN;

From my experience, and looking into other code, such errors tend to be
permanent. I see two issues with this code: One, static analyzers will
likely complain that error codes are overwritten, and hard errors will
result in endless retry loops.

> +	} else {
> +		is_core = true;
> +		cpu = channel;
> +		if (!cpu_online(cpu))
> +			return -ENODEV;
> +
> +		ret = rdmsrl_safe_on_cpu(cpu, ENERGY_CORE_MSR, &input);
> +		if (ret)
> +			return -EAGAIN;
> +	}
> +
> +	input &= AMD_ENERGY_MASK;
> +	amd_add_delta(data, &input, channel, is_core);
> +
I am a bit concerned that input is read first and passed to amd_add_delta()
unlocked. That means process 1 can read it, followed by process 2. If
process 2 gets the mutex in amd_add_delta() first, it will add a larger
value, followed by the older value from process 1. It would be much safer
to protect the entire read-update code with the mutex.

> +	if (data->energy_units == 0 && get_energy_units(data))
> +		return -EAGAIN;
> +
> +	/* Energy consumed = (1/(2^ESU) * RAW * 1000000UL) μJoules */
> +	*val = (long)div64_ul(input * 1000000UL,
> +				      BIT(data->energy_units));

Alignment seems to be off here. Please run checkpatch --strict.
Also, is the typecast really needed ?

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
> +static int energy_accumulator(void *p)
> +{
> +	struct amd_energy_data *data = (struct amd_energy_data *)p;
> +
> +	while (!kthread_should_stop()) {
> +		/*
> +		 * Ignoring the conditions such as
> +		 * cpu being offline or rdmsr failure
> +		 */
> +		read_accumulate(data);
> +
> +		set_current_state(TASK_INTERRUPTIBLE);
> +		if (kthread_should_stop())
> +			break;
> +
> +		/*
> +		 * On a 240W system, with default resolution the
> +		 * Socket Energy status register may wrap around in
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
> +	int i, num_siblings;
> +	u32 *s_config;
> +	struct hwmon_channel_info *info = &data->energy_info;
> +
> +	/* Identify the number of siblings per core */
> +	num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
> +
> +	nr_socks = num_possible_nodes();
> +
> +	/*
> +	 * Energy counter register is accessed at core level.
> +	 * Hence, filterout the siblings.
> +	 */
> +	nr_cpus = num_present_cpus()/num_siblings;
> +
> +	s_config = devm_kcalloc(dev, nr_cpus + nr_socks,
> +				sizeof(u32), GFP_KERNEL);
> +	if (!s_config)
> +		return -ENOMEM;
> +
> +	data->sock_energy_ctrs = devm_kcalloc(dev, nr_socks,
> +				sizeof(u64), GFP_KERNEL);
> +	if (!data->sock_energy_ctrs)
> +		return -ENOMEM;
> +
> +	data->core_energy_ctrs = devm_kcalloc(dev, nr_cpus,
> +				sizeof(u64), GFP_KERNEL);
> +	if (!data->core_energy_ctrs)
> +		return -ENOMEM;
> +
> +	data->sock_prev_value = devm_kcalloc(dev, nr_socks,
> +				sizeof(u64), GFP_KERNEL);
> +	if (!data->sock_prev_value)
> +		return -ENOMEM;
> +
> +	data->core_prev_value = devm_kcalloc(dev, nr_cpus,
> +				sizeof(u64), GFP_KERNEL);
> +	if (!data->core_prev_value)
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
> +	wrap_accumulate = kthread_run(energy_accumulator, data,
> +				      "%s", dev_name(hwmon_dev));
> +	if (IS_ERR(wrap_accumulate))
> +		return PTR_ERR(wrap_accumulate);
> +
> +	return PTR_ERR_OR_ZERO(wrap_accumulate);
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
> +	if (ret)
> +		return ret;
> +
> +	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
> +	if (!amd_energy_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_energy_platdev);
> +	if (ret) {
> +		platform_device_put(amd_energy_platdev);
> +		platform_driver_unregister(&amd_energy_driver);
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
> -- 
> 2.17.1
> 
