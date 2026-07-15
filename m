Return-Path: <linux-hwmon+bounces-15923-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pwORBmRSV2oMJQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15923-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 11:27:00 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD475C78C
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 11:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xjy2E3uY;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15923-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15923-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90C60307A155
	for <lists+linux-hwmon@lfdr.de>; Wed, 15 Jul 2026 09:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7931A41D649;
	Wed, 15 Jul 2026 09:17:31 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1941D65D;
	Wed, 15 Jul 2026 09:17:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107049; cv=none; b=K5tCBXPatbLjWwxGWuUzLIfzEb+O+VZRoJOXRQo22dR9t8II7EJaG/JVotCbpVC+s3qGbN28i4o4QDgZtfsByP6Jjn81Jjz0qJAXbRoOEsEYXawHLRX+x+XmkM8h+iqs8geus9fBBGq+9fXVpIE5r9rextpI+AxyiQgfWvGlF8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107049; c=relaxed/simple;
	bh=VgHMCGzNBXGaPywPybMQMIbKO8EQpYffRuRZpY/DQys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQOq+yMJFc61cCGaTtyxeLFQ0avBx2FmECtZ/uigoXNaPGDZ+H0pOCrMLPc+qIA2ADvmVunWHvWv7NGT5Rg+N0Df8xItjiyh0ZKK2n4L3fASZ7GLsFuprP+Q/91VEc3suezMDsPKrmTpZiB3zq6L6qtIZEb+M+JXvzbcVq/dkKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xjy2E3uY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BC21F000E9;
	Wed, 15 Jul 2026 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784107044;
	bh=BMtuoqFSnZRAC/VAd7l7Q/Lccquxe4xx3tV4v3AAv9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xjy2E3uYq21Yon4JMrD6i/FYSCf43J52rV2l10QDmWd2G9e9UCefPWROINhLqFV8j
	 9DD+G7v1R8ZyuVDrueh16eDtOr8a+bLBdCi+Wgvg9SAAceKH5M+hc+u0KMdYW6GTxu
	 LwFczGFs1YhDUb4A7ecP8dQX5e9yzZ3wSHZXuOyjq0u92PYFMlKgdR3tdzD/fET/Wy
	 4c3wSbK9TdJxp8PGPf6Af4S7ETDBheUKerHsMTVeznjEU+hvrUxtZloefoEGcHNtjP
	 gL/xRny6AI1FitBFzYrt2nEzqzJsRKomrBv10xAIUejhGJvLRBgaBE+0jv3L8Ae8eK
	 4kIEUvo+R4C2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-kb9002-upstream-v2-3-2fd390383da5@amd.com>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-3-2fd390383da5@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:17:23 +0000
Message-Id: <20260715091724.18BC21F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15923-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Andy.Chung@amd.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DFD475C78C

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver implements its own internal mutex for locking hardwar=
e accesses instead of using the hwmon subsystem's `hwmon_lock()` API.
- [Low] The `i2c_device_id` array is initialized using a positional instead=
 of a named initializer.
--

--- Patch [3]: [PATCH v2 3/4] hwmon: (kb9002) Add driver for Kandou KB9002 =
retimer ---
commit 59c6448090144292eb629f4257436694b1eaaa0d
Author: Andy Chung <Andy.Chung@amd.com>

hwmon: (kb9002) Add driver for Kandou KB9002 retimer
   =20
The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
target with mandatory PEC. Add a hwmon driver reporting the firmware
aggregated maximum die temperature as temp1_input, with the firmware
version and boot status under debugfs.

> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
> new file mode 100644
> index 0000000000000..94c7d95b3fff5
> --- /dev/null
> +++ b/drivers/hwmon/kb9002.c
[ ... ]
> +struct kb9002_data {
> +	struct i2c_client *client;
> +	struct mutex lock;	/* serialises register accesses */
> +};
[ ... ]
> +static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
> +{
> +	struct i2c_client *client =3D data->client;
> +	u8 addr[2];
> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	put_unaligned_le16(reg, addr);
> +
> +	mutex_lock(&data->lock);

[Severity: Medium]
Is this custom mutex necessary? The hwmon subsystem guidelines state that
drivers should use hwmon_lock() and hwmon_unlock() to serialize operations
for attributes registered by other means.

By using a custom internal mutex, does the driver bypass the standard
subsystem synchronization architecture and introduce inefficient double-loc=
king
on sysfs reads, which are already protected by the hwmon core?

[ ... ]
> +static const struct i2c_device_id kb9002_id[] =3D {
> +	{ KB9002_DEV_NAME },
> +	{ }
> +};

[Severity: Low]
This isn't a bug, but does this array initialization bypass the I2C
subsystem guidelines?=20

The I2C client initialization rules request that initialized arrays of type
struct i2c_device_id use named initializers rather than positional
initializers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-kb9002-ups=
tream-v2-0-2fd390383da5@amd.com?part=3D3

