Return-Path: <linux-hwmon+bounces-118-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 271047F0B05
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Nov 2023 04:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD3B0B207C7
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Nov 2023 03:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5891FB5;
	Mon, 20 Nov 2023 03:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GSEtVxxM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 924AAF2;
	Sun, 19 Nov 2023 19:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=UPg6IUSeVhQ/3v1u5hZx16L5qHeuDja5kJgDiWeIr4w=;
	b=GSEtVxxMLVA3gQrTIzRtKqXt7GDZM3eJd7MhvEmrVz5MPgbumcwyaSPGQqg2jO
	4Kp5/LOGHFZ5Nac8dJzC4ukDAUVjPIaRPlZpucIg6zIcRTctKNJp7OiII0FhauqF
	FSim0q3HGp1cdlyBuwyRx5BtNpOnCTPxIq5tQs8BQGjsU=
Received: from [172.20.10.2] (unknown [39.144.137.204])
	by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id _____wDnl6rM0lplVs3sBw--.29983S3;
	Mon, 20 Nov 2023 11:30:21 +0800 (CST)
Message-ID: <b6d0dd45-f159-4518-84fa-8a02cc4e9442@163.com>
Date: Mon, 20 Nov 2023 11:30:20 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (nct6775) Fix incomplete register array
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com, tobias.schaffner@siemens.com,
 gerd.haeussler.ext@siemens.com
References: <20231116022330.2696-1-xingtong_wu@163.com>
 <20231116022330.2696-2-xingtong_wu@163.com>
 <a18df29d-2e2e-431b-a486-4fd7898e0771@roeck-us.net>
Content-Language: en-US
From: "xingtong.wu" <xingtong_wu@163.com>
In-Reply-To: <a18df29d-2e2e-431b-a486-4fd7898e0771@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl6rM0lplVs3sBw--.29983S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1xXr47uw45Wr13GF1xXwb_yoW5WF1rpF
	WkWrWSkF4rtF1Yvr47G3W8u3W5C3Z3tF4Iyw1kGanakFn0gF92qF4xKr98Aa4YvrW0yFW2
	gFyUJFy5ua98Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUID7UUUUU=
X-Originating-IP: [39.144.137.204]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/1tbiEA0u0F8YMmIKvQABsC

On 2023/11/17 09:35, Guenter Roeck wrote:
> On 11/15/23 18:23, Xing Tong Wu wrote:
>> From: Xing Tong Wu <xingtong.wu@siemens.com>
>>
>> The nct6116 specification actually includes 5 PWMs, but only 3
>> PWMs are present in the array. To address this, the missing 2
>> PWMs have been added to the array.
>>
>> Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
>> ---
>>   drivers/hwmon/nct6775-core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
>> index d928eb8ae5a3..2111f0cd9787 100644
>> --- a/drivers/hwmon/nct6775-core.c
>> +++ b/drivers/hwmon/nct6775-core.c
>> @@ -769,7 +769,7 @@ static const u16 NCT6106_FAN_PULSE_SHIFT[] = { 0, 2, 4 };
>>     static const u8 NCT6106_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3 };
>>   static const u8 NCT6106_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04 };
>> -static const u16 NCT6106_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c };
>> +static const u16 NCT6106_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c, 0xd8, 0xd9 };
> 
> I have no idea where you got the above register addresses from. Looking at
> the datasheet, NCT6116 doesn't use those registers at all, and neither does
> NCT6106. The PWM registers for NCT6116 are
> 

I obtain these registers from the Nuvoton official specification
"NCT6116D_Datasheet_V1_0.pdf". There is a table that describes the access for the
PWM registers and corresponding fans:

Fans: SYSFANOUT, CPUFANOUT, AUXFANOUT0, AUXFANOUT1, AUXFANOUT2
PWM output duty (write): Bank1 Index19 bit[7:0], Bank1 Index29 bit[7:0], Bank1 Index39 bit[7:0], Bank1 Index99 bit[7:0], Bank1 IndexA9 bit[7:0]
Current output value (read): Bank0 Index4A, Bank0 Index4B, Bank0 Index4C, Bank0 IndexD8, Bank0 IndexD9

I have checked the NCT6106-NCT6126 series specification(These documents are not
publicly available, so I cannot share them with you), there are only 3 fans in
NCT6106: SYSFANOUT, CPUFANOUT, AUXFANOU0. However, for NCT6116D-NCT6126D, there
are 2 additional fans: AUXFANOUT1, AUXFANOUT2. The registers for these fans are
the same. I'll add a new array for NCT6116D's PWM read in my new patch.

> static const u16 NCT6116_REG_PWM[] = { 0x119, 0x129, 0x139, 0x199, 0x1a9 };

Therefore, this array is only for writing, we need to add an array of registers for reading.

> 
>>   static const u16 NCT6106_REG_FAN_MODE[] = { 0x113, 0x123, 0x133 };
>>   static const u16 NCT6106_REG_TEMP_SOURCE[] = {
>>       0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
>> @@ -3595,7 +3595,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
>>           break;
>>       case nct6116:
>>           data->in_num = 9;
>> -        data->pwm_num = 3;
>> +        data->pwm_num = 5;
> 
> This does look correct, though.
> 
> Guenter
> 
>>           data->auto_pwm_num = 4;
>>           data->temp_fixed_num = 3;
>>           data->num_temp_alarms = 3;


