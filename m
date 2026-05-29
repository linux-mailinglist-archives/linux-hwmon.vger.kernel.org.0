Return-Path: <linux-hwmon+bounces-14614-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAwwHEy5GWpByggAu9opvQ
	(envelope-from <linux-hwmon+bounces-14614-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 18:05:32 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C862960544E
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 18:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B393331C17A
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 15:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DD13469F6;
	Fri, 29 May 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kFosWjiJ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD4A3321C2;
	Fri, 29 May 2026 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068081; cv=none; b=h2EMN7uvcDOd5Evv6s6RqsE2kVc4DOYVlRQvx3CjVt7j0W4yi8fPhjNIAOxXqAIPQ7sDv/JxJolZhW4SmfF/IdolVn93vagvAX+5fAf35bQ12GBxMgV3auRHcL5Ob13TUz1Acia1/tCxKzlctXPES46cjfiEaFqSTGb6LZEnCgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068081; c=relaxed/simple;
	bh=qDl3qf5rz3Gke1EzJNa6eNOmYlLUh8LCqRCcEme0YAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MO6YYAyShAG9v9I/w/9TbnoHT3AkOJKzm7hfXcm7DUcPpCgI9ipVv6Qn2k8L17j/4rF9JbnRSSQcF7ICxJtb+9W6h6Ssa7nG8CFUk7q2r5xzrhNHRh5Fk3NgVOmgRL+PDZWwwG6Zr+KlCFM3CbRnNYQ663dMV/3LHPDuyy4JBXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kFosWjiJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ED4D33EA;
	Fri, 29 May 2026 08:21:14 -0700 (PDT)
Received: from [10.57.26.238] (unknown [10.57.26.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FAF83F632;
	Fri, 29 May 2026 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780068079; bh=qDl3qf5rz3Gke1EzJNa6eNOmYlLUh8LCqRCcEme0YAE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kFosWjiJWQwRuUN9HtJlNZH2Vnk8UXNLOVLcJLtjlaZzak+plFDuIZ58CgOGs6WnS
	 XBWl1K4x2sQ/P2L01lMpS+i1mn6Qzci16epWtxaDFwO7KpeObmWnYsZ3Gfshb8aj4t
	 uRsCdZwBv7rDOEjHaDwax0hy8LEg0gNLt6MkP24o=
Message-ID: <efe3602f-a67d-4232-bc8c-fd65daf6a695@arm.com>
Date: Fri, 29 May 2026 16:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] thermal/of: Pass cdev_id and introduce devm
 registration helper
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
 linux-hwmon@vger.kernel.org
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
 <20260526140802.1059293-20-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260526140802.1059293-20-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14614-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,etnaviv];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: C862960544E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 15:08, Daniel Lezcano wrote:
> Extend the OF cooling device registration to support an explicit
> cooling device identifier (cdev_id), preparing for upcoming DT
> bindings where cooling devices are identified by a tuple (device node,
> id) instead of relying on child nodes.
> 
> Introduce a new helper:
> 
>    devm_thermal_of_cooling_device_register()
> 
> which registers a cooling device using the device's of_node and an
> explicit cdev_id. This complements the existing
> devm_thermal_of_child_cooling_device_register() helper, which
> remains dedicated to the legacy child-node based bindings.
> 
> Internally, factorize the devm registration logic into a common
> helper to avoid code duplication.
> 
> Existing users are unaffected, as the child-based helper continues
> to pass a default cdev_id of 0, preserving current behavior.
> 
> This change is a preparatory step for supporting indexed cooling
> devices in thermal OF bindings.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/thermal/thermal_of.c | 58 ++++++++++++++++++++++++++++--------
>   include/linux/thermal.h      | 13 ++++++++
>   2 files changed, 59 insertions(+), 12 deletions(-)
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

