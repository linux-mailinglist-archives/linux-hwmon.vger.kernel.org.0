Return-Path: <linux-hwmon+bounces-12439-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI2UB8DTuWkqOQIAu9opvQ
	(envelope-from <linux-hwmon+bounces-12439-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2026 23:20:48 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4192B30EA
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2026 23:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 930F1305B5A0
	for <lists+linux-hwmon@lfdr.de>; Tue, 17 Mar 2026 22:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE45396D2A;
	Tue, 17 Mar 2026 22:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnCIIiz6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A339B49F
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786044; cv=none; b=iCl+7lIOB+ygYD0tVl5Gvs7909JuMSyl/h3dgdZeuxeuoR27eXNC23FkWt36DHnEZU4GPG18Ej8AYfs9GiFz+dgtrs9pUq6ICDhUFsRKI3uXhQS74/C0p6OTWx1iTCuFElt8ZZ2kb6jYX0dHFB9mNryj+FnE8YXi2gdSRKJjYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786044; c=relaxed/simple;
	bh=2AezpX9nMJN7fXejlohfhk6Hee7s312vEjqngOxROR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2RtkpMoZcnxM1G/F7Q0VBUitl1H/TOHlKj6idbx1N6eqLI4633LOoOV1hLCGXRzaQbRKAA1TNVpOBu+JvUyXtCXQdSHRdDbTesPLq8fkPCR0FCCfXHcdRCnIgO0zYmCP/BytSbcANOmJBVt0Yiw/ts3spTPeKVkpMBlQM/T9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnCIIiz6; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9004550eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773786041; x=1774390841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFphyAt9r7cEETWzy9hJGoIRqUIBOhHfjBLEm5UlK6c=;
        b=XnCIIiz6/vMy7IIog1KOuzecaaDMFEkjM74OCevsO2fVh0E6vtN0YqisiLXARWCfal
         sXgLXxkxnzCPeNvwQYl5ubaTwaTVIKBv4/KSNESpd+Em3wE9Ya4Xm9p5zOCChUjJ6A8r
         8rur20n2TL95795ZH1Bq+Ycz86Jb3x7hc6pQhQjR2DMKwttkGGJmZCy1xuCf7hhrsQqQ
         JmvAuqkkbr+DCFrrI7QJAgBFfcEzjK+t0GL9fvIuDXE7yOtMP5qUqtQoSy7ZIvYxEXV2
         LXcmJGiiYMtfXLowCBVyDtA1rw+mw6RTSWXcllG58yRPl9pcN+Z6UUzff1tjBtUTwl7c
         823A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773786041; x=1774390841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PFphyAt9r7cEETWzy9hJGoIRqUIBOhHfjBLEm5UlK6c=;
        b=CCAu+8zLmXai1CO7ffIfB+ZmBGvp/nuCs4fAoN1LqfPw2EoF/yW9O8QV4cNKyW9YGf
         MI0JA+fV5H+U8pfCN7md1xdmNjc+cNqhLOLG+WmxAvFfVmlLRY+N7jb5+p6U/zqLWd/U
         oxYRlsvMoyyUkYtu1x9/nRCVF85AnDIPkX17DLY0outXX6HnJk74JeVDnfpHALdI+VWz
         JIpXlufH4EbOYc71OKZUbiAx3te1DIp46nK9xUcwg199MJfNe4vuTo7oxQgoHpIIFO8f
         GvTJKi07xwMrS+drzlEToRefTmqlc4j8gzD/rLZJV5GCcsl0FM00B4S7Q7lB0Ms81wkF
         fInA==
X-Gm-Message-State: AOJu0YxOCEo2tTlOjG0Ka7xQ7Iu8DNYfMyX6ZD9aL+mrgC6tskDLTNre
	C4EWvZ9BdinlbToojt041k4Vno+AcnWO11DvtB+NJLzW6xv7o7pNb/Yd
X-Gm-Gg: ATEYQzz/qhVTso9nSUTlQIqH7wiP8tBWJtGi1J63rNTG2KN0VIvvR2T9HJtDpMuJ1YW
	idRq6XbG8uTk6tF38YlpnZYKeL865biwfAIe19fX80f3582S+5OATgUAGZgd31Xl6iDz+GJDLyb
	aWvRz7H35pzBhwd+y0zv6qgcNdnD0Fe23xpdjQMjAZdBZmPHUOQSQLd69xoEHGXQFyXcb4+/S8d
	0kytoZAZM26OLaLPsMsq+KIbLiNC7DzX2I09pzV1s0b8bCMqZA24LMypkafMuc0uE6N7gOyo+fN
	XP28uj+VV25l+CrHl42M0GAYqly4Aafg0ohwoMKkjb+ZsopbpfOJGxVZM9P4QpMyjlbXm3c8GLW
	VkF+PSoFAxTL0mog4eq7Zo0nUpy+gC08VOM6Upt0E5zLwF4BjmngYO5g6oA1F3jgoQoJfMK4Qtd
	XSNY3NMdrVmK850AlB9AsGnko1EQkL207IeBdaHhoHLQnrJLo=
X-Received: by 2002:a05:7022:160c:b0:122:8d:3688 with SMTP id a92af1059eb24-129a712f3d2mr645312c88.22.1773786040671;
        Tue, 17 Mar 2026 15:20:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b3e8d34dsm1230176c88.7.2026.03.17.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:20:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 15:20:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"vasileios.amoiridis@cern.ch" <vasileios.amoiridis@cern.ch>,
	"leo.yang.sy0@gmail.com" <leo.yang.sy0@gmail.com>,
	"wensheng@yeah.net" <wensheng@yeah.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 2/5] hwmon: (pmbus/mp2975) Add error check for
 pmbus_read_word_data() return value
Message-ID: <d8edd124-66df-4261-ac64-f2fa0c77382f@roeck-us.net>
References: <20260317173308.382545-1-sanman.pradhan@hpe.com>
 <20260317173308.382545-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317173308.382545-3-sanman.pradhan@hpe.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,cern.ch,gmail.com,yeah.net,juniper.net];
	TAGGED_FROM(0.00)[bounces-12439-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,juniper.net:email]
X-Rspamd-Queue-Id: AC4192B30EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:37:17PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> mp2973_read_word_data() XORs the return value of pmbus_read_word_data()
> with PB_STATUS_POWER_GOOD_N without first checking for errors. If the I2C
> transaction fails, a negative error code is XORed with the constant,
> producing a corrupted value that is returned as valid status data instead
> of propagating the error.
> 
> Add the missing error check before modifying the return value.
> 
> Fixes: acda945afb465 ("hwmon: (pmbus/mp2975) Fix PGOOD in READ_STATUS_WORD")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter

