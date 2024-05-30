Return-Path: <linux-hwmon+bounces-2326-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 630408D45A6
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 May 2024 08:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 161321F22A73
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 May 2024 06:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF9F21C172;
	Thu, 30 May 2024 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPtIVKDZ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E02B9A0
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 06:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717052031; cv=none; b=el/h33ER/4h2M925glYoLb6Sbu1flLQQ3avgjWQEJjLUJEJ6gZpo40a7gJUmWF1sswkVn8/JIeDdmhyrX4eV6A6DiZPPMhQ0KJ01I2p59rAZfPh8ayHFQGi/Jo0HrkVjxYzF15PI0ShzbTL64BdAWIhbxpUpNVVE8iqcqRd4dUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717052031; c=relaxed/simple;
	bh=nMSP1wf6CDY4ywhH9h9GzjkR0NTgug1i4YX1MvTBh8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wt4LFpCae7zHyJzCyg3vPr2fe+RhYB1+PalGxK/OcJDH6qyaJY0ejzr16pB1kazZhvzXYq9jgSnigYX+6cUAc8LPu3PmhplrUH5paLPpBOvwL5vw6iD4Vzl2ClspEulYL8FSxgvnusRJiXSHQknwmJxYdXLHtpUE0ry0B6or/4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPtIVKDZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f62217f806so1427195ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 23:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717052029; x=1717656829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/sgmctKrQSQlTnaFiZDis+3rSf13k/xQkAo/xHZAUr8=;
        b=NPtIVKDZma3aeIYLPJliwRFelwvBfMEHSr1d6t3mA9XdlkLDCwY2RaNWLF8xrTOBXc
         /fIl0VgupHvg7diIvbMa0NtD5DayZhLEL93tV3hGnDA6uxQi+37X8cjXA6Q0oM+KTLfV
         JpYbDHTluMhqlARUec+V6/Zo+vL5oC56PSi3bSCJEbhAV4De0kzdH2OfhQfWhGWK8wpv
         kEQ1gsQ9wDswT0mEsq2E1unQkZp84mv+Mmc8CUtYK7I9jclQWMlsjhloJDP2yJYcVuLP
         U3XYIpsnpUSkeYkgaWorpUI7Tz5AOq57DjvzfOGPY9kIoROY2xyCFzUQ+073hDGf1fy0
         rcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717052029; x=1717656829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sgmctKrQSQlTnaFiZDis+3rSf13k/xQkAo/xHZAUr8=;
        b=c7fKsheNRTPIHucSk0NZQWGzSVujpJB6Qh7tdPIcQs4SI0YxhXMZHjMXPMWaWgpdyy
         jfL+4Em3FueHqzhhBwaRVLqnAP26WcVbHMLuL10ilvquvfyd3NeWIft0nAccYEVOtbuT
         x0Bs9vZAEH6gRjnY5nd2dE+8AbzZhbZZESxe7aIqEiMqSGEsRtekb7Cw5IBXZ7ZIGv7E
         ib+0+BRvtAZ+eiFzKYWXD8CGnCMysqUDL357NEObdoqgyrk2GToi3/CBnYTnxzOy7QrT
         PKjoEH/XDNDuWGGwRFvqRHv0MO9m7WdlT1P0AKgPvPQKLJPCZEK2Q8LwzsJ9KLIPjYDh
         rXlA==
X-Forwarded-Encrypted: i=1; AJvYcCVoXSgwd8ygUD+IOjYjo4SzpQzMEKICDhpmRa8EvnOf5FNRc4+iG7A+LYYeRe3ykXHqgDqu41tDM/gA4zLoAofPCkIRgoMQURyATac=
X-Gm-Message-State: AOJu0YwMW2BgPjEUr2l57JBB36A3qcWScyibcDYxpUYk9+K1ttSLArsM
	QoHFMWsOu6vIQnqYcPb/GbI4UGZDPq96L6lmFE8XrVbwzPGIN6vj
X-Google-Smtp-Source: AGHT+IGXveR8jjVBs97hcCjU4JF6JjtSLLqwXyC2VJJubDRkUL+CkSqQVTXevFGTIq1eCXJWFNRJ5A==
X-Received: by 2002:a17:902:d2d0:b0:1f4:b18a:3f25 with SMTP id d9443c01a7336-1f61a4dbb18mr16954185ad.60.1717052029208;
        Wed, 29 May 2024 23:53:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f4819346a2sm82200595ad.236.2024.05.29.23.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 23:53:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fe876f5c-c5c3-42ff-b45c-5c985e659ee9@roeck-us.net>
Date: Wed, 29 May 2024 23:53:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (lm90) Convert to use PEC support from hwmon
 core
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>
References: <20240529180132.72350-1-linux@roeck-us.net>
 <20240529180132.72350-3-linux@roeck-us.net>
 <6d6ec285c74afb68ca448b0188903cfeb375ccd1.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6d6ec285c74afb68ca448b0188903cfeb375ccd1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/29/24 23:38, Nuno Sá wrote:
> On Wed, 2024-05-29 at 11:01 -0700, Guenter Roeck wrote:
>> Replace driver specific PEC handling code with hardware monitoring core
>> functionality.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
> 
> Acked-by: Nuno Sa <nuno.sa@analog.com>
> 

Thanks!

Guenter


