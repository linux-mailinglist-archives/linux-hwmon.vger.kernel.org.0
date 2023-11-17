Return-Path: <linux-hwmon+bounces-100-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6E77EEBCE
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Nov 2023 05:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 964A3B20A51
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Nov 2023 04:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91740CA6B;
	Fri, 17 Nov 2023 04:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVYfrWVR"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80311D51;
	Thu, 16 Nov 2023 20:54:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2800bdf888dso1190860a91.1;
        Thu, 16 Nov 2023 20:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700196887; x=1700801687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/lmKwmdeL65ZlMvWyE8ViyW/IEvLXZ106QkyWY1HoSE=;
        b=gVYfrWVRVBG95S64EBAdS7N5Yzn83iIn2Fbo44NyDC46pMAxhlT7e/7GwfwRz7fHQ+
         s8wv2ypoOiuAHVljeO+RlaPqNhxrAVGSB/V9tA05Ok7iDnFEnD3sBdrpCIuO6ilcNaWI
         mPg/UTzEjM31wT06w4c0q7sGP66LbgR1nzcFI8YTKIJUPYGQLIkqa5wvQ5V+NJMIW90n
         qtpC/uaco57SG+JP/baOccSYsWIoHRtw96+E9zrJNif5JRYvaNHunoZa3VeLcWbP3GBp
         jIf1r8Mke1sGW/D7JhRYkJnt9GeJ1pRorlGWXhKBH5Ws+BqBAC36z6fuumbJh2TRi04u
         8I7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700196887; x=1700801687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lmKwmdeL65ZlMvWyE8ViyW/IEvLXZ106QkyWY1HoSE=;
        b=N+siMVCug1s+5MBXMYKq4D5o9R+jlCdivvnqTOp8tbtPUrtifjdY8VXsnTU4N7opgB
         /9Z0Op6scapnnKm/rmL8YV7C5TLFkbSq3tauQ4F+e/nT8UzNimiGyBv+SH3asnzDdUAq
         +Ytdedp/xxYJ6siWWkU6aewbTQwngjm11gfTcnMi9JDALRVhZzJg+zMX8NQK2qW/UgmQ
         8tST+5VK17WHKkChT7ZrLc+gri8K7stsYbULYiZ5/sRoqhbeyieF9eJbmfw30u5sZ3no
         +AOUA2zMRuziNC690tkjmp5HEdUIHcJ/H9VUApvGIsvFGMUdyD95vlwvaogIE3sVnCFr
         F3pA==
X-Gm-Message-State: AOJu0Yxfx44ZP0IjXzqQDiis7jgZejx9nv5bv30wCzRyibtOb3fRuZSx
	X1DOjQa/ZkaYcg3BzK56etg=
X-Google-Smtp-Source: AGHT+IHhtYWcLgekAAs6JlVdKQQHsxiuNnsVKAOoHaghwsKpPqpv8wMxWSWjEB+SKCekLlK29xBsXQ==
X-Received: by 2002:a17:90b:3ece:b0:283:2805:7c7f with SMTP id rm14-20020a17090b3ece00b0028328057c7fmr5495985pjb.0.1700196886858;
        Thu, 16 Nov 2023 20:54:46 -0800 (PST)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a005600b0026cecddfc58sm2611063pjb.42.2023.11.16.20.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 20:54:46 -0800 (PST)
Message-ID: <7080c9f3-2a57-4855-be1b-9a206f6ef8e1@gmail.com>
Date: Fri, 17 Nov 2023 12:52:33 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
Cc: patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231113155008.2147090-1-peteryin.openbmc@gmail.com>
 <20231113155008.2147090-2-peteryin.openbmc@gmail.com>
 <a3445201-58f2-42c6-bef7-ca6968fd80d6@roeck-us.net>
 <69657f96-4849-4134-911d-4785d5d6b8d8@gmail.com>
 <140086a7-c89d-48b7-9574-7db28dcc056e@roeck-us.net>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <140086a7-c89d-48b7-9574-7db28dcc056e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Guenter Roeck 於 11/17/23 12:16 寫道:
> On Fri, Nov 17, 2023 at 11:18:47AM +0800, PeterYin wrote:
>>
>>
>> Guenter Roeck 於 11/16/23 06:27 寫道:
>>> On Mon, Nov 13, 2023 at 11:50:07PM +0800, Peter Yin wrote:
>>>> Add a device tree bindings for mp5990 device.
>>>>
>>>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> What branch is this patch based on ? git fails to apply it.
>>>
>>> Guenter
>> I think I don't pull the last version. I can rebase it and push the new
>> version. Thanks for your feedback.
> 
> Question is: Last version of what ? Best would be if it was based
> on mainline.
> 
> Thanks,
> Guenter

It is base on Linux 6.5.4, OpenBMC Kernel tree
https://github.com/openbmc/linux/commit/2ba0babe7865cd5f4fac3d76ad15d9b6131bd283

I can regenerate it on mainline.

Thanks,
Peter.

