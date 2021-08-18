Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751853EF883
	for <lists+linux-hwmon@lfdr.de>; Wed, 18 Aug 2021 05:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbhHRD10 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 17 Aug 2021 23:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbhHRD1X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Aug 2021 23:27:23 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2087C061764
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Aug 2021 20:26:49 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w6so2470027oiv.11
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Aug 2021 20:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LBWmsawcNwj9qzivs5gBabwJEmrBhDRAatb40ngvfew=;
        b=Gp85fp0wXpZ93G8oKXiwtRsj63Ci42CvevFPr60Ut0jZURMdGPvm2A7FIU47A2rHk1
         zAQrInLT9B2hZm22Xgl84KYPXX1rkOnCMjMULxX57eVIZAujmNUeuDykdYoFEngsWOhN
         Fup2Gq6snN4V3rnuIx6XosavklHa4VTC3h+wockFJXXBpwlmM2oICIpJ7+O51kLeVIAt
         TX6RZVN/A3vU56f84abbvQWNcY1WjUIJf3Q/VtS4Bm6ZCVpWHEp/ls1iiOtu44cffA1S
         yV27y63+Tc5MM/8jDTL2E5NNiIhL27PT/PWae6hCcZRLo7n8+l52wsTwoTY3+cOya4C8
         HEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LBWmsawcNwj9qzivs5gBabwJEmrBhDRAatb40ngvfew=;
        b=p27Nd1YuKcVtc4dt6etvQ07sA+GyiNpGxz5KoWgsRnx58ygwJB64qFqQwB5xpxCZHT
         tfQ7IQEhfIj2lsthvnX9OMDP6QADMccyLpVKoVoyMiuZ8Trej24Zy6IVuG/5K/h/SMHB
         DHnoK4VWRcieJNEHYsNbWjfNG667N69e9er4qkldCBSQ1/4gFkym6jRfiWmQDa+9wqUj
         iwaBXJP0W2SlsiR/YSkh56BNzQxJvzCx7t3kLt97Z5dRlP/RPQ1DQCIYJgY/XkvwpsXH
         kxcE41uF3yW52c4erVABavhbapsCL93cAEAKWyJJ/v/rFvpv7VeXKdvrxdfeZomoFWFn
         X3fg==
X-Gm-Message-State: AOAM531PFPjSji07cX2hFxcs9Ql1bOQITNckD1OrFGxBRnds8LvnAhgD
        JMaZ+7rmDWaIHpSGfZoLJiykDHEEmsg=
X-Google-Smtp-Source: ABdhPJxYfegi2y3HM3TCGTcZm3osexYiJDCcgQvpbLk8wfBjaeI9LyeeoSwlCsjmrEYD5Py1ASzQQA==
X-Received: by 2002:aca:eb0f:: with SMTP id j15mr5167013oih.7.1629257209117;
        Tue, 17 Aug 2021 20:26:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v77sm669792oie.5.2021.08.17.20.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 20:26:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Robert Hancock <robert.hancock@calian.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org
References: <20210816203547.257403-1-robert.hancock@calian.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (adt7470) Add support for PWM inversion
Message-ID: <9e79f343-c81d-9c0c-621c-00f9ee030cf0@roeck-us.net>
Date:   Tue, 17 Aug 2021 20:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816203547.257403-1-robert.hancock@calian.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/16/21 1:35 PM, Robert Hancock wrote:
> Add sysfs attributes to control whether the PWM output signal from the
> device is inverted (i.e. active-low rather than active-high).
> 

We would normally call that "polarity".

Anyway, what is the use case ? The pwm polarity is not a fan property but
a system property. While many of the hwmon sysfs attributes describe system
properties, that is for the most part a leftover from times when PCs
did not provide the necessary information, and it was necessary to
configure hwmon devices from userspace.

Nowadays, system properties are typically provided with devicetree
properties or with the ACPI equivalent. A good example is the driver
for adt7575. Would that solve your problem ?

Thanks,
Guenter

> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>   Documentation/hwmon/adt7470.rst |  5 ++-
>   drivers/hwmon/adt7470.c         | 72 ++++++++++++++++++++++++++++++++-
>   2 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/adt7470.rst b/Documentation/hwmon/adt7470.rst
> index d225f816e992..8293f93d6cd5 100644
> --- a/Documentation/hwmon/adt7470.rst
> +++ b/Documentation/hwmon/adt7470.rst
> @@ -69,7 +69,10 @@ from 0 (off) to 255 (full speed).  Fan speed will be set to maximum when the
>   temperature sensor associated with the PWM control exceeds
>   pwm#_auto_point2_temp.
>   
> -The driver also allows control of the PWM frequency:
> +The driver also allows control of the PWM inversion and frequency:
> +
> +* pwm#_invert: Controls whether the PWM output signal is inverted
> +  (i.e. low when active rather than high).
>   
>   * pwm1_freq
>   
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 2e8feacccf84..f0863a6e1560 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -61,10 +61,14 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
>   #define ADT7470_REG_FAN_MAX_MAX_ADDR		0x67
>   #define ADT7470_REG_PWM_CFG_BASE_ADDR		0x68
>   #define ADT7470_REG_PWM12_CFG			0x68
> +#define		ADT7470_PWM2_INVERT_MASK	0x10
> +#define		ADT7470_PWM1_INVERT_MASK	0x20
>   #define		ADT7470_PWM2_AUTO_MASK		0x40
>   #define		ADT7470_PWM1_AUTO_MASK		0x80
>   #define		ADT7470_PWM_AUTO_MASK		0xC0
>   #define ADT7470_REG_PWM34_CFG			0x69
> +#define		ADT7470_PWM4_INVERT_MASK	0x10
> +#define		ADT7470_PWM3_INVERT_MASK	0x20
>   #define		ADT7470_PWM3_AUTO_MASK		0x40
>   #define		ADT7470_PWM4_AUTO_MASK		0x80
>   #define	ADT7470_REG_PWM_MIN_BASE_ADDR		0x6A
> @@ -162,6 +166,7 @@ struct adt7470_data {
>   	u8			pwm_min[ADT7470_PWM_COUNT];
>   	s8			pwm_tmin[ADT7470_PWM_COUNT];
>   	u8			pwm_auto_temp[ADT7470_PWM_COUNT];
> +	u8			pwm_invert[ADT7470_PWM_COUNT];
>   
>   	struct task_struct	*auto_update;
>   	unsigned int		auto_update_interval;
> @@ -300,11 +305,22 @@ static int adt7470_update_sensors(struct adt7470_data *data)
>   			reg_mask = ADT7470_PWM1_AUTO_MASK;
>   
>   		reg = ADT7470_REG_PWM_CFG(i);
> -		if (i2c_smbus_read_byte_data(client, reg) & reg_mask)
> +		cfg = i2c_smbus_read_byte_data(client, reg);
> +		if (cfg & reg_mask)
>   			data->pwm_automatic[i] = 1;
>   		else
>   			data->pwm_automatic[i] = 0;
>   
> +		if (i % 2)
> +			reg_mask = ADT7470_PWM2_INVERT_MASK;
> +		else
> +			reg_mask = ADT7470_PWM1_INVERT_MASK;
> +
> +		if (cfg & reg_mask)
> +			data->pwm_invert[i] = 1;
> +		else
> +			data->pwm_invert[i] = 0;
> +
>   		reg = ADT7470_REG_PWM_AUTO_TEMP(i);
>   		cfg = i2c_smbus_read_byte_data(client, reg);
>   		if (!(i % 2))
> @@ -935,6 +951,51 @@ static ssize_t pwm_tmin_store(struct device *dev,
>   	return count;
>   }
>   
> +static ssize_t pwm_invert_show(struct device *dev,
> +			       struct device_attribute *devattr, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct adt7470_data *data = adt7470_update_device(dev);
> +
> +	return sprintf(buf, "%d\n", (int)data->pwm_invert[attr->index]);
> +}
> +
> +static ssize_t pwm_invert_store(struct device *dev,
> +				struct device_attribute *devattr,
> +				const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> +	struct adt7470_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	int pwm_invert_reg = ADT7470_REG_PWM_CFG(attr->index);
> +	int pwm_invert_reg_mask;
> +	long temp;
> +	u8 reg;
> +
> +	if (kstrtol(buf, 10, &temp))
> +		return -EINVAL;
> +
> +	if (attr->index % 2)
> +		pwm_invert_reg_mask = ADT7470_PWM2_INVERT_MASK;
> +	else
> +		pwm_invert_reg_mask = ADT7470_PWM1_INVERT_MASK;
> +
> +	if (temp != 1 && temp != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +	data->pwm_invert[attr->index] = temp;
> +	reg = i2c_smbus_read_byte_data(client, pwm_invert_reg);
> +	if (temp)
> +		reg |= pwm_invert_reg_mask;
> +	else
> +		reg &= ~pwm_invert_reg_mask;
> +	i2c_smbus_write_byte_data(client, pwm_invert_reg, reg);
> +	mutex_unlock(&data->lock);
> +
> +	return count;
> +}
> +
>   static ssize_t pwm_auto_show(struct device *dev,
>   			     struct device_attribute *devattr, char *buf)
>   {
> @@ -1135,6 +1196,11 @@ static SENSOR_DEVICE_ATTR_RW(pwm4, pwm, 3);
>   
>   static DEVICE_ATTR_RW(pwm1_freq);
>   
> +static SENSOR_DEVICE_ATTR_RW(pwm1_invert, pwm_invert, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2_invert, pwm_invert, 1);
> +static SENSOR_DEVICE_ATTR_RW(pwm3_invert, pwm_invert, 2);
> +static SENSOR_DEVICE_ATTR_RW(pwm4_invert, pwm_invert, 3);
> +
>   static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_pwm, pwm_min, 0);
>   static SENSOR_DEVICE_ATTR_RW(pwm2_auto_point1_pwm, pwm_min, 1);
>   static SENSOR_DEVICE_ATTR_RW(pwm3_auto_point1_pwm, pwm_min, 2);
> @@ -1231,6 +1297,10 @@ static struct attribute *adt7470_attrs[] = {
>   	&sensor_dev_attr_pwm2.dev_attr.attr,
>   	&sensor_dev_attr_pwm3.dev_attr.attr,
>   	&sensor_dev_attr_pwm4.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_invert.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_invert.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_invert.dev_attr.attr,
> +	&sensor_dev_attr_pwm4_invert.dev_attr.attr,
>   	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>   	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>   	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> 

