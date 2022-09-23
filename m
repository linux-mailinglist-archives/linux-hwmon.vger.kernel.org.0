Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5031C5E75F0
	for <lists+linux-hwmon@lfdr.de>; Fri, 23 Sep 2022 10:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiIWIkO (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 23 Sep 2022 04:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbiIWIkN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 04:40:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEAEA74F5
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 01:40:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id lc7so26561514ejb.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=U6zfmLFphAIrgL4F8F09QdcSH0hrlIdwizKDu5PkikA=;
        b=d5fGo9EJ+mdGp0vheSqN2Hhijx/dKv5fsFV58WjZSVHyiFgAxUovNWHOAE84sPek/Z
         5vrwsM7X2ikO6yLQfP4W5LTl3MSNXBANu6MDdvVhsZeer+ZR6MwpiwU4FslP/kSWbfGL
         68pYAHJ7isHIBd0VMrmpD7HUof9OGwyOjHB+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U6zfmLFphAIrgL4F8F09QdcSH0hrlIdwizKDu5PkikA=;
        b=X0rtSJY+nd+FNks6If7p24lwQx/CO8wZekIBB289Mq2hUFYeXXdp9rkLjp8Fs/qDRz
         m16f1gb5YQBMqj7Ss6i/mPNrcoYQ9KM3uapNUW4RjaIj+hatdcK8IVBO7VtZTYr1ozou
         8Bv+fX4aErJOciEoljBV36mM0nKwqGmTAAo4ZixlyUNEL7lJ5C1u+Nwh5wCgD9M04QAw
         NWwaXHo9cNMv3rlXmlUDewomEVSu+NK+R+FnYlFVrM9zlxUOOcjf4kDMZCl684bwKuLj
         pSJTqptY8KX5hVmKF+4YK7/B0DQmasiXzZaup9qIFS5yMIYR9MdRSeN+SSC5m1tWNoa6
         eAMg==
X-Gm-Message-State: ACrzQf3W78kuYUQaCI4nG2KPPUuYmEwpl0x7eHWUgNyTKZzWWqfalibm
        HQ0DL0rssYuuAkKj/UkxLtxv+w==
X-Google-Smtp-Source: AMsMyM5VmiBQlwbjfE5Pt8HN6qE+WeUp2rxUd28OvfdnMRUuZP/ywclLHGwuTVBZUtJyGw4hbhWlmQ==
X-Received: by 2002:a17:907:7baa:b0:779:a71a:c8cf with SMTP id ne42-20020a1709077baa00b00779a71ac8cfmr6174626ejc.126.1663922408786;
        Fri, 23 Sep 2022 01:40:08 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906293200b007341663d7ddsm3750380ejd.96.2022.09.23.01.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 01:40:08 -0700 (PDT)
Message-ID: <62a262a1-b945-ad4f-fdb8-d05fcba882d3@rasmusvillemoes.dk>
Date:   Fri, 23 Sep 2022 10:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 9/9] rtc: isl12022: add support for temperature sensor
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
 <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
 <20220921114624.3250848-10-linux@rasmusvillemoes.dk>
 <8cb2bac1-3a03-09a1-c071-96ca4a95fa44@roeck-us.net>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <8cb2bac1-3a03-09a1-c071-96ca4a95fa44@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 21/09/2022 16.13, Guenter Roeck wrote:
> On 9/21/22 04:46, Rasmus Villemoes wrote:

>> +static int isl12022_hwmon_read(struct device *dev,
>> +                   enum hwmon_sensor_types type,
>> +                   u32 attr, int channel, long *val)
>> +{
>> +    if (type == hwmon_chip && attr == hwmon_chip_update_interval) {
>> +        *val = 60000;
>> +        return 0;
>> +    }
> 
> It is not the purpose of the update_interval attribute to inform the
> user what the update interval of this chip happens to be. The purpose
> of the attribute is to inform the chip what update interval it should use.

Well, I think it's a completely natural thing to expose a fixed and
known update_interval as a 0444 property, and it might even be useful to
userspace to know that there's no point reading the sensor any more
often than that. And I didn't come up with this by myself, there's
already at least a couple of instances of a 0444 update_interval.

I'll leave it to the RTC maintainers to decide, it's easy enough to remove.

Rasmus
