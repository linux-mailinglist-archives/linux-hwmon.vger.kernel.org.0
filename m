Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB7F2638F2
	for <lists+linux-hwmon@lfdr.de>; Thu, 10 Sep 2020 00:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIIW0A (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 9 Sep 2020 18:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIIWZ6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Sep 2020 18:25:58 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C89C061573
        for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2020 15:25:57 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id y6so4002980oie.5
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2020 15:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1GlFCsl450kg3mRObXZrd+clwfH4qWcAyy0Lj36B3Ik=;
        b=lCIt5oF15RPtVDwskXoCe00KDBUUFwt0aHHPKsVVRonDtlnA3HbLQvd/tqI2juouJ0
         kmM4KEuuNl0046cgv4TbDFoggn0HBlulwrSPnEHo89Jh4d+FXVE9ng6VFR08+EZaOuL2
         F3JjFrIJckpEGVN4u566K95iNbH2d8CSnpAALjCQrC4lOj2Xd8sUoLcAkzpBAozt/Png
         rlyZxSztNQ7ha6YNPTdAfXPE2ZOkKJWCe+mcut06v1g05w8u6rik/3rYUf7mK06N6Ta5
         twcPDztQ+15sYDI6EKecPX3o9nTYzF0SGYOQN5tK9Gb22BETNnw75nsTKaUGPvz11kkj
         I+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1GlFCsl450kg3mRObXZrd+clwfH4qWcAyy0Lj36B3Ik=;
        b=k/fCrQ3opy87XecB0k1RJo8XwM6HtFGzcKFH1UgWTLAqWM4x/yqg0MmU10I8S53Xr9
         JC+mjJUHx8Ar5S2ViBv29gMfYuycay8IoMf8WCsaqsOauBX2wbMK5mXGypXrKYD/vG3L
         cZZpKlMDWorP2jqxLQeRx7aUJbCH764mEPWJFQjEeSkHnMfXLMkzgRxI/bY0Xga/g2t6
         Ktc6BNlmw4Bc1yTEPjPYcLHkBHU5nXTCTLgRVZQJNk+Y+3y2M5nXTaZG1ZRrt9S3ckov
         dLvUhESBHIQjc3fw3iJdKRF7UHOi+Uf8lWGIrpv5NkZZ4l3bWoAX/CPcmOzcfmXKhyj/
         DhIQ==
X-Gm-Message-State: AOAM532HzC6NZqeejMmxUDleHe3VP3vWCZGurl1rFYRePHl8sIwaRlvK
        0Jw1ezKu3S9+XROpR2WjP7maxvaI9z8=
X-Google-Smtp-Source: ABdhPJyzPpNpUOtkjnEZk799J8rGO/4+wuZR9M+7ags0IjD6r2g7eoV5DdXvp7GTLIe9AAZL6QXUow==
X-Received: by 2002:aca:e042:: with SMTP id x63mr2030091oig.45.1599690357129;
        Wed, 09 Sep 2020 15:25:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l25sm577597otb.4.2020.09.09.15.25.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 15:25:56 -0700 (PDT)
Date:   Wed, 9 Sep 2020 15:25:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alex Qiu <xqiu@google.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (pmbus) Stop caching register values
Message-ID: <20200909222554.GA80704@roeck-us.net>
References: <20200904163314.259087-1-linux@roeck-us.net>
 <CAA_a9xJBT2qV5rFDmGMm1OC1_LmTLivMYLyR1_aCHAbHbkbX3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA_a9xJBT2qV5rFDmGMm1OC1_LmTLivMYLyR1_aCHAbHbkbX3Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Alex,

On Wed, Sep 09, 2020 at 03:18:23PM -0700, Alex Qiu wrote:
> Thank you very much, Guenter! This patch boosted performance A LOT:
> scanning one temperature reading through ~10 aforementioned PMBus
> devices now takes 36 ms instead of ~2 secs!
> 

Great, thanks a lot for reviewing and testing. I'll queue the patch
for v5.10.

Guenter

> - Alex Qiu
> 
> On Fri, Sep 4, 2020 at 9:33 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Caching register values can be very expensive for PMBus chips. Some
> > modern chips may have 10 or more pages, with several sensors supported
> > per page. For example, MAX16601 creates more than 90 sysfs attributes.
> > Register caching for such chips is time consuming, especially if only a
> > few attributes are read on a regular basis. For MAX16601, it was observed
> > that it can take up to two seconds to read all attributes on a slow I2C
> > bus. In this situation, register caching results in the opposite of its
> > intention: It increases the number of I2C operations, in some cases
> > substantially, and it results in large latency when trying to access
> > individual sensor data.
> >
> > Drop all register caching to solve the problem. Since it is no longer
> > necessary, drop status register mapping as part of the change, and specify
> > status registers directly.
> >
> > Cc: Alex Qiu <xqiu@google.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Alex Qiu <xqiu@google.com>
> Tested-by: Alex Qiu <xqiu@google.com>
> > ---
> >  drivers/hwmon/pmbus/pmbus_core.c | 206 +++++++++++++------------------
> >  1 file changed, 89 insertions(+), 117 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 44535add3a4a..9ab6a8ac5b40 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -16,7 +16,6 @@
> >  #include <linux/i2c.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/hwmon-sysfs.h>
> > -#include <linux/jiffies.h>
> >  #include <linux/pmbus.h>
> >  #include <linux/regulator/driver.h>
> >  #include <linux/regulator/machine.h>
> > @@ -27,21 +26,6 @@
> >   * with each call to krealloc
> >   */
> >  #define PMBUS_ATTR_ALLOC_SIZE  32
> > -
> > -/*
> > - * Index into status register array, per status register group
> > - */
> > -#define PB_STATUS_BASE         0
> > -#define PB_STATUS_VOUT_BASE    (PB_STATUS_BASE + PMBUS_PAGES)
> > -#define PB_STATUS_IOUT_BASE    (PB_STATUS_VOUT_BASE + PMBUS_PAGES)
> > -#define PB_STATUS_FAN_BASE     (PB_STATUS_IOUT_BASE + PMBUS_PAGES)
> > -#define PB_STATUS_FAN34_BASE   (PB_STATUS_FAN_BASE + PMBUS_PAGES)
> > -#define PB_STATUS_TEMP_BASE    (PB_STATUS_FAN34_BASE + PMBUS_PAGES)
> > -#define PB_STATUS_INPUT_BASE   (PB_STATUS_TEMP_BASE + PMBUS_PAGES)
> > -#define PB_STATUS_VMON_BASE    (PB_STATUS_INPUT_BASE + 1)
> > -
> > -#define PB_NUM_STATUS_REG      (PB_STATUS_VMON_BASE + 1)
> > -
> >  #define PMBUS_NAME_SIZE                24
> >
> >  struct pmbus_sensor {
> > @@ -77,6 +61,21 @@ struct pmbus_label {
> >  #define to_pmbus_label(_attr) \
> >         container_of(_attr, struct pmbus_label, attribute)
> >
> > +/* Macros for converting between sensor index and register/page/status mask */
> > +
> > +#define PB_STATUS_MASK 0xffff
> > +#define PB_REG_SHIFT   16
> > +#define PB_REG_MASK    0x3ff
> > +#define PB_PAGE_SHIFT  26
> > +#define PB_PAGE_MASK   0x3f
> > +
> > +#define pb_reg_to_index(page, reg, mask)       (((page) << PB_PAGE_SHIFT) | \
> > +                                                ((reg) << PB_REG_SHIFT) | (mask))
> > +
> > +#define pb_index_to_page(index)                        (((index) >> PB_PAGE_SHIFT) & PB_PAGE_MASK)
> > +#define pb_index_to_reg(index)                 (((index) >> PB_REG_SHIFT) & PB_REG_MASK)
> > +#define pb_index_to_mask(index)                        ((index) & PB_STATUS_MASK)
> > +
> >  struct pmbus_data {
> >         struct device *dev;
> >         struct device *hwmon_dev;
> > @@ -97,14 +96,6 @@ struct pmbus_data {
> >         struct pmbus_sensor *sensors;
> >
> >         struct mutex update_lock;
> > -       bool valid;
> > -       unsigned long last_updated;     /* in jiffies */
> > -
> > -       /*
> > -        * A single status register covers multiple attributes,
> > -        * so we keep them all together.
> > -        */
> > -       u16 status[PB_NUM_STATUS_REG];
> >
> >         bool has_status_word;           /* device uses STATUS_WORD register */
> >         int (*read_status)(struct i2c_client *client, int page);
> > @@ -143,8 +134,10 @@ static const int pmbus_fan_command_registers[] = {
> >  void pmbus_clear_cache(struct i2c_client *client)
> >  {
> >         struct pmbus_data *data = i2c_get_clientdata(client);
> > +       struct pmbus_sensor *sensor;
> >
> > -       data->valid = false;
> > +       for (sensor = data->sensors; sensor; sensor = sensor->next)
> > +               sensor->data = -ENODATA;
> >  }
> >  EXPORT_SYMBOL_GPL(pmbus_clear_cache);
> >
> > @@ -560,68 +553,29 @@ const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
> >  }
> >  EXPORT_SYMBOL_GPL(pmbus_get_driver_info);
> >
> > -static struct _pmbus_status {
> > -       u32 func;
> > -       u16 base;
> > -       u16 reg;
> > -} pmbus_status[] = {
> > -       { PMBUS_HAVE_STATUS_VOUT, PB_STATUS_VOUT_BASE, PMBUS_STATUS_VOUT },
> > -       { PMBUS_HAVE_STATUS_IOUT, PB_STATUS_IOUT_BASE, PMBUS_STATUS_IOUT },
> > -       { PMBUS_HAVE_STATUS_TEMP, PB_STATUS_TEMP_BASE,
> > -         PMBUS_STATUS_TEMPERATURE },
> > -       { PMBUS_HAVE_STATUS_FAN12, PB_STATUS_FAN_BASE, PMBUS_STATUS_FAN_12 },
> > -       { PMBUS_HAVE_STATUS_FAN34, PB_STATUS_FAN34_BASE, PMBUS_STATUS_FAN_34 },
> > -};
> > -
> > -static struct pmbus_data *pmbus_update_device(struct device *dev)
> > +static int pmbus_get_status(struct i2c_client *client, int page, int reg)
> >  {
> > -       struct i2c_client *client = to_i2c_client(dev->parent);
> >         struct pmbus_data *data = i2c_get_clientdata(client);
> > -       const struct pmbus_driver_info *info = data->info;
> > -       struct pmbus_sensor *sensor;
> > -
> > -       mutex_lock(&data->update_lock);
> > -       if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> > -               int i, j;
> > -
> > -               for (i = 0; i < info->pages; i++) {
> > -                       data->status[PB_STATUS_BASE + i]
> > -                           = data->read_status(client, i);
> > -                       for (j = 0; j < ARRAY_SIZE(pmbus_status); j++) {
> > -                               struct _pmbus_status *s = &pmbus_status[j];
> > -
> > -                               if (!(info->func[i] & s->func))
> > -                                       continue;
> > -                               data->status[s->base + i]
> > -                                       = _pmbus_read_byte_data(client, i,
> > -                                                               s->reg);
> > -                       }
> > -               }
> > +       int status;
> >
> > -               if (info->func[0] & PMBUS_HAVE_STATUS_INPUT)
> > -                       data->status[PB_STATUS_INPUT_BASE]
> > -                         = _pmbus_read_byte_data(client, 0,
> > -                                                 PMBUS_STATUS_INPUT);
> > -
> > -               if (info->func[0] & PMBUS_HAVE_STATUS_VMON)
> > -                       data->status[PB_STATUS_VMON_BASE]
> > -                         = _pmbus_read_byte_data(client, 0,
> > -                                                 PMBUS_VIRT_STATUS_VMON);
> > -
> > -               for (sensor = data->sensors; sensor; sensor = sensor->next) {
> > -                       if (!data->valid || sensor->update)
> > -                               sensor->data
> > -                                   = _pmbus_read_word_data(client,
> > -                                                           sensor->page,
> > -                                                           sensor->phase,
> > -                                                           sensor->reg);
> > -               }
> > -               pmbus_clear_faults(client);
> > -               data->last_updated = jiffies;
> > -               data->valid = 1;
> > +       switch (reg) {
> > +       case PMBUS_STATUS_WORD:
> > +               status = data->read_status(client, page);
> > +               break;
> > +       default:
> > +               status = _pmbus_read_byte_data(client, page, reg);
> > +               break;
> >         }
> > -       mutex_unlock(&data->update_lock);
> > -       return data;
> > +       if (status < 0)
> > +               pmbus_clear_faults(client);
> > +       return status;
> > +}
> > +
> > +static void pmbus_update_sensor_data(struct i2c_client *client, struct pmbus_sensor *sensor)
> > +{
> > +       if (sensor->data < 0 || sensor->update)
> > +               sensor->data = _pmbus_read_word_data(client, sensor->page,
> > +                                                    sensor->phase, sensor->reg);
> >  }
> >
> >  /*
> > @@ -919,38 +873,53 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
> >   * If a negative value is stored in any of the referenced registers, this value
> >   * reflects an error code which will be returned.
> >   */
> > -static int pmbus_get_boolean(struct pmbus_data *data, struct pmbus_boolean *b,
> > +static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
> >                              int index)
> >  {
> > +       struct pmbus_data *data = i2c_get_clientdata(client);
> >         struct pmbus_sensor *s1 = b->s1;
> >         struct pmbus_sensor *s2 = b->s2;
> > -       u16 reg = (index >> 16) & 0xffff;
> > -       u16 mask = index & 0xffff;
> > +       u16 mask = pb_index_to_mask(index);
> > +       u8 page = pb_index_to_page(index);
> > +       u16 reg = pb_index_to_reg(index);
> >         int ret, status;
> >         u16 regval;
> >
> > -       status = data->status[reg];
> > -       if (status < 0)
> > -               return status;
> > +       mutex_lock(&data->update_lock);
> > +       status = pmbus_get_status(client, page, reg);
> > +       if (status < 0) {
> > +               ret = status;
> > +               goto unlock;
> > +       }
> > +
> > +       if (s1)
> > +               pmbus_update_sensor_data(client, s1);
> > +       if (s2)
> > +               pmbus_update_sensor_data(client, s2);
> >
> >         regval = status & mask;
> >         if (!s1 && !s2) {
> >                 ret = !!regval;
> >         } else if (!s1 || !s2) {
> >                 WARN(1, "Bad boolean descriptor %p: s1=%p, s2=%p\n", b, s1, s2);
> > -               return 0;
> >         } else {
> >                 s64 v1, v2;
> >
> > -               if (s1->data < 0)
> > -                       return s1->data;
> > -               if (s2->data < 0)
> > -                       return s2->data;
> > +               if (s1->data < 0) {
> > +                       ret = s1->data;
> > +                       goto unlock;
> > +               }
> > +               if (s2->data < 0) {
> > +                       ret = s2->data;
> > +                       goto unlock;
> > +               }
> >
> >                 v1 = pmbus_reg2data(data, s1);
> >                 v2 = pmbus_reg2data(data, s2);
> >                 ret = !!(regval && v1 >= v2);
> >         }
> > +unlock:
> > +       mutex_unlock(&data->update_lock);
> >         return ret;
> >  }
> >
> > @@ -959,10 +928,10 @@ static ssize_t pmbus_show_boolean(struct device *dev,
> >  {
> >         struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> >         struct pmbus_boolean *boolean = to_pmbus_boolean(attr);
> > -       struct pmbus_data *data = pmbus_update_device(dev);
> > +       struct i2c_client *client = to_i2c_client(dev->parent);
> >         int val;
> >
> > -       val = pmbus_get_boolean(data, boolean, attr->index);
> > +       val = pmbus_get_boolean(client, boolean, attr->index);
> >         if (val < 0)
> >                 return val;
> >         return snprintf(buf, PAGE_SIZE, "%d\n", val);
> > @@ -971,9 +940,11 @@ static ssize_t pmbus_show_boolean(struct device *dev,
> >  static ssize_t pmbus_show_sensor(struct device *dev,
> >                                  struct device_attribute *devattr, char *buf)
> >  {
> > -       struct pmbus_data *data = pmbus_update_device(dev);
> > +       struct i2c_client *client = to_i2c_client(dev->parent);
> >         struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
> > +       struct pmbus_data *data = i2c_get_clientdata(client);
> >
> > +       pmbus_update_sensor_data(client, sensor);
> >         if (sensor->data < 0)
> >                 return sensor->data;
> >
> > @@ -1068,7 +1039,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
> >                              const char *name, const char *type, int seq,
> >                              struct pmbus_sensor *s1,
> >                              struct pmbus_sensor *s2,
> > -                            u16 reg, u16 mask)
> > +                            u8 page, u16 reg, u16 mask)
> >  {
> >         struct pmbus_boolean *boolean;
> >         struct sensor_device_attribute *a;
> > @@ -1084,7 +1055,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
> >         boolean->s1 = s1;
> >         boolean->s2 = s2;
> >         pmbus_attr_init(a, boolean->name, 0444, pmbus_show_boolean, NULL,
> > -                       (reg << 16) | mask);
> > +                       pb_reg_to_index(page, reg, mask));
> >
> >         return pmbus_add_attribute(data, &a->dev_attr.attr);
> >  }
> > @@ -1121,6 +1092,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
> >         sensor->class = class;
> >         sensor->update = update;
> >         sensor->convert = convert;
> > +       sensor->data = -ENODATA;
> >         pmbus_dev_attr_init(a, sensor->name,
> >                             readonly ? 0444 : 0644,
> >                             pmbus_show_sensor, pmbus_set_sensor);
> > @@ -1201,7 +1173,7 @@ struct pmbus_sensor_attr {
> >         bool compare;                   /* true if compare function needed */
> >         u32 func;                       /* sensor mask */
> >         u32 sfunc;                      /* sensor status mask */
> > -       int sbase;                      /* status base register */
> > +       int sreg;                       /* status register */
> >         const struct pmbus_limit_attr *limit;/* limit registers */
> >  };
> >
> > @@ -1239,7 +1211,7 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
> >                                                       : NULL,
> >                                         attr->compare ? l->low ? base : curr
> >                                                       : NULL,
> > -                                       attr->sbase + page, l->sbit);
> > +                                       page, attr->sreg, l->sbit);
> >                                 if (ret)
> >                                         return ret;
> >                                 have_alarm = 1;
> > @@ -1289,7 +1261,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
> >                     pmbus_check_status_register(client, page)) {
> >                         ret = pmbus_add_boolean(data, name, "alarm", index,
> >                                                 NULL, NULL,
> > -                                               PB_STATUS_BASE + page,
> > +                                               page, PMBUS_STATUS_WORD,
> >                                                 attr->gbit);
> >                         if (ret)
> >                                 return ret;
> > @@ -1477,7 +1449,7 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
> >                 .label = "vin",
> >                 .func = PMBUS_HAVE_VIN,
> >                 .sfunc = PMBUS_HAVE_STATUS_INPUT,
> > -               .sbase = PB_STATUS_INPUT_BASE,
> > +               .sreg = PMBUS_STATUS_INPUT,
> >                 .gbit = PB_STATUS_VIN_UV,
> >                 .limit = vin_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(vin_limit_attrs),
> > @@ -1487,7 +1459,7 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
> >                 .label = "vmon",
> >                 .func = PMBUS_HAVE_VMON,
> >                 .sfunc = PMBUS_HAVE_STATUS_VMON,
> > -               .sbase = PB_STATUS_VMON_BASE,
> > +               .sreg = PMBUS_VIRT_STATUS_VMON,
> >                 .limit = vmon_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(vmon_limit_attrs),
> >         }, {
> > @@ -1502,7 +1474,7 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
> >                 .paged = true,
> >                 .func = PMBUS_HAVE_VOUT,
> >                 .sfunc = PMBUS_HAVE_STATUS_VOUT,
> > -               .sbase = PB_STATUS_VOUT_BASE,
> > +               .sreg = PMBUS_STATUS_VOUT,
> >                 .gbit = PB_STATUS_VOUT_OV,
> >                 .limit = vout_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(vout_limit_attrs),
> > @@ -1581,7 +1553,7 @@ static const struct pmbus_sensor_attr current_attributes[] = {
> >                 .label = "iin",
> >                 .func = PMBUS_HAVE_IIN,
> >                 .sfunc = PMBUS_HAVE_STATUS_INPUT,
> > -               .sbase = PB_STATUS_INPUT_BASE,
> > +               .sreg = PMBUS_STATUS_INPUT,
> >                 .gbit = PB_STATUS_INPUT,
> >                 .limit = iin_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(iin_limit_attrs),
> > @@ -1592,7 +1564,7 @@ static const struct pmbus_sensor_attr current_attributes[] = {
> >                 .paged = true,
> >                 .func = PMBUS_HAVE_IOUT,
> >                 .sfunc = PMBUS_HAVE_STATUS_IOUT,
> > -               .sbase = PB_STATUS_IOUT_BASE,
> > +               .sreg = PMBUS_STATUS_IOUT,
> >                 .gbit = PB_STATUS_IOUT_OC,
> >                 .limit = iout_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(iout_limit_attrs),
> > @@ -1666,7 +1638,7 @@ static const struct pmbus_sensor_attr power_attributes[] = {
> >                 .label = "pin",
> >                 .func = PMBUS_HAVE_PIN,
> >                 .sfunc = PMBUS_HAVE_STATUS_INPUT,
> > -               .sbase = PB_STATUS_INPUT_BASE,
> > +               .sreg = PMBUS_STATUS_INPUT,
> >                 .gbit = PB_STATUS_INPUT,
> >                 .limit = pin_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(pin_limit_attrs),
> > @@ -1677,7 +1649,7 @@ static const struct pmbus_sensor_attr power_attributes[] = {
> >                 .paged = true,
> >                 .func = PMBUS_HAVE_POUT,
> >                 .sfunc = PMBUS_HAVE_STATUS_IOUT,
> > -               .sbase = PB_STATUS_IOUT_BASE,
> > +               .sreg = PMBUS_STATUS_IOUT,
> >                 .limit = pout_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(pout_limit_attrs),
> >         }
> > @@ -1796,7 +1768,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
> >                 .compare = true,
> >                 .func = PMBUS_HAVE_TEMP,
> >                 .sfunc = PMBUS_HAVE_STATUS_TEMP,
> > -               .sbase = PB_STATUS_TEMP_BASE,
> > +               .sreg = PMBUS_STATUS_TEMPERATURE,
> >                 .gbit = PB_STATUS_TEMPERATURE,
> >                 .limit = temp_limit_attrs,
> >                 .nlimit = ARRAY_SIZE(temp_limit_attrs),
> > @@ -1808,7 +1780,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
> >                 .compare = true,
> >                 .func = PMBUS_HAVE_TEMP2,
> >                 .sfunc = PMBUS_HAVE_STATUS_TEMP,
> > -               .sbase = PB_STATUS_TEMP_BASE,
> > +               .sreg = PMBUS_STATUS_TEMPERATURE,
> >                 .gbit = PB_STATUS_TEMPERATURE,
> >                 .limit = temp_limit_attrs2,
> >                 .nlimit = ARRAY_SIZE(temp_limit_attrs2),
> > @@ -1820,7 +1792,7 @@ static const struct pmbus_sensor_attr temp_attributes[] = {
> >                 .compare = true,
> >                 .func = PMBUS_HAVE_TEMP3,
> >                 .sfunc = PMBUS_HAVE_STATUS_TEMP,
> > -               .sbase = PB_STATUS_TEMP_BASE,
> > +               .sreg = PMBUS_STATUS_TEMPERATURE,
> >                 .gbit = PB_STATUS_TEMPERATURE,
> >                 .limit = temp_limit_attrs3,
> >                 .nlimit = ARRAY_SIZE(temp_limit_attrs3),
> > @@ -1945,19 +1917,19 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
> >                         if ((info->func[page] & pmbus_fan_status_flags[f]) &&
> >                             pmbus_check_byte_register(client,
> >                                         page, pmbus_fan_status_registers[f])) {
> > -                               int base;
> > +                               int reg;
> >
> >                                 if (f > 1)      /* fan 3, 4 */
> > -                                       base = PB_STATUS_FAN34_BASE + page;
> > +                                       reg = PMBUS_STATUS_FAN_34;
> >                                 else
> > -                                       base = PB_STATUS_FAN_BASE + page;
> > +                                       reg = PMBUS_STATUS_FAN_12;
> >                                 ret = pmbus_add_boolean(data, "fan",
> > -                                       "alarm", index, NULL, NULL, base,
> > +                                       "alarm", index, NULL, NULL, page, reg,
> >                                         PB_FAN_FAN1_WARNING >> (f & 1));
> >                                 if (ret)
> >                                         return ret;
> >                                 ret = pmbus_add_boolean(data, "fan",
> > -                                       "fault", index, NULL, NULL, base,
> > +                                       "fault", index, NULL, NULL, page, reg,
> >                                         PB_FAN_FAN1_FAULT >> (f & 1));
> >                                 if (ret)
> >                                         return ret;
> > --
> > 2.17.1
> >
