Return-Path: <linux-hwmon+bounces-14920-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOwkN1R7KGo0FQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14920-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 22:45:08 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D448E6641EA
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 22:45:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HBV4YqQ7;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14920-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14920-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC139300D4D0
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 20:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D9B3DB337;
	Tue,  9 Jun 2026 20:45:03 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C71238C42B
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 20:45:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037903; cv=none; b=b6AT57+BO98NyCHL0rPWXNk/r37VR+aKHH+Y68bZS+26UlKwvq7ZChbaOwa8bBTGpcgSo3QfqFZ8YNQrYlAcQ3h/HASovPF/f0oquRSiKKhpl67qNvbGLVPyOjxMmbKVIyxxiUY5N+AVr4XN/qJp934NWt/36R7NswQBo/pSC74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037903; c=relaxed/simple;
	bh=4RkrfyrzqKnxXYZ6+DDtnXffS/hfXv67PVBEUezmkB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afRMl8OfmuqXRZOZr+/lwDMWZcNzDMPM4gJBlNmnjQ0V9ap1RhL8Ruqul3ol0YondcWJWzRrXCGxn1gBoiaqWtjHEHbBpyBVoHOhDn/cj1NT13hB2AGVOsk0CE5xAsjIKSoCYsr7nQb2WBd7GD2QuEtBGmjwbpzxdYrjFNYJ0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBV4YqQ7; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf1f074a12so62011675ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781037901; x=1781642701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrbFaHt/sfzoTAd9VNUt1Zfwuflm4DlAD1twm0YxE+I=;
        b=HBV4YqQ74V8iCEO0Fma8zFD7njmRZH+yFkHEJKvI/KbjUvJ4mplaCk3c1huefqGuWW
         RXscgnWT9ih+vnOimQdWMb1pOndN0AjWIpjf92D1D8l53Qa22TgEkb3nLdTFyHT4fiEh
         g3pdG5W0Midm4zG95l/Mk+Z3kwnQfeiMvgwIhVEEXLPVtCL0RNpZIxdcK8rk8LHBDplq
         /tRTdUlNt4WaS5YFK8RgiOxnbXcIzdfH0rOh7VN+IcZf2J/ruTGf8NkNDe8dfwJXL82W
         ik4piOraqlrZxjaKTmdiZlLWL2tIMj93V+a2dcai+dNgCA6QyRiH0+olvqJ8ZeOcsEXY
         xGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037901; x=1781642701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DrbFaHt/sfzoTAd9VNUt1Zfwuflm4DlAD1twm0YxE+I=;
        b=LKHR3LoGBMu9goHu/rxGFLey4svIzT4Fri3093W73a9w9Ri/U9eUo8h7Cs80moV2uz
         bMm3h5HNaZG+ZmidK50omLDrXdL76UiMRfMO8/0Y5Qngo0tDuHPvi50cu91TuHZ/3pe1
         EwkrzTBzcM9gloGDUwzTF1xwI2uBiXZHC1yA+N3DIEQ5lJp2wkKTEeXtpwMIqlaviyxE
         ZcNnbgsl+/sGgux3S73IawXxHhNmku/diLczZp6D4/4a3KIegjDakFKpjBtN+pN9L3+h
         4PNNWEG92Auj4vBlWmiQ/eqKFS2NkxPNDHxEu68mXX60a7rhAtbhDI4U7bMQxVGiKdSk
         9Gyg==
X-Forwarded-Encrypted: i=1; AFNElJ8XLwVKXUj/X518/e7ICwp8DZ30H0ANsU0fKXDhgP6NTQmWlsnSRDWZ0na7g5T3glkb+4wQtGTdFWAN6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhMgKFVoWvWD/opO6B2oy57AJKSPZsvP+c/Wip8G1KdAZl5sOh
	1HqqLePH1qqUjJJMgJv9IlRF66OkVu9qXU8WbBpv1q8lxpyRuHWUmR5c
X-Gm-Gg: Acq92OEprt4t2mCqUPoLN5QXN2pvMKJfAvQ7f9DQXZCDtX8QnUQmKyCE7Apph9NajTy
	YSbNUW5WA110Bmp4AW7qCa9/mpsD0o8lEwEC7m4O7kQ5qbcEnE6n2JO8u8SJ2yCdCTDomWC7vtf
	UNtGbmBBuMMB0JpFeTT9OHlWY/GRi7vQwH5DI0/PCxpd2EndNrUPb/Pgv9hmiS0DfokNv4GeF1g
	ai7BKotY5B2wdJjMqCrzpfuMFkhpRj5008fdH6O16c/znC+eBO0ANSBlz1tiXWpm2euiuAtOqRa
	XnIpMGOZ49LTjVTMLqxnzzesHogkx7GCwy5MSTKuUI9MM02MWTCxrg9s9vFIuMIO2uAbLVpyzv1
	f+6wJbWjc5/Wb3wZolNO+dFy+v+MJmtiBJohTKnSsjb8dUdcB2bQTKnB/5IK2M7wefS/AYAcwHn
	b+lrRup3l9EJnxO8xJf9UhslOn8I8QUw2xsqLGkXry7u5DiR8=
X-Received: by 2002:a17:903:1246:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c1e821dcbbmr254657545ad.15.1781037901551;
        Tue, 09 Jun 2026 13:45:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm218492375ad.7.2026.06.09.13.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:45:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:44:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	richard.leitner@linux.dev
Subject: Re: [PATCH v3 1/3] hwmon: ina238: add support for samples and
 update_interval
Message-ID: <32a5275f-17fa-4439-8bc7-eec824f0584c@roeck-us.net>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
 <20260609-hwmon-ina238-update-interval-us-v2-v3-1-016b55567950@advastore.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-1-016b55567950@advastore.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-14920-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ferdinand.schwenk@advastore.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:richard.leitner@linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D448E6641EA

On Tue, Jun 09, 2026 at 09:43:10PM +0200, Ferdinand Schwenk wrote:
> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> Expose INA238 ADC averaging count (AVG) and conversion timing
> (VBUSCT/VSHCT/VTCT) through chip-level hwmon attributes:
> 
>   chip/samples
>   chip/update_interval
> 
> Use per-chip conversion-time lookup tables so the same helpers work
> for INA228/INA237/INA238/INA700/INA780 and SQ52206. Cache ADC_CONFIG
> in driver data and update it on writes to avoid extra register reads
> during read-modify-write updates.
> 
> Report update_interval in milliseconds as required by the hwmon ABI.
> Compute it from raw ADC cycle time multiplied by the active averaging
> count, and apply the inverse mapping on writes so programmed conversion
> time tracks the selected sample count.
> 
> Clamp user-provided update_interval before unit scaling to prevent
> overflow in arithmetic conversions.
> 
> Also combine chip attributes in HWMON_CHANNEL_INFO using a bitwise OR
> for a single logical chip channel.
> 
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Applied.

Thanks,
Guenter

