Return-Path: <linux-hwmon+bounces-12626-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N5MZFif3v2lYBwQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12626-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 22 Mar 2026 15:05:27 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7662E9915
	for <lists+linux-hwmon@lfdr.de>; Sun, 22 Mar 2026 15:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FB7E3004639
	for <lists+linux-hwmon@lfdr.de>; Sun, 22 Mar 2026 14:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D821030F924;
	Sun, 22 Mar 2026 14:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccZwXLYF"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383A1A6827
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188320; cv=none; b=GTGufxEwHSLJe8bxOslvShbmFfmW+Xmu2MhAcGTLv1BBpzorVhZaAfYc7xyFOOWmM8nZtBBNr+PM+IPdx0o1GSsmnFKppdHY7DFSQ12T/o22N+9lkmsMSztg2ikfyeCPOH1LTQ/N7jf660KOeAUl6keRamL84am1Rs06TTHYsog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188320; c=relaxed/simple;
	bh=75vFBkvIoI6vqFqCec6HoQ1w5edWlwyd7ifZT3aBwMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrHEm7ZZIWoIN5Ql2X61TFejfYQc3O4jbN6zFlTMuMEFl9hNkUs1+CAU2wINsWbfEvuVZqg6Bzmw/sogxi1mDQrjkbGg9c+6M4WNq6nGiXDeLXiZ43eRSkTOc/Z+t5LsWbnOjY4AA26omyLfT49nfwhwkWgfP0XgHASTyVDB8ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccZwXLYF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso958788a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774188319; x=1774793119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQv9bwy6YrtfaGlv0e6dudIE6tB2rEu8MW+MPmM6S38=;
        b=ccZwXLYFriUThKxGtG9kxm+NC6gozl3IHTAQ+/aW6vdp+zCzDcBWLN/KtC1k1JnLIy
         flpVcljRC/WnSp/xar+rp/8oJpPvuNKJyYnfQxRrXJ8eZ1Y2MeGaEzznne0JxlLJjzB4
         EvY1EtUmy+nu/lGSY8CK/su/sYm0fa5FZRwHMreBr//Uiy7eNJ2obUZW2az3VNPO8z0R
         KJGKhs1U0JoKrUibZQauPcHxkIPSpp8xXSnbwWGU0BbfD20c4I5ex6JSwuFS4veYuVbr
         nd6gymKvZulWj9kO/II5mR6jNxbaeajKUwUGcGSK07vvyBHvXPM4l00T1+ocwaRK5m2u
         q5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774188319; x=1774793119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQv9bwy6YrtfaGlv0e6dudIE6tB2rEu8MW+MPmM6S38=;
        b=DQ5a13xjTJScV4Icx0DneGf1YpsY/1gqRT6tHakFOuK22O71RqoMgvfVBr+ia+hoWY
         OsEnKPTCQftmyPlzc0DP0NGvtP28VElJAjLez/XYgq8BMR6gzD9vuWnJCK0j3h0drApH
         AwrrRbblgL0knvuFwO3w9IZTjtGnU5yG1vppIwD3486DTJyHYUZ0ke3p7arrG4Dv9P5G
         y8Jyd6rhBfIN7br0jMrtlgt08Hmk/L4+hjZFpZOWf5ErgynHherZgBPvJnA5EYX9dIrj
         zk43FcCFp66oiVGFLaBFmhk9NBvIW/NVoDJRgTeGMsw2qf6XGqD6jAfLi/woROmYWuao
         T9lw==
X-Gm-Message-State: AOJu0YwjEf2jMi/Zl5dkX3o93hRdO1UQMAHWbGFIZpae0ryBJUQamxEb
	lIPEzWpEryfp6875nSjWI4iv52gArNaDNzNTVFOgWmkDr6Bol/Clig4q
X-Gm-Gg: ATEYQzzG35mWWsDbGu8ZaCPeKjBrAfpRnznIjehxO12YEu84HfgEseDe7fAeCZ7kW3C
	kxcodcQkByETOXpG4x+e1KF/KjcVFX88WKeCCkJ/StKLv6Vjp6z6eckTGPADeloGC1yrmCXgeVO
	JGxX2cCeLvZOiPaHWdos35q2vT+OBfSYsUgjJU/CkjgrIksmLTCBg7wmOFrM71M/vese1XBLtbu
	1MonmDsUCgGhLPhHXJsaFAdL6VgTBOYjI6alIx1PSmRMf58NLTLlH3BJcpsea0NpJcX5zlPJb9F
	audFoI4pvNDNrQTgvgihtx1gVgmccG95J5cmxM7jz9yB8u5yvG2ZgSCqunxG2qjlc3wK4Giy7c9
	ba9IxybvXLm0qpPg4gbgqCpWuo+w3NfGHSDE+1Jh6TuoHW9z3yXDSTPmSd4bM9a94Xjyh7+eWgB
	woXlmHH+OOxwYQoQOWgCJk6hnYQrBWGgk9Uruc
X-Received: by 2002:a17:90b:17d2:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35bd2cda6e8mr7878969a91.19.1774188319061;
        Sun, 22 Mar 2026 07:05:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3eb46e3sm6605510a91.1.2026.03.22.07.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:05:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 07:05:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Hoffmann <markus@thehoffs.at>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (it87) Add support for IT8689E
Message-ID: <ae3e4afe-4128-44f1-a101-77ac8674cd0d@roeck-us.net>
References: <20260320144323.4870-1-markus@thehoffs.at>
 <20260322103301.18112-1-markus@thehoffs.at>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322103301.18112-1-markus@thehoffs.at>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12626-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F7662E9915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 10:33:01AM +0000, Markus Hoffmann wrote:
> Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
> newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
> PWM frequency 2, six temperature inputs, AVCC3, temperature offset,
> and fan on/off control.
> 
> Give it8689 its own GPIO configuration block in it87_find() rather
> than sharing the it8620/it8628 block. The shared block reads
> IT87_SIO_PINX2_REG and either marks IN3 as internal AVCC or skips
> IN9. Because it8689 declares FEAT_AVCC3, IN9 is already marked as
> always-internal before the GPIO block is reached; applying the PINX2
> check would either create duplicate AVCC labels on IN3 and IN9 or
> incorrectly skip IN9.
> 
> Also update Documentation/hwmon/it87.rst and drivers/hwmon/Kconfig to
> document the newly supported chip.
> 
> Signed-off-by: Markus Hoffmann <markus@thehoffs.at>

Applied.

Thanks,
Guenter

