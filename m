Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474D61E8701
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2020 20:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgE2Szs (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 29 May 2020 14:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgE2Szr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 May 2020 14:55:47 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C7BC03E969;
        Fri, 29 May 2020 11:55:47 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f3so256041pfd.11;
        Fri, 29 May 2020 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fYjKDDeICBXrGG11GY9j9/rZl2s6XWCbpUSZjG1wuSk=;
        b=oCQL90tRRA1d4mnvC9q35QF1rd6ofQhsrUylrXvdCbLKMu/iHwMQ9j78uz+T81b9pM
         T/eGzZaUgKspgSJZ9+3B4wZqBXofXvZ+36TJ+eu9mwiD+LgAOk4tE26o+G2zEfZWqmnQ
         GEFNbey+bS8pJcBdUcWxxdHiI8psbES3DKkKp8OcFIkvkWfq4CoJkQYtXdMIa2y9eIqt
         HYaVbrsiEYwg6zA+OEU64Kq9mEpjkGym921/FtRD6UOZPVmKKaxyf/rVQS3gf7fDTFFd
         WV2efgInTGoTSN1R69WHq/pqyeHFuPSnAkia5OBbfoTXdM6MAI1ELCbJHSKQY3EeI2ub
         h6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fYjKDDeICBXrGG11GY9j9/rZl2s6XWCbpUSZjG1wuSk=;
        b=fNO+laiIvKSZtcB3D0ZAKbdy1uNQC8sGtpMalPVXEb66cTDhKYFUlE+jLU5NZKODpZ
         velL7Hjjk5IAkSVSe9MNeGDI9zX3PztdVRDvSGf0XGEUXlOmaTvNwy9YapAXOdZG2kJe
         tN5GUbldUEZAEZXHJ5y47d3HL4lGSZvtRQrG4KOVZDUz1Wn9zZRdApLe5cD0sqQOOVBD
         +ctu8SEvMfl8Vd+GCB6ZaU6dBLIgp8/Zp1au5M1/mEtSusrb5EN0IwyR54qG77oOEPKY
         M5QaefgatCsbQdOp1zbdBzfz4LRfZ2NYg4Kpg/wO3QJv2QS7z1lfbijuGJrVfObasCOl
         tzig==
X-Gm-Message-State: AOAM530g3n3T1ZrDbH+lpjielLk8Jm7l83hw/ysf0ZlCy1LbfbDsr75A
        FLAHD8xrOJ8SyOT4w429xD8=
X-Google-Smtp-Source: ABdhPJwl7NePayUo4Bh0gkEE8JWwruDQ3zKRedRBd19GFObsXvihjoEyvAlF24fxdfwcWHkEb1sAzw==
X-Received: by 2002:a63:5054:: with SMTP id q20mr9571150pgl.117.1590778547250;
        Fri, 29 May 2020 11:55:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z29sm8150504pff.120.2020.05.29.11.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 11:55:46 -0700 (PDT)
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
To:     Vijay Khemka <vijaykhemka@fb.com>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc:     "saipsdasari@fb.com" <saipsdasari@fb.com>,
        Patrick Williams <patrickw3@fb.com>,
        "manikandan.e@hcl.com" <manikandan.e@hcl.com>
References: <20200529124607.GA3469@cnn>
 <6F5BD2D3-997D-4607-BC0C-B36497B51D13@fb.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <41b169b7-83cb-c814-179e-9e62f17f27d8@roeck-us.net>
Date:   Fri, 29 May 2020 11:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6F5BD2D3-997D-4607-BC0C-B36497B51D13@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/29/20 10:57 AM, Vijay Khemka wrote:
> 
> 
> ﻿On 5/29/20, 5:47 AM, "Manikandan Elumalai" <manikandan.hcl.ers.epl@gmail.com> wrote:
> 
>     The adm1278 temperature sysfs attribute need it for one of the openbmc platform . 
>     This functionality is not enabled by default, so PMON_CONFIG needs to be modified in order to enable it.
>     
>     Signed-off-by   : Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
>     
>     v2:
>        - Add Signed-off-by.
>        - Removed ADM1278_TEMP1_EN check.
>     ---
>      drivers/hwmon/pmbus/adm1275.c | 21 +++++++++++++++++----
>      1 file changed, 17 insertions(+), 4 deletions(-)
>     
>     diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
>     index 5caa37fb..ab5fceb 100644
>     --- a/drivers/hwmon/pmbus/adm1275.c
>     +++ b/drivers/hwmon/pmbus/adm1275.c
>     @@ -666,7 +666,23 @@ static int adm1275_probe(struct i2c_client *client,
>      		tindex = 3;
>      
>      		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
>     -			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
>     +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>     +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>     +
>     +		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
>     +		if (config < 0)
>     +			return config;
>     +
>     +		/* Enable TEMP1 by default */
>     +		config |= ADM1278_TEMP1_EN;
>     +		ret = i2c_smbus_write_byte_data(client,
>     +					ADM1275_PMON_CONFIG,
>     +					config);
>     +		if (ret < 0) {
>     +		dev_err(&client->dev,
>     +			"Failed to enable temperature config\n");
>     +		return -ENODEV;
>     +		}
> You don't need this above code removing check as below should be enough  to
> populate sysfs entry you need.
> 

You mean you are only interested in having the attribute, even if it doesn't
report anything useful because monitoring is disabled in the chip ?
Sorry, I don't understand. Can you elaborate ?

Thanks,
Guenter

>      		/* Enable VOUT if not enabled (it is disabled by default) */
>      		if (!(config & ADM1278_VOUT_EN)) {
>     @@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
>      			}
>      		}
>      
>     -		if (config & ADM1278_TEMP1_EN)
>     -			info->func[0] |=
>     -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>      		if (config & ADM1278_VIN_EN)
>      			info->func[0] |= PMBUS_HAVE_VIN;
>      		break;
>     -- 
>     2.7.4
>     
>     
> 

