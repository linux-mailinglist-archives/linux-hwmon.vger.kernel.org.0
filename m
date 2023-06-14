Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892577307E8
	for <lists+linux-hwmon@lfdr.de>; Wed, 14 Jun 2023 21:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbjFNTPe (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 14 Jun 2023 15:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjFNTPd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2023 15:15:33 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A365B1FD5;
        Wed, 14 Jun 2023 12:15:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b51488ad67so976475ad.3;
        Wed, 14 Jun 2023 12:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686770131; x=1689362131;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwVnnvAR61SVmA8K+L6k3JplE72FMZjpd+z4ZCDUOjw=;
        b=HModpr/YgZniSlk15X3u4sIoRNnKDj+VqOv7El31jTAA8JnjBgV07EpIScrrVgk0CI
         JTT5S1iT8MMz+wcYTTiaMJvFVxS5SyvTfry66rJNHNoOlDSK+gn6AIjuf/qjJPeJ5VOY
         pPYzzPXP53HgugeUag0KQX07BVEqphStHqkUXSrSuOajcRBv42NAUHoVdCFF9s0vFWf0
         ZFu0xv7jXTQR+OJ485gx4d9IH6XFSq8vyI0PDaKuPVAfLET8RN1JvvNvJuuDCyhYXd+s
         VR3yKnXBvC2CfctQSduGbJtkz7/CvB/cXV/kXmRtDbSqV81DX1dQJhgMZlNyLmC1Q8MG
         zQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686770131; x=1689362131;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwVnnvAR61SVmA8K+L6k3JplE72FMZjpd+z4ZCDUOjw=;
        b=KF4RVy6Ity0FYd6UpLb93zcn54vXtwKDAbYq8e9nV4zBJkvUD4RUyMiscHoge6+xpN
         VrUgwBhEV5STbAO90DiREKG+sku1fJdBUxMr6RMJt90wFShz4UX+U5sKSGITYQM2kO0B
         5/K925EybfEvPri+NHU4JiqcqWHz3xKMUmrabmwWftLbrRa90EBkUqSBjVzfpcUeZGUC
         h7uYqQs4ub0syTXghAwOVOQJVaVQE/AazSsVLhkPZca9AAUr+oYiQwrecyjOL+F21tfM
         smy+KC70HO7o/aK9Pk9JeQltoig2q0oT3N2Xw2jarO/gW/Itm12uHaunV6gpTf7bFNPw
         4uUQ==
X-Gm-Message-State: AC+VfDzJbuyxh2l3QVPT7dlRab6xA4WSPN46EsrLisOje4vgLI1eOgnx
        HFhUZrC+d5xaEIq1LAMGsSb8GrbUt3A=
X-Google-Smtp-Source: ACHHUZ60VnwAIhlmMF2So1US2hDoekRE3cE33WuG7oFAaSD06QhMSQdsttgHaVMX2NrP2ZpXxWVTfQ==
X-Received: by 2002:a17:902:ea0e:b0:1b0:3576:c2a9 with SMTP id s14-20020a170902ea0e00b001b03576c2a9mr13363294plg.33.1686770130848;
        Wed, 14 Jun 2023 12:15:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902d88c00b001ac40488620sm12560590plz.92.2023.06.14.12.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 12:15:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <45c8771d-47c1-c007-1cd5-97eebedef147@roeck-us.net>
Date:   Wed, 14 Jun 2023 12:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     JuenKit Yip <JuenKit_Yip@hotmail.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com
References: <DB4PR10MB6261D79FE16EC2BBD5316B91925AA@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
 <6d1209e9-0d40-c2ba-b94c-6590e98070d7@roeck-us.net>
 <DB4PR10MB626134E4213F378A430E5EED925AA@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/3] hwmon: (sht3x)remove sht3x_platform_data
In-Reply-To: <DB4PR10MB626134E4213F378A430E5EED925AA@DB4PR10MB6261.EURPRD10.PROD.OUTLOOK.COM>
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

On 6/14/23 08:02, JuenKit Yip wrote:
> 
> 在 2023/6/14 20:57, Guenter Roeck 写道:
>> On 6/13/23 23:24, JuenKit Yip wrote:
>>> Since no in-tree driver supports it, the sht3x_platform_data was
>>> removed.
>>>
>>> - "blocking_io" property and its related code have been removed, and
>>> Single-Shot mode should be blocking in default.
>>>
>>> - "high-precision" property has been replaced to "repeatability" for
>>> matching datasheet.
>>>
>>
>> That needs to be three patches.
> 
> Patch 1: remove sht3x_platform_data and its header file
> 
> Patch 2: move "blocking_io" to struct sht3x_data
> 
Essentially merge it with update_interval==0 since (if I understand
correctly) blocking mode and update_interval==0 will be equivalent.
With that in mind, a separate "blocking_io" variable should no
longer be needed.

> Patch 3: replace "high-precision" property to "repeatability"

precision -> reliability would apply to both high and low
precision. I think "low repeatability" is currently called
"low power mode", so you'll want to update that as well.
I also see "high accuracy" and "low accuracy" use in the
documentation, but I see you removed that already below.

> 
> Is it correct or I am misunderstand your statement?
> 

Yes, that is what I meant.

Thanks,
Guenter

> Thanks for your instruction
> 
>>
>>> Signed-off-by: JuenKit Yip <JuenKit_Yip@hotmail.com>
>>> ---
>>>   Documentation/hwmon/sht3x.rst       | 12 +++++------
>>>   drivers/hwmon/sht3x.c               | 32 ++++++++++++-----------------
>>>   include/linux/platform_data/sht3x.h | 15 --------------
>>>   3 files changed, 18 insertions(+), 41 deletions(-)
>>>   delete mode 100644 include/linux/platform_data/sht3x.h
>>>
>>> diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
>>> index 95a850d5b..2c87c8f58 100644
>>> --- a/Documentation/hwmon/sht3x.rst
>>> +++ b/Documentation/hwmon/sht3x.rst
>>> @@ -28,28 +28,26 @@ The device communicates with the I2C protocol. Sensors can have the I2C
>>>   addresses 0x44 or 0x45, depending on the wiring. See
>>>   Documentation/i2c/instantiating-devices.rst for methods to instantiate the device.
>>>   -There are two options configurable by means of sht3x_platform_data:
>>> +This driver supports block and non-block mode:
>>>   -1. blocking (pull the I2C clock line down while performing the measurement) or
>>> +   blocking (pull the I2C clock line down while performing the measurement) or
>>>      non-blocking mode. Blocking mode will guarantee the fastest result but
>>>      the I2C bus will be busy during that time. By default, non-blocking mode
>>>      is used. Make sure clock-stretching works properly on your device if you
>>>      want to use blocking mode.
>>> -2. high or low accuracy. High accuracy is used by default and using it is
>>> -   strongly recommended.
>>>     The sht3x sensor supports a single shot mode as well as 5 periodic measure
>>>   modes, which can be controlled with the update_interval sysfs interface.
>>>   The allowed update_interval in milliseconds are as follows:
>>>   -    ===== ======= ====================
>>> -       0          single shot mode
>>> +    ===== ======= ==========================
>>> +       0          single shot mode(blocking)
>>>       2000   0.5 Hz periodic measurement
>>>       1000   1   Hz periodic measurement
>>>        500   2   Hz periodic measurement
>>>        250   4   Hz periodic measurement
>>>        100  10   Hz periodic measurement
>>> -    ===== ======= ====================
>>> +    ===== ======= ==========================
>>>     In the periodic measure mode, the sensor automatically triggers a measurement
>>>   with the configured update interval on the chip. When a temperature or humidity
>>> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
>>> index 8305e44d9..5bc0001b1 100644
>>> --- a/drivers/hwmon/sht3x.c
>>> +++ b/drivers/hwmon/sht3x.c
>>> @@ -20,13 +20,12 @@
>>>   #include <linux/module.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/jiffies.h>
>>> -#include <linux/platform_data/sht3x.h>
>>>   -/* commands (high precision mode) */
>>> +/* commands (high repeatability mode) */
>>>   static const unsigned char sht3x_cmd_measure_blocking_hpm[] = { 0x2c, 0x06 };
>>>   static const unsigned char sht3x_cmd_measure_nonblocking_hpm[] = { 0x24, 0x00 };
>>>   -/* commands (low power mode) */
>>> +/* commands (low repeatability mode) */
>>>   static const unsigned char sht3x_cmd_measure_blocking_lpm[] = { 0x2c, 0x10 };
>>>   static const unsigned char sht3x_cmd_measure_nonblocking_lpm[] = { 0x24, 0x16 };
>>>   @@ -69,9 +68,14 @@ enum sht3x_limits {
>>>       limit_min_hyst,
>>>   };
>>>   +enum sht3x_repeatability {
>>> +    low_repeatability,
>>> +    high_repeatability,
>>> +};
>>> +
>>>   DECLARE_CRC8_TABLE(sht3x_crc8_table);
>>>   -/* periodic measure commands (high precision mode) */
>>> +/* periodic measure commands (high repeatability mode) */
>>>   static const char periodic_measure_commands_hpm[][SHT3X_CMD_LENGTH] = {
>>>       /* 0.5 measurements per second */
>>>       {0x20, 0x32},
>>> @@ -85,7 +89,7 @@ static const char periodic_measure_commands_hpm[][SHT3X_CMD_LENGTH] = {
>>>       {0x27, 0x37},
>>>   };
>>>   -/* periodic measure commands (low power mode) */
>>> +/* periodic measure commands (low repeatability mode) */
>>>   static const char periodic_measure_commands_lpm[][SHT3X_CMD_LENGTH] = {
>>>       /* 0.5 measurements per second */
>>>       {0x20, 0x2f},
>>> @@ -132,12 +136,11 @@ struct sht3x_data {
>>>       struct mutex data_lock; /* lock for updating driver data */
>>>         u8 mode;
>>> +    enum sht3x_repeatability repeatability;
>>>       const unsigned char *command;
>>>       u32 wait_time;            /* in us*/
>>>       unsigned long last_update;    /* last update in periodic mode*/
>>>   -    struct sht3x_platform_data setup;
>>> -
>>>       /*
>>>        * cached values for temperature and humidity and limits
>>>        * the limits arrays have the following order:
>>> @@ -441,13 +444,8 @@ static void sht3x_select_command(struct sht3x_data *data)
>>>       if (data->mode > 0) {
>>>           data->command = sht3x_cmd_measure_periodic_mode;
>>>           data->wait_time = 0;
>>> -    } else if (data->setup.blocking_io) {
>>> -        data->command = data->setup.high_precision ?
>>> -                sht3x_cmd_measure_blocking_hpm :
>>> -                sht3x_cmd_measure_blocking_lpm;
>>> -        data->wait_time = 0;
>>
>> If update_interval is 0, those would presumably still be needed.
>> I don't know if the current code updating the interval is wrong
>> (that may well be), but removing this code entirely seems wrong.
> 
> update_interval "0" means Single-Shot mode and respectively data->command
> 
> should be in blocking mode.
> 
> Thanks for your correctness.
> 
>>
>>>       } else {
>>> -        if (data->setup.high_precision) {
>>> +        if (data->repeatability == high_repeatability) {
>>>               data->command = sht3x_cmd_measure_nonblocking_hpm;
>>>               data->wait_time = SHT3X_NONBLOCKING_WAIT_TIME_HPM;
>>>           } else {
>>> @@ -595,7 +593,7 @@ static ssize_t update_interval_store(struct device *dev,
>>>       }
>>>         if (mode > 0) {
>>> -        if (data->setup.high_precision)
>>> +        if (data->repeatability == high_repeatability)
>>>               command = periodic_measure_commands_hpm[mode - 1];
>>>           else
>>>               command = periodic_measure_commands_lpm[mode - 1];
>>> @@ -690,16 +688,12 @@ static int sht3x_probe(struct i2c_client *client)
>>>       if (!data)
>>>           return -ENOMEM;
>>>   -    data->setup.blocking_io = false;
>>> -    data->setup.high_precision = true;
>>> +    data->repeatability = high_repeatability;
>>>       data->mode = 0;
>>>       data->last_update = jiffies - msecs_to_jiffies(3000);
>>>       data->client = client;
>>>       crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
>>>   -    if (client->dev.platform_data)
>>> -        data->setup = *(struct sht3x_platform_data *)dev->platform_data;
>>> -
>>>       sht3x_select_command(data);
>>>         mutex_init(&data->i2c_lock);
>>> diff --git a/include/linux/platform_data/sht3x.h b/include/linux/platform_data/sht3x.h
>>> deleted file mode 100644
>>> index 14680d2a9..000000000
>>> --- a/include/linux/platform_data/sht3x.h
>>> +++ /dev/null
>>> @@ -1,15 +0,0 @@
>>> -/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> -/*
>>> - * Copyright (C) 2016 Sensirion AG, Switzerland
>>> - * Author: David Frey <david.frey@sensirion.com>
>>> - * Author: Pascal Sachs <pascal.sachs@sensirion.com>
>>> - */
>>> -
>>> -#ifndef __SHT3X_H_
>>> -#define __SHT3X_H_
>>> -
>>> -struct sht3x_platform_data {
>>> -    bool blocking_io;
>>> -    bool high_precision;
>>> -};
>>> -#endif /* __SHT3X_H_ */
>>

