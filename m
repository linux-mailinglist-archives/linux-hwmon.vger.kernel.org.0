Return-Path: <linux-hwmon+bounces-15439-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vjcSCCvcQmpdFQoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15439-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:57:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853396DEC0B
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 22:57:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jiwr9w0x;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15439-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15439-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2E33303C7F3
	for <lists+linux-hwmon@lfdr.de>; Mon, 29 Jun 2026 20:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D0B3A8724;
	Mon, 29 Jun 2026 20:57:05 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13C3AB5CA
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:56:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766625; cv=none; b=LlLivE8nHmIyXSDTu5vtrQxyDz6Oz+9tqbM6FhOQZCrLXJKk0RFolMHk6y40pRY5XYxoLr4YpcpkE7wlSanc4oseX3XXYcmf9OjfuhxAkCg4ZLcXoKNb2M5KUiLAAqB8+fwNYT+yPJ/U0X1vuPK+R/ty6AWxKYFgh1DAijTqqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766625; c=relaxed/simple;
	bh=bHNhDWh7u9Z2+sZaN2uuoQVlBpaSrE8nC6eznwRWtyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDqTYFgmfKVVtSfU3Vc6MfIu0JbkSCQ99/NiFXq4LOTNNEVoM89CV69qKAIQSAszyzU0tPq2JuIcJN97UHmUMw5/mNKsgUOeLfNI7msLfXZHTdi9UGdr1XiU/9HXn0NgOHTwyoA+6szGmv4Sz9O3PRa8y4z3JpDx2PMrhYBmKhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jiwr9w0x; arc=none smtp.client-ip=74.125.82.49
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13a97ffb312so925732c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766615; x=1783371415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mx2dQ5L9ZxXGnIiAZvfDsVtz/jVqs64aFFwCkSBQ9pw=;
        b=Jiwr9w0xB5hzgUYTnTmozySgUJakB6XJZn+W69cUGu813bs8KmiMKAEPKUmOpimQow
         TUMZD/3p3D2gu/ZnGvy7+E168uJwpko78BFCAp89ANC4Wx4/qC28PqEFOkNqFQIOTrYq
         Q0d21t2pXOEykIPB1w4LSkIJyYMrF7yPadPbo7NAX7u+eQ8hAtd/QHQxjQNf9J7ASXSn
         r/il8ZYXxV/OdZ09mpX5d+vUut9nG2IXZT6dKx9eFSPYdcAmKpfiP007Ld2n36pgyD0B
         juqKDkNBfKEy+tAXVmoBlKbx+Z/z91vgEtZAB4YruLfvqFlHNINvVqritk8nvVrcJaLg
         E6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766615; x=1783371415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mx2dQ5L9ZxXGnIiAZvfDsVtz/jVqs64aFFwCkSBQ9pw=;
        b=N61XZnwf/HsiLUNGD8fxQWqYFOyiHQy3EBuqwlRP8ghqtUEx8zehFZbCByv8yL9bqn
         uqUAxkrwinqUcg+VyOd8dWHLGNk9tyUbz7ZMtybjxgZe8bwhW1m700JkWQINTq29BYJR
         DYJpcSurs/5epQREqhwK9oi4ySgd2S79YS0OP8fondI4tFtguYJAAtFsAKeiCYcQxrGw
         TAfp2rkBtinb+zsZ85U4Z6k7fHowrdpAHbw/iMPniuGF5AvzS51sBIGrboXxIE6WuBsJ
         C6f4N7tcT9TR3JWon8sq4h0e26RT50pClF3W4xSlOyfZrRpi7L1UcADHKNrAUmDpOOB6
         HV1w==
X-Forwarded-Encrypted: i=1; AFNElJ/irV4/6pCOTBuNeGiQ8Ne6rEWrJIJVc1YKWd29VORnkVcwals+BJ2QRWUMkNZyjt4+WiYBbsnrm/avJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzHlTTRkroisswt1kSMjuXqHqhck9ZznJ5SG+ligfJy98Y1Uo
	ZZh0DqNdhw/sYGQTrsm9Zp7VoWCgK7Uyd0kY15JkmFsdaXtAeOSvyPeb
X-Gm-Gg: AfdE7cndL2lsxKcjQJQl/6LBI+Xcfa98KAss9pODomCXwTB8ElPDxfqz5YQPEayVppP
	LQHkygWyPOsrVhMM8JwStn8PriRRkE6yxsbkbmCO8CVc2ln8QZ/YvJJcsZA7F+yVyjjSxd+GArG
	Md1bz/ynY7K+v4tUt+Xbcj5+chLhex2b5yIekIjHGHekC3k78mZWpM3hlQTKOxMD/3mN804lCZX
	Dx2VUHAGJltVsrdsTmm+WVwNnqMHU/wHo551cZVGYEVDoADBL0ASan9zx5IvpNbTJHhreMZF+yJ
	KfqzEM9f2DCJF87qORwkCoahPyyLaGZc3g26Ul4ZJoCNGUCUJMxn+mdAoTjQmfV/cBUfkFcrKVG
	nCMOIHUdZvj1JViExpEEe6V8w4k61wxOrKoEx8Yqaa8ey46FkPr/uGoGC8IJlmmcP2EMFSQ1fwW
	s7jopdWMsBpy891neDepwnsGXCnw==
X-Received: by 2002:a05:7022:fd0c:b0:139:7a48:fcb5 with SMTP id a92af1059eb24-13b2a1db6a1mr486209c88.34.1782766615182;
        Mon, 29 Jun 2026 13:56:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2ab30047sm902729c88.8.2026.06.29.13.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:56:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:56:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/9] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Message-ID: <d8ad11fd-3ce4-43c0-a9e7-d006204522c6@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <753a6ded3e1aff1aaba7d932f0a883f789d9dfaa.1782458224.git.mazziesaccount@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15439-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mazziesaccount@gmail.com,m:matti.vaittinen@fi.rohmeurope.com,m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:wenswang@yeah.net,m:ashish.yadav@infineon.com,m:vasileios.amoiridis@cern.ch,m:kimseer.paller@analog.com,m:tomtsai764@gmail.com,m:chris.packham@alliedtelesis.co.nz,m:robert.coulson@ericsson.com,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[fi.rohmeurope.com,linux.dev,kernel.org,lwn.net,linuxfoundation.org,yeah.net,infineon.com,cern.ch,analog.com,gmail.com,alliedtelesis.co.nz,ericsson.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 853396DEC0B

On Fri, Jun 26, 2026 at 10:25:13AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Support ROHM BD12790 hot-swap controller which is largely compatible
> with the Analog Devices adm1272.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

