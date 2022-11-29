Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA3663C236
	for <lists+linux-hwmon@lfdr.de>; Tue, 29 Nov 2022 15:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbiK2OPe (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 29 Nov 2022 09:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234990AbiK2ONn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2022 09:13:43 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31627E2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:13:23 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id a7so17286109ljq.12
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Nov 2022 06:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1FWq0AIq+LAkb7Lpd6SULnTbjNwAPN1aTI19W+HDGY=;
        b=AGOiAI3FpvAuY8QYtUYdG5jhnr78hvdd90afGBSWKqqv0kb9bBmq/XTtXWF4d2m8Yz
         fCo2EyYTL69TXxhyvYlROtf6I67o0htkPHyUe4juMF0fAZ7v1SIlxP0tGh0oVH1MJGad
         RdF4qeZbwg9ob17mPTZXo5U/LQrRcmn8h6HfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1FWq0AIq+LAkb7Lpd6SULnTbjNwAPN1aTI19W+HDGY=;
        b=zlq75hF+CF69FV27pK2U1/GyZO84yJEDVR9EGAOk+iZU07emF/gwu5GQ/eLt0TjSxc
         jJxD35ekCktU/qUBESEGAc9xbL34PYwf+ywbxBpD8j1Ypto7eXEg4AhPlbEtki/k5kAN
         E10CnruyHNV6zOwDhpPTLbHC1MWb9U3sf4c0LfkMRAtuEdUmGoPK5pLsYYEasymjBoVx
         6QkpFWtOstjF73rxp5iUcL7ZcKgghFeIMdShVCpnwyBD3t3rTOkB98bZLbPj3S8XeTQh
         z9Slvzatzrz7w4byvL9NOv2QnFGwNlLRgpLCfoHElb9A7ltAXoyEIFXcJs8QyDjrAtbv
         VL1Q==
X-Gm-Message-State: ANoB5plf7NndRsle+Y1e21+49lY7np7lGw8pPJnWSkyYM5NVJfpEfj7L
        tFV++91W23gqgpUFiCtDIzwU7Q==
X-Google-Smtp-Source: AA0mqf4li0aP4WNji+mEe5LTBCyiSTHBCcHhEoJoBobJr3CWlfvPMyvk2Kov4bI8FtZCj2yspic3ag==
X-Received: by 2002:a05:651c:c99:b0:277:2b10:bf60 with SMTP id bz25-20020a05651c0c9900b002772b10bf60mr19563600ljb.159.1669731201531;
        Tue, 29 Nov 2022 06:13:21 -0800 (PST)
Received: from [172.21.3.193] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id u4-20020ac248a4000000b00499aefcf68esm2219224lfg.292.2022.11.29.06.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 06:13:21 -0800 (PST)
Message-ID: <046d8bed-c936-32af-d5c0-bf1c90684f39@rasmusvillemoes.dk>
Date:   Tue, 29 Nov 2022 15:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/5] rtc: isl12022: Explicitly use __le16 type for
 ISL12022_REG_TEMP_L
Content-Language: en-US, da
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <20221126141806.62205-1-andriy.shevchenko@linux.intel.com>
 <20221126141806.62205-2-andriy.shevchenko@linux.intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20221126141806.62205-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 26/11/2022 15.18, Andy Shevchenko wrote:
> We are reading 10-bit value in a 16-bit register in LE format.
> Make this explicit by using __le16 type for it and corresponding
> conversion function.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/rtc/rtc-isl12022.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
> index 44058fa27277..bf1aa6f6560d 100644
> --- a/drivers/rtc/rtc-isl12022.c
> +++ b/drivers/rtc/rtc-isl12022.c
> @@ -19,6 +19,8 @@
>  #include <linux/regmap.h>
>  #include <linux/hwmon.h>
>  
> +#include <asm/byteorder.h>
> +
>  /* ISL register offsets */
>  #define ISL12022_REG_SC		0x00
>  #define ISL12022_REG_MN		0x01
> @@ -63,17 +65,16 @@ static umode_t isl12022_hwmon_is_visible(const void *data,
>  static int isl12022_hwmon_read_temp(struct device *dev, long *mC)
>  {
>  	struct regmap *regmap = dev_get_drvdata(dev);
> -	u8 temp_buf[2];
>  	int temp, ret;
> +	__le16 buf;
>  
> -	ret = regmap_bulk_read(regmap, ISL12022_REG_TEMP_L,
> -			       temp_buf, sizeof(temp_buf));
> +	ret = regmap_bulk_read(regmap, ISL12022_REG_TEMP_L, &buf, sizeof(buf));
>  	if (ret)
>  		return ret;
>  	/*
>  	 * Temperature is represented as a 10-bit number, unit half-Kelvins.
>  	 */
> -	temp = (temp_buf[1] << 8) | temp_buf[0];
> +	temp = le16_to_cpu(buf);

Makes sense. Perhaps we should throw in "& 0x3ff" just in case there
were ever any garbage bits set in the temp_h register.

With or without that,

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

