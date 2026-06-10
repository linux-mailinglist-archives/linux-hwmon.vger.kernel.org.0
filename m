Return-Path: <linux-hwmon+bounces-14960-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RMTLGlBjKWpnWAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14960-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 15:14:56 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 67554669A20
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 15:14:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=COxMn0GU;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14960-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14960-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9E07300184C
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 13:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B6E405C41;
	Wed, 10 Jun 2026 13:13:31 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75DE312826
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:13:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097211; cv=none; b=Txzr7Jvd7+2a3qFkd9CD4l9BoG9t9atbixZs1qHDcVLW6mSGfy5/c1mJERQYtKZs+8a08iqzlJZrwMIpyZo0ZkxWF15WJzEwQFgHZIyVAigtGCd1RC1WfCxMQ7HkM0yexDCnSRItEShDyF237/xrrKxBw5hweTitQTG/UmWhEHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097211; c=relaxed/simple;
	bh=Dc1VkjbFpBJ9vizeqzDXZHW2oAtVKggAx2joEa5XF1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+pcKbdMRTH4D3/nIQCAQ9ytjYOSgRr5m3WM+acrvRSya+OIZOQ0Kbdhv0JZ9nBRi1t/0m7iAYTESNuTyBIMP3f3iBYjH9wXMOT2R9ebHYZtB0HYH3pEP/AoO9+aDAijuGBkrRqvurdczJLmImzOs/r9Zgq0llz7A9reL19oF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COxMn0GU; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf18c30bb2so49279065ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097210; x=1781702010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+iYV2xhzho0asRRvQTrNHJsCHdmt/Dp80yuSofh4yo=;
        b=COxMn0GU8LumRzuXJm5eV4AvVLfmsTsSyT+dAgb2kPtPkioqM+06+Xc0zY8rILFOhO
         1/iaRtLEALByMP/FFarRQjxzO0tdx2rmgjpR3jcfVDTaw1a9yzWgwCegIHyLfquFE9+I
         B1xTeyiszE0H22MSZUJNv20vkc9YrQ3ScEWTNgGyc/yTIk2L4Zu6vwEZkJIiw2TEuk65
         UwwtI6cRsz6yVyoKhVGR2V0cNBF44Z8OU7gpnC113K2T+IKj4ZDZ5jAtXyzZbiTLM3mA
         IbxJ+YLI3ql3kk1S3teM4jQxM8mjNSBm9JmH84TksV0I6gJzCQDSrq6J+Y8+u3/kQnmd
         ZLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097210; x=1781702010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+iYV2xhzho0asRRvQTrNHJsCHdmt/Dp80yuSofh4yo=;
        b=Eg6JSCVDSILnqCamlxhsMaBcv6fM7d7zPt87yWLpyvqHQjYwVoc2j0F92HoGWk4+yJ
         JKeYp+aj404mlwp3wBrClj13LzcfgWWgU1wNTpGRAdFp/lSPEUDD42ygPb9b5IA9gD++
         eeRC2MKYye0noRP493wyDbaLrFT6QxMIa5ZPLg/3G5Te7+hczHbOJpWTXfrJ6/S3eexk
         IPzc4W6WWwyApnZi6VQzwqMca7vBY82dN21WKSreQ5Xmn24XtgazKOBN83owrMsdKyul
         N/gsNdVnqV3QZy/hNfpuBXpGYvHZcRt4S7DgH+O2l6PDWn0Y/Mv1nsNgB2jG2ixGWLaH
         Bg3g==
X-Gm-Message-State: AOJu0YyRzL+c+QNVoqGm36zsizE1sg2Hc5VVDzPTQYICF33/mV/jsEpC
	d6CrCTdrW6+n7MfNGUB60ffo61AE2oQXGEMFismSGdTPdO+7apSwJsVQ/I2BXEsy
X-Gm-Gg: Acq92OFJlpIDU4C3yOXE56OFEYPSGI+3a/yc08VS86iX8Qyp1fEI7q8yaiyrao67LMg
	wr9HTD/Me4+r2uGOO3MSRPyBD4h0LYH7X18xZb+HHKaGd53tmG/4ft+M592+Rvaja2+TQF+JIKD
	RdT2E61kEDRYUNVBxIopkfvBFtuZ3YHLRNoF+/V99fT5OqF//mxLKfjYEIxQPXrQgJzg9Mlze3e
	Gaalf+SV+apDOTmAVhaZVPAe+8TXzyy+ypbKfKhYU/BR3XP5LnAIzrha8lTnFKsvlkuwgWGEESF
	kkS5uhT/Pj/Hx6O0tNIx8BShYQN3CZp0gH23mY/DQ87VifYXrd5tqJtOETXYipnrFULugJdLj4A
	dsvZSm+uhciWNndOinEcmi0P4ab7yfFYMb/Gio0rO9t0RxkFktQasVTGDQl0ke2B0yiHj2u6sx8
	b2kmKDKXcqG2SqyZPknprw7HEEvsFolfK7EvmGl5FsCp4mKqk=
X-Received: by 2002:a17:902:ce8f:b0:2bf:1e59:d99 with SMTP id d9443c01a7336-2c1e80f9ea3mr286485405ad.8.1781097210192;
        Wed, 10 Jun 2026 06:13:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d090sm232670325ad.55.2026.06.10.06.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:13:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:13:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH v4 1/4] hwmon: (gpd-fan): drop global driver data and use
 per-device allocation
Message-ID: <0096db3d-0953-4031-ba8d-958c205aa0fe@roeck-us.net>
References: <cover.1781055639.git.xiaopei01@kylinos.cn>
 <1cd3e13033fdd3d0f9b59322f7c86e350d113b92.1781055639.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cd3e13033fdd3d0f9b59322f7c86e350d113b92.1781055639.git.xiaopei01@kylinos.cn>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14960-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cryolitia@uniontech.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67554669A20

On Wed, Jun 10, 2026 at 09:49:09AM +0800, Pei Xiao wrote:
> replace the global state gpd_driver_priv with per-device private data
> (struct gpd_fan_data) allocated in probe. This allows the driver to
> support multiple instances in the future and aligns with kernel best
> practices.
> 
> No functional change intended.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter

