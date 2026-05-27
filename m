Return-Path: <linux-hwmon+bounces-14559-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGJWKABAF2qg9wcAu9opvQ
	(envelope-from <linux-hwmon+bounces-14559-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 21:03:28 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C85E956C
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 21:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35E8D301E6E4
	for <lists+linux-hwmon@lfdr.de>; Wed, 27 May 2026 19:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E89136165F;
	Wed, 27 May 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLUCjyW8"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62C360EED
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779908605; cv=none; b=umUEm/XZOCCBUPwZRmoT3Y+o1C47U6UfM1jsQqNvg+Hvz9VSy9EYj1ykABdFON2AcOImrOwDhy9xpQZyMj50wa2/P9P+MJ1Oj9rueDCoaYds0zxR4VWByehcJeqTH6sDHPOqhmo/pNsTJeAk4I1dSsc2WF7NCuG5wZNzFlP/w5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779908605; c=relaxed/simple;
	bh=37y0W+B6o9/Zavr1rBFsYH/t+H6wpJ0J/JRIMqFBYZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hbAnXFg2WXKXgMG3kGKi26+cO76pI5iwMZ4KK1eA/pCpCq08x3kRbFisivaS9ATFfn0MLUodrWwrWOTsnKyPCLQgWS08yv9jXbRCkM7p7VPOnNt7Wh5f03XCNmLa9rGUkUot28siucQ1ksS608Fq1j9SUr9fyd5vekpC04LVtbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CLUCjyW8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036C61F000E9;
	Wed, 27 May 2026 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779908604;
	bh=i70Nbpqrgbv46DzAkYEUe+L25M8dtD7xnsWbX79Gw9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CLUCjyW8258DZL7cXeeHdZihLDch63UCoQ1P4tqFXWNQI+0t9dfKy9TFwzSP4lbe1
	 G9H0LOPOi7cq4hMVdVR9TpnViEvMURDSGpCsYb4836RXcRU55LJM1HULjBTRM8eTWN
	 hM70tUGazv3LYbMNH4STm50Rd/heWS8QHaJAic4+6yEZEFJxnd988qBgF7HN9/xKa0
	 qiJ/03mdX0/cl9k5ZpoL1QyQqny9pfzCiVa9S6chB/jhZ8Lo3kez+UCrM00lcMN4GI
	 Yh0CF9t9a9cO0htnIJWO5T/kCDp7QGf5FNoJJ541gk68Oyw1L9pK0vgM5NewtfY7F8
	 Z3dQ1wI7wIL6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wadim Mueller" <wafgo01@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260527184257.141635-2-wafgo01@gmail.com>
References: <20260527184257.141635-2-wafgo01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 19:03:23 +0000
Message-Id: <20260527190324.036C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14559-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: 294C85E956C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Add a new IIO channel type for liquid volumetric flow sensors.  The
> unit exposed via the standard _scale attribute is litres per second
> (l/s), so drivers reporting smaller native units (e.g. ml/min) only
> need to set a fractional scale.
>=20
> Update iio-core's name table, the iio_event_monitor whitelist and
> the sysfs-bus-iio ABI document to match.  The new _scale attribute is
> folded into the existing shared _scale block; only the per-type _raw
> needs a fresh entry.
>=20
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527184257.1416=
35-1-wafgo01@gmail.com?part=3D1


