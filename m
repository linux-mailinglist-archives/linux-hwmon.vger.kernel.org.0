Return-Path: <linux-hwmon+bounces-54-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460B7EC207
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Nov 2023 13:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BFCA1C2093C
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Nov 2023 12:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F6118041;
	Wed, 15 Nov 2023 12:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buWUoiNI"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7859518026
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Nov 2023 12:17:41 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F7BE5
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Nov 2023 04:17:39 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41eae4f0ee6so39135011cf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Nov 2023 04:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700050658; x=1700655458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NwOU1eQ+YKTD4yQGGCQJLYddK4he3i15lU45I5FAEyE=;
        b=buWUoiNIHEcHc4hdkPKviopRlpqwqXMdi4/rOmI7glVANV78fd8AKhd+frtlY5Vwnh
         tgMhAy0MjmOfK4I8IsMukHyVe75T2QeswNxOew9XrPzgxWXjkVAFTg4g9GJmq/uILwgv
         MkV3zyE4lkI7pVa4Sg6aM+vx2Axk66p+sxRHQJTrqYHtKdpX8orkwjCN8pkbGEhPTvgK
         hFZ5tO2xF0mxnQF9wHVZb/cwM8cIJu20sH4Y0rtFgLLAr9RELhpXjVToUBqQSkEXXmpW
         MOjrCfeNr+iXROMyFe7FT88B66YhKqFTsXLyO9F9AiAKOMl0l0zN93nfhtrAz4oJFIyT
         24xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700050658; x=1700655458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwOU1eQ+YKTD4yQGGCQJLYddK4he3i15lU45I5FAEyE=;
        b=eWnEVsbp42vNWyAkO7+K7UkxCwCjVfh5vPpCeycet+y8nsWJZpiiEsP8PGJljHl7oc
         WMA1zMhubzx3ZQs0tgk7u8H9niOw+Lj4xWAzQKvtWfuBpr/3F62e0+9FCuo2buiZ4YVn
         Zd8dLYbmY0h6Vpq8dwTGfrQsvypS/pcuViA2rP9ZVBof2PnFfI6xS66FB7sp/jynqlSI
         +twUL2tpt50jDqa/cD9ar8zlrVOqS1AxOj7I2X56hmakoeCQJr/KqrD9UmAaGtX+9gP3
         chXA7FYgWBE9tplr0eeNcWCqlHp5QLduRrRfrNmv8eUFFEJpN3xKCSOoSdMsH4pqDNgd
         aigA==
X-Gm-Message-State: AOJu0Yz/PpR6xlZxsojlU7jRLX7UcmAbhNB3fBMJzENzTyzphqTRzmrS
	u4oKF7zW6rrBSuu4waclEwoBaw==
X-Google-Smtp-Source: AGHT+IFQ37CO8FSGToXU4RQ6qFrxhCQbUJbC0uTbVgxOKU5Xh/kEVwqQpAIIcBT7RUj7XUpbd3TdGw==
X-Received: by 2002:a05:622a:1aaa:b0:416:5dca:3c9d with SMTP id s42-20020a05622a1aaa00b004165dca3c9dmr5820552qtc.16.1700050658671;
        Wed, 15 Nov 2023 04:17:38 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id 3-20020ac85643000000b0041b9b6eb309sm3497310qtt.93.2023.11.15.04.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 04:17:38 -0800 (PST)
Message-ID: <4f431cc6-4f13-47bb-ba35-44bddf047e02@linaro.org>
Date: Wed, 15 Nov 2023 13:17:34 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Content-Language: en-US
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 Conor Dooley <conor@kernel.org>
Cc: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231109014948.2334465-2-Delphine_CC_Chiu@Wiwynn.com>
 <20231109-obscurity-dress-4d1d3370ea56@spud>
 <SG2PR04MB5543AB6AB419CA76DBD5E023A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <SG2PR04MB5543AB6AB419CA76DBD5E023A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2023 09:38, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> -----Original Message-----
>> From: Conor Dooley <conor@kernel.org>
>> Sent: Friday, November 10, 2023 1:10 AM
>> To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
>> Cc: patrick@stwcx.xyz; Jean Delvare <jdelvare@suse.com>; Guenter Roeck
>> <linux@roeck-us.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
>> Jonathan Corbet <corbet@lwn.net>; linux-i2c@vger.kernel.org;
>> linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org
>> Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
>> bindings
>>
>> On Thu, Nov 09, 2023 at 09:49:45AM +0800, Delphine CC Chiu wrote:
>>> Add a device tree bindings for ltc4286 device.
>>>
>>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>>>
>>> Changelog:
>>>   v4 - Revise some inappropriate writing in yaml file
>>>   v3 - Revise adi,vrange-select-25p6 to adi,vrange-low-enable
>>>   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>>>      - Add type for adi,vrange-select-25p6
>>>      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
>>
>> Your changelog should be below the --- line.
> 
> We will add --- line on our changelog.
> 
>> You also omitted the tag I left on the previous version.
> 
> Could you point out the exact places that we omit?

Open the previous email and read it fully. Did you or did you not get a tag?

> Thanks.
> 
>> With the changelog fixed:
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Best regards,
Krzysztof


