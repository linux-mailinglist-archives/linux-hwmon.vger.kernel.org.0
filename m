Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CB92ABFBB
	for <lists+linux-hwmon@lfdr.de>; Mon,  9 Nov 2020 16:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgKIPVm (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 9 Nov 2020 10:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKIPVl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Nov 2020 10:21:41 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEAA7C0613CF;
        Mon,  9 Nov 2020 07:21:41 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id t16so10542086oie.11;
        Mon, 09 Nov 2020 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YFcoVJmUhTvIq0QLBkIEWGwflJ8t4ItfNteIt9+4G7c=;
        b=slhozAIYVPcvAZOM+mkgUzZC5ZkCfluVaYWjg9QEKBkbA7FAMURO1UdrbsSAX16xWT
         /R+mOqVwvArrcix2GG0IbrzU54pQW+s5VkuRB1cEun9jSiRcwSx3ziS/O20uimL05jbp
         OadNqAyRvtSQAUy8wz42LG7SbRgGVZcmi9GtohkX2sNSP/gCPk+NzOTX2QC4ilOiadXP
         rYLo2/Zq6WSK4XVcluefqm/o7eHci+zYD7UWiFzPm49anmC6HYc3Z6mcjE00lHb1k1aI
         hUGP9l125xzwIW5G+EYQdxZqRDdzTOaBEJsHSCxsMgJsxvLxsbPdr6fiYiOlQIqv5V1I
         iORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YFcoVJmUhTvIq0QLBkIEWGwflJ8t4ItfNteIt9+4G7c=;
        b=iAd0NvQRKFRNuNniboRr2Alr7+eqdm4Nn7NKaAeYq5DgBQoqTPJbbjYMeBzYJggyDy
         cXwXE+4FfSAHZg+AHOb7WbnvpIsyr2o+1QECCfujAO19WRzMF8ZN9WjpH5Wv9n4OqgeS
         CG2nBdqajxmULGSNdjz4wrt/C+2Nl5WxwPIOYI+dwOPtETP2GMbC1XmarTW+S07NU6HV
         +9wZC9RFVHP4iiuIt+PDDDzrpwsc/Rnsqs2/Rv3p5oOsDt0HOVjHNAJ5WyDbuMZ1GPvV
         dOQVR/TVAkEqw3qYzZCsLXg9UrOwMEcvGU+An6MDMo4QqFBEMI8mfybzqpTkL1OccE9H
         z9Qw==
X-Gm-Message-State: AOAM531qmXf0EJeVrEWdDofE26O3f5NNB3bO/1zvw5TjljOyqQ2KnlhJ
        VDWBXQe0QoatD0eo1lroQdtw5B3c7/c=
X-Google-Smtp-Source: ABdhPJwDSJxe/uxf7lJMgniAM1vLgXUkwebKkEUa81N7+bvaYkhnChe7jNifgMbGQrpgLnkO4M6XiQ==
X-Received: by 2002:aca:c70b:: with SMTP id x11mr9605091oif.58.1604935300926;
        Mon, 09 Nov 2020 07:21:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w70sm2422515oiw.29.2020.11.09.07.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 07:21:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3] hwmon: Add driver for STMicroelectronics PM6764
 Voltage Regulator
To:     Charles <hsu.yungteng@gmail.com>, linux-kernel@vger.kernel.org
Cc:     alan@redhat.com, linux-hwmon@vger.kernel.org
References: <72177a5f-ed1a-9e5a-47f7-15904b17a81a@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <0e22af18-8426-0931-d2b7-342f62499146@roeck-us.net>
Date:   Mon, 9 Nov 2020 07:21:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <72177a5f-ed1a-9e5a-47f7-15904b17a81a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/9/20 12:41 AM, Charles wrote:
> Add the pmbus driver for the STMicroelectronics pm6764 voltage regulator.
> 
> the output voltage use the MFR_READ_VOUT 0xD4
> vout value returned is linear11
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---

No idea what happened, but the patch is corrupted and does not apply.
I would suggest to try to apply it yourself before sending it out.

> v3:
>  - Add Documentation(Documentation/hwmon/pm6764tr.rst).
>  - Fix include order.
> v2:
>  - Fix formatting.
>  - Remove pmbus_do_remove.
>  - Change from .probe to .probe_new. 
> v1:
>  - Initial patchset.
> ---
>  Documentation/hwmon/pm6764tr.rst | 30 ++++++++++++

That also needs to be added to
Documentation/hwmon/index.rst.

>  drivers/hwmon/pmbus/Kconfig      |  9 ++++
>  drivers/hwmon/pmbus/Makefile     |  1 +
>  drivers/hwmon/pmbus/pm6764tr.c   | 78 ++++++++++++++++++++++++++++++++
>  4 files changed, 118 insertions(+)
>  create mode 100644 Documentation/hwmon/pm6764tr.rst
>  create mode 100644 drivers/hwmon/pmbus/pm6764tr.c
> 
> diff --git a/Documentation/hwmon/pm6764tr.rst b/Documentation/hwmon/pm6764tr.rst
> new file mode 100644
> index 000000000000..8491b9dde1cb
> --- /dev/null
> +++ b/Documentation/hwmon/pm6764tr.rst
> @@ -0,0 +1,30 @@

SPDX license missing

> +Kernel driver pm6764tr
> +=====================

One more '='

> +
> +Supported chips:
> +
> +  * ST PM6764TR
> +
> +    Prefix: 'pm6764tr'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: http://www.st.com/resource/en/data_brief/pm6764.pdf

Add empty line

> +Authors:
> +	<hsu.yungteng@gmail.com>
> +
> +Description:
> +------------
> +
> +This driver supports the STMicroelectronics PM6764TR chip. The PM6764TR is a high
> +performance digital controller designed to power Intel’s VR12.5 processors and memories.
> +
> +The device utilizes digital technology to implement all control and power management
> +functions to provide maximum flexibility and performance. The NVM is embedded to store
> +custom configurations. The PM6764TR device features up to 4-phase programmable operation.
> +
> +The PM6764TR supports power state transitions featuring VFDE, and programmable DPM
> +maintaining the best efficiency over all loading conditions without compromising transient
> +response. The device assures fast and independent protectionagainstload overcurrent,
> +under/overvoltage and feedback disconnections.
> +
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index a25faf69fce3..9c846facce9f 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -220,6 +220,15 @@ config SENSORS_MP2975
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp2975.
>  
> +config SENSORS_PM6764TR
> +	tristate "ST PM6764TR"
> +	help
> +	  If you say yes here you get hardware monitoring support for ST
> +	  PM6764TR.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called pm6764tr.
> +
>  config SENSORS_PXE1610
>  	tristate "Infineon PXE1610"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 4c97ad0bd791..31ebdef5d4a6 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
> +obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
> new file mode 100644
> index 000000000000..2ab68036bb0c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/pm6764tr.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for STMicroelectronics digital controller PM6764TR
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pmbus.h>
> +#include <linux/slab.h>
> +#include "pmbus.h"
> +
> +#define PM6764TR_PMBUS_READ_VOUT	0xD4
> +
> +static int pm6764tr_read_word_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_READ_VMON:
> +		ret = pmbus_read_word_data(client, page, PM6764TR_PMBUS_READ_VOUT);
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info pm6764tr_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = vid,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |  PMBUS_HAVE_PIN |
> +	    PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | PMBUS_HAVE_VMON |
> +		PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +	.read_word_data = pm6764tr_read_word_data,
> +};
> +
> +static int pm6764tr_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
> +{
> +	return pmbus_do_probe(client, id, &pm6764tr_info);
> +}
> +
> +static const struct i2c_device_id pm6764tr_id[] = {
> +	{"pm6764tr", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, pm6764tr_id);
> +
> +static const struct of_device_id pm6764tr_of_match[] = {
> +	{.compatible = "pm6764tr"},
> +	{}
> +};
> +
> +/* This is the driver that will be inserted */
> +static struct i2c_driver pm6764tr_driver = {
> +	.driver = {
> +		   .name = "pm6764tr",
> +		   .of_match_table = of_match_ptr(pm6764tr_of_match),
> +		   },
> +	.probe_new = pm6764tr_probe,
> +	.id_table = pm6764tr_id,
> +};
> +
> +module_i2c_driver(pm6764tr_driver);
> +
> +MODULE_AUTHOR("Charles Hsu");
> +MODULE_DESCRIPTION("PMBus driver for  ST PM6764TR");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

