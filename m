Return-Path: <linux-hwmon+bounces-12117-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMOsKZSrqGmfwQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-12117-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 23:00:52 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0E208420
	for <lists+linux-hwmon@lfdr.de>; Wed, 04 Mar 2026 23:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCFA2301F49E
	for <lists+linux-hwmon@lfdr.de>; Wed,  4 Mar 2026 22:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE6038422B;
	Wed,  4 Mar 2026 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+uiEIjN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35236CE0D
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661636; cv=none; b=GbeTYVC0SFPpImLmDn1EFohLl7nY7L24pSJpgmTj/Nbn2aB2zJKKOAyEEWlRQHVV8YQkHf7t+rdjQMOWwtftEg+fmiYvonSA6LAKxm5E4NFMV1DmNWSHsEu29rNEGVq6782lSlZ3xOsH9bcRUb8k+nxmS2kVVzAyE6B/NToQ7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661636; c=relaxed/simple;
	bh=m6XH5T3x1DjJ3lCA8btPdZYedKHfxu/LzJ8v+gmN6Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bk/PmXoSeED+pGlYLId2FRmKMqkpnM8+4edcQflqPHbt7xpSFBNvxvZEVa8VVVCtpX+79CDkKf2XnLQ7QUle7YZpQgZ6uCtbyA/99N/UgIFyIzJqklfkC7QjZzx3xL3dL0O66lT9UVHXJwOLGi4jUDwcW2jvffWrKTG4oBXrLT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+uiEIjN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-829759ca646so578044b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 14:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661635; x=1773266435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsY5FVD1PWFdUv5+4v4CMZrnguS4M3jz8cAVJu9gOXc=;
        b=B+uiEIjN3iqCwX6vBtrAFNd6Zo3KBPq9vt7D6gsb1RM3f9dJ1uVAc7b8qqAX36U+g+
         W0C83iWQ8J8VgE6a4crLEeoXczW74w+UTzlm7V49Go/WsWbrsTUq4FSedvMiTY19ibPz
         YpCcYRmn40PsiPLkHq5H7eC2XPHfEjheDrvTq36+rUC158zJkVLZqA73dUyjOb+MkQvk
         V+wlpyFT1NMh8ruqk5aKySzA7XY8U9AtQVL2pFSY7tOGkm0WWEmpoBL7SsjLu1oz4f10
         5cTCM7Lbw+63OvJz+qXCFghvfcQyPAVis8pLtHvhnwPmyDue66Ihas0yAg2Mbr3cwMJg
         OgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661635; x=1773266435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsY5FVD1PWFdUv5+4v4CMZrnguS4M3jz8cAVJu9gOXc=;
        b=Wa3VKqQrbwc2rXQWA0jdqgXbOOc8pBgGRZRH2jdbaDlf3y6vzWsHOp4z0/AzUnoYSX
         pLUihuvugVMzrTIgl5LUX9yyVDK09ysBrTavdp0xmAU8mj4XKH0fLCZYHimjKaqxBbcZ
         Z+p//qPsJGmvskoaLgGho2X4IHAp8uvHi7eww9mTTiW/0G508HWuDlZ1PN0fa9mufFwm
         X4vVZS4Lddb8twPwQvgfO4Jx03P493i+/PEtz7qOoPx+UcjyUDb8GNa/yHs2u4c5wzhr
         Fh/ZDM4Iet9DnKyenWwlNRsZo9OeA3LnfjOuO/MU/hawt/guyv+BVKQKXziKwN31S4Tt
         CnXQ==
X-Gm-Message-State: AOJu0YzsleZyM/001BQpNwXOsc1qEOT/9eo+kpSfcfo993gZUQbY+16Y
	Vlh377kZOnwGUdTV5fcdefN0LNnlSeU6FfZL8FwNsoupmzRRGQ1OlpDz
X-Gm-Gg: ATEYQzw65Lmhey2NYH1+oFosSStBW7FsqTrYQurf2d0BFn3FsQOIyTefTOlIkdDSKLP
	DpRQR4OmIVufeAsl1s+aZr/QdvWg+LwgB3PriGq9taJtVgn8N4wf8tp5Bl6hB9yTGpIJyYbOYs1
	UTGOtXBhclb0wGP29FAV5Sulz2Te41q9DDRFPnTzfvN5Xx1r1SN31aH4Ti3Y/qumWmQ2qgQhAZu
	E9X8+BWO/kkPCjHUoR1VNvsmYIwmOUGsEhZer9KymAGsI2V4LDJAqBKG8DcME/bLn7Ilmn6ljm9
	YRb5uU1pXoy5NX3t9ETZgBCIm2inDq/VLLEHHiKaSQBmhsdXZbnxA7wfoxFdxi5VZKE/cU/Xiwi
	+kLSP6LROl4FIWn4CL1vF0fovo5zWI4OBE2enRqwZIcFpOgd+sVyNjBomVYfv/zOHCXlNJMia0Y
	/M954HAee/tZ4jqtC9NIVcTzqHBhNQg9RvK9DH
X-Received: by 2002:a05:6a00:4404:b0:821:8250:8ded with SMTP id d2e1a72fcca58-82972d9ca6bmr2840322b3a.65.1772661630369;
        Wed, 04 Mar 2026 14:00:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm19617764b3a.6.2026.03.04.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:00:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 14:00:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] hwmon: (ltc4282) Add default rsense value
Message-ID: <fe84f756-71e8-4d3f-b52e-cad257fb6f37@roeck-us.net>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
 <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>
X-Rspamd-Queue-Id: 0FE0E208420
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12117-lists,linux-hwmon=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,roeck-us.net:mid,analog.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:17:48AM +0000, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Instead of failing probe when the "adi,rsense-nano-ohms" firmware
> property is not provided, default rsense to 1 * MICRO. This allows
> the device to probe without requiring firmware properties, which
> might be useful for some high level testing.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

