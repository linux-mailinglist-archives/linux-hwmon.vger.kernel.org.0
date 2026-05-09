Return-Path: <linux-hwmon+bounces-13894-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qADzMWAo/2ni2wAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13894-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 09 May 2026 14:28:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E24FF99F
	for <lists+linux-hwmon@lfdr.de>; Sat, 09 May 2026 14:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DAC300F9C8
	for <lists+linux-hwmon@lfdr.de>; Sat,  9 May 2026 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C07362153;
	Sat,  9 May 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJwMMJk1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D4B362130
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778329683; cv=none; b=ZZVs5ytXUJP9iSOR+h+F/TZQbbxEXuYwJpfE/KxmJrQuK2ukYXm1Xl1K3h6LlNUI4ogkdBKF4JNIfhlaS5fvbAQTLuQvBf0sbwFnU7hylrDD7PrVnrA5VuyyVxllS3GvA6cZGBl+tvrXYxTDGiOPHtrUL9mmUt+u7zFQ/OnrruE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778329683; c=relaxed/simple;
	bh=GSma/AppeRmrHt9JhHJzGO+RdeFIPPBcdef71DoB5AE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bVKzuEOkSSpb2bOx5GOa+BRf1auvYyMxR1kIO/zcT43sxfvSj8zhAd5ZInrr08wMUoAYozrAN9U7nRbz1hwPoL9pu2yymyIvHfmnYcOXPkT/v5Ts79yW1SAFC8QrC2erpjp9u/VXAKgbWUgKSZ1OyzltgHETlOV5W2erSu3pD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJwMMJk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDD0C2BCB2;
	Sat,  9 May 2026 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778329683;
	bh=GSma/AppeRmrHt9JhHJzGO+RdeFIPPBcdef71DoB5AE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=rJwMMJk1zopSyn4g/KmmNcOeLkHzui+yW/ZvQnUQFcbORMIu4iOxq9iePDW+6irzD
	 1vTjAvVl7pwrB2PE+XQGH9fbFaZxpOBQmlcH2UBC2DQTKn8WhFG04qbeFhLjNz7QNV
	 pTgAz4Zc9VlPb0mNGHhYVRPOgdBV9J9S4/SM62mALY514UUW8dFOLpIiqM3hjEEjVP
	 ex1yL8t4d98A/uNCYjgXxvePNzTgFym5Y/85A0E4Kt21o7JjGRmcefcT0qM4kWbBvP
	 BFI7GZnlykdIEXPCGz3y34Y8cHm8vYKg5XGobUc9CSBZZM6Gty/rdiKtwmUyIpdhXV
	 cZVcosmK6DRDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (tmp102) Use device_property_read_string API
Reply-To: sashiko@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260509121511.60601-1-flaviu.nistor@gmail.com>
References: <20260509121511.60601-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 12:28:02 +0000
Message-Id: <20260509122803.1FDD0C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 280E24FF99F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13894-lists,linux-hwmon=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,smtp.kernel.org:mid,lists.linux.dev:replyto]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces an implicit header dependency and leaves cr=
oss-firmware compatibility incomplete by retaining the `of_match_ptr()` mac=
ro.
--

commit 8699d5dea7c2614372ba1cab8f6b99f73ebebe1e
Author: Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: hwmon: (tmp102) Use device_property_read_string API

This patch replaces of_property_read_string() with
device_property_read_string() for reading the device label. It aims to
improve compatibility since the new method is not limited to Device Tree.

> improving the driver
> compatibility since this method is not limited to
> Device Tree only.

If the goal is to improve non-Device Tree compatibility, shouldn't
of_match_ptr() also be removed from the i2c_driver struct?=20

When CONFIG_OF is disabled on ACPI-only platforms, of_match_ptr()
evaluates to NULL. This prevents the standard PRP0001 mechanism from
matching the driver via compatible strings.

> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 3aa1a3fbeaa92..79578b28a91d3 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -15,7 +15,8 @@
>  #include <linux/jiffies.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> -#include <linux/of.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>

Does removing this include create an implicit header dependency?=20

The code still uses of_match_ptr() further down in the file:

drivers/hwmon/tmp102.c:
static struct i2c_driver tmp102_driver =3D {
	.driver.name	=3D DRIVER_NAME,
	.driver.of_match_table =3D of_match_ptr(tmp102_of_match),
	...
};

Since of_match_ptr() is defined in linux/of.h, the file now relies on
another header to implicitly include it. Dropping the of_match_ptr()
macro entirely would safely resolve this implicit dependency and fully
support the cross-firmware compatibility goal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509121511.6060=
1-1-flaviu.nistor@gmail.com?part=3D1

