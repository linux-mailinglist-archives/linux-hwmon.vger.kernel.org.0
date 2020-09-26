Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2628279BC9
	for <lists+linux-hwmon@lfdr.de>; Sat, 26 Sep 2020 20:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbgIZSJ2 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 26 Sep 2020 14:09:28 -0400
Received: from mail.nic.cz ([217.31.204.67]:45656 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729412AbgIZSJ2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 26 Sep 2020 14:09:28 -0400
X-Greylist: delayed 1155 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Sep 2020 14:09:25 EDT
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 2570813FD77;
        Sat, 26 Sep 2020 20:09:24 +0200 (CEST)
Date:   Sat, 26 Sep 2020 20:09:23 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr
Subject: Re: [PATCH v2 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED
 driver
Message-ID: <20200926200923.4641533d@nic.cz>
In-Reply-To: <20200926135514.26189-5-luka.kovacic@sartura.hr>
References: <20200926135514.26189-1-luka.kovacic@sartura.hr>
        <20200926135514.26189-5-luka.kovacic@sartura.hr>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 26 Sep 2020 15:55:11 +0200
Luka Kovacic <luka.kovacic@sartura.hr> wrote:

> Add support for the iEi WT61P803 PUZZLE LED driver.
> Currently only the front panel power LED is supported.
> 
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Cc: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/leds/Kconfig                    |   8 ++
>  drivers/leds/Makefile                   |   1 +
>  drivers/leds/leds-iei-wt61p803-puzzle.c | 174 ++++++++++++++++++++++++
>  3 files changed, 183 insertions(+)
>  create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df24eae..8a25fb753dec 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -332,6 +332,14 @@ config LEDS_IPAQ_MICRO
>  	  Choose this option if you want to use the notification LED on
>  	  Compaq/HP iPAQ h3100 and h3600.
>  
> +config LEDS_IEI_WT61P803_PUZZLE
> +	tristate "LED Support for the iEi WT61P803 PUZZLE MCU"
> +	depends on LEDS_CLASS
> +	depends on MFD_IEI_WT61P803_PUZZLE
> +	help
> +	  This option enables support for LEDs controlled by the iEi WT61P803
> +	  M801 MCU.
> +
>  config LEDS_HP6XX
>  	tristate "LED Support for the HP Jornada 6xx"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c2c7d7ade0d0..cd362437fefd 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
>  obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
>  obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
>  obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
> +obj-$(CONFIG_LEDS_IEI_WT61P803_PUZZLE)	+= leds-iei-wt61p803-puzzle.o
>  obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
>  obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
>  obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
> diff --git a/drivers/leds/leds-iei-wt61p803-puzzle.c b/drivers/leds/leds-iei-wt61p803-puzzle.c
> new file mode 100644
> index 000000000000..b9a977575a23
> --- /dev/null
> +++ b/drivers/leds/leds-iei-wt61p803-puzzle.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* iEi WT61P803 PUZZLE MCU LED Driver
> + *
> + * Copyright (C) 2020 Sartura Ltd.
> + * Author: Luka Kovacic <luka.kovacic@sartura.hr>
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/mfd/iei-wt61p803-puzzle.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +enum iei_wt61p803_puzzle_led_state {
> +	IEI_LED_OFF = 0x30,
> +	IEI_LED_ON = 0x31,
> +	IEI_LED_BLINK_5HZ = 0x32,
> +	IEI_LED_BLINK_1HZ = 0x33,
> +};
> +
> +/**
> + * struct iei_wt61p803_puzzle_led - MCU LED Driver
> + *
> + * @mcu:		MCU struct pointer
> + * @response_buffer	Global MCU response buffer allocation
> + * @lock:		General mutex lock for LED operations
> + * @led_power_state:	State of the front panel power LED
> + */
> +struct iei_wt61p803_puzzle_led {
> +	struct iei_wt61p803_puzzle *mcu;
> +	unsigned char *response_buffer;
> +	struct mutex lock;
> +	int led_power_state;
> +};
> +
> +static inline struct iei_wt61p803_puzzle_led *cdev_to_iei_wt61p803_puzzle_led
> +	(struct led_classdev *led_cdev)
> +{
> +	return dev_get_drvdata(led_cdev->dev->parent);
> +}
> +
> +static int iei_wt61p803_puzzle_led_brightness_set_blocking(struct led_classdev *cdev,
> +		enum led_brightness brightness)
> +{
> +	struct iei_wt61p803_puzzle_led *mcu_led =
> +		cdev_to_iei_wt61p803_puzzle_led(cdev);
> +	unsigned char led_power_cmd[5] = {
> +		IEI_WT61P803_PUZZLE_CMD_HEADER_START,
> +		IEI_WT61P803_PUZZLE_CMD_LED,
> +		IEI_WT61P803_PUZZLE_CMD_LED_POWER,
> +		(char)IEI_LED_OFF
> +	};
> +	unsigned char *resp_buf = mcu_led->response_buffer;
> +	size_t reply_size;
> +
> +	mutex_lock(&mcu_led->lock);
> +	if (brightness == LED_OFF) {
> +		led_power_cmd[3] = (char)IEI_LED_OFF;
> +		mcu_led->led_power_state = LED_OFF;
> +	} else {
> +		led_power_cmd[3] = (char)IEI_LED_ON;
> +		mcu_led->led_power_state = LED_ON;
> +	}
> +	mutex_unlock(&mcu_led->lock);
> +
> +	return iei_wt61p803_puzzle_write_command(mcu_led->mcu, led_power_cmd,
> +			sizeof(led_power_cmd), resp_buf, &reply_size);
> +}
> +
> +static enum led_brightness
> +iei_wt61p803_puzzle_led_brightness_get(struct led_classdev *cdev)
> +{
> +	struct iei_wt61p803_puzzle_led *mcu_led =
> +		cdev_to_iei_wt61p803_puzzle_led(cdev);
> +	int led_state;
> +
> +	mutex_lock(&mcu_led->lock);
> +	led_state = mcu_led->led_power_state;
> +	mutex_unlock(&mcu_led->lock);
> +
> +	return led_state;
> +}
> +
> +static int iei_wt61p803_puzzle_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iei_wt61p803_puzzle *mcu = dev_get_drvdata(dev->parent);
> +	struct iei_wt61p803_puzzle_led *mcu_led;
> +	struct fwnode_handle *child;
> +	const char *label;
> +	int ret;
> +
> +	mcu_led = devm_kzalloc(dev, sizeof(*mcu_led), GFP_KERNEL);
> +	if (!mcu_led)
> +		return -ENOMEM;
> +
> +	mcu_led->response_buffer = devm_kzalloc(dev,
> +			IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL);
> +	if (!mcu_led->response_buffer)
> +		return -ENOMEM;
> +
> +	mcu_led->mcu = mcu;
> +	mcu_led->led_power_state = 1;
> +	mutex_init(&mcu_led->lock);
> +	dev_set_drvdata(dev, mcu_led);
> +
> +	device_for_each_child_node(dev, child) {
> +		struct led_classdev *led;
> +		u32 reg;
> +
> +		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);

Avoid multiple allocations.

Please look
at
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=4351dceba0ff929f667867f9bb69210f08f61717

To avoid multiple allocations, please use flexible array members.

Does this controller support multiple LEDs? The device tree you
provided only defines one.

If it supports multiple LED:
Rename the mcu_led to mcu_leds, or chip, or (semantically best in this
driver) priv.
Add member
  struct led_classdev leds[];
to that structure.
Then allocate by
  count = device_get_child_node_count(dev);
  priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);

If the device supports only one LED, just put
  struct led_classdev cdev;
to the private structure of this driver. And don't use
device_for_each_child_node, just check whether there is exactly one
child node (device_get_child_node_count), get it via
  child = device_get_next_child_node(dev, NULL);
and after registering the LED
  fwnode_handle_put(child);
This was done in:
https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/commit/?h=for-next&id=e92e7e8aa066904def9a5d584ece7fb6ae512dbd

> +		if (!led) {
> +			ret = -ENOMEM;
> +			goto err_child_node;
> +		}
> +
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret || reg > 1) {
> +			dev_err(dev, "Could not register 'reg' (%lu)\n", (unsigned long)reg);
> +			ret = -EINVAL;
> +			goto err_child_node;
> +		}
> +
> +		if (fwnode_property_read_string(child, "label", &label)) {
> +			led->name = "iei-wt61p803-puzzle-led::";
> +		} else {
> +			led->name = devm_kasprintf(dev, GFP_KERNEL,
> +					"iei-wt61p803-puzzle-led:%s", label);
> +			if (!led->name) {
> +				ret = -ENOMEM;
> +				goto err_child_node;
> +			}
> +		}

Parsing of label is done by LED core if you use
devm_led_classdev_register_ext. Also, label is obsolete. The LED name
should be composed from color, function and device.
Also please dont pass devicename "iei-wt61p803-puzzle-led" here. We
want to make the LED subsystem derive the device name somehow, and
afterwards we would need to change this. Also the devicename should
refer to the device the LED is triggering to (ie. if the LED is set in
devicetree to trigger on activity on eth0, the devicename should be
eth0 or something, not the name of this driver).

Just remove this code and let devm_led_classdev_register_ext do its
thing.

> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +				&led->default_trigger);
> +

Parsing of linux,default-trigger is done by LED core if you use
devm_led_classdev_register_ext.

> +		led->brightness_set_blocking = iei_wt61p803_puzzle_led_brightness_set_blocking;
> +		led->brightness_get = iei_wt61p803_puzzle_led_brightness_get;
> +		led->max_brightness = 1;
> +
> +		ret = devm_led_classdev_register(dev, led);

Please use extended LED registration API, with
devm_led_classdev_register_ext. Pass init_data with fwnode member set
to child.

> +		if (ret) {
> +			dev_err(dev, "Could not register %s\n", led->name);
> +			goto err_child_node;
> +		}
> +	}
> +	return 0;
> +err_child_node:
> +	fwnode_handle_put(child);
> +	return ret;
> +}
> +
> +static const struct of_device_id iei_wt61p803_puzzle_led_of_match[] = {
> +	{ .compatible = "iei,wt61p803-puzzle-leds" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, iei_wt61p803_puzzle_led_of_match);
> +
> +static struct platform_driver iei_wt61p803_puzzle_led_driver = {
> +	.driver = {
> +		.name = "iei-wt61p803-puzzle-led",
> +		.of_match_table = iei_wt61p803_puzzle_led_of_match,
> +	},
> +	.probe = iei_wt61p803_puzzle_led_probe,
> +};
> +module_platform_driver(iei_wt61p803_puzzle_led_driver);
> +
> +MODULE_DESCRIPTION("iEi WT61P803 PUZZLE front panel LED driver");
> +MODULE_AUTHOR("Luka Kovacic <luka.kovacic@sartura.hr>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:leds-iei-wt61p803-puzzle");

Marek
