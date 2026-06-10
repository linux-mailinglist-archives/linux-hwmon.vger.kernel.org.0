Return-Path: <linux-hwmon+bounces-14961-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4UvZNyNkKWqJWAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14961-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 15:18:27 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6816D669A5A
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 15:18:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YGRLIqij;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14961-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14961-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 591B0311BF9B
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 13:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF282358363;
	Wed, 10 Jun 2026 13:14:02 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A2C1D54FA
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:14:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097242; cv=none; b=Y30iBNwc5Kuw6tYqVYxYWeJqEqefqP6y2WyLUIFA8LxEW8yet/gk5nnfEOLKcRhv2Mhd8Wm4eDcTUhyC8zp4bPwm0KPOkmp8vFGRG8VBUjRRoLpxdm7bjfA8jzbKL/pa4UGaQmT9tXXOPc5ZKNF5B+W1bDooNPoPv/4XeoIjQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097242; c=relaxed/simple;
	bh=tNAc/loCl5kOlD0qhM/WMCdXqv4BnuV6cvs1WQmeKgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRzdUAEyl+HW93uphwedLAMyr7X6tW88ptXjOdfo+GbzkIYq9FCrlI3XA+8RI+xrlJLMJ2py1yjfvTMPqie8iOI/CriS9DQQnrmbmaWvdzddGUgvIWdoOorrE4djOgd5w/0TBBeVpsRUUthI3eEDesrbYsvhNFkieO7oQ6NPYMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGRLIqij; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf22d29dabso45009935ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097241; x=1781702041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HN3yGzEWKyMqsUGamUwuOFjLur3IPcZYrJH+AltN/Ls=;
        b=YGRLIqijQK2/U0n6Bo0WmE0Roz1YlnmIaYm5z6NjlEKGQdgEUWfvJEPJ59Fz3U7M7r
         c2Js4BBtZPHqrl1mIhFK12Xw+WXLH4v/SLs7kk787LFoyaxOvZLjBbjiTpyEx6uD3Dz5
         1Cm3xu4Iamcn5bsB1ZM7eXIL7j7FfwHxWw2Dfk0G2/y+Zs1a2VyHxgLRISwbKSKQYdxo
         hO/LgkDrgWOso2Nn2hS3Y11H7Qv+OTMf60v4O+hWrNTWQEuBnv+LTQTksAXfJsuRWcKY
         zyDmxxEzSnhKbMKFXjrtE5TKO2XQCAn7MGMCaAU6+xlHASdThq/httmjMUPusYqB+Qjv
         OfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097241; x=1781702041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HN3yGzEWKyMqsUGamUwuOFjLur3IPcZYrJH+AltN/Ls=;
        b=XZgVFdlUHeLNd6JI660NA0Sw0MXTXNwsKoCrzRb4AXx99INd6OAnk6u/ncr6dfoa3A
         xp8HRUBMRcXPGlU+VlgWAhdoc96LXA2kU4wgcg6v//ysRsKwQgicdw2UFG9Ed6KlCPO1
         hIgTNqfK3QRYclGUQLwXhyTOL91XPMkgguWJ/pX330FXhhbiJjiKYvggr/Kg0DdOMGoh
         CPHXYT0CDL/huDjst6s97QJsa3cMdzXQPEH6xM2BJpixvCn2yrk18X4NQPC1F5c7DKDf
         Us1OmtLRqxTBNGZo79qeYgLeeolia99kNilbe6wDmicVBp1MRDJNue6SULCCPc6m63QK
         99Kw==
X-Gm-Message-State: AOJu0YxD2PcMjV123GgPMeWNrFFi6r9PAAhDsm77NZTbiFPbEFvacqR0
	nl2Otwu6JmdZGFCHbYs6CeUNztCmTDYPxfja2cIqBCAugV4ehwc9O+ne
X-Gm-Gg: Acq92OEMGM8eCqTUY/xWl7R5KFYaJmAeyEH77IUPkSWdKaAqYgrE43XQWKrD5rtdRG0
	91fA1GaalKJCLYXQWVTPy13Xg9ztrwv7rzFAvgiaVVnAbxyGWOOnuZEufJWIbxmQDtTNPLGURPA
	jey773Qr+elNfdm9lER5sliJ8hMioYXDljbxZ1PNYljOQRtI/1f47JFQXSrJtSyOOhA4SvkD1bB
	9G3Y3y94wbVrkuxrD4se8NUyA+Cy2Y/0NY4SaJ/2DaZk7JCBTolJrM5nyxJ1h3G1CqxZYdMXK6x
	ei6O0iTvZe8yXbDOmWdNQ8HGfejKnOYFf9cxuh88yQt+uCpfyUGlw1aQm3eT+Q5mipPpAZLICGe
	Dj0uQcxT9kYH+OdmJzhm/Mb+RCE3YRpfm10E1GVeEZpqvjZ8heZR8NqqmpjNtS6ncpHtL3PBcvb
	LljV09n9HCN2HjNNCvjqMd/qKIH7nnopbOlQwwwBYiQw8N5QQ=
X-Received: by 2002:a17:903:2448:b0:2c2:27be:39a5 with SMTP id d9443c01a7336-2c2a1cb5759mr85750975ad.33.1781097240974;
        Wed, 10 Jun 2026 06:14:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm123535715ad.45.2026.06.10.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:14:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:13:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH v4 2/4] hwmon: (gpd-fan): Initialize EC before
 registering hwmon device
Message-ID: <52314162-fc11-4a4f-9be4-5651a3b1796a@roeck-us.net>
References: <cover.1781055639.git.xiaopei01@kylinos.cn>
 <4be3734b135c8013157979ab5e80c7ee51243ddd.1781055639.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4be3734b135c8013157979ab5e80c7ee51243ddd.1781055639.git.xiaopei01@kylinos.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14961-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cryolitia@uniontech.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,kylinos.cn:email,roeck-us.net:mid,roeck-us.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6816D669A5A

On Wed, Jun 10, 2026 at 09:49:10AM +0800, Pei Xiao wrote:
> Move the gpd_init_ec() call to before devm_hwmon_device_register_with_info
> in the probe function. With the previous ordering the hwmon device was
> registered and exposed to userspace before the EC initialization
> completes, creating a window where sysfs reads could return invalid values.
> 
> Some buggy firmware won't initialize EC properly on boot. Before its
> initialization, reading RPM will always return 0, and writing PWM will have
> no effect. So move gpd_init_ec to before hwmon device register.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter

