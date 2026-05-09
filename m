Return-Path: <linux-hwmon+bounces-13891-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFU9Gpoc/2m92QAAu9opvQ
	(envelope-from <linux-hwmon+bounces-13891-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sat, 09 May 2026 13:38:02 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF764FF7B3
	for <lists+linux-hwmon@lfdr.de>; Sat, 09 May 2026 13:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FAF93013038
	for <lists+linux-hwmon@lfdr.de>; Sat,  9 May 2026 11:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424592C15AB;
	Sat,  9 May 2026 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMHzbL1Z"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8D8834
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778326679; cv=none; b=W9m9HCIZQ9NtCiS0sFJ1Fa/BWYGaY14OYFGUCa7RxLy8dzHL25djWRYcGMMPio2rwzhohZqYEJDqgr7w3NLf3FWK6LXgEyyzC1EGQlSx9IWS+hHsZ43byFfu8Ms6zpgR7cT2l2vK/chcKveOAnsUAyX1Yu9rJj88k8a7oyE5+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778326679; c=relaxed/simple;
	bh=A8N5DOCIzZM5H658iAVzo3ivMBtJ+Z7WVKzU/a6gn5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uufliY0JOCOvI9xUrAyPzIMpWpG3nrfuvohrAegMTwnZnaFimdGBn7yiNuLgXYTHiT/84tv9unc6j/oAECZr3ck5NxZmisi+rCxazPzHfiPiH6lcynpU+Qs+E/G9hdDHZEybiBtKlkxSAqqt2emoGtNpIpcna2i7UbOHu3fMNVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMHzbL1Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D0CC2BCB2;
	Sat,  9 May 2026 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778326678;
	bh=A8N5DOCIzZM5H658iAVzo3ivMBtJ+Z7WVKzU/a6gn5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=vMHzbL1Z3a3J/mEzfo/6YRZTUJ/gBfVQMBSZHYCLNXIrZx64hcEzjGRIOTCVatT9g
	 L+E4Ml+WLBtFVxZSZeZcjfc/8np5oAoJBAw7TTUMofJo7v592XdA7mODSB6cY0nvH6
	 2GiuqXIzJAg7rQAwwKSuw8SMzIpcGbjA5mZGuGDphj8BE2GUyApJ2KzEzqWzDBa2Ru
	 8nZqonjJeIC+sAUOXhxpinJdCCeLC59DUNOIxMdtO+kMJYTbbeRfn6B9DZ8QPyt+R/
	 o3sQPzRefgdJ/HovhqqhfaZjsgJoYqeRIIOt+okwKhLYRBFznY2izmHd+VMwvN87Jh
	 zuxHmGZsonBvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (tmp102) Change mode to read label property
Reply-To: sashiko@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260509112417.51164-1-flaviu.nistor@gmail.com>
References: <20260509112417.51164-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 11:37:58 +0000
Message-Id: <20260509113758.93D0CC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: ADF764FF7B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13891-lists,linux-hwmon=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[sashiko@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Action: no action

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete transition to firmware-agnostic API due to remaining =
`of_match_ptr()` usage.
- [Low] Missing inclusion of `<linux/property.h>` for `device_property_read=
_string()`.
--

commit 1666c25db837ad9f0af1e26c9adc185e78ab62e5
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (tmp102) Change mode to read label property

This commit replaces the Device Tree specific of_property_read_string()
with the firmware-agnostic device_property_read_string() in the probe
function. This is intended to improve driver compatibility beyond just
Device Tree.

>     Replace of_property_read_string() with the preferred
>     device_property_read_string() in the probe function to
>     read the device label property, improving the driver
>     compatibility since this method is not limited to
>     Device Tree only.

If the goal is to improve compatibility beyond Device Tree, should the
driver also drop the use of of_match_ptr() around the match table?

When the kernel is configured without CONFIG_OF (such as on ACPI-only
systems leveraging PRP0001 for DT-style matching), of_match_ptr() evaluates
to NULL.

This drops the match table entirely and prevents the driver from binding,
which seems to contradict the intent of this patch.

> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 3aa1a3fbeaa92..a89cc49798f54 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -313,7 +313,7 @@ static int tmp102_probe(struct i2c_client *client)
>  	if (!tmp102)
>  		return -ENOMEM;
> =20
> -	of_property_read_string(dev->of_node, "label", &tmp102->label);
> +	device_property_read_string(dev, "label", &tmp102->label);

Does this code require an explicit inclusion of <linux/property.h>?

While it may currently compile due to implicit transitive includes, relying
on them is fragile and could cause build regressions if those headers are
refactored in the future.

> =20
>  	i2c_set_clientdata(client, tmp102);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509112417.5116=
4-1-flaviu.nistor@gmail.com?part=3D1

