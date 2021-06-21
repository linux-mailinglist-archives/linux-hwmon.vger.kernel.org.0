Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE58B3AE560
	for <lists+linux-hwmon@lfdr.de>; Mon, 21 Jun 2021 10:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFUI5v (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 21 Jun 2021 04:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhFUI5u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jun 2021 04:57:50 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF777C061756
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Jun 2021 01:55:35 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m18so18703063wrv.2
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Jun 2021 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NguFbkcyh6ap+qxMe2TBXIujUmNeh2JBMoEY6ERT5kg=;
        b=At0qaUQVH4DX05KxGmf4JuLo8ZCE/RWxYbU73JVhH4W1/aNwfazsccTWlbK0dzytfE
         DJ1+1mPH99sXv8NeTnlpX/+rdDXQBKhmmgt+z4S3DpdQuAYkEKzWNaG7+uwjsKInSHkr
         YVSC++sV/6g86vOTu7Bnc1pjiAte5Uvk2FXx1F2JtxBOpsM1WIyFzUO2/tlHYtDyLgmF
         CNQNuYM5rL3wSXIoxbYtpG9eflWvQo8+WUYxAuT7vV4qmroLG4CN6TEyvsTv1En3AmZn
         25Kgz7SLkEvrQYQ+F7k97WOqxTqJrleWZ8nJlhRxd9SjtVA0hD4wFLzSukp1x0SWwtXH
         9sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NguFbkcyh6ap+qxMe2TBXIujUmNeh2JBMoEY6ERT5kg=;
        b=iAWgIYyZ93w2zZJW0Zu+Wve/u2A6nFICDjg3sJT2HbC1AhNzbArS2Us3K83xPx7JhY
         /ksTRfOWObpmZkYDCRcUkraVaA/aGK9nNB2gvXsGToXs8ST14pY/ajWXWVicj11hb4RL
         4V7wo+jxOyk2OcAoyqbh0q78f5GN9Z7ZxjIdXtl1+6aWXRezCYDfHvYmCQLRJndibzbG
         qBwlk+eWakP+owEYtZU5J/aMgNQ/tdqbtrd8C3b+HD7B93sRH7bWr/9kkQE2dND6SG25
         +4JgUdAqXy/fQdR303hVS2Ow/KQsv57yfP7hWP5IW8oNzRVx4Ud3adSZK+nxr22Ao2H9
         n57A==
X-Gm-Message-State: AOAM533ZRdqjjvQ8jQrUgyCIT3xgiTDV1mYtb5IkoW84xYUDUM1tPoD4
        t80aMtqb6/voX39lQAMyQgEmGA==
X-Google-Smtp-Source: ABdhPJxrbBQ8yZEjLN57gMoGFn9sOMWgiBeIR/XtRqnrqtXr7WcbMKAPpKYiDkWybmNdn8jedNDg4w==
X-Received: by 2002:a5d:6d87:: with SMTP id l7mr26850975wrs.287.1624265734393;
        Mon, 21 Jun 2021 01:55:34 -0700 (PDT)
Received: from dell ([91.110.221.210])
        by smtp.gmail.com with ESMTPSA id y20sm3558216wmi.25.2021.06.21.01.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 01:55:33 -0700 (PDT)
Date:   Mon, 21 Jun 2021 09:55:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mhu@silicom.dk>
Cc:     Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
        Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Brown <broonie@kernel.org>,
        Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mhu@geanix.com>,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: intel-m10-bmc: add sensor support for Silicom
 N5010 card
Message-ID: <YNBUA8qsfl9QejhP@dell>
References: <20210621070621.431482-1-mhu@silicom.dk>
 <20210621070621.431482-5-mhu@silicom.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621070621.431482-5-mhu@silicom.dk>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 21 Jun 2021, Martin Hundebøll wrote:

> The Silicom N5010 PAC is similar to Intel N3000 and D5005. Enable
> monitoring of its sensors like it is done for the two Intel cards.
> 
> Signed-off-by: Martin Hundebøll <mhu@silicom.dk>
> ---
>  drivers/hwmon/intel-m10-bmc-hwmon.c | 116 ++++++++++++++++++++++++++++
>  drivers/mfd/intel-m10-bmc.c         |  12 ++-

Please split out the MFD part into a different patch.

>  2 files changed, 127 insertions(+), 1 deletion(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
