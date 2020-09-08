Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E24F2614BA
	for <lists+linux-hwmon@lfdr.de>; Tue,  8 Sep 2020 18:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbgIHQem (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 8 Sep 2020 12:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbgIHQeg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Sep 2020 12:34:36 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D41C061573
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2020 09:34:34 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id a65so15374840otc.8
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2020 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ouQc4le98vd4eMw9kKcpdAtvCk7tuIUdJKd4f5MCze0=;
        b=bt58v74m6RkSihJLGaMHoS0QhkkxYkXw3hw7QK1F7FU51Lca79UO9qbUR9WazO15NQ
         FroijxE9i74qLrZcUSG+dnmsJDsIhuDTiKmVIJnz+0SOvFdsGeZa4YHYiajjUeLsITBZ
         co/507HGe6FumaT0/dkv8Q9UFkDDAb6XrtI+CLeP0ZMZXfXD7jL3mr57XsHRHVL89Mvv
         /gGKh/MMgxa4x5rM5edOOUQxZrg79+A1eYdKaC6oGo1wf0jSwBb0ReuPiVnH6d8NvkZC
         xqt48qrvTfj5KaoYy98tbNT3Kb1RJhCuRNvJTQscV9cejrITnyI6u0PFlQwDaPLbQzPC
         sTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ouQc4le98vd4eMw9kKcpdAtvCk7tuIUdJKd4f5MCze0=;
        b=P2aoNEpmzF2Yk4XNj1a3EzQgRvMUfLHtfzDqaq3twdiNHG6myfkdM3LZNpDobrZaZx
         U3Om86dBebKzMkseiTF0/QGObX8BVsCjGucpnKVvcOb2u9Y+HfyUst/YieQu7o+ZonkR
         TO/pPvhkwgd7q9eFl0pj/USM4XVI1bY9P/81ePZ74hMB6r6CRgGHXK1pq7NQsPHxgQzn
         ZIn6bblWOym4psBCYegGYiYKZaBs4onZyxldC/otoEL0qIey2Lu2+7zZrRWA7PGcCaFI
         Ek5D/41fmxdc774T3ykcXBydHJju17620Tg34wP+zdq4lhQKfmp7WFFRjdj7P+4BoG/T
         J7hQ==
X-Gm-Message-State: AOAM532FSAn7n5NZlubSvNgxuh5mF38TOfpjCW49p+5XTy1KNlGeQ2tw
        /FXt2phHWvWihoG+cJFXqK8=
X-Google-Smtp-Source: ABdhPJyPS1akCGkEx2SralGGhM0KiBEd161FfVBS1PFNsctzYIsBWIsX5tkUadVyysvVcjeTms8CaA==
X-Received: by 2002:a9d:4c99:: with SMTP id m25mr17612223otf.106.1599582874108;
        Tue, 08 Sep 2020 09:34:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k2sm2300424oiw.20.2020.09.08.09.34.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 09:34:33 -0700 (PDT)
Date:   Tue, 8 Sep 2020 09:34:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: FW: [PATCH 5/6] hwmon: amd_energy: dump energy counters via
 debugfs
Message-ID: <20200908163432.GA169609@roeck-us.net>
References: <20200905143230.195049-1-nchatrad@amd.com>
 <20200905143230.195049-6-nchatrad@amd.com>
 <1c48945d-09d7-8154-d678-2c6201c928d9@roeck-us.net>
 <DM6PR12MB4388C77E35BD61F4DC2EAEC9E82A0@DM6PR12MB4388.namprd12.prod.outlook.com>
 <CAHfPSqBSctZtG7KQCRdRmO0HbFXF-UZVZZqcxM_SehrqU2EZ9w@mail.gmail.com>
 <fed67fcd-f148-e84d-eb73-a265e179941d@roeck-us.net>
 <CAHfPSqCkEetYEo2yqZC_0JpGYUYgpqh34-B6sdCWde57_1PhbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHfPSqCkEetYEo2yqZC_0JpGYUYgpqh34-B6sdCWde57_1PhbA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 08, 2020 at 09:40:40PM +0530, Naveen Krishna Ch wrote:
> Hi Guenter
> 
> On Sat, 5 Sep 2020 at 22:28, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 9/5/20 9:41 AM, Naveen Krishna Ch wrote:
> > > Hi Guenter,
> > >
> > >> On 9/5/20 7:32 AM, Naveen Krishna Chatradhi wrote:
> > >>> Use seq_printf to capture the core and socket energies under debugfs
> > >>> path in '/sys/kernel/debug/amd_energy/'
> > >>> file cenergy_dump: To print out the core energy counters file
> > >>> senergy_dump: To print out the socket energy counters
> > >>>
> > >>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > >>
> > >> Isn't this a duplicate of other functionality available in the kernel ?
> > >> I'd have to look it up, but I am quite sure that energy values are already available. Besides that, what is the point of duplicating the hwmon attributes ?
> > >
> > > Idea is to reduce the latency in gathering all the counters (Rome has
> > > 128 cores on 2 sockets) from the user space.
> > > If there is a better way to get this done, please let me know. I shall
> > > implement and resubmit.
> > >
> >
> > Isn't turbostat supposed to be able to do that ?
> Apologies, I was not aware of turbostat, took a look at the turbostat
> code now, this is an elaborate tool which is dependent on msr.ko. At
> present, this tool provides a lot of information in sequence. There is
> no duplication of the code.
> 
> We need this functionality for the following reasons.
> 1. Reduced latency in gathering the energy counters of all cores and packages
> 2. Possible to provide an API to the user space to integrate into
> other tools/frameworks
> 
> Please let me know your opinion.

debugfs should only used for debugging and not to create a backdoor API.
What you are looking for is a more efficient API than the hwmon API
to access sensor data. There is an available API to do that: iio.
You have two options: Register the driver with iio directly, or better
implement a generic hwmon->iio bridge in the hwmon core. I have wanted
to do the latter forever, but never got around to impementing it.

Guenter

> >
> > Guenter
> >
> > >>
> > >> Guenter
> > >>
> > >>> ---
> > >>>  drivers/hwmon/amd_energy.c | 110
> > >>> +++++++++++++++++++++++++++++++++++++
> > >>>  1 file changed, 110 insertions(+)
> > >>>
> > >>> diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
> > >>> index c294bea56c02..2184bd4510ed 100644
> > >>> --- a/drivers/hwmon/amd_energy.c
> > >>> +++ b/drivers/hwmon/amd_energy.c
> > >>> @@ -8,6 +8,7 @@
> > >>>  #include <linux/bits.h>
> > >>>  #include <linux/cpu.h>
> > >>>  #include <linux/cpumask.h>
> > >>> +#include <linux/debugfs.h>
> > >>>  #include <linux/delay.h>
> > >>>  #include <linux/device.h>
> > >>>  #include <linux/hwmon.h>
> > >>> @@ -20,6 +21,7 @@
> > >>>  #include <linux/platform_device.h>
> > >>>  #include <linux/sched.h>
> > >>>  #include <linux/slab.h>
> > >>> +#include <linux/smp.h>
> > >>>  #include <linux/topology.h>
> > >>>  #include <linux/types.h>
> > >>>
> > >>> @@ -57,6 +59,8 @@ struct amd_energy_data {
> > >>>       int nr_socks;
> > >>>       int core_id;
> > >>>       char (*label)[10];
> > >>> +     u64 *cdump;
> > >>> +     u64 *sdump;
> > >>>  };
> > >>>
> > >>>  static int amd_energy_read_labels(struct device *dev, @@ -329,6
> > >>> +333,108 @@ static int create_accumulate_status_file(struct amd_energy_data *data)
> > >>>                                &accumulate_attr.attr);  }
> > >>>
> > >>> +#ifdef CONFIG_DEBUG_FS
> > >>> +static void dump_on_each_cpu(void *info) {
> > >>> +     struct amd_energy_data *data = info;
> > >>> +     int cpu = smp_processor_id();
> > >>> +
> > >>> +     amd_add_delta(data, cpu, cpu, (long *)&data->cdump[cpu],
> > >>> +                   ENERGY_CORE_MSR);
> > >>> +}
> > >>> +
> > >>> +static int cenergy_dump_show(struct seq_file *s, void *unused) {
> > >>> +     struct amd_energy_data *data = s->private;
> > >>> +     struct cpumask *cpus_mask;
> > >>> +     int i;
> > >>> +
> > >>> +     cpus_mask = kmalloc(sizeof(*cpus_mask), GFP_KERNEL);
> > >>> +     memset(data->cdump, 0, (data->nr_cpus) * sizeof(u64));
> > >>> +     cpumask_clear(cpus_mask);
> > >>> +     for (i = 0; i < data->nr_cpus; i++) {
> > >>> +             if (cpu_online(i))
> > >>> +                     cpumask_set_cpu(i, cpus_mask);
> > >>> +     }
> > >>> +
> > >>> +     on_each_cpu_mask(cpus_mask, dump_on_each_cpu, data, true);
> > >>> +
> > >>> +     for (i = 0; i < data->nr_cpus; i++) {
> > >>> +             if (!(i & 3))
> > >>> +                     seq_printf(s, "Core %3d: ", i);
> > >>> +
> > >>> +             seq_printf(s, "%16llu ", data->cdump[i]);
> > >>> +             if ((i & 3) == 3)
> > >>> +                     seq_puts(s, "\n");
> > >>> +     }
> > >>> +     seq_puts(s, "\n");
> > >>> +
> > >>> +     kfree(cpus_mask);
> > >>> +     return 0;
> > >>> +}
> > >>> +DEFINE_SHOW_ATTRIBUTE(cenergy_dump);
> > >>> +
> > >>> +static int senergy_dump_show(struct seq_file *s, void *unused) {
> > >>> +     struct amd_energy_data *data = s->private;
> > >>> +     int i, cpu;
> > >>> +
> > >>> +     for (i = 0; i < data->nr_socks; i++) {
> > >>> +             cpu = cpumask_first_and(cpu_online_mask,
> > >>> +                                     cpumask_of_node(i));
> > >>> +             amd_add_delta(data, data->nr_cpus + i, cpu,
> > >>> +                           (long *)&data->sdump[i], ENERGY_PKG_MSR);
> > >>> +             seq_printf(s, "Socket %1d: %16llu\n",
> > >>> +                        i, data->sdump[i]);
> > >>> +     }
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +DEFINE_SHOW_ATTRIBUTE(senergy_dump);
> > >>> +
> > >>> +static void dump_debugfs_cleanup(void *ddir) {
> > >>> +     debugfs_remove_recursive(ddir);
> > >>> +}
> > >>> +
> > >>> +static int create_dump_file(struct device *dev,
> > >>> +                         struct amd_energy_data *data) {
> > >>> +     struct dentry *debugfs;
> > >>> +     char name[] = "amd_energy";
> > >>> +
> > >>> +     data->cdump = devm_kcalloc(dev, data->nr_cpus,
> > >>> +                                sizeof(u64), GFP_KERNEL);
> > >>> +     if (!data->cdump)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     data->sdump = devm_kcalloc(dev, data->nr_socks,
> > >>> +                                sizeof(u64), GFP_KERNEL);
> > >>> +     if (!data->sdump)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     debugfs = debugfs_create_dir(name, NULL);
> > >>> +     if (debugfs) {
> > >>> +             debugfs_create_file("cenergy_dump", 0440,
> > >>> +                                 debugfs, data, &cenergy_dump_fops);
> > >>> +             debugfs_create_file("senergy_dump", 0440,
> > >>> +                                 debugfs, data, &senergy_dump_fops);
> > >>> +             devm_add_action_or_reset(data->hwmon_dev,
> > >>> +                                      dump_debugfs_cleanup, debugfs);
> > >>> +     }
> > >>> +
> > >>> +     return 0;
> > >>> +}
> > >>> +#else
> > >>> +
> > >>> +static int create_dump_file(struct device *dev,
> > >>> +                         struct amd_energy_data *data) {
> > >>> +     return 0;
> > >>> +}
> > >>> +
> > >>> +#endif //CONFIG_DEBUG_FS
> > >>> +
> > >>>  static int amd_energy_probe(struct platform_device *pdev)  {
> > >>>       struct amd_energy_data *data;
> > >>> @@ -376,6 +482,10 @@ static int amd_energy_probe(struct platform_device *pdev)
> > >>>       if (ret)
> > >>>               return ret;
> > >>>
> > >>> +     ret = create_dump_file(dev, data);
> > >>> +     if (ret)
> > >>> +             return ret;
> > >>> +
> > >>>       return 0;
> > >>>  }
> > >>>
> > >>>
> > > Naveen
> > >
> >
> 
> 
> -- 
> Shine bright,
> (: Nav :)
