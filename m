Return-Path: <linux-hwmon+bounces-15373-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LeDPCfkrPmp3AwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15373-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:36:25 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC96CAFF2
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:36:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h2bdpruW;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15373-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15373-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9872830053A5
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92903E1CEF;
	Fri, 26 Jun 2026 07:36:22 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9883DFC99;
	Fri, 26 Jun 2026 07:36:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459382; cv=none; b=OGJ3UAY5/ax/CnvCyZ/wrZwvomCVi/7m1dxh0qNAHSptg8bAnQCekMhRM/TxGiXRksCPUTTOSoOcOjQB+n3WGwO868+csQ5QBEDDiRckbUVf2twZMzcJPHT4hhvtqfG+p1w8Ss6xtMbNqfW2IafGu+3iYNSpKVr2GNtYQVeHITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459382; c=relaxed/simple;
	bh=xmFP05WHBPMyF35OklYGDV36v2RGs9esVzdp6NF1aYc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPMEOr3g36DNKompH6IiX8iOnfMFP6Cf5PtMh6OoR4Vri2wo3l8+4KNo5fwmdyb6zwJP3TWvif42pcKCWIa7kq53U7+0YNlVxV67t8jx1bnKkT1c6ZZ33bq8+DjksQ3mQKflf9AslCPl4+DhGeLWrTFFe7Ve7ArLZySKqDifVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2bdpruW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F621F000E9;
	Fri, 26 Jun 2026 07:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459381;
	bh=ZN5NHSpvmEE1VuRw+cfKRSbCpZ2feyx0jygJnNV3kGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h2bdpruWwlLfQA2O5ribVtDU5wxwAVJHZGxPSnlozAcKuG0qzoZlTcVICZ7GG3i5W
	 W3xu4jzbvzcZiVT6v+4Ilpnqp9CViDGcKiXfKk97mhkgknFuuY7H8SoYHXBYXJRRoU
	 UK4XgiqqZRRUrk3TNwWK28KLq/X36L7IIE1/jfyEWhRor7E8uVMV8mM9UO1ZR9eLHO
	 1uSxLiJBAsZ5akz80WzPbFV7IcrqSPLpZZDL/NJ5TQJgW6Sb2M4xcuIiYrbjD6ZGKX
	 Vq5q+cDCP8gXAN1bTUMpEHcwLOKptWSt3TvJ4F/gbKBIij1Syz4FIcRaxkVxtCyIYm
	 hLEg/sx8unNSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] doc: Add ROHM BD12780 and BD12780A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <5ff4a4a7a939cd642522fde407b5c9fa123a7089.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:36:20 +0000
Message-Id: <20260626073621.16F621F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15373-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rohm.com:url,smtp.kernel.org:mid,sashiko.dev:url,analog.com:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matti.vaittinen@linux.dev,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 84BC96CAFF2

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect hwmon sysfs prefix documented for the BD12780A device.
--

commit f0582b872b8ac6d6f116162797af818e8508125f
Author: Matti Vaittinen <mazziesaccount@gmail.com>

doc: Add ROHM BD12780 and BD12780A

This commit updates the adm1275 hardware monitoring driver documentation to
include support for the ROHM Semiconductor BD12780 and BD12780A power switch
ICs.

> diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm127=
5.rst
> index cf923f20fa523..8a793dd2b412b 100644
> --- a/Documentation/hwmon/adm1275.rst
> +++ b/Documentation/hwmon/adm1275.rst
[ ... ]
> @@ -67,6 +67,22 @@ Supported chips:
> =20
>      Datasheet: https://www.analog.com/media/en/technical-documentation/d=
ata-sheets/ADM1293_1294.pdf
> =20
> +  * ROHM Semiconductor BD12780
> +
> +    Prefix: 'bd12780'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/=
power/power_switch/bd12780muv-lb-e.pdf
> +
> +  * ROHM Semiconductor BD12780A
> +
> +    Prefix: 'bd12780'
               ^^^^^^^^^

[Severity: Low]
Is this prefix accurate for the BD12780A?

When the device is instantiated via Device Tree using the compatible string
"rohm,bd12780a", the I2C core's of_i2c_get_board_info() function extracts
this string, strips the vendor prefix, and sets client->name to "bd12780a".

The pmbus_do_probe() function then uses client->name to register the hwmon
device, which results in the prefix being "bd12780a" instead of the
documented "bd12780".

Could this cause issues for userspace tools relying on the documentation to
find the device?

> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://fscdn.rohm.com/en/products/databook/datasheet/ic/=
power/power_switch/bd12780amuv-lb-e.pdf
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D5

