Return-Path: <linux-hwmon+bounces-11944-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCojGYa7oWlhwAQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11944-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Feb 2026 16:43:02 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 072281BA19F
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Feb 2026 16:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 565F230D14DD
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Feb 2026 15:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D221243E9F6;
	Fri, 27 Feb 2026 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xe3dZhFN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503CA43E9E4
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206452; cv=none; b=BuGoD8BFWCIzGXHsphJiVG00cJCiRCGvs0FG1kn2Z7FYDaOJQ0Cq/Trvh+T8jiTz3KKeIJK5mzX18fgGoDRIH/vi5E3lSYWBabMUB0tElW7n0nlq5nrUh3W7g9soENm+GmJyi0u9Yj8bqSK1GNUlNkYUn8OS1MVUfVT7ikppxxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206452; c=relaxed/simple;
	bh=Q5M7jajGD8mocuB5vbEVGa2RaWXjdo/7DN4Gts8cvcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufMYgtArniVdIqn7Zw3XYMm+nyV5GCnp4gzdvqkInaT1RfAZ9nP2YHEnRW6kVNr3U6kEw/N2RrVtlrw4FpZRqKtz6IoJ9sIUMt4ICyJD9au3ncnALWiQ/XAnVOGvZxzYM/CgvZtyR+KnYOX3LuWuRbfL8/XxXciKstuBocWrqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xe3dZhFN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9DE404E419C1;
	Fri, 27 Feb 2026 15:34:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CD0F5FE46;
	Fri, 27 Feb 2026 15:34:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71B41103682F4;
	Fri, 27 Feb 2026 16:33:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772206444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=om+ILXLhJC6eYOYq4v80L5Ebke/E4rCiLTomLCU79aU=;
	b=xe3dZhFNZPJfK/ipyEgL/hl+RZ6s6mu2jfTK+6HdWISCrUVTjenydvYCx/gIm3pNL3CzRk
	CA20q+EDUMY3NHtb4jXUgZ8JLkOxZ4CRylK6BuHcj/WLLF84RPvPXLFgdMamlhqwA3ct0M
	wIpr9Hutk5Jhdfxa8lytUOedg+cg/ygaDVjamStXMOrdpzVwJgABOB2bQILoIl+Hi0fXNl
	dUcxKndFAS5eQ2pAazT0PVihh7qP5ZxKmjoRiKPwSNyrF3zA2WFIj2A//epCj1JfXr8siX
	hECAYH3tCX7sJUFg/dari92jFbrRHm8O7fSMMa5fIeeX7Y12oTNzE/LONKeUQQ==
Date: Fri, 27 Feb 2026 16:33:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH] [v3, apply after -rc1] i3c: simplify combined i3c/i2c
 dependencies
Message-ID: <177220641632.201056.5029746753419046340.b4-ty@bootlin.com>
References: <20260204164216.544409-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204164216.544409-1-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11944-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:url,bootlin.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 072281BA19F
X-Rspamd-Action: no action

On Wed, 04 Feb 2026 17:41:58 +0100, Arnd Bergmann wrote:
> All combined i2c/i3c drivers appear to suffer from the same link
> time problem when CONFIG_I3C is set to 'm':
> 
> arm-linux-gnueabi-ld: drivers/iio/magnetometer/mmc5633.o: in function `mmc5633_i3c_driver_init':
> mmc5633.c:(.init.text+0x30): undefined reference to `i3c_driver_register_with_owner'
> 
> This was previously fixed every time by marking individual
> drivers as 'depends on I2C; depends on I3C || !I3C', but this gets
> tedious and is somewhat confusing.
> 
> [...]

Applied, thanks!

[1/1] i3c: simplify combined i3c/i2c dependencies
      https://git.kernel.org/abelloni/c/663eb8763c25

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

