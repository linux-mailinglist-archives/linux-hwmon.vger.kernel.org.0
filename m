Return-Path: <linux-hwmon+bounces-3307-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC593D724
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jul 2024 18:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87DA2B233BB
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jul 2024 16:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C117C7AC;
	Fri, 26 Jul 2024 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeBaM1VS"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8320C63CB
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722012189; cv=none; b=eRbaWFBtLAIOBvJLor7mF7xETfcwhhNnRD52HmqHC6oYCpXZZyaSfuI9HkG0eNBIKeWzptfxAtoXy6WVzm+UICd5hd9PwZUgFTIFhZO4sD4T1AgPr1Fh+LXgRhQRK5//sYfb1su5YX9cmZvKSlOhHvPn6YtHdL2X1KSc0FuAHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722012189; c=relaxed/simple;
	bh=mihaQecuCHU7TrWA2WP91hcMXwQogVodlZ+6NqTcpKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEE9+XTsckqlUjPQBrKSBniPYaL+kZmwfuUrX+/uX0ydYTIbvOYtyl0RUTP35BNlKqZhPfhnCS+ma4sv1WPZKyiRTNkkc2gtsoAzZitvU0XWY/ir7xjHBiZJTy7U0cp3VZKzZR6YTXoGa1or9nMcPvNq4GlyRet0mn6wF6g82pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeBaM1VS; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70365f905b6so882527a34.0
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722012186; x=1722616986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2MZXrnKifcKlupsdMqporGpIDOOKtYnzwlKOazSZCPc=;
        b=TeBaM1VSiNahFuqnT8iALwYYLMR5L/qgcBWsai+YXNvi9csYah33r+GddMMZrICGZZ
         AfCD5mPZ8G1rx/9O6LyQxjASCTPSiDQglX9XnMwOt0DSQHTDxYPO01ZFaSzztNRZ3+vk
         nN8iyw/UNwoIYTS51r0JUuxVWrnjAGoueUpRCEzYMmekdMis1JbB2EcjyPmLCyplbTrE
         Oul/hzfSrHYsSv3ec/nDGCMyB/JAB+acBssLOs1YXw7Cpm+UjoZUAQFm0pM55LRgi3pm
         Cg24EhHKJfuFR2g7U41vNwHV4RzHbA5hnaDfr260sniYuNxAPkHoZOz3WEF95dLlR58y
         pETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722012186; x=1722616986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MZXrnKifcKlupsdMqporGpIDOOKtYnzwlKOazSZCPc=;
        b=cytcrbzl6/cXoRc9yHJm6/yHQitDU7k87EvJCy96LRwXuppRZmklR5FqvkcEpZAPeq
         OA0rWGnxUkaTtSs+UYl1DKDgKZDDmwCN+9K/cu1xTneDkYG0IkIlcd1RSPughlRb3EsW
         Ygk+ns63GXxIu157dMQ0HOXQCfzqeOj8ejhmo6YwkVl6ikpNt8jKhP2SOWOsCcKEA9eD
         tA8ZmhW9OREwdJigjskGt3wBTWhLlXndPQAIss3FfqgW6lDOnz0MuwcpHqHcDBaE+JBL
         8+hEi8OKxraMVKm58FLIL5OlugD63p+k2kkJj6iZ2V0nRQAHhC0qK0fTB85zPyMPz738
         7QBw==
X-Gm-Message-State: AOJu0Yz6EGBe59y+Am8YlB48Y8fEdL4jbaBP5VCwi4hd+w4UKtDJfDxa
	lKxXfK1BJJyNd1+R8hjHLJ1M8cvGTS4j1Kgv+SVkThSVuke4XJH/452AzQ==
X-Google-Smtp-Source: AGHT+IHT2utBM6Ds3YDXNLIqMVNDKTlxd/OTU2jV29/tz8HWw89mgj0igC2x/SdEnq17Lbnj8sZLEg==
X-Received: by 2002:a05:6870:ab8a:b0:264:9161:82e8 with SMTP id 586e51a60fabf-267d4f4faa0mr431581fac.41.1722012186556;
        Fri, 26 Jul 2024 09:43:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead712ac5sm2913016b3a.53.2024.07.26.09.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 09:43:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9689ecd3-4f33-4494-a380-0a05e9bed515@roeck-us.net>
Date: Fri, 26 Jul 2024 09:43:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (max1668) Convert to use regmap
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240726004329.934763-1-linux@roeck-us.net>
 <20240726004329.934763-4-linux@roeck-us.net>
 <ZqO-yJMSvXXZFKm1@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqO-yJMSvXXZFKm1@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/24 08:20, Tzung-Bi Shih wrote:
> On Thu, Jul 25, 2024 at 05:43:27PM -0700, Guenter Roeck wrote:
>> @@ -15,6 +16,7 @@
>>   #include <linux/jiffies.h>
> 
> Should be able to drop.
> 
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
> 
> Should be able to drop too.
> 

Indeed.

>>   static ssize_t show_fault(struct device *dev,
>>   			  struct device_attribute *devattr, char *buf)
>>   {
>>   	int index = to_sensor_dev_attr(devattr)->index;
>> -	struct max1668_data *data = max1668_update_device(dev);
>> +	struct max1668_data *data = dev_get_drvdata(dev);
>> +	struct regmap *regmap = data->regmap;
>> +	u32 alarm, temp;
>> +	int ret;
>>   
>> -	if (IS_ERR(data))
>> -		return PTR_ERR(data);
>> +	ret = regmap_read(regmap, MAX1668_REG_STAT1, &alarm);
>> +	if (ret)
>> +		return ret;
>>   
>> -	return sprintf(buf, "%u\n",
>> -		       (data->alarms & BIT(12)) && data->temp[index] == 127);
>> +	ret = regmap_read(regmap, MAX1668_REG_TEMP(index), &temp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return sprintf(buf, "%u\n", (alarm & BIT(12)) && temp == 127);
> 
> Should be BIT(12 & 7).

You are correct. BIT(4), really.

Thanks a lot for the reviews!

Guenter


