Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7A262D52E
	for <lists+linux-hwmon@lfdr.de>; Thu, 17 Nov 2022 09:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239555AbiKQIkw (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 17 Nov 2022 03:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbiKQIkv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Nov 2022 03:40:51 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2045BD4E
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Nov 2022 00:40:50 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id v3so1383279pgh.4
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Nov 2022 00:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qplMXaAH/oEU5/8F3cf/ZUOQW9zkLXWofLHcj31TN/s=;
        b=Vuy2P2T2r6KO/AE/XiLPILumQC7f2JK5sa1C10KBZ1znHMVCPbCzWeKaN25fOw0eKL
         9SJ+eO/MqGvXQ58PvwxYqVKz+6CyDG+A1uegZU6d8RyaZ28foyko7GwmzJFKSKUC2n+R
         2KTVJFMA/OYtFbQ7RULhUhx0/GRc+zUcyZlStNw1k4y1qQ9HcpSt/08vQmIFRXW6JUzZ
         1CxDaQLbCxn+/eYOE2F6oJdWdbvKOeiEmK3xRtjfzsUB+lhAUD33yEjTZ5b4jmUOgz2i
         yLwZsZ3CNIdWWnim49pScyzm0jEjv/ueOlBYF7iQnL3Q3VVdypZi+D6n+iDINfa4A2Xy
         ojMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qplMXaAH/oEU5/8F3cf/ZUOQW9zkLXWofLHcj31TN/s=;
        b=ESRBj2i4agbuLi+JdYiGhM4740xnnJIIt9lGiWgLU+9d2kQBGhOv17u9OukaoPIC0Y
         KrxPJbW6X969j1ePjvS6XOe3ladJaDj2dhrVQfQxSR0OMSGIzDCndpb9Z8fuqnoAsd0U
         qKwy0GMtFoui8ibk2yW7tad29IFqMhXssmgFepz50HXV9cEwt4B8+FmKvXrAVaNt4GxO
         gVFlI2mFvzHv/8Z9JN5hCfmQqemtq4zmFT0PSB3NLGm6HhnEGh+HUKNSkR2BdP6bqE/W
         SprzxrS3SD8fD9Y91B1GuZeCshmvPS2gLNt3fhBik5HD1wzk0djeNhNrWXuPLDeUuUK7
         jf7g==
X-Gm-Message-State: ANoB5pkHY/JrUehz8xVB6tSi3WYBEap7WMAHrv9QdB9pKaM6U7CWffuo
        pI58HJekUL7TK2yMfoQbqII+9w==
X-Google-Smtp-Source: AA0mqf5TDC85f9Z1mBM8VjxRxLxfOytfZLf24tEIgB5ZFuSHvP/eHelRdQ/4T74LRasVrciC6VCbNg==
X-Received: by 2002:a63:224c:0:b0:46b:8e9:747 with SMTP id t12-20020a63224c000000b0046b08e90747mr1159323pgm.365.1668674450331;
        Thu, 17 Nov 2022 00:40:50 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b00186acb14c4asm693768plg.67.2022.11.17.00.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 00:40:49 -0800 (PST)
Message-ID: <81cd642f-c5fb-77ec-a634-5655d5b6088c@9elements.com>
Date:   Thu, 17 Nov 2022 14:10:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 3/3] hwmon: (max6639) Change from pdata to dt
 configuration
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        linux-pwm@vger.kernel.org
References: <20221116213615.1256297-1-Naresh.Solanki@9elements.com>
 <20221116213615.1256297-4-Naresh.Solanki@9elements.com>
 <20221117074510.qqtjc6h3bnh5rccx@pengutronix.de>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221117074510.qqtjc6h3bnh5rccx@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 17-11-2022 01:15 pm, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Nov 16, 2022 at 10:36:15PM +0100, Naresh Solanki wrote:
>> max6639_platform_data is not used by any in-kernel driver and does not
>> address the MAX6639 fans separately.
>> Move to device tree configuration with explicit properties to configure
>> each fan.
>>
>> Non-DT platform can still use this module with its default
>> configuration.
>>
>> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> 
> What changed here since v5? Please either add a changelog below the
> tripple-dash for a new revision, or make sure that all relevant people
> get the cover letter.
> 
> It seems you didn't address my comments for v5 :-\
Not sure what I missed but did following changes:
Removed unused header max6639.h
Used dev_err_probe instead,
Removed of_pwm_n_cells,
if condition for freq_table
removed pwm_get_state & instead use pwm->state
division/multiplication optimizations,
indentation of freq_table,

> 
> Best regards
> Uwe
> 

Thanks,
Naresh
