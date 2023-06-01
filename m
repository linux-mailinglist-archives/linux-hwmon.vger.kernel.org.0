Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C3271A0E0
	for <lists+linux-hwmon@lfdr.de>; Thu,  1 Jun 2023 16:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbjFAOtZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 1 Jun 2023 10:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjFAOtY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Jun 2023 10:49:24 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE64C0;
        Thu,  1 Jun 2023 07:49:21 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b0314f057cso4228545ad.1;
        Thu, 01 Jun 2023 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685630961; x=1688222961;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2z1cQ5eh9oQigVR+PZ7Zoa5pVuUlECl/torKKHKpvec=;
        b=sJGp7gsxcgIFhPb/BkNvK0Q1mhH01TVfpngpKXxmk7o6k9yR5rLGyufbSfmH15uLaB
         qGpDrhRlPBAvg7ugJ27M/ZvlYuYpBPgc3QD3JRCj79ewGFUfAkabL68Rhm/oNIx2rYPO
         zv+2Kdm7VUhNDGNxlhqZRzuhc0UJb5WxBq9MmBo2RTD5LJVqQqAu8GYHWAosUBE0u4XO
         yPj8shaqWW/U5VF8v7+rLVw59dJtYJQoTeB8dGY/hEjdDCcKBQZCWi2oxy2yRgkFhE9G
         +0iCD5i2rLSjTHo/GBCfSm4eRWOnNk5gIuJE/ffTSWPj4tr2Fwhar7s+o69lrm1AkICD
         boBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685630961; x=1688222961;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2z1cQ5eh9oQigVR+PZ7Zoa5pVuUlECl/torKKHKpvec=;
        b=TLKb/Xxn2ycDgHqlQ0/k/2irjxTmSNw64qzW2Dcs/XY9XH8azv6WSWtHAm+++81q12
         Nuy67sYW95b30RGZ7Fd8fl7Ntwa0HqQmxAtCqIFZ0s4FLAgfsZYWfjdE0ldbOaPNAH7G
         jAwwPa6pZqJxHC7rdpLsxV1bE/Cxa1h8wJkTChjKPVJZvGV7QNIPBmkQY3KOV99+eyii
         92y0+GuARj/02FvKFB5/VV0blTQcWydmrYG7gv1V44R5+xSiFzlG8bFAbxMaBAvOvPxy
         S0LyHLwEkvEi6fqIaU7r3SjMAw99uhy9Ot/jVRDRzH7sONraQ3Gk9JaS3x5TRPJJDy6U
         KqEg==
X-Gm-Message-State: AC+VfDx4oW2hWEyMTZRedGGmgfzNXEClUAFRFp0E/Y/Vv9eLuGVdtQz5
        hpijM8T+bNGuxdRovWFNqMMmL2B5ZUg=
X-Google-Smtp-Source: ACHHUZ7Br+RccfEhlBUB0KzAOSvxS0oRuEpmkrsUstqOjHUyxExtJcTbe6hLCTbxD1LcxQQ1tp9rmA==
X-Received: by 2002:a17:902:c403:b0:1b0:61dd:e523 with SMTP id k3-20020a170902c40300b001b061dde523mr7351463plk.41.1685630960578;
        Thu, 01 Jun 2023 07:49:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c3c400b001add2ba4459sm3592962plj.32.2023.06.01.07.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 07:49:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <675848b6-df00-b2de-84b4-7cc9038f64d8@roeck-us.net>
Date:   Thu, 1 Jun 2023 07:49:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     David Ober <dober6023@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        David Ober <dober@lenovo.com>
References: <20230601123830.82476-1-dober6023@gmail.com>
 <cfa7f046-5447-6c3e-4b6e-09e7ebb6809a@roeck-us.net>
 <CAFvZm1Fg+AF2dcTTgQnOugubeJsqfkM-dLuqA=Qv18eY9=fapg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] New module to add NCT6692D watchdog funtionality
In-Reply-To: <CAFvZm1Fg+AF2dcTTgQnOugubeJsqfkM-dLuqA=Qv18eY9=fapg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/1/23 07:38, David Ober wrote:
> Since there is at least one other EC chip monitor device that implemented the watchdog this way and I do plan to add other sensor output later I thought this was the best place for this
> 

No, it isn't. It is barely acceptable if the chip doesn't cleanly separate
watchdog and hardware monitoring functionality, but even then it is marginal.
It is most definitely not acceptable if a driver is initially submitted as
watchdog driver.

If anything, you have convinced me to no longer accept such combined drivers.
If the functionality can not be separated (that is, if the chip uses the
same memory region for hwmon and watchdog functionality), implement a mfd
driver instead, with watchdog and hwmon drivers as client drivers.

Guenter

> On Thu, Jun 1, 2023, 9:48 AM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On 6/1/23 05:38, David Ober wrote:
>      > The new module adds in the basic functionality of the NCT6692D
>      > watchdog driver. This functionality is added to support the
>      > Lenovo SE30 device
>      >
>      > Signed-off-by: David Ober <dober6023@gmail.com <mailto:dober6023@gmail.com>>
>      > ---
>      >   Documentation/hwmon/nct6692.rst |  30 ++
>      >   drivers/hwmon/Kconfig           |  10 +
>      >   drivers/hwmon/Makefile          |   1 +
>      >   drivers/hwmon/nct6692.c         | 691 ++++++++++++++++++++++++++++++++
> 
>     Why are you submitting a watchdog driver into the hwmon subsystem ?
> 
>     Guenter
> 
>      >   4 files changed, 732 insertions(+)
>      >   create mode 100644 Documentation/hwmon/nct6692.rst
>      >   create mode 100644 drivers/hwmon/nct6692.c
>      >
>      > diff --git a/Documentation/hwmon/nct6692.rst b/Documentation/hwmon/nct6692.rst
>      > new file mode 100644
>      > index 000000000000..3bb1a4cccc62
>      > --- /dev/null
>      > +++ b/Documentation/hwmon/nct6692.rst
>      > @@ -0,0 +1,30 @@
>      > +.. SPDX-License-Identifier: GPL-2.0
>      > +
>      > +Kernel driver nct6692
>      > +=====================
>      > +
>      > +Supported chips:
>      > +
>      > +  * Nuvoton NCT6692D
>      > +
>      > +    Prefix: 'nct6692'
>      > +
>      > +    Addresses scanned: ISA address retrieved from Super I/O registers
>      > +
>      > +    Datasheet: Available from Nuvoton upon request
>      > +
>      > +Authors:
>      > +
>      > +     David Ober <dober@lenovo.com <mailto:dober@lenovo.com>>
>      > +
>      > +Description
>      > +-----------
>      > +
>      > +This driver implements support for the Nuvoton NCT6692D eSIO chip.
>      > +
>      > +
>      > +Usage Note
>      > +----------
>      > +
>      > +Implement the watchdog functionality of the NCT6692D eSIO chip
>      > +
>      > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>      > index 0d3fd47db918..54907f5dbbce 100644
>      > --- a/drivers/hwmon/Kconfig
>      > +++ b/drivers/hwmon/Kconfig
>      > @@ -1528,6 +1528,16 @@ config SENSORS_NCT6683
>      >         This driver can also be built as a module. If so, the module
>      >         will be called nct6683.
>      >
>      > +config SENSORS_NCT6692
>      > +     tristate "Nuvoton NCT6692D"
>      > +     depends on !PPC
>      > +     help
>      > +       If you say yes here you get support for the hardware monitoring
>      > +       functionality of the Nuvoton NCT6692D eSIO chip.
>      > +
>      > +       This driver can also be built as a module. If so, the module
>      > +       will be called nct6692.
>      > +
>      >   config SENSORS_NCT6775_CORE
>      >       tristate
>      >       select REGMAP
>      > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>      > index 708e612e4ead..d9cd0735dd26 100644
>      > --- a/drivers/hwmon/Makefile
>      > +++ b/drivers/hwmon/Makefile
>      > @@ -159,6 +159,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>      >   obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>      >   obj-$(CONFIG_SENSORS_MR75203)       += mr75203.o
>      >   obj-$(CONFIG_SENSORS_NCT6683)       += nct6683.o
>      > +obj-$(CONFIG_SENSORS_NCT6692)        += nct6692.o
>      >   obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
>      >   nct6775-objs                        := nct6775-platform.o
>      >   obj-$(CONFIG_SENSORS_NCT6775)       += nct6775.o
>      > diff --git a/drivers/hwmon/nct6692.c b/drivers/hwmon/nct6692.c
>      > new file mode 100644
>      > index 000000000000..2fd5d51d888c
>      > --- /dev/null
>      > +++ b/drivers/hwmon/nct6692.c
>      > @@ -0,0 +1,691 @@
>      > The new module adds in the basic functionality of the NCT6692D
>      > watchdog driver. This functionality is added to support the
>      > Lenovo SE30 device
>      > +// SPDX-License-Identifier: GPL-2.0-or-later
>      > +/*
>      > + * ThinkEdge Watchdog Driver
>      > + */
>      > +
>      > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>      > +
>      > +#include <linux/acpi.h>
>      > +#include <linux/module.h>
>      > +#include <linux/moduleparam.h>
>      > +#include <linux/platform_device.h>
>      > +#include <linux/types.h>
>      > +#include <linux/watchdog.h>
>      > +#include <linux/ioport.h>
>      > +#include <linux/init.h>
>      > +#include <linux/io.h>
>      > +#include <linux/pci.h>
>      > +
>      > +#include <linux/string.h>
>      > +
>      > +/*
>      > + * ISA constants
>      > + */
>      > +
>      > +#define IOREGION_ALIGNMENT      (~7)
>      > +#define IOREGION_OFFSET         4       /* Use EC port 1 */
>      > +#define IOREGION_LENGTH         4
>      > +
>      > +#define WATCHDOG_TIMEOUT 60 /* 60 sec default timeout */
>      > +#define WATCHDOG_WDT_SEL 1
>      > +
>      > +/*The timeout range is 1-255 minutes*/
>      > +#define MIN_TIMEOUT       1
>      > +#define MAX_TIMEOUT       255
>      > +
>      > +#define THINKEDGE_MAX_PARAM_STRING_LEN 16
>      > +
>      > +static int timeout; /* in seconds */
>      > +module_param(timeout, int, 0);
>      > +MODULE_PARM_DESC(timeout,
>      > +              "Watchdog timeout in seconds. 1 <= timeout <= 255, default="
>      > +              __MODULE_STRING(WATCHDOG_TIMEOUT) ".");
>      > +
>      > +static bool nowayout = WATCHDOG_NOWAYOUT;
>      > +module_param(nowayout, bool, 0);
>      > +MODULE_PARM_DESC(nowayout,
>      > +              "Watchdog cannot be stopped once started (default="
>      > +              __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>      > +
>      > +static int early_disable;
>      > +module_param(early_disable, int, 0);
>      > +MODULE_PARM_DESC(early_disable, "Disable watchdog at boot time (default=0)");
>      > +
>      > +#define DRVNAME "nct6692"
>      > +
>      > +#define NCT6692 "nct6692"
>      > +#define NCT6692_ID 0x0110
>      > +
>      > +#define WDT_EFER(X) (X + 0)  /* Extended Function Enable Registers */
>      > +#define WDT_EFIR(X) (X + 0)  /* Extended Function Index Register(same as EFER) */
>      > +#define WDT_EFDR(X) (WDT_EFIR(X) + 1) /* Extended Function Data Register */
>      > +#define CHIPID_MASK 0xFFF0
>      > +
>      > +#define NCT6692_MAX_IO_RETRY_NUM 0x300
>      > +
>      > +#define NCT6692_EC_NAME "nct6692_ec"
>      > +#define NCT6692_EC_REPORT_NAME "nct6692_ec_rep"
>      > +#define NCT6692_HWM_CFG               0x180
>      > +
>      > +#define NCT6692_SIO_UNLOCK_KEY 0x87
>      > +#define NCT6692_SIO_LOCK_KEY 0xAA
>      > +
>      > +#define NCT6692_LD_NUM_SHM 0x0F
>      > +#define NCT6692_LD_WIN2_BASE_ADDR 0xF8
>      > +#define NCT6692_LD_REPORT_BASE_ADDR 0xE4
>      > +
>      > +// Host Interface WIN2 offset definition
>      > +#define SHM_WIN_MOD_OFFSET 0x01
>      > +#define SHM_WIN_CMD_OFFSET 0x02
>      > +#define SHM_WIN_SEL_OFFSET 0x03
>      > +#define SHM_WIN_CTL_OFFSET 0x04
>      > +#define VAL_SHM_WIN_CTRL_WR 0x40
>      > +#define VAL_SHM_WIN_CTRL_RD 0x80
>      > +#define SHM_WIN_ID_OFFSET 0x08
>      > +#define SHM_WIN_DAT_OFFSET 0x10
>      > +
>      > +struct nct6692_shm_t {
>      > +     u_char *base_addr;
>      > +     u_long base_phys;
>      > +     u_char offset_mod;
>      > +     u_char offset_cmd;
>      > +     u_char offset_sel;
>      > +     u_char offset_ctl;
>      > +     u_char offset_id;
>      > +     u_char offset_dat;
>      > +     u_char *report_addr;
>      > +     u_long report_phys;
>      > +};
>      > +
>      > +/* REGs definitions */
>      > +enum nct6692_channel_type {
>      > +     NCT6692_CHANNEL_DEFAULT,
>      > +     NCT6692_CHANNEL_REPORT,      /* Not used in this driver. */
>      > +};
>      > +
>      > +struct nct6692_sio_data {
>      > +     u_long base_phys;
>      > +     u_long report_phys;
>      > +     int sioreg;
>      > +};
>      > +
>      > +struct nct6692_reg_t {
>      > +     u_char channel;  /* nct6692_channel_type */
>      > +     u_char mod;
>      > +     u_char cmd;
>      > +     u_char sel;
>      > +     u_int idx;
>      > +};
>      > +
>      > +struct nct6692_data_t {
>      > +     struct nct6692_shm_t shm;
>      > +     struct nct6692_reg_t cfg;
>      > +     struct nct6692_reg_t cnt;
>      > +     u_char timeout;
>      > +     struct watchdog_device wdt;
>      > +};
>      > +
>      > +static inline void superio_outb(int ioreg, int reg, int val)
>      > +{
>      > +     outb(reg, WDT_EFER(ioreg));
>      > +     outb(val, WDT_EFDR(ioreg));
>      > +}
>      > +
>      > +static inline int superio_inb(int ioreg, int reg)
>      > +{
>      > +     outb(reg, WDT_EFER(ioreg));
>      > +     return inb(WDT_EFDR(ioreg));
>      > +}
>      > +
>      > +static inline int superio_enter(int key, int addr, const char *name)
>      > +{
>      > +     if (!request_muxed_region(addr, 2, name)) {
>      > +             pr_err("I/O address 0x%04x already in use\n", addr);
>      > +             return -EBUSY;
>      > +     }
>      > +     outb_p(key, WDT_EFER(addr)); /* Enter extended function mode */
>      > +     outb_p(key, WDT_EFER(addr)); /* Again according to manual */
>      > +
>      > +     return 0;
>      > +}
>      > +
>      > +static inline void superio_select(int ioreg, int ld)
>      > +{
>      > +     superio_outb(ioreg, 0x07, ld);
>      > +}
>      > +
>      > +static inline void superio_exit(int key, int addr)
>      > +{
>      > +     outb_p(key, WDT_EFER(addr)); /* Leave extended function mode */
>      > +     release_region(addr, 2);
>      > +}
>      > +
>      > +/*
>      > + * The following several functions are used to access host interface according
>      > + * to the definition of memory region, reg (as a base addr) and an index offset
>      > + * It uses (shm.base_addr + shm.offset) format to locate the data area of the
>      > + * host interface channel. Then access the address "reg.idx + idx_offset" that
>      > + * are suitable for a loop accessing. Where the idx_offset is an extra offset
>      > + * based on the definition of reg for accessing the address based on the reg.
>      > + *
>      > + * Functions with suffix of 'report' are used to access report channel.
>      > + */
>      > +
>      > +int read_shm_win(const struct nct6692_shm_t *shm,
>      > +              const struct nct6692_reg_t *reg,
>      > +              u_char idx_offset)
>      > +{
>      > +     int retval;
>      > +     u_char pre_id;
>      > +     u_char new_id;
>      > +     u_int count = 0;
>      > +
>      > +     if (!request_mem_region(shm->base_phys, 256, NCT6692_EC_NAME)) {
>      > +             pr_err("nuv:request channel mutex fail (base_addr=%lX)\n",
>      > +                    shm->base_phys);
>      > +             retval = -EBUSY;
>      > +             goto exit;
>      > +     }
>      > +
>      > +     iowrite8(reg->mod, shm->base_addr + shm->offset_mod);
>      > +     iowrite8(reg->cmd, shm->base_addr + shm->offset_cmd);
>      > +     iowrite8(reg->sel, shm->base_addr + shm->offset_sel);
>      > +     pre_id = ioread8(shm->base_addr + shm->offset_id);
>      > +     iowrite8(VAL_SHM_WIN_CTRL_RD, shm->base_addr + shm->offset_ctl);
>      > +     do {
>      > +             new_id = ioread8(shm->base_addr + shm->offset_id);
>      > +             if (count == NCT6692_MAX_IO_RETRY_NUM) {
>      > +                     pr_warn("nuv:Wait ID count timeout in %s!\n", __func__);
>      > +                     retval = 0;
>      > +                     goto exit_release;
>      > +             }
>      > +             count++;
>      > +     } while (pre_id == new_id);
>      > +     retval = ioread8(shm->base_addr + shm->offset_dat + reg->idx + idx_offset);
>      > +
>      > +exit_release:
>      > +     release_mem_region(shm->base_phys, 256);
>      > +exit:
>      > +     return retval;
>      > +}
>      > +
>      > +int write_shm_win(const struct nct6692_shm_t *shm,
>      > +               const struct nct6692_reg_t *reg,
>      > +               u_char idx_offset,
>      > +               u_char val)
>      > +{
>      > +     int err = 0;
>      > +     u_char pre_id;
>      > +     u_char new_id;
>      > +     u_int count = 0;
>      > +
>      > +     if (!request_mem_region(shm->base_phys, 256, NCT6692_EC_NAME)) {
>      > +             pr_err("nuv:request channel mutex fail (base_addr=%lX)\n",
>      > +                    shm->base_phys);
>      > +             err = -EBUSY;
>      > +             goto err_exit;
>      > +     }
>      > +
>      > +     iowrite8(reg->mod, shm->base_addr + shm->offset_mod);
>      > +     iowrite8(reg->cmd, shm->base_addr + shm->offset_cmd);
>      > +     iowrite8(reg->sel, shm->base_addr + shm->offset_sel);
>      > +
>      > +     pre_id = ioread8(shm->base_addr + shm->offset_id);
>      > +     iowrite8(VAL_SHM_WIN_CTRL_RD, shm->base_addr + shm->offset_ctl);
>      > +     do {
>      > +             new_id = ioread8(shm->base_addr + shm->offset_id);
>      > +             if (count == NCT6692_MAX_IO_RETRY_NUM) {
>      > +                     pr_warn("nuv:Wait ID count timeout in %s!\n", __func__);
>      > +                     err = -EINVAL;
>      > +                     goto err_exit_release;
>      > +             }
>      > +             count++;
>      > +     } while (pre_id == new_id);
>      > +
>      > +     iowrite8(val, shm->base_addr + shm->offset_dat + reg->idx + idx_offset);
>      > +
>      > +     pre_id = new_id;
>      > +
>      > +     iowrite8(VAL_SHM_WIN_CTRL_WR, shm->base_addr + shm->offset_ctl);
>      > +     do {
>      > +             new_id = ioread8(shm->base_addr + shm->offset_id);
>      > +             if (count == NCT6692_MAX_IO_RETRY_NUM) {
>      > +                     pr_warn("nuv:Wait ID count timeout in %s!\n", __func__);
>      > +                     err = -EINVAL;
>      > +                     goto err_exit_release;
>      > +             }
>      > +             count++;
>      > +     } while (pre_id == new_id);
>      > +
>      > +err_exit_release:
>      > +     release_mem_region(shm->base_phys, 256);
>      > +
>      > +err_exit:
>      > +     return err;
>      > +}
>      > +
>      > +int read_shm_report(const struct nct6692_shm_t *shm,
>      > +                 const struct nct6692_reg_t *reg,
>      > +                 u_char idx_offset)
>      > +{
>      > +     int val;
>      > +
>      > +     if (!request_mem_region(shm->report_phys, 256,
>      > +                             NCT6692_EC_REPORT_NAME)) {
>      > +             pr_err("nuv:request channel mutex fail (base_addr=%lX)\n",
>      > +                    shm->report_phys);
>      > +             return -EBUSY;
>      > +     }
>      > +
>      > +     val = ioread8(shm->report_addr + reg->idx + idx_offset);
>      > +
>      > +     release_mem_region(shm->report_phys, 256);
>      > +
>      > +     return val;
>      > +}
>      > +
>      > +int read_shm(const struct nct6692_shm_t *shm,
>      > +          const struct nct6692_reg_t *reg)
>      > +{
>      > +     if (reg->channel == NCT6692_CHANNEL_DEFAULT)
>      > +             return read_shm_win(shm, reg, 0);
>      > +
>      > +     return read_shm_report(shm, reg, 0);
>      > +}
>      > +
>      > +int write_shm(const struct nct6692_shm_t *shm,
>      > +           const struct nct6692_reg_t *reg,
>      > +           u_char val)
>      > +{
>      > +     if (reg->channel == NCT6692_CHANNEL_DEFAULT)
>      > +             return write_shm_win(shm, reg, 0, val);
>      > +
>      > +     pr_warn("Report channel CAN NOT be written!\n");
>      > +     return -EINVAL;
>      > +}
>      > +
>      > +int read_shm_with_offset(const struct nct6692_shm_t *shm,
>      > +                      const struct nct6692_reg_t *reg,
>      > +                      u_char idx_offset)
>      > +{
>      > +     if (reg->channel == NCT6692_CHANNEL_DEFAULT)
>      > +             return read_shm_win(shm, reg, idx_offset);
>      > +
>      > +     return read_shm_report(shm, reg, idx_offset);
>      > +}
>      > +
>      > +int write_shm_with_offset(const struct nct6692_shm_t *shm,
>      > +                       const struct nct6692_reg_t *reg,
>      > +                       u_char idx_offset,
>      > +                       u_char val)
>      > +{
>      > +     if (reg->channel == NCT6692_CHANNEL_DEFAULT)
>      > +             return write_shm_win(shm, reg, idx_offset, val);
>      > +
>      > +     pr_warn("Report channel CAN NOT be written!\n");
>      > +     return -EINVAL;
>      > +}
>      > +
>      > +static int nct6692_wdt_init(struct watchdog_device *wdog)
>      > +{
>      > +     int err = 0;
>      > +     u_char timeout, cfg;
>      > +     struct nct6692_data_t *data = watchdog_get_drvdata(wdog);
>      > +
>      > +     timeout = read_shm(&data->shm, &data->cnt);
>      > +     cfg = read_shm(&data->shm, &data->cfg);
>      > +
>      > +     if (timeout < 0)
>      > +             return timeout;
>      > +     if (timeout == 0)
>      > +             return 0;
>      > +
>      > +     if (early_disable) {
>      > +             pr_warn("Stopping previously enabled watchdog until userland kicks in\n");
>      > +             // Disable WDT and clear timeout count
>      > +             data->timeout = 0;
>      > +             err = write_shm(&data->shm, &data->cnt, data->timeout);
>      > +     } else {
>      > +             pr_info("Watchdog already running. Resetting timeout to %d sec\n",
>      > +                     wdog->timeout);
>      > +             data->timeout = wdog->timeout;
>      > +             err = write_shm(&data->shm, &data->cnt, data->timeout);
>      > +     }
>      > +
>      > +     return err;
>      > +}
>      > +
>      > +static int nct6692_wdt_enable(bool enable, u_int timeout,
>      > +                             struct nct6692_data_t *data)
>      > +{
>      > +     u_char reg;
>      > +
>      > +     reg = read_shm(&data->shm, &data->cfg);
>      > +
>      > +     if (enable) {
>      > +             write_shm(&data->shm, &data->cfg, 0x02);
>      > +             /* ^^^^ 0x00 to disable reboot */
>      > +             data->timeout = timeout;
>      > +             write_shm(&data->shm, &data->cnt, data->timeout);
>      > +             reg = read_shm(&data->shm, &data->cfg);
>      > +     } else {
>      > +             data->timeout = 0;
>      > +             write_shm(&data->shm, &data->cnt, data->timeout);
>      > +     }
>      > +     reg = read_shm(&data->shm, &data->cfg);
>      > +     reg = read_shm(&data->shm, &data->cnt);
>      > +     return 0;
>      > +}
>      > +
>      > +static int nct6692_wdt_set_time(struct watchdog_device *wdog, u_int timeout)
>      > +{
>      > +     struct nct6692_data_t *data = watchdog_get_drvdata(wdog);
>      > +
>      > +     if (timeout != 0)
>      > +             nct6692_wdt_enable(true, timeout, data);
>      > +     else
>      > +             nct6692_wdt_enable(false, timeout, data);
>      > +
>      > +     return 0;
>      > +}
>      > +
>      > +static int nct6692_wdt_setup(struct watchdog_device *wdt)
>      > +{
>      > +     int err = 0;
>      > +
>      > +     watchdog_stop_on_reboot(wdt);
>      > +
>      > +     err = nct6692_wdt_init(wdt);
>      > +     if (err) {
>      > +             pr_err("failed to initialize watchdog (err=%d)\n", err);
>      > +             return err;
>      > +     }
>      > +     return err;
>      > +}
>      > +
>      > +static int nct6692_wdt_start(struct watchdog_device *wdog)
>      > +{
>      > +     struct nct6692_data_t *data = watchdog_get_drvdata(wdog);
>      > +
>      > +     nct6692_wdt_setup(wdog);
>      > +     nct6692_wdt_set_time(wdog, data->timeout);
>      > +     return 0;
>      > +}
>      > +
>      > +static int nct6692_wdt_stop(struct watchdog_device *wdog)
>      > +{
>      > +     return nct6692_wdt_set_time(wdog, 0);
>      > +}
>      > +
>      > +static int nct6692_wdt_set_timeout(struct watchdog_device *wdog,
>      > +                                  u_int timeout)
>      > +{
>      > +     wdog->timeout = timeout;
>      > +     return 0;
>      > +}
>      > +
>      > +static u_int nct6692_wdt_get_timeleft(struct watchdog_device *wdog)
>      > +{
>      > +     struct nct6692_data_t *data = watchdog_get_drvdata(wdog);
>      > +     u_int timeleft;
>      > +
>      > +     timeleft = read_shm(&data->shm, &data->cnt);
>      > +     return timeleft;
>      > +}
>      > +
>      > +static int nct6692_wdt_ping(struct watchdog_device *wdt)
>      > +{
>      > +     struct nct6692_data_t *data = watchdog_get_drvdata(wdt);
>      > +     int timeout;
>      > +
>      > +     /*
>      > +      * Note:
>      > +      * NCT6692 does not support refreshing WDT_TIMER_REG register when
>      > +      * the watchdog is active. Please disable watchdog before feeding
>      > +      * the watchdog and enable it again.
>      > +      */
>      > +     /* Disable soft watchdog timer */
>      > +     timeout = 0;
>      > +     nct6692_wdt_enable(false, timeout, data);
>      > +
>      > +     /* feed watchdog */
>      > +     timeout = wdt->timeout;
>      > +     write_shm(&data->shm, &data->cnt, data->timeout);
>      > +
>      > +     /* Enable soft watchdog timer */
>      > +     nct6692_wdt_enable(true, timeout, data);
>      > +     return 0;
>      > +
>      > +}
>      > +
>      > +static const struct watchdog_info nct6692_wdt_info = {
>      > +     .options        = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
>      > +                       WDIOF_MAGICCLOSE,
>      > +     .identity       = "nct6692 watchdog",
>      > +};
>      > +
>      > +static const struct watchdog_ops nct6692_wdt_ops = {
>      > +     .owner    = THIS_MODULE,
>      > +     .start    = nct6692_wdt_start,
>      > +     .stop      = nct6692_wdt_stop,
>      > +     .ping      = nct6692_wdt_ping,
>      > +     .set_timeout    = nct6692_wdt_set_timeout,
>      > +     .get_timeleft   = nct6692_wdt_get_timeleft,
>      > +};
>      > +
>      > +static int nct6692_probe(struct platform_device *pdev)
>      > +{
>      > +     struct device *dev = &pdev->dev;
>      > +     struct nct6692_data_t *data = NULL;
>      > +     struct nct6692_sio_data *sio_data = dev->platform_data;
>      > +     struct resource *res;
>      > +
>      > +     pr_info("Probe NCT6692 called\n");
>      > +     res = platform_get_resource(pdev, IORESOURCE_IO, 0);
>      > +
>      > +     data = kzalloc(sizeof(struct nct6692_data_t), GFP_KERNEL);
>      > +     if (!data)
>      > +             return -ENOMEM;
>      > +
>      > +     // init value
>      > +     data->shm.base_addr = 0;
>      > +     data->shm.report_addr = 0;
>      > +
>      > +     data->shm.base_phys = sio_data->base_phys;
>      > +     data->shm.base_addr = (u_char *)ioremap_cache(data->shm.base_phys, 256);
>      > +
>      > +     data->shm.offset_mod = SHM_WIN_MOD_OFFSET;
>      > +     data->shm.offset_cmd = SHM_WIN_CMD_OFFSET;
>      > +     data->shm.offset_sel = SHM_WIN_SEL_OFFSET;
>      > +     data->shm.offset_ctl = SHM_WIN_CTL_OFFSET;
>      > +     data->shm.offset_id = SHM_WIN_ID_OFFSET;
>      > +     data->shm.offset_dat = SHM_WIN_DAT_OFFSET;
>      > +
>      > +     // Base for REPORT Channel
>      > +     data->shm.report_phys = sio_data->report_phys;
>      > +     data->shm.report_addr = (u_char *)ioremap_cache(data->shm.report_phys, 256);
>      > +
>      > +     data->cfg.channel = NCT6692_CHANNEL_DEFAULT;
>      > +     data->cfg.mod = 0x10;
>      > +     data->cfg.cmd = 0;
>      > +     data->cfg.sel = 0;
>      > +     data->cfg.idx = 0x15;
>      > +     data->cnt.channel = NCT6692_CHANNEL_DEFAULT;
>      > +     data->cnt.mod = 0x10;
>      > +     data->cnt.cmd = 0;
>      > +     data->cnt.sel = 0;
>      > +     data->cnt.idx = 0x16;
>      > +
>      > +     data->wdt.ops = &nct6692_wdt_ops;
>      > +     data->wdt.info <http://wdt.info> = &nct6692_wdt_info;
>      > +
>      > +     data->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
>      > +     data->wdt.min_timeout = MIN_TIMEOUT;
>      > +     data->wdt.max_timeout = MAX_TIMEOUT;
>      > +     data->wdt.parent = &pdev->dev;
>      > +
>      > +     watchdog_init_timeout(&data->wdt, timeout, &pdev->dev);
>      > +     watchdog_set_nowayout(&data->wdt, nowayout);
>      > +     watchdog_set_drvdata(&data->wdt, data);
>      > +
>      > +     watchdog_stop_on_unregister(&data->wdt);
>      > +
>      > +     return devm_watchdog_register_device(dev, &data->wdt);
>      > +}
>      > +
>      > +static struct platform_driver nct6692_driver = {
>      > +     .driver = {
>      > +             .name = DRVNAME,
>      > +             /*.pm   = NCT6692_DEV_PM_OPS,*/
>      > +     },
>      > +     .probe  = nct6692_probe,
>      > +};
>      > +
>      > +static int __init nct6692_find(int addr, u_long *base_phys,
>      > +                           u_long *report_phys)
>      > +{
>      > +     u16 val;
>      > +     int err = 0;
>      > +     u_long tmp_base_phys;
>      > +     u_long tmp_report_phys;
>      > +
>      > +     err = superio_enter(NCT6692_SIO_UNLOCK_KEY, addr, NCT6692);
>      > +     if (err)
>      > +             return err;
>      > +
>      > +     val = superio_inb(addr, 0x20);
>      > +     val = ((val << 8) | (superio_inb(addr, 0x21) & 0xFF)) & CHIPID_MASK;
>      > +
>      > +     if (val != NCT6692_ID) {
>      > +             err = -ENODEV;
>      > +             goto fail;
>      > +     }
>      > +
>      > +     superio_select(addr, NCT6692_LD_NUM_SHM);
>      > +     tmp_base_phys = ((superio_inb(addr, NCT6692_LD_WIN2_BASE_ADDR) & 0xFF) |
>      > +                      ((superio_inb(addr, NCT6692_LD_WIN2_BASE_ADDR + 1) & 0xFF) << 8) |
>      > +                      ((superio_inb(addr, NCT6692_LD_WIN2_BASE_ADDR + 2) & 0xFF) << 16) |
>      > +                      ((superio_inb(addr, NCT6692_LD_WIN2_BASE_ADDR + 3) & 0xFF) << 24)) &
>      > +             0xFFFFFFFF;
>      > +
>      > +     if ((tmp_base_phys == 0xFFFFFFFF) || (tmp_base_phys == 0)) {
>      > +             err = -ENODEV;
>      > +             goto fail;
>      > +     }
>      > +
>      > +     tmp_report_phys = ((superio_inb(addr, NCT6692_LD_REPORT_BASE_ADDR) & 0xFF) |
>      > +                        ((superio_inb(addr, NCT6692_LD_REPORT_BASE_ADDR + 1) & 0xFF) << 8) |
>      > +                        ((superio_inb(addr, NCT6692_LD_REPORT_BASE_ADDR + 2) & 0xFF) << 16) |
>      > +                        ((superio_inb(addr, NCT6692_LD_REPORT_BASE_ADDR + 3) & 0xFF) << 24)) &
>      > +             0xFFFFFFFF;
>      > +
>      > +     if ((tmp_report_phys == 0xFFFFFFFF) || (tmp_report_phys == 0)) {
>      > +             err = -ENODEV;
>      > +             goto fail;
>      > +     }
>      > +
>      > +fail:
>      > +     superio_exit(NCT6692_SIO_LOCK_KEY, addr);
>      > +     if (!err) {
>      > +             if (base_phys != NULL)
>      > +                     *base_phys = tmp_base_phys;
>      > +             if (report_phys != NULL)
>      > +                     *report_phys = tmp_report_phys;
>      > +     }
>      > +     return err;
>      > +}
>      > +
>      > +static struct platform_device *pdev;
>      > +
>      > +static int __init nct6692_init(void)
>      > +{
>      > +     struct nct6692_sio_data sio_data;
>      > +     int sioaddr[2] = { 0x2e, 0x4e };
>      > +     struct resource res;
>      > +     int err;
>      > +     int address;
>      > +     bool found = false;
>      > +     u_long base_phys = 0;
>      > +     u_long report_phys = 0;
>      > +
>      > +     platform_driver_register(&nct6692_driver);
>      > +
>      > +     /*
>      > +      * initialize sio_data->kind and sio_data->sioreg.
>      > +      *
>      > +      * when Super-I/O functions move to a separate file, the Super-I/O
>      > +      * driver will probe 0x2e and 0x4e and auto-detect the presence of a
>      > +      * nct6692 hardware monitor, and call probe()
>      > +      */
>      > +     err = nct6692_find(sioaddr[0], &base_phys, &report_phys);
>      > +     if (err) {
>      > +             err = nct6692_find(sioaddr[1], &base_phys, &report_phys);
>      > +             if (err)
>      > +                     return -ENODEV;
>      > +     }
>      > +     found = true;
>      > +     sio_data.base_phys = base_phys;
>      > +     sio_data.report_phys = report_phys;
>      > +
>      > +     pr_info("NCT6692 device found\n");
>      > +     pdev = platform_device_alloc(DRVNAME, base_phys);
>      > +     if (!pdev) {
>      > +             err = -ENOMEM;
>      > +             goto exit_device_unregister;
>      > +     }
>      > +     err = platform_device_add_data(pdev, &sio_data,
>      > +                                     sizeof(struct nct6692_sio_data));
>      > +     if (err)
>      > +             goto exit_device_put;
>      > +
>      > +     memset(&res, 0, sizeof(res));
>      > + res.name <http://res.name> = DRVNAME;
>      > +     res.start = address + IOREGION_OFFSET;
>      > +     res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
>      > +     res.flags = IORESOURCE_IO;
>      > +
>      > +     err = acpi_check_resource_conflict(&res);
>      > +     if (err) {
>      > +             platform_device_put(pdev);
>      > +             pdev = NULL;
>      > +     }
>      > +
>      > +     err = platform_device_add_resources(pdev, &res, 1);
>      > +     if (err)
>      > +             goto exit_device_put;
>      > +
>      > +     /* platform_device_add calls probe() */
>      > +     err = platform_device_add(pdev);
>      > +     if (err)
>      > +             goto exit_device_put;
>      > +
>      > +     if (!found) {
>      > +             err = -ENODEV;
>      > +             goto exit_unregister;
>      > +     }
>      > +
>      > +     return 0;
>      > +exit_device_put:
>      > +     platform_device_put(pdev);
>      > +exit_device_unregister:
>      > +     if (pdev)
>      > +             platform_device_unregister(pdev);
>      > +exit_unregister:
>      > +     platform_driver_unregister(&nct6692_driver);
>      > +     return err;
>      > +}
>      > +
>      > +static void __exit nct6692_exit(void)
>      > +{
>      > +     platform_device_unregister(pdev);
>      > +     platform_driver_unregister(&nct6692_driver);
>      > +}
>      > +
>      > +MODULE_AUTHOR("David Ober <dober@lenovo.com <mailto:dober@lenovo.com>>");
>      > +MODULE_DESCRIPTION("NCT6692D driver");
>      > +MODULE_LICENSE("GPL");
>      > +
>      > +module_init(nct6692_init);
>      > +module_exit(nct6692_exit);
>      > +
> 

