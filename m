Return-Path: <linux-hwmon+bounces-13192-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5P8KCWhT2GmqbwgAu9opvQ
	(envelope-from <linux-hwmon+bounces-13192-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2026 03:33:28 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343A3D11D5
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2026 03:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A5E43009B29
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Apr 2026 01:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCEC2857FA;
	Fri, 10 Apr 2026 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1zIZhpn"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB01A3172
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 01:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775784803; cv=none; b=lvv1iyxVRAMHAqzBSlLpn+E2gao2ykjmdrHKZgHM8wX+b4vJTdw5nV2GK1P74iCzhLf7bHcfG+HehRt+wKdJTeUzfrJY7CMAJQzkbGdmfpTDOjNNrbEnV7svaSuFDQrYaF0d0nXCRgaEr2lFycjoKU+jzVOa4fsQxT9pA+KyveE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775784803; c=relaxed/simple;
	bh=Nu701BPDCRtTk4eGWZEKY6d7uYim78imuTXWlimk12M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WMjJiA3/LhP3bTh9diwB7oWgGvwBhQZBM2PN66DCUtwV44WTX/7KnMUSI3EXMdHXHQlh1HqEHgTN6Sm7F/W21GI602GKnio9xchAVK0kQZOlO0gF+KN9T+h4SoAGz8RXoWeK+hXlCtqP4ql8iHD0hxXLGBJ3mG0uvgQ+A7JwaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1zIZhpn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42269C4CEF7;
	Fri, 10 Apr 2026 01:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775784803;
	bh=Nu701BPDCRtTk4eGWZEKY6d7uYim78imuTXWlimk12M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=o1zIZhpnp3TbR7UBGQAWQiEZgKChmpswm6P95yULQnGMKaay3SYhzoQZ7Rd71Fl2Y
	 nfLezN0e/yCpK8wp1dS+he2MReU/wKqoy+9BgZyyWuNITj+tgD1PaIcLW9zNviaLCr
	 XH3mQGvY/Ysajttf1MWimW94lwnWuYUcgcFR5EJbBu2rycW9wkiRxjr6TbrhSEjdOF
	 RZETcryNZAZCxUU1CfkJCjEMYypGWQzaTXhlm0Poudyev8+2MVE/r8tOis9gmqP1Ye
	 frFMdnr6Df9g6rxuVbfdnKuFmRLqdmyPl63PDukxUEmLZnFZ+jIrlNXBcmB2iEaBEL
	 2sGUhGDRtWJug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (powerz) Fix missing usb_kill_urb() on
 signal interrupt
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260410002521.422645-3-sanman.pradhan@hpe.com>
References: <20260410002521.422645-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2026 01:33:21 +0000
Message-Id: <20260410013323.42269C4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [1.34 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	TO_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13192-lists,linux-hwmon=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
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
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev]
X-Rspamd-Queue-Id: 8343A3D11D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [Critical] Unsafe DMA Buffer Allocation / Cacheline Sharing in `struct po=
werz_priv`
--

commit eb68688b567b41c8eb7f2b911d80d14a178791ce
Author: Sanman Pradhan <psanman@juniper.net>

hwmon: (powerz) Fix missing usb_kill_urb() on signal interrupt

This commit fixes a bug where wait_for_completion_interruptible_timeout
returning a negative value due to a signal would bypass the usb_kill_urb
cleanup. It captures the return value into a long and handles both the
signal and timeout cases appropriately.

> diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
> index a75b941bd6e2f..96438f5f05d48 100644
> --- a/drivers/hwmon/powerz.c
> +++ b/drivers/hwmon/powerz.c

[ ... ]

> @@ -127,8 +128,14 @@ static int powerz_read_data(struct usb_device *udev,=
 struct powerz_priv *priv)
>  	if (ret)
>  		return ret;
> =20
> -	if (!wait_for_completion_interruptible_timeout
> -	    (&priv->completion, msecs_to_jiffies(5))) {
> +	rc =3D wait_for_completion_interruptible_timeout(&priv->completion,
> +						       msecs_to_jiffies(5));

This isn't a bug introduced by this patch, but could this completion logic
be vulnerable to memory corruption on architectures with larger cache
lines?

Looking at struct powerz_priv:

struct powerz_priv {
	char transfer_buffer[64];
	struct mutex mutex;
	struct completion completion;
	struct urb *urb;
	int status;
};

Since transfer_buffer[64] only occupies 64 bytes, could it share a
cacheline with the mutex and completion fields on architectures where
ARCH_DMA_MINALIGN is greater than 64?

When the USB subsystem unmaps the DMA buffer after a transfer, the DMA
layer might invalidate the entire cacheline. If the CPU concurrently
modifies the completion or mutex fields during wait queue operations
or locking, could those CPU writes be lost due to the invalidation?

Would it be safer to allocate the transfer buffer separately using a
dedicated allocation, or add adequate padding to ensure it occupies its
own cacheline?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260410002521.4226=
45-1-sanman.pradhan@hpe.com?part=3D2

