Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2561FB50A
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2020 16:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbgFPOx0 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 16 Jun 2020 10:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbgFPOxZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Jun 2020 10:53:25 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7CC3C061573
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2020 07:53:25 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x207so9617146pfc.5
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2020 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AtGEVcVYwzLMn+NJ6fr14Iakl+QIl0A5dvhhK8Fenqc=;
        b=tQ6j6EcKyzVtjW85Xu1hJydGFiOls9r0lyKE1Sj2a6UZZwYzoCeU+i00UPXLI43qvw
         dd0Qo3xDGU+/0+bm4AFD26QvoAjdUoC/kmoGBuGQSBwD7GhgdimzF9NJcsaVz+3Xj6VR
         S6+KnwBjKDgfO7y5uU2H+LmJenp4UAzm8i6QJ2xL/Ro3DHhFrCDln2AKR6/YGdD01eqI
         FdJmVRf9HUl18GGbhXDEh40QzXuzSpQ8RiPlhAmJFthpHV+d+zz+9znylvYVk3IA8cXV
         ibTR0mDqeQjtz2UQIpvShIxzF68hOYqHpBVRE+/rEWZYRfYWPEVZgYd91WumsN2h02Mp
         BzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AtGEVcVYwzLMn+NJ6fr14Iakl+QIl0A5dvhhK8Fenqc=;
        b=XhqjzhD42H0IaEEEQukYd8kQQmScCpAkRZRPI8RxNsuXVv9GO5H41lPxvxQg1kbr+h
         1skJC+Y1JvEJMCxEHZH+pNCOxeyXYw/UJJMl+ydwaMO/iBvKJbjRrTEkZlfLrk0emgj+
         Z8GiYNv2/VetgGEhMQRyUNPRXmt79XG5eTNNSCbDThh0MQgTAb8FlU3RPG0txwFNjpmT
         eXMNRWhRQChfkLzrSCXbIwXPNzMYWx0Bl79EJWqCTEAejVV4iPhG+M774frXULu3YxPm
         +3hr9jBwyvo/IDqSCKAAPhblPuLy04KVDeZwFGvM/XzuH7uXzWa95/CP2K2c0eduwXp5
         cgYw==
X-Gm-Message-State: AOAM5323M04syD9qemyEtLtbYKZKJSZNncSU9MT5jld0sJSPS9kBhk8v
        uhXiPtmx8vgQx8V1sd/Kx5uiRBTf
X-Google-Smtp-Source: ABdhPJx/Y0ABPZqfJO2JVsXW4nUWVukU70zIlY92KY73D+smz1VLaFod3ZxL2xkxwDiyZRpSZ3Ek2w==
X-Received: by 2002:a62:75c1:: with SMTP id q184mr2480371pfc.210.1592319204826;
        Tue, 16 Jun 2020 07:53:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r24sm14805058pgm.25.2020.06.16.07.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 07:53:24 -0700 (PDT)
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20200519155011.56184-1-nchatrad@amd.com>
 <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
 <CAHfPSqAYBKXJkG21hqjyuRN8X+HqaX5df6ByeSRoMycBeVU48A@mail.gmail.com>
 <alpine.LNX.2.20.13.2006102320180.15859@monopod.intra.ispras.ru>
 <MW2PR12MB2569591CBFFB613E88EAD9F1E89D0@MW2PR12MB2569.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <40def50d-8642-c850-5b23-b0ad4110becb@roeck-us.net>
Date:   Tue, 16 Jun 2020 07:53:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <MW2PR12MB2569591CBFFB613E88EAD9F1E89D0@MW2PR12MB2569.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/16/20 7:46 AM, Chatradhi, Naveen Krishna wrote:
> [AMD Public Use]
> 
> Hi Alexander,
> 
> The issue does not seem to be in the driver, it is in the register values populated by the firmware.
> We have tested this in the server platforms and it works fine.
> I've raised an issue internally to analyze and provide a solution for client systems.
> I'm still waiting for their update. 
> 
> Guenter,
> This issue is seen on client machines model ranging from 0x40 and above. Should I submit a patch
> to support only server specific models 0x0 to 0x3f until we triage the issue for client systems.
> 

Yes, I think that would make sense.

Thanks,
Guenter
