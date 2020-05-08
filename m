Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840DE1C9FD8
	for <lists+linux-hwmon@lfdr.de>; Fri,  8 May 2020 02:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEHAyi (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 7 May 2020 20:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726470AbgEHAyh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 May 2020 20:54:37 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB94AC05BD43
        for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2020 17:54:37 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id c12so5989357oic.1
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2020 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BGAzIQ+PxUTT0vrL/iRxOi8xNM/He26TmlaXq1DEfDg=;
        b=T0YYEg70/CW+pa9m54FQWc765yyEEVAy8ekSlrdWsGJOGbUtPJ0OvkN8hfZKGcSud6
         CI11vdmEjqF2mApFr04BenJshWwcs6TUl9b3SeyZ0+DjAXPxoHMQDrS0ds1tROwPOhow
         EUQtNRCwygA7xh1d6px7og7zB82bN+fYJmTBYVzFVk2EvBoaVIpQnXkg3OfWTer3z0Gn
         ycTvJLSb3W4DVaq5Vjfw2s59UBPw7FAaTMi54YZtc676C0G8H5UCPGosvUjzoLo+u6gO
         F4iXPt1ZJk2c98PJ2TfMb2em84ogY16+jSUbT8fxAQJm8MVRjQrKiDATQvikZ5IXJNBk
         fSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BGAzIQ+PxUTT0vrL/iRxOi8xNM/He26TmlaXq1DEfDg=;
        b=PwH0IUZ0meurFOFoHu1TYyyp4hMd2nsJNjgNYBj3BDAv3brNE2WoViNC+czpvb5IsI
         w4pdCdjM/BLpeTbuDXpmIXmSIUCle6/dUaiSvs56DuxMeSKOs41RbNefkbfCRP9SoJNi
         j+nEhYLL0TnLN03ULuiZZd/PdHGwoB+kHP20G5grN/IXFvw6rre53cb4HqQSsMHCG0qL
         f+3cggNXA4ydlqBJosDSZGc1kYrKlCy7dQJYQlYP0O1Xy+e1ASS9T8wB1j6PiYFJDc91
         Xl0b9GTf9Fik0wu2iVe1fzWPz+oGvsFmgFiZZdq0T7E00Nj/1b3Aj8Z3ZSlgZssUMi5h
         YlTA==
X-Gm-Message-State: AGi0PubgTDhwwSolvFmVwYGOLqn8K9DlcJsr+9TDngXAgmEqyfMKCfJj
        WA+r+U7yQ/2bPAog2FG/aQ1YtxEaH6btiOhW7hJHniW4
X-Google-Smtp-Source: APiQypJfonJpvGXiVaQjoHXCVJwIyuEXqDr7rnz0MTcYgQVFlmLuULxPeEqmUY59iygoDFNy2bbU68nkQAAtA5UuLbU=
X-Received: by 2002:aca:5943:: with SMTP id n64mr877410oib.62.1588899276516;
 Thu, 07 May 2020 17:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200506214949.175744-1-linux@roeck-us.net>
In-Reply-To: <20200506214949.175744-1-linux@roeck-us.net>
From:   Alex Qiu <xqiu@google.com>
Date:   Thu, 7 May 2020 17:54:25 -0700
Message-ID: <CAA_a9x+eBJFG7j5amUqS1PcP20jaTHuNysAJZW64Y=w47OtVeA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus) Driver for Maxim MAX16601
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

The drivers look good on our system, although more tests are ongoing.
The patch LGTM with minor nit. Thank you very much!

On Wed, May 6, 2020 at 2:49 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> MAX16601 is a VR13.HC Dual-Output Voltage Regulator Chipset,
> implementing a (8+1) multiphase synchronous buck converter.
>
> Cc: Alex Qiu <xqiu@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/index.rst    |   1 +
>  Documentation/hwmon/max16601.rst | 159 ++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig      |   9 +
>  drivers/hwmon/pmbus/Makefile     |   1 +
>  drivers/hwmon/pmbus/max16601.c   | 314 +++++++++++++++++++++++++++++++
>  5 files changed, 484 insertions(+)
>  create mode 100644 Documentation/hwmon/max16601.rst
>  create mode 100644 drivers/hwmon/pmbus/max16601.c
>
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8ef62fd39787..df87ae15a1d4 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -106,6 +106,7 @@ Hardware Monitoring Kernel Drivers
>     max16064
>     max16065
>     max1619
> +   max16601
>     max1668
>     max197
>     max20730
> diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
> new file mode 100644
> index 000000000000..346e74674c51
> --- /dev/null
> +++ b/Documentation/hwmon/max16601.rst
> @@ -0,0 +1,159 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver max16601
> +======================
> +
> +Supported chips:
> +
> +  * Maxim MAX16601
> +
> +    Prefix: 'max16601'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: Not published
> +
> +Author: Guenter Roeck <linux@roeck-us.net>
> +
> +
> +Description
> +-----------
> +
> +This driver supports the MAX16601 VR13.HC Dual-Output Voltage Regulator
> +Chipset.
> +
> +The driver is a client driver to the core PMBus driver.
> +Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +
> +Platform data support
> +---------------------
> +
> +The driver supports standard PMBus driver platform data.
> +
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported.
> +
> +======================= =======================================================
> +in1_label              "vin1"
> +in1_input              VCORE input voltage.
> +in1_alarm              Input voltage alarm.
> +
> +in2_label              "vout1"
> +in2_input              VCORE output voltage.
> +in2_alarm              Output voltage alarm.
> +
> +curr1_label            "iin1"
> +curr1_input            VCORE input current, derived from duty cycle and output
> +                       current.
> +curr1_max              Maximum input current.
> +curr1_max_alarm                Current high alarm.
> +
> +curr2_label            "iin1.0"
> +curr2_input            VCORE phase 0 input current.
> +
> +curr3_label            "iin1.1"
> +curr3_input            VCORE phase 1 input current.
> +
> +curr4_label            "iin1.2"
> +curr4_input            VCORE phase 2 input current.
> +
> +curr5_label            "iin1.3"
> +curr5_input            VCORE phase 3 input current.
> +
> +curr6_label            "iin1.4"
> +curr6_input            VCORE phase 4 input current.
> +
> +curr7_label            "iin1.5"
> +curr7_input            VCORE phase 5 input current.
> +
> +curr8_label            "iin1.6"
> +curr8_input            VCORE phase 6 input current.
> +
> +curr9_label            "iin1.7"
> +curr9_input            VCORE phase 7 input current.
> +
> +curr10_label           "iin2"
> +curr10_input           VCORE input current, derived from sensor element.
> +
> +curr11_label           "iin3"
> +curr11_input           VSA input current.
> +
> +curr12_label           "iout1"
> +curr12_input           VCORE output current.
> +curr12_crit            Critical output current.
> +curr12_crit_alarm      Output current critical alarm.
> +curr12_max             Maximum output current.
> +curr12_max_alarm       Output current high alarm.
> +
> +curr13_label           "iout1.0"
> +curr13_input           VCORE phase 0 output current.
> +
> +curr14_label           "iout1.1"
> +curr14_input           VCORE phase 1 output current.
> +
> +curr15_label           "iout1.2"
> +curr15_input           VCORE phase 2 output current.
> +
> +curr16_label           "iout1.3"
> +curr16_input           VCORE phase 3 output current.
> +
> +curr17_label           "iout1.4"
> +curr17_input           VCORE phase 4 output current.
> +
> +curr18_label           "iout1.5"
> +curr18_input           VCORE phase 5 output current.
> +
> +curr19_label           "iout1.6"
> +curr19_input           VCORE phase 6 output current.
> +
> +curr20_label           "iout1.7"
> +curr20_input           VCORE phase 7 output current.
> +
> +curr21_label           "iout3"
> +curr21_input           VSA output current.
> +curr21_highest         Historical maximum VSA output current.
> +curr21_reset_history   Write any value to reset curr21_highest.
> +curr21_crit            Critical output current.
> +curr21_crit_alarm      Output current critical alarm.
> +curr21_max             Maximum output current.
> +curr21_max_alarm       Output current high alarm.
> +
> +power1_label           "pin1"
> +power1_input           Input power, derived from duty cycle and output current.
> +power1_alarm           Input power alarm.
> +
> +power2_label           "pin2"
> +power2_input           Input power, derived from input current sensor.
> +
> +power3_label           "pout"
> +power3_input           Output power.
> +
> +temp1_input            VCORE temperature.
> +temp1_crit             Critical high temperature.
> +temp1_crit_alarm       Chip temperature critical high alarm.
> +temp1_max              Maximum temperature.
> +temp1_max_alarm                Chip temperature high alarm.
> +
> +temp2_input            TSENSE_0 temperature
> +temp3_input            TSENSE_1 temperature
> +temp4_input            TSENSE_2 temperature
> +temp5_input            TSENSE_3 temperature
> +
> +temp6_input            VSA temperature.
> +temp6_crit             Critical high temperature.
> +temp6_crit_alarm       Chip temperature critical high alarm.
> +temp6_max              Maximum temperature.
> +temp6_max_alarm                Chip temperature high alarm.
> +======================= =======================================================
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index de12a565006d..a337195b1c39 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -146,6 +146,15 @@ config SENSORS_MAX16064
>           This driver can also be built as a module. If so, the module will
>           be called max16064.
>
> +config SENSORS_MAX16601
> +       tristate "Maxim MAX16601"
> +       help
> +         If you say yes here you get hardware monitoring support for Maxim
> +         MAX16601.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called max16601.
> +
>  config SENSORS_MAX20730
>         tristate "Maxim MAX20730, MAX20734, MAX20743"
>         help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 5feb45806123..c4b15db996ad 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_SENSORS_LM25066) += lm25066.o
>  obj-$(CONFIG_SENSORS_LTC2978)  += ltc2978.o
>  obj-$(CONFIG_SENSORS_LTC3815)  += ltc3815.o
>  obj-$(CONFIG_SENSORS_MAX16064) += max16064.o
> +obj-$(CONFIG_SENSORS_MAX16601) += max16601.o
>  obj-$(CONFIG_SENSORS_MAX20730) += max20730.o
>  obj-$(CONFIG_SENSORS_MAX20751) += max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785) += max31785.o
> diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
> new file mode 100644
> index 000000000000..e10ab394b8de
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max16601.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardware monitoring driver for Maxim MAX16601
> + *
> + * Implementation notes:
> + *
> + * Ths chip supports two rails, VCORE and VSA. Telemetry information for the
> + * two rails is reported in two subsequent I2C addresses. The driver
> + * instantiates a dummy I2C client at the second I2C address to report
> + * information for the VSA rail in a single instance of the driver.
> + * Telemetry for the VSA rail is reported to the PMBus core in PMBus page 2.
> + *
> + * The chip reports input current using two separate methods. The input current
> + * reported with the standard READ_IIN command is derived from the output
> + * current. The first method is reported to the PMBus core with PMBus page 0,
> + * the second method is reported with PMBus page 1.
> + *
> + * The chip supports reading per-phase temperatures and per-phase input/output
> + * currents for VCORE. Telemetry is reported in vendor specific registers.
> + * The driver translates the vendor specific register values to PMBus standard
> + * register values and reports per-phase information in PMBus page 0.
> + *
> + * Copyright 2019, 2020 Google LLC.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +#define REG_SETPT_DVID         0xd1
> +#define  DAC_10MV_MODE         BIT(4)
> +#define REG_PHASE_ID           0xf3
> +#define  CORE_RAIL_INDICATOR   BIT(7)

Maybe we can move the above two lines down, so the register addresses
become sequential in the source file.

> +#define REG_IOUT_AVG_PK                0xee
> +#define REG_IIN_SENSOR         0xf1
> +#define REG_TOTAL_INPUT_POWER  0xf2
> +#define REG_PHASE_REPORTING    0xf4
> +
> +struct max16601_data {
> +       struct pmbus_driver_info info;
> +       struct i2c_client *vsa;
> +       int iout_avg_pkg;
> +};
> +
> +#define to_max16601_data(x) container_of(x, struct max16601_data, info)
> +
> +static int max16601_read_byte(struct i2c_client *client, int page, int reg)
> +{
> +       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +       struct max16601_data *data = to_max16601_data(info);
> +
> +       if (page > 0) {
> +               if (page == 2)  /* VSA */
> +                       return i2c_smbus_read_byte_data(data->vsa, reg);
> +               return -EOPNOTSUPP;
> +       }
> +       return -ENODATA;
> +}
> +
> +static int max16601_read_word(struct i2c_client *client, int page, int phase,
> +                             int reg)
> +{
> +       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +       struct max16601_data *data = to_max16601_data(info);
> +       u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +       int ret;
> +
> +       switch (page) {
> +       case 0:         /* VCORE */
> +               if (phase == 0xff)
> +                       return -ENODATA;
> +               switch (reg) {
> +               case PMBUS_READ_IIN:
> +               case PMBUS_READ_IOUT:
> +               case PMBUS_READ_TEMPERATURE_1:
> +                       ret = i2c_smbus_write_byte_data(client, REG_PHASE_ID,
> +                                                       phase);
> +                       if (ret)
> +                               return ret;
> +                       ret = i2c_smbus_read_block_data(client,
> +                                                       REG_PHASE_REPORTING,
> +                                                       buf);
> +                       if (ret < 0)
> +                               return ret;
> +                       if (ret < 6)
> +                               return -EIO;
> +                       switch (reg) {
> +                       case PMBUS_READ_TEMPERATURE_1:
> +                               return buf[1] << 8 | buf[0];
> +                       case PMBUS_READ_IOUT:
> +                               return buf[3] << 8 | buf[2];
> +                       case PMBUS_READ_IIN:
> +                               return buf[5] << 8 | buf[4];
> +                       default:
> +                               break;
> +                       }
> +               }
> +               return -EOPNOTSUPP;
> +       case 1:         /* VCORE, read IIN/PIN from sensor element */
> +               switch (reg) {
> +               case PMBUS_READ_IIN:
> +                       return i2c_smbus_read_word_data(client, REG_IIN_SENSOR);
> +               case PMBUS_READ_PIN:
> +                       return i2c_smbus_read_word_data(client,
> +                                                       REG_TOTAL_INPUT_POWER);
> +               default:
> +                       break;
> +               }
> +               return -EOPNOTSUPP;
> +       case 2:         /* VSA */
> +               switch (reg) {
> +               case PMBUS_VIRT_READ_IOUT_MAX:
> +                       ret = i2c_smbus_read_word_data(data->vsa,
> +                                                      REG_IOUT_AVG_PK);
> +                       if (ret < 0)
> +                               return ret;
> +                       if (sign_extend32(ret, 10) >
> +                           sign_extend32(data->iout_avg_pkg, 10))
> +                               data->iout_avg_pkg = ret;
> +                       return data->iout_avg_pkg;
> +               case PMBUS_VIRT_RESET_IOUT_HISTORY:
> +                       return 0;
> +               case PMBUS_IOUT_OC_FAULT_LIMIT:
> +               case PMBUS_IOUT_OC_WARN_LIMIT:
> +               case PMBUS_OT_FAULT_LIMIT:
> +               case PMBUS_OT_WARN_LIMIT:
> +               case PMBUS_READ_IIN:
> +               case PMBUS_READ_IOUT:
> +               case PMBUS_READ_TEMPERATURE_1:
> +               case PMBUS_STATUS_WORD:
> +                       return i2c_smbus_read_word_data(data->vsa, reg);
> +               default:
> +                       return -EOPNOTSUPP;
> +               }
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
> +static int max16601_write_byte(struct i2c_client *client, int page, u8 reg)
> +{
> +       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +       struct max16601_data *data = to_max16601_data(info);
> +
> +       if (page == 2) {
> +               if (reg == PMBUS_CLEAR_FAULTS)
> +                       return i2c_smbus_write_byte(data->vsa, reg);
> +               return -EOPNOTSUPP;
> +       }
> +       return -ENODATA;
> +}
> +
> +static int max16601_write_word(struct i2c_client *client, int page, int reg,
> +                              u16 value)
> +{
> +       const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +       struct max16601_data *data = to_max16601_data(info);
> +
> +       switch (page) {
> +       case 0:         /* VCORE */
> +               return -ENODATA;
> +       case 1:         /* VCORE IIN/PIN from sensor element */
> +       default:
> +               return -EOPNOTSUPP;
> +       case 2:         /* VSA */
> +               switch (reg) {
> +               case PMBUS_VIRT_RESET_IOUT_HISTORY:
> +                       data->iout_avg_pkg = 0xfc00;
> +                       return 0;
> +               case PMBUS_IOUT_OC_FAULT_LIMIT:
> +               case PMBUS_IOUT_OC_WARN_LIMIT:
> +               case PMBUS_OT_FAULT_LIMIT:
> +               case PMBUS_OT_WARN_LIMIT:
> +                       return i2c_smbus_write_word_data(data->vsa, reg, value);
> +               default:
> +                       return -EOPNOTSUPP;
> +               }
> +       }
> +}
> +
> +static int max16601_identify(struct i2c_client *client,
> +                            struct pmbus_driver_info *info)
> +{
> +       int reg;
> +
> +       reg = i2c_smbus_read_byte_data(client, REG_SETPT_DVID);
> +       if (reg < 0)
> +               return reg;
> +       if (reg & DAC_10MV_MODE)
> +               info->vrm_version[0] = vr13;
> +       else
> +               info->vrm_version[0] = vr12;
> +
> +       return 0;
> +}
> +
> +static struct pmbus_driver_info max16601_info = {
> +       .pages = 3,
> +       .format[PSC_VOLTAGE_IN] = linear,
> +       .format[PSC_VOLTAGE_OUT] = vid,
> +       .format[PSC_CURRENT_IN] = linear,
> +       .format[PSC_CURRENT_OUT] = linear,
> +       .format[PSC_TEMPERATURE] = linear,
> +       .format[PSC_POWER] = linear,
> +       .func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
> +               PMBUS_HAVE_STATUS_INPUT |
> +               PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +               PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +               PMBUS_HAVE_POUT | PMBUS_PAGE_VIRTUAL | PMBUS_PHASE_VIRTUAL,
> +       .func[1] = PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | PMBUS_PAGE_VIRTUAL,
> +       .func[2] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT |
> +               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +               PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_PAGE_VIRTUAL,
> +       .phases[0] = 8,
> +       .pfunc[0] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP,
> +       .pfunc[1] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT,
> +       .pfunc[2] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP,
> +       .pfunc[3] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT,
> +       .pfunc[4] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP,
> +       .pfunc[5] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT,
> +       .pfunc[6] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP,
> +       .pfunc[7] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT,
> +       .identify = max16601_identify,
> +       .read_byte_data = max16601_read_byte,
> +       .read_word_data = max16601_read_word,
> +       .write_byte = max16601_write_byte,
> +       .write_word_data = max16601_write_word,
> +};
> +
> +static void max16601_remove(void *_data)
> +{
> +       struct max16601_data *data = _data;
> +
> +       i2c_unregister_device(data->vsa);
> +}
> +
> +static int max16601_probe(struct i2c_client *client,
> +                         const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +       struct max16601_data *data;
> +       int ret;
> +
> +       if (!i2c_check_functionality(client->adapter,
> +                                    I2C_FUNC_SMBUS_READ_BYTE_DATA |
> +                                    I2C_FUNC_SMBUS_READ_BLOCK_DATA))
> +               return -ENODEV;
> +
> +       ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
> +       if (ret < 0)
> +               return -ENODEV;
> +
> +       /* PMBUS_IC_DEVICE_ID is expected to return "MAX16601y.xx" */
> +       if (ret < 11 || strncmp(buf, "MAX16601", 8)) {
> +               buf[ret] = '\0';
> +               dev_err(dev, "Unsupported chip '%s'\n", buf);
> +               return -ENODEV;
> +       }
> +
> +       ret = i2c_smbus_read_byte_data(client, REG_PHASE_ID);
> +       if (ret < 0)
> +               return ret;
> +       if (!(ret & CORE_RAIL_INDICATOR)) {
> +               dev_err(dev,
> +                       "Driver must be instantiated on CORE rail I2C address\n");
> +               return -ENODEV;
> +       }
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->iout_avg_pkg = 0xfc00;
> +       data->vsa = i2c_new_dummy_device(client->adapter, client->addr + 1);
> +       if (IS_ERR(data->vsa)) {
> +               dev_err(dev, "Failed to register VSA client\n");
> +               return PTR_ERR(data->vsa);
> +       }
> +       ret = devm_add_action_or_reset(dev, max16601_remove, data);
> +       if (ret)
> +               return ret;
> +
> +       data->info = max16601_info;
> +
> +       return pmbus_do_probe(client, id, &data->info);
> +}
> +
> +static const struct i2c_device_id max16601_id[] = {
> +       {"max16601", 0},
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, max16601_id);
> +
> +static struct i2c_driver max16601_driver = {
> +       .driver = {
> +                  .name = "max16601",
> +                  },
> +       .probe = max16601_probe,
> +       .remove = pmbus_do_remove,
> +       .id_table = max16601_id,
> +};
> +
> +module_i2c_driver(max16601_driver);
> +
> +MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> +MODULE_DESCRIPTION("PMBus driver for Maxim MAX16601");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1
>
