Return-Path: <linux-hwmon+bounces-4236-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9228797DD8B
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Sep 2024 17:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B48C61C20C0C
	for <lists+linux-hwmon@lfdr.de>; Sat, 21 Sep 2024 15:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8225172BD0;
	Sat, 21 Sep 2024 15:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+dSBOWR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1816DEDF;
	Sat, 21 Sep 2024 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726932167; cv=none; b=KlWUsz1Zw9MInscyPR/MFSK6Bh1Lo1it+FddLTtJSnSU4aaveKGU14B7F11Podq5y7nZg0gwThnVZHZBZyhLUxdv4a368NgOVzqj1e+2Y54GPotXiNgF1Rul5LfCgScTbP+axdKIVVrjBbfbSK7Pnqnd/AY+bn0N3kL3deinKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726932167; c=relaxed/simple;
	bh=WQ6yDW7b2tKjPVQ62ud6jDohOYs1KFZBIqI0ZrtJf3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puLt0GOwj4C68bHCpXPga54nseLS+BMIiBn2X+/7tGmrPSdrbPd0xt0n8QMfhVhfysSMGN+m3/qSxs/hLS82GL+pY4yosUaSnNGPlT0R2QzyYbNpZQPKTEasEZ4ZTIWFdMxtemFG3Iy4tT+LbZpp9z39T0WtP3rRKTo1/ihyKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+dSBOWR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-719858156f4so2430487b3a.3;
        Sat, 21 Sep 2024 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726932165; x=1727536965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qItMsRsUonNcWrShZdDYD2bs8bIb2HIyKSV/onxmju4=;
        b=P+dSBOWRxuzvEhT5J1M9LCJ7cOxutuBYoTSnXBfB/Lxv5W5d7reXuxrzVBRGh1yaZA
         RtG0xt6ZD3sLaqXcI+fMLK2qAju2zjpSzN01VNZO4ZuYeMKDvjui9WG70ll0jWxR9DUK
         Sk4V0asPiD6/LpBBFMqXxiHYkmwLiv/C/PnrIP4b0q0f8DcPiZSzYX/H2qhNcNPQZpXL
         smNrHWEOXxQtWZ9BgAbEqs8q3umPL2jeH5mn0ob7mLNZxbVGmgbAXljKnaEnKvkONPk6
         tgQPHhIEcePRaXRN09j9PL87viIVufCycklX5yvilVFxsmeeEbhSKxV2+vM2Uc3GpZ8d
         NPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726932165; x=1727536965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qItMsRsUonNcWrShZdDYD2bs8bIb2HIyKSV/onxmju4=;
        b=APV8fOKDKzX5asBUBaF04dRanaKdNQOXLZSRzeenPjbbtv59dDXb+wMnXTJG1ZU0CL
         cBJ2wVYpzGGIzzXt/6cCYCcpj+vtzXgAeWFQEsgdnbAKX/CmbrZaLTBQ9+/HTovgMCpR
         vK3HuaWPEHbPwpBFPhPfLpPX1lR3oVbPJT/rFF/E/VltzeFdnIwPLMdVaGEEPZZQ6ZFQ
         irUFvWNXxYW56oheZ9WJQAQdnQ47kphxbhdBPUIYC+3Gv0GC4YbNFeF8154qWjR75u/t
         i8svdBmsf2PZbmQ7dC/Vkeo2RD3AHQCzjRcGCYcg3CnuulSURupl5qWDMQV92PisTHZE
         BXJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZTAqY8ykCeemwPnoG0OhzRagXfAPNAo8aJUfw3fgatDwCn64UqHaTrwGeswb38LZo3hLAWTL/fs=@vger.kernel.org, AJvYcCWkYluDSIk42WGjniwzYsGlA5j48gXzX2H8mL9An1/7XDhOJITZC4wPMdaL3Ph6TPfxZ6Yil43VB5lUogaa@vger.kernel.org, AJvYcCX1mETJFxFGLzVpdj2D0Rebp4xISOLMYof6DtM6WWHixa20VMVQaKj8mUuVqXY/P0fZ0WEdrVui0aCOTlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzskZ7BrchnIp5hcUBTEasYIghu5d3+qbspsEYmWS55MIYtMg
	Nf5BSsHsSISZp1yP98E6EgK+koWsAdfWwZ0rs8XG/v6SNHdETl9f
X-Google-Smtp-Source: AGHT+IFDe0HMTvo456NwCylAzGuOFcCVtZC7psj+pzFjX+o0ryxZt21ezalR4E+rZbHWDXvXXvlgRA==
X-Received: by 2002:aa7:8891:0:b0:717:8d5d:94d6 with SMTP id d2e1a72fcca58-7199c9596efmr8703928b3a.12.1726932164896;
        Sat, 21 Sep 2024 08:22:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944abb7a0sm11400482b3a.73.2024.09.21.08.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Sep 2024 08:22:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2f3cec6e-7b05-4510-8c62-244ed114ad17@roeck-us.net>
Date: Sat, 21 Sep 2024 08:22:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hwmon: (pmbus/core) improve handling of write
 protected regulators
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
 <20240920-pmbus-wp-v1-4-d679ef31c483@baylibre.com>
 <4052294e-7b7f-4238-9b47-92727de4d516@roeck-us.net>
 <1jsettz1hh.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1jsettz1hh.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/24 04:32, Jerome Brunet wrote:
> On Fri 20 Sep 2024 at 14:13, Guenter Roeck <linux@roeck-us.net> wrote:
[ ... ]

>>>    +int pmbus_regulator_init_cb(struct regulator_dev *rdev,
>>> +			    struct regulator_config *config)
>>> +{
>>> +	struct pmbus_data *data = config->driver_data;
>>> +	struct regulation_constraints *constraints = rdev->constraints;
>>> +
>>> +	if (data->flags & PMBUS_OP_PROTECTED)
>>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
>>> +
>>> +	if (data->flags & PMBUS_VOUT_PROTECTED)
>>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_VOLTAGE;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, PMBUS);
>>> +
>>
>> I am a bit at loss trying to understand why the constraints can't be passed
>> with the regulator init_data when registering the regulator. Care to explain ?
> 
> Sure it something I found while working the problem out.
> 
> Simply put:
>   * you should be able to, in theory.
>   * currently it would not work
>   * when fixed I think it would still be more complex to do so.
> 
> ATM, if you pass init_data, it will be ignored on DT platforms in
> favor of the internal DT parsing of the regulator framework. The DT
> parsing sets REGULATOR_CHANGE_STATUS as long as the always-on prop is
> not set ... including for write protected regulator obviously.
> 

If the chip is read-only, I'd argue that the always-on property should
be set in devicetree. After all, that is what it is if the chip is
in read-only state. In other words, if always-on is _not_ set in
regulator constraints, I'd see that as request to override write-protect
in the driver if there is a change request from regulator code.

> This is something that might get fix with this change [1]. Even with that
> fixed, passing init_data systematically would be convenient only if you
> plan on skipping DT provided constraints (there are lot of those), or
> redo the parsing in PMBus.
> 

I disagree. I am perfectly fine with DT overriding constraints provided
by the driver. The driver can provide its own constraints, and if dt
overrides them, so be it. This is not different to the current code.
The driver provides a variety of limits to the regulator core.
If dt says "No, I don't believe that the minimum voltage is 1.234V, I
insist that it is 0.934V", it is not the driver's fault if setting
the voltage to anything below 1.234V fails. I would actually argue
that this is intentional, and that the driver should not on its own
try to override values provided through devicetree. After all, this
is a two-way problem: Devicetree may also limit voltage or current
ranges to less than the range reported by the driver.

Again, if devicetree provides constraints, and those do not include
the always-on property, we should see that as request to override any
chip write protection in the driver while the command is executed.
We should not try to override devicetree constraints.

> Also a callback can be attached to regulator using the pmbus_ops, and
> only those. PMBus core just collect regulators provided by the drivers
> in pmbus_regulator_register(), there could other type of regulators in
> the provided table (something the tps25990 could use). It is difficult
> to set/modify the init_data (or the ops) in pmbus_regulator_register()
> because of that.
> 

The solution would be to copy the init data before manipulating it.
I don't see why that would be a problem. After all, the data is not needed
after the call to regulator_register() since the regulator code keeps
its own copy.

> Using a callback allows to changes almost nothing to what is currently
> done, so it is safe and address the problem regardless of the
> platform type. I think the solution is fairly simple for both regulator
> and pmbus. It could be viewed as just as extending an existing
> callback. I chose to replace it make things more clear.
> 

At the same time I see it as unnecessary and possibly even harmful.
Maybe we have a different understanding of complexity, but I don't
think that copying the init data and attaching constraints to it in
the PMBus core would be more complex than introducing a new regulator
callback and implementing it.

Thanks,
Guenter


