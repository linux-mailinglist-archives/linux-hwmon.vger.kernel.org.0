Return-Path: <linux-hwmon+bounces-1874-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 754988B2584
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Apr 2024 17:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6DB282095
	for <lists+linux-hwmon@lfdr.de>; Thu, 25 Apr 2024 15:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D0514C5A4;
	Thu, 25 Apr 2024 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXP2Ic6W"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D56814C58C
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Apr 2024 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714059968; cv=none; b=tLeCwd9KC1Z4j/rRUHr+Fj45sS2TnbKCTPKpV2i5QebntY92FVDWtBgGj6Hha1YXXbUkdYK+MmXzb1v21+sO+YamwleHDkuf1zGP0OBCjg/euGi1B7lzR+sBPfc9iKalcjcYun7Le5qPE6dP60BCA4lMrPvKkqbmTf0uhYE+u98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714059968; c=relaxed/simple;
	bh=ARPhOPhDgTEQgJncPtrsgbR8sVcAO1VcNK+RH2Rvv7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZm7Ff8a3Lufj3cxmLNC4sXt2JFCJPSVZE1GYu6m5hJlo3K00Zvg5+y+pqrnaV8C6hBcgEsRsyAk0aINrpFzshOt5SKxwoZEAKu/Tvki46H9l5VTnbZLWuCNDoTjOMLma2DPUYhNgnw6hJ1iCtuXIKSCPmG/w3XB1OYgWSoxIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXP2Ic6W; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso1316325a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Apr 2024 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714059965; x=1714664765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wCdxJ+q4o3pPwabMdF8nZZpueZWNvS6ScA7rit1v9g4=;
        b=yXP2Ic6Wim+7n8MwPWojLInIF7f+vLFEv1td5ZrUzAT4WQeiqfzxriEoWPdihzaNDt
         2VGTXp3x6ap8HyC+TbM5qRZVAwafwT/F6F428bYaEA8t+BbG1OXQ673A9MDs5izSSJ7t
         CU/PVttdVqZc1ayqGPx4czgQN2q6PDXqpAeWaEyZSs6iAwTSbXDY7yIYKdEPXrXOZXV+
         DMoa2fwc0+TTvIII1rCKl48t8FNJKjya9IASn4h75qKgL+pw3CuMI9IHHD9Vgbr5FV/e
         ZmLUcg5NygOyAre8/nPEBVAwZFq1+h2WXYwuixBxMsGGj8DNv5hZf1wjEfbYs2TU2NBf
         DWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714059965; x=1714664765;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCdxJ+q4o3pPwabMdF8nZZpueZWNvS6ScA7rit1v9g4=;
        b=JuOUH0zXXVdVuMJwjTpgdQv6SojRQnRI6NahtMnlp693YWxy7Tr0iFJhRmWx5jK6o6
         OV4aD46i9b2gJkYKFpBoC0+hY+Pnmjw1Iv0dJEtJHHkLUxG3W0fdR+Noh6y6x6Y3Yn4v
         dMV5jSQYeoi5AXAhsiGRKWi/OKOxET9krbdABw+oXzIA5PTKBlPyZ8zM6XrKt0Uop6KQ
         Fa2aMlr/Z4GnhttXMMrX/qllJfxAZ+Z8Hq7Bmm9g95wizy/KzqPjHYDND1+LgZWhTPyh
         cLY+9R2co/kPTSwAgvCxCJG9JF7q/xfI5nLUoWbKGQFFbWDNAeTs15AMikUYa8xZ1SGp
         2vlA==
X-Forwarded-Encrypted: i=1; AJvYcCVgl0+cEg0FWeI064KEcGh3sOtgqZFBKC3MacF3m90qGW506OYgqHVmyU8FU5vofD40Jpnxv6u5G2QLNIXaZb/u4MGwRarRCiGDPA4=
X-Gm-Message-State: AOJu0Ywksu5LvLPRzPXwgc+p4u5HLnVAqubVQJmNAQcck0/iPsBjKsKj
	O39ofdmr2drJItiCjAzg/SHkXIWq0zUFx/A4DxuQTdlYEbQPhWgoXtHcqRPxWvE=
X-Google-Smtp-Source: AGHT+IGjb9BIma2IPdK9VWrOvvIht6IG4eG7JsAANZbuKMobxKYONjCipGocbaFdCGFyQRQnFZaCew==
X-Received: by 2002:a50:d4d2:0:b0:56d:e6f6:f73c with SMTP id e18-20020a50d4d2000000b0056de6f6f73cmr3670436edj.42.1714059965005;
        Thu, 25 Apr 2024 08:46:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id i19-20020a50fc13000000b0056fed8e7817sm8916217edr.20.2024.04.25.08.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 08:46:04 -0700 (PDT)
Message-ID: <b79b5323-196f-41bc-b47a-d350c49d769a@linaro.org>
Date: Thu, 25 Apr 2024 17:46:02 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
To: Guenter Roeck <linux@roeck-us.net>,
 Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Conor Dooley <conor@kernel.org>
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
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2024 16:05, Guenter Roeck wrote:
> On 4/25/24 03:33, Chanh Nguyen wrote:
>>
>>
>> On 24/04/2024 00:02, Conor Dooley wrote:
>>> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
>>>
>>
> 
> The quote doesn't make much sense.
> 
>> Sorry Conor, there may be confusion here. I mean the mapping of the PWM output to the TACH input, which is on the MAX31790, and it is not sure a common feature on all fan controllers.
>>
> 
> I think the term "mapping" is a bit confusing here.
> 
> tach-ch, as I understand it, is supposed to associate a tachometer input
> with a pwm output, meaning the fan speed measured with the tachometer input
> is expected to change if the pwm output changes.
> 
> On MAX31790, it is possible to configure a pwm output pin as tachometer input pin.
> That is something completely different. Also, the association is fixed.
> If the first pwm channel is used as tachometer channel, it would show up as 7th
> tachometer channel. If the 6th pwm channel is configured to be used as tachometer
> input, it would show up as 12th tachometer channel.
> 
> Overall, the total number of channels on MAX31790 is always 12. 6 of them
> are always tachometer inputs, the others can be configured to either be a
> pwm output or a tachometer input.
> 
> pwm outputs on MAX31790 are always tied to the matching tachometer inputs
> (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
> channel X would always be X.
> 
>> I would like to open a discussion about whether we should use the tach-ch property on the fan-common.yaml
>>
>> I'm looking forward to hearing comments from everyone. For me, both tach-ch and vendor property are good.
>>
> 
> I am not even sure how to define tach-ch to mean "use the pwm output pin
> associated with this tachometer input channel not as pwm output
> but as tachometer input". That would be a boolean, not a number.

Thanks for explanation. So this is basically pin controller function
choice - kind of output or input, although not in terms of GPIO.

Shouldn't we have then fan children which will be consumers of PWMs?
Having a consumer makes pin PWM output. Then tach-ch says which pins are
tachometer for given fan? Just like aspeed,g6-pwm-tach.yaml has?

Best regards,
Krzysztof


