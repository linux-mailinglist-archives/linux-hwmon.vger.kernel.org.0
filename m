Return-Path: <linux-hwmon+bounces-198-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 584917F7A7C
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 18:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7793B20BDD
	for <lists+linux-hwmon@lfdr.de>; Fri, 24 Nov 2023 17:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB0C381D4;
	Fri, 24 Nov 2023 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCnVa/lW"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BD91BC2;
	Fri, 24 Nov 2023 09:34:51 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b2ec9a79bdso1367818b6e.3;
        Fri, 24 Nov 2023 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700847291; x=1701452091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=emE8oCCMObVTti3WryKtK+jq28122RLCctiS74g2B70=;
        b=bCnVa/lWH7mzaYA+rJh+LPMPjnQ0O9roHMhel5jVynA7L2pXLZO5iLh9SbFvpsTZfE
         Z9C2EelYFv3/LB7NT1LGMOW7Bxlf6qXqd+Z8qG3nyiA397kNy+49ccl6AhJPpStF5LdT
         I/FR3PAOYlrZWyM7su+7l6qp1H/q3+ytx2dsUrKWqOvy9vb+lBZKPQrN93ZWhSBHtKAf
         6zVCspmluioGI7xHlSnUrUPFaqe6Y3VXabd0wiZjkWKWrVozEqxbepCGDlYyO+znZuiS
         jlJINVmemDTF+aGvMq+olmsW9Oj0igNZKKEbDmJJCWelP2BNMCuGBkQ7DSjNLok7zjP3
         YvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700847291; x=1701452091;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emE8oCCMObVTti3WryKtK+jq28122RLCctiS74g2B70=;
        b=r5HteV0Qxcqq3Dwdc77DH5YD2mJ023Z0M/OQ7ESn1vBknA4eOUqsBml5nBGaKUYcYs
         5PK9qhm+IrF9wcOqsZrfr42u+2xiIBKTeUlkSS+45+i6M3asl05R/XOS3qK3TMdWSnTA
         yvA2XRwsa2ticdUxIXKVgyhDX78SeAfTnZz/VkkJtzbmWox+5ZV64wLOdGZvbs50UjmF
         88kRkIC18cFrTRcAklPNPjl4HzBxIgDGh+vcmifOwfVzlItXAoVGk7kTivHlY6tdowuW
         8GOSsWKuBXUYhTigdzLIBrxgI2pKbjuFQ/pM1dhIaZMm3/0c623yN3pgC7AtEg0o44dH
         m2FQ==
X-Gm-Message-State: AOJu0YyLI9kSoSiouQmlJvFO+5JDjte4nCFMN9VJVapf0eDqaxkmajI5
	SEfdaMHEzYUNETpzVMjQPB6dsxBivgM=
X-Google-Smtp-Source: AGHT+IGEmQFPKJVdsB1JTaoH8/GVfWDjbl7LsFS0JEMsBIAesCPzS5YzxGLI472GNutJ8XgZvNO7Hw==
X-Received: by 2002:a05:6808:219b:b0:3b6:d371:d4d4 with SMTP id be27-20020a056808219b00b003b6d371d4d4mr4765282oib.37.1700847290908;
        Fri, 24 Nov 2023 09:34:50 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r30-20020a63515e000000b005b4b70738e5sm3348124pgl.8.2023.11.24.09.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 09:34:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <52909c46-4699-442b-9303-ec914fba093b@roeck-us.net>
Date: Fri, 24 Nov 2023 09:34:48 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: sht3x: read out sensor serial number
Content-Language: en-US
To: Stefan Gloor <code@stefan-gloor.ch>, jdelvare@suse.com, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231124145519.11599-2-code@stefan-gloor.ch>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231124145519.11599-2-code@stefan-gloor.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/23 06:55, Stefan Gloor wrote:
> Some of the temperature/humidity sensors of the STS3x/SHT3x family are
> calibrated and factory-programmed with a unique serial number. This serial
> number can be used to obtain a calibration certificate via an API provided
> by the manufacturer (Sensirion). The serial number is exposed as a
> non-standard sysfs attribute.
> 
> This feature is only available for STS32, STS33 and SHT33. The capability
> to read out the serial number is not documented for other sensors such as
> the STS31, but it is implemented in the ones I tested. To be safe, the
> driver will silently set the serial number to zero if it can not be read.
> 
> Tested with:
> 1x STS32: serial number present
> 2x STS31: serial number present (feature not documented)
> 1x SHT31: serial number present (feature not documented)
> 
> Signed-off-by: Stefan Gloor <code@stefan-gloor.ch>

I am not going to accept this as sysfs attribute. Please implement
using debugfs.


Also, the attribute (sysfs or debugfs) should not exist if not supported.
Please only provide if supported.

Thanks,
Guenter


