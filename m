Return-Path: <linux-hwmon+bounces-3179-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B26935156
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jul 2024 19:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28BDB1C20DD2
	for <lists+linux-hwmon@lfdr.de>; Thu, 18 Jul 2024 17:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57B3144D2F;
	Thu, 18 Jul 2024 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efAYPMEM"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F61459E2
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721324880; cv=none; b=X4uH+clSc69ZGr6K3hKIecb4DgzU98roHYpQBI5P2MVA8ijZkDbZGhhLMN/ABgRRl3VnzVN+CYA0xZjfTPm+/DVMTKK7KrU0DilSptBX9W31/dUBi0jr1rxDUWyn9Ding++Ldf7douE9qI3XFwxUZSYcrL/Y7WZtnDfKFn+MDns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721324880; c=relaxed/simple;
	bh=30goUu0wUd/GUiJSaZpOpm5M3gZ8kLg4aAUv7vpoJA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GN8g/DpTS1BFKBhUfryXSh9RPmsbdct7uXJDWTlnAwfFmhyoY0IKGn3V6Cy3hzpp5CqbWXtZhOizxYeqUFItJ61I+8bm4KWkfs8lawif/tq2lIFu8HegFsw6TetGCUWY/m1U2e4cAF8/OMlj/k5QkRt7TNQJ0v5n5EW0ABvIWfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efAYPMEM; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-708b273b437so592336a34.0
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721324878; x=1721929678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v6V8K4zMZDvbGC/pdfm8eIhjeWKQxkNGZLFlfvID7KQ=;
        b=efAYPMEMKIBiMu0Q4yhGhg5+1kNs8zJBjZLCgz4E9pf9YVYHDM7I5K+ssbUIpan3yj
         Ru0etOjeT3DQuktZYTDyDlKC17TucEzIS4xFNHFy3daShEp1frxMqNCGodED3DahYSia
         yLVhpd6VDqFPWceDhh08DCAwkETgedVv8ldbpOckdzwoxRQ++n7K7yepc2N9RVJCrD/0
         Tf+vjx30pFUCTI750PHYpbE6AHfeXKenXYVIJgYZBpmy9eR5wI4gMkBnTkFpkOpmj9bh
         wbO4u1sMCm0VegWtmewJkIKaUnp7Rjzq6d5YmIajw6vpUsQXZs5fRVldgs5uaul/JMXd
         Ya0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721324878; x=1721929678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6V8K4zMZDvbGC/pdfm8eIhjeWKQxkNGZLFlfvID7KQ=;
        b=FbWceoX8SySyc72K6ueENEHJLLS4fz7tswx7bbDl9292iaPcOpLqsPgZVkljt7e8kZ
         W5SV1rNYhpJqwCMGbbD6kM5wJlKJ9eq+ALYq+TyOSDd2wgJESIFIN5ngB4PlIzZrNL4G
         QA//89hBvWhwlw2ZNyjvrIaPjWb3qxDF+7efdoI79n/mYHoXcTyfcMZaRoKsIDmz8A9G
         kls2FiNDFskvZvZZD2nlHGFaVOGhf+WZ7CxeSka1GxWPM35h66UvUE0oa6smIgu57V4O
         knISorhNUFyuSDk3dIorck7cvAUrgOJUx4DvO9J3l5wqVwjxy7/u7IdrPDl0mu+qw8bf
         fnLQ==
X-Gm-Message-State: AOJu0Yz+O6OzoWztwKtujGbAJsN1hLRe3tBTWk2LyF56Z2uGNoSTcoIW
	cM7q4fzCX6oo0Tumj75j4mM8RmreIxBiQBM66cEXDyC56D1NNCLyYBMwgA==
X-Google-Smtp-Source: AGHT+IH4QFBnsvoDJLAugGo9p+ekST48x+Gam0SViemYKYEge4st5fb2J4N8b4H2NFQGHID7S8EIBA==
X-Received: by 2002:a9d:5e93:0:b0:704:494e:fa1f with SMTP id 46e09a7af769-708e37ec4d4mr5761832a34.29.1721324878028;
        Thu, 18 Jul 2024 10:47:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34289397sm8101518a12.38.2024.07.18.10.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 10:47:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89c18e08-3a98-4c33-bca4-ea5acba9f6f2@roeck-us.net>
Date: Thu, 18 Jul 2024 10:47:55 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hwmon: (lm95234) Convert to with_info hwmon API
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-5-linux@roeck-us.net>
 <ZplFeHMIKjHPiwTc@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZplFeHMIKjHPiwTc@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/24 09:40, Tzung-Bi Shih wrote:
> On Wed, Jul 17, 2024 at 08:39:33PM -0700, Guenter Roeck wrote:
>> +static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long val)
>>   {
> [...]
>> +	case hwmon_temp_max:
>> +		val = clamp_val(val, 0, channel ? 255000 : 127000);
> 
> Perhaps I am misunderstanding, but this looks weird to me.  By applying
> the patch, the maximum values are:
> 
> static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 127000
> static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 255000
> static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
> static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
> static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000
> 
> 
> However, it was originally:
> 
> static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
> 	        const char *buf, size_t count)
> {
> [...]
>      val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);
> 
> static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
> 	        const char *buf, size_t count)
> {
> [...]
>      val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
> 		    1000);
> 
> static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 255000
> static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 127000
> static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
> static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
> static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000
> 
>> +		val = DIV_ROUND_CLOSEST(val, 1000);
>> +		return regmap_write(regmap, lm95234_crit_reg(channel), val);
> 

That is indeed a bug. Here is the fix:

diff --git a/drivers/hwmon/lm95234.c b/drivers/hwmon/lm95234.c
index c3c68c196479..7da6c8f07332 100644
--- a/drivers/hwmon/lm95234.c
+++ b/drivers/hwmon/lm95234.c
@@ -150,7 +150,7 @@ static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long va
                 val = DIV_ROUND_CLOSEST(clamp_val(val, -64000, 63500), 500);
                 return regmap_write(regmap, LM95234_REG_OFFSET(channel - 1), val);
         case hwmon_temp_max:
-               val = clamp_val(val, 0, channel ? 255000 : 127000);
+               val = clamp_val(val, 0, channel == 1 ? 127000 : 255000);
                 val = DIV_ROUND_CLOSEST(val, 1000);
                 return regmap_write(regmap, lm95234_crit_reg(channel), val);
         case hwmon_temp_max_hyst:

Thanks a lot for the detailed review!

Guenter


