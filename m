Return-Path: <linux-hwmon+bounces-341-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B7B8032B4
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Dec 2023 13:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38C271C2099F
	for <lists+linux-hwmon@lfdr.de>; Mon,  4 Dec 2023 12:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F651CF8C;
	Mon,  4 Dec 2023 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4zqygcs"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EE1192;
	Mon,  4 Dec 2023 04:31:07 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c032962c5so24997965e9.3;
        Mon, 04 Dec 2023 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701693066; x=1702297866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/e5vCdOeEwtmMQpCt8xxl8fQ5ZmVIGzIsYEfsU0csc=;
        b=N4zqygcsc6ACQIruT6NwD1hwQlzvvNVpiUcFKrQX87Enrqgb4hkfqrNhmdIHLMU9AW
         HLG/KgM39M8DYQI6B6d/rJP+haMcD/VvGiIq1/6JcW7jLtdPqZUagtMsSNCmzPT5i1u3
         QhHKpC58HsjIougVwgrwMap8ROIcgZHt7JzLAK9hAhu8fDwPvOau85TzuJ1GPIwXm0zY
         UmXX9nYGQBUTEroRnMqbxuSklL6iuiBBazZ7WQAw8R2JkvHocwKpo4MeBWiKdpCpytDN
         uhDepQZcV8/PIE6r9pEhCTctRMntjaAoUChPIxAtR6vQuwX+aX1lAN+rOOGXS57vtH8Q
         3OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693066; x=1702297866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/e5vCdOeEwtmMQpCt8xxl8fQ5ZmVIGzIsYEfsU0csc=;
        b=EJH71FwZGOPrgfz2e1D+4dcc+crdXQ8XatNpk51N/h9JWoAU85xWY1tUFf4dEAvjvl
         jjqte4NfNwghTogyHMVqT/tfu+6O7DAz1kSzUwsMyRF90pAVDDYQiTrIJfwi+VkXthGU
         0ztNQ1lsBbUSZbGIiLQgTd44sT4lWgSeaFIO952IYMkOKiLz+CvBAXWBXOAXYR4IzUGF
         YHCcW0WVAia9NBhTbIlC/FvaNDJfbk3Rbc3O2qRRs2l/yEKCMwkWD96UrIiuTRSfpYAa
         LFpUAMWOEuVw1N8WPE3q8FS+9s7EGwW4UeqYpneMDprOomBmohZ8bOEJYmVn6IsUoDtr
         siLA==
X-Gm-Message-State: AOJu0YyUCQ1l0+N2lGRIknhN7nvKFXp4MvW0IaPYuJcscaoXbHGJHoGe
	ZgKqFyFzBXVZ8NnzbUJ9FQI=
X-Google-Smtp-Source: AGHT+IFSUWQ6U3fNXeDUu19NVh45UcWlYvNhKWledZ/2qnB6UEjfJbE+8XboGhYcBvDH948SDQlYFg==
X-Received: by 2002:a1c:4b0d:0:b0:40b:5e59:99cc with SMTP id y13-20020a1c4b0d000000b0040b5e5999ccmr1750380wma.236.1701693065664;
        Mon, 04 Dec 2023 04:31:05 -0800 (PST)
Received: from [192.168.0.28] (cable-178-148-234-71.dynamic.sbb.rs. [178.148.234.71])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c34cd00b0040b540ff0a5sm14987262wmq.19.2023.12.04.04.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 04:31:05 -0800 (PST)
Message-ID: <e2d11e0f-6d0f-49a0-ae25-7f23fb1cedf1@gmail.com>
Date: Mon, 4 Dec 2023 13:31:03 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-hwmon@vger.kernel.org
References: <20231203120651.371429-1-savicaleksa83@gmail.com>
 <2a89f0b4-990a-4d0d-8e54-c4215579c23c@wanadoo.fr>
 <121470f0-6c1f-418a-844c-7ec2e8a54b8e@gmail.com>
 <5404194d-9ee6-4def-a040-f5858d8c2d66@wanadoo.fr>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <5404194d-9ee6-4def-a040-f5858d8c2d66@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-12-03 16:26:02 GMT+01:00, Christophe JAILLET wrote:
> 
> Done, patch sent.
> 
> CH
> 

Thank you, much appreciated.

Aleksa

