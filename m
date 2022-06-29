Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E81DD55FC1E
	for <lists+linux-hwmon@lfdr.de>; Wed, 29 Jun 2022 11:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiF2Jfv (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 29 Jun 2022 05:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiF2Jfs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Jun 2022 05:35:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5817C3B3D7;
        Wed, 29 Jun 2022 02:35:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CD00266017F7;
        Wed, 29 Jun 2022 10:35:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656495345;
        bh=AYuYIhk2iyHr8WNWalQKmNnI15MJGuNcUQ4QRSGLoao=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Le3ZgNjQupGL0Oa2pGPrNY5tZ3Q/WwBJwU5wtOtL3V0OWFXs764gRzSEpCwldQRW9
         qIgLpqZA57okZFLng/yWEmZebmcI/1THbZ1fLTCJbwFGj+n/xvYhQ7HkhiXBlUc5Uw
         HfdWawmidBI/0MGFkHWCTh5KRHw0TrfVbOPt5ADT6nNUcIvv+sCmaY6jYv0k5WjLXx
         YXlDjtwfwoLH4Edl7BoYvKQ1Kpk4wUGjGqkJ5AvQmKnZQWdTPaVjGQ4fksm9ZPQ6Pi
         LvlvlTKqd8lemuNpfAUCKbi1ZG8PZPX4vwUm3vgakpdfb3Q1gl3/xLPDv2Y489QRx3
         9dND+RMinE5jg==
Message-ID: <0f6cc7d3-5537-cd8f-d234-a61420e1cbc8@collabora.com>
Date:   Wed, 29 Jun 2022 12:35:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] thermal/drivers/tegra: Remove get_trend function
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        rafael@kernel.org
References: <20220616202537.303655-1-daniel.lezcano@linaro.org>
 <20220616202537.303655-2-daniel.lezcano@linaro.org>
 <7841a809-e180-70d2-df9b-b30b411647ce@linaro.org>
 <d186bb7d-cbe6-8ec4-82a1-8323b3901ac2@collabora.com>
 <20220628151030.GA3361452@roeck-us.net>
 <20220628184332.GA3624671@roeck-us.net>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220628184332.GA3624671@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/28/22 21:43, Guenter Roeck wrote:
> On Tue, Jun 28, 2022 at 08:10:30AM -0700, Guenter Roeck wrote:
>> On Tue, Jun 28, 2022 at 02:44:31PM +0300, Dmitry Osipenko wrote:
>>> On 6/28/22 11:41, Daniel Lezcano wrote:
>>>>
>>>> Thierry, Dmitry,
>>>>
>>>> are fine with this patch?
>>>
>>> Seems should be good. I couldn't test it using recent the linux-next
>>> because of a lockup in LM90 driver. There were quite a lot of changes in
>>> LM90 recently, adding Guenter.
>>>
>>
>> Weird, I tested those changes to death with real hardware, and I don't
>> see a code path where the mutex can be left in blocked state unless the
>> underlying i2c driver locks up for some reason. What is the platform,
>> and can you point me to the devicetree file ? Also, is there anything
>> else lm90 or i2c related in the kernel log ?
>>
> 
> Follow-up question: I see that various Tegra systems use lm90 compatible
> chips, and the interrupt line is in general wired up. Can you check if
> you get lots of interrupts on that interrupt line ? Also, can you check
> what happens if you read hwmon attributes directly ?

The number of interrupt fires is okay. It's a Nexus 7 Tegra30 tablet
device that I'm using for the testing.

Today I enabled the lockdep and it immediately showed where the problem is:

======================================================
WARNING: possible circular locking dependency detected
5.19.0-rc4-next-20220628-00002-g94e5dbbe1c58-dirty #24 Not tainted
------------------------------------------------------
irq/91-lm90/130 is trying to acquire lock:
c27ba380 (&tz->lock){+.+.}-{3:3}, at: thermal_zone_device_update+0x2c/0x64

               but task is already holding lock:
c27b42c8 (&data->update_lock){+.+.}-{3:3}, at: lm90_irq_thread+0x2c/0x68

               which lock already depends on the new lock.


               the existing dependency chain (in reverse order) is:

               -> #1 (&data->update_lock){+.+.}-{3:3}:
       __mutex_lock+0x9c/0x984
       mutex_lock_nested+0x2c/0x34
       lm90_read+0x44/0x3e8
       hwmon_thermal_get_temp+0x58/0x8c
       of_thermal_get_temp+0x38/0x44
       thermal_zone_get_temp+0x5c/0x7c
       thermal_zone_device_update.part.0+0x48/0x5fc
       thermal_zone_device_set_mode+0xa0/0xe4
       thermal_zone_device_enable+0x1c/0x20
       thermal_zone_of_sensor_register+0x18c/0x19c
       devm_thermal_zone_of_sensor_register+0x68/0xa4
       __hwmon_device_register+0x704/0x91c
       hwmon_device_register_with_info+0x6c/0x80
       devm_hwmon_device_register_with_info+0x78/0xb4
       lm90_probe+0x618/0x8c0
       i2c_device_probe+0x170/0x2e0
       really_probe+0xd8/0x300
       __driver_probe_device+0x94/0xf4
       driver_probe_device+0x40/0x118
       __device_attach_driver+0xc8/0x10c
       bus_for_each_drv+0x90/0xdc
       __device_attach+0xbc/0x1d4
       device_initial_probe+0x1c/0x20
       bus_probe_device+0x98/0xa0
       deferred_probe_work_func+0x8c/0xbc
       process_one_work+0x2b8/0x774
       worker_thread+0x17c/0x56c
       kthread+0x108/0x13c
       ret_from_fork+0x14/0x28
       0x0

               -> #0 (&tz->lock){+.+.}-{3:3}:
       __lock_acquire+0x173c/0x3198
       lock_acquire+0x128/0x3f0
       __mutex_lock+0x9c/0x984
       mutex_lock_nested+0x2c/0x34
       thermal_zone_device_update+0x2c/0x64
       hwmon_notify_event+0x128/0x138
       lm90_update_alarms_locked+0x35c/0x3b8
       lm90_irq_thread+0x38/0x68
       irq_thread_fn+0x2c/0x8c
       irq_thread+0x190/0x29c
       kthread+0x108/0x13c
       ret_from_fork+0x14/0x28
       0x0

               other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&data->update_lock);
                               lock(&tz->lock);
                               lock(&data->update_lock);
  lock(&tz->lock);

                *** DEADLOCK ***

1 lock held by irq/91-lm90/130:
 #0: c27b42c8 (&data->update_lock){+.+.}-{3:3}, at:
lm90_irq_thread+0x2c/0x68

               stack backtrace:
CPU: 1 PID: 130 Comm: irq/91-lm90 Not tainted
5.19.0-rc4-next-20220628-00002-g94e5dbbe1c58-dirty #24
Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
Backtrace:
 dump_backtrace from show_stack+0x20/0x24
 r7:c33d1b60 r6:00000080 r5:60000093 r4:c168c6a4
 show_stack from dump_stack_lvl+0x68/0x98
 dump_stack_lvl from dump_stack+0x18/0x1c
 r7:c33d1b60 r6:c20328cc r5:c203c700 r4:c20328cc
 dump_stack from print_circular_bug+0x2ec/0x33c
 print_circular_bug from check_noncircular+0x104/0x168
 r10:c1a14cc8 r9:c33d1240 r8:00000001 r7:00000000 r6:dfc3dcc0 r5:c33d1b60
 r4:c33d1b80
 check_noncircular from __lock_acquire+0x173c/0x3198
 r7:c33d1b80 r6:c202bc98 r5:c33d1b60 r4:c21d92ac
 __lock_acquire from lock_acquire+0x128/0x3f0
 r10:60000013 r9:00000000 r8:00000000 r7:00000000 r6:dfc3dd40 r5:c19ac688
 r4:c19ac688
 lock_acquire from __mutex_lock+0x9c/0x984
 r10:c27ba380 r9:00000000 r8:c21d92ac r7:c33d1240 r6:00000000 r5:00000000
 r4:c27ba348
 __mutex_lock from mutex_lock_nested+0x2c/0x34
 r10:c27b4000 r9:00000000 r8:dfc3de87 r7:00000000 r6:c27ba348 r5:00000000
 r4:c27ba000
 mutex_lock_nested from thermal_zone_device_update+0x2c/0x64
 thermal_zone_device_update from hwmon_notify_event+0x128/0x138
 r7:00000000 r6:00000000 r5:c2d23ea4 r4:c33fd040
 hwmon_notify_event from lm90_update_alarms_locked+0x35c/0x3b8
 r8:c27b4378 r7:c2d23c08 r6:00000020 r5:00000000 r4:c27b4240
 lm90_update_alarms_locked from lm90_irq_thread+0x38/0x68
 r9:c01c2814 r8:00000001 r7:c33d2240 r6:c27b4290 r5:c27b4240 r4:c33fc200
 lm90_irq_thread from irq_thread_fn+0x2c/0x8c
 r7:c33d2240 r6:c27b4000 r5:c33d1240 r4:c33fc200
 irq_thread_fn from irq_thread+0x190/0x29c
 r7:c33d2240 r6:c33fc224 r5:c33d1240 r4:00000000
 irq_thread from kthread+0x108/0x13c
 r10:00000000 r9:df9ddbf4 r8:c31d2200 r7:c33fc200 r6:c01c2710 r5:c33d1240
 r4:c33fc240
 kthread from ret_from_fork+0x14/0x28

-- 
Best regards,
Dmitry
