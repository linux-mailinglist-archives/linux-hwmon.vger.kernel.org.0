Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E02323F036
	for <lists+linux-hwmon@lfdr.de>; Fri,  7 Aug 2020 17:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgHGPwl (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 7 Aug 2020 11:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgHGPwj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Aug 2020 11:52:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7062FC061756
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2020 08:52:39 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so1232663pls.4
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Aug 2020 08:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hUma2YU5FJTqV18poaT+30k/KnbsnhwZG0vT1nmmw+0=;
        b=ksFdo6os/Ko0eYOA40OvTVBs2To8JgD4+7fmhxYzIRv5cpqsr5jyOIpVK2IqmJplAv
         Lp9teskJwtSk+fZXnScjPm0BYpTFlvhE2sGCp8ILKPUQvDZwU78VspD9U9D31PVImnRV
         IZ4+hPeVmXXNH9IvdEXBjfdTpAoKwEcIRyrcLMLt6ZqOWRpgW6cTDiETeJAl4pmyMlnW
         xX8zdOLjxQvOuqJNcf3z+HECIi8Y90kszcurrel2DL3WFwE2UqXbJPX2dv8oi9FXKVSG
         pCjBs1GfSrN1DXq6ogYwb4QPhdETj/8enCFpgsC1uFQ3GdjL8fHHNZ51MOaJKldfn0Eg
         STZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hUma2YU5FJTqV18poaT+30k/KnbsnhwZG0vT1nmmw+0=;
        b=jpoJpa9r8nN12LP9yOpPuCGBXeMJELisxFdrH/mBYjUAQ+/+WO3iMy3QmEfZ+eMxmc
         wdfu5TOy2EJu8NMCVN7qI8SLT70fqC18/ipX7Vp00djUHSe2oDKL7VYTh6DfOqvFuEfl
         N+CAwxqWzw5qdQHUN11OMjg6V9385DbDCeVXcIhP4Psc8G5NJuNhYF9aDTe2M6y9o79q
         lJMUXow8lBtgkPB88haf+z/Mj9m6WvcOL894kk166SZ+dmsg8S2egU2nVZW4G2W2mdRi
         ETsnZJHXd5Adwln/SUwiRC9xXo6iNW7zBHt5FNkRaW5EtyX8KF30IaC0OevvrVCmkEz3
         9t4w==
X-Gm-Message-State: AOAM530ud6GqDP2cElZDLbvTN0Jhuo8SV8h1lsKBhFWzYXLCWWwxSpkD
        GUhuT+s3thUvFLjf5kSS3ZLwb7vU
X-Google-Smtp-Source: ABdhPJyadv79jsILW5cY4ls1QvFqYsft4t3+2CPpamgS/33d6u1c14xw8gOEjvOVz4zcHdlVHUHv1Q==
X-Received: by 2002:a17:90a:ea83:: with SMTP id h3mr15189954pjz.170.1596815558835;
        Fri, 07 Aug 2020 08:52:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r15sm14022767pfq.189.2020.08.07.08.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2020 08:52:38 -0700 (PDT)
Subject: Re: [PATCH 0/3] Extending hwmon ABI with attributes for rated values
To:     Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>,
        linux-hwmon@vger.kernel.org
References: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <66a7bf34-3b2a-a61e-d382-8b2ab9ac1101@roeck-us.net>
Date:   Fri, 7 Aug 2020 08:52:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596224237-32280-1-git-send-email-zbigniew.lukwinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/31/20 12:37 PM, Zbigniew Lukwinski wrote:
> This patch series is about extending hwmon ABI with new attributes
> for rated values. All of that is to cover PMBus specification which
> provides registers reporting rated values:
> PMBus Power System Mgt Protocol Specification - Part II – Revision 1.3.1,
> chapters: 22.3.1 - 22.3.10, 22.3.15
> 
> Zbigniew Lukwinski (3):
>   docs: hwmon: Add attributes to report rated values
>   hwmon: (core) Add support for rated attributes
>   hwmon: (pmbus/core) Add support for rated attributes
> 
>  Documentation/hwmon/pmbus.rst           | 15 ++++++-
>  Documentation/hwmon/sysfs-interface.rst | 70 +++++++++++++++++++++++++++++++++
>  drivers/hwmon/hwmon.c                   | 10 +++++
>  drivers/hwmon/pmbus/pmbus.h             | 13 ++++++
>  drivers/hwmon/pmbus/pmbus_core.c        | 49 +++++++++++++++++++----
>  include/linux/hwmon.h                   | 20 ++++++++++
>  6 files changed, 168 insertions(+), 9 deletions(-)
> 
I have been struggling with "rated_{min,max}" vs. "{min,max}_rated",
but then figured it does not really make a difference, and rated_ as
prefix may actually make more sense. I'll queue the series for v5.10.
Let's see if there is any feedback.

Thanks,
Guenter
