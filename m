Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B095525E929
	for <lists+linux-hwmon@lfdr.de>; Sat,  5 Sep 2020 18:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgIEQ6m (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 5 Sep 2020 12:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbgIEQ6k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Sep 2020 12:58:40 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1796C061244
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2020 09:58:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so2545493plk.10
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2020 09:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sT9bIeQU2WnV9HFrzglRDbd+8HeJRGz0JlJNpnylWoo=;
        b=ufsLgOLtCnENs150IMWgzxWZvkxS/+Dqt/VcKBSNvlp/AOZqY/wLsJbevSTRW4wKr/
         88XV4G8vZbnLcJCD3WoqjXlzUhMtXnePfWEQq4kvJQkFyEfKwQYBsCOyQZJcLF9BbQYQ
         7/8RwREGrXgEciitwXEYosFRq37YOjoexuB9cNbFVNp52/x8GcfijFN/yZx/xd3M7nAX
         Kih9gcY4LTwTxtDSUThpE/MkcvlmHKd+GFtJ6KHYUtm5gRt3YQZ9b8XnATYQkNlfZXdN
         s+Z53joq5VoeBkxiX4kHY38CNy7+BhiDYqrnXiuTuejR8cUvr3JvJCKq5pMuWtK84fsW
         XB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=sT9bIeQU2WnV9HFrzglRDbd+8HeJRGz0JlJNpnylWoo=;
        b=oEWyxVvkdce7zVhc6RhrzORCIc9O+TN0TE/wWqD2ZTD6+y60DdBB66uEl69qJttGdL
         2BGJcDD/l6ek7ZrRrgqSXq8YRpItln4uxTkLLFCUwLEtjxmXlFZjJouUjKNk6o9TudQV
         xuABThKwvHv+ELoyaR0Mc+uw2oRMMtGsM7FcS+vR+fw7aigE/6S4wB6JJyUKefhYoee2
         XkVsMv3o43l5FWZd6An613pbU2kD4aOgs4l2IodRmyQyVkYk4tnU25K4AnBGo+O3hN+H
         UQkBNOlg3vevVRnrkO+iZt44+LKQTFaZj+lfGreX+RwijwrQ7Sx2ybxgk6G/kQfsUg3I
         ZeWg==
X-Gm-Message-State: AOAM531iRMMvm+elvtv4a6T52oD06+WbV9wKF7f/+wX0p8oMmk462gRc
        w0AayL8r7SlwjIPMBhGx/AajKgA1qxI=
X-Google-Smtp-Source: ABdhPJwGxXcvObGpe8zNOok4iqS9Eeupq5Hn49fm/hKq2Vn79n4krPC2zH/oWomRT/0wzpiSjfMaXw==
X-Received: by 2002:a17:90b:3cb:: with SMTP id go11mr12142083pjb.152.1599325119170;
        Sat, 05 Sep 2020 09:58:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s6sm8166941pjn.48.2020.09.05.09.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 09:58:38 -0700 (PDT)
Subject: Re: FW: [PATCH 5/6] hwmon: amd_energy: dump energy counters via
 debugfs
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>,
        linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <groeck7@gmail.com>
References: <20200905143230.195049-1-nchatrad@amd.com>
 <20200905143230.195049-6-nchatrad@amd.com>
 <1c48945d-09d7-8154-d678-2c6201c928d9@roeck-us.net>
 <DM6PR12MB4388C77E35BD61F4DC2EAEC9E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAHfPSqBSctZtG7KQCRdRmO0HbFXF-UZVZZqcxM_SehrqU2EZ9w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <fed67fcd-f148-e84d-eb73-a265e179941d@roeck-us.net>
Date:   Sat, 5 Sep 2020 09:58:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHfPSqBSctZtG7KQCRdRmO0HbFXF-UZVZZqcxM_SehrqU2EZ9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/5/20 9:41 AM, Naveen Krishna Ch wrote:
> Hi Guenter,
> 
>> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
>>> Use seq_printf to capture the core and socket energies under debugfs
>>> path in '/sys/kernel/debug/amd_energy/'
>>> file cenergy_dump: To print out the core energy counters file
>>> senergy_dump: To print out the socket energy counters
>>>
>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>
>> Isn't this a duplicate of other functionality available in the kernel ?
>> I'd have to look it up, but I am quite sure that energy values are already available. Besides that, what is the point of duplicating the hwmon attributes ?
> 
> Idea is to reduce the latency in gathering all the counters (Rome has
> 128 cores on 2 sockets) from the user space.
> If there is a better way to get this done, please let me know. I shall
> implement and resubmit.
> 

Isn't turbostat supposed to be able to do that ?

Guenter

>>
>> Guenter
>>
>>> ---
>>>  drivers/hwmon/amd_energy.c | 110
>>> +++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 110 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
>>> index c294bea56c02..2184bd4510ed 100644
>>> --- a/drivers/hwmon/amd_energy.c
>>> +++ b/drivers/hwmon/amd_energy.c
>>> @@ -8,6 +8,7 @@
>>>  #include <linux/bits.h>
>>>  #include <linux/cpu.h>
>>>  #include <linux/cpumask.h>
>>> +#include <linux/debugfs.h>
>>>  #include <linux/delay.h>
>>>  #include <linux/device.h>
>>>  #include <linux/hwmon.h>
>>> @@ -20,6 +21,7 @@
>>>  #include <linux/platform_device.h>
>>>  #include <linux/sched.h>
>>>  #include <linux/slab.h>
>>> +#include <linux/smp.h>
>>>  #include <linux/topology.h>
>>>  #include <linux/types.h>
>>>
>>> @@ -57,6 +59,8 @@ struct amd_energy_data {
>>>       int nr_socks;
>>>       int core_id;
>>>       char (*label)[10];
>>> +     u64 *cdump;
>>> +     u64 *sdump;
>>>  };
>>>
>>>  static int amd_energy_read_labels(struct device *dev, @@ -329,6
>>> +333,108 @@ static int create_accumulate_status_file(struct amd_energy_data *data)
>>>                                &accumulate_attr.attr);  }
>>>
>>> +#ifdef CONFIG_DEBUG_FS
>>> +static void dump_on_each_cpu(void *info) {
>>> +     struct amd_energy_data *data = info;
>>> +     int cpu = smp_processor_id();
>>> +
>>> +     amd_add_delta(data, cpu, cpu, (long *)&data->cdump[cpu],
>>> +                   ENERGY_CORE_MSR);
>>> +}
>>> +
>>> +static int cenergy_dump_show(struct seq_file *s, void *unused) {
>>> +     struct amd_energy_data *data = s->private;
>>> +     struct cpumask *cpus_mask;
>>> +     int i;
>>> +
>>> +     cpus_mask = kmalloc(sizeof(*cpus_mask), GFP_KERNEL);
>>> +     memset(data->cdump, 0, (data->nr_cpus) * sizeof(u64));
>>> +     cpumask_clear(cpus_mask);
>>> +     for (i = 0; i < data->nr_cpus; i++) {
>>> +             if (cpu_online(i))
>>> +                     cpumask_set_cpu(i, cpus_mask);
>>> +     }
>>> +
>>> +     on_each_cpu_mask(cpus_mask, dump_on_each_cpu, data, true);
>>> +
>>> +     for (i = 0; i < data->nr_cpus; i++) {
>>> +             if (!(i & 3))
>>> +                     seq_printf(s, "Core %3d: ", i);
>>> +
>>> +             seq_printf(s, "%16llu ", data->cdump[i]);
>>> +             if ((i & 3) == 3)
>>> +                     seq_puts(s, "\n");
>>> +     }
>>> +     seq_puts(s, "\n");
>>> +
>>> +     kfree(cpus_mask);
>>> +     return 0;
>>> +}
>>> +DEFINE_SHOW_ATTRIBUTE(cenergy_dump);
>>> +
>>> +static int senergy_dump_show(struct seq_file *s, void *unused) {
>>> +     struct amd_energy_data *data = s->private;
>>> +     int i, cpu;
>>> +
>>> +     for (i = 0; i < data->nr_socks; i++) {
>>> +             cpu = cpumask_first_and(cpu_online_mask,
>>> +                                     cpumask_of_node(i));
>>> +             amd_add_delta(data, data->nr_cpus + i, cpu,
>>> +                           (long *)&data->sdump[i], ENERGY_PKG_MSR);
>>> +             seq_printf(s, "Socket %1d: %16llu\n",
>>> +                        i, data->sdump[i]);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +DEFINE_SHOW_ATTRIBUTE(senergy_dump);
>>> +
>>> +static void dump_debugfs_cleanup(void *ddir) {
>>> +     debugfs_remove_recursive(ddir);
>>> +}
>>> +
>>> +static int create_dump_file(struct device *dev,
>>> +                         struct amd_energy_data *data) {
>>> +     struct dentry *debugfs;
>>> +     char name[] = "amd_energy";
>>> +
>>> +     data->cdump = devm_kcalloc(dev, data->nr_cpus,
>>> +                                sizeof(u64), GFP_KERNEL);
>>> +     if (!data->cdump)
>>> +             return -ENOMEM;
>>> +
>>> +     data->sdump = devm_kcalloc(dev, data->nr_socks,
>>> +                                sizeof(u64), GFP_KERNEL);
>>> +     if (!data->sdump)
>>> +             return -ENOMEM;
>>> +
>>> +     debugfs = debugfs_create_dir(name, NULL);
>>> +     if (debugfs) {
>>> +             debugfs_create_file("cenergy_dump", 0440,
>>> +                                 debugfs, data, &cenergy_dump_fops);
>>> +             debugfs_create_file("senergy_dump", 0440,
>>> +                                 debugfs, data, &senergy_dump_fops);
>>> +             devm_add_action_or_reset(data->hwmon_dev,
>>> +                                      dump_debugfs_cleanup, debugfs);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +#else
>>> +
>>> +static int create_dump_file(struct device *dev,
>>> +                         struct amd_energy_data *data) {
>>> +     return 0;
>>> +}
>>> +
>>> +#endif //CONFIG_DEBUG_FS
>>> +
>>>  static int amd_energy_probe(struct platform_device *pdev)  {
>>>       struct amd_energy_data *data;
>>> @@ -376,6 +482,10 @@ static int amd_energy_probe(struct platform_device *pdev)
>>>       if (ret)
>>>               return ret;
>>>
>>> +     ret = create_dump_file(dev, data);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>>       return 0;
>>>  }
>>>
>>>
> Naveen
> 

