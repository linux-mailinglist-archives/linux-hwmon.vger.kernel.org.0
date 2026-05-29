Return-Path: <linux-hwmon+bounces-14613-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHKuJz2zGWrsyQgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14613-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 17:39:41 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F3604E84
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 17:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 255023088581
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 15:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18793403F1;
	Fri, 29 May 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hgKzm/J0"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC663321C2;
	Fri, 29 May 2026 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067931; cv=none; b=lYa2HoXdNRGNc7m7dPp3IfohPIzmMcNjtxG5wE1DtvOKDdoH4olCuk7GMMrWpMaFKJv3fwVSiuSrDWUce19har4yT8nUlVj/8kx8pOycmzNgH4+PkqmmlpLlf6gJS0yghyRVJpjTuQ1MeWTlupvJhkQw4eqJL/qiqDblIldg7dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067931; c=relaxed/simple;
	bh=ivH/tOTm/MtMLHtuPvnKIKXI+O+0zuzXiqnxkcFsMmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7XbEpuvpqZ5awNm2WpbAxZD1vQ5VOmrkpN9VxPJKYeRU1twoHbSXqEn8gqaORKiCRg5GcxBriM665b6hgOZfePnvEP9ehG4hfb5nyaKr9J0Eaitnn8U/13nhOT1U6qvjdq/aZeAcP/qiYXslF9DDzAY+PMiA7vcoAIKVs6k/Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hgKzm/J0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E040533EA;
	Fri, 29 May 2026 08:18:44 -0700 (PDT)
Received: from [10.57.26.238] (unknown [10.57.26.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 344383FAF5;
	Fri, 29 May 2026 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780067929; bh=ivH/tOTm/MtMLHtuPvnKIKXI+O+0zuzXiqnxkcFsMmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hgKzm/J08GPu32rvNURHQPhQwqlHMLKWK4g2wPk8wMNuhs71nZMwvNEJyknB3aS2H
	 RDly5a1sZ0p9v8fYAphU9hEH69x6Yv9Y5lB3vnOvnFJKqUL70mcwOzn3FaKAE9NLJY
	 6x9k9XotjJ05gFG+GuGAGAWkFy4+jAXBKaAYFRYY=
Message-ID: <1f0527d4-1dfb-432b-8d0e-06e99a94f638@arm.com>
Date: Fri, 29 May 2026 16:18:41 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] thermal/of: Add cooling device ID support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org,
 daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
 <20260526140802.1059293-19-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260526140802.1059293-19-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-14613-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,etnaviv];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Queue-Id: 036F3604E84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 15:08, Daniel Lezcano wrote:
> Introduce an identifier (cdev_id) for cooling devices registered from
> device tree.
> 
> This prepares support for a new DT binding where cooling devices are
> identified by a tuple (device node, ID), instead of relying on child
> nodes.
> 
> Existing users are updated to pass a default ID of 0, preserving the
> current behavior.
> 
> Future changes will extend the cooling map parsing to match cooling
> devices based on both the device node and the ID.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  5 +++--
>   drivers/thermal/cpufreq_cooling.c     |  2 +-
>   drivers/thermal/cpuidle_cooling.c     |  2 +-
>   drivers/thermal/devfreq_cooling.c     |  2 +-
>   drivers/thermal/thermal_of.c          | 14 ++++++++------
>   include/linux/thermal.h               |  6 ++++--
>   6 files changed, 18 insertions(+), 13 deletions(-)
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

