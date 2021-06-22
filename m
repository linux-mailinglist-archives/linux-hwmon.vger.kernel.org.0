Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAA53B048E
	for <lists+linux-hwmon@lfdr.de>; Tue, 22 Jun 2021 14:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhFVMeX (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 22 Jun 2021 08:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45214 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231956AbhFVMeS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Jun 2021 08:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624365122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vP7JF6KY1/ahu18Tz6/GObDLrGSrV/SofAI1KrpMPF4=;
        b=AA+F5ILI95fQR5WCMROFXT3L+UISvkKHtqoShKsHXj89miH6K6NJLwtyu8ZGhbA3YfOBI8
        nAOqoiVMMUtZv8GJMa7ohZn8EhVaFtqPfKVW7ep2Am0kwaC7L5+hk+X8WPwnn0GAabqO6W
        G8GYT/D8rv1X2A8Liev11ZnJHSGAz0o=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-7_wnne6TM4eUof3bbAUlsQ-1; Tue, 22 Jun 2021 08:32:01 -0400
X-MC-Unique: 7_wnne6TM4eUof3bbAUlsQ-1
Received: by mail-ot1-f72.google.com with SMTP id 108-20020a9d0bf50000b02903d55be6ada3so11009901oth.22
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Jun 2021 05:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vP7JF6KY1/ahu18Tz6/GObDLrGSrV/SofAI1KrpMPF4=;
        b=CNoALp+JoIo5IUfMJXACCbnRYYZRxDEd+3K5VzM/YIMnurlel9Mgm/AcOT2UIpUWD8
         VZB2mNXKWGNwktncciKDXEPAdUppq10eIij5SgpbUDcBXJ7iIGTM5UFs9Zp7WfbsJMQo
         aDCKZcMOggD9h4ui0j3POtb1j3OK2OAuZUiw56mjixguIB6u+syuc8mH3k+X6CD/TIVk
         ivDeES/Z6v5kjUMpNvoIeRd+muE11W2F7Bitb7N4Wsk8Q2z0WAb9johspiKI1BHuTI6G
         sjkb2p80tFIGBBlBH2+xAqWF/G/ULO/sGBvjyrHIa3wm3bYTSWphvW/aYorU9Satuwk1
         d7hg==
X-Gm-Message-State: AOAM533+15KH5okxhIV9MG2YDx8F1ELv8RaJubyIyLNlY45OlPQ4B4FD
        LbitH+NTYs4dNgK8fqm6uZkqXMyfCcmmgKI5DUBhuIMBdiVovCcgRaqjh1eRX67kM69T4tr2c6l
        nWoCi1p4Re1pob/MgYIwIoqI=
X-Received: by 2002:a54:4694:: with SMTP id k20mr3030301oic.134.1624365120365;
        Tue, 22 Jun 2021 05:32:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8IUtPHHs01259DCSqd8l9v2KUFLEpzLtTrLK2iyrtXZYfJpqcLl9xh2coGZ1Y7YXxQNxOVQ==
X-Received: by 2002:a54:4694:: with SMTP id k20mr3030276oic.134.1624365120167;
        Tue, 22 Jun 2021 05:32:00 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b2sm2613572oic.56.2021.06.22.05.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 05:31:59 -0700 (PDT)
Subject: Re: [PATCH 2/4] fpga: dfl: Move DFH header register macros to
 linux/dfl.h
To:     Xu Yilun <yilun.xu@intel.com>
Cc:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mhu@silicom.dk>,
        Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mhu@geanix.com>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org,
        Debarati Biswas <debaratix.biswas@intel.com>,
        Russ Weight <russell.h.weight@intel.com>
References: <20210621070621.431482-1-mhu@silicom.dk>
 <20210621070621.431482-3-mhu@silicom.dk>
 <81975a85-e9d6-bd4b-7666-56d1d1d581bc@redhat.com>
 <20210622045613.GA27046@yilunxu-OptiPlex-7050>
From:   Tom Rix <trix@redhat.com>
Message-ID: <d74f6e17-0fe2-bd18-de53-18181424db82@redhat.com>
Date:   Tue, 22 Jun 2021 05:31:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210622045613.GA27046@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 6/21/21 9:56 PM, Xu Yilun wrote:
> On Mon, Jun 21, 2021 at 06:56:28AM -0700, Tom Rix wrote:
>> On 6/21/21 12:06 AM, Martin Hundebøll wrote:
>>> From: Debarati Biswas <debaratix.biswas@intel.com>
>>>
>>> Device Feature List (DFL) drivers may be defined in subdirectories other
>>> than drivers/fpga, and each DFL driver should have access to the Device
>>> Feature Header (DFH) register, which contains revision and type
>>> information. This change moves the macros specific to the DFH register
>>> from drivers/fpga/dfl.h to include/linux/dfl.h.
>>>
>>> Signed-off-by: Debarati Biswas <debaratix.biswas@intel.com>
>>> Signed-off-by: Russ Weight <russell.h.weight@intel.com>
>>> Signed-off-by: Martin Hundebøll <mhu@silicom.dk>
>>> ---
>>>    drivers/fpga/dfl.h  | 48 +----------------------------------------
>>>    include/linux/dfl.h | 52 +++++++++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 53 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/drivers/fpga/dfl.h b/drivers/fpga/dfl.h
>>> index 2b82c96ba56c..6ed0353e9a99 100644
>>> --- a/drivers/fpga/dfl.h
>>> +++ b/drivers/fpga/dfl.h
>>> @@ -17,6 +17,7 @@
>>>    #include <linux/bitfield.h>
>> bitfield.h was added to linux/dfl.h
>>
>> Likely both aren't needed, try removing this one.
> The DFL register definitions are in dfl.h, and Source files which include
> dfl.h are likely to use bitfield ops for DFL register access, so could we
> keep it here?

Not sure which dfl.h you mean.

It looks like you are copying header includes in both files and 
including the one file in the other.

So it is likely you are including headers you don't need.

Tom

>
> Thanks,
> Yilun
>
>> Tom
>>
>>>    #include <linux/cdev.h>
>>>    #include <linux/delay.h>
>>> +#include <linux/dfl.h>
>>>    #include <linux/eventfd.h>
>>>    #include <linux/fs.h>
>>>    #include <linux/interrupt.h>
>>> @@ -53,32 +54,6 @@
>>>    #define PORT_FEATURE_ID_UINT		0x12
>>>    #define PORT_FEATURE_ID_STP		0x13
>>> -/*
>>> - * Device Feature Header Register Set
>>> - *
>>> - * For FIUs, they all have DFH + GUID + NEXT_AFU as common header registers.
>>> - * For AFUs, they have DFH + GUID as common header registers.
>>> - * For private features, they only have DFH register as common header.
>>> - */
>>> -#define DFH			0x0
>>> -#define GUID_L			0x8
>>> -#define GUID_H			0x10
>>> -#define NEXT_AFU		0x18
>>> -
>>> -#define DFH_SIZE		0x8
>>> -
>>> -/* Device Feature Header Register Bitfield */
>>> -#define DFH_ID			GENMASK_ULL(11, 0)	/* Feature ID */
>>> -#define DFH_ID_FIU_FME		0
>>> -#define DFH_ID_FIU_PORT		1
>>> -#define DFH_REVISION		GENMASK_ULL(15, 12)	/* Feature revision */
>>> -#define DFH_NEXT_HDR_OFST	GENMASK_ULL(39, 16)	/* Offset to next DFH */
>>> -#define DFH_EOL			BIT_ULL(40)		/* End of list */
>>> -#define DFH_TYPE		GENMASK_ULL(63, 60)	/* Feature type */
>>> -#define DFH_TYPE_AFU		1
>>> -#define DFH_TYPE_PRIVATE	3
>>> -#define DFH_TYPE_FIU		4
>>> -
>>>    /* Next AFU Register Bitfield */
>>>    #define NEXT_AFU_NEXT_DFH_OFST	GENMASK_ULL(23, 0)	/* Offset to next AFU */
>>> @@ -403,27 +378,6 @@ struct device *dfl_fpga_pdata_to_parent(struct dfl_feature_platform_data *pdata)
>>>    	return pdata->dev->dev.parent->parent;
>>>    }
>>> -static inline bool dfl_feature_is_fme(void __iomem *base)
>>> -{
>>> -	u64 v = readq(base + DFH);
>>> -
>>> -	return (FIELD_GET(DFH_TYPE, v) == DFH_TYPE_FIU) &&
>>> -		(FIELD_GET(DFH_ID, v) == DFH_ID_FIU_FME);
>>> -}
>>> -
>>> -static inline bool dfl_feature_is_port(void __iomem *base)
>>> -{
>>> -	u64 v = readq(base + DFH);
>>> -
>>> -	return (FIELD_GET(DFH_TYPE, v) == DFH_TYPE_FIU) &&
>>> -		(FIELD_GET(DFH_ID, v) == DFH_ID_FIU_PORT);
>>> -}
>>> -
>>> -static inline u8 dfl_feature_revision(void __iomem *base)
>>> -{
>>> -	return (u8)FIELD_GET(DFH_REVISION, readq(base + DFH));
>>> -}
>>> -
>>>    /**
>>>     * struct dfl_fpga_enum_info - DFL FPGA enumeration information
>>>     *
>>> diff --git a/include/linux/dfl.h b/include/linux/dfl.h
>>> index 6cc10982351a..1cd86b2e7cb1 100644
>>> --- a/include/linux/dfl.h
>>> +++ b/include/linux/dfl.h
>>> @@ -8,7 +8,9 @@
>>>    #ifndef __LINUX_DFL_H
>>>    #define __LINUX_DFL_H
>>> +#include <linux/bitfield.h>
>>>    #include <linux/device.h>
>>> +#include <linux/io.h>
>>>    #include <linux/mod_devicetable.h>
>>>    /**
>>> @@ -83,4 +85,54 @@ void dfl_driver_unregister(struct dfl_driver *dfl_drv);
>>>    	module_driver(__dfl_driver, dfl_driver_register, \
>>>    		      dfl_driver_unregister)
>>> +/*
>>> + * Device Feature Header Register Set
>>> + *
>>> + * For FIUs, they all have DFH + GUID + NEXT_AFU as common header registers.
>>> + * For AFUs, they have DFH + GUID as common header registers.
>>> + * For private features, they only have DFH register as common header.
>>> + */
>>> +#define DFH                     0x0
>>> +#define GUID_L                  0x8
>>> +#define GUID_H                  0x10
>>> +#define NEXT_AFU                0x18
>>> +
>>> +#define DFH_SIZE                0x8
>>> +
>>> +/* Device Feature Header Register Bitfield */
>>> +#define DFH_ID                  GENMASK_ULL(11, 0)      /* Feature ID */
>>> +#define DFH_ID_FIU_FME          0
>>> +#define DFH_ID_FIU_PORT         1
>>> +#define DFH_REVISION            GENMASK_ULL(15, 12)
>>> +#define DFH_NEXT_HDR_OFST       GENMASK_ULL(39, 16)     /* Offset to next DFH */
>>> +#define DFH_EOL                 BIT_ULL(40)             /* End of list */
>>> +#define DFH_TYPE                GENMASK_ULL(63, 60)     /* Feature type */
>>> +#define DFH_TYPE_AFU            1
>>> +#define DFH_TYPE_PRIVATE        3
>>> +#define DFH_TYPE_FIU            4
>>> +
>>> +/* Function to read from DFH and check if the Feature type is FME */
>>> +static inline bool dfl_feature_is_fme(void __iomem *base)
>>> +{
>>> +	u64 v = readq(base + DFH);
>>> +
>>> +	return (FIELD_GET(DFH_TYPE, v) == DFH_TYPE_FIU) &&
>>> +		(FIELD_GET(DFH_ID, v) == DFH_ID_FIU_FME);
>>> +}
>>> +
>>> +/* Function to read from DFH and check if the Feature type is port*/
>>> +static inline bool dfl_feature_is_port(void __iomem *base)
>>> +{
>>> +	u64 v = readq(base + DFH);
>>> +
>>> +	return (FIELD_GET(DFH_TYPE, v) == DFH_TYPE_FIU) &&
>>> +		 (FIELD_GET(DFH_ID, v) == DFH_ID_FIU_PORT);
>>> +}
>>> +
>>> +/* Function to read feature revision from DFH */
>>> +static inline u8 dfl_feature_revision(void __iomem *base)
>>> +{
>>> +	return (u8)FIELD_GET(DFH_REVISION, readq(base + DFH));
>>> +}
>>> +
>>>    #endif /* __LINUX_DFL_H */

