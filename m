Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6ECF3FA124
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Aug 2021 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhH0V1U (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 Aug 2021 17:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbhH0V1U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Aug 2021 17:27:20 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD58C0613D9;
        Fri, 27 Aug 2021 14:26:30 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso9670640ots.5;
        Fri, 27 Aug 2021 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PuxFPBRPeGMP/NztoSuT4Scwr+PloYmA5Ph1q0hukzk=;
        b=GUJ427fq53qRl6lYHoAz7KEsuXc9aZ5zx12toqvhcPxXQJaTQR13kVmXfpZ3qj4WZa
         U6lVDS1V0gDIop2EvaMVgw7fxeg12h+sTR2s/VcJEUz41JLU7wxssfhYB2oMouly7ADP
         Kcehf0bkGXLHkMd4jliV02/4BqokbGW22fYGNXtVbc30neOMzCFVD5E56+lmb0RewDVS
         py0y+lUvsCldCsC00gdi5bWnbpP7bBRJ6qaPmrpvl2at172WLqHByjZwaKfFWpdHnbYn
         w/hVdG4JG2QVIp1FwkDvwof3yCFJv8efbBQst0L2yHCOcl5lYspFaJ+xdMF43GSUxTM/
         eIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=PuxFPBRPeGMP/NztoSuT4Scwr+PloYmA5Ph1q0hukzk=;
        b=SCaCxkC9QNm+0+1RVB1qlBn8+un7fhpnG7OL94ZHhnjzt+od1MzE+K9t+6rduacyeS
         RRF+1R4EdJjBPNW814DQF7I3C0nAnLSTM1IRXkUs2DKQpCCC5iyP4gm1sldgaLCE3pPB
         aJZ0sKgh8G67MlZgJVPYR4kJ86ZEAFttBAK+BfIJPKtmKViS6x5tqLE+tOjgM1QhwcyZ
         KrzBINNzUa6uTtmF24WGcsLd+yPEbfpkb3TfesvO3QzBnhH2bbPY279i2DULNApEjnWR
         QGewP0zbBZnB8hqdpCio5lCeV6ZQxtDsNQjxtjzK1ADJX13hO7AoW0/TtAsgWxorLAjC
         3+oA==
X-Gm-Message-State: AOAM530NegiSdfM72Nk6frVevJHC4F9zIgXn6qQUwxr8qigLAm41EYA8
        oiJXVDJzQqkZfa9RNVKcVGk=
X-Google-Smtp-Source: ABdhPJxhiqwrQJRKKxpWlOyRSrcouiIgPiYbQmDUwMLf9g3qQaItvCNkJMSdpIrGR9SWwsC58F0yrA==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr9308775otv.48.1630099589881;
        Fri, 27 Aug 2021 14:26:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f132sm1607382oia.48.2021.08.27.14.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 14:26:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 27 Aug 2021 14:26:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (adt7470) Convert to
 devm_hwmon_device_register_with_info API
Message-ID: <20210827212628.GA716592@roeck-us.net>
References: <20210826024121.15665-1-chris.packham@alliedtelesis.co.nz>
 <20210826024121.15665-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826024121.15665-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 26, 2021 at 02:41:20PM +1200, Chris Packham wrote:
> Use the devm_hwmon_device_register_with_info API and remove code that
> deals with the standard sensor attributes.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied, after fixing up a couple of formattin issues reported by
checkpatch --strict.

> ---
> Change in v2:
> - split regmap and devm_hwmon_device_register_with_info into separate
>   patches to aid review

... and thanks a lot for that!

Guenter

> 
>  drivers/hwmon/adt7470.c | 683 +++++++++++++++++-----------------------
>  1 file changed, 286 insertions(+), 397 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index ad3e46667be8..db19a52b13de 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -533,87 +533,59 @@ static ssize_t num_temp_sensors_store(struct device *dev,
>  	return count;
>  }
>  
> -static ssize_t temp_min_show(struct device *dev,
> -			     struct device_attribute *devattr, char *buf)
> +static int adt7470_temp_read(struct device *dev, u32 attr, int channel, long *val)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct adt7470_data *data = adt7470_update_device(dev);
>  
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
>  
> -	return sprintf(buf, "%d\n", 1000 * data->temp_min[attr->index]);
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		*val = 1000 * data->temp[channel];
> +		break;
> +	case hwmon_temp_min:
> +		*val = 1000 * data->temp_min[channel];
> +		break;
> +	case hwmon_temp_max:
> +		*val = 1000 * data->temp_max[channel];
> +		break;
> +	case hwmon_temp_alarm:
> +		*val = !!(data->alarm & channel);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
>  }
>  
> -static ssize_t temp_min_store(struct device *dev,
> -			      struct device_attribute *devattr,
> -			      const char *buf, size_t count)
> +static int adt7470_temp_write(struct device *dev, u32 attr, int channel, long val)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct adt7470_data *data = dev_get_drvdata(dev);
> -	long temp;
>  	int err;
>  
> -	if (kstrtol(buf, 10, &temp))
> -		return -EINVAL;
> +	val = clamp_val(val, -128000, 127000);
> +	val = DIV_ROUND_CLOSEST(val, 1000);
>  
> -	temp = clamp_val(temp, -128000, 127000);
> -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> +	switch (attr) {
> +	case hwmon_temp_min:
> +		mutex_lock(&data->lock);
> +		data->temp_min[channel] = val;
> +		err = regmap_write(data->regmap, ADT7470_TEMP_MIN_REG(channel), val);
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_temp_max:
> +		mutex_lock(&data->lock);
> +		data->temp_max[channel] = val;
> +		err = regmap_write(data->regmap, ADT7470_TEMP_MAX_REG(channel), val);
> +		mutex_unlock(&data->lock);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
>  
> -	mutex_lock(&data->lock);
> -	data->temp_min[attr->index] = temp;
> -	err = regmap_write(data->regmap, ADT7470_TEMP_MIN_REG(attr->index),
> -				  temp);
> -	mutex_unlock(&data->lock);
> -
> -	return err < 0 ? err : count;
> -}
> -
> -static ssize_t temp_max_show(struct device *dev,
> -			     struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	return sprintf(buf, "%d\n", 1000 * data->temp_max[attr->index]);
> -}
> -
> -static ssize_t temp_max_store(struct device *dev,
> -			      struct device_attribute *devattr,
> -			      const char *buf, size_t count)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = dev_get_drvdata(dev);
> -	long temp;
> -	int err;
> -
> -	if (kstrtol(buf, 10, &temp))
> -		return -EINVAL;
> -
> -	temp = clamp_val(temp, -128000, 127000);
> -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> -
> -	mutex_lock(&data->lock);
> -	data->temp_max[attr->index] = temp;
> -	err = regmap_write(data->regmap, ADT7470_TEMP_MAX_REG(attr->index), temp);
> -	mutex_unlock(&data->lock);
> -
> -	return err < 0 ? err : count;
> -}
> -
> -static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
> -			 char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	return sprintf(buf, "%d\n", 1000 * data->temp[attr->index]);
> +	return err;
>  }
>  
>  static ssize_t alarm_mask_show(struct device *dev,
> @@ -650,98 +622,68 @@ static ssize_t alarm_mask_store(struct device *dev,
>  	return err < 0 ? err : count;
>  }
>  
> -static ssize_t fan_max_show(struct device *dev,
> -			    struct device_attribute *devattr, char *buf)
> +static int adt7470_fan_read(struct device *dev, u32 attr, int channel, long *val)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct adt7470_data *data = adt7470_update_device(dev);
>  
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
>  
> -	if (FAN_DATA_VALID(data->fan_max[attr->index]))
> -		return sprintf(buf, "%d\n",
> -			       FAN_PERIOD_TO_RPM(data->fan_max[attr->index]));
> -	else
> -		return sprintf(buf, "0\n");
> +	switch (attr) {
> +	case hwmon_fan_input:
> +		if (FAN_DATA_VALID(data->fan[channel]))
> +			*val = FAN_PERIOD_TO_RPM(data->fan[channel]);
> +		else
> +			*val = 0;
> +		break;
> +	case hwmon_fan_min:
> +		if (FAN_DATA_VALID(data->fan_min[channel]))
> +			*val = FAN_PERIOD_TO_RPM(data->fan_min[channel]);
> +		else
> +			*val = 0;
> +		break;
> +	case hwmon_fan_max:
> +		if (FAN_DATA_VALID(data->fan_max[channel]))
> +			*val = FAN_PERIOD_TO_RPM(data->fan_max[channel]);
> +		else
> +			*val = 0;
> +		break;
> +	case hwmon_fan_alarm:
> +		*val = !!(data->alarm & (1 << (12 + channel)));
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
>  }
>  
> -static ssize_t fan_max_store(struct device *dev,
> -			     struct device_attribute *devattr,
> -			     const char *buf, size_t count)
> +static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct adt7470_data *data = dev_get_drvdata(dev);
> -	long temp;
>  	int err;
>  
> -	if (kstrtol(buf, 10, &temp) || !temp)
> -		return -EINVAL;
> +	val = FAN_RPM_TO_PERIOD(val);
> +	val = clamp_val(val, 1, 65534);
>  
> -	temp = FAN_RPM_TO_PERIOD(temp);
> -	temp = clamp_val(temp, 1, 65534);
> +	switch (attr) {
> +	case hwmon_fan_min:
> +		mutex_lock(&data->lock);
> +		data->fan_min[channel] = val;
> +		err = adt7470_write_word_data(data, ADT7470_REG_FAN_MIN(channel), val);
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_fan_max:
> +		mutex_lock(&data->lock);
> +		data->fan_max[channel] = val;
> +		err = adt7470_write_word_data(data, ADT7470_REG_FAN_MAX(channel), val);
> +		mutex_unlock(&data->lock);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
>  
> -	mutex_lock(&data->lock);
> -	data->fan_max[attr->index] = temp;
> -	err = adt7470_write_word_data(data, ADT7470_REG_FAN_MAX(attr->index), temp);
> -	mutex_unlock(&data->lock);
> -
> -	return err < 0 ? err : count;
> -}
> -
> -static ssize_t fan_min_show(struct device *dev,
> -			    struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	if (FAN_DATA_VALID(data->fan_min[attr->index]))
> -		return sprintf(buf, "%d\n",
> -			       FAN_PERIOD_TO_RPM(data->fan_min[attr->index]));
> -	else
> -		return sprintf(buf, "0\n");
> -}
> -
> -static ssize_t fan_min_store(struct device *dev,
> -			     struct device_attribute *devattr,
> -			     const char *buf, size_t count)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = dev_get_drvdata(dev);
> -	long temp;
> -	int err;
> -
> -	if (kstrtol(buf, 10, &temp) || !temp)
> -		return -EINVAL;
> -
> -	temp = FAN_RPM_TO_PERIOD(temp);
> -	temp = clamp_val(temp, 1, 65534);
> -
> -	mutex_lock(&data->lock);
> -	data->fan_min[attr->index] = temp;
> -	err = adt7470_write_word_data(data, ADT7470_REG_FAN_MIN(attr->index), temp);
> -	mutex_unlock(&data->lock);
> -
> -	return err < 0 ? err : count;
> -}
> -
> -static ssize_t fan_show(struct device *dev, struct device_attribute *devattr,
> -			char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	if (FAN_DATA_VALID(data->fan[attr->index]))
> -		return sprintf(buf, "%d\n",
> -			       FAN_PERIOD_TO_RPM(data->fan[attr->index]));
> -	else
> -		return sprintf(buf, "0\n");
> +	return err;
>  }
>  
>  static ssize_t force_pwm_max_show(struct device *dev,
> @@ -776,55 +718,18 @@ static ssize_t force_pwm_max_store(struct device *dev,
>  	return err < 0 ? err : count;
>  }
>  
> -static ssize_t pwm_show(struct device *dev, struct device_attribute *devattr,
> -			char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	return sprintf(buf, "%d\n", data->pwm[attr->index]);
> -}
> -
> -static ssize_t pwm_store(struct device *dev, struct device_attribute *devattr,
> -			 const char *buf, size_t count)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = dev_get_drvdata(dev);
> -	long temp;
> -	int err;
> -
> -	if (kstrtol(buf, 10, &temp))
> -		return -EINVAL;
> -
> -	temp = clamp_val(temp, 0, 255);
> -
> -	mutex_lock(&data->lock);
> -	data->pwm[attr->index] = temp;
> -	err = regmap_write(data->regmap, ADT7470_REG_PWM(attr->index), temp);
> -	mutex_unlock(&data->lock);
> -
> -	return err < 0 ? err : count;
> -}
> -
>  /* These are the valid PWM frequencies to the nearest Hz */
>  static const int adt7470_freq_map[] = {
>  	11, 15, 22, 29, 35, 44, 59, 88, 1400, 22500
>  };
>  
> -static ssize_t pwm1_freq_show(struct device *dev,
> -			      struct device_attribute *devattr, char *buf)
> +static int pwm1_freq_get(struct device *dev)
>  {
> -	struct adt7470_data *data = adt7470_update_device(dev);
> +	struct adt7470_data *data = dev_get_drvdata(dev);
>  	unsigned int cfg_reg_1, cfg_reg_2;
>  	int index;
>  	int err;
>  
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
>  	mutex_lock(&data->lock);
>  	err = regmap_read(data->regmap, ADT7470_REG_CFG, &cfg_reg_1);
>  	if (err < 0)
> @@ -840,26 +745,44 @@ static ssize_t pwm1_freq_show(struct device *dev,
>  	if (index >= ARRAY_SIZE(adt7470_freq_map))
>  		index = ARRAY_SIZE(adt7470_freq_map) - 1;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%d\n", adt7470_freq_map[index]);
> +	return adt7470_freq_map[index];
>  
>  out:
>  	mutex_unlock(&data->lock);
>  	return err;
>  }
>  
> -static ssize_t pwm1_freq_store(struct device *dev,
> -			       struct device_attribute *devattr,
> -			       const char *buf, size_t count)
> +static int adt7470_pwm_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +	struct adt7470_data *data = adt7470_update_device(dev);
> +
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		*val = data->pwm[channel];
> +		break;
> +	case hwmon_pwm_enable:
> +		*val = 1 + data->pwm_automatic[channel];
> +		break;
> +	case hwmon_pwm_freq:
> +		*val = pwm1_freq_get(dev);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pwm1_freq_set(struct device *dev, long freq)
>  {
>  	struct adt7470_data *data = dev_get_drvdata(dev);
> -	long freq;
> +	unsigned int low_freq = ADT7470_CFG_LF;
>  	int index;
> -	int low_freq = ADT7470_CFG_LF;
>  	int err;
>  
> -	if (kstrtol(buf, 10, &freq))
> -		return -EINVAL;
> -
>  	/* Round the user value given to the closest available frequency */
>  	index = find_closest(freq, adt7470_freq_map,
>  			     ARRAY_SIZE(adt7470_freq_map));
> @@ -883,7 +806,50 @@ static ssize_t pwm1_freq_store(struct device *dev,
>  out:
>  	mutex_unlock(&data->lock);
>  
> -	return err < 0 ? err : count;
> +	return err;
> +}
> +
> +static int adt7470_pwm_write(struct device *dev, u32 attr, int channel, long val)
> +{
> +	struct adt7470_data *data = dev_get_drvdata(dev);
> +	unsigned int pwm_auto_reg_mask;
> +	int err;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		val = clamp_val(val, 0, 255);
> +		mutex_lock(&data->lock);
> +		data->pwm[channel] = val;
> +		err = regmap_write(data->regmap, ADT7470_REG_PWM(channel),
> +				   data->pwm[channel]);
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_pwm_enable:
> +		if (channel % 2)
> +			pwm_auto_reg_mask = ADT7470_PWM2_AUTO_MASK;
> +		else
> +			pwm_auto_reg_mask = ADT7470_PWM1_AUTO_MASK;
> +
> +		if (val != 2 && val != 1)
> +			return -EINVAL;
> +		val--;
> +
> +		mutex_lock(&data->lock);
> +		data->pwm_automatic[channel] = val;
> +		err = regmap_update_bits(data->regmap, ADT7470_REG_PWM_CFG(channel),
> +				pwm_auto_reg_mask,
> +				val ? pwm_auto_reg_mask : 0);
> +		mutex_unlock(&data->lock);
> +		break;
> +	case hwmon_pwm_freq:
> +		err = pwm1_freq_set(dev, val);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return err;
> +
>  }
>  
>  static ssize_t pwm_max_show(struct device *dev,
> @@ -1005,50 +971,6 @@ static ssize_t pwm_tmin_store(struct device *dev,
>  	return err < 0 ? err : count;
>  }
>  
> -static ssize_t pwm_auto_show(struct device *dev,
> -			     struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	return sprintf(buf, "%d\n", 1 + data->pwm_automatic[attr->index]);
> -}
> -
> -static ssize_t pwm_auto_store(struct device *dev,
> -			      struct device_attribute *devattr,
> -			      const char *buf, size_t count)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = dev_get_drvdata(dev);
> -	int pwm_auto_reg_mask;
> -	long temp;
> -	int err;
> -
> -	if (kstrtol(buf, 10, &temp))
> -		return -EINVAL;
> -
> -	if (attr->index % 2)
> -		pwm_auto_reg_mask = ADT7470_PWM2_AUTO_MASK;
> -	else
> -		pwm_auto_reg_mask = ADT7470_PWM1_AUTO_MASK;
> -
> -	if (temp != 2 && temp != 1)
> -		return -EINVAL;
> -	temp--;
> -
> -	mutex_lock(&data->lock);
> -	data->pwm_automatic[attr->index] = temp;
> -	err = regmap_update_bits(data->regmap, ADT7470_REG_PWM_CFG(attr->index),
> -				 pwm_auto_reg_mask,
> -				 temp ? pwm_auto_reg_mask : 0);
> -	mutex_unlock(&data->lock);
> -
> -	return err < 0 ? err : count;
> -}
> -
>  static ssize_t pwm_auto_temp_show(struct device *dev,
>  				  struct device_attribute *devattr, char *buf)
>  {
> @@ -1110,98 +1032,12 @@ static ssize_t pwm_auto_temp_store(struct device *dev,
>  	return err < 0 ? err : count;
>  }
>  
> -static ssize_t alarm_show(struct device *dev,
> -			  struct device_attribute *devattr, char *buf)
> -{
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct adt7470_data *data = adt7470_update_device(dev);
> -
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> -
> -	if (data->alarm & attr->index)
> -		return sprintf(buf, "1\n");
> -	else
> -		return sprintf(buf, "0\n");
> -}
> -
>  static DEVICE_ATTR_RW(alarm_mask);
>  static DEVICE_ATTR_RW(num_temp_sensors);
>  static DEVICE_ATTR_RW(auto_update_interval);
>  
> -static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
> -static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
> -static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
> -static SENSOR_DEVICE_ATTR_RW(temp4_max, temp_max, 3);
> -static SENSOR_DEVICE_ATTR_RW(temp5_max, temp_max, 4);
> -static SENSOR_DEVICE_ATTR_RW(temp6_max, temp_max, 5);
> -static SENSOR_DEVICE_ATTR_RW(temp7_max, temp_max, 6);
> -static SENSOR_DEVICE_ATTR_RW(temp8_max, temp_max, 7);
> -static SENSOR_DEVICE_ATTR_RW(temp9_max, temp_max, 8);
> -static SENSOR_DEVICE_ATTR_RW(temp10_max, temp_max, 9);
> -
> -static SENSOR_DEVICE_ATTR_RW(temp1_min, temp_min, 0);
> -static SENSOR_DEVICE_ATTR_RW(temp2_min, temp_min, 1);
> -static SENSOR_DEVICE_ATTR_RW(temp3_min, temp_min, 2);
> -static SENSOR_DEVICE_ATTR_RW(temp4_min, temp_min, 3);
> -static SENSOR_DEVICE_ATTR_RW(temp5_min, temp_min, 4);
> -static SENSOR_DEVICE_ATTR_RW(temp6_min, temp_min, 5);
> -static SENSOR_DEVICE_ATTR_RW(temp7_min, temp_min, 6);
> -static SENSOR_DEVICE_ATTR_RW(temp8_min, temp_min, 7);
> -static SENSOR_DEVICE_ATTR_RW(temp9_min, temp_min, 8);
> -static SENSOR_DEVICE_ATTR_RW(temp10_min, temp_min, 9);
> -
> -static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
> -static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
> -static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
> -static SENSOR_DEVICE_ATTR_RO(temp4_input, temp, 3);
> -static SENSOR_DEVICE_ATTR_RO(temp5_input, temp, 4);
> -static SENSOR_DEVICE_ATTR_RO(temp6_input, temp, 5);
> -static SENSOR_DEVICE_ATTR_RO(temp7_input, temp, 6);
> -static SENSOR_DEVICE_ATTR_RO(temp8_input, temp, 7);
> -static SENSOR_DEVICE_ATTR_RO(temp9_input, temp, 8);
> -static SENSOR_DEVICE_ATTR_RO(temp10_input, temp, 9);
> -
> -static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, ADT7470_R1T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, ADT7470_R2T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, ADT7470_R3T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp4_alarm, alarm, ADT7470_R4T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp5_alarm, alarm, ADT7470_R5T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp6_alarm, alarm, ADT7470_R6T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp7_alarm, alarm, ADT7470_R7T_ALARM);
> -static SENSOR_DEVICE_ATTR_RO(temp8_alarm, alarm, ALARM2(ADT7470_R8T_ALARM));
> -static SENSOR_DEVICE_ATTR_RO(temp9_alarm, alarm, ALARM2(ADT7470_R9T_ALARM));
> -static SENSOR_DEVICE_ATTR_RO(temp10_alarm, alarm, ALARM2(ADT7470_R10T_ALARM));
> -
> -static SENSOR_DEVICE_ATTR_RW(fan1_max, fan_max, 0);
> -static SENSOR_DEVICE_ATTR_RW(fan2_max, fan_max, 1);
> -static SENSOR_DEVICE_ATTR_RW(fan3_max, fan_max, 2);
> -static SENSOR_DEVICE_ATTR_RW(fan4_max, fan_max, 3);
> -
> -static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
> -static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
> -static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
> -static SENSOR_DEVICE_ATTR_RW(fan4_min, fan_min, 3);
> -
> -static SENSOR_DEVICE_ATTR_RO(fan1_input, fan, 0);
> -static SENSOR_DEVICE_ATTR_RO(fan2_input, fan, 1);
> -static SENSOR_DEVICE_ATTR_RO(fan3_input, fan, 2);
> -static SENSOR_DEVICE_ATTR_RO(fan4_input, fan, 3);
> -
> -static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, ALARM2(ADT7470_FAN1_ALARM));
> -static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, ALARM2(ADT7470_FAN2_ALARM));
> -static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, ALARM2(ADT7470_FAN3_ALARM));
> -static SENSOR_DEVICE_ATTR_RO(fan4_alarm, alarm, ALARM2(ADT7470_FAN4_ALARM));
> -
>  static SENSOR_DEVICE_ATTR_RW(force_pwm_max, force_pwm_max, 0);
>  
> -static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> -static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
> -static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
> -static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
> -
> -static DEVICE_ATTR_RW(pwm1_freq);
> -
>  static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_pwm, pwm_min, 0);
>  static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_pwm, pwm_min, 1);
>  static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point1_pwm, pwm_min, 2);
> @@ -1222,11 +1058,6 @@ static SENSOR_DEVICE_ATTR_RO(pwm2_auto_point2_temp, pwm_tmax, 1);
>  static SENSOR_DEVICE_ATTR_RO(pwm3_auto_point2_temp, pwm_tmax, 2);
>  static SENSOR_DEVICE_ATTR_RO(pwm4_auto_point2_temp, pwm_tmax, 3);
>  
> -static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_auto, 0);
> -static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_auto, 1);
> -static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_auto, 2);
> -static SENSOR_DEVICE_ATTR_RW(pwm4_enable, pwm_auto, 3);
> -
>  static SENSOR_DEVICE_ATTR_RW(pwm1_auto_channels_temp, pwm_auto_temp, 0);
>  static SENSOR_DEVICE_ATTR_RW(pwm2_auto_channels_temp, pwm_auto_temp, 1);
>  static SENSOR_DEVICE_ATTR_RW(pwm3_auto_channels_temp, pwm_auto_temp, 2);
> @@ -1236,68 +1067,7 @@ static struct attribute *adt7470_attrs[] = {
>  	&dev_attr_alarm_mask.attr,
>  	&dev_attr_num_temp_sensors.attr,
>  	&dev_attr_auto_update_interval.attr,
> -	&sensor_dev_attr_temp1_max.dev_attr.attr,
> -	&sensor_dev_attr_temp2_max.dev_attr.attr,
> -	&sensor_dev_attr_temp3_max.dev_attr.attr,
> -	&sensor_dev_attr_temp4_max.dev_attr.attr,
> -	&sensor_dev_attr_temp5_max.dev_attr.attr,
> -	&sensor_dev_attr_temp6_max.dev_attr.attr,
> -	&sensor_dev_attr_temp7_max.dev_attr.attr,
> -	&sensor_dev_attr_temp8_max.dev_attr.attr,
> -	&sensor_dev_attr_temp9_max.dev_attr.attr,
> -	&sensor_dev_attr_temp10_max.dev_attr.attr,
> -	&sensor_dev_attr_temp1_min.dev_attr.attr,
> -	&sensor_dev_attr_temp2_min.dev_attr.attr,
> -	&sensor_dev_attr_temp3_min.dev_attr.attr,
> -	&sensor_dev_attr_temp4_min.dev_attr.attr,
> -	&sensor_dev_attr_temp5_min.dev_attr.attr,
> -	&sensor_dev_attr_temp6_min.dev_attr.attr,
> -	&sensor_dev_attr_temp7_min.dev_attr.attr,
> -	&sensor_dev_attr_temp8_min.dev_attr.attr,
> -	&sensor_dev_attr_temp9_min.dev_attr.attr,
> -	&sensor_dev_attr_temp10_min.dev_attr.attr,
> -	&sensor_dev_attr_temp1_input.dev_attr.attr,
> -	&sensor_dev_attr_temp2_input.dev_attr.attr,
> -	&sensor_dev_attr_temp3_input.dev_attr.attr,
> -	&sensor_dev_attr_temp4_input.dev_attr.attr,
> -	&sensor_dev_attr_temp5_input.dev_attr.attr,
> -	&sensor_dev_attr_temp6_input.dev_attr.attr,
> -	&sensor_dev_attr_temp7_input.dev_attr.attr,
> -	&sensor_dev_attr_temp8_input.dev_attr.attr,
> -	&sensor_dev_attr_temp9_input.dev_attr.attr,
> -	&sensor_dev_attr_temp10_input.dev_attr.attr,
> -	&sensor_dev_attr_temp1_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp2_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp3_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp4_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp5_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp6_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp7_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp8_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp9_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp10_alarm.dev_attr.attr,
> -	&sensor_dev_attr_fan1_max.dev_attr.attr,
> -	&sensor_dev_attr_fan2_max.dev_attr.attr,
> -	&sensor_dev_attr_fan3_max.dev_attr.attr,
> -	&sensor_dev_attr_fan4_max.dev_attr.attr,
> -	&sensor_dev_attr_fan1_min.dev_attr.attr,
> -	&sensor_dev_attr_fan2_min.dev_attr.attr,
> -	&sensor_dev_attr_fan3_min.dev_attr.attr,
> -	&sensor_dev_attr_fan4_min.dev_attr.attr,
> -	&sensor_dev_attr_fan1_input.dev_attr.attr,
> -	&sensor_dev_attr_fan2_input.dev_attr.attr,
> -	&sensor_dev_attr_fan3_input.dev_attr.attr,
> -	&sensor_dev_attr_fan4_input.dev_attr.attr,
> -	&sensor_dev_attr_fan1_alarm.dev_attr.attr,
> -	&sensor_dev_attr_fan2_alarm.dev_attr.attr,
> -	&sensor_dev_attr_fan3_alarm.dev_attr.attr,
> -	&sensor_dev_attr_fan4_alarm.dev_attr.attr,
>  	&sensor_dev_attr_force_pwm_max.dev_attr.attr,
> -	&sensor_dev_attr_pwm1.dev_attr.attr,
> -	&dev_attr_pwm1_freq.attr,
> -	&sensor_dev_attr_pwm2.dev_attr.attr,
> -	&sensor_dev_attr_pwm3.dev_attr.attr,
> -	&sensor_dev_attr_pwm4.dev_attr.attr,
>  	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> @@ -1314,10 +1084,6 @@ static struct attribute *adt7470_attrs[] = {
>  	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm4_auto_point2_temp.dev_attr.attr,
> -	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> -	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
> -	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
> -	&sensor_dev_attr_pwm4_enable.dev_attr.attr,
>  	&sensor_dev_attr_pwm1_auto_channels_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm2_auto_channels_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_auto_channels_temp.dev_attr.attr,
> @@ -1327,6 +1093,129 @@ static struct attribute *adt7470_attrs[] = {
>  
>  ATTRIBUTE_GROUPS(adt7470);
>  
> +static int adt7470_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return adt7470_temp_read(dev, attr, channel, val);
> +	case hwmon_fan:
> +		return adt7470_fan_read(dev, attr, channel, val);
> +	case hwmon_pwm:
> +		return adt7470_pwm_read(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int adt7470_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			int channel, long val)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		return adt7470_temp_write(dev, attr, channel, val);
> +	case hwmon_fan:
> +		return adt7470_fan_write(dev, attr, channel, val);
> +	case hwmon_pwm:
> +		return adt7470_pwm_write(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t adt7470_is_visible(const void *_data, enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	umode_t mode = 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp:
> +		case hwmon_temp_alarm:
> +			mode = 0444;
> +			break;
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +			mode = 0644;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +		case hwmon_fan_alarm:
> +			mode = 0444;
> +			break;
> +		case hwmon_fan_min:
> +		case hwmon_fan_max:
> +			mode = 0644;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		switch (attr) {
> +		case hwmon_pwm_input:
> +		case hwmon_pwm_enable:
> +			mode = 0644;
> +			break;
> +		case hwmon_pwm_freq:
> +			if (channel == 0)
> +				mode = 0644;
> +			else
> +				mode = 0;
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return mode;
> +}
> +
> +static const struct hwmon_ops adt7470_hwmon_ops = {
> +	.is_visible = adt7470_is_visible,
> +	.read = adt7470_read,
> +	.write = adt7470_write,
> +};
> +
> +static const struct hwmon_channel_info *adt7470_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
> +			HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM),
> +	HWMON_CHANNEL_INFO(fan,
> +			HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX | HWMON_F_DIV | HWMON_F_ALARM,
> +			HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX | HWMON_F_DIV | HWMON_F_ALARM,
> +			HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX | HWMON_F_DIV | HWMON_F_ALARM,
> +			HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MAX | HWMON_F_DIV | HWMON_F_ALARM),
> +	HWMON_CHANNEL_INFO(pwm,
> +			HWMON_PWM_INPUT | HWMON_PWM_ENABLE | HWMON_PWM_FREQ,
> +			HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +			HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info adt7470_chip_info = {
> +	.ops = &adt7470_hwmon_ops,
> +	.info = adt7470_info,
> +};
> +
>  /* Return 0 if detection is successful, -ENODEV otherwise */
>  static int adt7470_detect(struct i2c_client *client,
>  			  struct i2c_board_info *info)
> @@ -1391,9 +1280,9 @@ static int adt7470_probe(struct i2c_client *client)
>  		return err;
>  
>  	/* Register sysfs hooks */
> -	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
> -							   data,
> -							   adt7470_groups);
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
> +							 &adt7470_chip_info,
> +							 adt7470_groups);
>  
>  	if (IS_ERR(hwmon_dev))
>  		return PTR_ERR(hwmon_dev);
