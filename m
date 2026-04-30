Return-Path: <linux-hwmon+bounces-13665-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DddKVfi82mG8QEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13665-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 01:14:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD94A8B95
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 01:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAC04301683F
	for <lists+linux-hwmon@lfdr.de>; Thu, 30 Apr 2026 23:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405953AEF5D;
	Thu, 30 Apr 2026 23:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foZQznDY"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F2C3A6B8F
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 23:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590865; cv=none; b=YThDVilZ30Bc736cCvi+2FLPANMZKiygA76VHKCQxHl3dLGZsPtbaomX2FCj0in4TBmmPsbnZZMG9BhYSer0AibtdgAR6EyuM/lgRSI9+0ApCCM895JW/Ge+wWqcr+Zkb5b0JamcvIPde+oB6E5yvWmM9x2cYlXKeq+tXXNqaGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590865; c=relaxed/simple;
	bh=PoLlpdsHqpFtL1QScbKQ55IvWNzxPigkSoWvBLAMYow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT1Hk2dZjx+/sFEXnuCizr9jXDUsGJIAOymclHoOSeiiyaHgGmS2L9tAC2LgRo4NI27IV+cBLcUxZb4Z75kp0LXgC1YWmt5MjHuhkEVuwliAFfKLNF35aDqy/rOvvJgHHG3Waal6JwF0ect2/86rsZ4H0QgJUnDlaNG7xjPeWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foZQznDY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so1753640b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590863; x=1778195663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=foZQznDYPFJ5OUzJ0UUUfztFfsrkGNBZfth9GXy1NLWP51/wF4Njn/AoErSg5pUX2t
         JGziMZatqfFnsC6x5RGzz4hWH4muzE+MRowH04IcPu35ZoGHREm/y2ONxmK5upM+oA4K
         gIF8xCXEDXbx3F+BjnV00y9HF4HWz1rCiB5Vht9DyE59cYKM7+77b7Azqrc5Du1ZI3IQ
         lCsDefRAxSsDEF3NqVfZV/Dl5ZV2aBrF1AvxBkC+7l4CdbttXDVGUjcwio/086mZCUK0
         p/nOCQT2yxPl7GauXVZR2To3njdV4Yq2ALTgy1x5/6WrCtoQ7LO1dHzf3G5UJbooTuWQ
         CmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590863; x=1778195663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asyv7BZxX4DKLzzqzxpPZVMV4zIoDUir1OfAeG9wMnQ=;
        b=KG2K5YzaQufiwKRxwofMmx7T8IdnlDz/cciLczN9O+EbGXlzvk+IBzqO6RuyMOc0e9
         ZTyDTlv/BGPqyPvUpMVsrjPVmOth2SEeGp5CMN9qb5VSpkRun3NwTVyWiOSE5NlzWFsh
         6lVlE4pE8IUpVC34gQuZF+DO7rNwW3kICvSIUeVLkstcXxJN3KalfeMS2v5BOlWnai/m
         yNchBnwXRMH0nCIzKfK1tQCnSySiFDIJu0Pm+U4EnWsHaGx7Ix1lmhBt6W9h+RA30nWc
         cV9igoHpAQTZIwtL8q+6dmfRpjS9lOdra1DEfbpk3u735I6OmqAGqskQ2mhI64V9cPwp
         FN7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9X8QEJTkFf3hXn+RZ0A22v7j+TXMrmFf4JjUZqOTmDIf4LAIj7oTg/Q+fMHxCMnsTjG8sI6wcvvR2Liw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1VNdw8U26inzeSYTyAKcEPOsOTMDsaG5is21kR10LOI/lavAc
	qrXPxkfJESuoeor/UthtRwv2AwCh2uELhgN6EwAFlaZjmqjPdKB/QVtD
X-Gm-Gg: AeBDieutCe4ceV/brio1xAvwsYzuPIZeUkgGaOH/4ImukBJVjDl5JzdgGBxweobGCAv
	qzaFIDIg+eBe8Xhza+82NcGUuGmL5iOfUc2cn8j8gCgBbtwoH6hHiE7icYpM1bM/Nt5nvQabxW3
	SYRhR29jBHMrYQo1iuNGpPOl5Calp+Td3Aag/XlrxLJz3ZrnEL+oz1TUuGKyHkwZTH38Us8fo3a
	/R4hbimz3C/Im3dMPcomCzUumtX2oJ+dj6DGQdxPjhU5QrukuHn60b5VEqz4jCofO64AxGPA/tw
	W6oeXoW7CNJ423a9qxKUlfI+zrrVSSYyyPQ2yd71R84Ea3HXZsI5OMVtL6V+Akvdj+iqhmWJbJq
	Ts+g9vZzFy7IdkvPf2rX5I1S1QYglq/6g3cSlS1F+ulPcWEcweWzINQsVu2sHswRhLEmT1nKqSz
	hoKBldgLLMPShen7LY1ZWdzpkmkQL1oCBdaLk3I54akOXbPYp+QSjhwWfKWA==
X-Received: by 2002:a05:6a21:3298:b0:39f:7183:b1ee with SMTP id adf61e73a8af0-3a3d1cf2f62mr4499046637.15.1777590863268;
        Thu, 30 Apr 2026 16:14:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm603009a12.32.2026.04.30.16.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:14:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:14:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
Message-ID: <4981e0ac-ee89-4c6b-8fc4-d6899f1cf353@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-3-florin.leotescu@oss.nxp.com>
X-Rspamd-Queue-Id: 18CD94A8B95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13665-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,nxp.com,lists.infradead.org,lists.linux.dev,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 09:59:54AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> The EMC2305 fan controller supports multiple independent PWM fan
> outputs. Some systems require fans to enter a defined safe state
> during system shutdown or reboot handoff, until firmware or the next
> boot stage reconfigures the controller.
> 
> Add an optional "fan-shutdown-percent" property to fan child nodes
> allowing the PWM duty cycle applied during shutdown to be configured
> per fan output.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

