Return-Path: <linux-hwmon+bounces-13351-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TGN4DhwP42kuBwEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13351-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 06:57:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780641FF76
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 06:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F89E304C971
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 04:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDE32DAFAA;
	Sat, 18 Apr 2026 04:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XES7YXx/"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799B22C11F3
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 04:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776488215; cv=none; b=smN/vfFdirtJPGpdVwkdpizKGlQGCIao2pXKoE0BvXiktmsejhZTRBNNVVZ9ZMzIZFmuyvk6Zxn7P4zPAgkyuq6pJxYf27bvHZyM2r0F+ciW8VIs5RlRDTPGJZYrnhxkSwg2XZCg+Bug/KVeJhjcNDCsIXEpAX6SKJcWMcpfIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776488215; c=relaxed/simple;
	bh=V+sNkYrh0kM8sLmLCEci6sUX4nBFVqNHepm0sFjt558=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HNo1Jokir9+nAaISMr4tz+Yf1BWeaX4xx/o/2bmI8IJFP2FFgIlpFimbLCJyX4a0iuL3lHzX5F7NbqWOLP7luHptvE7kEWRyldM3kP+Dh4POAQRxp1Ub+8sTcaR7falDo7+qSFtUgl+fmQ9VpRpE4mw2LlbMo3W4X9oaaWCUUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XES7YXx/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB12C19424;
	Sat, 18 Apr 2026 04:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776488215;
	bh=V+sNkYrh0kM8sLmLCEci6sUX4nBFVqNHepm0sFjt558=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=XES7YXx/MKdUQffI0nbRq2YDRumXM96dpOK0l8+4dRRb4f9T45CHYqY/MMOoB7Wvi
	 6Fh8sgBgFKOaznIpm956WrcmqOEsewIplOoYqIMBcTUcCS63cdBpiCTGvHb352j7Jl
	 g2Emd1tniidagvbXmdhV5FSwhbmEji/AbFM6SHWJ1cA9um16cennVNcKf8pgLCxSgg
	 Ogp5Bww7l+Uuj2psvGe96OewVgaotfFUA90uWXcbKooY+V/jywjeSUgva6e78O62eG
	 +0ctlSOsq2UWUBdy2ZLfSjLz6/o/9kQWZtS28v/Wmmd5jDakLXc+5BsvB4OKEQlI3z
	 Rwq8gVlYtdxIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (ads7871) Use DMA-safe buffer for SPI
 writes
Reply-To: sashiko@lists.linux.dev
To: "Tabrez Ahmed" <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260418034601.90226-4-tabreztalks@gmail.com>
References: <20260418034601.90226-4-tabreztalks@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Apr 2026 04:56:54 +0000
Message-Id: <20260418045655.2EB12C19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13351-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9780641FF76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] This problem wasn't introduced by this patch, but in `ads7871_read=
_reg16`, a pointer to a 32-bit `int` (`&reg`) is passed to `spi_write_then_=
read` to transmit a 1-byte command, which breaks register reads on big-endi=
an architectures.
--

commit 4c76d6fe3d1664a2cf635cd569d8b01aeed70678
Author: Tabrez Ahmed <tabreztalks@gmail.com>

hwmon: (ads7871) Use DMA-safe buffer for SPI writes

This commit migrates the SPI write operations in the ads7871 driver to use a
DMA-safe, cacheline-aligned buffer allocated in the driver's private data
structure instead of using a stack-allocated buffer. It also adjusts the sc=
ale
calculation for 14-bit data.

> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -97,11 +98,12 @@ static int ads7871_read_reg16(struct spi_device *spi,=
 int reg)
>  	return get_unaligned_le16(buf);
>  }

[ ... ]

This wasn't introduced by this patch, but since you are fixing
architecture-specific compatibility issues here, I noticed something in
ads7871_read_reg16() just above this diff.

Does passing a pointer to a 32-bit int (&reg) to spi_write_then_read()
for transmitting a 1-byte command break register reads on big-endian
architectures?

static int ads7871_read_reg16(struct spi_device *spi, int reg)
{
        ...
        reg =3D reg | INST_READ_BM | INST_16BIT_BM;
        ret =3D spi_write_then_read(spi, &reg, 1, buf, 2);
        ...
}

On little-endian architectures, this correctly reads the least significant
byte containing the command. On big-endian architectures, wouldn't it read
the most significant byte (0x00) instead, sending an invalid command to
the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418034601.9022=
6-1-tabreztalks@gmail.com?part=3D3

