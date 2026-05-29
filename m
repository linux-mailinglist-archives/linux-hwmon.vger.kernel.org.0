Return-Path: <linux-hwmon+bounces-14615-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FYaDY62GWpCyggAu9opvQ
	(envelope-from <linux-hwmon+bounces-14615-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 17:53:50 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DC3605185
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 17:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BD235D34C6
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 15:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE2F43CEFB;
	Fri, 29 May 2026 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FiBDSh56"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758FD43C06A;
	Fri, 29 May 2026 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068339; cv=none; b=a6LKcoFJFkKx2iaPyw4xb7HwSgiIHrLQHINChbBItLuh7fh5tatKfrNzcBtfAvvYq889KjrDNW5OQF5cwviNR2Yrkw7AyQ52d2OXyDFYnFW1pEPnWO+4WULmWURcLqHMyYg0k2y6MHmRszjG2QeUHYTZiUbNigGtociRgFW4hhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068339; c=relaxed/simple;
	bh=sNebAPAYrZbeC4nLbGieW9R1xvkfOHd4d2XSWM2VjcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCSYq946PFmeRnX6UOIuIKjPNj6leKf598umeLn3w4v299iEQDOz2hY+4nJzUOnD+hsoywpPbXJZ97Xwx1xGbib3iCgUqF8DC5vt7K7At2usX3QRYm5/aXYuYFy49z44EaWdEZePPgCALMWic76pJ5p9/cGdmIal21YDV8oxj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FiBDSh56; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE7133EA;
	Fri, 29 May 2026 08:25:31 -0700 (PDT)
Received: from [10.57.26.238] (unknown [10.57.26.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 897883FAF5;
	Fri, 29 May 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780068336; bh=sNebAPAYrZbeC4nLbGieW9R1xvkfOHd4d2XSWM2VjcY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FiBDSh56YZLRX/eBUiGNisrIH6kU+Dr0Nv85Ju8ZLOdxoi6UiNX1w5dLKkc4lElll
	 W7+dA+v3izTCcLsbTLj7S7brUPbsAGSolMHTm/TTAHRLM/A2pwHu9Np3hpzppAoVD+
	 Osh/DfD0W9r6mAc94G5mKLZGSDB8mNBuP0Qug6qc=
Message-ID: <736518a8-0c81-4d48-ab73-bf83eb5ee98a@arm.com>
Date: Fri, 29 May 2026 16:25:28 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/10] thermal/of: Support cooling device ID in
 cooling-spec
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
 <20260526140802.1059293-21-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260526140802.1059293-21-daniel.lezcano@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-14615-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email,arm.com:mid,arm.com:dkim,qualcomm.com:email,cooling_spec.np:url]
X-Rspamd-Queue-Id: 84DC3605185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 15:08, Daniel Lezcano wrote:
> Extend the cooling device specifier parsing to support an optional
> cooling device identifier (cdev_id).
> 
> Two formats are now supported:
> 
>    - Legacy format:
>          <&cdev lower upper>
> 
>    - Indexed format:
>          <&cdev cdev_id lower upper>
> 
> When the indexed format is used, both the device node and the
> cdev_id must match in order to bind a cooling device to a thermal
> zone. The legacy format continues to match on the device node only,
> preserving backward compatibility.
> 
> Update the parsing logic accordingly to handle both formats and
> extract the mitigation limits from the appropriate arguments.
> 
> This is a preparatory step for upcoming DT bindings describing
> cooling devices using (device node, id) tuples instead of child
> nodes.
> 
> No functional change for existing device trees.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/thermal/thermal_of.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 3584024b76f5..100fd8a0c8ce 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -259,16 +259,34 @@ static bool thermal_of_get_cooling_spec(struct device_node *map_np, int index,
>   
>   	of_node_put(cooling_spec.np);
>   
> -	if (cooling_spec.args_count < 2) {
> -		pr_err("wrong reference to cooling device, missing limits\n");
> +	/*
> +	 * There are two formats:
> +	 * - Legacy format :	<&cdev lower upper>
> +	 * - New format    :	<&cdev cdev_id lower upper>
> +	 *
> +	 * With the new format, along with the device node pointer,
> +	 * the cdev_id must match with the cooling device cdev_id in
> +	 * order to bind
> +	 */
> +	if (cooling_spec.args_count < 2 || cooling_spec.args_count > 3) {
> +		pr_err("Invalid number of cooling device parameters\n");
>   		return false;
>   	}
>   
>   	if (cooling_spec.np != cdev->np)
>   		return false;
>   
> -	c->lower = cooling_spec.args[0];
> -	c->upper = cooling_spec.args[1];
> +	if (cooling_spec.args_count == 3 &&
> +	    cooling_spec.args[0] != cdev->cdev_id)
> +		return false;
> +
> +	if (cooling_spec.args_count != 3) {

A bit odd to read the negation format while still having 'else'.

> +		c->lower = cooling_spec.args[0];
> +		c->upper = cooling_spec.args[1];
> +	} else {
> +		c->lower = cooling_spec.args[1];
> +		c->upper = cooling_spec.args[2];
> +	}
>   	c->weight = weight;
>   
>   	return true;

Just a minor comment, which can be ignored, fill free to do so

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

