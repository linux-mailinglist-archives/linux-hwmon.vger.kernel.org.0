Return-Path: <linux-hwmon+bounces-11477-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJlDIICme2lWHgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-11477-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jan 2026 19:27:12 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F92B3925
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jan 2026 19:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E8BC3010DA0
	for <lists+linux-hwmon@lfdr.de>; Thu, 29 Jan 2026 18:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C758E2F6168;
	Thu, 29 Jan 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBjlxpT4"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8072F1FED
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769711205; cv=none; b=nhIrEY+LYyCVVqEYnwy8HADuGUOocjzpz263UQc2Jq/AJ6MkmIyYEUYII4A7aNwIfeRNqR+vS8k3+b3APd7apxG/mzYZhID1s41zG7VmEM+g/WIuH1czr6K1mnQ4/0YCWtNbFTkeSGRebZ+5vZqcerDo7Aqg8cta6/cvg2bl0XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769711205; c=relaxed/simple;
	bh=750IC68QXJEbN7HS5fWJu1zjfFuvlcy4ol1eYKG0Xso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Usr3wGPNyqYHZNElf7eD0LagIwg++0TBoUWxrI+l4KwHEr7NKGqMWtU7D2jyWW7sJq0C2j1rHhxWpqIL+h8FiJdCcgbCnhfdniFH7BCSj0Gy1FlXbkGkNjEv1eMZBgG3LYkhEI2LIXBUgW0lYDbDWNHy1yvMDwDniJNevCXyF+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBjlxpT4; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so2695876eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 10:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769711204; x=1770316004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PawX3KzIT+Wd97t0MV3ya2da2NCqSC6KlxI9la8dFAI=;
        b=ZBjlxpT4/lIVWMbXYpKs4prWi42Ajj+lltLFRCXWv+8UuIpCMxKi8tS68PqGkvvp00
         gLfAsJldF0GGnrXkTs7C35d2eBjF6Cl5MeolCji9EzhtiV2ri5EkQuI7La6/Q3M0cohS
         Ivdm2fshCdpnAWEkby3vwaALhCZq5ovpqq+1EbMe8WwKxqCDhuqOYMmbXehKMOska2m4
         BRRzCw5N0hYCapRADOyC5AVz3gUUi8AipeZ8hvinanNVKQjxFF1MIxGjyTeaROTAFrAV
         MvasIJOdhAGJQMznY+0GqhqB6+coP3ez0XZj73dlWZbSACcuEqdQgbdaGP3qjs28lJ3x
         8Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769711204; x=1770316004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PawX3KzIT+Wd97t0MV3ya2da2NCqSC6KlxI9la8dFAI=;
        b=SiB9QQihxMe6Re/XtobOyCNKoLIL7Qzk7wr8Tg3xuwgTJaC/07AHJ0r7g+3LOWOfeo
         vl/Sv5Xjcfrx0ctfd0aupiWlbXIaiOXr/l1kDpIvJRseKsaKhfQRttYwlKe2lEBVVEFz
         7wmENjLBxfAAROvBu87pRidwyZlExiE+Ksr22kHEh/IsqXWDiFytKC/2DMwhyOQpVJEU
         NJH9alDFFieW2p7/dKzRQD+b2HItN5er7WrBE37IqHurYr1rp17fCcxjUPCyUNjZPUcn
         R0wZwlAXjA7fasrdHWG/wL1whRCThnV8rIfPwDsd0E42gVBZs2JxVNxq0ZTs2H0RVErc
         2uKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fTkpJETf/apzWyYRa9kHpBDcozC0+S2ElZUMHGM42f/xuKSeBsEHE+Yt0GurXzHclscJc4BIV2GGsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwewS2wzyWuSFoHPSIuxSnqbd+J7eKn+CqGnVPdE8gWo5HZOs7o
	7wCAqIJR7V79r4lmIllH+a/a1VdEIn8+P4fGaCxeXYWQ7A15JSQDt116
X-Gm-Gg: AZuq6aJpc6USlTmzTHWkuTVX99FPWUoappfSjq2mZRcXV7Cky4/UITjgvjAm0BSJyv4
	q4QYHoUdd53tO9l4c7BoV2d7fS0vqKURB/H2IA5zRaobHs39bOp5fNdTK939SHPYz9vt0FI/8yx
	53xGx2g87JGAUnzkvtCxbPhJMeKDrejVGLmnk+e5LE9c4j+hzRqNHXZ4ILsJN2tywERh4fbWDB7
	h3Eark4VC8H+7jxbcGMgVmMj+IpoOakB4q4ZT5ucveycpTTakuDukkbaVfyPWf84lP11U7S+s39
	nCbddxrxvZjVit6jOT/ecIxuKtYiXVdOi3ig3KeE8n7DJbRyHeVbhLMXwVoakg4ZmZeJpkE0XV6
	cGvOSzDZ2nKhF2JnT4wR0JVH76HbFkkX55VB0yPGhpfZvFzjH7fjwhO4I2w22N2N7fVVQGLkc6t
	3/plxTU2fURiOqTTj8yx2fYg5X
X-Received: by 2002:a05:7301:3d15:b0:2b7:2dac:5853 with SMTP id 5a478bee46e88-2b7c8626756mr159908eec.2.1769711203599;
        Thu, 29 Jan 2026 10:26:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm7912716eec.6.2026.01.29.10.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:26:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Jan 2026 10:26:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: FIELD_PREP failure in drivers/hwmon/macsmc-hwmon.c
Message-ID: <56e7dcd2-2d09-439c-b8b6-82c2a1bd9c5d@roeck-us.net>
References: <20260119195817.GA1035354@ax162>
 <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,jannau.net,lists.linux.dev,vger.kernel.org,google.com,gompa.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11477-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: D5F92B3925
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 03:52:04PM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Mon, Jan 19, 2026 at 12:58:17PM -0700, Nathan Chancellor wrote:
> 
> James, please have a look.
> 

I didn't get any response, so I submitted two patches which should
fix at least some of the problems with the driver.

Guenter

