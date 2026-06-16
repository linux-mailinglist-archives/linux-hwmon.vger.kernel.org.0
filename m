Return-Path: <linux-hwmon+bounces-15169-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KvMGEzJ1MWpIjwUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15169-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 18:09:22 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF492691BD3
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 18:09:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Atz5OOMX;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15169-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15169-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E36D309C94D
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 15:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373964657DA;
	Tue, 16 Jun 2026 15:58:10 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D154466B57
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 15:58:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625490; cv=none; b=LK20ZhG+krLvSqMbJFp0pb4e2riNSuWMXbytmWkcgR8zj3khJRFq7NJ3IUYbBtW2bEs2RS2J21UHBeEoPfSJOmgm/ZxK2VUm/AbiLwCmy4P0e/q9nccplvh/tzQ4uYBJML/+YaUwA79VlAOwiWwv6Iz0rCbGD2AdDKAObxD67o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625490; c=relaxed/simple;
	bh=UPUTkSUeFk9JQeZdN+9Z3ErwNhCOF6+E9sYhpJYC5LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNnynMIfd+eN4qDFdD23wOS1SWLj4LYOvN15sMsdToRwrC3BwT4Jt7fbYcdhCAS+7nio9U4xf7suKtU5H5FSF9gPv4I5ziAzzJd+ftWZUDKKiVc27BY2Gz9ThIO5zlXaGKg/BY1YXsh2csEccKYIjn0IiLsr8RodmkdyMClcy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Atz5OOMX; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84230ab8857so2234436b3a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625488; x=1782230288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNzZT7KE4X5nEh+XCCxZ3PI0TIseL8zd9TDLpDj5TUw=;
        b=Atz5OOMXxdAcx6Bx7uPbVhhss2EraRqLAnHXCN+OD0n5pEVdctLOntmcvc5Wu3WNew
         0/P2VsDIgz3qAf2MWG7/a0aZmqGC7XAGwolE4iLI3g7L9u7syA/6O9GOnmNsRgs4avuP
         aeQhipJjiTDxf7vvkOk0c4iWmvFXTChJMhU8Qdi66XTDKcVskXO/xtBSLnZgojARw8w9
         PuPx2emfZlOHse9kQCdXi4hZTtwXMeuFcGyJ8LAm5TcNNKdzFlYnmE1sIG1ohtYM5RDL
         bJBnmp2o4qXcbqevWvGm/wK/8KtOBfSwDHJ8MbM9BKd2U69MJq+526lgThdiZlbFMF7C
         DS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625488; x=1782230288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNzZT7KE4X5nEh+XCCxZ3PI0TIseL8zd9TDLpDj5TUw=;
        b=ZTY+q2nOCzH7nfflAGGgU2+AHDadg8Ok+X7NCdccrY8M11XoM2xBSZ7meppzi8pnHe
         HM1qf7KLFPw3hpkIdtg2UXZaazw622ac7vQmVMV4xl9P1yl6QFJtx0kwUaeOGxd3NCVV
         ixV1OLr96OgUW8JtodaaYUFnKOPvYKgPcIFwL9fyNHvD7gF25BeSVbEUHLsrPmE56urx
         /vZtaFptwz4r+zEWvuzvES5EM9NgyfyNEqXJYan/i9ay+ozweZ30Oqt86UTQ5N4NCeUB
         mGRp/3Kt64pQ4DAyVd102/xfovUhAw+bG3tQBXNN3QFSIJ4LA45au7F6Xaf9aO9WqRlE
         f8vg==
X-Forwarded-Encrypted: i=1; AFNElJ+p5CKOYTVBF/tU470XsbwL0gZhynLA1gBrPB7Rwu8OeynUR+QhHwcYoe2yxHx3pTtrbavZXtm6Zl5xuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTrIPwOGFAuJv1Hvrph6i40MbyouVDAp637OD8kCuqhBN+kvJm
	iKZgIQK74N7c5RehxGCL13zUK1va5yJQJyZXfZHNkoDf4wDMtwGA+JPE
X-Gm-Gg: Acq92OGsWsSh02kKbnIur2PVX30CSVOvLodQIfc4nrLJJ5hFNGZLnTKV6npjWiwvVNY
	U7brq+ZYGV2lCzSpRMoNWgA496oroEs2Fs4eLDz7Ji25OCPXBxaVOW/grtU0dr3A5iSphbyX3cc
	76I5SrLfIuMgBzngNN1tk2/SkwpI6PZSEQe8573a4PRTWF41wG1Tarsoqa2s6JY0iYhyUw4WhYv
	7f/sNsfh9ntqORC0nVUQvWn3cbB/FNchFp5XvF1rbV0GiEWn5PAbUPWmof/jQlI61rxqo7HcDzr
	oG+2kc42Bvnx+b59oBtJu3r9SjvXpC0ndNnLf0pUkosCSNospFxLewAVd41Vtj2M4nroLyUFrih
	p0tEITGCoj1hQgxV8d3Qpv+BMMh4o06brwR9tIRFohPkAkheHW7nKQN9LJspaEoVpY4I4ZPYsmO
	gAZhLPBlyOejueT80PG5eXEQ95QFz/IQYM2g34
X-Received: by 2002:a05:6a00:1c86:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-8451539cb35mr4267441b3a.8.1781625488374;
        Tue, 16 Jun 2026 08:58:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c474sm12423557b3a.2.2026.06.16.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:58:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 08:58:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Message-ID: <eda65f40-5f62-4719-a4b4-63fc7e462fff@roeck-us.net>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15169-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arduino.cc:email,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF492691BD3

On Thu, Jun 11, 2026 at 04:05:24PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to hwmon-next. The branch will be updated after the commit window
closes.

Thanks,
Guenter

