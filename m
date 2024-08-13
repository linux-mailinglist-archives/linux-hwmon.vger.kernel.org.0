Return-Path: <linux-hwmon+bounces-3608-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7F950A0A
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Aug 2024 18:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4982820B6
	for <lists+linux-hwmon@lfdr.de>; Tue, 13 Aug 2024 16:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E3A1A0B05;
	Tue, 13 Aug 2024 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qaGNkQR8"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23D1A08D7
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Aug 2024 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723566100; cv=none; b=dnhzW2A9FxQVXHitUQIONaNWjcCAprQk4PceudqssMdNTP+y35ty7uTS4AaIS/dbslZTKBpam4FEYPfqzFAIXaG/fg9JGZ5VrUfL+RyoX4PrpNAGDdBNYLKmapyDvC36Tf0OpVQsYHMFvrfO/z+ICUS3sC8oRcmQ6Pf0SdNImyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723566100; c=relaxed/simple;
	bh=sUriLCwYNvXVr15cYyQ/1Qh0mIx8qLbZAMNS2KzTe4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLe0A+FTspso65c1DW/SRvIWiz6yPmVdiSJdG7li+kQe8/FwVekxDlg+/7/4nwdgeqQcH1XA+E6CD8jtVR1q/qpVYBdxzFwSuL+JS2p0FNdpIqkJVBb0rq93sybWjAbJG7BeCPuJUQeDR4xa6/ltWC8DP7HygxqxDZH/5BOrZW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qaGNkQR8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428e3129851so42129885e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Aug 2024 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723566098; x=1724170898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VgfBYxGiGh6y5pI52oZra6uY30VKualFdRhfSNu8SZU=;
        b=qaGNkQR8f5vxfsXIYXYI4ApCCj2B4ZoMDoxh/wh7FKFDoI4qTYgGpiiAgWCQSxFt5q
         G5nuYoCd0FINA3C3MKqdGUwqP7PIlGbi7adEJPDEF3Xg0OYHAkbw1oFLgtcj9gHOIqla
         MdNwPoP4C7zJij/TJi9vziW3rfuoyOLwHf66AV/Dwk4eFvcxs3HC0YNZikSwwKNhiNcP
         z48fBRBKY1S9IEijDUkNi1mMiJWHyz+4jojbRWi7gHedgvz13skQvcBCbRB2usVWYX3D
         IPEulTX8Jlc9g1Z9uoE9JRxi+7M2wZAJIegGlv1R/L/Aqf/Gr6k6CgLwWwIFdcIMRHFd
         aM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566098; x=1724170898;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgfBYxGiGh6y5pI52oZra6uY30VKualFdRhfSNu8SZU=;
        b=A6C3JG8ACHtmyhmpCW80z/K9NgoikC+RrgRvYX3N36+4JAD6RNHKB1yxjgVGHkhiy2
         p8g568/FUGG4f2wF4s+D1co4RH89Hd6ceqZW1cNELfJE1ISnYA0EIhwIQ5izRZTUL7GU
         5Y3JZy9ujfqpZKhI2d0kI4RvRZLCYjeC6ieLqqfUCbHgZnMLicneQFZPss0uuHnHEJrW
         nlh4lZNJd7pve24KdSkQJnaPEG5a60lHaFaZn6R5y7Iby5nU4o2vPnqWVg0wlaef7q9K
         lq7ANsal6VsGPUh02QwVIH5WztHGVOQUsvlcxE05ZAcP7DPhXQl9xG002NcWbmbidlGO
         KtmA==
X-Forwarded-Encrypted: i=1; AJvYcCU9HMAbyDUBhNkdu4al8mr61hJys8+I7uq2i5NVRZFZfGWhlZzJDnlKPCQSnZgPS+f16qEyqnsY+00kQ2+cObag/9/eOLaRYmg4m1c=
X-Gm-Message-State: AOJu0YzJPTktH3rvA4JazYUASD+vd/YTqpghT1djCnJwCOIwIenCz5xB
	Sar7q1zflIX/tyNcCaXKKKXboA7OuNv2ihvqC/3gmjwMmioeVhmjVgrdEcrN7nM=
X-Google-Smtp-Source: AGHT+IFWrFbw9oo2MSFYuiiamzVVOspnNkuxXoK8L2AFiAv9RMDrxjdgT7zw4E5PpuJsr/CBTtorJw==
X-Received: by 2002:a05:600c:a44:b0:426:6d1a:d497 with SMTP id 5b1f17b1804b1-429dd2384c7mr340285e9.12.1723566097507;
        Tue, 13 Aug 2024 09:21:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c77372dbsm143532695e9.38.2024.08.13.09.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 09:21:31 -0700 (PDT)
Message-ID: <cff4a562-2ed7-4dbc-9e2f-68ff1a601ef3@linaro.org>
Date: Tue, 13 Aug 2024 18:21:29 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
To: Conor Dooley <conor@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
 <20240813084152.25002-2-chanh@os.amperecomputing.com>
 <20240813-sister-hamburger-586eff8b45fc@spud>
 <10680d13-442d-4f12-a77c-2bd05f11dc10@roeck-us.net>
 <20240813-extruding-unfunded-0e14a5c161e1@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240813-extruding-unfunded-0e14a5c161e1@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2024 18:16, Conor Dooley wrote:
>>>> +examples:
>>>> +  - |
>>>> +    i2c {
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +
>>>> +      fan-controller@21 {
>>>> +        compatible = "maxim,max31790";
>>>> +        reg = <0x21>;
>>>> +        clocks = <&sys_clk>;
>>>> +        resets = <&reset 0>;
>>>> +      };
>>>> +    };
>>>
>>> What does this example demonstrate? The one below seems useful, this one
>>> I don't quite understand - what's the point of a fan controller with no
>>> fans connected to it? What am I missing?
>>>
>>
>> Just guessing, but maybe this is supposed to reflect a system which only monitors fan
>> speeds but does not implement fan control.
> 
> Even without any control, I would expect to see fan-# child nodes, just
> no pwms property in them. Without the child nodes, how does software
> determine which fan is being monitored by which channel?

Yeah, to me this example is confusing. If device's purpose is to also
monitor, then hardware description in "description:" field should be a
bit extended.

Best regards,
Krzysztof


