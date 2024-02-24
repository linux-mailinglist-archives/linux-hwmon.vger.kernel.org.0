Return-Path: <linux-hwmon+bounces-1241-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5D86246D
	for <lists+linux-hwmon@lfdr.de>; Sat, 24 Feb 2024 12:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A7F91F2263E
	for <lists+linux-hwmon@lfdr.de>; Sat, 24 Feb 2024 11:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25E024B54;
	Sat, 24 Feb 2024 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t0eIfeI1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB532260B
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Feb 2024 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708773226; cv=none; b=Xe9cJovXIfya3qKy/p8Q+HOE2g9YYyCgRJoY5u9osOoZpkEwAhVp8k25mB7FfnpOomgCEPxDO5SPC2aOa5PB7teRkoGlwHC77gOpe883Bgm8+ihAzV7AAgzGBc0rngzZRq7pdkERP/2kCzMIhG33Plblyx+WCfsDZZ1O8dyw0KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708773226; c=relaxed/simple;
	bh=0fpD9n/frVr7ljFFukzv4yz4QAErro6+EAt8bD0V85M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mn7DEnhpuX5gJHLST/b2m7c53P6Gg8BvxFr7fF9lPyJMtEDZNzzoWffE8YmCy59fznvu7Eh4yAo9/TKNaM4zf81HSg1cfaMTxfT3fqeVM2C0/BwtXw4O+pTWUZKVKIX8miAn80WNnBgk8/oUT7+BwGAh/ksvSH7EZyCp/Wp9MDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t0eIfeI1; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so2349667e87.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Feb 2024 03:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708773223; x=1709378023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQNPJbwxd8jfq5v746wdDlx4tQYU8cADwmK934FmLC4=;
        b=t0eIfeI1w95C7cl16CFQ/IUkTth/zmKMCEnDGdx6QaiMl99Qq4GreHRJHx32TGMkY/
         HMvFRl7WVV1lKpebaPYuWWcHdaL2N5/voY6eyWsq7/mzlYCGNzHQdPYxlmVWmtQU+jT9
         5L1UKkwRHomIX3HRKHwG59RnUT9VNTjQBEGkl2hIM4YhB+mtONf3bM635z9MVIdtw8z7
         cgefKRBd9VYsihy6X+UXCm/CjdBXEnm4w/paQkm3+dUOpoC/GBEbdKW11ojEukAqRpko
         wW7IHcG1LxFK7cpx8N0Xq/3cg+rIJJUjOAdPUlqnz1lr6RArDf/rZgMn4dL1ZgMDPidl
         vPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708773223; x=1709378023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQNPJbwxd8jfq5v746wdDlx4tQYU8cADwmK934FmLC4=;
        b=gHSO23E7D+KU4RsrpuduJZacZcJHGrc+yoKVGtN1d2uhjh4yPBmicQusod2d4Y+S0J
         1kNnJvLLlYOVrpreao1TvSFJR96/YMeBg47BB+QodTmm/bOqj4I9CN2yQnETJYaUVDSd
         6nljPPMy6ct89QUdRU4I1QCQpfLst7E7FUKP3O5U/+O/iP76NViblwJJ6eYti8GAupfV
         LrVHTOWoUzGb9z6+zQRmMVKF3B1miopLmqkZjvfz4HkjnIR8dGhLwATCOMq4eTGue+ey
         vmfuNC66FjYRQ7HoRIDIKAKthnFyAPFNsc55pE8GlaWPoIHZ4PNSiGPWsawSUo1evTXm
         ozog==
X-Forwarded-Encrypted: i=1; AJvYcCXA8qAoFu/gzqyKw0vnnJIhPTmGQc6TZ+PKVjk25mP8mO6e/W1gWkI83dtWr9ObbacY58VM14FlGNaUnhGdKumwXxLThlx2mbEbR5o=
X-Gm-Message-State: AOJu0YwqQkYgvbd9/3o21koo8ukXZ4yfJKP1aClUd+Gz96xIBoOrwU4V
	xvxm0jpyKNgPTs0a/po1fppo3UkHhJTk40xFuq7YtqEApDFVdTnaS/X+tNu4hiE=
X-Google-Smtp-Source: AGHT+IGB/1d46W5Sg4vNEZP+Tf0rjhjkfX7T0q7HXRKcZ98HPZvWJ0vbsCpwDSPc3i4Nerg46EbvTw==
X-Received: by 2002:a05:6512:2349:b0:512:a013:12f0 with SMTP id p9-20020a056512234900b00512a01312f0mr1635982lfu.64.1708773222975;
        Sat, 24 Feb 2024 03:13:42 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id f17-20020a05651201d100b00512ed75e780sm172945lfp.249.2024.02.24.03.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 03:13:42 -0800 (PST)
Message-ID: <490c8499-c082-437a-88e4-2b66b27bb951@linaro.org>
Date: Sat, 24 Feb 2024 12:13:39 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon/pmbus: ti,lm25066: document
 regulators
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux@roeck-us.net
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Peter Yin <peteryin.openbmc@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240223-moonrise-feminist-de59b9e1b3ba@spud>
 <20240223-tingling-mutt-dd55dd87ff5e@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240223-tingling-mutt-dd55dd87ff5e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2024 17:21, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> All devices documented in the lm25066 binding are intended for use with
> a regulator, be that for purely monitoring purposes (lm25056) or, for
> the other devices, as the controller of that regulator. The binding does
> not currently allow regulator child nodes, so add one.
> 
> Each of these devices interacts with only a single regulator and
> documentation refers to it as "Vout", hence the choice of child node
> name.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


