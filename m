Return-Path: <linux-hwmon+bounces-14569-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHU9FMMVGGrKbggAu9opvQ
	(envelope-from <linux-hwmon+bounces-14569-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 May 2026 12:15:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526B5F064F
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 May 2026 12:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7555C3028F57
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 May 2026 10:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E853B27DF;
	Thu, 28 May 2026 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VT0C50l0"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB687262B;
	Thu, 28 May 2026 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963266; cv=none; b=CXMfwGdNsxbK1WLCWuLPpuKRKmYeo8eF1wu109oPYcrKFCNP01ZOrMh1kNv4cWVUimJLkY3AbpIup2Iqz9wiHWPJVYedKXYNINaQbiOKFEo6RCxWq+BS/JkRLK8EKXssoP2bJW4hoBTKrMtBqwz+gj9xWfWnMJD8Dyf6DhGXt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963266; c=relaxed/simple;
	bh=4Byrmud2yM3VWfh68fAwsWNf+5I0o5F2UNErPPBmaCg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjQsXi4Wyi7zV5aSGDYya46T3KFx3s6FRRcDu0GLtSLo/gWrl3eXyCwHUIZIYmqKQtZxvvPofko1UFPIGvLTC8DdXsuYykf8ckz0bcvStrLlZeQ9eYYdEnYapJCQSw3P9E4S3UZwBoe6I77Q/rUwJ+h8Gia/mSQYKsGhBZvH+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VT0C50l0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49AE1F000E9;
	Thu, 28 May 2026 10:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779963265;
	bh=zySNcV6IIq6WZcRelixQSMN0kNWC11wboInm5MNdLXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VT0C50l0Td/WeSZBrvJjWSpbrmHtBl1blfRX9BK+KmkPOlYOhdFzA35WAn8dN7wvr
	 iNj4x5jzYmZ07CucxQzB/yII/pW0ibyjJmlj/7/c257hKfnSjXpUobwaYo3JEms+El
	 dl7+ZKQIsjKq3fIsYUglAwKy5Kw63zTgRAOcQEOgVRz77ubXoViBGx2IbZjzyTSZ5D
	 ZgqiR0hoBRAqyz4bpBfpC9W+f6WfIGKf1CT0poIZEt/vS2TIDMVRbHPyu3yQ9TjyoX
	 emhakkMa59ZvYkF2DmbEaB0C6aUEAOyq2Ct35ezZtW0DlZspugrwV3udUda4df573o
	 TPn7Fr0tiXYGA==
Date: Thu, 28 May 2026 11:14:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare
 <jdelvare@suse.com>, Andreas Klinger <ak@it-klinger.de>, Lars-Peter Clausen
 <lars@metafoo.de>, linux-iio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Maxwell Doose
 <m32285159@gmail.com>
Subject: Re: [PATCH v2 0/3] iio: flow: Sensirion SLF3S liquid flow sensor
Message-ID: <20260528111414.5866b0e4@jic23-huawei>
In-Reply-To: <20260527184257.141635-1-wafgo01@gmail.com>
References: <20260524205112.26638-1-wafgo01@gmail.com>
	<20260527184257.141635-1-wafgo01@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14569-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,roeck-us.net,suse.com,it-klinger.de,metafoo.de,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0526B5F064F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 20:42:51 +0200
Wadim Mueller <wafgo01@gmail.com> wrote:

> Hi all,
> 
> v2 addresses the inline review feedback from Jonathan and Guenter on v1
> (see https://lore.kernel.org/linux-iio/20260524205112.26638-1-wafgo01@gmail.com/).
> Per-patch replies have been sent in the v1 thread.

Hi Wadim

Please don't send a v2 in reply to the v1 thread. That's a good
way to reduce the number of folk who read it plus end up with a complex
email thread. New thread for each version.

I only noticed this because I was looking at patchwork.

Thanks,

Jonathan

