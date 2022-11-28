Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0FC63AD60
	for <lists+linux-hwmon@lfdr.de>; Mon, 28 Nov 2022 17:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiK1QMx (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 28 Nov 2022 11:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbiK1QMo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Nov 2022 11:12:44 -0500
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.152.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF585F88
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Nov 2022 08:12:41 -0800 (PST)
Received: from atl1wswcm06.websitewelcome.com (unknown [50.6.129.167])
        by atl3wswob01.websitewelcome.com (Postfix) with ESMTP id 8DCD917CBE
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Nov 2022 16:12:40 +0000 (UTC)
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTP
        id zgkHoJVMgPz0tzgkJoLBvt; Mon, 28 Nov 2022 16:12:40 +0000
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OjvUvn7DpYaZV7BlbUHoSQbbU3GFUs3x+2/NX8jMT2o=; b=GO7xSbfylClBsfMtlUNS4SehLj
        loaL/dFX+AIueX2dBGvOyho7PLKgIx+2oN02rf7Rk8yHZmhw0PJSFM1W03eDguChscKeidNLGiJ8K
        dqmgDylsKqKmXYgqpmWr9aGT1RXfpY9WopvEvkqLX8FzPqLL2mJ6Lyk5z3x9s0b37lWxlj3AMDdWE
        xZ7dt+YsuGwPvM6NEl8ittmiD4EyWTCEWtU639u9gtp3RQ97H6WWjWgP6HH4eVUv7/PYEKBLx1PW/
        wVo713MwYv9X0ZonUAWcX+OFeeR3iMSj9s2buyRvT6tTXvAyvf5TrL4uBPvyvbMCMYEjzaB1NNSfN
        i7yOD4DA==;
Received: from [106.197.182.129] (port=52512 helo=[192.168.221.42])
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <saravanan@linumiz.com>)
        id 1ozgkG-000Kfi-HB;
        Mon, 28 Nov 2022 16:12:36 +0000
Message-ID: <e192788e-602d-aa49-3dd9-8f468604a0a7@linumiz.com>
Date:   Mon, 28 Nov 2022 17:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/3] hwmon: (pmbus/mpq7932) Add a support for mpq7932
 Power Management IC
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20221126171711.1078309-1-saravanan@linumiz.com>
 <20221126171711.1078309-2-saravanan@linumiz.com>
 <ec33655d-4070-4107-4c5c-f798ebe56b73@roeck-us.net>
 <4819f317-a6dd-dd8a-4800-06b82be4f995@linumiz.com>
 <59af69f2-6f07-3eed-434e-8691340774bc@roeck-us.net>
Content-Language: en-US
From:   Saravanan Sekar <saravanan@linumiz.com>
In-Reply-To: <59af69f2-6f07-3eed-434e-8691340774bc@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 106.197.182.129
X-Source-L: No
X-Exim-ID: 1ozgkG-000Kfi-HB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.221.42]) [106.197.182.129]:52512
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 4
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLDUfC9e1WSZAA3KlQFlwORV/EcHy9Oo6yufy8ODj3II8vAWPsBBhFWhvwLES+5jDK0emxh5Ym/3S3FFJlJaNwuhRKSMZbwP+CpinF8QEbhvX/ueDxV4
 mwWI+uRSUDKE23W1MekvuCPRyhBvKcnhrSqO7se2goWL6pZ931stgvVkmLcZ15ahyXIsz3sGBCxKWKaTsAINNYh3uV08iQULQoo=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 28/11/22 09:15, Guenter Roeck wrote:
> On 11/27/22 22:35, Saravanan Sekar wrote:
>> On 26/11/22 18:50, Guenter Roeck wrote:
>>> On 11/26/22 09:17, Saravanan Sekar wrote:
>>>> The MPQ7932 is a power management IC designed to operate from 5V 
>>>> buses to
>>>> power a variety of ADAS SOCs. Six integrated buck converters power a
>>>> variety of target rails configurable over PMBus interface.
>>>>
>>>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>>>
>> Hello Guenter,
>>
>> Thanks for your time to review.
>>
>>> I find no reference to this chip anywhere. Can you provide one ?
>>>
>>
>> I have Preliminary specification under NDA, checking with manufactures 
>> upload in public accessibility.
>>
>>> Also, please refrain from cryptic abbreviations. You may know what
>>> ADAS means, but I have no idea.
>>>
>> Sure
>>>> ---
>>>>   drivers/hwmon/pmbus/Kconfig   |   9 ++
>>>>   drivers/hwmon/pmbus/Makefile  |   1 +
>>>>   drivers/hwmon/pmbus/mpq7932.c | 150 
>>>> ++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 160 insertions(+)
>>>>   create mode 100644 drivers/hwmon/pmbus/mpq7932.c
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
>>>> index 89668af67206..5e938768bd77 100644
>>>> --- a/drivers/hwmon/pmbus/Kconfig
>>>> +++ b/drivers/hwmon/pmbus/Kconfig
>>>> @@ -317,6 +317,15 @@ config SENSORS_MP5023
>>>>         This driver can also be built as a module. If so, the module 
>>>> will
>>>>         be called mp5023.
>>>> +config SENSORS_MPQ7932_REGULATOR
>>>
>>> Drop "_REGULATOR".
>>>
>>>> +    tristate "MPS MPQ7932 buck regulator"
>>>> +    help
>>>> +      If you say yes here you get six integrated buck converter
>>>> +      regulator support for power management IC MPS MPQ7932.
>>>> +
>>>
>>> This primarily adds hardware monitoring support. Referring to it
>>> only as regulator is misleading. Please also refer to hardware
>>> monitoring functionality. More on that below.
>>>
>>
>> okay
>>
>>>> +      This driver can also be built as a module. If so, the module 
>>>> will
>>>> +      be called mpq7932.
>>>> +
>>>>   config SENSORS_PIM4328
>>>>       tristate "Flex PIM4328 and compatibles"
>>>>       help
>>>> diff --git a/drivers/hwmon/pmbus/Makefile 
>>>> b/drivers/hwmon/pmbus/Makefile
>>>> index 0002dbe22d52..28a534629cc3 100644
>>>> --- a/drivers/hwmon/pmbus/Makefile
>>>> +++ b/drivers/hwmon/pmbus/Makefile
>>>> @@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MAX8688)    += max8688.o
>>>>   obj-$(CONFIG_SENSORS_MP2888)    += mp2888.o
>>>>   obj-$(CONFIG_SENSORS_MP2975)    += mp2975.o
>>>>   obj-$(CONFIG_SENSORS_MP5023)    += mp5023.o
>>>> +obj-$(CONFIG_SENSORS_MPQ7932_REGULATOR) += mpq7932.o
>>>>   obj-$(CONFIG_SENSORS_PLI1209BC)    += pli1209bc.o
>>>>   obj-$(CONFIG_SENSORS_PM6764TR)    += pm6764tr.o
>>>>   obj-$(CONFIG_SENSORS_PXE1610)    += pxe1610.o
>>>> diff --git a/drivers/hwmon/pmbus/mpq7932.c 
>>>> b/drivers/hwmon/pmbus/mpq7932.c
>>>> new file mode 100644
>>>> index 000000000000..23d3ccdaed1e
>>>> --- /dev/null
>>>> +++ b/drivers/hwmon/pmbus/mpq7932.c
>>>> @@ -0,0 +1,150 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +//
>>>> +// mpq7932.c  - regulator driver for mps mpq7932
>>>> +//
>>>> +// Copyright 2022 Monolithic Power Systems, Inc
>>>> +//
>>>> +// Author: Saravanan Sekar <saravanan@linumiz.com>
>>>> +
>>>
>>> No C++ comments in hwmon subsystem, please, unless mandated.
>>
>> okay
>>>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/of_device.h>
>>>> +#include <linux/pmbus.h>
>>>> +#include <linux/i2c.h>
>>>
>>> Alphabetic include file order, please.
>>>
>>
>> okay
>>>> +#include "pmbus.h"
>>>> +
>>>> +#define MPQ7932_BUCK_UV_MIN        206250
>>>> +#define MPQ7932_UV_STEP            6250
>>>> +#define MPQ7932_N_VOLTAGES        0xFF
>>>> +#define MPQ7932_NUM_PAGES        6
>>>> +
>>>> +#define MPQ7932_TON_DELAY        0x60
>>>> +#define MPQ7932_VOUT_STARTUP_SLEW    0xA3
>>>> +#define MPQ7932_VOUT_SHUTDOWN_SLEW    0xA5
>>>> +#define MPQ7932_VOUT_SLEW_MASK        GENMASK(1, 0)
>>>> +#define MPQ7932_TON_DELAY_MASK        GENMASK(4, 0)
>>>> +
>>>> +#define MPQ7932BUCK(_id)                    \
>>>> +    [_id] = {                        \
>>>> +        .id = _id,                    \
>>>> +        .name = ("buck" # _id),                \
>>>> +        .of_match = of_match_ptr("buck" # _id),        \
>>>> +        .regulators_node = "regulators",        \
>>>> +        .ops = &pmbus_regulator_ops,            \
>>>> +        .type = REGULATOR_VOLTAGE,            \
>>>> +        .min_uV = MPQ7932_BUCK_UV_MIN,            \
>>>> +        .uV_step = MPQ7932_UV_STEP,            \
>>>> +        .n_voltages = MPQ7932_N_VOLTAGES,        \
>>>> +    }
>>>
>>> Why not use PMBUS_REGULATOR_STEP ?
>>
>> MPQ7932 chip supports ramp delay and softstart which is not covered
>> by PMBUS_REGULATOR_STEP, I have incremental patch to address which
>> requires API's in pmbus_regulator_ops to be exported so chip driver
>> can extend/modifiy with reuse of pmbus_regulator api. Plan is to 
>> submit 1st set of minimal driver and create RFC.
>>
>> I can replace PMBUS_REGULATOR_STEP for this series.
>>
> 
> The only difference is that the above also sets min_uV.
> I'd rather have that added to PMBUS_REGULATOR_STEP instead
> of adding more macros.
> 
> As for min_uV, is that really needed ? None of the other regulators
> seemed to need it.
> 

Indeed min_uV is needed.
output voltage is in the range from 0.20625V to 1.8V. Calculated based 
as VOUT_CMD [7:0]*6.25mV+206.25mV

min voltage is 206.25mV if register is 0.

It is common to min_uV in regulator driver, e.g mpq7920, mp5416

I add one more patch to this series for min_uV addition in 
PMBUS_REGULATOR_STEP.


>>> >> +
>>>> +struct mpq7932_data {
>>>> +    struct pmbus_driver_info info;
>>>> +    struct pmbus_platform_data pdata;
>>>> +};
>>>> +
>>>> +static struct regulator_desc mpq7932_regulators_desc[] = {
>>>> +    MPQ7932BUCK(0),
>>>> +    MPQ7932BUCK(1),
>>>> +    MPQ7932BUCK(2),
>>>> +    MPQ7932BUCK(3),
>>>> +    MPQ7932BUCK(4),
>>>> +    MPQ7932BUCK(5),
>>>> +};
>>>> +
>>>> +static int mpq7932_write_word_data(struct i2c_client *client, int 
>>>> page, int reg,
>>>> +                   u16 word)
>>>> +{
>>>> +
>>>> +    switch (reg) {
>>>> +    case PMBUS_VOUT_COMMAND:
>>>> +        return pmbus_write_byte_data(client, page, reg, (u8)word);
>>>> +
>>>
>>> This needs explanation. VOUT_COMMAND directly sets a voltage, and the 
>>> provided
>>> value is in ULINEAR16 format. Just using its lower 8 bits seems, at 
>>> the very
>>> least, odd.
>>>
>>
>> Indeed, unfortunately word_write results -EREMOTEIO and got clarified 
>> with manufacture chip support only byte write except STATUS_WORD :(
>>
> Question then is what this byte contains. What if an attempt is made
> to write a value > 0xff ? Writing 0x00 instead of 0x100 can only result
> in severe trouble.
> 

As mention above VOUT_CMD is one byte range 0 to 255. we have 
.n_voltages = 0xff, regulator driver forbid the regulator consumer to 
set value beyond 0xff

VOUT_CMD [7:0]*6.25mV+206.25mV


>>>> +    default:
>>>> +        return -ENODATA;
>>>> +    }
>>>> +}
>>>> +
>>>> +static int mpq7932_read_word_data(struct i2c_client *client, int page,
>>>> +                  int phase, int reg)
>>>> +{
>>>> +
>>>> +    switch (reg) {
>>>> +    case PMBUS_MFR_VOUT_MIN:
>>>> +        return 0;
>>>> +
>>>> +    case PMBUS_MFR_VOUT_MAX:
>>>> +        return MPQ7932_N_VOLTAGES;
>>>> +
>>>
>>> This is not how this is intended to work. If the chip does not provide
>>> those properties, they should not be faked.
>>>
>>
>> Unfortunately, chip support neither
>>
>>        PMBUS_VOUT_MARGIN_HIGH          = 0x25,
>>        PMBUS_VOUT_MARGIN_LOW           = 0x26,
>>
>> nor
>>
>>        PMBUS_MFR_VOUT_MIN              = 0xA4,
>>        PMBUS_MFR_VOUT_MAX              = 0xA5
>>
>>
>> as a result set voltage fails due to error in 
>> pmbus_regulator_get_low_margin. I can understand these absolute 
>> workaround, please suggest alternatives
>>
> 
> Good point. I'd accept that with explanation, but PMBUS_MFR_VOUT_MAX
> is a maximum voltage, not the number of voltages. And is 0 for
> the minimum voltage really correct ? It seems to contradict
> MPQ7932_BUCK_UV_MIN.
> 

MRF_VOUT_MAX / MIN takes the absolute value of register (0 to 255) and 
pmbus_reg2data does the conversion

         info->m[PSC_VOLTAGE_OUT] = 160;
         info->b[PSC_VOLTAGE_OUT] = -33;

e.g reg_value is 0
         val = div_s64(val - b, m);
         val = div_s64(0 - (-33), 160);
         val = div_s64(33, 160) => 0.20625 (MPQ7932_BUCK_UV_MIN)


which gives same result of
VOUT_CMD [7:0]*6.25mV+206.25mV


>>>> +    case PMBUS_READ_VOUT:
>>>> +        return pmbus_read_byte_data(client, page, PMBUS_VOUT_COMMAND);
>>>> +
>>>> +    default:
>>>> +        return -ENODATA;
>>>> +    }
>>>> +}
>>>> +
>>>> +static int mpq7932_probe(struct i2c_client *client)
>>>> +{
>>>> +    struct mpq7932_data *data;
>>>> +    struct pmbus_driver_info *info;
>>>> +    struct device *dev = &client->dev;
>>>> +    int i;
>>>> +
>>>> +    if (!i2c_check_functionality(client->adapter,
>>>> +                     I2C_FUNC_SMBUS_READ_WORD_DATA))
>>>> +        return -ENODEV;
>>>> +
>>>> +    data = devm_kzalloc(&client->dev, sizeof(struct mpq7932_data),
>>>> +                GFP_KERNEL);
>>>> +    if (!data)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    info = &data->info;
>>>> +    info->pages = MPQ7932_NUM_PAGES;
>>>> +    info->num_regulators = ARRAY_SIZE(mpq7932_regulators_desc);
>>>> +    info->reg_desc = mpq7932_regulators_desc;
>>>> +    info->format[PSC_VOLTAGE_OUT] = direct;
>>>> +    info->m[PSC_VOLTAGE_OUT] = 160;
>>>> +    info->b[PSC_VOLTAGE_OUT] = -33;
>>>> +    for (i = 0; i < info->pages; i++) {
>>>> +        info->func[i] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>>>> +                | PMBUS_HAVE_STATUS_TEMP;
>>>> +    }
>>>> +
>>>
>>> Is that really all the chip supports ? No input data, no current
>>> or power measurements ?
>>>
>>> Is this even a real PMBus chip, or a fake one which claims to support
>>> PMBus but in reality doesn't ?
>>
>> I would say this is PMIC buck regulator chip over PMBUS, I guess the 
>> regulator support in pmbus shall be used without hardware monitor 
>> support (though chip support temperature, error status, cml, status)
>>
>>
>>>
>>>> +    info->read_word_data = mpq7932_read_word_data;
>>>> +    info->write_word_data = mpq7932_write_word_data;
>>>> +
>>>> +    data->pdata.flags = PMBUS_NO_CAPABILITY;
>>>> +    dev->platform_data = &data->pdata;
>>>> +
>>>> +    return pmbus_do_probe(client, info);
>>>> +}
>>>> +
>>>> +static const struct of_device_id mpq7932_of_match[] = {
>>>> +    { .compatible = "mps,mpq7932"},
>>>> +    {},
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, mpq7932_of_match);
>>>> +
>>>> +static const struct i2c_device_id mpq7932_id[] = {
>>>> +    { "mpq7932", },
>>>> +    { },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(i2c, mpq7932_id);
>>>> +
>>>> +static struct i2c_driver mpq7932_regulator_driver = {
>>>
>>> PMBus drivers are not primarily regulator drivers. They
>>> are hardware monitoring drivers. It is difficult for me to
>>> determine, due to lack of information about this chip,
>>> what it actually supports. If the chip is really a regulator
>>> masquerading as PMBus chip, you might want to consider writing
>>> a regulator driver for it.
>>>
>>
>> I try to share datasheet once I got permission from manufacturer.
>> Sure, I consider to write regulator driver over pmbus (addnl helper 
>> support on regulator subsystem like regmap) if we conclude should not 
>> be part of hwmon.
>>
> 
> Depends on you. Do you want a hwmon driver with regulator support,
> or a regulator driver ? We can't have a regulator driver in
> the hwmon subsystem.
>

I have firmly believe this series is already a correct one best of my 
knowledge

> Guenter
> 

Thanks,
Saravanan
