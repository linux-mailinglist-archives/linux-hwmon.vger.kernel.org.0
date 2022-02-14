Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2063A4B45A4
	for <lists+linux-hwmon@lfdr.de>; Mon, 14 Feb 2022 10:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238884AbiBNJ0q (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 14 Feb 2022 04:26:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiBNJ0q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Feb 2022 04:26:46 -0500
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4CE60A8B;
        Mon, 14 Feb 2022 01:26:38 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4JxzPQ0HLFz9sRw;
        Mon, 14 Feb 2022 10:26:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1644830792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hWVa5K7g4IqdSw/Z8gIMnPb1mFwd0Btu5RWWdT6jeI8=;
        b=KSOOISTQRtsRHgBf9WMzHWItr3wrfk8UFLK3Hrb/Kj2mvAW8u7fpSYCAHvwjzF9Wo8U00V
        639qZYyhzCsnNW9F/MSZ/gMSE1/K8wWqX8v59Eej4i+3FzfX3gx3BBB6FWzcotfcaZ2fRO
        C/CsoWMRzpmB1kqHB6IdX/ZZ0G9zdDvwxUp+njFQaO6p8zuSvgG00oPVghGjEvi1LvXFdD
        +wPaNEmgkg5CuUTfD8ix+Lo4MuwTOHlXHUTsG+LgO9Zfv9T3tcNYdzPqzUHQgPrXTa+Kh5
        8N/9gToVtRUfr0L0Lk0iUdMp35Hp/njc+96JHr9FD3FSQ1L5Bu7stPGVoZwXCg==
Message-ID: <f9c8fd492e9db120e33e42712608d54bb6ad15cc.camel@sylv.io>
Subject: Re: [PATCH v1 3/4] pmbus: Add support for pli1209bc
From:   sylv <sylv@sylv.io>
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Date:   Mon, 14 Feb 2022 10:26:27 +0100
In-Reply-To: <f298776b-4c59-97b4-53ef-7d3172c8efd3@roeck-us.net>
References: <cover.1644597670.git.sylv@sylv.io>
         <e4d83b95cfb0cc0c6acb65bd1263cf0131b6ce51.1644597670.git.sylv@sylv.io>
         <f298776b-4c59-97b4-53ef-7d3172c8efd3@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 2022-02-11 at 11:40 -0800, Guenter Roeck wrote:
> On 2/11/22 09:17, Marcello Sylvester Bauer wrote:
> > PLI1209BC is a Digital Supervisor from Vicor Corporation.
> > 
> > Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
> > ---
> >   Documentation/hwmon/pli1209bc.rst |  73 +++++++++++++++++++++
> >   drivers/hwmon/pmbus/Kconfig       |   9 +++
> >   drivers/hwmon/pmbus/Makefile      |   1 +
> >   drivers/hwmon/pmbus/pli1209bc.c   | 104
> > ++++++++++++++++++++++++++++++
> >   4 files changed, 187 insertions(+)
> >   create mode 100644 Documentation/hwmon/pli1209bc.rst
> >   create mode 100644 drivers/hwmon/pmbus/pli1209bc.c
> > 
> > diff --git a/Documentation/hwmon/pli1209bc.rst
> > b/Documentation/hwmon/pli1209bc.rst
> > new file mode 100644
> > index 000000000000..a3f686d03cf2
> > --- /dev/null
> > +++ b/Documentation/hwmon/pli1209bc.rst
> > @@ -0,0 +1,73 @@
> > +Kernel driver pli1209bc
> > +=======================
> > +
> > +Supported chips:
> > +
> > +  * Digital Supervisor PLI1209BC
> > +
> > +    Prefix: 'pli1209bc'
> > +
> > +    Addresses scanned: 0x50 - 0x5F
> > +
> > +    Datasheet:
> > https://www.vicorpower.com/documents/datasheets/ds-PLI1209BCxyzz-VICOR.pdf
> > +
> > +Authors:
> > +    - Marcello Sylvester Bauer <sylv@sylv.io>
> > +
> > +Description
> > +-----------
> > +
> > +The Vicor PLI1209BC is an isolated digital power system supervisor
> > thatprovides
> > +a communication interface between a host processor and one Bus
> > Converter Module
> > +(BCM). The PLI communicates with a system controller via a PMBus
> > compatible
> > +interface over an isolated UART interface. Through the PLI, the
> > host processor
> > +can configure, set protection limits, and monitor the BCM.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +=======================
> > ========================================================
> > +in1_label              "vin2"
> > +in1_input              Input voltage.
> > +in1_rated_min          Minimum rated input voltage.
> > +in1_rated_max          Maximum rated input voltage.
> > +in1_max                        Maximum input voltage.
> > +in1_max_alarm          Input voltage high alarm.
> > +in1_crit               Critical input voltage.
> > +in1_crit_alarm         Input voltage critical alarm.
> > +
> > +in2_label              "vout2"
> > +in2_input              Output voltage.
> > +in2_rated_min          Minimum rated output voltage.
> > +in2_rated_max          Maximum rated output voltage.
> > +in2_alarm              Output voltage alarm
> > +
> > +curr1_label            "iin2"
> > +curr1_input            Input current.
> > +curr1_max              Maximum input current.
> > +curr1_max_alarm                Maximum input current high alarm.
> > +curr1_crit             Critical input current.
> > +curr1_crit_alarm       Input current critical alarm.
> > +
> > +curr2_label            "iout2"
> > +curr2_input            Output current.
> > +curr2_crit             Critical output current.
> > +curr2_crit_alarm       Output current critical alarm.
> > +curr2_max              Maximum output current.
> > +curr2_max_alarm                Output current high alarm.
> > +
> > +power1_label           "pin2"
> > +power1_input           Input power.
> > +power1_alarm           Input power alarm.
> > +
> > +power2_label           "pout2"
> > +power2_input           Output power.
> > +power2_rated_max       Maximum rated output power.
> > +
> > +temp1_input            Die temperature.
> > +temp1_alarm            Die temperature alarm.
> > +temp1_max              Maximum die temperature.
> > +temp1_max_alarm                Die temperature high alarm.
> > +temp1_crit             Critical die temperature.
> > +temp1_crit_alarm       Die temperature critical alarm.
> > +=======================
> > ========================================================
> > diff --git a/drivers/hwmon/pmbus/Kconfig
> > b/drivers/hwmon/pmbus/Kconfig
> > index c96f7b7338bd..831db423bea0 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -310,6 +310,15 @@ config SENSORS_PIM4328
> >           This driver can also be built as a module. If so, the
> > module will
> >           be called pim4328.
> >   
> > +config SENSORS_PLI1209BC
> > +       tristate "Vicor PLI1209BC"
> > +       help
> > +         If you say yes here you get hardware monitoring support
> > for Vicor
> > +         PLI1209BC Digital Supervisor.
> > +
> > +         This driver can also be built as a module. If so, the
> > module will
> > +         be called pli1209bc.
> > +
> >   config SENSORS_PM6764TR
> >         tristate "ST PM6764TR"
> >         help
> > diff --git a/drivers/hwmon/pmbus/Makefile
> > b/drivers/hwmon/pmbus/Makefile
> > index e5935f70c9e0..7ce74e3b8552 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -34,6 +34,7 @@ obj-$(CONFIG_SENSORS_MP2888)  += mp2888.o
> >   obj-$(CONFIG_SENSORS_MP2975)  += mp2975.o
> >   obj-$(CONFIG_SENSORS_MP5023)  += mp5023.o
> >   obj-$(CONFIG_SENSORS_PM6764TR)        += pm6764tr.o
> > +obj-$(CONFIG_SENSORS_PLI1209BC)        += pli1209bc.o
> >   obj-$(CONFIG_SENSORS_PXE1610) += pxe1610.o
> >   obj-$(CONFIG_SENSORS_Q54SJ108A2)      += q54sj108a2.o
> >   obj-$(CONFIG_SENSORS_STPDDC60)        += stpddc60.o
> > diff --git a/drivers/hwmon/pmbus/pli1209bc.c
> > b/drivers/hwmon/pmbus/pli1209bc.c
> > new file mode 100644
> > index 000000000000..da345eb105fd
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/pli1209bc.c
> > @@ -0,0 +1,104 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for Vicor PLI1209BC Digital
> > Supervisor
> > + *
> > + * Copyright (c) 2022 9elements GmbH
> > + */
> > +
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pmbus.h>
> > +#include "pmbus.h"
> > +
> > +/*
> > + * The capability command is only supported at page 0. Probing the
> > device while
> > + * the page register is set to 1 will falsely enable PEC support.
> > Disable
> > + * capability probing accordingly, since the PLI1209BC does not
> > have any
> > + * additional capabilities.
> > + */
> > +static struct pmbus_platform_data pli1209bc_plat_data = {
> > +       .flags = PMBUS_NO_CAPABILITY,
> > +};
> > +
> > +static int pli1209bc_read_word_data(struct i2c_client *client, int
> > page,
> > +                                   int phase, int reg)
> > +{
> > +       int data;
> > +
> > +       switch (reg) {
> > +       /* PMBUS_READ_PIN uses a direct format with R=1 */
> > +       case PMBUS_READ_PIN:
> > +               data = pmbus_read_word_data(client, page, phase,
> > reg);
> > +               if (data < 0)
> > +                       return data;
> > +               return div_s64(data + 5LL, 10L);
> 
> This results in a loss of precision. I think it would be better to
> avoid that
> and instead model the output power as direct format with R=1, and
> multiply
> register values reported for PMBUS_READ_POUT with 10.
> 

Makes sense, ack.

> > +       default:
> > +               return -ENODATA;
> > +       }
> > +}
> > +
> > +static struct pmbus_driver_info pli1209bc_info = {
> > +       .pages = 2,
> > +       .format[PSC_VOLTAGE_IN] = direct,
> > +       .format[PSC_VOLTAGE_OUT] = direct,
> > +       .format[PSC_CURRENT_IN] = direct,
> > +       .format[PSC_CURRENT_OUT] = direct,
> > +       .format[PSC_POWER] = linear,
> > +       .format[PSC_TEMPERATURE] = linear,
> 
> Those look like direct values to me. Linear would mean there is a
> mantissa and an exponent, but I don't see that in the datasheet.
> Please clarify; we don't want to have power values of 1024 and
> above show up as negative numbers.

My bad. I misunderstood the meaning of linear and thought it means
direct m=1,R=0,b=0. Thanks.

> 
> > +       .m[PSC_VOLTAGE_IN] = 1,
> > +       .b[PSC_VOLTAGE_IN] = 0,
> > +       .R[PSC_VOLTAGE_IN] = 1,
> > +       .m[PSC_VOLTAGE_OUT] = 1,
> > +       .b[PSC_VOLTAGE_OUT] = 0,
> > +       .R[PSC_VOLTAGE_OUT] = 1,
> > +       .m[PSC_CURRENT_IN] = 1,
> > +       .b[PSC_CURRENT_IN] = 0,
> > +       .R[PSC_CURRENT_IN] = 3,
> > +       .m[PSC_CURRENT_OUT] = 1,
> > +       .b[PSC_CURRENT_OUT] = 0,
> > +       .R[PSC_CURRENT_OUT] = 2,
> > +       .func[0] = 0, /* supervisor summing page without voltage
> > readings */
> 
> As far as I can see from the manual, the actually reported values for
> other
> attributes match those of page 1, making the values on page 0
> redundant.
> I think this should be mentioned in a comment to avoid confusion.
> 

Sure, sgtm.

> 
> > +       .func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT
> > +           | PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT
> > +           | PMBUS_HAVE_PIN | PMBUS_HAVE_POUT
> > +           | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
> > +           | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT,
> > +       .read_word_data = pli1209bc_read_word_data,
> > +};
> > +
> > +static int pli1209bc_probe(struct i2c_client *client)
> > +{
> > +       client->dev.platform_data = &pli1209bc_plat_data;
> > +       return pmbus_do_probe(client, &pli1209bc_info);
> > +}
> > +
> > +static const struct i2c_device_id pli1209bc_id[] = {
> > +       {"pli1209bc", 0},
> > +       {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, pli1209bc_id);
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id pli1209bc_of_match[] = {
> > +       { .compatible = "vicor,pli1209bc" },
> > +       { },
> > +};
> > +MODULE_DEVICE_TABLE(of, pli1209bc_of_match);
> > +#endif
> > +
> > +/* This is the driver that will be inserted */
> 
> Pretty useless comment.

ack.

Thanks for your quick review Guenter.

Marcello

> 
> > +static struct i2c_driver pli1209bc_driver = {
> > +       .driver = {
> > +                  .name = "pli1209bc",
> > +                  .of_match_table =
> > of_match_ptr(pli1209bc_of_match),
> > +                  },
> > +       .probe_new = pli1209bc_probe,
> > +       .id_table = pli1209bc_id,
> > +};
> > +
> > +module_i2c_driver(pli1209bc_driver);
> > +
> > +MODULE_AUTHOR("Marcello Sylvester Bauer <sylv@sylv.io>");
> > +MODULE_DESCRIPTION("PMBus driver for Vicor PLI1209BC");
> > +MODULE_LICENSE("GPL");
> 

