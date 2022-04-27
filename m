Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF395123D5
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 Apr 2022 22:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiD0U0r (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 27 Apr 2022 16:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbiD0U0p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Apr 2022 16:26:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D0DAC07D
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 13:23:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r13so5627694ejd.5
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Apr 2022 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W89anPYfMdDk6SKBUuMsZDx+r/l08/tGETd+v7mRUqk=;
        b=RLiRVvd4z6YocTXkRyHN2msqo8XbS8dl8/8e3Td0LEcdt+Kr+asYbv9iyJeT2/c2jW
         d7BvLcDfKpkRio+PT5uPYeLzZGoqVqT+Y08TYoy43v98MF5SPdOFRNvklXb26F3HvmuU
         +W3PrnXrosAnw706veB78H1/F9yrVvC5MmadDZIqo2RGe9/06bB9K7VvzHbagKLX2DLl
         KWKgE4QiFCtaUCnOAeHl/ncB1WoYbQ/PdiwRHsloJVfBIMyTILBMt9cShqcs4d3+9ci8
         Maukujz023b4y8dW3oHPvyx0DZ/QXPhZYAo4lE5pQKNjdq9z0KKGx0cj2D2keR5d2F3m
         Vf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W89anPYfMdDk6SKBUuMsZDx+r/l08/tGETd+v7mRUqk=;
        b=iQexGjIns8YF8EYIvpKwOjjk+skF9NgLK7wCQ95y+WZwYz4k6qh6p6TCJWJix5yYu2
         lIGp1SOrMv0X9rKNckmAbnVfFbLLSYIQNRISRV0sdRON1t2R8eGz7cLeWxQvyp9kqlyR
         HUMraQwKKJnASI1xcbSWE2g1inyT+i/J/49l1gBdxAR7c1ryOpAT5vyXnv9HOkW05qRV
         5qsfnqn393gQA6HATyqW/npqyKx008+wr3191g+sRQA1wg3hFGbPoDdvV8w4btGdgCPH
         HxiNRyj1Yf3BRkreoKidVLP/fm4mj+1nQREiSa6jw09HjxwzwIjMtP6WbYFNw7ySN5Zw
         fJjQ==
X-Gm-Message-State: AOAM533F5u3HrNkRVMi0UXo91b2/cixgLnfUD6oau9Goitd2QFlMg51G
        AQOr9n3ItMO9rV4sTAqw7KXV2yrRtdM=
X-Google-Smtp-Source: ABdhPJz7mBGWnSZkXEhR9df/uMKeOa9GfoaDI6HXXXZ8sLrPVEFWQtTusoUEV/Fw/ijQrdoISkMjRA==
X-Received: by 2002:a17:907:94cd:b0:6f3:ce51:af98 with SMTP id dn13-20020a17090794cd00b006f3ce51af98mr3654272ejc.510.1651091009810;
        Wed, 27 Apr 2022 13:23:29 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id bo9-20020a0564020b2900b0042617ba63a5sm147953edb.47.2022.04.27.13.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 13:23:29 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Ruslan Zalata <rz@fabmicro.ru>
Cc:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: Add hwmon driver for LRADC found on Allwinner A13/A20 SoCs
Date:   Wed, 27 Apr 2022 22:23:28 +0200
Message-ID: <6425291.4vTCxPXJkl@jernej-laptop>
In-Reply-To: <202204272007.23RK74Ds021079@devbox.fabmicro.ru>
References: <202204272007.23RK74Ds021079@devbox.fabmicro.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Ruslan!

Dne sreda, 27. april 2022 ob 21:25:12 CEST je Ruslan Zalata napisal(a):
> Some Allwinner SoCs like A13, A20 or T2 are equipped with two-channel
> low rate (6 bit) ADC that is often used for extra keys. There's a driver
> for that already implementing standard input device, but it has these
> limitations: 1) it cannot be used for general ADC data equisition, and
> 2) it uses only one LRADC channel of two available.
> 
> This driver provides basic hwmon interface to both channels of LRADC on
> such Allwinner SoCs.
> 
> Signed-off-by: Ruslan Zalata <rz@fabmicro.ru>

Before even going to check actual driver, please read https://www.kernel.org/
doc/html/latest/process/submitting-patches.html in detail.

Just few basic things to fix first:
1. subject doesn't conform to rules
2. send patch to maintainers and mailing lists (use scripts/get_maintainer.pl)
3. code has style issues (multiple empty lines). Run scripts/checkpatch.pl --
strict on your patch before submission and fix all reported issues.
4. you sent same patch two times. If it's same, it should be marked with 
RESEND, if not, it should be versioned (V2, V3, etc.) with short changelog 
after --- line (as explained in above link)
5. it's customary to add new entry in MAINTAINERS when adding new driver

Best regards,
Jernej

> ---
>  drivers/hwmon/Kconfig             |  13 ++
>  drivers/hwmon/Makefile            |   1 +
>  drivers/hwmon/sun4i-lradc-hwmon.c | 278 ++++++++++++++++++++++++++++++
>  3 files changed, 292 insertions(+)
>  create mode 100644 drivers/hwmon/sun4i-lradc-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 68a8a27ab3b..b7732a9e992 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -521,6 +521,19 @@ config I8K
>  	  Say Y if you intend to run userspace programs that use this 
interface.
>  	  Say N otherwise.
> 
> +config SENSORS_SUN4I_LRADC
> +	tristate "Allwinner A13/A20 LRADC hwmon"
> +	depends on ARCH_SUNXI && (!KEYBOARD_SUN4I_LRADC)
> +	help
> +	  Say y here to support the LRADC found in Allwinner A13/A20 SoCs.
> +	  Both channels are supported.
> +
> +	  This driver can also be built as module. If so, the module
> +	  will be called sun4i-lradc-hwmon.
> +
> +	  This option is not compatible with KEYBOARD_SUN4I_LRADC, one
> +	  of these should be used at a time.
> +
>  config SENSORS_DA9052_ADC
>  	tristate "Dialog DA9052/DA9053 ADC"
>  	depends on PMIC_DA9052
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 8a03289e2aa..43bed6fff27 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_SENSORS_AD7314)	+= ad7314.o
>  obj-$(CONFIG_SENSORS_AD7414)	+= ad7414.o
>  obj-$(CONFIG_SENSORS_AD7418)	+= ad7418.o
>  obj-$(CONFIG_SENSORS_ADC128D818) += adc128d818.o
> +obj-$(CONFIG_SENSORS_SUN4I_LRADC) += sun4i-lradc-hwmon.o
>  obj-$(CONFIG_SENSORS_ADCXX)	+= adcxx.o
>  obj-$(CONFIG_SENSORS_ADM1021)	+= adm1021.o
>  obj-$(CONFIG_SENSORS_ADM1025)	+= adm1025.o
> diff --git a/drivers/hwmon/sun4i-lradc-hwmon.c
> b/drivers/hwmon/sun4i-lradc-hwmon.c new file mode 100644
> index 00000000000..1947b716dbf
> --- /dev/null
> +++ b/drivers/hwmon/sun4i-lradc-hwmon.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Allwinner sun4i (A13/A20) LRADC hwmon driver
> + *
> + * Copyright (C) 2022 Fabmicro, LLC., Tyumen, Russia.
> + * Copyright (C) 2022 Ruslan Zalata <rz@fabmicro.ru>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +
> +#define LRADC_CTRL		0x00
> +#define LRADC_INTC		0x04
> +#define LRADC_INTS		0x08
> +#define LRADC_DATA0		0x0c
> +#define LRADC_DATA1		0x10
> +
> +/* LRADC_CTRL bits */
> +#define FIRST_CONVERT_DLY(x)	((x) << 24) /* 8 bits */
> +#define CHAN_SELECT(x)		((x) << 22) /* 2 bits */
> +#define CONTINUE_TIME_SEL(x)	((x) << 16) /* 4 bits */
> +#define KEY_MODE_SEL(x)		((x) << 12) /* 2 bits */
> +#define LEVELA_B_CNT(x)		((x) << 8)  /* 4 bits */
> +#define HOLD_KEY_EN(x)		((x) << 7)
> +#define HOLD_EN(x)		((x) << 6)
> +#define LEVELB_VOL(x)		((x) << 4)  /* 2 bits */
> +#define SAMPLE_RATE(x)		((x) << 2)  /* 2 bits */
> +#define ENABLE(x)		((x) << 0)
> +
> +/* LRADC_INTC and LRADC_INTS bits */
> +#define CHAN1_KEYUP_IRQ		BIT(12)
> +#define CHAN1_ALRDY_HOLD_IRQ	BIT(11)
> +#define CHAN1_HOLD_IRQ		BIT(10)
> +#define	CHAN1_KEYDOWN_IRQ	BIT(9)
> +#define CHAN1_DATA_IRQ		BIT(8)
> +#define CHAN0_KEYUP_IRQ		BIT(4)
> +#define CHAN0_ALRDY_HOLD_IRQ	BIT(3)
> +#define CHAN0_HOLD_IRQ		BIT(2)
> +#define	CHAN0_KEYDOWN_IRQ	BIT(1)
> +#define CHAN0_DATA_IRQ		BIT(0)
> +
> +
> +struct lradc_variant {
> +	u32 bits;
> +	u32 resolution;
> +	u32 vref;
> +};
> +
> +struct lradc_variant variant_sun4i_a10_lradc = {
> +	.bits = 0x3f,
> +	.resolution = 63,
> +	.vref = 2000000,
> +};
> +
> +struct lradc_variant variant_sun8i_a83t_r_lradc = {
> +	.bits = 0x3f,
> +	.resolution = 63,
> +	.vref = 2000000,
> +};
> +
> +static const struct of_device_id sun4i_lradc_of_match[];
> +
> +
> +struct sun4i_lradc_data {
> +	struct device *dev;
> +	struct device *hwmon_dev;
> +	void __iomem *base;
> +	const struct lradc_variant *variant;
> +	u32 in[2];
> +	u32 in_mvolts[2];
> +};
> +
> +
> +static ssize_t lradc_in_mvolts_show(struct device *dev,
> +			struct device_attribute *attr, char *buf)
> +{
> +	struct sun4i_lradc_data *data = dev_get_drvdata(dev);
> +	int nr = to_sensor_dev_attr_2(attr)->nr;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return sprintf(buf, "%d\n", data->in_mvolts[nr]);
> +}
> +
> +static ssize_t lradc_in_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct sun4i_lradc_data *data = dev_get_drvdata(dev);
> +	int nr = to_sensor_dev_attr_2(attr)->nr;
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return sprintf(buf, "%d\n", data->in[nr]);
> +}
> +
> +
> +static umode_t lradc_is_visible(struct kobject *kobj,
> +		struct attribute *attr, int index)
> +{
> +	return attr->mode;
> +}
> +
> +
> +
> +static SENSOR_DEVICE_ATTR_2_RO(in0_input, lradc_in, 0, 0);
> +static SENSOR_DEVICE_ATTR_2_RO(in0_input_mvolts, lradc_in_mvolts, 0, 1);
> +
> +static SENSOR_DEVICE_ATTR_2_RO(in1_input, lradc_in, 1, 0);
> +static SENSOR_DEVICE_ATTR_2_RO(in1_input_mvolts, lradc_in_mvolts, 1, 1);
> +
> +static struct attribute *lradc_attrs[] = {
> +	&sensor_dev_attr_in0_input.dev_attr.attr,
> +	&sensor_dev_attr_in0_input_mvolts.dev_attr.attr,
> +	&sensor_dev_attr_in1_input.dev_attr.attr,
> +	&sensor_dev_attr_in1_input_mvolts.dev_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group lradc_group = {
> +	.attrs = lradc_attrs,
> +	.is_visible = lradc_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(lradc);
> +
> +
> +static irqreturn_t sun4i_lradc_irq(int irq, void *dev_id)
> +{
> +	struct sun4i_lradc_data *lradc = dev_id;
> +	u32 ints;
> +
> +	ints  = readl(lradc->base + LRADC_INTS);
> +
> +	if (ints & CHAN0_DATA_IRQ) {
> +		lradc->in[0] = readl(lradc->base + LRADC_DATA0) &
> +			lradc->variant->bits;
> +		lradc->in_mvolts[0] = lradc->in[0] * lradc->variant-
>vref /
> +			lradc->variant->resolution / 1000;
> +	}
> +
> +	if (ints & CHAN1_DATA_IRQ) {
> +		lradc->in[1] = readl(lradc->base + LRADC_DATA1) &
> +			lradc->variant->bits;
> +		lradc->in_mvolts[1] = lradc->in[1] * lradc->variant-
>vref /
> +			lradc->variant->resolution / 1000;
> +	}
> +
> +	writel(ints, lradc->base + LRADC_INTS);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int sun4i_lradc_open(struct device *dev)
> +{
> +	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
> +
> +	writel(FIRST_CONVERT_DLY(2) | CHAN_SELECT(3) | LEVELA_B_CNT(1) |
> +		HOLD_EN(1) | KEY_MODE_SEL(2) | SAMPLE_RATE(3) | 
ENABLE(1),
> +		lradc->base + LRADC_CTRL);
> +
> +	writel(CHAN0_DATA_IRQ | CHAN1_DATA_IRQ, lradc->base + LRADC_INTC);
> +
> +	return 0;
> +}
> +
> +static void sun4i_lradc_close(struct device *dev)
> +{
> +	struct sun4i_lradc_data *lradc = dev_get_drvdata(dev);
> +
> +	writel(FIRST_CONVERT_DLY(2) | LEVELA_B_CNT(1) | HOLD_EN(1) |
> +		SAMPLE_RATE(2), lradc->base + LRADC_CTRL);
> +	writel(0, lradc->base + LRADC_INTC);
> +}
> +
> +static int sun4i_lradc_resume(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	return sun4i_lradc_open(dev);
> +}
> +
> +static int sun4i_lradc_suspend(struct platform_device *pdev, pm_message_t
> state) +{
> +	struct device *dev = &pdev->dev;
> +
> +	sun4i_lradc_close(dev);
> +	return 0;
> +}
> +
> +static int sun4i_lradc_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	sun4i_lradc_close(dev);
> +	return 0;
> +}
> +
> +static int sun4i_lradc_probe(struct platform_device *pdev)
> +{
> +	struct sun4i_lradc_data *lradc;
> +	struct device *dev = &pdev->dev;
> +	int error;
> +
> +	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), 
GFP_KERNEL);
> +	if (!lradc)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, lradc);
> +
> +	lradc->variant = of_device_get_match_data(&pdev->dev);
> +	if (!lradc->variant) {
> +		dev_err(&pdev->dev, "Missing '%s' or '%s' variant\n",
> +			sun4i_lradc_of_match[0].compatible,
> +			sun4i_lradc_of_match[1].compatible);
> +		return -EINVAL;
> +	}
> +
> +	lradc->dev = dev;
> +	lradc->hwmon_dev = devm_hwmon_device_register_with_groups(dev, 
"lradc",
> +							
lradc, lradc_groups);
> +	if (IS_ERR(lradc->hwmon_dev)) {
> +		error = PTR_ERR(lradc->hwmon_dev);
> +		return error;
> +	}
> +
> +	lradc->base = devm_ioremap_resource(dev,
> +			platform_get_resource(pdev, IORESOURCE_MEM, 
0));
> +	if (IS_ERR(lradc->base))
> +		return PTR_ERR(lradc->base);
> +
> +	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
> +			sun4i_lradc_irq, 0, "sun4i-lradc-hwmon", 
lradc);
> +	if (error)
> +		return error;
> +
> +	error = sun4i_lradc_open(dev);
> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sun4i_lradc_of_match[] = {
> +	{ .compatible = "allwinner,sun4i-a10-lradc-keys", .data =
> &variant_sun4i_a10_lradc}, +	{ .compatible =
> "allwinner,sun8i-a83t-r-lradc", .data = &variant_sun8i_a83t_r_lradc}, +	
{
> /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sun4i_lradc_of_match);
> +
> +static struct platform_driver sun4i_lradc_driver = {
> +	.driver = {
> +		.name	= "sun4i-lradc-hwmon",
> +		.of_match_table = of_match_ptr(sun4i_lradc_of_match),
> +	},
> +	.probe	= sun4i_lradc_probe,
> +	.remove	= sun4i_lradc_remove,
> +	.resume	= sun4i_lradc_resume,
> +	.suspend = sun4i_lradc_suspend,
> +};
> +
> +module_platform_driver(sun4i_lradc_driver);
> +
> +
> +
> +
> +MODULE_DESCRIPTION("Allwinner A13/A20 LRADC hwmon driver");
> +MODULE_AUTHOR("Ruslan Zalata <rz@fabmicro.ru>");
> +MODULE_LICENSE("GPL");




