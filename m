Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB07A751BDE
	for <lists+linux-hwmon@lfdr.de>; Thu, 13 Jul 2023 10:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjGMIlZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 13 Jul 2023 04:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbjGMIlO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jul 2023 04:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383932D54
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Jul 2023 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689237368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B/zyYDOKGaV8MGnruif6L2Wtxw0ltAUAK4vKzkv5DiM=;
        b=YQwPot+CAcubX1AHUFF0Nm1jnabMGZ319QcDGgFAqV+eimWDHoXqDakJOw05WKHnr1LRS2
        0YKODZPi+7qJUrLBe+Tn7PU9PQ1Y3zbxCwHgi15YqDpnLciJxpDMXYiOEaBk+E5WTRg1gd
        NQy53nADJkg3eEr26QwRWp5Z8EWuczk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-yuPMgVXEPLG5laWDuxZVFQ-1; Thu, 13 Jul 2023 04:36:06 -0400
X-MC-Unique: yuPMgVXEPLG5laWDuxZVFQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993c2d9e4a0so32989366b.2
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Jul 2023 01:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689237365; x=1691829365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/zyYDOKGaV8MGnruif6L2Wtxw0ltAUAK4vKzkv5DiM=;
        b=KrScA/IYkvR2k8wbzX1K8aPlH8547PKtYmPV0CzsIknxvLI3yNT3PQK0oVoj9ycf6i
         /JpMjIpSaDoWjnholU3yN3X/ENInNsbcfkR5qQ9qhUj+XzKsjroHkVcd1yTFbjx/TrYq
         sbxTLJkLUwAn9IWOZWOGCdYS4IHVbiVwcTOOQyfphUvggN+YrAI0ML965vBIDGm63Uha
         6abI3td6ExA/gznNT2TcjgveU9LC7Wn1Fa2/b7S9LEyqSyBowynhFY6c2IjiR/ORLg+x
         J7vhdSysnE18DfU+4ZzNHuTPwK4QT1XV1OJQ6xLJ8NOryd76ZvTvfitSgnAT1FqkjUDf
         VE0w==
X-Gm-Message-State: ABy/qLZj2Ag8fTk6oiBC/VaFo+86vjcITNe0dvnc+VU7Qp/KQAWASEXr
        YwagW5QABVYav+K2III95v8LssItacWSPfUCcbROpETNReybD1h03xqeCk/VvTI2BZT7U6JTIfb
        K27XMTRfCz/w8S4lb1R3BVs0=
X-Received: by 2002:a17:907:6025:b0:993:22a2:8158 with SMTP id fs37-20020a170907602500b0099322a28158mr718113ejc.61.1689237365693;
        Thu, 13 Jul 2023 01:36:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFcPUOYKw+vXMNwAjEaLD+fvjXA8SdZCLILa+umjBj1Pz7V8D2JdbpT/k9bQktIPUxnOZjJug==
X-Received: by 2002:a17:907:6025:b0:993:22a2:8158 with SMTP id fs37-20020a170907602500b0099322a28158mr718096ejc.61.1689237365432;
        Thu, 13 Jul 2023 01:36:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d8-20020a170906370800b009929ab17be0sm3608565ejc.162.2023.07.13.01.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 01:36:04 -0700 (PDT)
Message-ID: <145850e2-f22e-0afa-7ff1-bc2d07ac3e96@redhat.com>
Date:   Thu, 13 Jul 2023 10:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] platform/x86: add CMOS battery monitoring for simatic
 IPCs
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <20230706154831.19100-1-henning.schild@siemens.com>
 <20230706154831.19100-3-henning.schild@siemens.com>
 <3b1dc0a1-94b0-4fba-07e7-b871dfc08e88@redhat.com>
 <20230713102840.7cb514d5@md1za8fc.ad001.siemens.net>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713102840.7cb514d5@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 7/13/23 10:28, Henning Schild wrote:
> Am Wed, 12 Jul 2023 20:05:54 +0200
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> <resend with Lee's new email address>
>>
>> Hi,
>>
>> On 7/6/23 17:48, Henning Schild wrote:
>>> Siemens Simatic Industrial PCs can monitor the voltage of the CMOS
>>> battery with two bits that indicate low or empty state. This can be
>>> GPIO or PortIO based.
>>> Here we model that as a hwmon voltage. The core driver does the
>>> PortIO and provides boilerplate for the GPIO versions. Which are
>>> split out to model runtime dependencies while allowing fine-grained
>>> kernel configuration.
>>>
>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>  
>>
>> So I tried to merge this, but it does not apply because:
>>
>> "[PATCH 1/1] leds: simatic-ipc-leds-gpio: add new model BX-21A"
>> https://lore.kernel.org/platform-driver-x86/20230531155457.31632-2-henning.schild@siemens.com/
>>
>> has not been merged yet.
>>
>> I think it would be best to split the:
>>
>> drivers/platform/x86/simatic-ipc.c
>> include/linux/platform_data/x86/simatic-ipc-base.h
>> include/linux/platform_data/x86/simatic-ipc.h
>>
>> bits of
>> https://lore.kernel.org/platform-driver-x86/20230531155457.31632-2-henning.schild@siemens.com/
>>
>> out into its own prep patch named e.g. :
>> "platform/x86: simatic-ipc: add BX-21A model"
>>
>> And then post a new v2 series for
>> "leds: simatic-ipc-leds-gpio: add new model BX-21A"
>> consisting of the prep patch + the actual new LED driver.
>>
>> Then I can do an immutable branch based on 6.5-rc1 with
>> the prep patch in there and send a pull-req to Lee Jones
>> for that, so that he can apply the LED driver patch on
>> top of the immutable branch.
>>
>> This way we can continue with merging all the pending
>> simatic IPC work without being dependent on Lee having
>> time to review the LED driver.
> 
> Sounds like a plan, i will send another version of "leds:
> simatic-ipc-leds-gpio: add new model BX-21A" with the pdx86 stuff as
> separate patch.

Great.

> But just to note one thing, we would be registering a platform device
> before there is a driver for it. ("simatic_ipc_leds_gpio_elkhartlake")
> I think that is fine>

Yes that really is not an issue, e.g. the ACPI subsystem registers
a platform device for every device in the ACPI tables and not nearly
all of them has a driver. Having a platform_device without a driver
around is not an issue.

Regards,

Hans


