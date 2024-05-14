Return-Path: <linux-hwmon+bounces-2142-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E4B8C59D9
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 May 2024 18:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085AC28244C
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 May 2024 16:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637C11581E0;
	Tue, 14 May 2024 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hkpc2g2X"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C22D2AF09;
	Tue, 14 May 2024 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715705052; cv=none; b=j2YPetC8/z4s8Kr1w1vurpYFCzkla9aePEcY63ImCkirMB4vTcW4MgAnHxY6kmYAw0ZHSZ9InrOjff3yURYma6GFbuPgPuz+SrarFkHF4VivZKNaS/3aERKwnaAqJ5GgMWnVdUBEO6g5mrxDyD6h+MT3zCTag2w/Q5YkJl5uE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715705052; c=relaxed/simple;
	bh=TF6OcNMMClZDu0+KfMH2AcPi5DjWoWCLW6YTjXSjd6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZN+q0wkp+rnJ3qtZM2FgIc96EVvSPN2YcOs6fN20vc1o6iFBnAlQFDykqZip7nwD/pcD0YVcg6wrRUzQgIGK1Aj/e/E9pXx+tMaaHnHsS5/8o6v+PWkIj7rUkXNOMAhk0ITwQ7M2ZGFFgczuKl7F9rUl7UZfaGic8ailhA0ay8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hkpc2g2X; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ee5235f5c9so45048765ad.2;
        Tue, 14 May 2024 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715705049; x=1716309849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ybj1VVny4pX1Hop1gzKlQUO6BxWECSsxknSFeM7x8Fk=;
        b=Hkpc2g2XcZD+nS42lVWQNHgnAtupZ9trRsK+dN1kM2xEBROpNPjEo/IB4PL84W8Hs8
         Acq6GbunUovX5mKfoGTi6rOFSk5nKPKm2+t/49/UP9KzAMVxwmBGFnMAsmujdYJnkOOq
         Taz5apSgH6eVyFXJIZpQPR2T8Ww1jL+aGPwfR56TQJm+LDk/IsPow7QpwXjNmCHh4NeM
         CF1ocxx/5UuZYk5e8oj3Zl/EnfUiNKEdwdVj4U5iAaPMaOAzt7eKtJ92uOZagkcGoRd3
         ZRfbrS8snAQ+omP6TWZJJf6/ArZm6puNJKMhKHjWu8jh8aiv+4L/PV8r0wAx8YW7cMiM
         1UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715705049; x=1716309849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ybj1VVny4pX1Hop1gzKlQUO6BxWECSsxknSFeM7x8Fk=;
        b=dQb28QpPJPoKG+BOCEkaJbb2lJMPLcf/COU5yDkBnfwfFxB9Xp5LLcLVny+aka3IRO
         c2FqsYTsyyv2hoVZfza5S7woLQLunrtAR04jS7DWg6KqbEQUYwbv0RUOAzgbRp1cbYFi
         qi/ZFf7AEyOS9QRy2Obq2d27Hyj0KGhANyKqGy1OgzQai1cHYzzASlRSF9gCimX50RhG
         eFVmbg1UlYSslyVj/9IQ2BIpbyyFMH7YShLzGikR6/45aeL3FK8XA9hoChfrcLBbUIAM
         T2sHLbY6DkhzumljvevYWiNpYB8b6oW+evFX5EC67uYkdQFKksQ3FKG0/MEPH/s/+o6u
         aoGg==
X-Forwarded-Encrypted: i=1; AJvYcCUFJjdyHP7lCc8N0/7ktEBNZpwvex/ULNNF5RuEhl0E1RvyOKfg897o9/I1dRmWeGp6lV8fGMFv8G0Bujp+XZFTnniQRNtcu3NTexhMXJKetmft8WEOTpSruQUVdHsaLch4JEzpW847HTc=
X-Gm-Message-State: AOJu0YyFvC1iOfz8iGsNQ5H4QK3hZoVwTDIWMe4joOD3+xyJbVu2nGcZ
	5cSgo/CTMmoJOrC7mrY8xQne/tyoh7aPydsmoQPMORKaqhLoGBdUh8PVjA==
X-Google-Smtp-Source: AGHT+IHiMRG8Tkxf0VO5nt3Qj/oDCKfWMbKP9GknWc+aPJSm110qM5xstBNtw78csZRUDnESSDZFBQ==
X-Received: by 2002:a17:903:228f:b0:1eb:152a:5a6e with SMTP id d9443c01a7336-1ef43c0c9b5mr178366915ad.3.1715705048765;
        Tue, 14 May 2024 09:44:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0badcae8sm99628805ad.103.2024.05.14.09.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 09:44:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <183b8b2a-625e-495d-a443-c57e68ae758f@roeck-us.net>
Date: Tue, 14 May 2024 09:44:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add support for ina233
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240514092242.2739662-1-Delphine_CC_Chiu@wiwynn.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240514092242.2739662-1-Delphine_CC_Chiu@wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/14/24 02:22, Delphine CC Chiu wrote:
> Support ina233 with vshunt
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---

I don't understand what you are doing here. The patch introducing ina233
support was not accepted, still waiting for you to apply the changes
I asked for. This is v2, which doesn't really add support for ina233
but adds a non-standard attribute on top of the not accepted patch.

As for reporting the shunt voltage, I don't mind, but it should be
reported as standard attribute. The pmbus core supports reporting
a "VMON" voltage (PMBUS_VIRT_READ_VMON) which you should use. I am not
going to accept a non-standard attribute to report a voltage.

Thanks,
Guenter

>   drivers/hwmon/pmbus/ina233.c | 37 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
> index d5c7d7408ac3..33736e5049a9 100644
> --- a/drivers/hwmon/pmbus/ina233.c
> +++ b/drivers/hwmon/pmbus/ina233.c
> @@ -11,9 +11,43 @@
>   #include <linux/init.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/hwmon-sysfs.h>
>   #include "pmbus.h"
>   
>   #define MFR_CALIBRATION	0xd4
> +#define MFR_READ_VSHUNT 0xd1
> +
> +#define HIGHEST_BIT 15
> +
> +static ssize_t ina233_vshunt_show(struct device *dev,
> +				  struct device_attribute *devattr, char *buf)
> +{
> +	int shunt_volt;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +
> +	shunt_volt = i2c_smbus_read_word_data(client, MFR_READ_VSHUNT);
> +	if (shunt_volt < 0)
> +		return shunt_volt;
> +
> +	// Is negative
> +	if (shunt_volt & (1 << HIGHEST_BIT))
> +		shunt_volt = ~(shunt_volt & ~(1 << HIGHEST_BIT)) + 1;
> +
> +	// This unit is mV.
> +	// LSB 2.5 μV is reference from spec 7.6.3.2 MFR_READ_VSHUNT
> +	int val = DIV_ROUND_UP(shunt_volt * 25, 10000);
> +
> +	return sysfs_emit(buf, "%d\n", val);
> +}
> +
> +static SENSOR_DEVICE_ATTR_RO(vshunt, ina233_vshunt, 1);
> +
> +static struct attribute *ina233_attrs[] = {
> +	&sensor_dev_attr_vshunt.dev_attr.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(ina233);
>   
>   struct pmbus_driver_info ina233_info = {
>   	.pages = 1,
> @@ -29,6 +63,7 @@ struct pmbus_driver_info ina233_info = {
>   	.m[PSC_VOLTAGE_OUT] = 8,
>   	.R[PSC_VOLTAGE_IN] = 2,
>   	.R[PSC_VOLTAGE_OUT] = 2,
> +	.groups = ina233_groups,
>   };
>   
>   static int ina233_probe(struct i2c_client *client)
> @@ -82,7 +117,7 @@ static struct i2c_driver ina233_driver = {
>   
>   module_i2c_driver(ina233_driver);
>   
> -MODULE_AUTHOR("Eli Huang <eli_huang@wiwynn.com>");
> +MODULE_AUTHOR("Delphine_CC_Chiu <Delphine_CC_Chiu@wiwynn.com>");
>   MODULE_DESCRIPTION("PMBus driver for Texas Instruments INA233 and compatible chips");
>   MODULE_LICENSE("GPL");
>   MODULE_IMPORT_NS(PMBUS);


