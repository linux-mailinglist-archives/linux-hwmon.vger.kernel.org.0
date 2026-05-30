Return-Path: <linux-hwmon+bounces-14652-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULi7MS9pG2oxCAkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14652-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:48:15 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40173613B07
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A529B302001B
	for <lists+linux-hwmon@lfdr.de>; Sat, 30 May 2026 22:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E52352021;
	Sat, 30 May 2026 22:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpuqYrRD"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3086826C385
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780181246; cv=none; b=WDOOcb/qDCVpv2nKp0YK5enMvd+01Eboml7oj2dGCIqVop/SpyQT1onX6ZeVxsK5VHbUPBt4KK7asjuR+CgBJbLP8oHiSzEoS+FtjF3QieoH0h5/J01iFt0o9fFS0mIvhKQUxTQqfQcx77sAtdty9Lj6LFrH6ys+00F1xbrsH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780181246; c=relaxed/simple;
	bh=px4KmUl96qe5VsDFbUFU5jObhkyvW1dkvHlwL1m1XNM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UOrtXkqOn9YUQSXT8YOJ1x6ix6PkuxEI3ltyRBeOvAZTyBPZThMvQoNoxiAnL0BcwcxBi9KYdLDJG5ZsiKzwzRuy0pqGKjlmVumSGE1huIo5bgQWTOlg4cBYN/RJlVY/w8BzFVMk6JcCDMW4SJimBABM6zmaTVVJ/Iv/jS6WQmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpuqYrRD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AD11F00893;
	Sat, 30 May 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780181244;
	bh=iYP5++8MFye1VtDfJZklcX7sepAVH4b5OW862OB5q+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpuqYrRD8IrbyGiDrrQ8K+wHrnvtktOmUxRt5Zkh9Pp+WbXOtLDRSl46BEQA5lIq8
	 DStUDMYVR2p81huqPbaQ58Oyle3sun8S1Hh9+BdcqB0uCNJSaOfWVpPBrMKhV2iTK2
	 6WJZKfGhwS5X7e3ll8mtBa2XGevZp99Cq0G0rPF5SnsukBHsOICLP7/0nIs0F41tgx
	 yXakq6KUCN6KTMYUnFvDfZF4Edvxa7S7ld5KA5Wgl2sgtQa0mvqyHIdq2RknL/BLD9
	 d4NsPRz/oqnlQoqhWdrQOGN1Ka5x/WZovMb6BS3H1SR1r8dyEQ2h/VTYFJ+EGjh/b7
	 NlwSLQ+NUbJFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] hwmon: it87: Use zero-initialization instead of
 memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-8-manishbaing2789@gmail.com>
References: <20260530221353.159461-8-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:47:24 +0000
Message-Id: <20260530224724.A8AD11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14652-lists,linux-hwmon=lfdr.de];
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
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 40173613B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Replacing memset() with empty brace initialization leaves struct=
 padding bytes uninitialized, causing a KMSAN uninit-value warning when cop=
ied via platform_device_add_data().
--

commit 429f8b305f54cb034b99374e3bdaa61a1ba8f424
Author: Manish Baing <manishbaing2789@gmail.com>

hwmon: it87: Use zero-initialization instead of memset()

This commit reduces the scope of 'sio_data' by moving it inside the for-loop
and replacing the explicit memset() with empty brace initialization.

> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5fd310662ee43..f3f8d835ff92a 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -3777,7 +3777,6 @@ MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
>  static int __init sm_it87_init(void)
>  {
>  	int sioaddr[2] =3D { REG_2E, REG_4E };
> -	struct it87_sio_data sio_data;
>  	unsigned short isa_address[2];
>  	bool found =3D false;
>  	int i, err;
> @@ -3789,7 +3788,7 @@ static int __init sm_it87_init(void)
>  	dmi_check_system(it87_dmi_table);
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(sioaddr); i++) {
> -		memset(&sio_data, 0, sizeof(struct it87_sio_data));
> +		struct it87_sio_data sio_data =3D { };

[Severity: Medium]
Does replacing memset() with empty brace initialization leave struct padding
bytes uninitialized?

Empty brace initialization is often lowered by compilers to member-wise
zeroing, which skips padding bytes.

When this structure is passed to it87_device_add(), it is copied
byte-by-byte via platform_device_add_data():

drivers/hwmon/it87.c:it87_device_add() {
	...
	err =3D platform_device_add_data(pdev, sio_data,
				       sizeof(struct it87_sio_data));
	...
}

Because platform_device_add_data() uses kmemdup() to copy the entire size of
the structure, won't reading the uninitialized padding bytes trigger a KMSAN
uninitialized-value warning during driver probe?

>  		isa_address[i] =3D 0;
>  		err =3D it87_find(sioaddr[i], &isa_address[i], &sio_data, i);
>  		if (err || isa_address[i] =3D=3D 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530221353.1594=
61-1-manishbaing2789@gmail.com?part=3D7

