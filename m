Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4274BA60C
	for <lists+linux-hwmon@lfdr.de>; Thu, 17 Feb 2022 17:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241264AbiBQQfc (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 17 Feb 2022 11:35:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243263AbiBQQfb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Feb 2022 11:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5AA612B2E06
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Feb 2022 08:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645115716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c2fq/Ny4lMJaIMatRd00hK6MYEHazev14fwhUdBFReI=;
        b=f/ASZwQzKkhi9PI2IXiMlOH/VWH/XCCGOs7VRLaxRB5AN9aakkft+FdRpXXYfKevAeRNEW
        ERKS8xVi0c0Md21jYZVdHZgwONevVFkcFFq7y3qpMfp0ph+urYmKwnVjtwXCdv/hRQVjxJ
        I98EZGKbeJy/vS4J7pGdB6/QaIuVxWE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-Goo2CVAKNku-7M_VOElLuw-1; Thu, 17 Feb 2022 11:35:15 -0500
X-MC-Unique: Goo2CVAKNku-7M_VOElLuw-1
Received: by mail-ej1-f70.google.com with SMTP id o4-20020a170906768400b006a981625756so1804914ejm.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Feb 2022 08:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c2fq/Ny4lMJaIMatRd00hK6MYEHazev14fwhUdBFReI=;
        b=Da3POCATEOzPdW3AHQaOqIiHE4BOIKJFwqooCPHj05rr0C8PbAMlVwZCiXS+/rAND0
         BHWiOtq8BiSprbdMtaRIkb1zeebZK8P0T2iCklneODWWPytkYCo+ni/THLVUNnPzOtKX
         nBgRLRG/HEDvgI6XVbbP2oXzrViaRWjaEjVg1njaYV/aIvuAkB7EpmyZTgxoAjj4Dqpf
         sjji6annbuigIKdCJEaqxYO2DYESGQiwgLIgeEze4KznTTlK3c09BdvA1ac3n4Uk1G6E
         JXchtxJpHAidi/MLTUFY2oZ5PPQx3Bim+EmWqzF9Tj5WCBx0K3kJlt37bdj1nXdMtycd
         oXdQ==
X-Gm-Message-State: AOAM530zu+3kgdhKFiAbDwEBanSUods7cwmz8Xz6r/fvIj6R5/ooEsBn
        5rdwCLWJlAhly09Iq6qLw2afSci8O6IQlCER5+W/pacKu9zV89AGyKq3V8Owo51HzOcijeMOc88
        XVztdb2CBlbWvPhFUb6+GhC4=
X-Received: by 2002:a50:d79d:0:b0:410:82a0:5d76 with SMTP id w29-20020a50d79d000000b0041082a05d76mr3531292edi.130.1645115713910;
        Thu, 17 Feb 2022 08:35:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwy1XOj60hZ2Xgf9leB0ov3CtVqqw7iUj8h3GXaY1TNAUOjvJWy/8ifdMYStkE127/Ixy5g6A==
X-Received: by 2002:a50:d79d:0:b0:410:82a0:5d76 with SMTP id w29-20020a50d79d000000b0041082a05d76mr3531272edi.130.1645115713760;
        Thu, 17 Feb 2022 08:35:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id q5sm1319255ejc.115.2022.02.17.08.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 08:35:13 -0800 (PST)
Message-ID: <2482eae0-ad8c-3fda-1d0e-f8794c50192d@redhat.com>
Date:   Thu, 17 Feb 2022 17:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: Add Steam Deck driver
Content-Language: en-US
To:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20220206022023.376142-1-andrew.smirnov@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220206022023.376142-1-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2/6/22 03:20, Andrey Smirnov wrote:
> Add a driver exposing various bits and pieces of functionality
> provided by Steam Deck specific VLV0100 device presented by EC
> firmware. This includes but not limited to:
> 
>     - CPU/device's fan control
>     - Read-only access to DDIC registers
>     - Battery tempreature measurements
>     - Various display related control knobs
>     - USB Type-C connector event notification
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-kernel@vger.kernel.org (open list)
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

The .c file says: "Copyright (C) 2021-2022 Valve Corporation", yet
you use a personal email address here. This is not really a problem,
but it does look a bit weird.

> ---
> 
> This driver is really a kitchen sink of various small bits. Maybe it
> is worth splitting into an MFD + child drivers/devices?

With the extcon stuff thrown in the mix I think you definitely should
go for using MFD here.

Then you can submit a MFD driver under drivers/mfd for registering the
regmap + the cells + separate extcon + LED + backlight + hwmon drivers to
their resp. subsystems.

As drivers/platform/x86/ maintainer I would be happy to take a driver
for a "misc" cell for any remaining bits if there are any...

<snip>

> +struct steamdeck {
> +	struct acpi_device *adev;
> +	struct device *hwmon;
> +	void *regmap;

That should be:

	struct regmap *regmap;


> +	long fan_target;
> +	struct delayed_work role_work;
> +	struct extcon_dev *edev;
> +	struct device *dev;
> +};

Regards,

Hans

