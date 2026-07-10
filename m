Return-Path: <linux-hwmon+bounces-15763-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ipFtD0raUGo36QIAu9opvQ
	(envelope-from <linux-hwmon+bounces-15763-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 13:40:58 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916173A597
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 13:40:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ee5L9CZ2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15763-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15763-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3153013D54
	for <lists+linux-hwmon@lfdr.de>; Fri, 10 Jul 2026 11:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA2141DEE4;
	Fri, 10 Jul 2026 11:35:09 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C3E41F7F3
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:35:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683306; cv=none; b=spOZnMnHugJBmbT1ARPRVVexkOF2CcF0myHlM7Q2kuYgVODVQJy0haRGUOFgs23Xpgd5v3zCOAe09w64uKJYv9uv0n5Uxfrixl47WbPOOG3YQs2T+VS967lQUnBY46IXMm5vcglg4/DT0C+fcAvtcQnczg2gLSbEUeljilnpBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683306; c=relaxed/simple;
	bh=VUL5zuuUlykHNb6n3Mxny67pW9N9tVzZWAyJU2ZnJLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kP8UWOIdhae3roO82w/GIIS1kmqjDy50byBV7upmgXanUYw/9/+sHV8Rtj8BB2eauMiPT27+cV8u8+l9w0CiPcV+r9MWClTIxpDw75qu0JZ1V4/dzjgXO7BNfYF+y3vTWbfhGomrdUTk2GnpDAOGDwEgmo2oHQ/rHlCDYol1NHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee5L9CZ2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB501F00A3A;
	Fri, 10 Jul 2026 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683296;
	bh=Sw/ETUmGXENS4YZhfNMd7WZY2UNB9ZOlYxROEwGNjzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ee5L9CZ2sGtxHL3YFS0LLdHtD43qIxcVt93ESjdZ4F+fXwN1wOaC3J3UCIxa+RKV/
	 NF6PHAcyM4w8wRjdHmDzvf0YjFFdw23kb4I3TWbcvbP0sMz6SggtuEwnQjcb7qS9zJ
	 eHsSa0VFT6bKgV+JILgztmZYiHiH2LQct/pchAozYqMdPV9YHn328V6a7XaTJekyW6
	 2BT+IRvQZOD+0i+nQKGek3loSzv8QEpk4kn63youe4aDiWbcTbqds+iJ/ae6IHfRP4
	 hbr5sYgYt/3uQ43bFEi+GJtyTSt/HnhLSm2QSdrVuA/xnXL8SP2O15A6uQWdUG4uxa
	 vgI/d03THpXag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] misc: amd-sbi: Add support for SB-TSI over I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-6-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-6-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:34:55 +0000
Message-Id: <20260710113456.5FB501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15763-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Akshay.Gupta@amd.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8916173A597

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Concurrent hwmon sysfs accesses cause data races on the shared I3C=
 DMA buffers (`priv->tx` and `priv->rx`) due to missing locking.
- [Medium] The I3C transmit buffer `tx` in `struct sbtsi_i3c_priv` is not c=
acheline aligned, violating DMA mapping requirements.

Pre-existing issues:
- [High] Temperature register reads are performed non-atomically without a =
device lock, breaking the SB-TSI hardware latching mechanism on concurrent =
accesses.
--

--- Patch [5]: [PATCH v4 5/8] misc: amd-sbi: Add support for SB-TSI over I3=
C ---
commit f466305c592ff454f903d27fc9a9ef283f005d66
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Add support for SB-TSI over I3C

This commit extends the AMD SB-TSI driver to support both I2C and I3C bus
interfaces. It selects the appropriate transport based on the probed bus ty=
pe
and registers both drivers using module_i3c_i2c_driver() while maintaining
backward compatibility with existing I2C deployments.

> diff --git a/drivers/misc/amd-sbi/tsi-core.c b/drivers/misc/amd-sbi/tsi-c=
ore.c
> index 6ef1831515bbb..1c6f37f26d945 100644
> --- a/drivers/misc/amd-sbi/tsi-core.c
> +++ b/drivers/misc/amd-sbi/tsi-core.c
[ ... ]
> @@ -23,8 +28,56 @@ static int sbtsi_i2c_xfer(struct sbtsi_data *data, u8 =
reg, u8 *val, bool is_read
>  	return i2c_smbus_write_byte_data(data->client, reg, *val);
>  }
> =20
> +/* I3C read transfer function */
> +static int sbtsi_i3c_read(struct sbtsi_data *data, u8 reg, u8 *val)
> +{
> +	struct sbtsi_i3c_priv *priv =3D to_sbtsi_i3c_priv(data);
> +	struct i3c_xfer xfers[2] =3D { };
> +	int ret;
> +
> +	priv->tx[0] =3D reg;

[Severity: High]
Does this sequence need synchronization to protect the shared priv->tx and=
=20
priv->rx buffers?

The hwmon subsystem does not serialize reads and writes to sysfs attributes.
Without a lock protecting these buffers during the bus transfer, concurrent
sysfs reads from multiple threads could race, causing threads to overwrite
the transmit payload or read incorrect response values before or after
i3c_device_do_xfers() completes.

> +
> +	/* Write the register address (DMA_TO_DEVICE). */
> +	xfers[0].rnw =3D false;
> +	xfers[0].len =3D 1;
> +	xfers[0].data.out =3D priv->tx;
[ ... ]
> +/* I3C write transfer function */
> +static int sbtsi_i3c_write(struct sbtsi_data *data, u8 reg, u8 val)
> +{
> +	struct sbtsi_i3c_priv *priv =3D to_sbtsi_i3c_priv(data);
> +	struct i3c_xfer xfers =3D {
> +		.rnw =3D false,
> +		.len =3D 2,
> +		.data.out =3D priv->tx,
> +	};
> +
> +	priv->tx[0] =3D reg;
> +	priv->tx[1] =3D val;

[Severity: High]
Similarly, could concurrent sysfs writes overwrite priv->tx here before
the i3c_device_do_xfers() call finishes?

> +
> +	return i3c_device_do_xfers(data->i3cdev, &xfers, 1, I3C_SDR);
> +}
> +
> diff --git a/drivers/misc/amd-sbi/tsi-core.h b/drivers/misc/amd-sbi/tsi-c=
ore.h
> new file mode 100644
> index 0000000000000..7e8c0e7c3bcfa
> --- /dev/null
> +++ b/drivers/misc/amd-sbi/tsi-core.h
[ ... ]
> +struct sbtsi_i3c_priv {
> +	struct sbtsi_data data;
> +	u8 tx[2];
> +	u8 rx __aligned(ARCH_DMA_MINALIGN);

[Severity: Medium]
Should the tx array also have the __aligned(ARCH_DMA_MINALIGN) attribute?

Without it, tx might share a cacheline with the preceding struct sbtsi_data
fields. When tx is mapped for DMA to device transfers during I3C operations,
this violates the DMA mapping rules preventing cacheline sharing and can
trigger kernel warnings.

> +};

[Severity: High]
This isn't a bug introduced by this patch, but does the lack of a device-le=
vel
lock around temperature register reads break the hardware latching mechanis=
m?

Looking at drivers/hwmon/sbtsi_temp.c in sbtsi_temp_read(), the integer and
decimal registers are read sequentially:

    ret =3D sbtsi_xfer(data, reg1, val1, true);
    if (!ret)
        ret =3D sbtsi_xfer(data, reg2, val2, true);

If multiple threads concurrently access sysfs, these non-atomic transfers
could interleave on the bus. This might cause one thread to receive a
mismatched latched decimal value triggered by another thread's integer read,
resulting in corrupted temperature reports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D5

