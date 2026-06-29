Return-Path: <linux-hwmon+bounces-15414-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CanSHK+VQmqk+AkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15414-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 17:56:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D616DD013
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 17:56:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="k4R5Gj/F";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15414-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15414-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48C39305CAF4
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 15:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F4E423A9A;
	Mon, 29 Jun 2026 15:41:48 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97B40F8EB
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:41:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747708; cv=none; b=CvueYt7aV/yDuvNuTyLqU3yOFmdSSngoKplGM6M+KzUJUUD7Vv2VH6CvNBMfFjQOLUeSMvW61XJMWz2Ho5SiOGE5SSw52biURyuUqXDKdcFdTqAaaUnl0WACHskKn+G30fPpFIcxh8zQFQjZQNdORrRsX4GnTGWG3b2FyWo1H4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747708; c=relaxed/simple;
	bh=78upUu1xwhLycnrQsrt0ZEGc6sW7BOBThhU69Tl7BSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xd5ygsuDqme+Ywvh2BiytCDQOfZC3fgZ4ahaVksu7dT5tf31Mjza6VSqG5hnV+UuNdQTM1ThjU9XrXI4i2qQvEZ5TBAyyCvqk0jJa6/KFTRTeCmeFhBTWITQ6C4bQWsFh0EIFEG4H5jKpkdA8ShiuZzmpLq983VNlDAEsCz0Ovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4R5Gj/F; arc=none smtp.client-ip=74.125.82.46
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-139f71a5201so843539c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782747706; x=1783352506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOsTYbVSb3rcSDfuL2FvOf6obZiJsUPy4pInWSLawp8=;
        b=k4R5Gj/Fb60e0xxAZ1G9GAeNVfnZNy6f3iSi4dkW/yq0OL86RKzW0svc2VfQoskeyN
         q5JbEUxLPjHOJyhdDPou8qorIH0yldzCy3FJoPfzq4kS23GDKPyAqjeMbe1oXIfo9zUr
         tp0d86n2aM5s2N6YWMjJhuPDsLeLw6SzqzBGWUBjLuf6uOUHc48OC7mlM1o6P+mjZVx8
         3DsgkBMjRz2bHajrw8jzi9fGQzMpAkMtHDBoMs1w0weMO0ndHLBQSef217Tw4tRL9Gru
         zXW3MXLISXDrSQ17cQKy1+yruS23NHFrt/vv/wEWhCcr5D0vlMlGX5sGcYOLPnEDaALS
         PBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747706; x=1783352506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pOsTYbVSb3rcSDfuL2FvOf6obZiJsUPy4pInWSLawp8=;
        b=kyXagWOjRGTAPJLMY+gGOzCN+p6SBs3fR05M5vxKemF4eR/zwKrsVFGwXpT6fIxeQx
         6Nqj2bXaPXC+CQ9PJzNT7XOpSMto2tRn6RXd1TX69XUhbmWFQj/QlLeqXkNMkxGGu2jk
         3EOlm6xaIhyoyoIeWsJhsFEgyfyk9SkRTT6sNs3WpE3G65OZNi1mTsvveglQwyR6KxEK
         DsBxpUkisdXJMkROGEXEZYzERskqM45QJlrnOzBWo+kMtLh0k8D0X8Qkwa8GpXjsyGyc
         wNcB6ewBtdMNhqPe4GnZNEiOFkqOq62jm4IpDOr8KxUabpHIfO+24QAfkOPnB+T66tVn
         ZdgA==
X-Gm-Message-State: AOJu0YxuLJVsZCcQ0XTNTm81AxNpe+WhWWSZAII39jf5OCB2zSv7G4AL
	GILY/eeErZGxgaj3ZYgVGXDsTtBwjcRujcmxRCrcSrvZVqwvqzSOtci+
X-Gm-Gg: AfdE7cn/tUG3NWhK1/KRYiHiHVWYMXcXUV5LbbUbKgEhDlr7OYPRuQTRnWgVl+f3bxP
	a84JtxGyWhRnlxY22XLZsydEHhidsUDZSRRNEXXzncVlhY75Km/zU9zuc81Pr5g6YfL17ane9WU
	NUFK6ydoO9hsX/eKhhaBXgjIhVm4jVhvcPFVlxGJ0tVNWBIbZ2pAQGhkg7cQqNCy8dnCjCWGwsw
	tKeEiA6y7GR3Fchm7AYl05mqn8Dd1qrDt/DWm46ucIgfKxr1hsHCZAkFBfju2UM5kWH2b4MMGaM
	SBtMAvuzcZkcKuxnquPXSN618a/ht4SaJ4prPBuBhTcEXjpq7Gsi5s3sApUOQWlH1i31zeT4o5A
	CNiNry4j2TE7hfrmze8uGAQkH3cmelZXhuP1ZP1sL0fD03xJf1k/Dx0iC84bKobPpqX3ICroPcs
	Js0sILXIllhUrd8bfBeEMRsVELnA==
X-Received: by 2002:a05:7300:80cc:b0:30c:1fb5:94b1 with SMTP id 5a478bee46e88-30c5553657amr25209202eec.6.1782747705525;
        Mon, 29 Jun 2026 08:41:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm51535034eec.8.2026.06.29.08.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:41:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:41:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) honor vrm_version in
 pmbus_data2reg_vid()
Message-ID: <8306cf7b-23c4-4f54-986d-a11125002608@roeck-us.net>
References: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15414-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:abdurrahman@nexthop.ai,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,roeck-us.net:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nexthop.ai:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5D616DD013

On Sat, Jun 20, 2026 at 12:50:37AM -0700, Abdurrahman Hussain wrote:
> pmbus_data2reg_vid() hardcoded the VR11 encoding regardless of the
> vrm_version configured by the driver, while pmbus_reg2data_vid()
> already switched on it. Any driver that selects a non-VR11 VID mode
> and exposes a regulator (or hwmon vout setter) sent dangerously
> wrong codes to PMBUS_VOUT_COMMAND -- e.g. an nvidia195mv part asked
> for 200 mV got the VR11 clamp to 500 mV encoded as 0xB2, which the
> chip interprets as 1080 mV.
> 
> Mirror pmbus_reg2data_vid() so writes round-trip with reads.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Assisted-by: Claude:claude-opus-4-7 [Claude Code]

Applied.

Thanks,
Guenter

