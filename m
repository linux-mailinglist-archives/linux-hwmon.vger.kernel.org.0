Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E257DF524
	for <lists+linux-hwmon@lfdr.de>; Thu,  2 Nov 2023 15:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjKBOew (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 2 Nov 2023 10:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjKBOew (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Nov 2023 10:34:52 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5D212D;
        Thu,  2 Nov 2023 07:34:49 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b566ee5f1dso628048b6e.0;
        Thu, 02 Nov 2023 07:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698935689; x=1699540489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wHBPMtYXD9v/EXoxQS8QLRmpxsQlq3KNaQrAD21c7JI=;
        b=O+PKuV3FuhXMg691Q4BmeDD8W7O9WRzO3EptdevZli/GIlKb/TAhFBqji5WrMIEnJG
         gP3zuDj/OkWmWFOySK5s6DISegaNZNRF0Bm4cJv2NpESGOP+X/kNynaIHDQuT5yVKHN/
         4hpVMxBfnK9Fhg1Crf83avd6NZsrVrVYWy0QyTUxLdpkiGPyBRNFl/7gabWVR836BZ5O
         bKpQKbtbx/EnHjHhNiOhk3uPLIw6K7PSFQrEOWCi5pHGEOWk2dw9ZS2zGNuXiT44r4x5
         s6u/hVCtSluHDL907MNx1oOBa+5ydPfbHcLfIEFsYxfDunyElyaZ4luMZEOepY26HcgZ
         cVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935689; x=1699540489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHBPMtYXD9v/EXoxQS8QLRmpxsQlq3KNaQrAD21c7JI=;
        b=NOtrBB7Ib9g7fLwHszS9X8xRpVLieOjJLTwwvvdmGdYUw2F3U1IDekTtSmvBsFdJX/
         4vXmGUBsdCX8hJTkJyZGvZRaFJvYWoPR1lCHgQWKpwiL0vV1wjivfLWSRGpJQVQVQMeN
         jQ60KwegTYMye/JyXCfs/fqn4XHNQ+MRoLs7/GXWg+tNQvmmPH4dwmpRDP3Ch91ym3jf
         nIhKcHXWkAuDcdHvmLRu6FRP6cSmccx3xYIpfwdK+O/ChgL2rGlIm9ZbAVwTMVA+7AiE
         sBnnAFg5eTqnyvN3DaZrvPhfJc7jAKoamSGAkFpQZDjJu9dzSSN+li5+bUsbHoF3gSpY
         5UVg==
X-Gm-Message-State: AOJu0Yzm5YflGh8zdEnCC+Mm6d8ckqt55AvQ9SuMnSSJ12Lkisw6XDmI
        OOV2D9K+83oCjxQhwoH1dwBrUYTsZjA=
X-Google-Smtp-Source: AGHT+IFHGR8jUEvgiRwPVHlNQJiHwDhmZyec4yYsaO2gSqpjQ+FT+YOISub2+G1SP3W+6RGT4f0S/g==
X-Received: by 2002:a54:4799:0:b0:3a7:82e8:8fd1 with SMTP id o25-20020a544799000000b003a782e88fd1mr18574341oic.20.1698935688882;
        Thu, 02 Nov 2023 07:34:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd37-20020a056808222500b003b2df32d9a9sm549110oib.19.2023.11.02.07.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 07:34:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c448d7e3-c6b6-49e1-bbf1-331d74954a77@roeck-us.net>
Date:   Thu, 2 Nov 2023 07:34:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: emc1403: Add support for EMC1442
Content-Language: en-US
To:     Patrick Williams <patrick@stwcx.xyz>,
        Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231102090808.427351-1-Delphine_CC_Chiu@wiwynn.com>
 <ZUOjdGPDX06ehrLB@heinlein.vulture-banana.ts.net>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZUOjdGPDX06ehrLB@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/2/23 06:26, Patrick Williams wrote:
> On Thu, Nov 02, 2023 at 05:08:07PM +0800, Delphine CC Chiu wrote:
> 
> I have a datasheet for this chip with a "Revision 1.0 (10-25-10)" in the
> footer.  Reviewed the change against the datasheet.
> 
>> Add support for EMC1442 which is compatible with EMC1403.
>>
>> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
>> ---
>> change in v2:
>> Revised emc1403 to emc1402
> 
>> +	case 0x60:
>> +		strscpy(info->type, "emc1442", I2C_NAME_SIZE);
>> +		break;
> 
> Confirmed against datasheet.
> 
> Section 2.2 "Register Set Delta" specifies:
>      - Product ID | 60h
> 
>>   static const unsigned short emc1403_address_list[] = {
>> -	0x18, 0x1c, 0x29, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
>> +	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
> 
> Confirmed against datasheet.
> 
> Section 5.1.2 "SMBus Address and RD/WR Bit" has a table indicating that
> a 22k pull-up resistor corresponds to `0011_100?` binary.
> 
>>   	{ "emc1422", emc1402 },
>>   	{ "emc1423", emc1403 },
>>   	{ "emc1424", emc1404 },
>> +	{ "emc1442", emc1402 },
> 
> Datasheet section 2.1 is titled "Functional Delta from EMC1412 to
> EMC1442", with minimal differences.  We map "emc1412" to `emc1402`, so
> mapping "emc1442" to the same should be appropriate.
> 
> 
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> 
Thanks. I'll apply, and fix the description while doing so.

Guenter

