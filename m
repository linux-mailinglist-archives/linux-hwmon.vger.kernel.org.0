Return-Path: <linux-hwmon+bounces-11868-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHgNNNaVnGlOJgQAu9opvQ
	(envelope-from <linux-hwmon+bounces-11868-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Feb 2026 19:00:54 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE217B37F
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Feb 2026 19:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F163E301D31B
	for <lists+linux-hwmon@lfdr.de>; Mon, 23 Feb 2026 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067D533AD91;
	Mon, 23 Feb 2026 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNgkQZMT"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70402E3AEA;
	Mon, 23 Feb 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869635; cv=none; b=qTmr42DsJFuhskRhY4T/rqLwujXjNoZbtMg1K/F48a45b+c1KeRWR1PkZFHwEdxE/8ilRi3nqUooQH3QR8Q52YYbF6W+ktpTvUrz47t5CfHBw5xm+R6rrW4yhvGXKvvNDad6+uGX7li0iyPe8RWl+8hdP5Nn1A6xHXqaVHnVZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869635; c=relaxed/simple;
	bh=MJ69pmRtG+9KKJhOnIGYtKUDC06lDh6YD0E4+8ELgEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewZTabQauujmfxL7YdWU0CF0QGTVMdH9UI1W35r8xD9oAM1kKLlfkjc0v6MKPcvNDrXvvFQ20Df3uNn8Gd1ODF/fF4sA2p4xMVsFDfMKscvdBhsjWs7h1JVqt+AroxSOE1aeh5YuklDUS2c7NVMsSNRvg0vuEycXmY/Wg7/jiBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNgkQZMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961CEC116C6;
	Mon, 23 Feb 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771869635;
	bh=MJ69pmRtG+9KKJhOnIGYtKUDC06lDh6YD0E4+8ELgEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNgkQZMTlfBzpmFs9NItNEkPZARD1V38/QKAZDczfkCLSkhvG4Z8CcUJWlhACjJxX
	 JqnNYH80Dtgs6WE+D7CRbRDnNZKiQ1/2lfEQ/2kK94RRo5HA7gENHQpDRdl4kj8QPp
	 6SZDlUjM+jPLzJgVuYbFTF/LZ+WC2SiUmeMit2H9lgkFL+scmd8lzShz2TRAc8RqY7
	 yoQEnrdWD0TX9Kt7j9WlvYb6jrk/LDABG5Mg7Uv07UU6H8qqMS3Foeo4/GLo9RD8UZ
	 pv0ricwFjLD22GrryVmgiBfjurMivu8Bz4ZH/WbzMlvBp8n8ED7Zgokl9BDngUeBzj
	 1ZwY3/bMOQnTA==
Date: Mon, 23 Feb 2026 12:00:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	andrew@codeconstruct.com.au, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, yuenn@google.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org, linux@roeck-us.net,
	benjaminfair@google.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <177186963391.4186070.17923016714184398720.robh@kernel.org>
References: <20260215163553.1334475-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215163553.1334475-1-tmaimon77@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11868-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,codeconstruct.com.au,kernel.org,vger.kernel.org,roeck-us.net,lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spinics.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 72EE217B37F
X-Rspamd-Action: no action


On Sun, 15 Feb 2026 18:35:53 +0200, Tomer Maimon wrote:
> Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
> format.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
> Addressed comments from:
>  - Rob Herring : https://www.spinics.net/lists/kernel/msg6047623.html
> 
> Changes since version 1:
>  - Modify yaml file.
>  - Remove unnecessary symbols.
>  - Add items.
> 
>  .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 -----------
>  .../hwmon/nuvoton,npcm750-pwm-fan.yaml        | 139 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


