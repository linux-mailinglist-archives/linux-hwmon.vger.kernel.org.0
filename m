Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5DF626340E
	for <lists+linux-hwmon@lfdr.de>; Wed,  9 Sep 2020 19:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730280AbgIIRNe (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 9 Sep 2020 13:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgIIPcW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Sep 2020 11:32:22 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD645C061756;
        Wed,  9 Sep 2020 08:31:07 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 185so2734618oie.11;
        Wed, 09 Sep 2020 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tSgsq9zZhpkzLhA9Y8uyv8bzBmNho/QvRHp/rEYJJaQ=;
        b=jrPAVlhOCfDjcxMkdtnXgoaMQ9g+BE0Bt8xsYrxiGhf/ja44JVGrjaUzbbC++rjxk2
         PgBsVIb/zKiLAZOxNnW4uyKru1hpEtHCj1Ex3/jqh8HnrQhFPffLILS2hi8nDT6rnVP+
         eC7eCOLYTXuNbEGSRa9Io9ULDN2YDAnMjzkRWS0+w4k3j1nIY969bGHriDGbPMlPcSxR
         WY1WmxGBgIE1hAulMioHSnl1IgKi1nkx7Rxno6nw3Wnhuop6nbw4jqrxlzwvjJ/nfOAo
         R0d6M3x3rysIvLQ98MZcT+/RQjEre8h+VUKQYvHYFJHlBh4UQ1Sn0wcKCjZvpAdAAC9D
         jD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tSgsq9zZhpkzLhA9Y8uyv8bzBmNho/QvRHp/rEYJJaQ=;
        b=LGzGAk6+nCXE8hAy2riuZTzfxHdKRFLzqIUjOP6VwK2Z6b2kzPna1n9nvbnU7BE24N
         K/Lf/1WuSqpk0sV3DsSHCIUTxvwozkhvtuYDbF7P2e8yDN+x+iykOnJtMUc5cXJmk8Ur
         YDbirDpadBob4xr6PF+Y7xCrtaoakT33q1nk4yW8AE0RYpXDQXQA+1xmkiIPTnYKeC/R
         DEJmhlZH/DBlJK9lE6kbFbMtBClz2eh9dbV+NJP30bQ1ioSmSFNn69YBP+7ttSdQD1uU
         sB97rYyBJp3LsVEh2Mrmceuylw9Fe3VJJTqFkT5aPSQZb6GlZ1KJ/k4gD7jYuBSADCeN
         cA9w==
X-Gm-Message-State: AOAM5334DTFcMoixUzJ4/vVM2ITgyGWnzbbPrYdqFJErxUod4JTuZY5D
        vnpd0Qdssv3gtYC9oWfs1C9hKPgZDLE=
X-Google-Smtp-Source: ABdhPJwmLueZHLJ64xudh7umkHBP7kF/oOLmyEL+d1nLqrlPu7RN/sQciFpuqObAvspMiYRf9Pa1Qw==
X-Received: by 2002:aca:fd58:: with SMTP id b85mr972902oii.20.1599665467200;
        Wed, 09 Sep 2020 08:31:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c14sm432507ooi.9.2020.09.09.08.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 08:31:06 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus) Expose PEC debugfs attribute
To:     Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20200909132411.2906159-1-andrew@aj.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4f2de881-1391-b1b1-18b3-8d3a06653da9@roeck-us.net>
Date:   Wed, 9 Sep 2020 08:31:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909132411.2906159-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/9/20 6:24 AM, Andrew Jeffery wrote:
> Enable runtime debug control of whether the PEC byte is exchanged with
> the PMBus device.
> 
> Some manufacturers have asked for the PEC to be disabled as part of
> debugging driver communication issues with devices.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 39 ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 44535add3a4a..51c8502b35e9 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2346,6 +2346,42 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
>  DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
>  			 NULL, "0x%04llx\n");
>  
> +static int pmbus_debugfs_get_pec(void *data, u64 *val)
> +{
> +	struct i2c_client *client = data;
> +
> +	*val = !!(client->flags & I2C_CLIENT_PEC);
> +
> +	return 0;
> +}
> +
> +static int pmbus_debugfs_set_pec(void *data, u64 val)
> +{
> +	int rc;
> +	struct i2c_client *client = data;
> +
> +	if (!val) {
> +		client->flags &= ~I2C_CLIENT_PEC;
> +		return 0;
> +	}
> +
> +	if (val != 1)
> +		return -EINVAL;
> +
> +	rc = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (!(rc & PB_CAPABILITY_ERROR_CHECK))
> +		return -ENOTSUPP;

WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

> +
> +	client->flags |= I2C_CLIENT_PEC;
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_pec, pmbus_debugfs_get_pec,
> +			 pmbus_debugfs_set_pec, "0x%1llu\n");

ERROR: Prefixing 0x with decimal output is defective

(since the displayed value is a boolean, it is also quite useless).

> +
>  static int pmbus_init_debugfs(struct i2c_client *client,
>  			      struct pmbus_data *data)
>  {
> @@ -2374,6 +2410,9 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>  	if (!entries)
>  		return -ENOMEM;
>  
> +	debugfs_create_file("pec", 0664, data->debugfs, client,
> +			    &pmbus_debugfs_ops_pec);
> +
>  	for (i = 0; i < data->info->pages; ++i) {
>  		/* Check accessibility of status register if it's not page 0 */
>  		if (!i || pmbus_check_status_register(client, i)) {
> 

