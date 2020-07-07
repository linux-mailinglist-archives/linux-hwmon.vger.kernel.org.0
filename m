Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB5D21632F
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 Jul 2020 02:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgGGAyZ (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Mon, 6 Jul 2020 20:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgGGAyZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jul 2020 20:54:25 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338A3C061755;
        Mon,  6 Jul 2020 17:54:25 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so16016054plo.7;
        Mon, 06 Jul 2020 17:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eaS1GX0vY6CT1o9zq8gdqiSp7q8XeHrxlPZrp9iqbWk=;
        b=JCMBhw9vom7gWdxfvH6pkuJ9zgZhpVbCIgi4saag0pZEyUr4rdSPeyx4kUB75k3deF
         GNIytI3TZLO0bwn+abM81pYi2KkopdomQhjnd9MkpgI3tiFhvET5zRYiOdmTEqy8hHUZ
         TKd502Ku2uL173BAO990kFHTx4Z42EXeas/LJja2uTFSWcYAnPZgSJPxGxCTcR4vvAig
         eClQZP8EunQ9cmVnKflktYydiKU3Qz0gw5wvSW4IJfngrl9CSxl82UpEH9PGo4TX74Tk
         G4WhxmD8AuRteKty2ZlgdSE4xkCXd4dsi6Sy7XtcVZXdiHLxf1A3ZaL9SPsZjOROdqh4
         zSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eaS1GX0vY6CT1o9zq8gdqiSp7q8XeHrxlPZrp9iqbWk=;
        b=f8Jiwz/JvbC8BwcAvROim0OZsR8w3kmQcjdNnolLlcM+sfQ1aCC3Kwgb0reQVpvaCH
         vPMoEDTylECFZV2ehOD1wNhyZpDu4TZdDJ7qTHQ16holg8VGpAayJOVpdQFB9wSxkURK
         /IY/I8nVVpDlVKiUBvG2LtXWidfBJx56OzflyOjYhE+KoKBODs/o+QONJaXvnvCPJYuH
         jiajPtYZHPEnxmXlLn7LkDjekCTQjrVMZZvXwhdX5dhPF7/6XAq/wZH2tkna2QnI253w
         Zb+yaSfYnbjHKoi6cR3zDrrDBrO46ZeDU+wppcnvxE6h/u/9XbkaM3fpOS2+VKoTf5ik
         45jQ==
X-Gm-Message-State: AOAM531PwAZAc4vGU4PQxaG5lmy8pHxwucvdLwi3+zAO9daszGIAwEMV
        kK33RpynokdXwriGeibVwp4zYaRHVtk=
X-Google-Smtp-Source: ABdhPJz23Bl0gYapBNv4j5baPHrfnKZp7mypAY7IxD8G9NIZzwXM0FbZV0W/o1BZhBlnadYN0r8aUw==
X-Received: by 2002:a17:90a:148:: with SMTP id z8mr1762523pje.197.1594083264693;
        Mon, 06 Jul 2020 17:54:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21sm10947187pfb.45.2020.07.06.17.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 17:54:24 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] hwmon:max6697: fixing the type issue where the
 comparison is always true
To:     Chu Lin <linchuyuan@google.com>
Cc:     belgaied@google.com, jasonling@google.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqil@google.com, kernel test robot <lkp@intel.com>
References: <20200707002203.2494094-1-linchuyuan@google.com>
 <20200707002203.2494094-3-linchuyuan@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1d6c34f5-6da2-a081-3d13-559f9dbbe352@roeck-us.net>
Date:   Mon, 6 Jul 2020 17:54:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707002203.2494094-3-linchuyuan@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/6/20 5:22 PM, Chu Lin wrote:
>   - Use reverse christmas tree order convension
>   - fix the type issue where comparision is always true
>   - Change the line limit to 100 char instead of 80 char
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Chu Lin <linchuyuan@google.com>

Unless I am missing something, this patch fixes the first patch
of the series. This is not reviewable. Please combine with the
first patch.

Thanks,
Guenter

> ---
>  drivers/hwmon/max6697.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
> index 8c814c544116..6b213e146fbe 100644
> --- a/drivers/hwmon/max6697.c
> +++ b/drivers/hwmon/max6697.c
> @@ -329,15 +329,13 @@ static ssize_t offset_store(struct device *dev,
>  			    struct device_attribute *devattr, const char *buf,
>  			    size_t count)
>  {
> -	long temp;
> -	u8 val, select;
> -	int ret, index;
> +	int val, ret, index, select;
>  	struct max6697_data *data;
> +	long temp;
>  
>  	index = to_sensor_dev_attr(devattr)->index;
>  	data = dev_get_drvdata(dev);
> -	select = i2c_smbus_read_byte_data(data->client,
> -					  MAX6581_REG_OFFSET_SELECT);
> +	select = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET_SELECT);
>  	if (select < 0)
>  		return select;
>  	ret = kstrtol(buf, 10, &temp);
> @@ -345,22 +343,18 @@ static ssize_t offset_store(struct device *dev,
>  		return ret;
>  	/* disable the offset for channel */
>  	if (temp == 0) {
> -		ret = i2c_smbus_write_byte_data(data->client,
> -						MAX6581_REG_OFFSET_SELECT,
> +		ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET_SELECT,
>  						select & ~(1 << (index - 1)));
>  		return ret < 0 ? ret : count;
>  	}
>  	temp = clamp_val(temp, MAX6581_OFFSET_MIN, MAX6581_OFFSET_MAX);
>  	val = DIV_ROUND_CLOSEST(temp, 250);
>  	mutex_lock(&data->update_lock);
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					MAX6581_REG_OFFSET_SELECT,
> +	ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET_SELECT,
>  					select | (1 << (index - 1)));
>  	if (ret < 0)
>  		return ret;
> -	ret = i2c_smbus_write_byte_data(data->client,
> -					MAX6581_REG_OFFSET,
> -					val);
> +	ret = i2c_smbus_write_byte_data(data->client, MAX6581_REG_OFFSET, val);
>  	mutex_unlock(&data->update_lock);
>  	return ret < 0 ? ret : count;
>  }
> @@ -368,18 +362,16 @@ static ssize_t offset_store(struct device *dev,
>  static ssize_t offset_show(struct device *dev, struct device_attribute *devattr,
>  			   char *buf)
>  {
> -	int select, ret, index;
>  	struct max6697_data *data;
> +	int select, ret, index;
>  
>  	index = to_sensor_dev_attr(devattr)->index;
>  	data = dev_get_drvdata(dev);
> -	select = i2c_smbus_read_byte_data(data->client,
> -					  MAX6581_REG_OFFSET_SELECT);
> +	select = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET_SELECT);
>  	if (select < 0)
>  		return select;
>  	if (select & (1 << (index - 1))) {
> -		ret = i2c_smbus_read_byte_data(data->client,
> -					       MAX6581_REG_OFFSET);
> +		ret = i2c_smbus_read_byte_data(data->client, MAX6581_REG_OFFSET);
>  		if (ret < 0)
>  			return ret;
>  	} else {
> 

