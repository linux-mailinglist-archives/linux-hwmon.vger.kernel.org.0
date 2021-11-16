Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60584528E9
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Nov 2021 05:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241372AbhKPEFC (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 15 Nov 2021 23:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240847AbhKPEE4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Nov 2021 23:04:56 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF10C07C905;
        Mon, 15 Nov 2021 16:52:59 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so30493086otm.10;
        Mon, 15 Nov 2021 16:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tQ7ydAS0o4kcctRFjmmpjDvPpqwcI/5bCX3Fc3bPGZo=;
        b=fXcYHuRegCHrb/+RWX0XxeSj7SCvXDn81kC5firVpxbXSV0a1tSwYya/BhkJMoGLmc
         xc3bqG4e6Owa5Ix+Q8Y+ysHMa2eM3aUg/o9dQ8UAA+7hOp7pq51kuMtlmaPU6v5Rtu7W
         vT80HEO2PoaJfTnMIi2ySXUGgTuxozzjlplDhM9zNbP5fi/EYGO0TlFxGDD42+mKT3F9
         nq5C3GAPWUqAOlyiQp+mZpEwXGQbWpnRZOA2sAO9ScXsSJNBaoKkG5u9X2M61iOlo5WQ
         VY9QZxcSPxAIRu/GWsG3Qxae3OjrVfqIrfXd0VpOxP7lIaFiKqKDiqLzzejFL2pPl7eB
         /ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tQ7ydAS0o4kcctRFjmmpjDvPpqwcI/5bCX3Fc3bPGZo=;
        b=6FvpxxzNbwlNZ8ox4FbmcIVVf70o8R6oAN7gAblnCnL9sG3GkKy2sWFtxErCTUo4Bl
         pOMX3fUlfs+6pCzSPd/9RYM76bAQBNM0QExeFhuOjkR8UmYPfxWaIPKgMW5kN4z+AfVc
         S/nFVXBCQRfiqNJsiL/AYb83KtYTgR/ApG80zpvQHzBEBofWcYTrd4JDCG1zVrkcGmvZ
         bTUSgXA+dZ5MTtzoUvFPcIPqj/2LJu4SvrCMYE3bwHO6JiXfMhxjN/3ycgDph8btRnHm
         guB/FfvbrXIP+lZ6inRhfGYy6ZLz2pa+yrmH+p17TVgquKjaV5oFvy5YqafE3fg+jsPm
         O35w==
X-Gm-Message-State: AOAM5321uaqMdXlPyo9xbRljHXC/UjkIC1K2dtbgCffAKTdk4ySkT3Z4
        apjdssO6S/f8G36gNe8exwI=
X-Google-Smtp-Source: ABdhPJwlcITIkSBnAh903GNnGAqGjA3gsNrHdJukt0jP8O8Rf8uwKjGSTXfNFTbAtsacsIzA+lDo7w==
X-Received: by 2002:a05:6830:4090:: with SMTP id x16mr2690229ott.281.1637023979018;
        Mon, 15 Nov 2021 16:52:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s9sm3428441otg.42.2021.11.15.16.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 16:52:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Iwona Winiarska <iwona.winiarska@intel.com>,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean Delvare <jdelvare@suse.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Borislav Petkov <bp@alien8.de>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Zev Weiss <zweiss@equinix.com>,
        David Muller <d.mueller@elsoft.ch>,
        Dave Hansen <dave.hansen@intel.com>
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
 <20211115182552.3830849-11-iwona.winiarska@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 10/13] hwmon: peci: Add cputemp driver
Message-ID: <0320f995-b7b7-b602-9acb-3271e2db7d88@roeck-us.net>
Date:   Mon, 15 Nov 2021 16:52:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115182552.3830849-11-iwona.winiarska@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/15/21 10:25 AM, Iwona Winiarska wrote:
> Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
> readings of the processor package and processor cores that are
> accessible via the PECI interface.
> 
> The main use case for the driver (and PECI interface) is out-of-band
> management, where we're able to obtain the DTS readings from an external
> entity connected with PECI, e.g. BMC on server platforms.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   MAINTAINERS                  |   7 +
>   drivers/hwmon/Kconfig        |   2 +
>   drivers/hwmon/Makefile       |   1 +
>   drivers/hwmon/peci/Kconfig   |  18 ++
>   drivers/hwmon/peci/Makefile  |   5 +
>   drivers/hwmon/peci/common.h  |  58 ++++
>   drivers/hwmon/peci/cputemp.c | 592 +++++++++++++++++++++++++++++++++++
>   7 files changed, 683 insertions(+)
>   create mode 100644 drivers/hwmon/peci/Kconfig
>   create mode 100644 drivers/hwmon/peci/Makefile
>   create mode 100644 drivers/hwmon/peci/common.h
>   create mode 100644 drivers/hwmon/peci/cputemp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d751590f32e3..0094370be6c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14920,6 +14920,13 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	drivers/platform/x86/peaq-wmi.c
>   
> +PECI HARDWARE MONITORING DRIVERS
> +M:	Iwona Winiarska <iwona.winiarska@intel.com>
> +R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	drivers/hwmon/peci/
> +
>   PECI SUBSYSTEM
>   M:	Iwona Winiarska <iwona.winiarska@intel.com>
>   R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 64bd3dfba2c4..4858f7cfa81e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1528,6 +1528,8 @@ config SENSORS_PCF8591
>   	  These devices are hard to detect and rarely found on mainstream
>   	  hardware. If unsure, say N.
>   
> +source "drivers/hwmon/peci/Kconfig"
> +
>   source "drivers/hwmon/pmbus/Kconfig"
>   
>   config SENSORS_PWM_FAN
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index baee6a8d4dd1..2c0e210a28b8 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -204,6 +204,7 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>   obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
>   
>   obj-$(CONFIG_SENSORS_OCC)	+= occ/
> +obj-$(CONFIG_SENSORS_PECI)	+= peci/
>   obj-$(CONFIG_PMBUS)		+= pmbus/
>   
>   ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
> diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
> new file mode 100644
> index 000000000000..e10eed68d70a
> --- /dev/null
> +++ b/drivers/hwmon/peci/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SENSORS_PECI_CPUTEMP
> +	tristate "PECI CPU temperature monitoring client"
> +	depends on PECI
> +	select SENSORS_PECI
> +	select PECI_CPU
> +	help
> +	  If you say yes here you get support for the generic Intel PECI
> +	  cputemp driver which provides Digital Thermal Sensor (DTS) thermal
> +	  readings of the CPU package and CPU cores that are accessible via
> +	  the processor PECI interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called peci-cputemp.
> +
> +config SENSORS_PECI
> +	tristate
> diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
> new file mode 100644
> index 000000000000..e8a0ada5ab1f
> --- /dev/null
> +++ b/drivers/hwmon/peci/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +peci-cputemp-y := cputemp.o
> +
> +obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
> diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
> new file mode 100644
> index 000000000000..734506b0eca2
> --- /dev/null
> +++ b/drivers/hwmon/peci/common.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2021 Intel Corporation */
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +#ifndef __PECI_HWMON_COMMON_H
> +#define __PECI_HWMON_COMMON_H
> +
> +#define PECI_HWMON_UPDATE_INTERVAL	HZ
> +
> +/**
> + * struct peci_sensor_state - PECI state information
> + * @valid: flag to indicate the sensor value is valid
> + * @last_updated: time of the last update in jiffies
> + * @lock: mutex to protect sensor access
> + */
> +struct peci_sensor_state {
> +	bool valid;
> +	unsigned long last_updated;
> +	struct mutex lock; /* protect sensor access */
> +};
> +
> +/**
> + * struct peci_sensor_data - PECI sensor information
> + * @value: sensor value in milli units
> + * @state: sensor update state
> + */
> +
> +struct peci_sensor_data {
> +	s32 value;
> +	struct peci_sensor_state state;
> +};
> +
> +/**
> + * peci_sensor_need_update() - check whether sensor update is needed or not
> + * @sensor: pointer to sensor data struct
> + *
> + * Return: true if update is needed, false if not.
> + */
> +
> +static inline bool peci_sensor_need_update(struct peci_sensor_state *state)
> +{
> +	return !state->valid ||
> +	       time_after(jiffies, state->last_updated + PECI_HWMON_UPDATE_INTERVAL);
> +}
> +
> +/**
> + * peci_sensor_mark_updated() - mark the sensor is updated
> + * @sensor: pointer to sensor data struct
> + */
> +static inline void peci_sensor_mark_updated(struct peci_sensor_state *state)
> +{
> +	state->valid = true;
> +	state->last_updated = jiffies;
> +}
> +
> +#endif /* __PECI_HWMON_COMMON_H */
> diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
> new file mode 100644
> index 000000000000..d264d6c2f437
> --- /dev/null
> +++ b/drivers/hwmon/peci/cputemp.c
> @@ -0,0 +1,592 @@
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
> +
> +#include "common.h"
> +
> +#define CORE_NUMS_MAX		64
> +
> +#define BASE_CHANNEL_NUMS	5
> +#define CPUTEMP_CHANNEL_NUMS	(BASE_CHANNEL_NUMS + CORE_NUMS_MAX)
> +
> +#define TEMP_TARGET_FAN_TEMP_MASK	GENMASK(15, 8)
> +#define TEMP_TARGET_REF_TEMP_MASK	GENMASK(23, 16)
> +#define TEMP_TARGET_TJ_OFFSET_MASK	GENMASK(29, 24)
> +
> +#define DTS_MARGIN_MASK		GENMASK(15, 0)
> +#define PCS_MODULE_TEMP_MASK	GENMASK(15, 0)
> +
> +struct resolved_cores_reg {
> +	u8 bus;
> +	u8 dev;
> +	u8 func;
> +	u8 offset;
> +};
> +
> +struct cpu_info {
> +	struct resolved_cores_reg *reg;
> +	u8 min_peci_revision;
> +	s32 (*thermal_margin_to_millidegree)(s32 val);
> +};
> +
> +struct peci_temp_target {
> +	s32 tcontrol;
> +	s32 tthrottle;
> +	s32 tjmax;
> +	struct peci_sensor_state state;
> +};
> +
> +enum peci_temp_target_type {
> +	tcontrol_type,
> +	tthrottle_type,
> +	tjmax_type,
> +	crit_hyst_type,
> +};
> +
> +struct peci_cputemp {
> +	struct peci_device *peci_dev;
> +	struct device *dev;
> +	const char *name;
> +	const struct cpu_info *gen_info;
> +	struct {
> +		struct peci_temp_target target;
> +		struct peci_sensor_data die;
> +		struct peci_sensor_data dts;
> +		struct peci_sensor_data core[CORE_NUMS_MAX];
> +	} temp;
> +	const char **coretemp_label;
> +	DECLARE_BITMAP(core_mask, CORE_NUMS_MAX);
> +};
> +
> +enum cputemp_channels {
> +	channel_die,
> +	channel_dts,
> +	channel_tcontrol,
> +	channel_tthrottle,
> +	channel_tjmax,
> +	channel_core,
> +};
> +
> +static const char * const cputemp_label[BASE_CHANNEL_NUMS] = {
> +	"Die",
> +	"DTS",
> +	"Tcontrol",
> +	"Tthrottle",
> +	"Tjmax",
> +};
> +
> +static int update_temp_target(struct peci_cputemp *priv)
> +{
> +	s32 tthrottle_offset, tcontrol_margin;
> +	u32 pcs;
> +	int ret;
> +
> +	if (!peci_sensor_need_update(&priv->temp.target.state))
> +		return 0;
> +
> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_TEMP_TARGET, 0, &pcs);
> +	if (ret)
> +		return ret;
> +
> +	priv->temp.target.tjmax =
> +		FIELD_GET(TEMP_TARGET_REF_TEMP_MASK, pcs) * MILLIDEGREE_PER_DEGREE;
> +
> +	tcontrol_margin = FIELD_GET(TEMP_TARGET_FAN_TEMP_MASK, pcs);
> +	tcontrol_margin = sign_extend32(tcontrol_margin, 7) * MILLIDEGREE_PER_DEGREE;
> +	priv->temp.target.tcontrol = priv->temp.target.tjmax - tcontrol_margin;
> +
> +	tthrottle_offset = FIELD_GET(TEMP_TARGET_TJ_OFFSET_MASK, pcs) * MILLIDEGREE_PER_DEGREE;
> +	priv->temp.target.tthrottle = priv->temp.target.tjmax - tthrottle_offset;
> +
> +	peci_sensor_mark_updated(&priv->temp.target.state);
> +
> +	return 0;
> +}
> +
> +static int get_temp_target(struct peci_cputemp *priv, enum peci_temp_target_type type, long *val)

Why is this a long * ? It only uses variables which are declared as s32.

> +{
> +	int ret;
> +
> +	mutex_lock(&priv->temp.target.state.lock);
> +
> +	ret = update_temp_target(priv);
> +	if (ret)
> +		goto unlock;
> +
> +	switch (type) {
> +	case tcontrol_type:
> +		*val = priv->temp.target.tcontrol;
> +		break;
> +	case tthrottle_type:
> +		*val = priv->temp.target.tthrottle;
> +		break;
> +	case tjmax_type:
> +		*val = priv->temp.target.tjmax;
> +		break;
> +	case crit_hyst_type:
> +		*val = priv->temp.target.tjmax - priv->temp.target.tcontrol;
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +unlock:
> +	mutex_unlock(&priv->temp.target.state.lock);
> +
> +	return ret;
> +}
> +
> +/*
> + * Error codes:
> + *   0x8000: General sensor error
> + *   0x8001: Reserved
> + *   0x8002: Underflow on reading value
> + *   0x8003-0x81ff: Reserved
> + */
> +static bool dts_valid(s32 val)
> +{
> +	return val < 0x8000 || val > 0x81ff;
> +}
> +
> +/*
> + * Processors return a value of DTS reading in S10.6 fixed point format
> + * (16 bits: 10-bit signed magnitude, 6-bit fraction).
> + */
> +static s32 dts_ten_dot_six_to_millidegree(s32 val)
> +{
> +	return sign_extend32(val, 15) * MILLIDEGREE_PER_DEGREE / 64;
> +}
> +
> +/*
> + * For older processors, thermal margin reading is returned in S8.8 fixed
> + * point format (16 bits: 8-bit signed magnitude, 8-bit fraction).
> + */
> +static s32 dts_eight_dot_eight_to_millidegree(s32 val)
> +{
> +	return sign_extend32(val, 15) * MILLIDEGREE_PER_DEGREE / 256;
> +}
> +
> +static int get_die_temp(struct peci_cputemp *priv, long *val)
> +{
> +	int ret = 0;
> +	long tjmax;
> +	s16 temp;
> +
> +	mutex_lock(&priv->temp.die.state.lock);
> +	if (!peci_sensor_need_update(&priv->temp.die.state))
> +		goto skip_update;
> +
> +	ret = peci_temp_read(priv->peci_dev, &temp);
> +	if (ret)
> +		goto err_unlock;
> +
> +	if (!dts_valid(temp)) {
> +		ret = -EIO;
> +		goto err_unlock;
> +	}
> +

I am getting lost with all the variable types. temp is s16,
passed to dts_valid() as s32 and thus presumably sign extended.
Since temp is s16, that means that a positive value of 0x8000
or larger isn't really possible, and dts_valid() will never return
false. With that in mind, you might as well drop the check.

> +	ret = get_temp_target(priv, tjmax_type, &tjmax);
> +	if (ret)
> +		goto err_unlock;
> +
> +	priv->temp.die.value = (s32)tjmax + dts_ten_dot_six_to_millidegree(temp);
> +
> +	peci_sensor_mark_updated(&priv->temp.die.state);
> +
> +skip_update:
> +	*val = priv->temp.die.value;
> +err_unlock:
> +	mutex_unlock(&priv->temp.die.state.lock);
> +	return ret;
> +}
> +
> +static int get_dts(struct peci_cputemp *priv, long *val)
> +{
> +	int ret = 0;
> +	s32 thermal_margin;
> +	long tcontrol;
> +	u32 pcs;
> +
> +	mutex_lock(&priv->temp.dts.state.lock);
> +	if (!peci_sensor_need_update(&priv->temp.dts.state))
> +		goto skip_update;
> +
> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_THERMAL_MARGIN, 0, &pcs);
> +	if (ret)
> +		goto err_unlock;
> +
> +	thermal_margin = FIELD_GET(DTS_MARGIN_MASK, pcs);
> +	if (!dts_valid(thermal_margin)) { > +		ret = -EIO;
> +		goto err_unlock;
> +	}
> +
> +	ret = get_temp_target(priv, tcontrol_type, &tcontrol);
> +	if (ret)
> +		goto err_unlock;
> +
> +	/* Note that the tcontrol should be available before calling it */
> +	priv->temp.dts.value =
> +		(s32)tcontrol - priv->gen_info->thermal_margin_to_millidegree(thermal_margin);

tcontrol is stored as s32, converted to long, only to be typecasted
back to s32. Any reason for doing that ?

> +
> +	peci_sensor_mark_updated(&priv->temp.dts.state);
> +
> +skip_update:
> +	*val = priv->temp.dts.value;
> +err_unlock:
> +	mutex_unlock(&priv->temp.dts.state.lock);
> +	return ret;
> +}
> +
> +static int get_core_temp(struct peci_cputemp *priv, int core_index, long *val)
> +{
> +	int ret = 0;
> +	s32 core_dts_margin;
> +	long tjmax;
> +	u32 pcs;
> +
> +	mutex_lock(&priv->temp.core[core_index].state.lock);
> +	if (!peci_sensor_need_update(&priv->temp.core[core_index].state))
> +		goto skip_update;
> +
> +	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_MODULE_TEMP, core_index, &pcs);
> +	if (ret)
> +		goto err_unlock;
> +
> +	core_dts_margin = FIELD_GET(PCS_MODULE_TEMP_MASK, pcs);
> +	if (!dts_valid(core_dts_margin)) {
> +		ret = -EIO;
> +		goto err_unlock;
> +	}
> +
> +	ret = get_temp_target(priv, tjmax_type, &tjmax);
> +	if (ret)
> +		goto err_unlock;
> +
> +	/* Note that the tjmax should be available before calling it */
> +	priv->temp.core[core_index].value =
> +		(s32)tjmax + dts_ten_dot_six_to_millidegree(core_dts_margin);
> +
> +	peci_sensor_mark_updated(&priv->temp.core[core_index].state);
> +
> +skip_update:
> +	*val = priv->temp.core[core_index].value;
> +err_unlock:
> +	mutex_unlock(&priv->temp.core[core_index].state.lock);
> +	return ret;
> +}
> +
> +static int cputemp_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	struct peci_cputemp *priv = dev_get_drvdata(dev);
> +
> +	if (attr != hwmon_temp_label)
> +		return -EOPNOTSUPP;
> +
> +	*str = channel < channel_core ?
> +		cputemp_label[channel] : priv->coretemp_label[channel - channel_core];
> +
> +	return 0;
> +}
> +
> +static int cputemp_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	struct peci_cputemp *priv = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		switch (channel) {
> +		case channel_die:
> +			return get_die_temp(priv, val);
> +		case channel_dts:
> +			return get_dts(priv, val);
> +		case channel_tcontrol:
> +			return get_temp_target(priv, tcontrol_type, val);
> +		case channel_tthrottle:
> +			return get_temp_target(priv, tthrottle_type, val);
> +		case channel_tjmax:
> +			return get_temp_target(priv, tjmax_type, val);
> +		default:
> +			return get_core_temp(priv, channel - channel_core, val);
> +		}
> +		break;
> +	case hwmon_temp_max:
> +		return get_temp_target(priv, tcontrol_type, val);
> +	case hwmon_temp_crit:
> +		return get_temp_target(priv, tjmax_type, val);
> +	case hwmon_temp_crit_hyst:
> +		return get_temp_target(priv, crit_hyst_type, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t cputemp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	const struct peci_cputemp *priv = data;
> +
> +	if (channel > CPUTEMP_CHANNEL_NUMS)
> +		return 0;
> +
> +	if (channel < channel_core)
> +		return 0444;
> +
> +	if (test_bit(channel - channel_core, priv->core_mask))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static int init_core_mask(struct peci_cputemp *priv)
> +{
> +	struct peci_device *peci_dev = priv->peci_dev;
> +	struct resolved_cores_reg *reg = priv->gen_info->reg;
> +	u64 core_mask;
> +	u32 data;
> +	int ret;
> +
> +	/* Get the RESOLVED_CORES register value */
> +	switch (peci_dev->info.model) {
> +	case INTEL_FAM6_ICELAKE_X:
> +	case INTEL_FAM6_ICELAKE_D:
> +		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
> +					     reg->func, reg->offset + 4, &data);
> +		if (ret)
> +			return ret;
> +
> +		core_mask = (u64)data << 32;
> +
> +		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
> +					     reg->func, reg->offset, &data);
> +		if (ret)
> +			return ret;
> +
> +		core_mask |= data;
> +
> +		break;
> +	default:
> +		ret = peci_pci_local_read(peci_dev, reg->bus, reg->dev,
> +					  reg->func, reg->offset, &data);
> +		if (ret)
> +			return ret;
> +
> +		core_mask = data;
> +
> +		break;
> +	}
> +
> +	if (!core_mask)
> +		return -EIO;
> +
> +	bitmap_from_u64(priv->core_mask, core_mask);
> +
> +	return 0;
> +}
> +
> +static int create_temp_label(struct peci_cputemp *priv)
> +{
> +	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
> +	int i;
> +
> +	priv->coretemp_label = devm_kzalloc(priv->dev, core_max * sizeof(char *), GFP_KERNEL);
> +	if (!priv->coretemp_label)
> +		return -ENOMEM;
> +
> +	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX) {
> +		priv->coretemp_label[i] = devm_kasprintf(priv->dev, GFP_KERNEL, "Core %d", i);
> +		if (!priv->coretemp_label[i])
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static void check_resolved_cores(struct peci_cputemp *priv)
> +{
> +	/*
> +	 * Failure to resolve cores is non-critical, we're still able to
> +	 * provide other sensor data.
> +	 */
> +
> +	if (init_core_mask(priv))
> +		return;
> +
> +	if (create_temp_label(priv))
> +		bitmap_zero(priv->core_mask, CORE_NUMS_MAX);
> +}
> +
> +static void sensor_init(struct peci_cputemp *priv)
> +{
> +	int i;
> +
> +	mutex_init(&priv->temp.target.state.lock);
> +	mutex_init(&priv->temp.die.state.lock);
> +	mutex_init(&priv->temp.dts.state.lock);
> +
> +	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX)
> +		mutex_init(&priv->temp.core[i].state.lock);
> +}
> +
> +static const struct hwmon_ops peci_cputemp_ops = {
> +	.is_visible = cputemp_is_visible,
> +	.read_string = cputemp_read_string,
> +	.read = cputemp_read,
> +};
> +
> +static const u32 peci_cputemp_temp_channel_config[] = {
> +	/* Die temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
> +	/* DTS margin */
> +	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
> +	/* Tcontrol temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
> +	/* Tthrottle temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT,
> +	/* Tjmax temperature */
> +	HWMON_T_LABEL | HWMON_T_INPUT,
> +	/* Core temperature - for all core channels */
> +	[channel_core ... CPUTEMP_CHANNEL_NUMS - 1] = HWMON_T_LABEL | HWMON_T_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info peci_cputemp_temp_channel = {
> +	.type = hwmon_temp,
> +	.config = peci_cputemp_temp_channel_config,
> +};
> +
> +static const struct hwmon_channel_info *peci_cputemp_info[] = {
> +	&peci_cputemp_temp_channel,
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info peci_cputemp_chip_info = {
> +	.ops = &peci_cputemp_ops,
> +	.info = peci_cputemp_info,
> +};
> +
> +static int peci_cputemp_probe(struct auxiliary_device *adev,
> +			      const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct peci_device *peci_dev = to_peci_device(dev->parent);
> +	struct peci_cputemp *priv;
> +	struct device *hwmon_dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->name = devm_kasprintf(dev, GFP_KERNEL, "peci_cputemp.cpu%d",
> +				    peci_dev->info.socket_id);
> +	if (!priv->name)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->peci_dev = peci_dev;
> +	priv->gen_info = (const struct cpu_info *)id->driver_data;
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
> +	check_resolved_cores(priv);
> +
> +	sensor_init(priv);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(priv->dev, priv->name,
> +							 priv, &peci_cputemp_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +/*
> + * RESOLVED_CORES PCI configuration register may have different location on
> + * different platforms.
> + */
> +static struct resolved_cores_reg resolved_cores_reg_hsx = {
> +	.bus = 1,
> +	.dev = 30,
> +	.func = 3,
> +	.offset = 0xb4,
> +};
> +
> +static struct resolved_cores_reg resolved_cores_reg_icx = {
> +	.bus = 14,
> +	.dev = 30,
> +	.func = 3,
> +	.offset = 0xd0,
> +};
> +
> +static const struct cpu_info cpu_hsx = {
> +	.reg		= &resolved_cores_reg_hsx,
> +	.min_peci_revision = 0x33,
> +	.thermal_margin_to_millidegree = &dts_eight_dot_eight_to_millidegree,
> +};
> +
> +static const struct cpu_info cpu_icx = {
> +	.reg		= &resolved_cores_reg_icx,
> +	.min_peci_revision = 0x40,
> +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> +};
> +
> +static const struct auxiliary_device_id peci_cputemp_ids[] = {
> +	{
> +		.name = "peci_cpu.cputemp.hsx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.bdx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.bdxd",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.skx",
> +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.icx",
> +		.driver_data = (kernel_ulong_t)&cpu_icx,
> +	},
> +	{
> +		.name = "peci_cpu.cputemp.icxd",
> +		.driver_data = (kernel_ulong_t)&cpu_icx,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
> +
> +static struct auxiliary_driver peci_cputemp_driver = {
> +	.probe		= peci_cputemp_probe,
> +	.id_table	= peci_cputemp_ids,
> +};
> +
> +module_auxiliary_driver(peci_cputemp_driver);
> +
> +MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
> +MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
> +MODULE_DESCRIPTION("PECI cputemp driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PECI_CPU);
> 

