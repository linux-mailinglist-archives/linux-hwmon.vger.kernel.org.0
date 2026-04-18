Return-Path: <linux-hwmon+bounces-13350-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNfzKJUE42nnBQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-13350-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 06:12:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66441FE4F
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 06:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7F9A3008D0D
	for <lists+linux-hwmon@lfdr.de>; Sat, 18 Apr 2026 04:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4106429E10B;
	Sat, 18 Apr 2026 04:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGZTGINQ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E39C272E56
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Apr 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776485511; cv=none; b=rOekArCRJd0hZtOMxLP+7R6EIVGTFPTJzOLkkkNXm2cY4CcvwQXqOS/60cYEH5McX4UuPbO7H+0sJ6g3Viy67ePFn4kuC88KYSSAwWgwEZo2qXsk/BXEnlI/6sM6kk/KvTnizY73VYCpfFee240Qcx3hbjnxi6RGHLv5aPjobzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776485511; c=relaxed/simple;
	bh=CIod9llo2LsEM87Oc5Rrdgap9C+EsbyfXwcxcfgdWHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJChypGICW/lQ2g+6JCV97pAW+IED5ncMvod3CbIKhnsLHN5w6rpMouk2wftoBkSGyXWfyuO9BikPWsxEq259ZGI4EVoGuWwoNED2FJ6PKWGPBfcqnqB/7r8FlrukXW47236obSaxDONd0XwU5nsEoCmaCI26L6DIWISHL4kJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGZTGINQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93415C19424;
	Sat, 18 Apr 2026 04:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776485510;
	bh=CIod9llo2LsEM87Oc5Rrdgap9C+EsbyfXwcxcfgdWHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bGZTGINQy6JdGiX1tvqpPNzHCKGiRNknoFxDdBbakIL+jgtuS2+m9HqRAOrMC+jgY
	 iI0dbnnp7XTBfbbQdOHmspKbMTpiE2tqe4tSsmjYS++OVfHmGa9QuhLme3JwUh4b0o
	 EB1FlX/+dMQ3mQ2t9F11t695hyrUVw+q1GdsFLDplBAUpP86D+NSpff+H7gVGsYKIl
	 sANOqRsbff42u681W6qHRl5eKGsOqkP5vX/rMco8O5zg+V18kkb0+o/YSP0ggRKuvY
	 oj3mOeXJ6sUYkPUKdogjBQuN96kXAloUTTpZBxm9hrcGGQ4cbdsYTAGnciKjxiBwKb
	 x0pcDMWGVS8Fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
Reply-To: sashiko@lists.linux.dev
To: "Tabrez Ahmed" <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260418034601.90226-2-tabreztalks@gmail.com>
References: <20260418034601.90226-2-tabreztalks@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Apr 2026 04:11:49 +0000
Message-Id: <20260418041150.93415C19424@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13350-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Queue-Id: DA66441FE4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sashiko AI review found 1 potential issue(s):
- [High] Passing a pointer to an `int` variable (`&reg`) to `spi_write_then=
_read()` for a 1-byte transmission causes the wrong byte to be sent on Big-=
Endian architectures.
--

commit 4f7407427267b9ca42b213449235bc095cff57b3
Author: Tabrez Ahmed <tabreztalks@gmail.com>

hwmon: (ads7871) Fix endianness bug in 16-bit register reads

This commit replaces spi_w8r16() with a manual spi_write_then_read() into
a byte array to correctly handle 16-bit sensor reads. It then reconstructs
the integer using get_unaligned_le16() to ensure correct behavior across
all architectures.

Closes: https://sashiko.dev/#/patchset/20260329073352.270451-1-tabreztalks%=
40gmail.com

> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 9bfdf9e6bcd77..9b52aa496d522 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c

[ ... ]

> @@ -77,9 +78,14 @@ static int ads7871_read_reg8(struct spi_device *spi, i=
nt reg)
>  static int ads7871_read_reg16(struct spi_device *spi, int reg)
>  {
>  	int ret;
> +	u8 buf[2];
> +
>  	reg =3D reg | INST_READ_BM | INST_16BIT_BM;
> -	ret =3D spi_w8r16(spi, reg);
> -	return ret;
> +	ret =3D spi_write_then_read(spi, &reg, 1, buf, 2);

Will this transmit the wrong instruction byte on Big-Endian architectures?

The variable reg is a 32-bit int, and spi_write_then_read() reads
sequentially from the memory address provided. On Little-Endian
architectures, the lowest memory address correctly contains the least
significant byte, which is the intended 8-bit command.

However, on Big-Endian architectures, the lowest memory address holds the
most significant byte of the int, which is 0x00. Does this result in 0x00
being transmitted over the SPI bus instead of the correct register
instruction?

> +	if (ret < 0)
> +		return ret;
> +
> +	return get_unaligned_le16(buf);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260418034601.9022=
6-1-tabreztalks@gmail.com?part=3D1

