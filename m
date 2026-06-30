Return-Path: <linux-hwmon+bounces-15501-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s3sILvbmQ2o0lQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15501-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 17:55:34 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7286E626D
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 17:55:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VnbjuEFR;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15501-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15501-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0919B3128B7F
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB2F4657E0;
	Tue, 30 Jun 2026 15:48:28 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40345BD60
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 15:48:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834508; cv=none; b=pHwcsvjuhQv+39FkDE+iDHNRHYBpp9oxf/zeB7NpLNh6XEmM4R8JD+woipdBAUQxdPkTwMnebn5AHKmXEVonA8ejtoNM4vxj/uFfr8dOUzZz5c/Sn9gmVKMen0hP6glBuAoEGilX6iHjpFV/96AqQXIigMekLHn8uTBQzKGMx+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834508; c=relaxed/simple;
	bh=5daw7GHF082XZFOBtpOcz+XZJghpPd5rcNaXIs/Gqfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDirmBXV+KztOJt4yjFEC8qYW/2u/2+/AmIpVZKNewJP38oQ+G4Xt5eTZ3qjqtC3AGi96j+6BnGnlkZV4qjzhR6G+KBLED/ceSoRu0Cxz3NPaOYu/Fi0Ueb+P6CH6hu4m0e2rfo58yUavIzxAgcKCbB/7kji8aF5bphaCyVb7Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnbjuEFR; arc=none smtp.client-ip=74.125.82.50
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-137335bc3caso9838817c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782834506; x=1783439306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UxCj86Vqc8nQPo8juJb5HDgI5Ftj5c58cIVgplQr+NU=;
        b=VnbjuEFRE3gvIfQcvUsm6IxIqPkhKen7u7C4QKPO/ANzDUwqrBXme0hGI1s+Wh9JLU
         k5F5KvSXArAxlX4iwduWiSXH4cThMZ2Fj5G9Km5bcPGurQtgTWTND5H2es2klNJYTDL5
         xfmy8C1r7WD93i26rGgE7sI/ni7Q3Q+3MvtRvnIhIkq5dEa85so+bgMUn65wDhybQare
         shftXkHlbSQwUYVCEOWXM9rq5PLHh14zl9oOYjzZNBbR0Z7plDyxscEWeIUvWacdidZ+
         zT6GBBnah4d59T7uwC8iAdrPwpuWXp7zqYa3ESHfGSz7kcjvLrjoEAF9gnLlC2WQGv6l
         UIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834506; x=1783439306;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxCj86Vqc8nQPo8juJb5HDgI5Ftj5c58cIVgplQr+NU=;
        b=VhvkztcQRZpE7xBGTb4LxC964CIo0vpTGAiEjeFF7bz/wQF/hz0flDvihEPEBCyfhS
         zSJPXoA9tJJ+pNrolvzI+2OTWztOe8dBmxGH7G2ieMC5Cw6KXB38riZXTlT9WKGxqVnF
         R0Krn5u26UwR33w+9Y8vJpEi7ywfyCrdX8OwLRrmmAUWRfHvMB7ZoPUTVX/lNvVXUgje
         Os7AJ4iz1q/zzXLbNiZ+qX8lVcDK04CUBrwbCot2wpdQD/5KVmTrmI4mUnhV8eiNBly8
         EmoXY9ZrXAaIVoe3NTWKMvWmCH/WohGSAl2M3j/xjejT4hvdj5RCUgec6aYG0mPfdBNs
         GFog==
X-Forwarded-Encrypted: i=1; AHgh+Rqe1UK42EWkYOplrgNxx550b53K/Hy/IaldLAjyL1NsYKNvSQECYlbShQb/etAOXSZx3Bm1DcG1tMiSLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVo5x4aO68yZjjseQIrGvSaX6Nj4bmPZALnTKKGNnPvgGEtf3
	m9azYkweBzaPNhzr+nSPXIS+GdEarOl8IM3tFxRICt/2hSKny6YmC8sO
X-Gm-Gg: AfdE7cnJRmEki5MVDrnWpSBedGjTwPNbdQjLCaLyy5bejKTrDX6d6vqCNghfTw9Rz6f
	jcmu0WKdbJIeYlZn7lY7t4Kg6tscQaBV+HKZ8OSQYSo2le9cIFnIdi2Z0uSCxpdb+ozX0IoddU4
	3czDnVYpukW2nRgmtJGQE2lXpJwu1omm+ZitwPVzY2hb5TjApCq8RRHjeQX+dsw1RohtcGjmZw2
	kDOLoQe+63tBOT6FvaiY9wgLmoZci7Jv9Y6Sd8rDmbxaFjyK7ENNhH+NO3eWiB0mmVP32ybw/Ok
	U694MQCcCTg0iPbhTK9JR2ZLLaiZn1pieSlV6DVTm7CtXxI5DzGEp8Mj0jNWzHvNU2bv/+18srZ
	H/BEsPXigfw0ub4ZVHeBieOvdu6Un27wj0DmS0t4f4IWqeDfVfPDFaPtqboZVkHikLyiVtrzohO
	vxscFSxKL+/nsGsgxAU67VxRQIwEmsKn+8KPlBRgDsZ6Nqykz5cl/ESb6iI++ZdA==
X-Received: by 2002:a05:7300:5bab:b0:30a:e530:ebc6 with SMTP id 5a478bee46e88-30ee12f0e92mr2823150eec.12.1782834505729;
        Tue, 30 Jun 2026 08:48:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5e4d1sm9007145eec.6.2026.06.30.08.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:48:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d6e011d7-ef9b-4cc8-91c6-3f329017d213@roeck-us.net>
Date: Tue, 30 Jun 2026 08:48:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
 <20260630-cuddly-quiet-jackdaw-b7ab3d@quoll>
 <PH0PR03MB63514D6ACDFF20DF4D1A4855F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63514D6ACDFF20DF4D1A4855F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15501-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:AlexisCzezar.Torreno@analog.com,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D7286E626D

On 6/30/26 01:07, Torreno, Alexis Czezar wrote:
>> [External]
>>
>> On Tue, Jun 30, 2026 at 10:46:43AM +0800, Alexis Czezar Torreno wrote:
>>> Adding a missing entry for the MAX20830 EN (enable) pin.
>>
>> ... because? Device has it? Was missing?
> 
> Yes, device has it and I forgot to include it in the past.
> 

Pretty much every PMBus chip has it. Many non-PMBus hardware
monitoring chips have it. Problem is that there is no practical
use case that I am aware of to connect it to a GPIO pin,
especially for PMBus chips because PMBus (and the chip) has
a command to override it. Connecting the Enable pin to a GPIO
output would mean another extra and unnecessary wire on a board
plus the need for additional software to support - in a more
complex way - what is already supported by the chip itself.

This will even more complicated if anyone ever adds regulator
support to the driver. In order to fully support this, the driver
would have to add support for enabling the chip through the
GPIO pin (or to override it permanently, making it pointless
to have it) even though it is highly unlikely that this code
can ever be tested on real hardware.

That is why I was asking for a use case. "The chip has the
pin" is not a use case.

Thanks,
Guenter


