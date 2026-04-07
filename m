Return-Path: <linux-hwmon+bounces-13120-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIhKIo9a1Wmu4wcAu9opvQ
	(envelope-from <linux-hwmon+bounces-13120-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 07 Apr 2026 21:27:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 065673B3896
	for <lists+linux-hwmon@lfdr.de>; Tue, 07 Apr 2026 21:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4A87311AC37
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 Apr 2026 19:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDA5377579;
	Tue,  7 Apr 2026 19:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNMomS95"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535D2359A89
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Apr 2026 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589713; cv=none; b=X/5TIXYt9wR8+S+V+0kbjvqJfTnMQ1AYyXttaFMdK1TdyEj/faGs/JHkynfV6QVID21EK5go3ortL++dfb/SO9yoqAuwTlLvEttE9tmRrpjRjddNu30XV6Eb09VsBbb/Aq0GGdNmnn0Cl/q8eU2aoufWvTJ6AyYuO1r8hGjmw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589713; c=relaxed/simple;
	bh=MKoE3h0DuYR0lgEIvM6gIM01XUL/EcIa7FItQK0XwVc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQ8lEuJUftxOIX3cktvRvNTy/EoyzSHh3kXu6ogoXBjkdPI4uU1bT7GKbukJ7su35ogW+DfDoh2KQKlrPWf5BpxU+yLnHfcOSM2yWOupxRRjJNX+QRBBhjX8ooV+k2SZIAkBZNHbNQx6nhvHaGsgmGepdFbD0SDreDfOwNWGehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNMomS95; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b983bb07eso3152899f8f.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 12:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775589710; x=1776194510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTFUY1Kqg7irJGktxqz9kIPDduQ1qlHcsqGBW7GGikk=;
        b=pNMomS951hcgDieBfxDZMBBrZfWj31yTNhj1ZBSRMXs5AOxfeIp0FNSEltIl7xq6z/
         GYkqWg7TAINL1FXSK01WZgk1GtTSOF4dg1OiZGfE6+TjlVwmLsRJqaaAIHdUQMNy4Djq
         2ZPqRmpWz+qJOgxI9f+onxFPnXHmS0HCf/cFhoCxIurNSDsCEVgFSqYO2NUb4oLGlkOb
         yljSEcd5FHYSTcjr1NlbvCEUM3DOAwcuol7r+HxczNIN7NxF+XDvl/TY7Tcf6Ts9KZnz
         o7EGYCVR9oJYAYoqu1mA+rqhfk0gCjVt39CUVcsRvrDSr/XYVhcWadTCrOz8X3bSF7Vi
         8IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589710; x=1776194510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTFUY1Kqg7irJGktxqz9kIPDduQ1qlHcsqGBW7GGikk=;
        b=HfBIj002vy3B8TP/lx7V3ssxpF9JClxyKI6ZjQX7WEYuMddwlZzTa5Q1Bl9KZZPG2M
         fEFmcScBZo1XZeR9XmwpwrLrCIye4FIn3Pev1F8+kvUgKB4yXF5Sjhvj0dFaN0yF9t+v
         5EbjlzC1IoN0TVnKRTdajfmiu0zi0ncaokZ0DqlIOz4lhKP3ovOwgbd6pgPxEIuwGR7Y
         w1TvwVxgkM/JbXpnAoEptpwaXqahoh1Soj1C5cLLY3oQPSzhRYuILB1TDjIE4hxKSYJu
         QU/+/ZqDUiBpJdGwIXOuwAdl/6iw5lB4MCsKmQq72qMUix0cYvjVEmZmQYKxGc3QxciA
         JjRQ==
X-Gm-Message-State: AOJu0Yzgc6XO7syjsVS7q+7UGW9LLaPGnwruUHnu+QFX89yIDb+eVtBH
	N/MdgrROMNP6AFUbR/6v1jfVrUfXzluQ+EBU0d8//ApUt2XByXKg8wM9
X-Gm-Gg: AeBDieuyNGWPnYN+e5Iuo+n2n7qf8BTXZY0Bt/FdWldb87B20Fb4NuUzbLBWV+SLhEj
	ajfyZY8H2zZN5MuIcOaFL+HtVaBuwNNlzT8sjaM9WrXAavE1nlz/2WVPbIPsJG+4FgnsQ6IpTwi
	Tt23SvLHoDHCqIqJeWdeg1gYbXQDutbl2i7eBVHAiW49n81T01s+NAA+bQnF5G4xaCxNfByYgdY
	4FG6yVGTXUP8x7z/DYkzxNfkyISUf1QHi97dnZAC5C5gjEO3mwNTF2bGsYGr4MW3OP8lJOpVeuk
	nCEovaZMXXM7IjKl7isVZxyIU0JN4tpiasegCm8+FSStOQADS3zwqfQgCqWfnHpSHUIfOPI9tUN
	bd6AEDDSRg+nqOsdmmA0XahYGLyQYX2I9eYZVpPRst77Xoi+ceP462wxIUk2mB0Ge8ref/dz5Qh
	fgIHyqbhbowTMvgQuMDpmzThO9noJwvQ5i8kfyn+CwQy40lqnJC3TD4O/YTn4VTWQB+M3VogNV3
	HA=
X-Received: by 2002:a05:6000:2c01:b0:43c:f0c0:c571 with SMTP id ffacd0b85a97d-43d2930fee1mr27805566f8f.47.1775589709607;
        Tue, 07 Apr 2026 12:21:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e1c27sm49956069f8f.26.2026.04.07.12.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:21:49 -0700 (PDT)
Date: Tue, 7 Apr 2026 20:21:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "linux@weissschuh.net"
 <linux@weissschuh.net>, "cosmo.chou@quantatw.com"
 <cosmo.chou@quantatw.com>, "mail@carsten-spiess.de"
 <mail@carsten-spiess.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Sanman Pradhan <psanman@juniper.net>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] hwmon: (isl28022) Fix integer overflow in power
 calculation on 32-bit
Message-ID: <20260407202146.59b1476f@pumpkin>
In-Reply-To: <20260407173624.247803-3-sanman.pradhan@hpe.com>
References: <20260407173624.247803-1-sanman.pradhan@hpe.com>
	<20260407173624.247803-3-sanman.pradhan@hpe.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13120-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,juniper.net:email,hpe.com:email]
X-Rspamd-Queue-Id: 065673B3896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026 17:38:01 +0000
"Pradhan, Sanman" <sanman.pradhan@hpe.com> wrote:

> From: Sanman Pradhan <psanman@juniper.net>
> 
> isl28022_read_power() computes:
> 
>   *val = ((51200000L * ((long)data->gain)) /
>           (long)data->shunt) * (long)regval;
> 
> On 32-bit platforms, 'long' is 32 bits. With gain=8 and shunt=10000
> (the default configuration):
> 
>   (51200000 * 8) / 10000 = 40960
>   40960 * 65535 = 2,684,313,600
> 
> This exceeds LONG_MAX (2,147,483,647), resulting in signed integer
> overflow.
> 
> Additionally, dividing before multiplying by regval loses precision
> unnecessarily.
> 
> Use u64 intermediates with div_u64() and multiply before dividing
> to retain precision. Power is inherently non-negative, so unsigned
> types are the natural fit. Clamp the result to LONG_MAX before
> returning it through the hwmon callback, following the pattern used
> by ina238.
> 
> Fixes: 39671a14df4f2 ("hwmon: (isl28022) new driver for ISL28022 power monitor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v2:
>  - Switch from s64/div_s64() to u64/div_u64() since power is
>    inherently non-negative, avoiding implicit u32-to-s32 narrowing
>    of the shunt divisor

There is no such thing as u32-to-s32 narrowing.
Basically nothing happens to the bit pattern.
But the values are almost certainly never negative.

> 
>  drivers/hwmon/isl28022.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
> index c2e559dde63f..d233a7b3f327 100644
> --- a/drivers/hwmon/isl28022.c
> +++ b/drivers/hwmon/isl28022.c
> @@ -9,6 +9,7 @@
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/i2c.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  
> @@ -178,6 +179,7 @@ static int isl28022_read_power(struct device *dev, u32 attr, long *val)
>  	struct isl28022_data *data = dev_get_drvdata(dev);
>  	unsigned int regval;
>  	int err;
> +	u64 tmp;
>  
>  	switch (attr) {
>  	case hwmon_power_input:
> @@ -185,8 +187,9 @@ static int isl28022_read_power(struct device *dev, u32 attr, long *val)
>  				  ISL28022_REG_POWER, &regval);
>  		if (err < 0)
>  			return err;
> -		*val = ((51200000L * ((long)data->gain)) /
> -			(long)data->shunt) * (long)regval;
> +		tmp = (u64)51200000 * data->gain * regval;
> +		tmp = div_u64(tmp, data->shunt);
> +		*val = clamp_val(tmp, 0, LONG_MAX);

Don't use clamp_val(), you don't need to and it is completely
broken by design.
Just use min().
You could just write:
	*val = min(div_u64(51200000ULL * data->gain * regval, data->shunt), LONG_MAX);

Have you checked that the multiply can't overflow 64bits?
That might be why the last multiply was done after the divide.

	David   


>  		break;
>  	default:
>  		return -EOPNOTSUPP;


