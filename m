Return-Path: <linux-hwmon+bounces-868-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43984386F
	for <lists+linux-hwmon@lfdr.de>; Wed, 31 Jan 2024 09:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498451F23F2D
	for <lists+linux-hwmon@lfdr.de>; Wed, 31 Jan 2024 08:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25FD55C2D;
	Wed, 31 Jan 2024 08:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZEMofF/"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB9F5DF14
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688221; cv=none; b=ryL9ksK1243SapF/w06u6ShStT4Z2ADZR9mu2c7B7awHMqqq4BmhYl8penQ5AzuU+QKvAXj340cimTfHWUpFNqXcy2jX/+PGNpmuIu0h8TI/yifgxuAbCXBaxy/yS+aQjbxMYQ+YFjFLzDKMBSrqJXJimeWX7MA9tvzMn7RTRNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688221; c=relaxed/simple;
	bh=opu0J9XakpfZKh/4oMykdhYwG5diaCrPXUI9ILQknxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Wifrb8rQoHDXXiXXS5OgLATDv4su1oZdmyRVF/U2jnNiZ9nZmWBvhfPaixKNvWWDvCci6THSe3IJNvHhSYauMapAfVngBzTyugp9P+Vd/qKuTlI+nAZjAkjRs7CbRt1oPA6jXyf45xLQZk7lP84MwLG0NXELLb0lUn5FB3FCTu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZEMofF/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so685860866b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 00:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706688218; x=1707293018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbDmv4EAt/aQUJgtXZLESeGUGFU23aQb6H26VIwICh4=;
        b=FZEMofF/hlGiIAMyhFki6U/yLLAIuemylujKw9ftjNBVn8IFgq5Clzzyc0LdBZFr7m
         H9OUp7JHT4wdhr/GvSNNGYzsfH83cHLOrFgTcaqLQDT86GQpcVA51FZdpAqNFi7ul5UM
         k8t7RstPSEIoK1w4GmNF8DW6enkWFAz7UG6xCcQH8KJNoxJ7KAjJBckifwJareXgiC2S
         iKcn1G03rMjLMxiNOf5T04iZ+ugg3tMxmutUNrwD127ZRKDWfIiM9EprdaXVDTEcHExh
         AwZn7ycPJ41A8CDQADX67t24+UsmoykTXkGehbn58q+5jz3jy+kHF1McsVk7ca/9WWZB
         ITFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688218; x=1707293018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbDmv4EAt/aQUJgtXZLESeGUGFU23aQb6H26VIwICh4=;
        b=ThNFvYhtDlRLvvPulk/aNFRPRpyXsUjl3u7Y9tsfD87ZMoaXoq8WmM+kVGI4xPYN4H
         rDg251feXwb4kPl9wrjovDgGMUNNpDBqGeHN0d1j0VNKSOl2KkLGdMOy5UDXtFTtNYoA
         zpgEBfwFHFXwUGqprlSHfK1Y71PZvRCLD7zJSlxe7yQTVkCZQ1dSeGsly4DQBR4jBWUO
         EoU4E9Z+Iu8/J72vCBdJyi3pDgSV7e+QT/p29KZQmynltW7XcmDLL/zRtZoX7S34wLGh
         IQHCzVzqWwsh9XgIU4OelsX0uTkuBsHcV2cYRyxGG0EgK0uUqXGErX5+G6WF5UHD1sbp
         HDuA==
X-Gm-Message-State: AOJu0YyI7VUCU9930jaB45Wh44S3nfRAHi24k5fPVYUuJbtPRQdB32Ra
	UM+8LvNqozTcMye43SYh+E1Ou0KDwO8v0fBFcv2ITzQjOK+PTf7vrLgCla2lBRI=
X-Google-Smtp-Source: AGHT+IFm3iANxrEWin4mPuUXIiBJqx3tbNALXzivFrpJ5tW3fLwqKdVmSV4+6GNHJElC0pQWyzyRXg==
X-Received: by 2002:a17:906:3e57:b0:a35:f446:d9bf with SMTP id t23-20020a1709063e5700b00a35f446d9bfmr559289eji.35.1706688217933;
        Wed, 31 Jan 2024 00:03:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX1KffLD0NOYwbU+/4ZLtoBW121vlQpfklNtK2hxHQBTt2U4xi3bhgqqCJ/BORCxTjSL6ATvTBhi/4K1FEy+BFdaot6bs/2DUhMGFHqIxYBiZoEy08J8Kc87BU19f1RT46PsU6LjbN+Db+zTN9/i8MwwNnv5jWdA8ql5m/230gFsgAC9IzflBrvZ3MhNpskjVwoFH24LoDwH1/DgZOZZ9zek9MGYAea2GmrU8ZpIr6jyg1X6dBhranC8jYplV/+7D15npQyYsBF03O6Ke9N4SqkhxWSxnpQ4dhXuvaLzAfTPoFKBEKXv9zE/f8vV1QJX7SR9TdHvb3lZgFBUI5FH651OdmmKDb+HpIxbO5mX7U957rYKEJxC/UQQwx5CIBTky4OV8ruXA==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id rs28-20020a170907037c00b00a2ceaf80bcbsm5904452ejb.204.2024.01.31.00.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:03:37 -0800 (PST)
Message-ID: <6508a0fb-6b5c-44e8-bd98-2cd70ab8f6b7@linaro.org>
Date: Wed, 31 Jan 2024 09:03:35 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: Add MPQ8785 voltage regulator device
Content-Language: en-US
To: Charles Hsu <ythsu0511@gmail.com>, jdelvare@suse.com, linux@roeck-us.net,
 corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240131074822.2962078-1-ythsu0511@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240131074822.2962078-1-ythsu0511@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2024 08:48, Charles Hsu wrote:
> Monolithic Power Systems, Inc. (MPS) synchronous step-down converter.
> 
> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof


