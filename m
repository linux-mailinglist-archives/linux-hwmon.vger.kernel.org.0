Return-Path: <linux-hwmon+bounces-13733-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i100MNc+9mlETQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-13733-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 02 May 2026 20:13:43 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44E4B325B
	for <lists+linux-hwmon@lfdr.de>; Sat, 02 May 2026 20:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90988300D6B2
	for <lists+linux-hwmon@lfdr.de>; Sat,  2 May 2026 18:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE8A337699;
	Sat,  2 May 2026 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lpl1Vt6U"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B032EB5A1
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745620; cv=none; b=pvyy7678w4Jv4iKE0+b0fyTEjECuKlD6pgg8OHan8pLtaQYsPHyKTAqyvRaTGKusQZ6tndnOnRtJ60tJ0Op8b/gprJMpxoUZnIlco9kMQs0P759n6NT16dwnXYwAFI6Aq2WE1EF9d3FUoiVrN4jYfBcUEkuXcBKmDbv4YG+O+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745620; c=relaxed/simple;
	bh=PUNwVmyQvDLPVdMvyLGoshDXdXDhf3W3N3UigczT1Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYo6/DK9mwWth4uWkdRF9J7/DFETOj0hgpjTqkCeVinGbDwcQ7QCP0MTawA0rEJg313kaMtxMPtTHpBGHN2pRxEWo1VX01gOijem/YOKnFSeFPuIWe0oee5U1TXoaMSG/9rw9NqNNACfIe8neu5v4Y4DYSX7UOrvJiWzzFAnLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lpl1Vt6U; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c156c4a9efso5077561eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777745618; x=1778350418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgSbMtTDfwIyWjeFrxkSB0I0aygToctVDulUkaZSkJw=;
        b=Lpl1Vt6UluuTq7RoCvfYilRqueHrR2MJc7PXW13lcBTdJ2ldx3yAdRiz62PLEX0Mdo
         OraPd3cfYjaxxyVLUfgJLIMsC9s7XxVC9ihzKeW1kVyjw3E1xyKJM87Cltko9Hh4AOAE
         UflqBoD+7ru0Ijl6ldzefvXxT8xCkfZiJSkWiBJnQT0Ax0B1zfoMvzFC3tuxERJf3cnP
         lX5G/aV0NFKexsrPXCEXYvI5kdYMCgUZZbPwJqqVb4k65ifSr8u3cdQhjA1eir1apNSC
         QLqBUbG8CIrNFdi1wDg8MTCidhAqw7oCagM8k2TiRnZgjBvhxx6uYhLTn1Ock7WEyRB/
         d2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745618; x=1778350418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LgSbMtTDfwIyWjeFrxkSB0I0aygToctVDulUkaZSkJw=;
        b=GzZ7wKTlwD8rH2YfDiPXEQI4xPoTvBDmZNYaSXjWzKtqZBrp1BcgDTBJTs7kifx0q6
         f/RslU7g5gM7DObD5iGGQVaenTAeOyko0yEwC2V+WL/D+u2EO0snc0OmbXeXRpMEvUSn
         doWpcLCmyWxLJYirAJI5RQ9NhkQIbmHQCdNzeCvnlf/P65ysgHY0TZ1dhDlZwcohpZBA
         8u+ud8er816HTH07rw5zfwqrSslVqK3mdhqVxknQEAFKtfDLslaY7hBo047wjJDy0bzX
         ooXu9kTDNhZGJqw7yfzGIuPZl3/3TnV+HenEpA0nHXgZ+/+tK6y8sU+qGo4WksUX8Z9e
         Yhcw==
X-Gm-Message-State: AOJu0YxasXPKTqq0bFJ22q7Rfw2QKRIxVCNjJsrfLsGs4TsZZYHTp1FC
	esU4XE/sJD0F2Ui+E+Uk4uFqB9nOAoziU9mPfQ9L3LENzyMGCbnM/bly
X-Gm-Gg: AeBDiesNTivJBQOVaoK2kAf+7jeoiw678r0eacszRKRXE/4scYE//mfVKW6IYPBvexo
	TgOTn75cnA66HP2d0DADrcRNzl+5aQHUxOSwO4NJIkHShyOaAbldokqHkURyV0LGAhcHYouCnFU
	2c5Po+UiOv9ZCDayYPxFwFSMAqWy7Y+WzLIuhKSEd1zQBHxryTMGTLfTzjmhw4mp8EtzS9y3akl
	gyP5OedY7uribyvJjrjGUGzyH7O2w3MxugkbPZGF32/lPEOFtTocCjLRmc10JqzVzT9Yvh3xXkx
	41tngK1DjqnEbJkSTK5IGgzuujzJnjGKFDes9a1uk6cu0QveC3MrYEe9SwNMxbY50NNAR2F3+Vp
	YdwKjgi6wY2wBZGzH3GfOdRUmeYSQYrI7Z6OTageeAwg3j97VzVmdUYpU2enRf+mHrdutRx6RYW
	RzLjvUo8GqfSNsJu3AEeQB1G4oDKBvVNO3kMAW7A875K7lGbM=
X-Received: by 2002:a05:7301:1f0e:b0:2e1:e3e6:2909 with SMTP id 5a478bee46e88-2efb82b1a9bmr1746027eec.9.1777745618056;
        Sat, 02 May 2026 11:13:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm11514416eec.0.2026.05.02.11.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 11:13:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 2 May 2026 11:13:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org, wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Subject: Re: [PATCH v3 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Message-ID: <98ea0fd0-522b-4197-b11c-a1c9d487d955@roeck-us.net>
References: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
 <20260502173207.3567876-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502173207.3567876-2-markus.stockhausen@gmx.de>
X-Rspamd-Queue-Id: 0F44E4B325B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13733-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gmx.de:email]

On Sat, May 02, 2026 at 07:32:06PM +0200, Markus Stockhausen wrote:
> The initialization of the AS6200 has two shortcomings
> 
> - The device-add-commit states "Conversion mode: continuous" but the
>   the lm75_params structure uses set_mask = 0x94c0. This activates
>   single shot mode (bit 15). According to the datasheet "The device
>   features a single shot measurement mode if the device is in sleep
>   mode (SM=1)". This is quite contradictionary.
> - It is the only device that activates polarity active-high (bit 10)
> 
> All this is paired with a undefined clear mask bug in function
> lm75_write_config() that was introduced with a later refactoring
> commit.
> 
> [as6200] = {
> 	.config_reg_16bits = true,
> 	.set_mask = 0x94C0,
>         -> .clr_mask not defined here
> 	.default_resolution = 12,
> ...
> static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
> 				    u16 clr_mask)
> {
> 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
> 				  clr_mask | LM75_SHUTDOWN, set_mask);
> }
> 
> regmap_update_bits() requires clr_mask to be a superset of set_mask.
> So basically all sensors with "wrong" masks like the AS6200 are not
> initialized as intended.
> 
> Fix that by
> 
> - Change the set_mask to 0x10c0 to reflect the current active-low
>   setup properly and to drive the sensor in continous mode. This
>   takes into account that the config register is little endian and
>   the first byte sent to the chip is the LSB.
> - Adapt the alarm handling so it can report the alarm correctly
>   even if it is high active. This is done by comparing config register
>   bit 5 and 10 (translated to 2 and 13).
> 
> This commit does not introduce any ABI breakage as the mutliple bugs
> effectly drive the AS6200 in standard active-low mode.
> 
> Fixes: 4b6358e1fe46 ("hwmon: (lm75) Add AMS AS6200 temperature sensor")

Note: This is how the "Fixes" tag is supposed to look like.

> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Applied.

Thanks,
Guenter

