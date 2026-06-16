Return-Path: <linux-hwmon+bounces-15171-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4v5eGFd0MWr8jgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15171-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 18:05:43 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E6B691AE1
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 18:05:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AtKPOqRL;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15171-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15171-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64FF530486F8
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 16:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116B2466B44;
	Tue, 16 Jun 2026 16:03:56 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16FD44DB64
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:03:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625836; cv=none; b=TVcya6RMO+57T3LOtLLhxhoLP6TjodfEKYkHVpJp9pAMk+HiES7seE6IqaToYtPkIzCiP0KaOHTG+g9GRe3cjfTbhNzYGyGC4kCcYoAc+HSHUXt61pK0oUTtOc4V0kb616yLWNg55aCxHJoQewYsGFTMPx1dhjhZprebMN0sDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625836; c=relaxed/simple;
	bh=w+HrTFr0z+tqsQh2Xdwmp0XrVFet51gpeHWW0S6I9aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swduI/2OmkKDfcjeMbEWz8Uru3ShPIbefaWqNsIptgLtBF8zlk7Vo3Zh7G2GmbXynaO0mkx77kmk6bqgt9E3jPHVTFbj5SNqKNDO+W/3meBdnQwUmpzewZaQ1vmhSCphctXtDuPzZS1uTGS0smBoPQmZUbko13EzSrTluE0rgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtKPOqRL; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so41388a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625834; x=1782230634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SsBsTPxJdQQQDp4kGeaeLy+dHUagTpgcZ8ic13rhyUU=;
        b=AtKPOqRLjOPhR2zANpQAjIMlhjo0aPKVZcyMuZssHYTC2l75iFy6Bo2tRptaa6y6Rq
         Gy6CRKpnIG0pojUGzMemtlySuygOZ8etCiGJxxofOnzUo2fKC1Rjw66i+xCgwp0bbldQ
         XFvHTMxwnqNDQSPVXnIT1tPAmdkH0Sm/2M7mTEXII3UvR0fgNCSpCGf77GWbTa3wxvVO
         9Y5FTsCqL631uYErWh/B7yw5iE4bIeD4biDl73ckbSZ+GzZd9W8MLeGOuGi0WI9h5hrt
         Nmw2JyEcBG/VBo3vF1n2PhrKsG4vwcYAebQvF7UldJ2OGgmvNZPSgE+OKGKYKvzoquS8
         W7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625834; x=1782230634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SsBsTPxJdQQQDp4kGeaeLy+dHUagTpgcZ8ic13rhyUU=;
        b=CJFD+YZJtaQuaPHlO702LwtoGPh/FoC7BqgMf/6+8K3IKVvKig5oc9J3+cZX8QPsak
         InAKPf5053vG6X0zrIJ21vEPwBj5HTqF6e+tJX1B24/ghVgVWH5WxmtdL2UNMQoczsl3
         uCFmlXT7GpnVlleltHIj7TYsJ7Kgtv5xC6oJYUNuLQORsFbKdFJUxwfdvY6wRyUV/pss
         v4kEHNPVLC+rcF2HjogzqKZxShgURg+QYDbVxoy4PjK+BWy4D95W84j/AN8g7sMq6F96
         ypHqG8rK3SRgVEn6CQJuaiuiTdQ1jczTvKaL8sJ0Sq+mqWCBFnm2kUzvuMd2iVvPGUp1
         L25w==
X-Forwarded-Encrypted: i=1; AFNElJ8G6OroyQfcMSbIB3iILZ676eD/z5I343QaoZt7mkIwMEh/iOu5Pk556FNlklD8FnaQdzZ11N9/tSOgwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8su9Reg+70PQyyWpfG/FmcNI2zo1jtQhnfn1m9udrTZUqGg61
	4Mc5TTWNS7pk2FNDGf54Hc5INbdQlazsdyeoMS996PXh9aCWe2FpAAe+
X-Gm-Gg: Acq92OH8xqAroS+T9Akw8uimLAAwCWjrdL4U5mUVho3bHVPrBPyIQe7Fp1u6m/v81H2
	JG/Er1U4h4cWTpgEmRMmNW7v8siawQLvdcCPLeEFZpUgukoYa7CbUZQvdXO8QPBTYhCvquVPF7t
	mxPEaxDeqdNPRF5EkM+DjGbQ9EHcyhMUT1cMiTRjMLgsPg9swDT93e729BOoRZT1pQwmy4IdcfZ
	2xXYvPCmBNKUduaSWFMZcKAabKkKvDb3I0W/0CJaRTzgheezaFmJvWkDwje1dmfJz32GEss+qsp
	zGBLWoLTpt0KMs3y/H+ps50oQfCsZ8fim8fh2CTHK3LZgsGQm5r7917fUMLTB6cGPXNcCwNEeBa
	aDAPXVRUyrTkqWQG7xK0cFepDRMoPHJEfhUWoK37COkpD/tL3tW3rtGm1plXsYvkiznlDBPkUQ3
	StFAzmPfa1FtOKoNwy7tbTa/VVnIc+GGha77xt
X-Received: by 2002:a17:90a:ec8b:b0:369:742a:4259 with SMTP id 98e67ed59e1d1-37c52225167mr3687652a91.0.1781625834282;
        Tue, 16 Jun 2026 09:03:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c955ae559sm6127a91.1.2026.06.16.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:03:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:03:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Message-ID: <46ecddcf-c452-409e-aa2e-4b562b096425@roeck-us.net>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-2-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-2-zmzhu0630@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15171-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ziming.zhu@silergycorp.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1E6B691AE1

On Fri, Jun 12, 2026 at 11:03:02AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
> 
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next (after dropping the extra blank line above).

Thanks,
Guenter

