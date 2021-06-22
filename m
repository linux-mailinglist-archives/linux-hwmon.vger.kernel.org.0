Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3803AFFD2
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Jun 2021 11:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbhFVJGc (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 22 Jun 2021 05:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhFVJGb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jun 2021 05:06:31 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A71C061574;
        Tue, 22 Jun 2021 02:04:16 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id b7so2660175ioq.12;
        Tue, 22 Jun 2021 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aVuGiaAOgcXSP7UILLbgCHjnLH3MJHxmRnG2zF1rBr8=;
        b=aQiVfAkHow7Wm/JvcnrBRdT0fteZ7P/Rnhp/BCPuWUmaF/fitwO91/3bE7OAdB1MW+
         f/i5hDYOQ4VVEecCtZmaFrQs6+QFtq0iKNL5BAZV/Gg7kKaEEFFBslu3bO8fyNUAT4EK
         euktlwqrjoI3pfcoUhuRsjz43VtST3aAcorEjueTFbUTrSpInG3nsxAsMlNegbGQSF06
         F977LXrEdzSMKma9cM2oFuSBB8kk7hIVhkRKSGCZuQfsr5iI7nO+/ZgE2ocBiBXRpU11
         ZPzQUXK7yvaDbx8Ai3A+s1TPK0XmODo5te/zmUoLGvYek9kqCTmEI5zkdMZK60J3/T4J
         cPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVuGiaAOgcXSP7UILLbgCHjnLH3MJHxmRnG2zF1rBr8=;
        b=to06nYvA2MLEh/wA1dCR3gwH6GIovPoz4waKW21cPGvtkZkHtl5Q8xN95LvreMTFMt
         ZJKHt9I1z9IkzIO5Px83rEdhiPtzmUnCqoMLSgQE+KE2kKp88V3p4DHarj2657OMu9aI
         ZHywg0tQ3A+yaSrzCjyie7pUjYl54xeTHahxpS2W73wZXIVvieoPzwAzLFERzykuGrql
         2UMHCLCNhnuf2skhOoIDEA+ftBz53X+mbwq/rHCQnBXkvs/i9M9N3srbCRqWeZvhHzws
         e7DpEypJ69ocLbGDLIYbIUiDcCSNtcXW8QBBupGUFeb00tuVxKjkcIpy8l1GHUhc0wql
         Xmww==
X-Gm-Message-State: AOAM533uU83tMl316n9zRlbSt3NvDuYeyai9VRBoAJ5Ol5o4tjKzAaEW
        h05H7LOoqZgHhwSGzQl/VKbbJwYX+YcLfjBF58Y=
X-Google-Smtp-Source: ABdhPJxxnVrf210/KgvkwdXqYGpAHzy4imrWt1STJ6QhzWpgVVKpDzjzr198XgqUkh1lf+P5pCiPifIOrWW4A0+8rWo=
X-Received: by 2002:a5e:dd08:: with SMTP id t8mr2035966iop.173.1624352655651;
 Tue, 22 Jun 2021 02:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210622085826.39200-1-ainux.wang@gmail.com>
In-Reply-To: <20210622085826.39200-1-ainux.wang@gmail.com>
From:   Ainux Wang <ainux.wang@gmail.com>
Date:   Tue, 22 Jun 2021 17:03:38 +0800
Message-ID: <CAPWE4_yd0rEo5LSPtJy6PjgAtoNe_6pQiAuoH=+HaMBbZ7sqhw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (pmbus) Add support for MPS MP2949A
To:     jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Ainux Wang <ainux.wang@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        teng sterling <sterlingteng@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi, Guenter and others,
    I'm sorry, it's the wrong subject.
Best regards,
Ainux Wang.

On Tue, 22 Jun 2021 at 16:58, <ainux.wang@gmail.com> wrote:
>
> From: "Ainux.Wang" <ainux.wang@gmail.com>
>
> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
> This is a triple-loop, digital, multi-phase controller.
> This device:
> - Supports up to three power rail.
> - Provides 6 pulse-width modulations (PWMs), and can be configured up
>   to 6-phase operation for Rail A , up to 2-phase operation for Rail B
>   and up to 1-phase operation for Rail C.
> - The PMBus registers are distributed into three pages: Page 0, Page 1,
>   Page 2. Page 0 contains the registers for Rail A and most of the common
>   settings for all of the rails. Page 1 contains register information for
>   Rail B. Page 2 contains register information for Rail C.
> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
>   IMVP9.
>
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
>
> v4:
> - Removed mp2949a_read_byte_data().
> - Added space before and after '-' and fixed a bug that is '~' on line 35.
>
> v3:
> - Added change log here.
> - Errors in the document have been modified.
> - Fixed PMBUS_VOUT_MODE to MP2949A_MFR_VR_CONFIG.
> - Removed unnecessary vout_params and empty line.
>
> v2:
> - Reference has been added to Documentation/hwmon/index.rst.
> - Droped 'vendor'.
> - Removed change codes of the PMBus core and added mp2949a_identify()
>   and mp2949a_read_byte_data() to this driver.
>
> v1:
> - Add support for MPS MP2949A.
> ---
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/mp2949a.rst |  44 ++++++++++++++
>  drivers/hwmon/pmbus/Kconfig     |   9 +++
>  drivers/hwmon/pmbus/Makefile    |   1 +
>  drivers/hwmon/pmbus/mp2949a.c   | 102 ++++++++++++++++++++++++++++++++
>  5 files changed, 157 insertions(+)
>  create mode 100644 Documentation/hwmon/mp2949a.rst
>  create mode 100644 drivers/hwmon/pmbus/mp2949a.c
>
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9ed60fa84cbe..56aac3b1678d 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -137,6 +137,7 @@ Hardware Monitoring Kernel Drivers
>     mcp3021
>     menf21bmc
>     mlxreg-fan
> +   mp2949a
>     mp2975
>     nct6683
>     nct6775
> diff --git a/Documentation/hwmon/mp2949a.rst b/Documentation/hwmon/mp2949a.rst
> new file mode 100644
> index 000000000000..0235dec70f63
> --- /dev/null
> +++ b/Documentation/hwmon/mp2949a.rst
> @@ -0,0 +1,44 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2949a
> +====================
> +
> +Supported chips:
> +
> +  * MPS MP2949A
> +
> +    Prefix: 'mp2949a'
> +
> +Author:
> +
> +       Ainux Wang <ainux.wang@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +triple-loop, digital, multi-phase controller MP2949A.
> +
> +This device:
> +
> +- Supports up to three power rail.
> +- Provides 6 pulse-width modulations (PWMs), and can be configured for
> +  to 6-phase operation for Rail A , up to 2-phase operation for Rail B,
> +  and up to 1-phase operation for Rail C.
> +- The PMBus registers are distributed into three pages: Page 0, Page 1,
> +  Page 2. Page 0 contains the registers for Rail A and most of the common
> +  settings for all of the rails. Page 1 contains register information for
> +  Rail B. Page 2 contains register information for Rail C.
> +- The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
> +  IMVP9.
> +
> +Device supports:
> +
> +- SVID interface.
> +- PMBus rev 1.2 interface.
> +
> +Device supports direct format for reading output power.
> +Device supports linear format for reading input voltage, output current,
> +and temperature.
> +Device supports VID for reading output voltage.
> +The below VID modes are supported: VR12, VR13, IMVP8, IMVP9.
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 37a5c39784fa..b1344b265976 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -248,6 +248,15 @@ config SENSORS_MAX8688
>           This driver can also be built as a module. If so, the module will
>           be called max8688.
>
> +config SENSORS_MP2949A
> +       tristate "MPS MP2949A"
> +       help
> +         If you say yes here you get hardware monitoring support for MPS
> +         MP2949A Triple Loop Digital Multi-Phase Controller.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called mp2949a.
> +
>  config SENSORS_MP2975
>         tristate "MPS MP2975"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index f8dcc27cd56a..bfb55ab12da1 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_SENSORS_MAX20751)        += max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785) += max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440) += max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)  += max8688.o
> +obj-$(CONFIG_SENSORS_MP2949A)  += mp2949a.o
>  obj-$(CONFIG_SENSORS_MP2975)   += mp2975.o
>  obj-$(CONFIG_SENSORS_PM6764TR) += pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)  += pxe1610.o
> diff --git a/drivers/hwmon/pmbus/mp2949a.c b/drivers/hwmon/pmbus/mp2949a.c
> new file mode 100644
> index 000000000000..d1f36c008e58
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2949a.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Monolithic Power Systems MP2949A
> + *
> + * Copyright (c) 2021 Lemote Technologies. All rights reserved.
> + * Copyright (c) 2021 Ainux <ainux.wang@gmail.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define MP2949A_PAGE_NUM               3
> +
> +#define MP2949A_MFR_VR_CONFIG  0xE4
> +
> +static int mp2949a_identify(struct i2c_client *client,
> +                           struct pmbus_driver_info *info)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < MP2949A_PAGE_NUM; i++) {
> +               ret = pmbus_read_byte_data(client, i, MP2949A_MFR_VR_CONFIG);
> +               if (ret < 0)
> +                       return ret;
> +
> +               /*
> +                * Rail A bit 5, Rail B bit 4, Rail C bit 3.
> +                * 1'b1: 5mV  (vr12/imvp8)
> +                * 1'b0: 10mv (imvp9)
> +                */
> +               info->vrm_version[i] = (ret & BIT(5 - i)) ? vr12 : imvp9;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct pmbus_driver_info mp2949a_info = {
> +       .pages = MP2949A_PAGE_NUM,
> +       .format[PSC_VOLTAGE_IN] = linear,
> +       .format[PSC_VOLTAGE_OUT] = vid,
> +       .format[PSC_CURRENT_OUT] = linear,
> +       .format[PSC_TEMPERATURE] = linear,
> +       .format[PSC_POWER] = direct,
> +       .m[PSC_POWER] = 1,
> +       .b[PSC_POWER] = 0,
> +       .R[PSC_POWER] = 0,
> +       .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +               PMBUS_HAVE_TEMP | PMBUS_HAVE_POUT,
> +       .func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +               PMBUS_HAVE_POUT,
> +       .func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +               PMBUS_HAVE_POUT,
> +       .identify = mp2949a_identify,
> +};
> +
> +static int mp2949a_probe(struct i2c_client *client,
> +                         const struct i2c_device_id *id)
> +{
> +       struct pmbus_driver_info *info;
> +
> +       info = devm_kmemdup(&client->dev, &mp2949a_info, sizeof(*info),
> +                           GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id mp2949a_id[] = {
> +       {"mp2949a", 0},
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mp2949a_id);
> +
> +static const struct of_device_id mp2949a_of_match[] = {
> +       {.compatible = "mps,mp2949a"},
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, mp2949a_of_match);
> +
> +static struct i2c_driver mp2949a_driver = {
> +       .driver = {
> +               .name = "mp2949a",
> +               .of_match_table = of_match_ptr(mp2949a_of_match),
> +       },
> +       .probe = mp2949a_probe,
> +       .id_table = mp2949a_id,
> +};
> +
> +module_i2c_driver(mp2949a_driver);
> +
> +MODULE_AUTHOR("Ainux <ainux.wang@gmail.com>");
> +MODULE_DESCRIPTION("PMBus driver for Monolithic Power Systems MP2949A");
> +MODULE_LICENSE("GPL");
> --
> 2.18.1
>
