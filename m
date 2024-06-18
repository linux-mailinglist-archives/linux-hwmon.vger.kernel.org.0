Return-Path: <linux-hwmon+bounces-2731-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997590DE01
	for <lists+linux-hwmon@lfdr.de>; Tue, 18 Jun 2024 23:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936C11F23291
	for <lists+linux-hwmon@lfdr.de>; Tue, 18 Jun 2024 21:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E188176AB2;
	Tue, 18 Jun 2024 21:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFc2ySeC"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B516D4E4;
	Tue, 18 Jun 2024 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718744944; cv=none; b=RmjZGcThsrJ9r73fm7RvbkhtJks3ISZkN1tO59+wFVX3Gkx944VL2CC2CqIOOVO3iJcbVwQwV8cWKGKEYcT6+YQJU5qkOhBJ/eoEeqwcpUJwWuksASbSahJT19Xh1RRAdwriUSC7/4CrF57y+c3ZHbFUlV6f4YeZiOLyta7+twM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718744944; c=relaxed/simple;
	bh=SpZaISbVBb9iUDJHatkJRwQpc/R/fWmgwWwgUWBSI28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/uEU3eYj1G2x0UqjZkxMoywErDkgIhw2eFE9RW70roUAe8+GScE4JbcMVEIxNP62dvnCXZvafSSGsfpu600IDKRe92v4CxcKy0e+0XMzCpXGZvHQeJEvUeveT01ZLtE5QASMhxdDcPOGGnAdk4Q51WVpAAnd6JHPXTT1J5wN9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFc2ySeC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70625e8860cso668967b3a.2;
        Tue, 18 Jun 2024 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718744942; x=1719349742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=U+mgf92UzYz1g9WJM1jvVrJIcNR6Z2RVVltO+KcadmA=;
        b=YFc2ySeC3/SAa3cjNY2pr7rAYBTghf62s9Y9Hcm/GhhAYM2jFpJmL6vSsY6Ra6niYb
         d1O3zRR9RzOyI+2/e427fJ9qypsk4JbYPzhK7b/1oHBRsL8glGrUxZ6Ie5IPYExCez2a
         DC53R2BV77azJz1EvQizfTjy80y6s1yxpdi1fQqzcwkdlJp2qRy7FZO7HU+s8aHpPdOg
         0LQsJOpQLVBs2fVI4nRFZrmioBELmmRSqVxEwoE5LqVfI05aYXN9oNvLIBu04YcwC8bU
         V9BRXPhh7LfK9gcT5s4EJtb/Hx59ge0FBoLhNBPcdRx/RI8pcpVua+Hx9Vgmy8b2gqcn
         AEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718744942; x=1719349742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+mgf92UzYz1g9WJM1jvVrJIcNR6Z2RVVltO+KcadmA=;
        b=uU477V2Hgtl5o1yhkNBl4Rg0pftxFfpGS3KXIa63/3MQQzCgzS2KFyF1z1KWneLB75
         whQ8ZKTcIonq80JO0aXvl7Hv8gyGcju4xMmrK2OZxaRwbCE6waAYimxkaFgintEMT1P2
         M73GRJFXMkk4GiNknYqeKtpv9DgwsHPxxLJCON87+IuMbKl+yl4rrvJ1FEcNsoeE21Cf
         BfFs2FpKDuuzJ7B0JTY6b8hWeHaLRDYZiqeI8kSA0NVFpn0Kzvp5uN4EszX75XoSz95r
         njoh0uqbMCjbDLmPlkgClLccSEXcFs60PE58b+0R7L+k2jVA3cXTl/VRMAfFKMBs/95q
         iiqA==
X-Forwarded-Encrypted: i=1; AJvYcCVQtrFsHL3GQWonXzSnZgj29jNyS5gjX2fSo7gR0T33HSIpMf1WTSBBr9BR6EmHleHnv18lhHV0LsDRhSuZhvWtP9aBncdatmq6TD8=
X-Gm-Message-State: AOJu0Yyi1Xrmfyw4pY306+Z5QLz5O8Lb4+qJnC/kddUvAaCg9k09B9Vc
	RoyWwCxnXNjNQseq33Nhwx+KQrBY3q3WZXkvFaDe4dTLzl9Ul7+IweVeYA==
X-Google-Smtp-Source: AGHT+IElrM0fTf8G2+Otc/FtPEa4yz02cEvWa+Rz5+NhCjPAMlHh52Gl+Ns/osoHhzaulUpHwRa1rw==
X-Received: by 2002:a05:6a20:cd5e:b0:1b8:4107:ce3a with SMTP id adf61e73a8af0-1bcbb5d4c78mr704424637.39.1718744941812;
        Tue, 18 Jun 2024 14:09:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d1ccsm9361749b3a.125.2024.06.18.14.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 14:09:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <661def21-b0a9-49c1-937e-8526008f529c@roeck-us.net>
Date: Tue, 18 Jun 2024 14:08:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 2/3] hwmon: (spd5118) Use spd5118 specific
 read/write operations
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>, Stephen Horvath <s.horvath@outlook.com.au>,
 Sasha Kozachuk <skozachuk@google.com>, John Hamrick <johnham@google.com>,
 Chris Sarra <chrissarra@google.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>
References: <20240618195348.1670547-1-linux@roeck-us.net>
 <20240618195348.1670547-3-linux@roeck-us.net>
 <a7f208df-4c9e-4fa2-9d17-80895db51182@molgen.mpg.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a7f208df-4c9e-4fa2-9d17-80895db51182@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 6/18/24 13:37, Paul Menzel wrote:
[ ... ]
> Unfortunately, it still fails:
> 
>      $ git log --no-decorate --oneline -4
>      7ddcff2d44ae3 hwmon: (spd5118) Add support for Renesas/ITD SPD5118 hub controllers
>      e89136743324f hwmon: (spd5118) Use spd5118 specific read/write operations
>      0fcc7279f0cc4 hwmon: (spd5118) Use regmap to implement paging
>      801b6aad6fa7a hwmon: (spd5118) Add configuration option for auto-detection
> 
>      $ uname -r
>      6.10.0-rc4.mx64.461-00050-g7ddcff2d44ae
>      $ sudo bash -c 'echo 56000 > /sys/class/hwmon/hwmon3/temp1_max'
>      bash: line 1: echo: write error: No such device or address
> 

Now I am really baffled. I don't think we could do anything simpler
than that.

Please try
	sudo i2cset -y -f 0 0x50 0x21 0x06

That should update the critical temperature from 85 degrees C
to 86 degrees C. If that doesn't work, we'll be really out of luck
with that controller (or at least I don't have an idea what else to try).

Thanks,
Guenter


