Return-Path: <linux-hwmon+bounces-14562-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id leKJJhenF2qhMQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14562-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 May 2026 04:23:19 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C0C5EBC00
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 May 2026 04:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF6E2301A31D
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 May 2026 02:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8892F290E;
	Thu, 28 May 2026 02:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVtZFX0L"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DB1C2AA;
	Thu, 28 May 2026 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934997; cv=none; b=hfSQAhNlUr8rP9c5okUNgZ2LHjr2VolwenAVb8G/duTKXcnD/gg+7URwPf1IeojZ/69NjHeoNMjW9EL7OXWfxmpBXP5ZjzzXkaHjma54KYDTiclFqAPv5mtJ4W+MJu4/u7amn+xNHAW9y9BQNmyn6rnMGzGLium3Vfjpck7B0D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934997; c=relaxed/simple;
	bh=MC+x+70D8fUjvGVpIpYilBHUTcQOT2NKmJQCUcZJgxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4rDSxsPCX5NjGo8pjpLwgyCJWLW2TLVLpweV1yO6XvrsHHPpBIjMfZty4/mWmmJpukVGweD55EfzA2s+phenKaCCCBYGyfkiCPCn8FgThWFAinacAcR3Jjc7DLv0tj0QFTJzLJE8gjpS9OxBJwifoyrI5ySUg2ireU05AuYrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVtZFX0L; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072DC1F000E9;
	Thu, 28 May 2026 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779934996;
	bh=A3FaJsgRV2sRxxDAP0ksoOqAypsCUyBurlOfHLIkNTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AVtZFX0LLaEgLG02gUTOo40yF/9Rvu5HuxkhJ4IemedoemG+gZmUU93G9UFTEKUdF
	 +wp8QfHo3/aHDjG5bFRQJR4pYr5i0MNilqxIDVZYaq+PCwqs6maXtTA6xaFwBjbptb
	 StrjpHdETXCGfQaONEE0OKpxpaFiZ2gyzLYgQ3er2/ek/bAlxtluq0pGdvy8R6eTZc
	 iEutDs6q2CL+K3nfBTUOY79OatLEmj+jaOBUx6FSRoWxECROR/Zf8mJyQNJZ3pwJJE
	 9wNGyU5Rlozj5t04xViRji4RcRkIZ4sfuTIqSX4lic8AjYUOi0yfgpMuDyzli/kZ3+
	 UhokAuCc7V/EQ==
Date: Thu, 28 May 2026 02:23:13 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <ahenEcZYF8d7Xsam@google.com>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14562-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 35C0C5EBC00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 05:15:52PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and use named initializers for
> .name.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

