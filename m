Return-Path: <linux-hwmon+bounces-12227-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMOPC5XPrGkHuwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-12227-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 08 Mar 2026 02:23:33 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B922E36F
	for <lists+linux-hwmon@lfdr.de>; Sun, 08 Mar 2026 02:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12895300B9E2
	for <lists+linux-hwmon@lfdr.de>; Sun,  8 Mar 2026 01:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9615239086;
	Sun,  8 Mar 2026 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me2lUvWG"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD08022156C
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Mar 2026 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933008; cv=none; b=VLbGZ0WbmtEloTugcpkccX51SUd7g1Z8i3Gc7AnGD89EOSUhP1BN5hOJJzQHgOGbQ8WK67TYQ2NJ/GcK2OPrzizny+0L80W/tgK2av4AYQn4zlC4aavuyTjpGGEZv6VEcJXofogTd5fAKM5qNqGpFePZE//sDMRbfHNtwws41nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933008; c=relaxed/simple;
	bh=/KflZQVjTtJECEQDAj0F1qws+ZnU1zdDARVNbScMHhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/e+5vY7TT1GMpksSQ+BaRrDlsNXpP2i/g+DUFacrSPAB6RkuIVrRJxE9j8MXNFFIVzsSz4Cw7iTKUMK7d6M0eQ0kHGFABARMlrKEKQJTnQCeGhn7vI69mIBdyjVZywl5WIiFSO/dNwllyUgqjpBjsz5LX/OXK8WJnUp2++saT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me2lUvWG; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdfc4b191fso5947841eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 17:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772933007; x=1773537807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0JSWqX4NLtjZXPnsezrqenvttw/tjNE/yE1tMNY2MY=;
        b=Me2lUvWG5/JxKziZr1rLaI0kkZTwPeTmI3uIxEvAW7xnG/r6IldoOvn8D6h4G/tkJ7
         1xSu08qZ9m4ncIta0GvaafIyKbc2pTo9DKAZjVYYYiCWZTMCK4IRQrIVDK7tTLNCgoNy
         EDPY6lBYQ3Aqj+x+VfiaROdsFPjZk9iDjsdugfi+dsn3iNaIm2934gXbKuHu9n3OC7cs
         XThT8ZSXMhdJpTZommF8f0syXgXO+lUIpFHptbLyS8qOpRu5pGcRpOFcx/x2W8Lvsz4i
         ynWMWVNhRn6SdhPKWgfQ92W/OulDwc0TBUAHCJjJnvDBzCsMcCTjeLS2RIovHo1LkVSe
         YydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772933007; x=1773537807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0JSWqX4NLtjZXPnsezrqenvttw/tjNE/yE1tMNY2MY=;
        b=G0uQ47bhziJ5hfFqmMkgQf4NTamRfhrcepr5YExtBwV/8kDoZXP4YJtjMI8waZD8yc
         l4ofr3T8K5B7Dfc3DBa683WkrIxdKBWREBQAiRQiwIlCzMQktFyW9nWRTxl17Qdhm+ns
         yNPuJzQrsu2mYvAZ0g25Ye06U59LJBIsxS6erIL5V+xHbTjDxRSXzRBUUhQQvtwZGAOO
         l5MEOooJKFYy7VqkXLqP3y2vvUHwa0WtZrj4adV+PXS2szZ8mVQUgen4xEWKz9YKNoNM
         +eH0xItOustrKx5ml9yXW2zyVPkf15fsuhmgj+yIKScIbRQdhaGD/Vy/52L26ky/7WJ9
         /eYg==
X-Gm-Message-State: AOJu0Yx8KPpblDWIsKJL2vIklA9KXYPAGLN90IQVnMMOf1gU3Uv0ahB5
	wiTS4XJQutu/InHAszWWkBQQBrOgygwkMHxayUUFF/9m+2tuFaFOxza3
X-Gm-Gg: ATEYQzzBIv0silWoZFF0WrpCcKWVd/g8nPYol2gRW4yl0d0JY/N2UG/tpNcYCvz0laL
	Tb5kLGLwN2YJNWZcSx1qdEYNJ/hMQZGwpQhbbG+ny+7xKnTKzqIcy7Zh74doeqhLQ18L0LDAFrF
	671mHKvQbDe2ITkIdpqKOB52zmdXaLjgd2FF37BHgNV+Mgyrtr+lfZca+KVEMhA1lDwmeySakDQ
	G5T5wSfW15Tt97TvpVNb5oo2imfUQQ03ZG3sxYpoxwkLYTrUZJVXk4b7SZXAnDQMuBp/0qxPgpV
	sOYSfRaQS+GSfaWaEKUI7C6mGdpFm4YHGU5iWjlHp5xODAPDD7CoNpI/JFxEybqH8SV/mMWKG+u
	RHOBS5ZRxVq/LGjTP+/0v1+P6MUecPg4TS6M3FsJbX3XJHhfCf3UV56dR4xmtiXu1DS43pTrB4S
	Tgl2IfzVRSI83hyn4xXhNhZrgRbsI96UCX56ed
X-Received: by 2002:a05:7022:10a:b0:128:ccb7:7fa3 with SMTP id a92af1059eb24-128ccb780c0mr1547702c88.34.1772933006693;
        Sat, 07 Mar 2026 17:23:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d7a2aesm4212774c88.7.2026.03.07.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:23:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 7 Mar 2026 17:23:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>
Subject: Re: [PATCH] hwmon: (ads7871) Replace sprintf() with sysfs_emit()
Message-ID: <5bf4e910-b4a6-4d4c-a2da-6ee497b56b5e@roeck-us.net>
References: <20260307083815.12095-1-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307083815.12095-1-tabreztalks@gmail.com>
X-Rspamd-Queue-Id: C69B922E36F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12227-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 02:08:15PM +0530, Tabrez Ahmed wrote:
> Use sysfs_emit() instead of sprintf() in the sysfs show function
> voltage_show() to comply with the preferred kernel interface for
> writing to sysfs buffers, which ensures PAGE_SIZE buffer limits
> are respected.
> 
> No functional change intended.
> 
> Note: Not runtime tested due to lack of hardware.
> 
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Applied.

Thanks,
Guenter

