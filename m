Return-Path: <linux-hwmon+bounces-81-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B77EDCFE
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Nov 2023 09:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 860FB1C2098A
	for <lists+linux-hwmon@lfdr.de>; Thu, 16 Nov 2023 08:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D224A1C15;
	Thu, 16 Nov 2023 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NksxZ/8k"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76D7CDA;
	Thu, 16 Nov 2023 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=iC6re8bhGSbP0IHnm/yopCrP8EccfrztIJgc08TxhZY=;
	b=NksxZ/8kqZc/gMg7+cjw836HLhLKmXpoKmMMEIhVRsYbVTnhpB9b9uhj4T7cUS
	z/eeOoSyB+sG96JcnlR3cfuzA/TpE0TaV8JYl2U1lc9NEPBn5+Ao4KF/WYxHkPdR
	5FHHq9aMZK10vfytGQpeh2m5nD7sJTpni1LM60Nwy+OJo=
Received: from [172.20.10.2] (unknown [39.144.137.0])
	by zwqz-smtp-mta-g3-0 (Coremail) with SMTP id _____wB3n9yY1FVlnTDiDA--.20924S3;
	Thu, 16 Nov 2023 16:36:41 +0800 (CST)
Message-ID: <d4b2882d-93d0-4223-9e53-f35a57163b94@163.com>
Date: Thu, 16 Nov 2023 16:36:39 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (nct6775) Fix logic error for PWM enable
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, xingtong.wu@siemens.com,
 tobias.schaffner@siemens.com, gerd.haeussler.ext@siemens.com
References: <20231116022330.2696-1-xingtong_wu@163.com>
 <20231116022330.2696-3-xingtong_wu@163.com>
 <4616f6a2-f81d-47cb-9574-2319d04d3f34@roeck-us.net>
Content-Language: en-US
From: "xingtong.wu" <xingtong_wu@163.com>
In-Reply-To: <4616f6a2-f81d-47cb-9574-2319d04d3f34@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wB3n9yY1FVlnTDiDA--.20924S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar18GrWkArykCF4ktw4xJFb_yoW8tw4Dp3
	ykXFsYkF1qqayYvF4xtayfW34fAanaqFW7JF1DCw1Fqr9xJr12gF4xKr1FyF1DAFs5Ja4j
	vryxtr1xC3W5AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jU4SrUUUUU=
X-Originating-IP: [39.144.137.0]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/1tbiEBoq0F8YMg7H0AABsd


On 2023/11/16 16:07, Guenter Roeck wrote:
> On Thu, Nov 16, 2023 at 10:23:29AM +0800, Xing Tong Wu wrote:
>> From: Xing Tong Wu <xingtong.wu@siemens.com>
>>
>> The determination of the "pwm_enable" should be based solely on the mode,
>> regardless of the pwm value.
>> According to the specification, the default values for pwm and pwm_enable
>> are 255 and 0 respectively. However, there is a bug in the code where the
>> fan control is actually enabled, but the file "pwm_enable" incorrectly
>> displays "off", indicating that fan control is disabled. This contradiction
>> needs to be addressed and resolved.
>> Solution: Update the logic so that "pwm_enable" is determined by mode + 1,
>> remove the "off" value for "pwm_enable" since it is not specified in the
>> documentation.
> 
> The chip specification is irrelevant. What is relevant is the hwmon ABI,
> which says
> 
> What:           /sys/class/hwmon/hwmonX/pwmY_enable
> Description:
>                 Fan speed control method:
> 
>                 - 0: no fan speed control (i.e. fan at full speed)
> 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I think this description may lead to misunderstanding. There are certain
fans that cannot be controlled and operate at full speed while system is
running. However, there are also fans whose speed can be controlled, even
if they are currently set to full speed. In this particular situation, it
would be better to inform the user that the fan can still be controlled
despite being at full speed.
How do you think that?

>                 - 1: manual fan speed control enabled (using `pwmY`)
>                 - 2+: automatic fan speed control enabled
> 
> which is what the code currently implements or at least tries to
> implement.
> 
> Guenter
> 
>>
>> Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
>> ---
>>  drivers/hwmon/nct6775-core.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
>> index 2111f0cd9787..575db6cb96e9 100644
>> --- a/drivers/hwmon/nct6775-core.c
>> +++ b/drivers/hwmon/nct6775-core.c
>> @@ -900,8 +900,6 @@ static const u16 NCT6116_REG_TSI_TEMP[] = { 0x59, 0x5b };
>>  
>>  static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
>>  {
>> -	if (mode == 0 && pwm == 255)
>> -		return off;
>>  	return mode + 1;
>>  }
>>  
>> -- 
>> 2.25.1
>>


