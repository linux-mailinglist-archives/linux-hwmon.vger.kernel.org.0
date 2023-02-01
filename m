Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46A679AED
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Jan 2023 15:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbjAXOB3 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 24 Jan 2023 09:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjAXOBU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 09:01:20 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0836269B;
        Tue, 24 Jan 2023 06:00:58 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-15f97c478a8so17664412fac.13;
        Tue, 24 Jan 2023 06:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmoyjXZIJi9Rx65rj6ruYDX6ndfhRM7zJBh2XJQLDbY=;
        b=gPXaSlpMh9zl75rRP8w5h2kwbRlLwklFAMHM0dTjYNRr8rlxNh8B7Em4jZG6EaJVGO
         p9VEphibY0mxZjRrZlGOuRNX3IzYSNk3WUwdYlVf4lMCydHqBPJLffa7xyivvUgkVcoF
         DOBIojG+mBOV9Vdl/diy58xlwCTN/wgSUmrs0ayiQVu5uYn6e1jOSQ5Ik+pyIKLZmvg7
         u0x/s0AjkSxcinjUWJegzOz0o4ThcmhAArMC8U20FDZWEB9fcUQIYu/P/ZkEJMimiEeM
         VUWItBHCzaR29ftVVU50+fJziWq2k6bMPm2z32EyS+QEZROF4E4/GrP0JrE5JG+FNp5Q
         UEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmoyjXZIJi9Rx65rj6ruYDX6ndfhRM7zJBh2XJQLDbY=;
        b=oE2rmOpIbuK6dF5FUThYxWRTD56BrilBUXBNATmBJCwextFHh/iRun63lLad6uHlJk
         butunCK+b5hEg+xGDIgTZE2NDTPDDk7V/8ORPrm4ypP+LygpxPTRRJ2dIxb4dHpzWhbR
         Rcx8RwpcJUjW8ToGZYN2DQQPPZiEaM9mud9u3EKQIpX8JfY3rGmzcVhDWm7byoN6BjtI
         XKP351q2aDPJmmfUtRpe9lAy2D27b6+NIKID5iwdnkVqY/T0bYmb3FBwFxAiFLXFyglw
         g+x0HtPcKcJCJduluBJfVnUO7ZYrd2EuurEaBTVj9zYkiNA7OmGmala+vsi4OcEHnC3/
         vheQ==
X-Gm-Message-State: AFqh2koZuEzR0gtwK6pMGho0FVpVvNWg7GwUv0ImzFlnMxIpC8b1LNmV
        IAzot8zJZxITX8HG9MZ9BW4=
X-Google-Smtp-Source: AMrXdXsFbPWzZEWJ+ey/CazkqACJ6dIGevse4ra/3zvmFXKJn0i663Q/medPHl64JRx/vm2Zu4SGJg==
X-Received: by 2002:a05:6870:3516:b0:15e:c4e1:c9fb with SMTP id k22-20020a056870351600b0015ec4e1c9fbmr16466432oah.31.1674568856289;
        Tue, 24 Jan 2023 06:00:56 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id lu24-20020a056871431800b0013297705e5dsm737363oab.28.2023.01.24.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:00:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Jan 2023 06:00:54 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: add initial NXP MC34VR500 PMIC monitoring
 support
Message-ID: <20230124140054.GA37573@roeck-us.net>
References: <20230118123019.3041303-1-dev@kicherer.org>
 <20230118123019.3041303-4-dev@kicherer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118123019.3041303-4-dev@kicherer.org>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 18, 2023 at 01:30:19PM +0100, Mario Kicherer wrote:
> Add initial monitoring support for the MC34VR500 PMIC. In its current
> state, input voltage and temperature alarms are reported to hwmon.
> 
> Datasheet:
>  - https://www.nxp.com/docs/en/data-sheet/MC34VR500.pdf
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig     |   7 +
>  drivers/hwmon/Makefile    |   1 +
>  drivers/hwmon/mc34vr500.c | 262 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/hwmon/mc34vr500.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3176c33af6c6..69d4c1609494 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1166,6 +1166,13 @@ config SENSORS_MAX31790
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31790.
>  
> +config SENSORS_MC34VR500
> +	tristate "NXP MC34VR500 hardware monitoring driver"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the temperature and input
> +	  voltage sensors of the NXP MC34VR500.
> +
>  config SENSORS_MCP3021
>  	tristate "Microchip MCP3021 and compatibles"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index e2e4e87b282f..4bef13d16c66 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -149,6 +149,7 @@ obj-$(CONFIG_SENSORS_MAX6650)	+= max6650.o
>  obj-$(CONFIG_SENSORS_MAX6697)	+= max6697.o
>  obj-$(CONFIG_SENSORS_MAX31790)	+= max31790.o
>  obj-$(CONFIG_SENSORS_MC13783_ADC)+= mc13783-adc.o
> +obj-$(CONFIG_SENSORS_MC34VR500)	+= mc34vr500.o
>  obj-$(CONFIG_SENSORS_MCP3021)	+= mcp3021.o
>  obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>  obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
> diff --git a/drivers/hwmon/mc34vr500.c b/drivers/hwmon/mc34vr500.c
> new file mode 100644
> index 000000000000..b14daa999a2e
> --- /dev/null
> +++ b/drivers/hwmon/mc34vr500.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * An hwmon driver for the NXP MC34VR500 PMIC
> + *
> + * Author: Mario Kicherer <dev@kicherer.org>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#define MC34VR500_I2C_ADDR		0x08
> +#define MC34VR500_DEVICEID_VALUE	0x14
> +
> +/* INTSENSE0 */
> +#define ENS_BIT		BIT(0)
> +#define LOWVINS_BIT	BIT(1)
> +#define THERM110S_BIT	BIT(2)
> +#define THERM120S_BIT	BIT(3)
> +#define THERM125S_BIT	BIT(4)
> +#define THERM130S_BIT	BIT(5)
> +
> +#define MC34VR500_DEVICEID	0x00
> +
> +#define MC34VR500_SILICONREVID	0x03
> +#define MC34VR500_FABID		0x04
> +#define MC34VR500_INTSTAT0	0x05
> +#define MC34VR500_INTMASK0	0x06
> +#define MC34VR500_INTSENSE0	0x07
> +
> +struct mc34vr500_data {
> +	struct device *hwmon_dev;
> +	struct regmap *regmap;
> +};
> +
> +static irqreturn_t mc34vr500_process_interrupt(int irq, void *userdata)
> +{
> +	struct mc34vr500_data *data = (struct mc34vr500_data *)userdata;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, MC34VR500_INTSTAT0, &reg);
> +	if (ret < 0)
> +		return IRQ_HANDLED;
> +
> +	if (reg) {
> +		if (reg & LOWVINS_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_in,
> +					   hwmon_in_min_alarm, 0);
> +
> +		if (reg & THERM110S_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> +					   hwmon_temp_max_alarm, 0);
> +
> +		if (reg & THERM120S_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> +					   hwmon_temp_crit_alarm, 0);
> +
> +		if (reg & THERM130S_BIT)
> +			hwmon_notify_event(data->hwmon_dev, hwmon_temp,
> +					   hwmon_temp_emergency_alarm, 0);
> +
> +		/* write 1 to clear */
> +		regmap_write(data->regmap, MC34VR500_INTSTAT0, LOWVINS_BIT |
> +			     THERM110S_BIT | THERM120S_BIT | THERM130S_BIT);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static umode_t mc34vr500_is_visible(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_min_alarm:
> +	case hwmon_temp_max_alarm:
> +	case hwmon_temp_crit_alarm:
> +	case hwmon_temp_emergency_alarm:
> +		return 0444;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mc34vr500_alarm_read(struct mc34vr500_data *data, int index,
> +				long *val)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, MC34VR500_INTSENSE0, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val = !!(reg & index);
> +
> +	return 0;
> +}
> +
> +static int mc34vr500_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *val)
> +{
> +	struct mc34vr500_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_min_alarm:
> +			return mc34vr500_alarm_read(data, LOWVINS_BIT, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max_alarm:
> +			return mc34vr500_alarm_read(data, THERM110S_BIT, val);
> +		case hwmon_temp_crit_alarm:
> +			return mc34vr500_alarm_read(data, THERM120S_BIT, val);
> +		case hwmon_temp_emergency_alarm:
> +			return mc34vr500_alarm_read(data, THERM130S_BIT, val);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *mc34vr500_info[] = {
> +	HWMON_CHANNEL_INFO(in, HWMON_I_MIN_ALARM),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM
> +			   | HWMON_T_EMERGENCY_ALARM),
> +	NULL,
> +};
> +
> +static const struct hwmon_ops mc34vr500_hwmon_ops = {
> +	.is_visible = mc34vr500_is_visible,
> +	.read = mc34vr500_read,
> +};
> +
> +static const struct hwmon_chip_info mc34vr500_chip_info = {
> +	.ops = &mc34vr500_hwmon_ops,
> +	.info = mc34vr500_info,
> +};
> +
> +static const struct regmap_config mc34vr500_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MC34VR500_INTSENSE0,
> +};
> +
> +static int mc34vr500_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct mc34vr500_data *data;
> +	struct device *hwmon_dev;
> +	int ret;
> +	unsigned int reg, revid, fabid;
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data = devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = regmap;
> +
> +	ret = regmap_read(regmap, MC34VR500_DEVICEID, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reg != MC34VR500_DEVICEID_VALUE)
> +		return -ENODEV;
> +
> +	ret = regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(regmap, MC34VR500_FABID, &fabid);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(dev, "mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &mc34vr500_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	data->hwmon_dev = hwmon_dev;
> +
> +	if (client->irq) {
> +		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +						mc34vr500_process_interrupt,
> +						IRQF_TRIGGER_RISING |
> +						IRQF_ONESHOT |
> +						IRQF_SHARED,
> +						dev_name(dev), data);
> +		if (ret)
> +			return ret;
> +
> +		/* write 1 to clear interrupts */
> +		ret = regmap_write(regmap, MC34VR500_INTSTAT0, LOWVINS_BIT |
> +				   THERM110S_BIT | THERM120S_BIT |
> +				   THERM130S_BIT);
> +		if (ret)
> +			return ret;
> +
> +		/* unmask interrupts */
> +		ret = regmap_write(regmap, MC34VR500_INTMASK0,
> +				   ~(LOWVINS_BIT | THERM110S_BIT |
> +				   THERM120S_BIT | THERM130S_BIT));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id mc34vr500_id[] = {
> +	{ "mc34vr500", 0 },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mc34vr500_id);
> +
> +static const struct of_device_id __maybe_unused mc34vr500_of_match[] = {
> +	{ .compatible = "nxp,mc34vr500" },
> +};
> +MODULE_DEVICE_TABLE(of, mc34vr500_of_match);
> +
> +static struct i2c_driver mc34vr500_driver = {
> +	.driver = {
> +		   .name = "mc34vr500",
> +		   .of_match_table = of_match_ptr(mc34vr500_of_match),
> +		    },
> +	.probe_new = mc34vr500_probe,
> +	.id_table = mc34vr500_id,
> +};
> +
> +module_i2c_driver(mc34vr500_driver);
> +
> +MODULE_AUTHOR("Mario Kicherer <dev@kicherer.org>");
> +
> +MODULE_DESCRIPTION("MC34VR500 driver");
> +MODULE_LICENSE("GPL");
