Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29C411DFE
	for <lists+linux-hwmon@lfdr.de>; Mon, 20 Sep 2021 19:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347611AbhITR0Z (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 20 Sep 2021 13:26:25 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:45556
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349748AbhITRYY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 13:24:24 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 789E340257
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632158574;
        bh=Ib/7vEzqwK2uprJcTl5mNvdNQqfYMGseImnegUnlZu8=;
        h=Subject:To:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=dLd8MA/vlcqNC3HrAtrI875zKeCi8Bj5TyKfQVMlOmehYclCpJFvYHT8iOU45/ZOw
         +V85cFy1AePUZHdw96MT4YAe+8TWd/IlFW3qhSSe3Dmih2cJL5g12vKNdNi7gm9QNV
         zQul0PZTa3iCxu/AqFoDOiKK9IEXdms4TI/lu6dGb/KQo5hR4jd6gC8QFGky77fFDe
         vN8lRitT8/jcl/ynUCs+/eUGwfvP4Vf98hnC3w/i19x3sQeOCqmEaLwHx+FhLi1WUD
         eOF8tpXqH3TGpWl9hDtClFGJoYRcl/3NSoEb/9eF4X3sPa/EtMb/tmASTPzNd/Wngf
         biLCJ3ACbQqjg==
Received: by mail-wr1-f69.google.com with SMTP id m1-20020a056000180100b0015e1ec30ac3so6679427wrh.8
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 10:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ib/7vEzqwK2uprJcTl5mNvdNQqfYMGseImnegUnlZu8=;
        b=dY+JibibHlbB4rzBpCSgSXnXneywpu07ZDLHQwF7g60E9wvqCPekxfja3yzFyouexd
         FoLC/JomjIPEjZiGXRca09+t/32ayKDhwr7HVV7OKYZbM/sXL8eGYKuD7FRXYDvh+HF5
         nPvdOSDeXjZMO8N/sMqW6IFe2cYNP5kVq5tnjl4nHftnTrqbShpU37CGOgOefEeuRbaZ
         vFICDpkSCRo7YO4JVhBkGMyPkH/QC8g7bh/o4ei6yzVV+OyfUv8Kozr/0258al/9UVxF
         iozoFrFCAN+UbFv9ccOTmR3/yhCyLETCymVV9qfsezKJodqXzqRP3YRb7f84jqnkeZ6G
         vgpg==
X-Gm-Message-State: AOAM532iqJYlNgBry9hZMwJlmJ2G8ZXbGBj69jxmPkawuEqGX/g/nwPh
        QR+9ebOoZVP1u1cGGlAAl6bgc6RvcOrCOnOftBhVmNmgzYeyH6rE8wSOZ2lorjs4hxEPdgGL1Gf
        9HVEkF9K0sW6rOIO9WlgRZ26yu+LSLlWVUIZKSG7O
X-Received: by 2002:adf:9dc6:: with SMTP id q6mr29119909wre.161.1632158574154;
        Mon, 20 Sep 2021 10:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwOXR3BGLGuHRY1saUVMJLa6t51fTX3CzldWDDLLRnhlJnRQKhpE+RtKpocM9bhIwyrYYE3Q==
X-Received: by 2002:adf:9dc6:: with SMTP id q6mr29119894wre.161.1632158573938;
        Mon, 20 Sep 2021 10:22:53 -0700 (PDT)
Received: from [192.168.2.20] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id 4sm92158wmv.42.2021.09.20.10.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 10:22:53 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: hwmon: lm90: convert to dtschema
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210920140525.157013-1-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9bd8a400-86da-04bf-8205-725794e62108@canonical.com>
Date:   Mon, 20 Sep 2021 19:22:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920140525.157013-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 20/09/2021 16:05, Krzysztof Kozlowski wrote:
> Convert the National LM90 hwmon sensor bindings to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/hwmon/lm90.txt        | 51 ------------
>  .../bindings/hwmon/national,lm90.yaml         | 79 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 80 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/lm90.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm90.yaml
> 

I will send a v2 because few devices are on trivial-devices list.

Best regards,
Krzysztof
