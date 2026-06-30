Return-Path: <linux-hwmon+bounces-15514-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UT2PHlkzRGrkqQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15514-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 23:21:29 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADF6E81B3
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 23:21:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=FcMWE7Jm;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15514-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15514-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=weissschuh.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76E17305079D
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 21:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E75F2D5C7A;
	Tue, 30 Jun 2026 21:21:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FC219C553
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 21:21:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854487; cv=none; b=cTU7bEgg98K/qgg65Gz7qrYwsdPq8dAR3LvQR5wN8mgCa0GrC0MFOJ7gQasnon8bUoIUvwZDkrmZOx9lRBX2a7OUnARHfHQy8eqHgsoVy0sj8qQvM4yj4Ty+TBTzWv5k06zAhrD99q7AY6DDCfXQWkUq2ZqzrLzto1XkpjHDgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854487; c=relaxed/simple;
	bh=FRMd5OI4LJv2i3m9weFAH1wMNxpiw/W4YgAGijey6+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeStlHlA/SMHLgUb84lHaB8eyp3fz6ogfqlq9iRVnZfSAXrJahUouCy1VdCgbEQeGqfzduzbJKSBI1SYnN3txnRPC+HgRdn4x1It0V30R41GZIpA2e/10L5l6yNI1+tiiG9Gg7L7ukBrsidddAjmpLm1nMBdmFWZVFGaETYaU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FcMWE7Jm; arc=none smtp.client-ip=159.69.126.157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1782854483;
	bh=FRMd5OI4LJv2i3m9weFAH1wMNxpiw/W4YgAGijey6+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcMWE7Jmm/ju3EsDCHhj9O7xY3HSukMgCMpOdBp5csGrzlxlHVnBPznF+hXo5MAiP
	 VIQ164efTHu5O6Dp53FTQ2eGLiX/InwNNh57j/facgUSLTt+5Tmzr79KzzdWeO92NS
	 51qtZ22ckzk3pw/+akolOR25G+m1phQIyNtkm68E=
Date: Tue, 30 Jun 2026 23:21:23 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: linux-hwmon@vger.kernel.org
Cc: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Message-ID: <5e04ce9b-61b9-4ea8-bb2e-1563c88a1dde@t-8ch.de>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
 <20260630211028.69BA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630211028.69BA21F000E9@smtp.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15514-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-hwmon@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:from_mime,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17ADF6E81B3

On 2026-06-30 21:10:27+0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Using `BUILD_BUG()` with runtime variables introduces build fragility because it relies on compiler Value Range Propagation (VRP) to eliminate the branch.
> --
> 
> commit a22cd7f1036247302ddc232e1cbd36ceb641e202
> Author: Thomas Weißschuh <linux@weissschuh.net>
> 
> hwmon: (cros_ec) Handle temperature conversion overflows
> 
> The calculations converting between the different temperature units can
> overflow, resulting in incorrect data. Detect these overflows and report them.
> 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 44291799dd8e4..4b402142b46f3 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> 
> [ ... ]
> 
> > @@ -150,14 +152,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
> >  /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
> >  #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
> 
> [ ... ]
> 
> > -static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> > +static long __flatten cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> >  {
> > -	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
> > +	long ret;
> > +
> > +	if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
> > +		BUILD_BUG();
> 
> [Severity: Low]
> Does the use of BUILD_BUG() with the runtime variable temp risk spurious build
> failures?
> Relying on the compiler's Value Range Propagation (VRP) to eliminate the
> check_add_overflow() branch can lead to broken builds when compiling with
> CONFIG_CC_OPTIMIZE_FOR_DEBUGGING (which uses -Og) or on older toolchains where
> VRP fails to eliminate the branch.

CC_OPTIMIZE_FOR_DEBUGGING is not a thing (anymore?).

This patch passed the 0day build farm, so all relevant compilers should
be handling this correctly.

> > +
> > +	if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
> > +		BUILD_BUG();
> > +
> > +	return ret;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net?part=2

