Return-Path: <linux-hwmon+bounces-2341-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4118D4C61
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 May 2024 15:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EC6D1C2116F
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 May 2024 13:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3480E183069;
	Thu, 30 May 2024 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJaIhvVM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453C1822C9;
	Thu, 30 May 2024 13:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075130; cv=none; b=sOTy6It2FhakQCGvxriKzUnqA3Jit6SvJMz1Sgkl6+pk0Ti4jVOciMLpiaIXhMhJy3nNAT9ciF4xHob7TkRGeYJC2KUT2YhYez9mVtZGKNemaNE4DZHqCdmA1krMMpHHyp29JNGogMmQeBoymguZODM+IDms8OzCNHuGLWTrjb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075130; c=relaxed/simple;
	bh=b28buw1btRAuL7SbJLBXmKfKT3mWhDBWLF+RNL+wTOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVz0EwgLTCEIBaymqeu2FZBTWewpeZ6/fSKktfmEZqWtZWZ1kkJktxoMECLSfL//UYTTY/LsWMvBoZJzM18jP4e9gVShRkkAdhU4Dhj9ueWGtT0ixZq2rv+OoTu3ca2O83Wc+E5p5r8kCGrOJgicZt94va2r+MODAtjWQ4XMH9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJaIhvVM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70109d34a16so777515b3a.2;
        Thu, 30 May 2024 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717075128; x=1717679928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IVPNiEXzmx65xEj1RXanIjHuIiAyn9iMcPqIdkLfhZs=;
        b=gJaIhvVMkbpmn7f2qh0DbBC2rRguTO1eJ62zxPKQCYVsCgqhofSFRcgHwjWe6LjCl3
         Cp3mHJSs90XjEpeqRUj7AGBNEx36PuTkih1egzzLWvbeo9qURVvDueiDAIU4xV40mJbr
         v4wfB+ADxFkI6jBsrKKLPtKA9HaW0sjh9Crd6u7WVa8Z1yHZ0BNBlEgV342ByJBkpIrV
         LhrqHLjBCXdQTx9zxpXahYrDG4MrpKadSMK6i1VEY5iKhIoOSw5bfrtvx9U1y6IV6vK2
         7C9plUjARfAiUONezeKzUTLwVFsmpVwLMKUf5Vl/nwZantL4dPEZgClDBtAbvsOReDQ+
         fHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717075128; x=1717679928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVPNiEXzmx65xEj1RXanIjHuIiAyn9iMcPqIdkLfhZs=;
        b=CNbLacOkgBHfi/BSfR1wXp8923YN1ZZoJn+JIoz+K8DPPeg6ioYGvUIgZ53vWasMjs
         SF4JyaJcnL0bHnOuHJ+2E1XhXK8oRUGbtaaR0QRnTRfwLXet4SvpqVbmm80wdpK3n7nk
         YNx+wpfcqpM/kOkx7Kuc8cwuA7TBSRZD79zrWv9qLmd8l7aOWg+08gVfidSU25JwQvQz
         0wqMTXjRcpZ8LMXAQro5JcuDg7DzkPXWXIVKsX4JTbsGVDMm2r7n23zPGld4m6u5e7Wk
         V02An410ULn7lyRVpo43jab1lAdUZzFDJVweV49iD1tdeshDq91NoAxyP769Oc8+7GJa
         LbqA==
X-Forwarded-Encrypted: i=1; AJvYcCUTm41rd1XE+45Um2KXaWITWy9oaU1fhzcplmavrSRGDJyfa/Tw+Abf9wRuWIqq66DdyO3MsY/yh1TyHp9dXASBr/Ftqs6yLH9qtWfnH2AVxr4L3smSqaNakAC4nhF6Vk6k489xFyxDhcZhYUbqd7R5Qs7TDTu0HJa3LZB70XexGt9lPCXS
X-Gm-Message-State: AOJu0YyzqEdixmYaofP0K2ltJvXIkjwd3+XT5UpGq8YIcdQ9ilkFLFSu
	a3EuG2f/i+nlEhbyWIAcnZQFMG77rbrHz82/Atp9MwhtlY6XdQJv
X-Google-Smtp-Source: AGHT+IHln+M7fyb1pw+lgsuIJVJgzO4DZtbl62ztEggDxI/iChghcqlSc3vqsKZouCyLEyTLrC310A==
X-Received: by 2002:a05:6a00:440f:b0:6e8:f66f:6b33 with SMTP id d2e1a72fcca58-702310dd7d2mr2010772b3a.4.1717075127525;
        Thu, 30 May 2024 06:18:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702388e4a59sm757208b3a.84.2024.05.30.06.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:18:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4c18f6ed-2736-4675-9ed3-042491da01ad@roeck-us.net>
Date: Thu, 30 May 2024 06:18:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (ina2xx) Add device tree support to pass alert
 polarity
To: Amna Waseem <Amna.Waseem@axis.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@axis.com
References: <20240529-apol-ina2xx-fix-v1-0-77b4b382190f@axis.com>
 <20240529-apol-ina2xx-fix-v1-2-77b4b382190f@axis.com>
 <6f2d2e7e-99b4-4f5d-a2c5-523b5534917b@roeck-us.net>
 <08921791-452a-4bb1-950c-2dd7747a1d14@axis.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <08921791-452a-4bb1-950c-2dd7747a1d14@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/24 01:06, Amna Waseem wrote:
> On 5/29/24 16:07, Guenter Roeck wrote:
>> On 5/28/24 23:07, Amna Waseem wrote:
>>> The INA230 has an Alert pin which is asserted when the alert
>>> function selected in the Mask/Enable register exceeds the
>>> value programmed into the Alert Limit register. Assertion is based
>>> on the Alert Polarity Bit (APOL, bit 1 of the Mask/Enable register).
>>> It is default set to value 0 i.e Normal (active-low open collector).
>>> However, hardware can be designed in such a way that expects Alert pin
>>> to become active high if a user-defined threshold in Alert limit
>>> register has been exceeded. This patch adds a way to pass alert polarity
>>> value to the driver via device tree.
>>>
>>> Signed-off-by: Amna Waseem <Amna.Waseem@axis.com>
>>> ---
>>>   drivers/hwmon/ina2xx.c | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
>>> index d8415d1f21fc..b58e795bdc8f 100644
>>> --- a/drivers/hwmon/ina2xx.c
>>> +++ b/drivers/hwmon/ina2xx.c
>>> @@ -73,6 +73,9 @@
>>>   #define INA226_READ_AVG(reg)        (((reg) & INA226_AVG_RD_MASK) >> 9)
>>>   #define INA226_SHIFT_AVG(val)        ((val) << 9)
>>>   +#define INA226_ALERT_POLARITY_MASK        0x0002
>>> +#define INA226_SHIFT_ALERT_POLARITY(val)    ((val) << 1)
>>> +
>>>   /* bit number of alert functions in Mask/Enable Register */
>>>   #define INA226_SHUNT_OVER_VOLTAGE_BIT    15
>>>   #define INA226_SHUNT_UNDER_VOLTAGE_BIT    14
>>> @@ -178,6 +181,23 @@ static u16 ina226_interval_to_reg(int interval)
>>>       return INA226_SHIFT_AVG(avg_bits);
>>>   }
>>>   +static int ina2xx_set_alert_polarity(struct ina2xx_data *data,
>>> +                     unsigned long val)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (val > INT_MAX || !(val == 0 || val == 1))
>>
>>     if (val != 0 && val !=1)
>>
>> would be sufficient and much easier to understand.
> 
> 
> Agreed.
> 
>>
>>> +        return -EINVAL;
>>> +
>>> +    mutex_lock(&data->config_lock);
>>
>> Pointless lock.
>>
>>> +    ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
>>> +                 INA226_ALERT_POLARITY_MASK,
>>> +                 INA226_SHIFT_ALERT_POLARITY(val));
>>> +
>>> +    mutex_unlock(&data->config_lock);
>>> +    return ret;
>>> +}
>>> +
>>>   /*
>>>    * Calibration register is set to the best value, which eliminates
>>>    * truncation errors on calculating current register in hardware.
>>> @@ -659,6 +679,14 @@ static int ina2xx_probe(struct i2c_client *client)
>>>       if (ret)
>>>           return dev_err_probe(dev, ret, "failed to enable vs regulator\n");
>>>   +    if (!of_property_read_u32(dev->of_node, "alert-polarity", &val)) {
>>> +        ret = ina2xx_set_alert_polarity(data, val);
>>> +        if (ret < 0)
>>> +            return dev_err_probe(
>>> +                dev, ret,
>>> +                "failed to set APOL bit of Enable/Mask register\n");
>>> +    }
>>
>> INA219 and INA220 do not support alert pin configuration (or, naturally,
>> the mask register in the first place). This will need to be validated.
>>
>> Guenter
>>
> Would "of_property_read_bool" be sufficient to check whether the property exists or not for different chips? It means that if INA219 and INA220 are being used, they will not have a property "alert-polarity" defined in their devicetree so of_property_read_bool will return false and nothing will happen for these chips.
> 

No, that would not be sufficient, because the non-existence of the property
also has a meaning and still should be used to set the polarity.

You have two options: Not evaluate the property in the first place if
the chip doesn't support it, or return an error if the property exists
but the chip does not support it. Personally I'd go the easy route;
something like

	if (chip supports it) {
		ret = ina2xx_set_alert_polarity(dev, regmap);
		if (ret)
			return dev_err_probe(...);
	}

and evaluate the property in ina2xx_set_alert_polarity().

Guenter


