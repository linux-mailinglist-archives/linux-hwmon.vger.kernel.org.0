Return-Path: <linux-hwmon+bounces-2915-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021489268A3
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jul 2024 20:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB46D28D3A4
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jul 2024 18:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21660188CA5;
	Wed,  3 Jul 2024 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CReNtDRW"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BE187353;
	Wed,  3 Jul 2024 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720032740; cv=none; b=Vzqo3Dq7ugdKVfVBwU5JjT1PERJrplxeT+n8CWxTEZg00kPJ73ZXwrpZiLrUL/n6eKIdKiLap8+gDWyIGU8mtOuU8S11UJBKH8pO6dZuvbwdHxSLNtxKbIEwqqKyDo1tsHUCZQFB1aZ6YWibgkrWbQIomd7GOAlTvzOPzTOdaro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720032740; c=relaxed/simple;
	bh=czhjZ/gqtU/iqM4qIkIrp+UwKyMYkNY4EpiEB9VrY4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QqEc4L01bkY35aU7Kf+cBshFY9WCvVygYL8jMF0N2whyT0NBJdUs8wVrgKmF3UOU0F7NbjJxcYk8FxGYyLwh9kq0FqkAlh19KLwFrz9MtlcLsqdvasXnvUNPfhsKRG671ggvWE2BZAmjmP7CSxWNs2lVuhfV0KmgCY0QurzAXFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CReNtDRW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1faad2f1967so7840765ad.0;
        Wed, 03 Jul 2024 11:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720032738; x=1720637538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XrrmeIpzoM2PzCg098tAG4GfOOi0vIpbrCeQ0ZH/AIU=;
        b=CReNtDRWkx4fbOWjDirLq3v79Cwz79wv8/Mr/OmInoh9bCQgRuNU6dkvbhT79Hm403
         hKlJ786bx1hBzdlC3VxJt5D1nyLMVo8xeRX8jVNoGIuTk+R0sPaQkrS7fdDt80C2z0Z1
         jk3Qt9KBFOdzHcCCkNrWagMuZZD6B7g/Vg/wofLMRhdv+/4YLlgFnqW0fzHuKV6yN5fR
         ZtXo77joDmv2Bm/8Yp0zEqccutqrfheVBOBmGEYYIr780gzGnHCqpSvv8vZeMHTU9LMW
         gbLWxNAYQI4SCKcIhOz1LwqtngjRSOwhTuW51REIwnPw1AUXgtkNspuwDGpX+aWbf5qy
         u8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720032738; x=1720637538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrrmeIpzoM2PzCg098tAG4GfOOi0vIpbrCeQ0ZH/AIU=;
        b=sGhZPR+b7orV5tVtHSWnARuJOVsI8cedmBUREJ+PPacA/H1RBCadt0IdjjZ1/5n0tY
         FCWa2VkTR0Rr/9nxzQ1vMbVDDxLjlxZzl2Eu5MWgx7TOui2jRW+QAfBINIOgmJf2NDCE
         xuLrZqdHgHhJ+OFvu+xoVNQMw0Hl15UkyuaZAf6Yr4IIgKiEZ+ogIYgqcmyV4sle5CD0
         g88CCuTVrMvQ4Nobp4YeTTf6o20ZpUcB58pHuYFNhwUUXt7yEA+RhyNh+bJKVpokkW1T
         gloKlcWEESo+UVNqM3izc5hUPhizE9Ond1Nx8Wm4U8MyoT06r2wDWvDYn5yB/SISBkrO
         FpyA==
X-Forwarded-Encrypted: i=1; AJvYcCVOAp48q5o5dDZiBR8sN+/M+e0KUyE6716iuadDALX7ZSIYcwQC41CDzod1+I3jg74qdvrsGnqQOPqfkVo6cy8GlU/wF0KEbdqJOZswDMgL1kHhtvgr2v3KMeFsuowq+2gLOYLaK96IckA=
X-Gm-Message-State: AOJu0Yzt4d9ge8D2j/XPIVEEe7l/ZwX9N7Ma6oadviaTGdqZtPg8YjH/
	ISznXVVfe93aWdkISkj4SqrWbRbe9e7ltX3X0+WhaperfNePDxCy
X-Google-Smtp-Source: AGHT+IGvZH/QCUhrg3XwzmzU4Gov4xvPpZtC3jzK6vUW/ojjIf/KaRIZIlGDevLomXHgekK45ji4bA==
X-Received: by 2002:a17:90a:9101:b0:2c9:2d00:44f with SMTP id 98e67ed59e1d1-2c97ad0ccd3mr3670920a91.12.1720032737726;
        Wed, 03 Jul 2024 11:52:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3bc988sm11079004a91.38.2024.07.03.11.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 11:52:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <982dc693-dbb2-41a7-ae0d-3b3c05c28117@roeck-us.net>
Date: Wed, 3 Jul 2024 11:52:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Simplify with cleanup.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240703083129.95955-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240703083129.95955-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/24 01:31, Krzysztof Kozlowski wrote:
> Allocate memory, which is being freed at end of the scope, to make the
> code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 0362a13f6525..e72e26db6e10 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -14,6 +14,7 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/capability.h>
> +#include <linux/cleanup.h>
>   #include <linux/cpu.h>
>   #include <linux/ctype.h>
>   #include <linux/delay.h>
> @@ -1095,9 +1096,9 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
>   	struct thermal_cooling_device *cdev;
>   	struct dell_smm_cooling_data *cdata;
>   	int ret = 0;
> -	char *name;
>   
> -	name = kasprintf(GFP_KERNEL, "dell-smm-fan%u", fan_num + 1);
> +	char *name __free(kfree) = kasprintf(GFP_KERNEL, "dell-smm-fan%u",
> +					     fan_num + 1);
>   	if (!name)
>   		return -ENOMEM;
>   
> @@ -1115,8 +1116,6 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
>   		ret = -ENOMEM;
>   	}
>   
> -	kfree(name);
> -
>   	return ret;
>   }
>   

If you really want to clean this up, just use
	char name[32];
	...
	snprintf(name, sizeof(name), "dell-smm-fan%u", fan_num + 1);

I don't see the point of all this complexity.

Guenter


