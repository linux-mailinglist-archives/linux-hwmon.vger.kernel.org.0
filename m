Return-Path: <linux-hwmon+bounces-6034-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A89A09EF0
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jan 2025 01:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4988F3AAB9E
	for <lists+linux-hwmon@lfdr.de>; Sat, 11 Jan 2025 00:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B0193;
	Sat, 11 Jan 2025 00:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGgNwZnI"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5653A7;
	Sat, 11 Jan 2025 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736554093; cv=none; b=kLCNtXsAuuRE3lOkVITwN/dXks1/J9MC6QodVlFdGADl4ysDtSQnKCnNl428kIZrvwtjlkjO/uhn23L5C1/AjEGRCGyUvzLx5YparPPSGkICq32p+DkqpjkbNh1Wp7LcI3AGBpCT7lyP009G496bTLrUVC92DF9qRpaW+YUxc/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736554093; c=relaxed/simple;
	bh=/wpudZIiSYVNH4rKj3PRFcOtKnxlfV3UnEbeP8QZ2K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ti0OJkcs/cv+ckJiZqHjxs0TygxYEP4XAbc5V0qGETE1axxtDm1SmVeekIDzlVP0O9VZMG/I4+qoIvg6QdTA7wAfaRlBq3kqFYI0Kcl1cD8sPr2N+x7Z9Zy+CylS5oHpUAg/lgSDsYLljk7Q1OAbPNXyrwUqiCCASPws7sVXuyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGgNwZnI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21649a7bcdcso43054155ad.1;
        Fri, 10 Jan 2025 16:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736554091; x=1737158891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PLxQ2bePhVaVTW2DdEGOaGquer6lWt0Bmgv8Nn2tYPg=;
        b=GGgNwZnIQJQRDr35iiVPYC2uskHHJ6EoFYQNGpx3ZCGEo4mvW6rioe6041xANsGJ8V
         EG1YhOTZsTF+b1Q8usJopEEbtIjV2Rg9PAGcCtehxPWbb9wFmvUljvnvhSCE8S99pnuO
         MzJ/NoWIBisRvC5rWq05zoL7CKUEcJzBo5s/au4gtZ+zXlrVqaMFHUAML11YPGGgndnS
         Jw+xvaSw1F9e6r6xZyRa6NXJEHNF+vNIdAj++sbE15mULnedov1ihMeWnxkcglAu5iEW
         /gJzdUS5rtr2XSyX7oSuYcocoCL/B/0+IlPpAMrxL0w3RrnorPmE3vUvCZeFp4Ys61o0
         JIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736554091; x=1737158891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLxQ2bePhVaVTW2DdEGOaGquer6lWt0Bmgv8Nn2tYPg=;
        b=iX4ryWrTdbSgNLF5I0PPDzCY4CCAkrxZNkVkwb+KfkU9ziWHvxWtQgSCIT+RUn+M7T
         wSP86+lX9fQo9ohVbp5a+CF0jEqKUgZsUSxS9FVeh1XIFOI9ZxLOwo8XXVPxoo3Q79/e
         0Z4NqzdTFCCRK2/897r3IRDdKB/h/OfbBnxFscMg4sFw/RL1gJKMg2eUR1PbeFfN6hen
         zbrwarkRUkiwgFF80Quv51VNUZSotsuZL5hVlVLxD8gwKSVUEhjeNcu/ZNDbCbDpA+fY
         47GTsQwxrk+IR/a+jqtghKzeevn0Voiy63w0CzZvxnQcmzilmPPBMBhATLfCgIO5aRoK
         6upg==
X-Forwarded-Encrypted: i=1; AJvYcCVG7tTeZQnHJ0FTUuWzzkCG/InfpLM3pEqIUSO9z0C7tQA9ul1prSCXFs7wAaSsDFUYKGR6eyDY@vger.kernel.org, AJvYcCVVkHDGAB6hwzSayznM18hrOWO8oQ7+rApJvoFxpUnKHm4LGEv5/MS1QesGxjczan2/XTL3fD0vwjybpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO5XuanU33I4A6qlNc/fUdNOXeYJuOk4rBd1Q53KJOGe8kD8Gm
	QtN5jHuDV4IhyZ07o7pEvelLtdybZMtEOKe0xF2mNUztsqLQGjcR
X-Gm-Gg: ASbGncvFfCEbTbQxPrgn4zjGb5pgKAdvey64rMUGMOqANR5zZndNtVNTx+L03vqd0q+
	rL/jV3ocnES3DB7hqEufoZvNed40WKqbhix7aKVETbehj462spQaXq3mBvbbbirC/LVbqdQzYJL
	pKFlYC4b8j+rMEqwYe07jKGALewcNU/JCmYw14982ZZVd8EOzVstAW8V3fsHRjRfifZSFwzj6LM
	OvBylGDO0D2JMjqdNrXZSzCmfI/BSOKrjhv5IihB2SqSHW5ICVWT+t6urk/f/LqXDwRURqbv9Yq
	33S+gricqhTS5UiTzHpTCtZcJ2d10A==
X-Google-Smtp-Source: AGHT+IGxDp01Ajv2UFgUMzDo0bOmhWvoM24WNdV0a+IKbZ8T0t2j23lmfLA8lfGSZy0YR5RN51BixQ==
X-Received: by 2002:a17:903:4408:b0:216:4e8d:4803 with SMTP id d9443c01a7336-21a83fc02edmr195897455ad.42.1736554091224;
        Fri, 10 Jan 2025 16:08:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219e65sm18182895ad.140.2025.01.10.16.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 16:08:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6996e709-ef77-4fc6-ba78-1ccac40c3fb0@roeck-us.net>
Date: Fri, 10 Jan 2025 16:08:08 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: phy: realtek: add hwmon support for
 temp sensor on RTL822x
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>
References: <3e2784e3-4670-4d54-932f-b25440747b65@gmail.com>
 <dbfeb139-808f-4345-afe8-830b7f4da26a@gmail.com>
 <8d052f8f-d539-45ba-ba21-0a459057f313@lunn.ch>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <8d052f8f-d539-45ba-ba21-0a459057f313@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 13:10, Andrew Lunn wrote:
>> - over-temp alarm remains set, even if temperature drops below threshold
> 
>> +int rtl822x_hwmon_init(struct phy_device *phydev)
>> +{
>> +	struct device *hwdev, *dev = &phydev->mdio.dev;
>> +	const char *name;
>> +
>> +	/* Ensure over-temp alarm is reset. */
>> +	phy_clear_bits_mmd(phydev, MDIO_MMD_VEND2, RTL822X_VND2_TSALRM, 3);
> 
> So it is possible to clear the alarm.
> 
> I know you wanted to experiment with this some more....
> 
> If the alarm is still set, does that prevent the PHY renegotiating the
> higher link speed? If you clear the alarm, does that allow it to
> renegotiate the higher link speed? Or is a down/up still required?
> Does an down/up clear the alarm if the temperature is below the
> threshold?
> 
> Also, does HWMON support clearing alarms? Writing a 0 to the file? Or
> are they supported to self clear on read?
> 

Alarm attributes are supposed to self clear on read unless the condition
persists.

> I'm wondering if we are heading towards ABI issues? You have defined:
> 
> - over-temp alarm remains set, even if temperature drops below threshold
> 
> so that kind of eliminates the possibility of implementing self
> clearing any time in the future. Explicit clearing via a write is
> probably O.K, because the user needs to take an explicit action.  Are
> there other ABI issues i have not thought about.
> 

Alarm attributes are supposed to be read-only.

Guenter


