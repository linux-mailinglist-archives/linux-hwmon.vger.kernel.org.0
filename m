Return-Path: <linux-hwmon+bounces-15434-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jbXdJL3ZQmonEwoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15434-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:46:53 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D70916DEB38
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:46:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DhpvQPFc;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15434-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15434-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2699D3034DFD
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 20:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EE237C0FF;
	Mon, 29 Jun 2026 20:46:47 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72725DB12
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:46:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766007; cv=none; b=aJwSvdzZg9MFwfkplVUhy9S2dssCMIP7N967C8M0Dgcy0ObR2QJZ23TVtAl0qN6iwj/NsdvzjMLp7eFuKI9u6W1gA7CDqXaik4autSMde7ARBURZBv59fB+REJbnQprNso+yQfCq7hXKZ71Y5Tbn39xzhYSUIao0RJLEJjagsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766007; c=relaxed/simple;
	bh=oIaVpra9xMtdelgZVCpUbmy/Ukn2n3p3s4KE0a0Mppk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jf7vVb5Lex0LeF+OoYI8lDMsRmlxFB0TvKEN8HyGOJdFqcxl4pdMuTsWkqle9jwvL3taaDGJBT8awwIYs6kWRlWq0nudteISDsUAgwwt3yp9Exx612vPN2mgmxsf98gptOqlWPXdvfJaBIlPyWwuE7DeWbS/+p9w0Uy9YFDUIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhpvQPFc; arc=none smtp.client-ip=74.125.82.173
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30e9eefa268so168131eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766005; x=1783370805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vZehTvB7/q/A8O6AeI86T/3FAK982m0Qh+Y627rtqU=;
        b=DhpvQPFcKxrbY9kR99SihTtstpzjjh6ypng8ZKtOarkL68llY29nW1qIpxZa+oRAWX
         aSSFoMTIyYTwgFQcfUyqSkAljEushl0sczIT4v9sxOnee4uZ2seKQWDAc75MrvH5KSrJ
         GnX9SxSmLbnZq51v5NRMsNX45mTVtXyyiKLON07Uax5QPc3EvQhIysKfPePoIOSrNaz+
         klxx6NjpbyFo7jQ9BBPvZsHiw0O5pJ0fdRMOuy6hKvEIxaPlHGztfzgt5CYg3ky85AHO
         2xJyBDCp6efgAHpQwVXobk3lIe/oWxpA6Y1JUgbKDf5YVv1d35EyAK3cd9oe1y0FlOFs
         86Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766005; x=1783370805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vZehTvB7/q/A8O6AeI86T/3FAK982m0Qh+Y627rtqU=;
        b=P8Zl/qY8b3AG13JawTlXQVb5z3tcHTTEQpXyLz3kZ3jdlyK6t/Ec3zW9TVqBrvd7Mz
         +FCvBYpCztIJkGM2YcgyCU7BzNJVVOk4XfeJUZQeeNvzQv96ik1vVNhlJf71kJePUwhU
         ippz5kp4aZU3cx9oGQwBACMVkUZYnwaJdtR4B2RoYd8VUl7eY9RX+qEgPlzit0qQ9ovH
         7paCzkWbj/fm3cNmyDeAngF9WeakG+NeuUOXe4pIq0U62Gfng3sjwgirW2HVQMoEZsCn
         3QNJwmsEwlZuA6bgIh0AKPWngLL8Wx6SmaIifzNoePIkToYpvgWX6qqsDsNUcUT2qz0+
         jO5g==
X-Forwarded-Encrypted: i=1; AHgh+RrEyS302rvWxUZu5a12l7I06dMh7Bw+lcYUJ1OoCgRH9dM4sk+jm4xKqJS955Jaa18iV05Lmsj3WfS3jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKmlEaPbwDv7mtH49yaNi3XIfqRwdWp2MKS8dQUizKJdUBoT14
	GYmCUrvTyfBiCjzJugMNIKx1cLUs2TNEU0pb4MmL9d2sIuxUUxS0IG98
X-Gm-Gg: AfdE7cn4ECF9Px36UFg4JVgP4vOwDcqNml//XBwEMu/y6w3kofSgZbanEJJk1lijCAS
	evoqyjd27RfN95vavHb7OQSIebmb6evVny/05MQt4hqzsm87ClzKjxZ9d1Vdp7FTKzFIUpi+/Nc
	yXa+ssg2AcETG50xir7F2mhdmBGWXihDDQ7Acjzj7g6oAwtTrw8FtzFvD4Zq+Ce2LK6201yW1ew
	gzV+DTXpPdWPnCYJBIC0fJV7a7xSiR8LObh4NvECy2c3Io4DwLtvT4LuCziYbTneraTPzWDy2Gd
	A/NfiwsqzvXLnxqytfrvexGkRbmFYNC80psjXxEXhdOLe8OIwf0KI6kt3Hl5L2mHMefUX26uRvK
	+UhioBUCLbsOnItEnQmbBPaWCri1QNZ/3cnpXLAuvEY202kqTqMmSgIvQHeqVk1I5/uwjhhvHNm
	U6BJx5VGrPm0iFCerHiAWD7HF7FA==
X-Received: by 2002:a05:7301:9c83:b0:2ef:8b91:212 with SMTP id 5a478bee46e88-30ee128cd28mr682632eec.14.1782766005075;
        Mon, 29 Jun 2026 13:46:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee320827fsm715977eec.25.2026.06.29.13.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:46:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:46:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/9] hwmon: adm1275: Detect coefficient overflow
Message-ID: <dfce0e79-7a8d-4861-8343-27f4581eb044@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15434-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:vasileios.amoiridis@cern.ch,m:kimseer.paller@analog.com,m:tomtsai764@gmail.com,m:chris.packham@alliedtelesis.co.nz,m:robert.coulson@ericsson.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,cern.ch,analog.com,gmail.com,alliedtelesis.co.nz,ericsson.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D70916DEB38

On Fri, Jun 26, 2026 at 10:23:58AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Sashiko detected potential coefficient overflow if large shunt resistor
> is used. When going unnoticed it can cause "drastically incorrect
> telemetry scaling factors" as Sashiko put it.
> 
> I am not convinced such "drastically incorrect telemetry scaling
> factors" could have gone unnoticed, so I suspect such large shunt
> resistors aren't really used. Well, it shouldn't hurt to detect the
> error and abort the probe before Really Wrong current / power -values
> are reported to user by the hwmon.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
> Revision history:
> v1 => v2:
>  - New patch
> 
> This patch returns -EOVERFLOW with an error print if overflow is
> detected. IF there really are systems where the overflow truly occurs,
> then this change will cause the probe to fail - which might hurt the
> boot process. It might be safer to only print the warning. One could
> also try changing the order of the shunt resistor value division (/1000)
> and the multiplication and see if overflow goes away - but it'll be
> somewhat more complex then. Hence, I just decided to error-out if this
> happens, and leave this for the people facing the real overflow to fix
> (if needed)... It's still fair to mention this might cause issues.

Let's see if it happens.

Applied.

Thanks,
Guenter

