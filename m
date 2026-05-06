Return-Path: <linux-hwmon+bounces-13796-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGrAIJXd+mk2TgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-13796-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 06 May 2026 08:20:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEC4D6860
	for <lists+linux-hwmon@lfdr.de>; Wed, 06 May 2026 08:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B4ED3012BD7
	for <lists+linux-hwmon@lfdr.de>; Wed,  6 May 2026 06:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE732E975E;
	Wed,  6 May 2026 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Y0Js75dI"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A97262E;
	Wed,  6 May 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048400; cv=none; b=V4bo2Ex1BUmkUhbzpa/+JDMNAoHQQCV+y9B6CdPr6hf+v1pgQdWGudogeLbVSem+Fz7o1kvlIIQrUkigzkzel5i0ukGn3h/JrMffATpaGOl5B/IhWodPLDLwpdiXNdKyjHxdCAFplVfPU12rC/c1PmN3HPsO5vaOP3cMVZMRnMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048400; c=relaxed/simple;
	bh=OAR1MXoDX3oDzJIB2viWM1MLByiBueRmSn1HrDL8EYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbttrLdAV6hcCTSph/40Sz33rV6EBRRVCTWY2ft1ygIEjHjkkzs9kKCfVUj7KqH5JhuVXtCtFfI20eBioHHrFNEGkXVlK34fMd5hXi/W6YZRahINJKDYdTjvF+2ztZY2QKnP98Wh/kSfYThfgj16fq+IJr/c3oRuCkyWzoFcaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Y0Js75dI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778048397;
	bh=OAR1MXoDX3oDzJIB2viWM1MLByiBueRmSn1HrDL8EYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0Js75dI0oJ0pebRI207JBKuCTwaawnfrauLc9KJMotV55BmV+TtegqPZbTdAYBC6
	 VmbLbqBUx//PeizdnMllWAD9b8zzGsQfCMRJZ1cbbs5QTrdJqEmS4Cx5rtQ8r+xCKy
	 0UQ2gC/oNtH4B+CP23+QzFlpLFnTnazehKzx1Jz8=
Date: Wed, 6 May 2026 08:19:57 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, 
	Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] hwmon: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <12d0ce1b-9d64-4cf6-9588-1f58d162bde5@t-8ch.de>
References: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: 02AEC4D6860
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13796-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,qualcomm.com:email]

On 2026-05-05 12:29:22+0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Thomas Weißschuh <linux@weissschuh.net> # cros_ec_hwmon.c

> ---
>  drivers/hwmon/applesmc.c            | 2 +-
>  drivers/hwmon/cros_ec_hwmon.c       | 2 +-
>  drivers/hwmon/intel-m10-bmc-hwmon.c | 2 +-
>  drivers/hwmon/nsa320-hwmon.c        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

(...)

