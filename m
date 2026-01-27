Return-Path: <linux-hwmon+bounces-11414-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB5ZOsAFeGmUnQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-11414-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 27 Jan 2026 01:24:32 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B908E76B
	for <lists+linux-hwmon@lfdr.de>; Tue, 27 Jan 2026 01:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07B8B301BC1D
	for <lists+linux-hwmon@lfdr.de>; Tue, 27 Jan 2026 00:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1231A9FB4;
	Tue, 27 Jan 2026 00:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f35izipv"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474901A256E
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473470; cv=none; b=DfiGAdtBfbStxTOaADXk1Ulg5u+thKqT7u6IfoXzWNdjZhYkuf+sjzYYCLKfxgINE0JCvReYuUGraxP1pO5M1qO7TsmoBTf1xHgJ5SaCwdB/M2ZKxsc5KESXrTjpkcPeYrMWeMqzGt1IrT7y5qcZvzsX3CDI5NobbRUvoI6QP2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473470; c=relaxed/simple;
	bh=ACpZPpzSm6uu6fLQoYPtsLzX6esHERNtAJ4I1LSnkgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGyMw9kzwETh0E9IKDZG3xNQeWo4AzfjS4o6ksMJY9uKUwXUx9p4Z7y1DAIlrVJ2H7zgU6EHSPQMbTT8C/+BDC6BQvvtNZR0yMGIk0dVOkoRB55MKhRX6OMWnNz1Drwz4LUCKLMi/40u793I6SV+YjKymmsP/SAREzhIDGkMFcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f35izipv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso2731153b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473468; x=1770078268; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvE6c4On0NDkZlHYWRtTJlRv2fTiNlkcBcwXsGT/WiQ=;
        b=f35izipvDbdRZKiL2Z2RCpAn8YBJbiTmmWChjXlo5CiUMW/tPPjUFIBHebyGETlYOM
         ETEnagYRicXfpKKcnEY1u4x4CFuVuB64m+TLf+19oz2hW7/3Pu5ceOH4qCn1mjTNyY4a
         /KTcoY1CEAxdu1uA2Nar403I/4M5XCuqLCO2iHo0lFyZIxkiqXzZScNpDDpqRskSEsKu
         t9Zl4loriMSImwxp5QwH2ahII/rF3Ju3/DwhVO3AtMMnolHM55aRtmF22rx7mQ10TwSh
         08euR42cUBoicU8QXPMp5tGcQKrtAhtkYvbWLIfJeOa/5gWD+B4EbbFFBXC63TPtYOk7
         6BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473468; x=1770078268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvE6c4On0NDkZlHYWRtTJlRv2fTiNlkcBcwXsGT/WiQ=;
        b=h0JkwZACs+MBKfbSXjVVlMVaEggbOZg4bwxLrSFD6y56hHydBKPlKKbJfBKpkhMvfV
         oqo256zKpprowA01ju8WsebKCdhHjike28RGhR6vqPb/cV2b5TH7+bG1bsR+gg1Vs7iM
         XsiIX5RIaYGBOC7J4a2yWMW8tRb2O3J2oah4TUDMg0jdizBczgYlq9xHm5+iBnteOs1R
         kq5KWRvPkNnVburBC6mxbz52g3KUwiK6p79BYyDcXxZyEHsZvT9vpDZeIiUnU1G6g2yA
         2ag/MVX3EigyvkWFcWHPBckpGU1dLgIGXn16HQ7EJenhwujbqF4M/firbFw3SD+ibRqS
         GGYg==
X-Forwarded-Encrypted: i=1; AJvYcCXMOn6yWaTEwiHxA2qMDMfi3RuBdEPVUyOROVKcw0gigs7qvBGTk3/bprCgmhkU0YT/Y4K+1V4qFFqSow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiTtv3BSfzQsVc3uDUifylYsyqW4Xb83+Y/mPh+3VO6wdAzUA/
	ZBhusQBloWAj0anCsr8KhhIX57gh10eH7FTwuIuYUUdFmwpIF2Te05ja
X-Gm-Gg: AZuq6aL1IOXjFmo0YUu+QM5B4WF3Br8yeRdjl26URLNgKNa0QU1Ceo9xb0bPawM79aq
	69EiMKx4vq9AFR3z2093Hg/NXdZ/X3S7qmzSOMiDU0MJn14dr3CgWe7LJgQEsNfF8XIXWu8bwG0
	W1FutRoRdrm129wfPBYEBLpDmQuUTBfNDrI3kk/QGK2L/JKkdZ/6ftHm3VJtv6bAVjNhkMiQboM
	/k0F2ocG54leZVEqHZJdQjvN9N2XJI1JmYDz6IIqMimSkbkn72mC/5OcEbY7+AshLsZS27Iyq8z
	a9nII3TVf4Jf9ompJHgWuGaskb2DwCtLon5/E54uf7lZCN0pcR68s2fZzoTxJwISq5KeTF7yvNg
	owHop6vGfDCoDYwnHHcFXrxRwHwxSVnbR13q+C4FgMxKRuAi2O8vsBno/83Ik5XZkf4EbqQ0/0J
	ZGASBGYhaiHgeTZnIUtQYxMeAi
X-Received: by 2002:a05:6a00:2496:b0:81f:3c77:a24c with SMTP id d2e1a72fcca58-823692f3e1emr3516b3a.66.1769473468610;
        Mon, 26 Jan 2026 16:24:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231877005dsm10131115b3a.68.2026.01.26.16.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:24:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:24:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (cros_ec) Add support for fan target speed
Message-ID: <f8cfde51-a2bf-4718-b9d4-064a4375a057@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-2-77eb1709b031@weissschuh.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,weissschuh.net,suse.com,lwn.net,howett.net,amd.com,outlook.com.au,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11414-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: 59B908E76B
X-Rspamd-Action: no action

On Sun, Jan 18, 2026 at 10:45:56AM +0100, Thomas Weiﬂschuh wrote:
> Use EC_CMD_PWM_GET_FAN_TARGET_RPM to retrieve the target fan speed.
> The EC only supports this for the first fan.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter

