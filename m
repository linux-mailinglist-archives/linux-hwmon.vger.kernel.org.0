Return-Path: <linux-hwmon+bounces-15584-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bzQULxdXS2q8PgEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15584-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 09:19:51 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B82470D70F
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 09:19:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c8xg32Ni;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15584-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15584-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E7A831C747C
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 07:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEFF3F9F3D;
	Mon,  6 Jul 2026 06:40:59 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1E3F99EA;
	Mon,  6 Jul 2026 06:40:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320055; cv=none; b=Kjqeyo18rPaMmJW9FWXjGy1s3UQTfvhndcpIbV+7yXKxzZCgz22HF9DhPPckbcKZezAQU/tjf3R1yb5iGJ3f077CumvH6+0eMiyfY1TVWdTD6c12agoN9s/ffuLVJ3Tbr+BvF6n1k6L4Hc8mWbnXBMuw+UOslu8b1xHORpPtPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320055; c=relaxed/simple;
	bh=EfeC6xCemxNveVDmaUafIdp2sJnX+4EfPNNYlhqRDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGzGPRwDiu8Izr0465hNP2RXLuiTR8JA+Zkabpp1K7pePXVsk6TxPrco6EH8HYtU7NcTQAFIlxXtTbeEIEq1lKibcNjIZTGHeTf7GiSU6dRjABhLNHXyr6RE/HIEc2uIJzTs2zu3qRzDadDM6iEDbJN1aRovIwawZh8bYzwOL40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8xg32Ni; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D601F000E9;
	Mon,  6 Jul 2026 06:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320043;
	bh=EfeC6xCemxNveVDmaUafIdp2sJnX+4EfPNNYlhqRDxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8xg32Niw4KbPhHwe7xnwd+uNFNpmQV12KbwAmx0QBdNKdX/WM5QTi6BXPNNbu1BF
	 CjPRNDwhpk1QpGDeB7GT55ybj+L6f80Bk+e06Rs0G1R7PSIVBqdmJlpgT73vDDXoCF
	 Dpfe6fk314G4V93Ps23saNRfXBtbPhATzU5bykJHMetFSywBi8G59Dkt3j+c8jWgRE
	 9uOzGZPOeK+LHx8zoC2Kyf36QzRgrRndwGDL/nQXqwZqqqCJZ0ujGkdzNN/Gi42QmB
	 tV/mM4Hxu0GnKTBWNIJI+OxELgpNQqYzQrIifUnc0mmux52sWKtOTrePgNboIZ6trE
	 gZztML2UvHglQ==
Date: Mon, 6 Jul 2026 08:40:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Message-ID: <20260706-abstract-apricot-platypus-b932ff@quoll>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15584-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quoll:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B82470D70F

On Mon, Jul 06, 2026 at 10:08:44AM +0800, Alexis Czezar Torreno wrote:
> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


