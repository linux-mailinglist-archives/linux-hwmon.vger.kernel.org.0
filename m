Return-Path: <linux-hwmon+bounces-8953-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96BB14466
	for <lists+linux-hwmon@lfdr.de>; Tue, 29 Jul 2025 00:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B828E542710
	for <lists+linux-hwmon@lfdr.de>; Mon, 28 Jul 2025 22:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4F11F4606;
	Mon, 28 Jul 2025 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bwNg0tof"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7D21C84D6
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Jul 2025 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753741971; cv=none; b=qU4+L2nXXc8xebHGz/di5nWLz4dbSlPcbOsIfMpuuRo2TzAmpH3940Nm7Ak/q1q+0tii1XtVdcubrDUq7gmdmCssfvbog+HbuDQkeHnYTwC+2JqMVZSglHxuh8Y7dls62RBsj4s4YQjA/QEz+H28PqwP5jn0jLdVKq7jjeFgRCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753741971; c=relaxed/simple;
	bh=A3itqD7mrQt49/dt5eTuwM5hlP8L1dWMRjwBRMgXpBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQmeFNVf18oz6wpB+oX39V4uKUvjwMPuFUVhQ8Js8CZk98SDdayDkZHFyGF2D/9erEMF45pfCEaf5UhdswYVBmdiaVDCm8zStRtZKW/d28fQ77n/hKxJVtiRDLMhCl1VcW+Q9Pb+WgOsHEpoX5AIFjEwpt5XMyBEgf+u0xRX5cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bwNg0tof; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <099a8ce2-0837-4d79-8e58-8f7af0a0ff7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753741967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LzAaAOwjIui5WoR/K7PXp1E7V05vpixn8rzZnBVB/SA=;
	b=bwNg0tofE65/qvWJP/OhhmOG+3Kppo7Q9/DrlE+qhLcb+pSUzt75k5LlW3lN0N1cF1EYtF
	WS5YrQ4tNVfjh3w1ObiWNztZvjJu08OtwiVIECoC4TAplS98r6pi5g/JVAOSF0m2ieqBpJ
	kvnjd7i+O6p1spRfcCb4yU1g6lXJdug=
Date: Mon, 28 Jul 2025 18:32:43 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] hwmon: iio: Add min/max support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-iio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, linux-kernel@vger.kernel.org,
 David Lechner <dlechner@baylibre.com>
References: <20250715012023.2050178-1-sean.anderson@linux.dev>
 <20250715012023.2050178-7-sean.anderson@linux.dev>
 <20250727173542.46680071@jic23-huawei>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250727173542.46680071@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/27/25 12:35, Jonathan Cameron wrote:
> On Mon, 14 Jul 2025 21:20:22 -0400
> Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> Add support for minimum/maximum attributes. Like the _input attribute,
>> we just need to call into the IIO API.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> 
> Similar comments to previous. I'm not keen on the blend of allocation of
> attributes and registration.  If we can break that link I think it will give
> cleaner code.
>
>>  static int add_device_attr(struct device *dev, struct iio_hwmon_state *st,
>>  			   ssize_t (*show)(struct device *dev,
>>  					   struct device_attribute *attr,
>> @@ -123,6 +171,40 @@ static int add_device_attr(struct device *dev, struct iio_hwmon_state *st,
>>  	return 0;
>>  }
>>  
>> +static int add_event_attr(struct device *dev, struct iio_hwmon_state *st,
>> +			  int i, enum iio_event_direction dir,
>> +			  const char *fmt, ...)
>> +{
>> +	struct sensor_device_attribute_2 *a;
>> +	umode_t mode;
>> +	va_list ap;
>> +
>> +	mode = iio_event_mode(&st->channels[i], IIO_EV_TYPE_THRESH, dir,
>> +			      IIO_EV_INFO_VALUE);
>> +	if (!mode)
>> +		return 0;
>> +
>> +	a = devm_kzalloc(dev, sizeof(*a), GFP_KERNEL);
>> +	if (!a)
>> +		return -ENOMEM;
>> +
>> +	sysfs_attr_init(&a->dev_attr.attr);
>> +	va_start(ap, fmt);
>> +	a->dev_attr.attr.name = devm_kvasprintf(dev, GFP_KERNEL, fmt, ap);
>> +	va_end(ap);
>> +	if (!a->dev_attr.attr.name)
>> +		return -ENOMEM;
>> +
>> +	a->dev_attr.show = iio_hwmon_read_event;
>> +	a->dev_attr.store = iio_hwmon_write_event;
>> +	a->dev_attr.attr.mode = mode;
>> +	a->index = i;
>> +	a->nr = dir;
>> +
>> +	st->attrs[st->num_attrs++] = &a->dev_attr.attr;
> similar comment to the previous, though here I think we'd
> need to pass in the channel to an iio_hwmon_alloc_event_attr() as ideally we'd
> not be messing with st at all in here.  So maybe it doesn't work out.

Well, I used to have

+               if (iio_read_channel_label(&st->channels[i], buf) >= 0) {
+                       st->attrs[attr] = create_attr(dev, iio_hwmon_read_label,
+                                                     NULL, 0444, i, 0, 0, 0,
+                                                     "%s%d_label", prefix, n);
+                       if (!st->attrs[attr++])
+                               return -ENOMEM;
+               }

but even with a shorter function name, all the parameters are starting
to get bunched up on the right side. And if we make it longer as you
propose it starts looking like


+               if (iio_read_channel_label(&st->channels[i], buf) >= 0) {
+                       st->attrs[attr] =
+                               iio_hwmon_create_device_attr(dev,
+                                                            iio_hwmon_read_label,
+                                                            NULL, 0444, i, 0, 0,
+                                                            0, "%s%d_label",
+                                                            prefix, n);
+                       if (!st->attrs[attr++])
+                               return -ENOMEM;
+               }

which is IMO really terrible-looking.

Maybe we should just stick everything in an xarray and linearize it at
the end of probe...

--Sean

