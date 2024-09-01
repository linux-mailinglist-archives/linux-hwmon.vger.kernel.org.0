Return-Path: <linux-hwmon+bounces-3884-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DABA9676CD
	for <lists+linux-hwmon@lfdr.de>; Sun,  1 Sep 2024 15:44:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB641C208C8
	for <lists+linux-hwmon@lfdr.de>; Sun,  1 Sep 2024 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FAD17E00F;
	Sun,  1 Sep 2024 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6E7PfOM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89E14B940;
	Sun,  1 Sep 2024 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725198234; cv=none; b=j8XAHJd7EDg8tf/yxWqW4OD05vaN8KRhdCgQzXLZaa9wmeZEPL33nh1dOLCDj8Odqtzf4BmFOB5CIr782UF5/Cm+TzUdY6DUVuEGOD0QdrxeasWg6eovGjNrPIiUY1RdU73iq7AH+MXa0SE3G/tSDz5+XycjmetJFrr6Rjwc3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725198234; c=relaxed/simple;
	bh=zMovaJ1MekmLeKlDjd8uSii5uIcwkQkbQuBdyfmk+vY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=im5OF7GqO2lH23yAiYhmRrgi+HmOKoFGqZWi47wRsGh4j2FuThFmdor2jXOZnBWbK2h7FxTYEIhOxq3B0ngcfS3T/uuEykAp6p3L8dwZJsN5vy0Iddz0ugPJx3sDYnCgBNXjM8h2Vcw2S0vrG+/vdCtLNXPfvsowmO2ha+Kb814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6E7PfOM; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-277bf66f7e0so1094466fac.0;
        Sun, 01 Sep 2024 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725198232; x=1725803032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aHPoORauBPa9FJXBghN/9WXH2R2WqJ/gZ8bhfHcPl+o=;
        b=e6E7PfOMb/m5+v6qzIV0MyLh7nZzzoGMUUF1vqOVjwIKDtp03hYL8WQTLfrfIH1d0X
         JTgzZgMqYLlsviOxVkqH6uG2Tt9gES0+Ojo/J1r4oBebnAJQO0z/eiKW8zl9G9y2u0Ej
         w+lZ1qqg2tXjJXSFCfWREmZQPs/8u2/PH7XSxWwTIwbc3pvqIRMNIE74LXPw7Z07rCuC
         Pfj32XO7okAGLl0DnVUcgBtCBnE4ZTLUAc1eOx0PhWe6BE3KeNrLSUNO56L+cYJN2AWT
         1FMjtb80PqJHtEsJTvWMP/6YsoSZ/tiO9ZXoyXh6RS/aprt1v83nJx+o14G7fKDGV0Oi
         RIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725198232; x=1725803032;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHPoORauBPa9FJXBghN/9WXH2R2WqJ/gZ8bhfHcPl+o=;
        b=MIClXGclPVUt4kFxF0F1aBFEWznoT9QZHGWjPdi5ne45LnuYoE9OwyLHMalbVpsva3
         oZf+AfVQWTOTbChA082SjEpLbJF9L2jrLrKlJx9R37fIKZ7VvLTn0EYlT2uYkDLzHTTo
         9Ze5TS5y8p3hTR3fM3omU4erajxtmYnNhNOEGLSYf32A4GrUnaVzZxSclExe1DetyVRV
         l5mx2/6h2AAE1bVnBB45NHp6MNNyJkdr5yjOqYCv0Ir+NQH3XvhErgGRK+O7CZhqSz3I
         l9HVYyPxlsFfIfAXjzkSWg02+KQj2urXczMnEnp1UJB3bxZy3+KEBiRdV7bqMxGf0phE
         gFxw==
X-Forwarded-Encrypted: i=1; AJvYcCWrtvz7tXccy0pn/H2QgVMkp4YTJZVGSfTCOPlvDOvbfNnwbWrOGaQi6FHcsl6j3e/okhE11026pu7d7/Lj@vger.kernel.org, AJvYcCXs529y+401H1G2KdLIYmxbsYJ1wRLYhZC4+4K9fXXa647VEtjR1wanIKeaZ6amIiQWh1/1uTq0cMVH0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgTtY05nWq3/STWIddjHrz7P8Zn7rnnCFZHYkZuoyl8TSSVUm
	sNNjclAXGSHfwEVkg9pBNSb53djzqPiRi0wxr+UF+Reh1oWn1DIWn9uBNg==
X-Google-Smtp-Source: AGHT+IHrCVSzpKAqhHV6zzUWqOCQU9okxbF65bOUe0HEtOIkZEqRJ0WdmbW6SzSYp6JmuAhUSOwL8w==
X-Received: by 2002:a05:6871:7506:b0:277:c343:aa7 with SMTP id 586e51a60fabf-277c3433340mr6558189fac.2.1725198231742;
        Sun, 01 Sep 2024 06:43:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a3a34sm5395785b3a.45.2024.09.01.06.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2024 06:43:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bb433a53-47ac-41eb-bd21-013da93b0bb7@roeck-us.net>
Date: Sun, 1 Sep 2024 06:43:50 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hwmon: pmbus: Implement generic bus access delay
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
 linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20240717073000.786228-1-patrick.rudolph@9elements.com>
 <e83aada2-79b2-4272-ab10-4453083193cd@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e83aada2-79b2-4272-ab10-4453083193cd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/17/24 07:42, Guenter Roeck wrote:
> Patrick,
> 
> On 7/17/24 00:29, Patrick Rudolph wrote:
>> Some drivers, like the max15301 or zl6100, are intentionally delaying
>> SMBus communications, to prevent transmission errors. As this is necessary
>> on additional PMBus compatible devices, implement a generic delay mechanism
>> in the pmbus core.
>>
>> Introduces two delay settings in the pmbus_driver_info struct, one applies
>> to every SMBus transaction and the other is for write transaction only.
>> Once set by the driver the SMBus traffic, using the generic pmbus access
>> helpers, is automatically delayed when necessary.
>>
>> The two settings are:
>> access_delay:
>>    - Unit in microseconds
>>    - Stores the accessed timestamp after every SMBus access
>>    - Delays when necessary before the next SMBus access
>>
>> write_delay:
>>    - Unit in microseconds
>>    - Stores the written timestamp after a write SMBus access
>>    - Delays when necessary before the next SMBus access
>>
>> This allows to drop the custom delay code from the drivers and easily
>> introduce this feature in additional pmbus drivers.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> ---
> 
> Sigh (sorry, but this isn't your first patch, and you should know).
> 
> Change log goes here.
> 

Maybe I was not explicit enough, or maybe I offended you with the above.
If so, I am sorry.

Either case, I am not accepting patches or patch series without change log.

Guenter


