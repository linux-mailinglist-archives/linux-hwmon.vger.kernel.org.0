Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647E36D7F29
	for <lists+linux-hwmon@lfdr.de>; Wed,  5 Apr 2023 16:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238451AbjDEOT4 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 5 Apr 2023 10:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237800AbjDEOTe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Apr 2023 10:19:34 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588B81734;
        Wed,  5 Apr 2023 07:18:38 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso19089913otj.10;
        Wed, 05 Apr 2023 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704316;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3U+G1dYlqoDCc4gY/sysNP2WcHzjVN8ZJHoqMDCmGLE=;
        b=Pu4nHnQ7c8M6e4lV1NTyaqBsoECRqZ4Obe139raj/dAJD0AWeW+1EGmRmuMovc4SPh
         BobBSKT2YZCdN6yvumRRdBubkTD8Q5qsfSDfqkdeu51M4TKHJuATF3uIFRIOssojTub/
         5MSVwxZsbPob08zpU5Ux4VdZvyM/0hRaHmPsYDJa5uRMPpz8Osg87vzJ/cTMMGDY+IuE
         nPNFhreEyRgy/hH0ZffH2kajZTxZ7RlSiulbu0S3Cy9QZKV3d5NxPpAZA1h6ULocPoBi
         f591njGtbEnOq6d4Jo8JQsOLhiDB5jzInEmL7O6EXsHIX0rQcg9hn3NjCo0OPJe6s443
         z3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704316;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3U+G1dYlqoDCc4gY/sysNP2WcHzjVN8ZJHoqMDCmGLE=;
        b=ELn6g9eJIX80nDocq1kt1GrIgfwJkRmTECBaPDckht1iygBLJtWoKeGw3PqPzt+glC
         Hms/3SiX7n4agWZ+cogi08Hk0XWQdgk0RQbodJcksS4aFw8V+Wla+1LfHoyl/qHATIAJ
         8C2OZQMGC9cGighHLV/UQs72rH69iuJzcN623kucelAOI7YsSMZGq4xqDsIyZ9R8po/O
         Q9oeUz+bW2OPg7D2pTyjOlzLOp9zZ2rPGYHtZVqeO4pHTImIDFpUu40pS2lpYCb2VbPV
         XEWunp2emqD10rO2Hsk3wT2eH5hB2Le9EhlKToSK7XYqi6CY9i3V8KkkEWcXUrUHgzUC
         RJTg==
X-Gm-Message-State: AAQBX9eH++Rx1JgOLpUteqMoW1ieWoC7khsBkclUOdLpE4upaO/ythLx
        sgFGRBIiMrKRdyf8OFbmREg=
X-Google-Smtp-Source: AKy350ZsNs/D5YPO+x+9Yr6iU8eKO7SEwi4OFmNOUyqqQehv5zMv+TS1xeMlnzkjAhyRDYeDKzli0A==
X-Received: by 2002:a05:6830:83:b0:698:d198:fe9b with SMTP id a3-20020a056830008300b00698d198fe9bmr2423692oto.10.1680704315947;
        Wed, 05 Apr 2023 07:18:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d6acf000000b0069f0794861asm6715814otq.63.2023.04.05.07.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 07:18:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aea044ab-3a83-2369-aff7-5ef153618619@roeck-us.net>
Date:   Wed, 5 Apr 2023 07:18:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org, Sascha Hauer <sha@pengutronix.de>,
        jerome Neanne <jneanne@baylibre.com>,
        "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>
References: <20230328150335.90238-1-Naresh.Solanki@9elements.com>
 <20230328150335.90238-2-Naresh.Solanki@9elements.com>
 <c88d3cdd-fb2f-c3ac-a9e8-e49f8e98b811@gmail.com>
 <17934bff-f728-d57a-c3c8-956634bd48c8@roeck-us.net>
 <3be67394-6082-1aeb-8a8d-90149217bdc7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/core): Add regulator event support
In-Reply-To: <3be67394-6082-1aeb-8a8d-90149217bdc7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/5/23 06:57, Matti Vaittinen wrote:
> Hi Guenter,
> 
> On 4/5/23 16:15, Guenter Roeck wrote:
>> On 3/28/23 23:48, Matti Vaittinen wrote:
>>> Hi Naresh, all
>>>
>>> This mail is maybe more of a question so that I can get on the same page with the rest of the world than anything else. I just have to ask this as I am trying to figure out what kind of handling there could be for regulator errors. I added Mark and couple of others to the CC as I am under the impression they have done some work with the regulator error handling lately :)
>>>
>>> On 3/28/23 18:03, Naresh Solanki wrote:
>>>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>>
>>>> Add regulator events corresponding to regulator error in regulator flag
>>>> map.
>>>> Also capture the same in pmbus_regulator_get_flags.
>>>>
>>>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>>>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>>>> ---
>>>>   drivers/hwmon/pmbus/pmbus_core.c | 74 +++++++++++++++++++++-----------
>>>>   1 file changed, 49 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>>> index d93405f1a495..509bc0ef1706 100644
>>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>>> @@ -2693,9 +2693,9 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>>>>       return 0;
>>>>   }
>>>> -/* A PMBus status flag and the corresponding REGULATOR_ERROR_* flag */
>>>> +/* A PMBus status flag and the corresponding REGULATOR_ERROR_* and REGULATOR_EVENTS_* flag */
>>>>   struct pmbus_status_assoc {
>>>> -    int pflag, rflag;
>>>> +    int pflag, rflag, eflag;
>>>>   };
>>>>   /* PMBus->regulator bit mappings for a PMBus status register */
>>>> @@ -2710,27 +2710,36 @@ static const struct pmbus_status_category __maybe_unused pmbus_status_flag_map[]
>>>>           .func = PMBUS_HAVE_STATUS_VOUT,
>>>>           .reg = PMBUS_STATUS_VOUT,
>>>>           .bits = (const struct pmbus_status_assoc[]) {
>>>> -            { PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN },
>>>> -            { PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE },
>>>> -            { PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN },
>>>> -            { PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT },
>>>> +            { PB_VOLTAGE_UV_WARNING, REGULATOR_ERROR_UNDER_VOLTAGE_WARN,
>>>> +            REGULATOR_EVENT_UNDER_VOLTAGE_WARN },
>>>> +            { PB_VOLTAGE_UV_FAULT,   REGULATOR_ERROR_UNDER_VOLTAGE,
>>>> +            REGULATOR_EVENT_UNDER_VOLTAGE },
>>>> +            { PB_VOLTAGE_OV_WARNING, REGULATOR_ERROR_OVER_VOLTAGE_WARN,
>>>> +            REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>>> +            { PB_VOLTAGE_OV_FAULT,   REGULATOR_ERROR_REGULATION_OUT,
>>>> +            REGULATOR_EVENT_OVER_VOLTAGE_WARN },
>>>
>>> The question I have is: Are these mappings to regulator errors/notifications always correct?
>>>
>>
>> No, they are not always "correct", and can not be, because each chip implements
>> the PMBus standard as they see fit.
>>
>>> (I don't know the PMBUS specification in details - and thus I am _asking_ this here, not telling that the mapping is incorrect).
>>>
>>> Let me explain why I am asking this.
>>>
>>> What I have gathered is that at least some ICs allow setting for example 'voltage limits' for different PMBUS over-voltage WARNs/FAULTs. I however don't know if for example the "fatality" of errors indicated by FAULTS vs WARNs is mandated by any specification - or if a hw designers have free hands to decide what these events indicate on their board - or what type of action should be taken when certain ERROR/WARN is emitted.
>>>
>>
>> PMBus actually specifies which action can and should be taken on faults,
>> and that action is configurable. That - again - does not mean, however,
>> that each chip implements this the same way, only that they should.
>>
>> Possible (standard) actions for voltages are:
>>
>> - continue operating without interruption
>> - continue operating for a specified amount of time,
>>    then shut down if fault still exists and optionally
>>    retry
>> - shut down and optionally retry for a configurable
>>    number of times
>> - disable output while fault condition is present
>>    (e.g. for temperature faults) and re-enable after
>>    fault condition no longer exists
>>
>> Similar configuration settings are defined for current faults,
>> with additional support for current limiting.
>>
>>> Then to the handling of regulator errors:
>>>
>>> In order to be able to create any handling for the regulator errors/notifications, we should be able to classify the errors/notifications at least by the severity. The very fundamental decision is whether to turn-off the regulator - or even the whole system - in order to protect the hardware from damage.
>>>
>>> There are few other questions related to error handling as well - for example questions like:
>>> Who should handle error? (we may have many consumers?)
>>> When should consumer use for example forced regulator-off without knowing the other consumers?
>>> When should we have in-kernel handling for errors?
>>> When should the errors be sent to user-space trusting someone there is taking care of the situation?
>>>
>>> Following is largely my own pondering - and I would like to gain better understanding while also avoid sending wrong events/errors for detected HW issues so that we could actually implement recovery actions based on regulator errors / notifications.
>>>
>>> I have been trying to understand how error handling with regulator events should / could work. In my head (and in the regulator fault detection limit setting) we have 3 severity categories:
>>>
>>> 1. PROTECTION:
>>> The most 'severe' type of issue. This is reserved for cases where the hardware shuts down the regulator(s) without any SW interaction. In most cases there is no need for notification or error status because soc is likely to go down when the power is cut off. Border case is when HW autonomously shuts down a regulator which does not deliver power to any critical component. I am unsure if such situation should be indicated by ERROR level notification.
>>>
>>> 2. ERROR:
>>> Situation where system is no longer usable but the hardware does not do error handling. I would like to suggest that the proper handling for this type of events is regulator or system shutdown. I think the errors/notifications:
>>>
>>> #define REGULATOR_ERROR_UNDER_VOLTAGE           BIT(1)
>>> #define REGULATOR_ERROR_OVER_CURRENT            BIT(2)
>>> #define REGULATOR_ERROR_REGULATION_OUT          BIT(3)
>>> #define REGULATOR_ERROR_FAIL                    BIT(4)
>>> #define REGULATOR_ERROR_OVER_TEMP               BIT(5)
>>>
>>> #define REGULATOR_EVENT_UNDER_VOLTAGE           0x01
>>> #define REGULATOR_EVENT_OVER_CURRENT            0x02
>>> #define REGULATOR_EVENT_REGULATION_OUT          0x04
>>> #define REGULATOR_EVENT_FAIL                    0x08
>>> #define REGULATOR_EVENT_OVER_TEMP               0x10
>>>
>>> should only be used to indicate errors with this severity. That would allow actually implementing the handling for these errors. If these errors are sent for "less severe" issues, then we will not be able to do any generic error handling.
>>>
>>> 3. WARNING:
>>> Situation where something is off-the-spec, but system is still thought to be usable. Here some - probably board/system (use-case?) specific - handling may be taking place to prevent things getting worse. I added following flags for this purpose:
>>>
>>> #define REGULATOR_EVENT_UNDER_VOLTAGE_WARN      0x2000
>>> #define REGULATOR_EVENT_OVER_CURRENT_WARN       0x4000
>>> #define REGULATOR_EVENT_OVER_VOLTAGE_WARN       0x8000
>>> #define REGULATOR_EVENT_OVER_TEMP_WARN          0x10000
>>> #define REGULATOR_EVENT_WARN_MASK               0x1E000
>>>
>>> #define REGULATOR_ERROR_UNDER_VOLTAGE_WARN      BIT(6)
>>> #define REGULATOR_ERROR_OVER_CURRENT_WARN       BIT(7)
>>> #define REGULATOR_ERROR_OVER_VOLTAGE_WARN       BIT(8)
>>> #define REGULATOR_ERROR_OVER_TEMP_WARN          BIT(9)
>>>
>>>
>>> So, my question(s) are:
>>>
>>> 1) Is this "classification" sensible and is it still possible?
>>> 2) does PMBUS *_WARNING status bits always indicate error which maps to severity WARNING above? And more importantly
>>> 3) does PMBUS *_FAULT status bits always indicate error which maps to severity ERROR above? Eg, can we assume correct handling for _FAULT is shutting down the regulator/system?
>>>
>>
>> No, as per above, since PMBus chips implement (or are supposed to implement)
>> their own fault handling.
>>
>>> We have something similar in a few (non PMBUS compatible) PMICs. For example the ROHM BD9576 has a PROTECTION level error detection (automatic shutdown by HW) and then another error detection which just generates an IRQ and allows software to decide what should be done.
>>>
>>> While writing the driver for that PMIC my thinking was that the decision whether IRQ is indicating a fatal error or a warning should be on the board-designer's table. Thus I implemented it so that the severity and limit configuration for this error is given via device-tree - and it is up to board designer to decide whether the fault is ERROR or WARN - and notification sent by the driver for this IRQ will reflect the given severity.
>>>
>>> I wonder if something like this is needed for PMBUS - or if we can always say the *_FAULT maps to regulator ERROR and _WARNING maps to regulator WARNING no matter how board using the IC is designed?
>>>
>>
>> In summary, I must admit that I don't entirely understand your questions
>> or why they are tied to PMBus regulator implementations, except that you
>> seem to be saying that because reporting faults to the regulator subsystem as
>> errors may result in shutdowns requested by the regulator subsystem,
> 
> At the moment, no. I don't think the regulator subsystem itself requests shut-down for the system.
> 
> As far as I know, the handling of regulator errors is currently done by regulator consumers. If the only consumers for PMBus regulators are PMBus specific drivers - then the in-kernel error handling is in the hands of PMBus specific drivers.
> 
> Furthermore, I don't think we have in-tree handling for the regulator events. Hence, even if there were 'non PMBus specific' consumers for these regulators - there will probably be no catastrophic things happening as of now - but if these notifications can leak to non PMBus regulator consumers, then we place a restriction on handling of these errors. (Eg, other but PMBus specific regulator consumers must not handle these).
> 
> The one thing to consider is that (as far as I understand) some work has been done to get these events visible to user-space. I am unsure how the user-space should know what to do upon these events if these may be generated for 'different severity' issues.
> 

The same is true for hardware monitoring events, which are reported to user space
with sysfs attributes.

>> PMBus
>> chips must not report such faults to the regulator subsystem as errors
>> because that would interfer with fault handling implemented by PMBus chips.
> 
> I am sorry for making the noise here. As I said above, if the only consumers for these regulators are PMBus devices - then I guess this does not cause problems. Yet, I wonder if this means that not all of the regulator notifications should be sent to user-land.
> 

The consumers for the regulators provided by PMBus devices are the devices
connected to those PMBus devices, just like with (presumably) every other
regulator. Not sure why a regulator instantiated by a regulator driver
would provide a regulator regulating itself.

>> I am not sure if PMBus is made an example of here, but it seems to me
>> that I don't have a choice. I'll hold up this series until I have a better
>> understanding of the implications.
> 
> Please, don't block the series if no-one else but me is concerned. It is highly possible it is me who does not understand the purpose of these notifications or how they are thought to be handled.
> 

Same situation. I though a regulator driver would notify the regulator subsystem
if it observes a problem with the supplies it regulates, but based on your feedback
I am not sure anymore what those notifications are supposed to be used for,
and if such notifications are appropriate. That means I'll have to read up on all
this, and I don't have the time to do that in the near future given that I am buried
in pending reviews and the work I am actually getting paid for.

Guenter

