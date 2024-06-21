Return-Path: <linux-hwmon+bounces-2753-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9168B9129A2
	for <lists+linux-hwmon@lfdr.de>; Fri, 21 Jun 2024 17:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13A33B2516B
	for <lists+linux-hwmon@lfdr.de>; Fri, 21 Jun 2024 15:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA98664C6;
	Fri, 21 Jun 2024 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AJoVrlRB"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CB55C3E
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Jun 2024 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983366; cv=none; b=k/ZbnUoTHrk+4/o4/h5ZIaWrm4uwp6frDn6yOH+zGRJRpj0Wc+DUhgqj0IXg56UVuiutHA12ueGFZeFQEKcFvRUjjNbZwlBYVSZloffbRruslYBmnDiehrAt3y8pzLuu9Ah0gYUjmRgUa0u51mbH/WN+gRhvxC6IAgTdPPiesHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983366; c=relaxed/simple;
	bh=gzQEX5tQ5Du16/4LAjJEnYJx4Gc+yE5OCEuO4ng/t9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHCepwdHqc+1yQDUNEtH9NEGHNvvsTjPDVVc73i7AaYl1sKwgxOmLbnj6Pf9oqsqyZE/bh9XJgnAt3XYCznzL8px+zGST0tx/+DhZ0iOEy4wB50NrNHSIIQDWT6wxG6L1p5Myvx+0DtMvFtxVnng1eCh6l0+sJPFbHk5OMrk2GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AJoVrlRB; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux@roeck-us.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1718983361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CFnXEzQV3Qc/B9H3rZ93Sy5QZLgRiFgAQG++E7wW6k=;
	b=AJoVrlRBcHQJqY+q0AJFrbX3KI4Y64uzhyuEgszaFtuBjIesoi86n//jGv39xF6G0HH/b7
	CfXb4BzveK4xdHWM2bwL1IPBEkUmEBbyLxRZdmFsXwqACOA5qHRz0LSuo2yNcoRWD+m+xp
	WA6qM6Mq9KQVBP8ixf8IK0SdpOYxhyk=
X-Envelope-To: jic23@kernel.org
X-Envelope-To: jdelvare@suse.com
X-Envelope-To: linux-iio@vger.kernel.org
X-Envelope-To: linux-hwmon@vger.kernel.org
X-Envelope-To: lars@metafoo.de
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <55dbe61b-c2df-4eeb-80ac-cc2c83e9cdd3@linux.dev>
Date: Fri, 21 Jun 2024 11:22:37 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] hwmon: iio: Add labels from IIO channels
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, linux-iio@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org
References: <20240620211310.820579-1-sean.anderson@linux.dev>
 <20240620211310.820579-3-sean.anderson@linux.dev>
 <0c74406c-291d-4b0f-935e-989fb2f870ce@roeck-us.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <0c74406c-291d-4b0f-935e-989fb2f870ce@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/21/24 11:08, Guenter Roeck wrote:
> On 6/20/24 14:13, Sean Anderson wrote:
>> Add labels from IIO channels to our channels. This allows userspace to
>> display more meaningful names instead of "in0" or "temp5".
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>>   drivers/hwmon/iio_hwmon.c | 33 ++++++++++++++++++++++++++++++---
>>   1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
>> index 4c8a80847891..588b64c18e63 100644
>> --- a/drivers/hwmon/iio_hwmon.c
>> +++ b/drivers/hwmon/iio_hwmon.c
>> @@ -33,6 +33,17 @@ struct iio_hwmon_state {
>>       struct attribute **attrs;
>>   };
>>   +static ssize_t iio_hwmon_read_label(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  char *buf)
>> +{
>> +    struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>> +    struct iio_hwmon_state *state = dev_get_drvdata(dev);
>> +    struct iio_channel *chan = &state->channels[sattr->index];
>> +
>> +    return iio_read_channel_label(chan, buf);
> 
> This can return -EINVAL if there is no label. Since the label attribute
> is created unconditionally, every affected system would end up with
> lots of error messages when running the "sensors" command.
> This is not acceptable.

The sensors command gracefully handles this. There are no errors, and the label is unused.

--Sean


