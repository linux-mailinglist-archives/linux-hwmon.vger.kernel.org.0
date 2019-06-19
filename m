Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51B04B5BF
	for <lists+linux-hwmon@lfdr.de>; Wed, 19 Jun 2019 12:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731374AbfFSKAu (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 19 Jun 2019 06:00:50 -0400
Received: from smtp.radiodata.biz ([116.203.112.52]:47767 "EHLO
        smtp.radiodata.biz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbfFSKAu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jun 2019 06:00:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp.radiodata.biz (Postfix) with ESMTP id 96B793E8E7;
        Wed, 19 Jun 2019 12:00:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp.radiodata.biz
Received: from smtp.radiodata.biz ([116.203.112.52])
        by localhost (smtp.radiodata.biz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id G17RJrzq_jbV; Wed, 19 Jun 2019 12:00:39 +0200 (CEST)
Received: from mail.radiodata.biz (p578044f8.dip0.t-ipconnect.de [87.128.68.248])
        by smtp.radiodata.biz (Postfix) with ESMTPSA id C43003E8E6;
        Wed, 19 Jun 2019 12:00:39 +0200 (CEST)
Received: from [192.168.2.213] (raphael-WINPC.radiodata.xx [192.168.2.213])
        by mail.radiodata.biz (Postfix) with ESMTPSA id 7F2132023C;
        Wed, 19 Jun 2019 12:00:39 +0200 (CEST)
Subject: Re: [PATCH] Fix sysfs_notify and kobject_uevent in fan_alarm_notify
From:   Christian Schneider <cschneider@radiodata.biz>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Christian Schneider <christian@ch-sc.de>
References: <20190617093343.1366-1-cschneider@radiodata.biz>
 <20190617170422.GA13276@roeck-us.net>
 <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
Message-ID: <dfa89854-8784-6d7a-9abe-06914791de32@radiodata.biz>
Date:   Wed, 19 Jun 2019 12:00:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <e64607f6-d2d3-44a9-4e4b-90e5ab2d74ab@radiodata.biz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Ok, seems that moving that block, where fan_alarm_init is called down, 
isn't a problem on master.
I need to use 4.9, cause we have an embedded device that needs patches, 
and they are only available for older kernels.

In 4.9, fan_alarm_init() does fan_data->alarm = alarm;
When fan_alarm_init() is called after 
devm_hwmon_device_register_with_groups(), then fan_data->alarm is not 
yet set, so the sysfs attribute is not created.

when I move the fan_data->alarm = alarm; out of fan_alarm_init() before 
devm_hwmon_device_register_with_groups() and the fan_alarm_init() after, 
then it works, and doesn't have a race condition.

On master, populating fan_data->alarm_gpio is done in 
gpio_fan_get_of_data(fan_data); as far as I understand, so moving the 
fan_alarm_init() block further down shouldn't be a problem.

I don't know, how I can test this with master kernel. Unfortunately, the 
device, I'm using doesn't have a recent kernel. And on my normal 
(desktop) pc, I don't have a gpio fan.
How should I proceed now?


BR, Christian

Am 19.06.2019 um 09:47 schrieb Christian Schneider:
> Hi,
> unfrotunately I found a problem with my patch. It didn't appear on the 
> devices, where I tested, only when distributing the patch to more 
> devices, it occurs sometimes.
> 
> There is a possible race condition. In gpio_fan_probe, the IRQ handler 
> for the fan alarm is registered before the hwmon_dev is initialised.
> So it is possible, that the handler executes, while fandata->hwmon_dev 
> is still unitialised and the handler runs in an invalid pointer 
> dereference.
> 
> The obvious fix, moving the
> /* Configure alarm GPIO if available. */
> if (fan_data->alarm_gpio) {
>      err = fan_alarm_init(fan_data);
>      if (err)
>          return err;
> }
> block after
> 
> /* Make this driver part of hwmon class. */
> fan_data->hwmon_dev =
>      devm_hwmon_device_register_with_groups(dev,
>                             "gpio_fan", fan_data,
>                             gpio_fan_groups);
> 
> doesn't work. Sysfs doesn't have a fan1_alarm attribute anymore then.
> 
> It is not yet clear to me, why creation of the attribute fails in this 
> case. I need to investigate further.
> In the meanwhile, please revert my patch.
> 
> I'm sorry for the disturbance I created....
> 
> BR, Christian
> 
> 
> Am 17.06.2019 um 18:04 schrieb Guenter Roeck:
>> On Mon, Jun 17, 2019 at 11:33:43AM +0200, cschneider@radiodata.biz wrote:
>>> From: Christian Schneider <christian@ch-sc.de>
>>>
>>> sysfs_notify and kobject_uevent are passed the wrong kobject.
>>> that why notifications can't be received and uevents have the wrong 
>>> path.
>>> this patch fixes this.
>>>
>>> Signed-off-by: Christian Schneider <cschneider@radiodata.biz>
>>
>> Applied.
>>
>> In the future, please version your patches, add a change log,
>> and reflect the subsystem and driver in the subject line.
>>
>> Thanks,
>> Guenter
>>
>>> ---
>>>   drivers/hwmon/gpio-fan.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
>>> index 84753680a4e8..76377791ff0e 100644
>>> --- a/drivers/hwmon/gpio-fan.c
>>> +++ b/drivers/hwmon/gpio-fan.c
>>> @@ -54,8 +54,8 @@ static void fan_alarm_notify(struct work_struct *ws)
>>>       struct gpio_fan_data *fan_data =
>>>           container_of(ws, struct gpio_fan_data, alarm_work);
>>> -    sysfs_notify(&fan_data->dev->kobj, NULL, "fan1_alarm");
>>> -    kobject_uevent(&fan_data->dev->kobj, KOBJ_CHANGE);
>>> +    sysfs_notify(&fan_data->hwmon_dev->kobj, NULL, "fan1_alarm");
>>> +    kobject_uevent(&fan_data->hwmon_dev->kobj, KOBJ_CHANGE);
>>>   }
>>>   static irqreturn_t fan_alarm_irq_handler(int irq, void *dev_id)
