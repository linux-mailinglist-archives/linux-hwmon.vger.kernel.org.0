Return-Path: <linux-hwmon+bounces-272-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A25800215
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 04:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D613CB20F70
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 03:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C216217F7;
	Fri,  1 Dec 2023 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXMZe047"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36D31717;
	Thu, 30 Nov 2023 19:26:34 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d83ff72dbbso47785a34.1;
        Thu, 30 Nov 2023 19:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701401194; x=1702005994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fvebJ5QToydTLWgRyxHFD+Ru+EdCC8PFScYOP2fmWDk=;
        b=MXMZe047HX0MGLmuuuvZc8cl0jVRZc2JJnoVdncQ0YLOAgnIzDtiDwwBHzFUij45Do
         Vu7eXAYWRYNHQpslfko+5onC+7HnReBTfeI8RxY23h6vUchNTpXe30eFb6Zk3d/pevvN
         uIDFI9hsDhOMl06s0ci2eDrYKKbtYJIDSEjeA5Y0FBadnx3ZcPb1HWSSZkThmhob0DOk
         Ezr5RjKi11v1e1hPDk9maoDKv8Zm23H4BvBqIJHVNQsoLXvCyEHgnPj45ldBEmJPe6Yp
         sARaYOY7Gpga41q0assB9sk9lkxSLxrzM+H6xA2NWPwXWhD2Ih61JUHI8lxDqAm8x/SX
         SaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701401194; x=1702005994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvebJ5QToydTLWgRyxHFD+Ru+EdCC8PFScYOP2fmWDk=;
        b=iftv3Q3FV+rrlj74KhTTcg72Us75gwRpVGhbdxhHGvtwBYIIOhXxNJvNGJkXAMham3
         T+ud6kBkvolkC3tKnaapoiPxu7touIwcYel2supf69yabQVrKN04jN3Xn1bVvlR4GgNt
         u8BXG65BILJ/jZ+QcNAI5pN4FgJTk540PsbG935fDrQPpWYnWneqm4P0eRpsShOrMgHN
         EVfPg2J2s5ivHIton3dvRBk+78O6ou2qZrp9y3M8+ZSocOvS71ZZ+RdLaqmAyRLKCG5C
         DBdPaROCheN7GJGazLQmmX0YmudFoxTRYHfiOG/YRag2e4W6a/SfMBJEpnJpN4oAXXIw
         Wvig==
X-Gm-Message-State: AOJu0YyC91m7Z5YhaHaxne98UfbfkWXqg0U7xry/arm09AKFg2vUCl5X
	hJHhToFLumojtDV3yWP4j/jGIsMH6EI=
X-Google-Smtp-Source: AGHT+IGoiHWETNrJC4inT/fCcLG731oG4jHY1kIHTzXuRgu9IJjEi+I4o8dbdLI7LwVEVp+iWbr44A==
X-Received: by 2002:a9d:630e:0:b0:6c4:56b4:e91c with SMTP id q14-20020a9d630e000000b006c456b4e91cmr895317otk.7.1701401194098;
        Thu, 30 Nov 2023 19:26:34 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u12-20020a056830118c00b006ce2db9e6c4sm363220otq.36.2023.11.30.19.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 19:26:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4723259-92a1-4c9a-8f4a-52b4b61940c5@roeck-us.net>
Date: Thu, 30 Nov 2023 19:26:31 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (coretemp) Remove unnecessary dependency of
 array index
Content-Language: en-US
To: Ashok Raj <ashok_raj@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>
Cc: jdelvare@suse.com, fenghua.yu@intel.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@intel.com>
References: <20231127131651.476795-1-rui.zhang@intel.com>
 <20231127131651.476795-3-rui.zhang@intel.com>
 <ZWk2ZAxuyOFDCTmv@araj-dh-work.jf.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZWk2ZAxuyOFDCTmv@araj-dh-work.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/23 17:27, Ashok Raj wrote:
> On Mon, Nov 27, 2023 at 09:16:50PM +0800, Zhang Rui wrote:
>> When sensor_device_attribute pointer is available, use container_of() to
>> get the temp_data address.
>>
>> This removes the unnecessary dependency of cached index in
>> pdata->core_data[].
>>
>> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
>> ---
>>   drivers/hwmon/coretemp.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
>> index 6053ed3761c2..cef43fedbd58 100644
>> --- a/drivers/hwmon/coretemp.c
>> +++ b/drivers/hwmon/coretemp.c
>> @@ -342,7 +342,7 @@ static ssize_t show_label(struct device *dev,
>>   {
>>   	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>>   	struct platform_data *pdata = dev_get_drvdata(dev);
>> -	struct temp_data *tdata = pdata->core_data[attr->index];
>> +	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_LABEL]);
>>   
>>   	if (tdata->is_pkg_data)
>>   		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
>> @@ -355,8 +355,7 @@ static ssize_t show_crit_alarm(struct device *dev,
>>   {
>>   	u32 eax, edx;
>>   	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> -	struct platform_data *pdata = dev_get_drvdata(dev);
>> -	struct temp_data *tdata = pdata->core_data[attr->index];
>> +	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_CRIT_ALARM]);
>>   
>>   	mutex_lock(&tdata->update_lock);
>>   	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
>> @@ -369,8 +368,7 @@ static ssize_t show_tjmax(struct device *dev,
>>   			struct device_attribute *devattr, char *buf)
>>   {
>>   	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> -	struct platform_data *pdata = dev_get_drvdata(dev);
>> -	struct temp_data *tdata = pdata->core_data[attr->index];
>> +	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_TJMAX]);
>>   	int tjmax;
>>   
>>   	mutex_lock(&tdata->update_lock);
>> @@ -384,8 +382,7 @@ static ssize_t show_ttarget(struct device *dev,
>>   				struct device_attribute *devattr, char *buf)
>>   {
>>   	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> -	struct platform_data *pdata = dev_get_drvdata(dev);
>> -	struct temp_data *tdata = pdata->core_data[attr->index];
>> +	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_TTARGET]);
>>   	int ttarget;
>>   
>>   	mutex_lock(&tdata->update_lock);
>> @@ -402,8 +399,7 @@ static ssize_t show_temp(struct device *dev,
>>   {
>>   	u32 eax, edx;
>>   	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>> -	struct platform_data *pdata = dev_get_drvdata(dev);
>> -	struct temp_data *tdata = pdata->core_data[attr->index];
>> +	struct temp_data *tdata = container_of(attr, struct temp_data, sd_attrs[ATTR_TEMP]);
>>   	int tjmax;
>>   
>>   	mutex_lock(&tdata->update_lock);
>> @@ -445,7 +441,6 @@ static int create_core_attrs(struct temp_data *tdata, struct device *dev,
>>   		tdata->sd_attrs[i].dev_attr.attr.name = tdata->attr_name[i];
>>   		tdata->sd_attrs[i].dev_attr.attr.mode = 0444;
>>   		tdata->sd_attrs[i].dev_attr.show = rd_ptr[i];
>> -		tdata->sd_attrs[i].index = attr_no;
> 
> I was naively thinking if we could nuke that "index". I can see that used
> in couple macros, but seems like we can lose it?
> 
> Completely untested.. and uncertain :-)
> 

If you had suggested to replace
	struct sensor_device_attribute sd_attrs[TOTAL_ATTRS];
with
	struct device_attribute sd_attrs[TOTAL_ATTRS];
what you suggested may actually be possible and make sense. However,
suggesting to dump the index parameter of SENSOR_ATTR() completely
because _this_ driver may no longer need it seems to be a little excessive.

> 
> diff --git a/include/linux/hwmon-sysfs.h b/include/linux/hwmon-sysfs.h
> index d896713359cd..4855893f9401 100644
> --- a/include/linux/hwmon-sysfs.h
> +++ b/include/linux/hwmon-sysfs.h
> @@ -12,36 +12,35 @@
>   
>   struct sensor_device_attribute{
>   	struct device_attribute dev_attr;
> -	int index;
>   };
>   #define to_sensor_dev_attr(_dev_attr) \
>   	container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
>   
> -#define SENSOR_ATTR(_name, _mode, _show, _store, _index)	\
> +#define SENSOR_ATTR(_name, _mode, _show, _store)	\
>   	{ .dev_attr = __ATTR(_name, _mode, _show, _store),	\
> -	  .index = _index }
> +	  }
>   
> -#define SENSOR_ATTR_RO(_name, _func, _index)			\
> +#define SENSOR_ATTR_RO(_name, _func)			\
>   	SENSOR_ATTR(_name, 0444, _func##_show, NULL, _index)
>   
> -#define SENSOR_ATTR_RW(_name, _func, _index)			\
> -	SENSOR_ATTR(_name, 0644, _func##_show, _func##_store, _index)
> +#define SENSOR_ATTR_RW(_name, _func)			\
> +	SENSOR_ATTR(_name, 0644, _func##_show, _func##_store)
>   
> -#define SENSOR_ATTR_WO(_name, _func, _index)			\
> -	SENSOR_ATTR(_name, 0200, NULL, _func##_store, _index)
> +#define SENSOR_ATTR_WO(_name, _func)			\
> +	SENSOR_ATTR(_name, 0200, NULL, _func##_store)
>   
> -#define SENSOR_DEVICE_ATTR(_name, _mode, _show, _store, _index)	\
> +#define SENSOR_DEVICE_ATTR(_name, _mode, _show, _store)	\
>   struct sensor_device_attribute sensor_dev_attr_##_name		\
> -	= SENSOR_ATTR(_name, _mode, _show, _store, _index)
> +	= SENSOR_ATTR(_name, _mode, _show, _store)
>   
> -#define SENSOR_DEVICE_ATTR_RO(_name, _func, _index)		\
> -	SENSOR_DEVICE_ATTR(_name, 0444, _func##_show, NULL, _index)
> +#define SENSOR_DEVICE_ATTR_RO(_name, _func)		\
> +	SENSOR_DEVICE_ATTR(_name, 0444, _func##_show, NULL)
>   
>   #define SENSOR_DEVICE_ATTR_RW(_name, _func, _index)		\
> -	SENSOR_DEVICE_ATTR(_name, 0644, _func##_show, _func##_store, _index)
> +	SENSOR_DEVICE_ATTR(_name, 0644, _func##_show, _func##_store)
>   
> -#define SENSOR_DEVICE_ATTR_WO(_name, _func, _index)		\
> -	SENSOR_DEVICE_ATTR(_name, 0200, NULL, _func##_store, _index)
> +#define SENSOR_DEVICE_ATTR_WO(_name, _func)		\
> +	SENSOR_DEVICE_ATTR(_name, 0200, NULL, _func##_store)
>   
>   struct sensor_device_attribute_2 {
>   	struct device_attribute dev_attr;
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 975da8e7f2a9..c3bbf2f7d6eb 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -239,7 +239,7 @@ hwm_power1_max_interval_store(struct device *dev,
>   
>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>   			  hwm_power1_max_interval_show,
> -			  hwm_power1_max_interval_store, 0);
> +			  hwm_power1_max_interval_store);
>   

That driver could and should have used DEVICE_ATTR() instead of
SENSOR_DEVICE_ATTR(), and there are various other drivers where
that would have made sense. Actually, it should have used
DEVICE_ATTR_RW() but that is just a detail.

However, there are more than 2,000 uses of SENSOR_DEVICE_ATTR() and derived
macros in the kernel. The large majority of those do set index to values != 0,
and the affected drivers would not be happy if that argument disappeared.

Frankly, I am not entirely sure if you were serious with your suggestion.
I tried to give a serious reply, but I am not entirely sure if I succeeded.
My apologies if some sarcasm was bleeding through.

Guenter


