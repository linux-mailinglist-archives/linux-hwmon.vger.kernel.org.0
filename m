Return-Path: <linux-hwmon+bounces-6356-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B86A1DB49
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Jan 2025 18:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 545323A4E6C
	for <lists+linux-hwmon@lfdr.de>; Mon, 27 Jan 2025 17:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E738E18A6D2;
	Mon, 27 Jan 2025 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjN4Xwed"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC9D18A6C5;
	Mon, 27 Jan 2025 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737998984; cv=none; b=cSECyLQ8VpvXqk3bI+C++RKJZFc5VVa75NlNvcczWlUwt2KfvtCa2MKalAPCOkpovRqdKtCIP6xajgxhcWAlJU80TLcYjM2ReH8O0R2XR1hstnzqG62vHl2nlT/kc2RvZGBdF8ZXLnDlo4iFfa3r89JC6J302CtVuy0FOAw7i/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737998984; c=relaxed/simple;
	bh=y2p/VhfeOKoyACYzpJvlu1+3Pu+6JMzyv8lrjEbrOcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTqQ/AkRHzZAhdQFBczc90+enksqlLrJgGz7EbcJY5O+DKwGIKlnWvHL3MNkfoLMfgv45RuOl/2su76J1e1lCpt3wl4NS4GmZgIaBY17RxFpiIrKGS5mfeWpDePKQU+eTgZRxwh/T0Z/lfOy0I0NdJfdyUovBzZMk8UuOguyfIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjN4Xwed; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166651f752so95316985ad.3;
        Mon, 27 Jan 2025 09:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737998982; x=1738603782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BDtDtJawyOQigbNs3N0WPL5lKPkOWwhgeDJjweSkGP0=;
        b=gjN4XwedR4cO88Nj3+WxdunHNVzOWqoasH/DAvpEi+L5vj1dk6cLIeABdGBG1aruhg
         Pwek4r1M0J+B1i6PpoMByfnWNccZ170agZuxeSqdwtUObhVwreabC1tPWkViFBQnNRcr
         CYwsUDZlyHhdlsCYVZWm7inRcWYYuI2lTDeytSpVdcVKHHJYde8N4XBEJ7q5R3An1MHQ
         DeCPIxMlAOiwtazWCXHGbEjv0gqgLG4hDY3MCucZaYbH5zClKO1dvdrcCqISMOPWfH/x
         6tyLOYENN4LV/KFQw0Dk8Pqveb6bqJazJ3dlw1Z83blO5QLi5ieHhpydiZTCuqilhQlo
         HV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737998982; x=1738603782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDtDtJawyOQigbNs3N0WPL5lKPkOWwhgeDJjweSkGP0=;
        b=Ad1Uf0jIHfpj9hT8+Y5YeRE8Pe3okwur4NJKN3rDqn931Hr0Qfc+bda6Tb1cdI9VBz
         4sN9mjjytVmGmHZQ2j8izOn+2zrErpwhcRI+iIV6L+334X33Gc+8am9Cf5By8e2lpkp0
         Rx4LJH1XuZMNCC3iv3rvl7jufc45esLQL5NFrH2wGUyqJkm3IX2MRCLxPsUOkMRB4cdZ
         5rZbon3nNlR9csvCV5k7dWnDjfGiJb7absVjGiEobMf+f9kHd4oA2NIBWYXUvqKHlLxa
         VDRbsYHFsJvXIc4HgGHo4xFM9nWFoIbh1Cn4uBGgcpE+Am9jYWefuooF4Hx94qque28T
         UGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlaOWiEpJIe71vbwDdJKuogZgFJ8e/W4Q+H1Sd14YkQHT/RgZ277Q+HDMaFtqKJ/kpLbZ3Nkx8al+K5QKR@vger.kernel.org, AJvYcCWFReozoET2A/rTg+D5rSd/crUuIwN/e6thA0EBDF6xftDQGKVdH90hjW3YTfyH8zEbZJQ3qz0SBSN7uw==@vger.kernel.org, AJvYcCWlZxAqbfUHRqW2aAwSwVhDdQc3oz2XlbwaYTtJgux5IJp1ZOQOU+SqO39glzBpOc1VNN425R+Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxP7B1nOQqFkK3M8OzTlPCjChPvGTV4YSBLvBRqFHSyN6uvK9Ib
	ustwqLMU1eS7BMWnHg3zeVEBzBm4zpf8d58XGuq2FZVHX4/6xYj6
X-Gm-Gg: ASbGncs4XtA6x3FlWDtJmUpUx8P6vcn4mzew7C6MARa4ekqct0cYJ93pM42HTiow5es
	QNGMageSQj6SSUngHdM73PKPBcL/lz+qKeCrMQFWujS14zBk7Fan7785lFM384HZsotKjxZXJ1b
	pNbgqEVD1X8C7tcjq7okJiai48jRkJXtsEYtDycjUfUtTyz/YymsEzHty9pE1TdFLbqfTou0OCF
	giPc95prx9fZ4OCZTuv8ZiTuw9309mmU8gCvkpw0eF5yuTLBEeIwYxUW/4Qe7JTg+g8uw4Y/M1t
	RKCFjeH+lkTKrcF+3RVeXmzmrlIPskyHsoQjoKRbiTFXy5Vu/GZVtA==
X-Google-Smtp-Source: AGHT+IGRBJyckC2Cm8GHkPAERJz+atimT6PIbQDDKJRuV7MBOD2JtWGFe+YDWmybnpoW6bYkVGItBA==
X-Received: by 2002:a05:6a00:340c:b0:728:e906:e446 with SMTP id d2e1a72fcca58-72dafbda6ddmr67991863b3a.24.1737998982294;
        Mon, 27 Jan 2025 09:29:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a7609aasm7576692b3a.96.2025.01.27.09.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 09:29:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
Date: Mon, 27 Jan 2025 09:29:39 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "Rudolph, Patrick" <patrick.rudolph@9elements.com>,
 "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
 "Solanki, Naresh" <naresh.solanki@9elements.com>,
 "fercerpav@gmail.com" <fercerpav@gmail.com>,
 "jdelvare@suse.com" <jdelvare@suse.com>
Cc: "fr0st61te@gmail.com" <fr0st61te@gmail.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "joel@jms.id.au" <joel@jms.id.au>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/25 08:40, Winiarska, Iwona wrote:
> On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
>> When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
>> critical thresholds for particular DIMM the driver should return an
>> error to the userspace instead of giving it stale (best case) or wrong
>> (the structure contains all zeros after kzalloc() call) data.
>>
>> The issue can be reproduced by binding the peci driver while the host is
>> fully booted and idle, this makes PECI interaction unreliable enough.
>>
>> Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
>> Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> 
> Hi!
> 
> Thank you for the patch.
> Did you have a chance to test it with OpenBMC dbus-sensors?
> In general, the change looks okay to me, but since it modifies the behavior
> (applications will need to handle this, and returning an error will happen more
> often) we need to confirm that it does not cause any regressions for userspace.
> 

I would also like to understand if the error is temporary or permanent.
If it is permanent, the attributes should not be created in the first
place. It does not make sense to have limit attributes which always report
-ENODATA.

Guenter


