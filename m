Return-Path: <linux-hwmon+bounces-311-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A3801D6F
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Dec 2023 16:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4212812D0
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 Dec 2023 15:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF12A18C39;
	Sat,  2 Dec 2023 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMdmqpQK"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0179D102;
	Sat,  2 Dec 2023 07:01:20 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40bda47b7c1so8043625e9.1;
        Sat, 02 Dec 2023 07:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701529278; x=1702134078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Vs3j89rW22UXeBMAdvylutlnUMQpIFaDWsz9pX0NMo=;
        b=BMdmqpQKYuvW2O/QS/LSHJPNmN2mY2S49uA5kNyUucyiK10ROSz22ullF74baD9qJP
         2HhOIS1vevCVHIW6DhiLe+Hd+TULpUnDZ4TE0JvUJqpB89EkAlse91g2rvHGnhtUJMl5
         7NE01Nql7cHODS1pGIXGbHPZY7JDDmKf9vT4v3FJB5KcHvNs/HoX3aFKbiNDZaplP6vI
         dwiPgSTb75DCDS7y5a2+B+whzlw2ujWAGV+7vMkLKVVTDAQBKrfmO5Akd/8fGyleShAO
         WIcHgN8ntCwp2MwrbxiELTy4GREFLMMba2igzI6q8oHwXgs/I5+nQX73ghXdPjHklsYO
         8Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701529278; x=1702134078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Vs3j89rW22UXeBMAdvylutlnUMQpIFaDWsz9pX0NMo=;
        b=dwGJYejdEAEalMUQKnZ/WWnFeKZvJOd4YskEHHpROQisvO1j4Q4c9Wy2V5xRMB5l4I
         JVZZrcRq2QV4WPfIf8pUgnacgP23tYHu2zivWABtAzSbVLojVQNrVw7dSzTrqKTC77CK
         t/4VjmJPUINPIhKtYKxx2moH8xu7BClnLtkUO+a25SQUxKwsXLgJvK5oFhBxDvvR9kby
         AzyLXUZc0rQqRO0i5yrvZHkZXWlBEYGQzmPAjagd0WA6byjAO/W+Cxe9S/z9czwR0Nc4
         dkInNz/yYacFnLR+62Obdhxj2VijrCX9yMTIDnQxDCCz7p3r8oPA4TLsuy7d6H0uPA3d
         aQhg==
X-Gm-Message-State: AOJu0Ywr2v/h0Z/r+r/syr/g145eL9vveyfM3O1whWcixFJIa7wjwVT1
	BWqcWTYeD0RxtTcJfNDU/QY=
X-Google-Smtp-Source: AGHT+IGfgUAbTA/wMcq6R/CZTvqDJYbq4N0L5sNXUWCchnCnalZPPH5gR2xPu9Sc/WWW/lH7mrQZGA==
X-Received: by 2002:a05:600c:230b:b0:40b:5f03:b41a with SMTP id 11-20020a05600c230b00b0040b5f03b41amr650987wmo.316.1701529278226;
        Sat, 02 Dec 2023 07:01:18 -0800 (PST)
Received: from [192.168.0.28] (cable-178-148-234-71.dynamic.sbb.rs. [178.148.234.71])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c155100b004083729fc14sm12635732wmg.20.2023.12.02.07.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 07:01:17 -0800 (PST)
Message-ID: <45484650-4975-4f66-971d-7599681b1538@gmail.com>
Date: Sat, 2 Dec 2023 16:01:16 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add driver for Gigabyte AORUS Waterforce AIO
 coolers
To: Guenter Roeck <linux@roeck-us.net>
References: <20231020130212.8919-1-savicaleksa83@gmail.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20231020130212.8919-1-savicaleksa83@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-10-20 15:02:08 GMT+02:00, Aleksa Savic wrote:
> This driver exposes hardware sensors of the Gigabyte AORUS Waterforce
> all-in-one CPU liquid coolers, which communicate through a proprietary
> USB HID protocol. Report offsets were initially discovered in [1] and
> confirmed by me on a Waterforce X240 by observing the sent reports from
> the official software.
> 
> Available sensors are pump and fan speed in RPM, as well as coolant
> temperature. Also available through debugfs is the firmware version.
> 
> Attaching a fan is optional and allows it to be controlled from the
> device. If it's not connected, the fan-related sensors will report
> zeroes.
> 
> The addressable RGB LEDs and LCD screen are not supported in this
> driver and should be controlled through userspace tools.
> 
> [1]: https://github.com/liquidctl/liquidctl/issues/167
> 
> Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>
> ---
>  Documentation/hwmon/gigabyte_waterforce.rst |  47 +++
>  MAINTAINERS                                 |   7 +
>  drivers/hwmon/Kconfig                       |  10 +
>  drivers/hwmon/Makefile                      |   1 +
>  drivers/hwmon/gigabyte_waterforce.c         | 439 ++++++++++++++++++++
>  5 files changed, 504 insertions(+)
>  create mode 100644 Documentation/hwmon/gigabyte_waterforce.rst
>  create mode 100644 drivers/hwmon/gigabyte_waterforce.c

Hi Guenter,

Any thoughts on the patch? I'll fix the issues kernel bot reported
in v2.

Thanks,
Aleksa

