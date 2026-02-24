Return-Path: <linux-hwmon+bounces-11877-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGyvMFLGnWkkSAQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11877-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Feb 2026 16:40:02 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9991892C3
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Feb 2026 16:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 862CC31CA348
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Feb 2026 15:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3E527A465;
	Tue, 24 Feb 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1xNRv2j"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8541F27AC45
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947237; cv=none; b=gshygAvkoK3H4ZR1QcOjEmlaA0gqI/bq+Vaxorh//02Kpf58nrkldR+wUL99vE76iFMoi90doHu3aUAbhUs5pP6Ds+OTo/K64z1P1rdITU60MthK57bQzN12I7C3oSnmqI72cEXrg9Yj8yYMeWqWU0GO+WuHzmmq/7S4KGtmN0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947237; c=relaxed/simple;
	bh=EK7GSnx+Y44OvfiKWNKnvFI9tbLYMF8GaDuXYpgOOPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKkwK14KSRi/rfDc+PVvL7423/XWVdRyJQHOc9CCbBlGmkXkpYED7SX10wSvI2HLZ5ueWoyvWd9f55vikeohTJGcSqonHsGSeypIzSK9XewZfpXSQJIngDuUaPzEiXmmgbA7c0MA6cFXmnJ47+vnD9z3ttavNNpHmY8cu7vx7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1xNRv2j; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1271195d2a7so2663049c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947236; x=1772552036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmDK7rEaAZxC7IlQFVBRcPgoULUWQGeNkCCtxmBTCnA=;
        b=H1xNRv2jFilIVNwtyjqnY3XrxlHqe7Xkglv9BIo0Xceu1tPbI+BinQJxliW+qgio/s
         eMJmdygRDU/yyyYIchuupXIW5eTw+8y8Tdkepeyw8YgX0yKesKd2ejm7gFU9X5Oit2Z/
         FRBrsEWzK63HAtASAdS/uZ2MQqR8z+qEBJY0yzyc/gn6gYf+o17CohK/LuJsKOK5e6BL
         zUkOFqHJV7I9Sbb2ngBG2mMUkYXE5zuEi+OmzN7RbleYOFRzkLU9zuT+oF7g7djTmLDw
         hGLdcUmQ0nPIv85V6j1m0Ma5sM86LUWbTAGvG+OUMvixbOc+tT9tEEslXt+UFj3wLXwc
         dAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947236; x=1772552036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tmDK7rEaAZxC7IlQFVBRcPgoULUWQGeNkCCtxmBTCnA=;
        b=AEANwVlPo5977di5OyV+V3o+eRCzqdqKjt/dXLB4p6cPe+qqtDKHbOQ0V5nr/zfpHC
         7r9ysqPMU6zvC8LV//8i0lAVq+vM59vCHnRlbaHqVr6Rh27bVUUGH74Tmrv6FNRQ5qZj
         /tJ35Cva0L3uRtmmgvEvB+5XNMk+Zzqfx3nwQY7Rt7yMtP1JNIFhSww6utE2ph+Qyrrd
         /LwsQAnZarz9GRRjcvZ/34l9pia+dXwcpk3kliOSwzcp7bQ/4MGP4km3y4PVIZ7lJi8s
         lHDIaAtat0dNiW8XHZ5wzM/MY9dRDzZUVOuIYaCq88b7RFh7O1Vq2lXcZt/1Vd9RsBym
         om0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYZfVeGfBKOZy7LgKQ/S9n+n0hM6nfSxaAfpvfzOiwkr5mxNO7/4AB5GpEj6mMRQZh5jtNxd1Gd9Ax3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxujd6qX2sy1NI9bY1/exy/U2Sp4EkwGuugVJvNLhNxF+HwuEQk
	pKOZyX7i3nd0Ma6U3dnCtrISWANwxzCR0/iIHcYwHx3YKeUyplg+7nxN
X-Gm-Gg: AZuq6aKmfnBBE8d4YsNF3a0CO7wv82eyVQdMrxhh3Q+QFC5DbVWaKLiw4S2nM2d7S53
	gfET0euMaczS6XVNlk4vl7BW6QJ/rxK18BosTCbGPsv+rKNY8n0TI4x7HhkKKYo8hSL/fTxOmi3
	gwALgalmlZWl41QIVMqedu0W510YSnCl38CkHwN3RBa31v6oWRIvN2M4YENJk5lAwO7qutiRm8T
	MG2TlZmBPBz9I6YAvbGpEgea+pMWIh4QYeNNz3fph7ADayOhLyBh7mJCKOqH4xVTp68q3eTAa7O
	sZI0tV+/Ph8x/aKIryh2EP+TELAHWhI8TtPYFR4sP018Br1AGA5DO4f/lZiBBEHQACez6pgVjxG
	wY9a3wuYeVTvvxKm0yJD/lRH6+dsM6wMqNY6v4rps+98U7f5pwdR437T1y96eB/TlINFalH9HBt
	7N2Ea9svLnHk8l9STF7LdqZp/wHZAY0/MNZL5Q
X-Received: by 2002:a05:7022:699a:b0:127:5c3d:bdad with SMTP id a92af1059eb24-1276ac5b8cfmr5840633c88.0.1771947235608;
        Tue, 24 Feb 2026 07:33:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daccc44sm7020833eec.15.2026.02.24.07.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:33:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:33:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hao Yu <haoyufine@gmail.com>
Cc: krzk@kernel.org, akhilesh@ee.iitb.ac.in, conor+dt@kernel.org,
	devicetree@vger.kernel.org, jcdra1@gmail.com, krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (aht10) add device tree ID matching
Message-ID: <57493e98-72c1-4422-a0bc-2261c1a6daf7@roeck-us.net>
References: <20260222105831.7360-1-haoyufine@gmail.com>
 <20260223173853.30617-3-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223173853.30617-3-haoyufine@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[kernel.org,ee.iitb.ac.in,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11877-lists,linux-hwmon=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A9991892C3
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:38:53AM +0800, Hao Yu wrote:
> Add of_device_id table to allow the driver to be matched via
> Device Tree. This is required for supporting the AHT10/20/DHT20
> sensors on platforms using DT.
> 
> Signed-off-by: Hao Yu <haoyufine@gmail.com>

Applied.

Thanks,
Guenter

