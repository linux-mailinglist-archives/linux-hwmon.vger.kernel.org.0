Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36173DF1A5
	for <lists+linux-hwmon@lfdr.de>; Tue,  3 Aug 2021 17:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236959AbhHCPjv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 3 Aug 2021 11:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236947AbhHCPju (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Aug 2021 11:39:50 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E09CC06175F;
        Tue,  3 Aug 2021 08:39:39 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id o2-20020a9d22020000b0290462f0ab0800so21038608ota.11;
        Tue, 03 Aug 2021 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RaUbmWKifUbTZ6zjeh86VoxBPtGmzOjyflRCZDjIbYk=;
        b=QN7ECZPs7uaau8pMoAXj2RgYMKpC1YSqjHKJErKnAHnntnSQevD7MXUx/mAMyFKpLe
         wnE0tffRJbk2tgFvuQ8mhEqMaP0KDjxpsf9Ml3rWGStwfOtulFiFCqhryxwQ9ZT5nB2E
         Kb1OoPRRAbG2O0kzooASOqoVRDD7bmIfGX1VVltsEp4NpMhCwoqhoRphuxQu0IKSk+aJ
         pMyPrsYHFwX7ID7DBke7nR7NiFivkfgA2KHSOqQv923admvcAv/p9rSCHA4+q9e0cqpD
         w1ZSJXM7wj82kvyY3fQBG9wXxIDzgkvwU2UeoX1rE0lTJBr9+w1SCnUJF5LEwvM2DGIe
         +COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=RaUbmWKifUbTZ6zjeh86VoxBPtGmzOjyflRCZDjIbYk=;
        b=JjURe54Rx22iJ/QmhSq+9DcRNaYdLLOFPRyq3AdnK5+b8VCPiuBaFOyh/unfcOSnDr
         Iy9naz+6dhM3nIiMrsJik8usozdhxMzvd3fS6CqKCyOoKKcP5JYtnDgLKzWa6Drxj9m0
         qdV+6qoOSwN/ZjUEA9K11KBbfCDRoRg3bwbCwL8TH/y49Rw8digJSBKpC2GPxHh6vCXJ
         yr9RyA1JOIKUMFzucevoo+woDtLVnJmH8C3DLyicnrp5hWGZcbVCmuA4ljKIWnqrv1Mg
         Ysltrmye1mDnvCj+uPF5zHp1NoXlud6dDPuwXHcHWi9tr7WYAAjExRMyA5u8zFvRRqFz
         4iXA==
X-Gm-Message-State: AOAM532sHAqAaSC+BCNVtpR7K1vmFH/hlr6BYUFx2ztr08lpprJ2WPJ4
        ytyznu+rW/UE13jDrgFJ1h0=
X-Google-Smtp-Source: ABdhPJylN8AK41Yi5Zw1TM/nyzRXsuz3WPrOjzMvNACOPSNAeJCEzQ8CiRrB5Q8XPg1W6psYQycejg==
X-Received: by 2002:a9d:638d:: with SMTP id w13mr15623725otk.224.1628005178838;
        Tue, 03 Aug 2021 08:39:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m19sm2527767otp.55.2021.08.03.08.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 08:39:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Aug 2021 08:39:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iwona Winiarska <iwona.winiarska@intel.com>
Cc:     linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        x86@kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Yazen Ghannam <yazen.ghannam@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Zev Weiss <zweiss@equinix.com>,
        David Muller <d.mueller@elsoft.ch>
Subject: Re: [PATCH v2 13/15] hwmon: peci: Add dimmtemp driver
Message-ID: <20210803153937.GA337938@roeck-us.net>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-14-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803113134.2262882-14-iwona.winiarska@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Aug 03, 2021 at 01:31:32PM +0200, Iwona Winiarska wrote:
> Add peci-dimmtemp driver for Temperature Sensor on DIMM readings that
> are accessible via the processor PECI interface.
> 
> The main use case for the driver (and PECI interface) is out-of-band
> management, where we're able to obtain thermal readings from an external
> entity connected with PECI, e.g. BMC on server platforms.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
> Note that the timeout was completely removed - we're going to probe
> for detected DIMMs every 5 seconds until we reach "stable" state of
> either getting correct DIMM data or getting all -EINVAL (which
> suggest that the CPU doesn't have any DIMMs).
> 
>  drivers/hwmon/peci/Kconfig    |  13 +
>  drivers/hwmon/peci/Makefile   |   2 +
>  drivers/hwmon/peci/dimmtemp.c | 614 ++++++++++++++++++++++++++++++++++
>  3 files changed, 629 insertions(+)
>  create mode 100644 drivers/hwmon/peci/dimmtemp.c
> 
> diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
> index e10eed68d70a..9d32a57badfe 100644
> --- a/drivers/hwmon/peci/Kconfig
> +++ b/drivers/hwmon/peci/Kconfig
> @@ -14,5 +14,18 @@ config SENSORS_PECI_CPUTEMP
>  	  This driver can also be built as a module. If so, the module
>  	  will be called peci-cputemp.
>  
> +config SENSORS_PECI_DIMMTEMP
> +	tristate "PECI DIMM temperature monitoring client"
> +	depends on PECI
> +	select SENSORS_PECI
> +	select PECI_CPU
> +	help
> +	  If you say yes here you get support for the generic Intel PECI hwmon
> +	  driver which provides Temperature Sensor on DIMM readings that are
> +	  accessible via the processor PECI interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called peci-dimmtemp.
> +
>  config SENSORS_PECI
>  	tristate
> diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
> index e8a0ada5ab1f..191cfa0227f3 100644
> --- a/drivers/hwmon/peci/Makefile
> +++ b/drivers/hwmon/peci/Makefile
> @@ -1,5 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
>  peci-cputemp-y := cputemp.o
> +peci-dimmtemp-y := dimmtemp.o
>  
>  obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
> +obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)	+= peci-dimmtemp.o
> diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
> new file mode 100644
> index 000000000000..6264c29bb6c0
> --- /dev/null
> +++ b/drivers/hwmon/peci/dimmtemp.c
> @@ -0,0 +1,614 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2018-2021 Intel Corporation
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/peci.h>
> +#include <linux/peci-cpu.h>
> +#include <linux/units.h>
> +#include <linux/workqueue.h>
> +#include <linux/x86/intel-family.h>
> +
> +#include "common.h"
> +
> +#define DIMM_MASK_CHECK_DELAY_JIFFIES	msecs_to_jiffies(5000)
> +
> +/* Max number of channel ranks and DIMM index per channel */
> +#define CHAN_RANK_MAX_ON_HSX	8
> +#define DIMM_IDX_MAX_ON_HSX	3
> +#define CHAN_RANK_MAX_ON_BDX	4
> +#define DIMM_IDX_MAX_ON_BDX	3
> +#define CHAN_RANK_MAX_ON_BDXD	2
> +#define DIMM_IDX_MAX_ON_BDXD	2
> +#define CHAN_RANK_MAX_ON_SKX	6
> +#define DIMM_IDX_MAX_ON_SKX	2
> +#define CHAN_RANK_MAX_ON_ICX	8
> +#define DIMM_IDX_MAX_ON_ICX	2
> +#define CHAN_RANK_MAX_ON_ICXD	4
> +#define DIMM_IDX_MAX_ON_ICXD	2
> +
> +#define CHAN_RANK_MAX		CHAN_RANK_MAX_ON_HSX
> +#define DIMM_IDX_MAX		DIMM_IDX_MAX_ON_HSX
> +#define DIMM_NUMS_MAX		(CHAN_RANK_MAX * DIMM_IDX_MAX)
> +
> +#define CPU_SEG_MASK		GENMASK(23, 16)
> +#define GET_CPU_SEG(x)		(((x) & CPU_SEG_MASK) >> 16)
> +#define CPU_BUS_MASK		GENMASK(7, 0)
> +#define GET_CPU_BUS(x)		((x) & CPU_BUS_MASK)
> +
> +#define DIMM_TEMP_MAX		GENMASK(15, 8)
> +#define DIMM_TEMP_CRIT		GENMASK(23, 16)
> +#define GET_TEMP_MAX(x)		(((x) & DIMM_TEMP_MAX) >> 8)
> +#define GET_TEMP_CRIT(x)	(((x) & DIMM_TEMP_CRIT) >> 16)
> +
> +struct peci_dimmtemp;
> +
> +struct dimm_info {
> +	int chan_rank_max;
> +	int dimm_idx_max;
> +	u8 min_peci_revision;
> +	int (*read_thresholds)(struct peci_dimmtemp *priv, int dimm_order,
> +			       int chan_rank, u32 *data);
> +};
> +
> +struct peci_dimm_thresholds {
> +	long temp_max;
> +	long temp_crit;
> +	struct peci_sensor_state state;
> +};
> +
> +enum peci_dimm_threshold_type {
> +	temp_max_type,
> +	temp_crit_type,
> +};
> +
> +struct peci_dimmtemp {
> +	struct peci_device *peci_dev;
> +	struct device *dev;
> +	const char *name;
> +	const struct dimm_info *gen_info;
> +	struct delayed_work detect_work;
> +	struct {
> +		struct peci_sensor_data temp;
> +		struct peci_dimm_thresholds thresholds;
> +	} dimm[DIMM_NUMS_MAX];
> +	char **dimmtemp_label;
> +	DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
> +};
> +
> +static u8 __dimm_temp(u32 reg, int dimm_order)
> +{
> +	return (reg >> (dimm_order * 8)) & 0xff;
> +}
> +
> +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no, long *val)
> +{
> +	int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
> +	int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
> +	u32 data;
> +	int ret;

	int ret = 0;

> +
> +	mutex_lock(&priv->dimm[dimm_no].temp.state.lock);
> +	if (!peci_sensor_need_update(&priv->dimm[dimm_no].temp.state))
> +		goto skip_update;
> +
> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &data);
> +	if (ret) {
> +		mutex_unlock(&priv->dimm[dimm_no].temp.state.lock);
> +		return ret;
> +	}

	if (ret)
		goto unlock;

> +
> +	priv->dimm[dimm_no].temp.value = __dimm_temp(data, dimm_order) * MILLIDEGREE_PER_DEGREE;
> +
> +	peci_sensor_mark_updated(&priv->dimm[dimm_no].temp.state);
> +
> +skip_update:
> +	*val = priv->dimm[dimm_no].temp.value;

unlock:
> +	mutex_unlock(&priv->dimm[dimm_no].temp.state.lock);
> +	return 0;

	return ret;

> +}
> +
> +static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
> +{
> +	int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
> +	int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
> +	u32 data;
> +	int ret;
> +
> +	if (!peci_sensor_need_update(&priv->dimm[dimm_no].thresholds.state))
> +		return 0;
> +
> +	ret = priv->gen_info->read_thresholds(priv, dimm_order, chan_rank, &data);
> +	if (ret == -ENODATA) /* Use default or previous value */
> +		return 0;
> +	if (ret)
> +		return ret;
> +
> +	priv->dimm[dimm_no].thresholds.temp_max = GET_TEMP_MAX(data) * MILLIDEGREE_PER_DEGREE;
> +	priv->dimm[dimm_no].thresholds.temp_crit = GET_TEMP_CRIT(data) * MILLIDEGREE_PER_DEGREE;
> +
> +	peci_sensor_mark_updated(&priv->dimm[dimm_no].thresholds.state);
> +
> +	return 0;
> +}
> +
> +static int get_dimm_thresholds(struct peci_dimmtemp *priv, enum peci_dimm_threshold_type type,
> +			       int dimm_no, long *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&priv->dimm[dimm_no].thresholds.state.lock);
> +	ret = update_thresholds(priv, dimm_no);
> +	if (ret)
> +		goto unlock;
> +
> +	switch (type) {
> +	case temp_max_type:
> +		*val = priv->dimm[dimm_no].thresholds.temp_max;
> +		break;
> +	case temp_crit_type:
> +		*val = priv->dimm[dimm_no].thresholds.temp_crit;
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +unlock:
> +	mutex_unlock(&priv->dimm[dimm_no].thresholds.state.lock);
> +
> +	return ret;
> +}
> +
> +static int dimmtemp_read_string(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel, const char **str)
> +{
> +	struct peci_dimmtemp *priv = dev_get_drvdata(dev);
> +
> +	if (attr != hwmon_temp_label)
> +		return -EOPNOTSUPP;
> +
> +	*str = (const char *)priv->dimmtemp_label[channel];
> +
> +	return 0;
> +}
> +
> +static int dimmtemp_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct peci_dimmtemp *priv = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return get_dimm_temp(priv, channel, val);
> +	case hwmon_temp_max:
> +		return get_dimm_thresholds(priv, temp_max_type, channel, val);
> +	case hwmon_temp_crit:
> +		return get_dimm_thresholds(priv, temp_crit_type, channel, val);
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t dimmtemp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	const struct peci_dimmtemp *priv = data;
> +
> +	if (test_bit(channel, priv->dimm_mask))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops peci_dimmtemp_ops = {
> +	.is_visible = dimmtemp_is_visible,
> +	.read_string = dimmtemp_read_string,
> +	.read = dimmtemp_read,
> +};
> +
> +static int check_populated_dimms(struct peci_dimmtemp *priv)
> +{
> +	int chan_rank_max = priv->gen_info->chan_rank_max;
> +	int dimm_idx_max = priv->gen_info->dimm_idx_max;
> +	u32 chan_rank_empty = 0;
> +	u64 dimm_mask = 0;
> +	int chan_rank, dimm_idx, ret;
> +	u32 pcs;
> +
> +	BUILD_BUG_ON(CHAN_RANK_MAX > 32);
> +	BUILD_BUG_ON(DIMM_NUMS_MAX > 64);

I don't immediately see the value of those build bugs. What happens if
CHAN_RANK_MAX > 32 or DIMM_NUMS_MAX > 64 ? Where do those limits come
from ?

> +	if (chan_rank_max * dimm_idx_max > DIMM_NUMS_MAX) {
> +		WARN_ONCE(1, "Unsupported number of DIMMs");

Maybe display the values (chan_rank_max and dimm_idx_max).

> +		return -EINVAL;
> +	}
> +
> +	for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
> +		ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &pcs);
> +		if (ret) {
> +			/*
> +			 * Overall, we expect either success or -EINVAL in
> +			 * order to determine whether DIMM is populated or not.
> +			 * For anything else - we fall back to defering the

Why " - " ?

> +			 * detection to be performed at a later point in time.
> +			 */
> +			if (ret == -EINVAL) {
> +				chan_rank_empty |= BIT(chan_rank);
> +				continue;
> +			}
> +
> +			return -EAGAIN;
> +		}
> +
> +		for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
> +			if (__dimm_temp(pcs, dimm_idx))
> +				dimm_mask |= BIT(chan_rank * dimm_idx_max + dimm_idx);
> +	}
> +
> +	/* If we got all -EINVALs, it means that the CPU doesn't have any DIMMs. */
> +	if (chan_rank_empty == GENMASK(chan_rank_max - 1, 0))
> +		return -ENODEV;
> +
> +	/*
> +	 * It's possible that memory training is not done yet. In this case we
> +	 * defer the detection to be performed at a later point in time.
> +	 */
> +	if (!dimm_mask)
> +		return -EAGAIN;
> +
> +	dev_dbg(priv->dev, "Scanned populated DIMMs: %#llx\n", dimm_mask);
> +
> +	bitmap_from_u64(priv->dimm_mask, dimm_mask);
> +
> +	return 0;
> +}
> +
> +static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
> +{
> +	int rank = chan / priv->gen_info->dimm_idx_max;
> +	int idx = chan % priv->gen_info->dimm_idx_max;
> +
> +	priv->dimmtemp_label[chan] = devm_kasprintf(priv->dev, GFP_KERNEL,
> +						    "DIMM %c%d", 'A' + rank,
> +						    idx + 1);
> +	if (!priv->dimmtemp_label[chan])
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static const u32 peci_dimmtemp_temp_channel_config[] = {
> +	[0 ... DIMM_NUMS_MAX - 1] = HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info peci_dimmtemp_temp_channel = {
> +	.type = hwmon_temp,
> +	.config = peci_dimmtemp_temp_channel_config,
> +};
> +
> +static const struct hwmon_channel_info *peci_dimmtemp_temp_info[] = {
> +	&peci_dimmtemp_temp_channel,
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info peci_dimmtemp_chip_info = {
> +	.ops = &peci_dimmtemp_ops,
> +	.info = peci_dimmtemp_temp_info,
> +};
> +
> +static int create_dimm_temp_info(struct peci_dimmtemp *priv)
> +{
> +	int ret, i, channels;
> +	struct device *dev;
> +
> +	/*
> +	 * We expect to either find populated DIMMs and carry on with creating
> +	 * sensors, or find out that there are no DIMMs populated.
> +	 * All other states mean that the platform never reached the state that
> +	 * allows to check DIMM state - causing us to retry later on.
> +	 */
> +	ret = check_populated_dimms(priv);
> +	if (ret == -ENODEV) {
> +		dev_dbg(priv->dev, "No DIMMs found\n");
> +		return 0;
> +	} else if (ret) {
> +		schedule_delayed_work(&priv->detect_work, DIMM_MASK_CHECK_DELAY_JIFFIES);
> +		dev_dbg(priv->dev, "Deferred populating DIMM temp info\n");
> +		return ret;
> +	}
> +
> +	channels = priv->gen_info->chan_rank_max * priv->gen_info->dimm_idx_max;
> +
> +	priv->dimmtemp_label = devm_kzalloc(priv->dev, channels * sizeof(char *), GFP_KERNEL);
> +	if (!priv->dimmtemp_label)
> +		return -ENOMEM;
> +
> +	for_each_set_bit(i, priv->dimm_mask, DIMM_NUMS_MAX) {
> +		ret = create_dimm_temp_label(priv, i);
> +		if (ret)
> +			return ret;
> +		mutex_init(&priv->dimm[i].thresholds.state.lock);
> +		mutex_init(&priv->dimm[i].temp.state.lock);
> +	}
> +
> +	dev = devm_hwmon_device_register_with_info(priv->dev, priv->name, priv,
> +						   &peci_dimmtemp_chip_info, NULL);
> +	if (IS_ERR(dev)) {
> +		dev_err(priv->dev, "Failed to register hwmon device\n");
> +		return PTR_ERR(dev);
> +	}
> +
> +	dev_dbg(priv->dev, "%s: sensor '%s'\n", dev_name(dev), priv->name);
> +
> +	return 0;
> +}
> +
> +static void create_dimm_temp_info_delayed(struct work_struct *work)
> +{
> +	struct peci_dimmtemp *priv = container_of(to_delayed_work(work),
> +						  struct peci_dimmtemp,
> +						  detect_work);
> +	int ret;
> +
> +	ret = create_dimm_temp_info(priv);
> +	if (ret && ret != -EAGAIN)
> +		dev_err(priv->dev, "Failed to populate DIMM temp info\n");
> +}
> +
> +static void remove_delayed_work(void *_priv)
> +{
> +	struct peci_dimmtemp *priv = _priv;
> +
> +	cancel_delayed_work_sync(&priv->detect_work);
> +}
> +
> +static int peci_dimmtemp_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct peci_device *peci_dev = to_peci_device(dev->parent);
> +	struct peci_dimmtemp *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->name = devm_kasprintf(dev, GFP_KERNEL, "peci_dimmtemp.cpu%d",
> +				    peci_dev->info.socket_id);
> +	if (!priv->name)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->peci_dev = peci_dev;
> +	priv->gen_info = (const struct dimm_info *)id->driver_data;
> +
> +	/*
> +	 * This is just a sanity check. Since we're using commands that are
> +	 * guaranteed to be supported on a given platform, we should never see
> +	 * revision lower than expected.
> +	 */
> +	if (peci_dev->info.peci_revision < priv->gen_info->min_peci_revision)
> +		dev_warn(priv->dev,
> +			 "Unexpected PECI revision %#x, some features may be unavailable\n",
> +			 peci_dev->info.peci_revision);
> +
> +	INIT_DELAYED_WORK(&priv->detect_work, create_dimm_temp_info_delayed);
> +
> +	ret = devm_add_action_or_reset(priv->dev, remove_delayed_work, priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = create_dimm_temp_info(priv);
> +	if (ret && ret != -EAGAIN) {
> +		dev_err(dev, "Failed to populate DIMM temp info\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +read_thresholds_hsx(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u32 *data)
> +{
> +	u8 dev, func;
> +	u16 reg;
> +	int ret;
> +
> +	/*
> +	 * Device 20, Function 0: IMC 0 channel 0 -> rank 0
> +	 * Device 20, Function 1: IMC 0 channel 1 -> rank 1
> +	 * Device 21, Function 0: IMC 0 channel 2 -> rank 2
> +	 * Device 21, Function 1: IMC 0 channel 3 -> rank 3
> +	 * Device 23, Function 0: IMC 1 channel 0 -> rank 4
> +	 * Device 23, Function 1: IMC 1 channel 1 -> rank 5
> +	 * Device 24, Function 0: IMC 1 channel 2 -> rank 6
> +	 * Device 24, Function 1: IMC 1 channel 3 -> rank 7
> +	 */
> +	dev = 20 + chan_rank / 2 + chan_rank / 4;
> +	func = chan_rank % 2;
> +	reg = 0x120 + dimm_order * 4;
> +
> +	ret = peci_pci_local_read(priv->peci_dev, 1, dev, func, reg, data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int
> +read_thresholds_bdxd(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u32 *data)
> +{
> +	u8 dev, func;
> +	u16 reg;
> +	int ret;
> +
> +	/*
> +	 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> +	 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> +	 * Device 12, Function 2: IMC 1 channel 0 -> rank 2
> +	 * Device 12, Function 6: IMC 1 channel 1 -> rank 3
> +	 */
> +	dev = 10 + chan_rank / 2 * 2;
> +	func = (chan_rank % 2) ? 6 : 2;
> +	reg = 0x120 + dimm_order * 4;
> +
> +	ret = peci_pci_local_read(priv->peci_dev, 2, dev, func, reg, data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int
> +read_thresholds_skx(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u32 *data)
> +{
> +	u8 dev, func;
> +	u16 reg;
> +	int ret;
> +
> +	/*
> +	 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
> +	 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
> +	 * Device 11, Function 2: IMC 0 channel 2 -> rank 2
> +	 * Device 12, Function 2: IMC 1 channel 0 -> rank 3
> +	 * Device 12, Function 6: IMC 1 channel 1 -> rank 4
> +	 * Device 13, Function 2: IMC 1 channel 2 -> rank 5
> +	 */
> +	dev = 10 + chan_rank / 3 * 2 + (chan_rank % 3 == 2 ? 1 : 0);
> +	func = chan_rank % 3 == 1 ? 6 : 2;
> +	reg = 0x120 + dimm_order * 4;
> +
> +	ret = peci_pci_local_read(priv->peci_dev, 2, dev, func, reg, data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int
> +read_thresholds_icx(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u32 *data)
> +{
> +	u32 reg_val;
> +	u64 offset;
> +	int ret;
> +	u8 dev;
> +
> +	ret = peci_ep_pci_local_read(priv->peci_dev, 0, 13, 0, 2, 0xd4, &reg_val);
> +	if (ret || !(reg_val & BIT(31)))
> +		return -ENODATA; /* Use default or previous value */
> +
> +	ret = peci_ep_pci_local_read(priv->peci_dev, 0, 13, 0, 2, 0xd0, &reg_val);
> +	if (ret)
> +		return -ENODATA; /* Use default or previous value */
> +
> +	/*
> +	 * Device 26, Offset 224e0: IMC 0 channel 0 -> rank 0
> +	 * Device 26, Offset 264e0: IMC 0 channel 1 -> rank 1
> +	 * Device 27, Offset 224e0: IMC 1 channel 0 -> rank 2
> +	 * Device 27, Offset 264e0: IMC 1 channel 1 -> rank 3
> +	 * Device 28, Offset 224e0: IMC 2 channel 0 -> rank 4
> +	 * Device 28, Offset 264e0: IMC 2 channel 1 -> rank 5
> +	 * Device 29, Offset 224e0: IMC 3 channel 0 -> rank 6
> +	 * Device 29, Offset 264e0: IMC 3 channel 1 -> rank 7
> +	 */
> +	dev = 26 + chan_rank / 2;
> +	offset = 0x224e0 + dimm_order * 4 + (chan_rank % 2) * 0x4000;
> +
> +	ret = peci_mmio_read(priv->peci_dev, 0, GET_CPU_SEG(reg_val), GET_CPU_BUS(reg_val),
> +			     dev, 0, offset, data);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct dimm_info dimm_hsx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_HSX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_HSX,
> +	.min_peci_revision = 0x33,
> +	.read_thresholds = &read_thresholds_hsx,
> +};
> +
> +static const struct dimm_info dimm_bdx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_BDX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_BDX,
> +	.min_peci_revision = 0x33,
> +	.read_thresholds = &read_thresholds_hsx,
> +};
> +
> +static const struct dimm_info dimm_bdxd = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_BDXD,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_BDXD,
> +	.min_peci_revision = 0x33,
> +	.read_thresholds = &read_thresholds_bdxd,
> +};
> +
> +static const struct dimm_info dimm_skx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_SKX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_SKX,
> +	.min_peci_revision = 0x33,
> +	.read_thresholds = &read_thresholds_skx,
> +};
> +
> +static const struct dimm_info dimm_icx = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_ICX,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_ICX,
> +	.min_peci_revision = 0x40,
> +	.read_thresholds = &read_thresholds_icx,
> +};
> +
> +static const struct dimm_info dimm_icxd = {
> +	.chan_rank_max	= CHAN_RANK_MAX_ON_ICXD,
> +	.dimm_idx_max	= DIMM_IDX_MAX_ON_ICXD,
> +	.min_peci_revision = 0x40,
> +	.read_thresholds = &read_thresholds_icx,
> +};
> +
> +static const struct auxiliary_device_id peci_dimmtemp_ids[] = {
> +	{
> +		.name = "peci_cpu.dimmtemp.hsx",
> +		.driver_data = (kernel_ulong_t)&dimm_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.bdx",
> +		.driver_data = (kernel_ulong_t)&dimm_bdx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.bdxd",
> +		.driver_data = (kernel_ulong_t)&dimm_bdxd,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.skx",
> +		.driver_data = (kernel_ulong_t)&dimm_skx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.icx",
> +		.driver_data = (kernel_ulong_t)&dimm_icx,
> +	},
> +	{
> +		.name = "peci_cpu.dimmtemp.icxd",
> +		.driver_data = (kernel_ulong_t)&dimm_icxd,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
> +
> +static struct auxiliary_driver peci_dimmtemp_driver = {
> +	.probe		= peci_dimmtemp_probe,
> +	.id_table	= peci_dimmtemp_ids,
> +};
> +
> +module_auxiliary_driver(peci_dimmtemp_driver);
> +
> +MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
> +MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
> +MODULE_DESCRIPTION("PECI dimmtemp driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PECI_CPU);
