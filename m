Return-Path: <linux-hwmon+bounces-11589-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCBjLW6ghGmI3wMAu9opvQ
	(envelope-from <linux-hwmon+bounces-11589-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 05 Feb 2026 14:51:42 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FBAF3901
	for <lists+linux-hwmon@lfdr.de>; Thu, 05 Feb 2026 14:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E168C300BD82
	for <lists+linux-hwmon@lfdr.de>; Thu,  5 Feb 2026 13:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D323D3CFA;
	Thu,  5 Feb 2026 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqXOijHn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB163382F7
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299181; cv=none; b=KTQZ0OKRyP4flRo5K56VsU/AjC0r0AcyqXg8s4myTQRts7MruQ3iBdsH1zTKWK/MvX51KPfwumY4zhEBf/NexKEY8dJVAfLHZxxhmBsgUf2gnvjevvo+8dQkAn3MaWfVLKAuaUkz2lV0FTMWQLuSfeF4ZnTAlxfgcPk8wKIyHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299181; c=relaxed/simple;
	bh=l1bejRBRLY+E0zgxMm8aWgHFVVyo8u7BYlnJTLwNLac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YphehEbf9ClPy9/7KTI1FKRNTxd6u15greUHljmD44icSIwqbtHqsILHXpCPrpt0N4FcG5b76/wGkP4h9EB7C7oL77MOLSu+8t1cFhThnjQ+7w4RhzP4SPj8GSEiAs3ocj/orHKg5o6rL4X0qX4ky4w95FaXw3HZ3knVE+KbSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqXOijHn; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a929245b6aso9155525ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770299180; x=1770903980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNJhfXMPSL9iFWz6R60RceCWsjhIvrWwTqzQWCvi4LI=;
        b=NqXOijHnwtWGko0FsmvqBGsVenVS+HJo3muYt+bsTWoaW4b2eZR1Ra/Oy1sroobZl7
         vku/gj11nJtsdL3sO2ODyOH1/k5W0tV0kRs5ToE0kHLyr+rs8a3kQ35+2cEe1P86qELj
         gvK15x719Ue3tjSG+WfN9u2XC6JFpA+8rdAsGuTXqZqtoXa7Uus/r0GjkEknFbrO76Cy
         GAuat3jOGNye+/w8Gy5vUFR24k+v3Z89bbZh+DXAy0fWr7zr8nHso90iyLMTXGKEWxcr
         6aadvHKViMYmHnUSApQF2Art+IP60k/0b8EhXanDajxV5+4Hj5+Xpk1H6C43Nzi/U9eA
         gxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299180; x=1770903980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNJhfXMPSL9iFWz6R60RceCWsjhIvrWwTqzQWCvi4LI=;
        b=kQHPfFhSCKmGsuAcZVWaLxOPhb8ii4ywwjATl9zs3+RGCbF2EIz6u2U+o7AiOwR7nn
         lLmG0Huzn23B547BNTxK7/mcunjQOcWPHJeS6i35hZm6tXHiwQICijYEMD9RPblhq8oj
         nmLY074r/eXC5dcHiv9beZu1XkP978nGSBMuGMI+MIoUQe20BWGGR41s2bT8WNZcLFEE
         iKDqeqOeFMmMqbZCtDrAVbNLU6FyDE/dJQIxT9G0st4eLdBZ3XnujYJEX8ZjvXdjxPsW
         GzDpNxSAkXTJq+HkR3d3DVTH1lf9BO/5j4Ft+V17LW6QrYcWWeJMb6rbbzHyh5pKhmGd
         qz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5Sd6V3ExyhGgfsj2fuUipVozeR1Avdb6OsAotqgi5IdVxPjAtSXL0pM47JLaM6A2DvK0edgGZtIJQSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbte5715q+VmifE24cdmsU1yA0q353p6GpYHxmqa9gL1QEyPL
	+BeARD3t5enOEiRIvRHJRrOgXJcGIsqZ782XYyG6zJ94OvTuQT2iB4VU
X-Gm-Gg: AZuq6aKmCjfhBif5DajtWi2L24A68JnUqe0t/lWA2OAwf1hNwcZCILNoAND7h3+S8uO
	hfBuBUOBNmIiRDDDu9cXLopPNALI5pP9isbIUPj9++cGcI1xWBPLYPrrTySG2c3AhKoMie7CQqB
	OZEyDhif2EUuNjBqcD6o4+tHfdDhPxxVIZl28zdVp8cr9QCDvVtdwzcdt7ZQpoel/cqDyS68fyP
	kHHGXxzhCUSwbuHGQRLdrTV20la/r7c8RsWKbg0/I2+utHP0iyUkEec+RxHXYgLmf8GbF8d723J
	d2nkrwFsgOJlLeJUCR6sPm/iZaTKoYNRbyYKzhfWzlaI58uJd3WrzdbUQar5VtUN9PTOFbjRqF8
	lydx8kdvai2YfVLRlPuOq+vaJyqCWl/uJrxQYS5T569641oWGS1FMpt+yUn/Qj7hkDjT0HWEkPr
	xo2T+cUFrwaxcnwATwTccwjyn0xaw1CLAK9sE=
X-Received: by 2002:a17:903:1c2:b0:2a9:43b0:edd9 with SMTP id d9443c01a7336-2a943b0f3d6mr22736135ad.60.1770299180084;
        Thu, 05 Feb 2026 05:46:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93396747esm52048515ad.80.2026.02.05.05.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:46:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 05:46:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: spd5118: Fail probe if SPD writes are disabled
Message-ID: <6cd7920b-165d-43e4-9c60-aae9492bc814@roeck-us.net>
References: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
 <20260205102942.28745-3-tinsaetadesse2015@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205102942.28745-3-tinsaetadesse2015@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11589-lists,linux-hwmon=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40FBAF3901
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 01:29:25PM +0300, Tinsae Tadesse wrote:
> SPD5118 requires write access for page selection, configuration,
> and cache synchronization during suspend/resume. If the host
> controller does not allow SPD writes, the driver cannot function
> properly.
> 
> Detect this state using adapter quirks and determine whether to
> stop the probe.
> 
> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
> ---
>  drivers/hwmon/spd5118.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 5da44571b6a0..094d05472562 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -525,6 +525,8 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
>  	unsigned int capability, revision, vendor, bank;
>  	struct spd5118_data *data;
>  	struct device *hwmon_dev;
> +	struct i2c_client *client;
> +	const struct i2c_adapter_quirks *quirks;
>  	int err;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -552,6 +554,19 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
>  	if (!spd5118_vendor_valid(bank, vendor))
>  		return -ENODEV;
>  
> +	/*
> +	 * SPD5118 requires write access for correct operation
> +	 * (page selection, configuration, and suspend/resume cache sync).
> +	 * If the SPD writes are blocked by the SMBus controller, the
> +	 * probe fails.
> +	 */
> +	client = to_i2c_client(dev);
> +	quirks = client->adapter->quirks;
> +	if (quirks && (quirks->flags & I2C_AQ_SPD_WRITE_DISABLED)) {
> +		dev_err_probe(dev, -ENODEV, "SPD Write Disable is set on adapter; refusing probe\n");
> +		return -ENODEV;

		return dev_err_probe(...);

> +	}
> +
>  	data->regmap = regmap;
>  	mutex_init(&data->nvmem_lock);
>  	dev_set_drvdata(dev, data);
> -- 
> 2.52.0
> 

