Return-Path: <linux-hwmon+bounces-2016-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138AD8BA31A
	for <lists+linux-hwmon@lfdr.de>; Fri,  3 May 2024 00:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFBB28311E
	for <lists+linux-hwmon@lfdr.de>; Thu,  2 May 2024 22:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE3757CAC;
	Thu,  2 May 2024 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/z1AxjU"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87B557CA1
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714688792; cv=none; b=Xz5uSCI3jdarXqkIj9spEhGHzGm2fd0Glpswl+A6oRAwkOZkN6Z5AMpIJhrsJNrY5P6cd2qH/rj4oBojBipHVb8bpJbQvCaVRdJOwLJnGMHcvnckYuRXRojmTC+YZ3Y9mfv6yKnsD2zXlXZabi+cx+WpnSjwApchn9DNpnNV4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714688792; c=relaxed/simple;
	bh=FbrgNxg3ScCa2fgaCou/7M3HNSDqljbMH8l430XRDsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMgccfqKCNNUnYj/Pi73DK5m1UgjugORGpYVJYOdzn2SKRuw65fkRzNzBMazXjr0uK97OfMTAwhG86sOA+ozEPsxOfGWqbxaPdN32BtthkaYB7Sxnwi6fgLHz7/DDYkTTDik2OQUR0X/Hdj5XJsniC9kMJAfVANfkNZMjNrYTto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/z1AxjU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso57580425ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 May 2024 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714688790; x=1715293590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMm49NmYvvS+Q2o4eM4iKunVB2JZBNHKROM3LJIbK5E=;
        b=P/z1AxjUO8+TCm9w0o0Xpn5vRLzJxeSZjo/sxfihoHYYRVaTfc8mrhFJH4JkcSeTPa
         k8OzWO+Magveq+rl9wpwff+Q3itVhx5MI7tdRF6ihc/5IDOfcOfDuDZ/+ZLJzPFp/ITO
         ruHzgRCKZ0F/ruDzh2P3AGcPVV5VHSExXj33S+mbFup8fN7UZzbURDlYGfwoNXYc7t5L
         CNTD9BwcBpcpIBDVrU6wsKECEs//BtIB5vxBwU2Quv5PqS65He3cKafYYP6Rw7aU0UM+
         03Yn3FTk5xcOFyTLe85iJNgx44/nIjUK0dS/wBMO7V++hUn7DVmFxkpxIqiOMTc0QNIw
         sxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714688790; x=1715293590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMm49NmYvvS+Q2o4eM4iKunVB2JZBNHKROM3LJIbK5E=;
        b=dhviFb6zDxJiTIJgwoH+6JRfEL6Rp6LiLqwmj1MAzI07T1AkX4AJZLfl0wmImZi77r
         hKzRQI7vPakHb99cJLTdfxvr1jI7L70x0w1NFaj4zhHu1stlsJhbVEnpiBCsGKtFuNPh
         mYvhGZcKGKjHELt20Ag0wsYenepDdyPCbNxh9OWNaNilCGcqj/LsWXSObJXzz560S/cp
         Hm3D3IRhMrVec/56CTkTqu2874zWIzLaQ+5yhP95KSpquQPY2ts29pHez4FEqSko7UYh
         s/uBFV8F2H0Yis9EwHmrDntT0tGJCphYTSsStFxHqwlwVEFeNF7YvfwejZDVSAxjZVtT
         nnYg==
X-Forwarded-Encrypted: i=1; AJvYcCVU39JpBwwMCsmfvI/hHnlM7jl91ranQ6dlu6v0Ygatp+8A1d5C3vHpMEmT0SMvxmo4EIO79MtQPNCdXAtYcFtppdmPLVMb9lS7XNY=
X-Gm-Message-State: AOJu0YyDzd4b2TpCr4Sn+R4uRkxqHat3zhY2cexM8WbS313ZjPLU42p5
	yC//Xzaw77AqJYN8+CGll/8oF2mg+8ZJ+RzxtVhkdIi1adzWfImbH8fugg==
X-Google-Smtp-Source: AGHT+IET5as8XBwsEWYGtoosFANalAHY/PsiIYVvq4PHEwarC8g5fDhyXdsHOYWvSvoWR1hn/HqC6A==
X-Received: by 2002:a17:902:d3d3:b0:1e5:5c49:ad4b with SMTP id w19-20020a170902d3d300b001e55c49ad4bmr1046453plb.38.1714688789938;
        Thu, 02 May 2024 15:26:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u11-20020a170903124b00b001ea02645bc9sm1850481plh.148.2024.05.02.15.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 15:26:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dd4ef0b6-8272-40b6-9a50-edbeec14d5e4@roeck-us.net>
Date: Thu, 2 May 2024 15:26:27 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sbrmi: Add support for APML protocols
To: Naveen Krishna Chatradhi <nchatrad@amd.com>, linux-hwmon@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Akshay Gupta <Akshay.Gupta@amd.com>
References: <20240502220554.2768611-1-nchatrad@amd.com>
 <20240502220554.2768611-2-nchatrad@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240502220554.2768611-2-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/24 15:05, Naveen Krishna Chatradhi wrote:
> From: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> 
> The present sbrmi module only support reporting power. However, AMD data
> center processors support various system management functionality
> Out-of-band over Advanced Platform Management Link APML.
> 
> Register a miscdevice, which creates a device /dev/sbrmiX with an IOCTL
> interface for the user space to invoke the following protocols.
>    - Mailbox read/write (already defined in sbrmi_mailbox_xfer())
>    - CPUID read
>    - MCAMSR read
> 

This is not hardware monitoring functionality and would have to reside
elsewhere, outside the hwmon subsystem.

Guenter


