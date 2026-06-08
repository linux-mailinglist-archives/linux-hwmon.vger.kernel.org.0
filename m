Return-Path: <linux-hwmon+bounces-14859-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6aaFBUa4JmofbwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14859-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 14:40:38 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD61656456
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 14:40:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hw7aXeP+;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14859-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14859-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B848C3042F23
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 12:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839C4370ADF;
	Mon,  8 Jun 2026 12:33:50 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B3C35DA49
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 12:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922030; cv=none; b=C+Srb8ApAvQKeMIJbwTuQGPaJjFqHldgsNJARgGevkkc1l5Ky42xeBUdw3JOUkdROKg7WcXV3HcDCO6ZkNU3yV6Xbenj4wZcqcgdHy6vvLsabQKTxrnmuhEE94llhXoES6uxtqh6zOGxzBDWbbRfdsY6I/cISTnbz8k+BiN6asg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922030; c=relaxed/simple;
	bh=CtPGOwn+c21B5ZxD/CyOJk2kuWxqQj6QpYPnu1/17WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruFJKKmCiJG/AZiIqIX2Xu4K3610ZR4xChGx9H+ARbMyFw2ZSmS6NFWZ5My2WNcZlTtwMdeM/ESKDkwCkAggeXw++Qs4OnFqVc1JPhkKxJTH+7Ol8bpTNk1E6y0kabHNIrboPlOruof62cZVl44OO91o9tHQkw9HjFbthOGyRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw7aXeP+; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf30d530bdso43493165ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 05:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780922028; x=1781526828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4SamfGu8OlSHhBzdC2yYZSudOgVmzcUrQiqe/RzLKA=;
        b=hw7aXeP+Zf7sBqYBJll6xsSPNZmTZ8P0tuKf43EoPs3Cyzm7DryNoboh4NkfLPolPo
         WmLaDeDCwIJ+5LTNTrMAyqiA53ihi262fSg6LDAKMoaWKh6dOhYJvnJkzS8xK3t49PzJ
         gIePYI/bG8vUewgfjbylQ+eEzAQ+0ebobvyts69eb0x5U5yIH+Oya3P7oktzWcoYO9Qe
         C5Qu8disDavUHGuRqDpEgBHfGfiqS0KQefVPgzfnPpaOpEBbI7aM8G+wx6Ef+ZhLRP9r
         PAlHt4tJFWrMssRDT9/n0mB0DNWZdEWM02wqGCffZP3sveyDn3oSTctwWoOFa4UUjXB5
         /n/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922028; x=1781526828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K4SamfGu8OlSHhBzdC2yYZSudOgVmzcUrQiqe/RzLKA=;
        b=YOdRDDWXARQubz/CAKLUs1MWn/vdtqq9I4i8LmEpDF7tJCQ0J4DOEdBWqo1zjkFNVf
         F1j5aekF5XFEaVAPffInFjAEssCVNZ2yl40SV4qqYexqNUVbfpsDsMkaJLICdgBT79gp
         FfrTtvQoiVQlIhfSPNeIrt6fJnnhRGRXSfOTmKGEh7uCBqtW625AgNfF6Q2SvM/ZWYr4
         +Aj/BZ6J/YPKik9TCGdKuAUYaRfSD7xNRxSr8gWAKcKQlPcry7THFQ7WFwTz4uTlY6Vh
         1PFCLNrYl1IAox4bhXiw8lWiJ8YxFi2CuYNl0c8jFnhFM3MrS5opoMcVzMwXzrUc8thy
         9dBA==
X-Forwarded-Encrypted: i=1; AFNElJ9FjdtW1ABtWasb3ahzg5yWJKzTEN/TsGOmSCj2E2kc7FyAStlC/8qxlvpOY/ebgwcx3CruZ/ZDBGxcLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNi0J5+wT96Xeeo391vWfi9uG3wEavuodbpxabUsXJ5PhllBA8
	h+SxPZwyYiHb/mQUTLcvjO7bdN2lnyTCD10QFyrwOX3UqKIdld+selvP
X-Gm-Gg: Acq92OH4wpVA7Nak3Lmj3u/QEnIVYArhnKswx15OZfoiel6PGWJQqWOCUcBx56QCK7k
	RUHB2e1nMBt5kBuPzOBbaJo2AYMEGtoldiplRjs6O1uPo1FOhCqJPQsO4QtsvGaxDpZm+EukAbi
	6ijyq+lvJHFrKUZ5CDy1vPw0y16gK9dIJQzy7TMwoTJMlZ95Gvl0aiWY9xIugu3j1L1ehdVEqKe
	qGkuDFaOip/DmJsFPOOFy3UOUH4l8qHqRlEfUqePwpWIy2KGW2C96l//Lo4Q8xYxGtBrfAxqoL4
	oF6fl98aZu54G2QK/UqBXilAnKuIuCEUPgbbFA71f26m4hLnV5gK7xGBFBttJLkWiXgFtU5xo+7
	jU40Uba8oRuIzWBnW+YvDYxjPNXY7tvRNJTpFK843jLQ6sr+4D3LfTrgPLffHO6g8HHFGKO4OcU
	BYE96qEMP5m3g8vmTC21yyOfuCXfXzBUiEsHm3tH0aRcNjKqY=
X-Received: by 2002:a17:902:ce8b:b0:2c1:11b8:3c80 with SMTP id d9443c01a7336-2c1e833c530mr168489655ad.30.1780922028201;
        Mon, 08 Jun 2026 05:33:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm178839555ad.40.2026.06.08.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:33:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 05:33:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Brian Downey <bdowne01@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
Message-ID: <c4e1c8e9-f098-4c3c-9d09-c0332002b1a6@roeck-us.net>
References: <20260608060855.40469-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608060855.40469-1-eugene.shalygin@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14859-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:bdowne01@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[roeck-us.net];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:from_mime,roeck-us.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AD61656456

On Mon, Jun 08, 2026 at 08:08:41AM +0200, Eugene Shalygin wrote:
> From: Brian Downey <bdowne01@gmail.com>
> 
> Add support for ROG MAXIMUS Z790 EXTREME
> 
> Signed-off-by: Brian Downey <bdowne01@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied. Please provide change logs in the future.

Guenter

> ---
>  Documentation/hwmon/asus_ec_sensors.rst |  1 +
>  drivers/hwmon/asus-ec-sensors.c         | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 9ad3f0a57f55..60f1a6036538 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -29,6 +29,7 @@ Supported boards:
>   * ROG MAXIMUS XI HERO
>   * ROG MAXIMUS XI HERO (WI-FI)
>   * ROG MAXIMUS Z690 FORMULA
> + * ROG MAXIMUS Z790 EXTREME
>   * ROG STRIX B550-E GAMING
>   * ROG STRIX B550-I GAMING
>   * ROG STRIX B650E-I GAMING WIFI
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 070bb368f2b7..0e78750de34a 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -399,6 +399,12 @@ static const struct ec_sensor_info sensors_family_intel_700[] = {
>  	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>  	[ec_sensor_fan_cpu_opt] =
>  		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
> +	[ec_sensor_fan_water_flow] =
> +		EC_SENSOR("Water_Flow", hwmon_fan, 2, 0x00, 0xbc),
> +	[ec_sensor_temp_water_in] =
> +		EC_SENSOR("Water_In", hwmon_temp, 1, 0x01, 0x00),
> +	[ec_sensor_temp_water_out] =
> +		EC_SENSOR("Water_Out", hwmon_temp, 1, 0x01, 0x01),
>  };
>  
>  /* Shortcuts for common combinations */
> @@ -509,6 +515,13 @@ static const struct ec_board_info board_info_maximus_z690_formula = {
>  	.family = family_intel_600_series,
>  };
>  
> +static const struct ec_board_info board_info_maximus_z790_extreme = {
> +	.sensors = SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> +		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
> +	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
> +	.family = family_intel_700_series,
> +};
> +
>  static const struct ec_board_info board_info_prime_x470_pro = {
>  	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
>  		SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> @@ -857,6 +870,8 @@ static const struct dmi_system_id dmi_table[] = {
>  					&board_info_maximus_x_hero),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
>  					&board_info_maximus_z690_formula),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z790 EXTREME",
> +					&board_info_maximus_z790_extreme),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
>  					&board_info_strix_b550_e_gaming),
>  	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",

