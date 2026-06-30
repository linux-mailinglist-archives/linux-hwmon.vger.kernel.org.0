Return-Path: <linux-hwmon+bounces-15472-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZjQEKdvQ2qdYQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15472-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 09:26:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D09BB6E11FB
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 09:26:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kIkLS++d;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15472-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15472-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AA8E30067B1
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 07:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9095339A040;
	Tue, 30 Jun 2026 07:26:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC18394797;
	Tue, 30 Jun 2026 07:26:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804387; cv=none; b=jNSCZqLS1G9DkCkUXZxQNLI6CGrO865bNjWINPov4TD9S2pu90pNrVpatCnzfGwadrVGVj4/VqZ1eoK8ozWkKnCl26Nk2NA/hjd2RpHn5injyvKLxUtOYdo/yHaZZ4dJe0PE7+sw1VP5DcjbDNhmrlkqfmSsu/QFG8dO+XExyLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804387; c=relaxed/simple;
	bh=4Qykl1DAzexPzA14pjSagYez6F0f/KCIu6wyOZjFuwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDoadUXvZ+CisBX4lYHWkTPNv3LSGDh4w/GXlmi6PEZUzQKQ0OAJlMr8m1cq482L+FDgnIy2OEjv28E3krOwa1Waa+CwgXbKoWJ81kL1A6wkgnCfZy2EO7F3qq2mMx9w7PcEiCB9MGaJ7gprhAbrFZ1hUrL4ci/sF7rk13LkD5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIkLS++d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD771F000E9;
	Tue, 30 Jun 2026 07:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804386;
	bh=jxaNAkivZ1AVZW+PKQW8rZahuz3xPS1ieWwF7Eg9Yek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kIkLS++dnq5uONRuP5/hadR6FUC1ngfBC9zPyoJapY2xWLccOuHhezeJD44qUjLs3
	 VuIfvHz8gvaSL+gGqCyeYw8Rl6uD8+N+LouAYfrV+M2e92mYSeWYOq1zFBSZLX1ALi
	 m3wjqXbkkcjUXyRUa26U+/LZHq6fER0UKfKSl3ptBMhEmhfqLuNULlPEKIcwuTTc5J
	 lycOJTEvTe2Ek2fMSb+HR1sk78YjpNnuMC/YbRsKo6bcV3dOjtodTumq0HbaRxEBCx
	 PKqDqx2dVhvPyUhk9Kx8ZOmObd0qlunMSrMahjdFP7FtvqxPxYPpqGi2SDtDUZOgL6
	 0fw9yTjPwU+iQ==
Date: Tue, 30 Jun 2026 09:26:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
Message-ID: <20260630-cuddly-quiet-jackdaw-b7ab3d@quoll>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15472-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,analog.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D09BB6E11FB

On Tue, Jun 30, 2026 at 10:46:43AM +0800, Alexis Czezar Torreno wrote:
> Adding a missing entry for the MAX20830 EN (enable) pin.

... because? Device has it? Was missing?

> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> index 1625dd59417f1b3ca689a9c86ca266da913d1217..ab8f6324866f29de8c66c3c63300845b2e02207e 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
> @@ -39,6 +39,11 @@ properties:
>      description:
>        Optional 2.5V to 5.5V LDO input supply.
>  
> +  enable-gpios:
> +    description:
> +      GPIO connected to the EN (enable) pin.
> +    maxItems: 1

Make also the example complete.

Best regards,
Krzysztof


