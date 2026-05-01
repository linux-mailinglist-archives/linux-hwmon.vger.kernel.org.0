Return-Path: <linux-hwmon+bounces-13673-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M9dLgMG9GlW9wEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13673-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 03:46:43 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 334924A9B1A
	for <lists+linux-hwmon@lfdr.de>; Fri, 01 May 2026 03:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36487300B844
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 May 2026 01:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B2719DF62;
	Fri,  1 May 2026 01:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZ1IAxy3"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FE40DFC5
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 01:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777599998; cv=none; b=n1RgLpLhrllftvLoDOzYQDCml+rZmYFOoPWgEdH1zuw7/rhhLjYWfuwKVyMQOdGqhzDhpnOFs4Lv/hmxWYBySULuHy/kE8xHdqqFcXo3OICb65sEbUhLhQ/yqQwUtilDckfGYMP/bP/Nn9d7Sn1kLiCZXn/Hl+pVY4ArEF1hZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777599998; c=relaxed/simple;
	bh=If8Fdw6Hpk+6Ln1L/DdDqHqiRynd6T2oMeAzbSYKzhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MAmMJgvW0VuBYIPB/eIVkWPJyO6d0JgIpK/u3spZl2GpbBh+I1ZxJaVlEBaDNdCZNEIBUl3/iC7L1hyA9JjBVTGYaw600JihSu/1WimzeCQ32ZdwTf48MYUuYwQPrzD8fyVIWNgtg6HU3qLhsLKX6dbkzqyrlO4oxwqyh0WdsAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ1IAxy3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3155C2BCB3;
	Fri,  1 May 2026 01:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777599998;
	bh=If8Fdw6Hpk+6Ln1L/DdDqHqiRynd6T2oMeAzbSYKzhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kZ1IAxy3YZ9UszRPaJu/5H7IaKkksTpeyh/mwPJpT9jB7pPBBE4PtZf52mLPl8FdL
	 AITQkahs+/Fv6zm6IkLbQsLm/8eykVkPTD3iIcjjyQq/VjFW/PwV+JlQI037NdQYrC
	 b1vn9OeofmZV11z0ELawukRr0XjPN7pQ+pTOVFvdoviDuUfNL34g2aVHv+F/k+2tYU
	 1YiEipR7WRSzgZf+Styq4PNoeRbYu9zGCkxCMRcA2Rpa02NIPdQ+XjAqWRhJY4E+Fo
	 pdBKMlFZYEfZyGcyB8mSPfEQTNFpRcFqSpzbZvIH1Pljhi/Z4yhvwefFn7Pavc5CTt
	 xtPE8SXWuT0aA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
Reply-To: sashiko@lists.linux.dev
To: "Tabrez Ahmed" <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260501013044.22756-2-tabreztalks@gmail.com>
References: <20260501013044.22756-2-tabreztalks@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 01 May 2026 01:46:37 +0000
Message-Id: <20260501014637.F3155C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 334924A9B1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13673-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto]

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch includes the architecture-specific `<asm/unaligned.h>` in=
stead of the generic `<linux/unaligned.h>`.
--

commit f2dcf018978363b0b13a49ceee94284796f154fb
Author: Tabrez Ahmed <tabreztalks@gmail.com>

hwmon: (ads7871) Fix endianness bug in 16-bit register reads

This commit replaces spi_w8r16() with a manual spi_write_then_read() into a
byte array to address an endianness bug. The 16-bit value is then safely
reconstructed using get_unaligned_le16().

Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@g=
mail.com

> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 9bfdf9e6bcd77..15104d9b2b733 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -59,6 +59,7 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
>  #include <linux/delay.h>
> +#include <asm/unaligned.h>

Should this use <linux/unaligned.h> instead of the architecture-specific
<asm/unaligned.h> header?

Directly including <asm/unaligned.h> can cause build failures on platforms
that no longer expose this header directly to drivers.

I notice this is addressed later in the patch series in the commit
"hwmon: (ads7871) Use DMA-safe buffer for SPI writes". Does this temporary
inclusion break the expectation that every patch in a series must
independently compile?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260501013044.2275=
6-1-tabreztalks@gmail.com?part=3D1

