Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51297754A92
	for <lists+linux-hwmon@lfdr.de>; Sat, 15 Jul 2023 20:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjGOSMu (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 15 Jul 2023 14:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjGOSMt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 14:12:49 -0400
Received: from doubleyoutf.uk (doubleyoutf.uk [IPv6:2a00:da00:1800:3a8::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBF8269D
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 11:12:45 -0700 (PDT)
Received: from [2a00:23c5:dcb3:8b33::b56]
        by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <ahmad@khalifa.ws>)
        id 1qKjl4-002vZe-Vs; Sat, 15 Jul 2023 18:12:43 +0000
Message-ID: <2449f8b5-53ab-cbea-f1da-6c4b55c41ac8@khalifa.ws>
Date:   Sat, 15 Jul 2023 19:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
Content-Language: en-GB
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <20230715153113.1307220-1-ahmad@khalifa.ws>
 <9c4d7f9d-d417-077d-a709-d372214bf35c@roeck-us.net>
 <9271e276-7727-25ee-5c46-c25f479b73d7@khalifa.ws>
 <6012aa53-fa6c-103a-faf8-56ed8e990277@roeck-us.net>
From:   Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <6012aa53-fa6c-103a-faf8-56ed8e990277@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 15/07/2023 18:48, Guenter Roeck wrote:
> On 7/15/23 10:03, Ahmad Khalifa wrote:
>>> Why not use bit 31 ?
>>
>> Well, this is the part that made me say "driver supports up to 16".
>> The ALARM bits have FAN_BASE starting at index 16, so the IN alarms
>> can only take up 0-15, unless all alarm bits have extra padding
>> added to push FAN_BASE/TEMP_BASE/INTRUSION_BASE up.
>>
>> I took the easy option here and left out the 16 IN alarm.
>>
>> Did I count this wrong?
>> nct6775_fan_is_visible()
>>      `data->ALARM_BITS[FAN_ALARM_BASE + fan]`
> 
> The 16 was just for convenience when setting the alarm base values,
> and to keep some space for voltages. That doesn't mean the driver as
> a whole supports 16 voltage inputs (or 8 fan control inputs, for
> that matter).
> 
> We need to revisit the entire alarm handling at some point.
> nct6798 and nct6799 support 8 sets of temperature limits and
> alarms, and that isn't currently supported either. 'alarms'
> is already 64 bits wide, so it should be possible to shift
> the bits around and make space for more alarms (such as 24
> voltages, 8 fans, and 8 or even 16 temperatures).

Good point, my next patch for temps was going to have this comment:

+/* 8 source readings available, but we keep to 6 to remain in bounds
+ * temp 7/8: 0x676, 0x678
+ * src 7/8:  0xc2a, 0xc2b
+ */

Might as well expand the Alarms first then add all 18 IN and 8 TEMPs
(And with comments not in the style of the networking subsystem)

Should I update the ALARM bits first, then send in the the full IN
and TEMP registers afterwards? Rather than add-expand-addmore


-- 
Regards,
Ahmad Khalifa
