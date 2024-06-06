Return-Path: <linux-hwmon+bounces-2546-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE38FF166
	for <lists+linux-hwmon@lfdr.de>; Thu,  6 Jun 2024 17:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549341C22371
	for <lists+linux-hwmon@lfdr.de>; Thu,  6 Jun 2024 15:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482E4197A89;
	Thu,  6 Jun 2024 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrlWybBZ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F43D19755C;
	Thu,  6 Jun 2024 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689393; cv=none; b=IYEXUKl/wEvvSUQNvXJiIqY3w6+DkIArHMPy8GBfL7NsDp68xGekAYeJKbEjwW1HVRez7abV0ZLjvwBwdOIyt/Cq1nFLVfkbXh3kUNS4OudmAd+RUNtlDoY1vDugY7gyco+ZnwDZ7+X8eLAJg9FYZ1/wA6T+Jd7W0+d5+zts7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689393; c=relaxed/simple;
	bh=aN7hkfedECxgkVE23qR9N+sYKz/S1B2IOFGhsAJmM2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TJ6QJjyXA2k2F21uXOzG6nYejw7B87stChmxwa7DJZ7CsxmRytP6Dm+DnsR/38wpB849EgO39Q51BQBfq84bGDwNJK67ancOqCMtxy+ufnvb0AeCFIkQDOk9cheVLQciAED+c7qUdVoTP3wznPJwrR9M+4dJKDTrNHw+QOGTFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrlWybBZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c210d3dc6cso906302a91.3;
        Thu, 06 Jun 2024 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717689390; x=1718294190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rIY0Sjutq2SY/qAhA7gEXlN2ObMxXgioEhBGlNvC0rk=;
        b=BrlWybBZ4YXlJ37lAri8GzHrrAPk2/s9IMQPXdbH+bHMC97R0LrFc531g104aBPIZ3
         GCC/7X12fZrNzsiA/NLWhFxTzQOmUDaDai0s4LccAO7PrlLMUu7HAQ4nxHZ7auYtI7WI
         2Nlggq4d2ZKUmOkT7ICAvYrwHLGtQ0PQk6+7QCBp21PXIT4/q+vLbk/OkMli+IK+4soX
         9QeG//t4EdoqGkzITqpai7hvbSV1EAQZIdPEsOVci9/9m3kLreGmO1amTO39JLmHF90Q
         BxyyQxD8B5FJADPXjO0lNYczcqqibH12XebaTXfY1FCB26AjmIgNyVSEq52kQZy3MMl2
         p/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717689390; x=1718294190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIY0Sjutq2SY/qAhA7gEXlN2ObMxXgioEhBGlNvC0rk=;
        b=m0xVJoiolVT5V37ds42399WJQEBC3tPfVn5LShP597sX5BHCA45mXBkuvsxOZQms2D
         Syd7I09is+mhUsQbjrdWihiynobTRQftUgCaWudiIL0BNc3pjArFcdR66g+0GnQQ5kR0
         ddDH0YiQNW5r8Iz7L3fOnu2vQ4oymklb0C7RCA6Q/5UWC6MqXPR4CFjlUTK0PWD4hyj+
         8V01Svh9KpGWEWGT0bI9DlE7pAa7qu4aaHRncIVCNflJN+A91aQVCFwIgKpIHsoAtcsh
         L52+JL8KTd+bz0xc8raKesEKWL0mJwrmS8zBs5fh+xJyiCpNuvtbbQNZN4u2hP58b1NK
         1jhA==
X-Forwarded-Encrypted: i=1; AJvYcCXG6+1YV5FrAUTTBXYtkN/6hBpUKSIBIg5EkvQQm6njuLOPBvIEm6lSIKlgzNXgg3YUpdVhAWWlJKu2Eq1qu6w5zWNmswzfSt4pv+mx7flQAxstLCgxK3dC9C8/pu2uYHB/OtonAgXOvxM=
X-Gm-Message-State: AOJu0YwNrd9UK0L0+vXBjNpeXpuZ8oHgyHSoO2sPTpwDCEWFRwcZD8bf
	jWGq31DVuSWzNKo1RK1mp7YxUmugZAmvc04HBJMPIBqYp6tGKl5O
X-Google-Smtp-Source: AGHT+IGreggTp2+HarPrTH2cwRbn8GGPf4N/449Y7qUxOQCMuQy399m6/OXcwYrALtrErwdGdTcMqw==
X-Received: by 2002:a17:90b:110e:b0:2bd:b091:bae1 with SMTP id 98e67ed59e1d1-2c27db18bb8mr6150891a91.25.1717689389379;
        Thu, 06 Jun 2024 08:56:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28063a7fcsm3763521a91.7.2024.06.06.08.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 08:56:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <32a542a9-e338-4f8a-af24-a32c8426e619@roeck-us.net>
Date: Thu, 6 Jun 2024 08:56:25 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: lm70: simplify with spi_get_device_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240606142515.132504-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240606142515.132504-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/24 07:25, Krzysztof Kozlowski wrote:
> Use spi_get_device_match_data() helper to simplify a bit the driver.
> Also kernel_ulong_t type is preferred for kernel code over uintptr_t
> (needed for the cast).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/hwmon/lm70.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
> index 481e4e1f8f4f..0d5a250cb672 100644
> --- a/drivers/hwmon/lm70.c
> +++ b/drivers/hwmon/lm70.c
> @@ -169,11 +169,7 @@ static int lm70_probe(struct spi_device *spi)
>   	struct lm70 *p_lm70;
>   	int chip;
>   
> -	if (dev_fwnode(&spi->dev))
> -		chip = (int)(uintptr_t)device_get_match_data(&spi->dev);
> -	else
> -		chip = spi_get_device_id(spi)->driver_data;
> -
> +	chip = (kernel_ulong_t)spi_get_device_match_data(spi);
>   
>   	/* signaling is SPI_MODE_0 */
>   	if ((spi->mode & SPI_MODE_X_MASK) != SPI_MODE_0)

I'll apply this patch, but ...

I take it that the earlier claims that driver_data must not be
something like "(void *) LM70_CHIP_LM70", where LM70_CHIP_LM70 is 0,
was wrong. I'll start reverting all patches which changed starting
enum values from 0 to 1 based on that wrong claim.

Guenter


