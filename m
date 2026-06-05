Return-Path: <linux-hwmon+bounces-14730-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eOpEEiVxImpfXQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-14730-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 08:48:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D845645A5C
	for <lists+linux-hwmon@lfdr.de>; Fri, 05 Jun 2026 08:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IEynHDB+;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14730-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14730-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86BB301176D
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jun 2026 06:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716E8406270;
	Fri,  5 Jun 2026 06:36:14 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945F40626E;
	Fri,  5 Jun 2026 06:36:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641374; cv=none; b=Jo+4JeII1RAb0Q24Dhir27sEDVb70IoycFbWSVKsBy6nHtoEjFzJIJpU2qhyIM7I4JmYFY7mNwIkisS165ME0UJ4C6LeoxNSfnI/IXVgf2ZWjwqDpQolWzlI3mBHMY7jgakPuythpiKs5Jv4VHFbc+PhbK7QcY77YtLETHoool0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641374; c=relaxed/simple;
	bh=GFOsmSF7xGGHGNve0ZXiihhLPSYg0higCyjq5rNxFsM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glz/HO/Tnpk92gJ4KRNvv2nr0moNs12MXEQGCL9POIcqeAUTpZnhU6U6ew40jF78Fw99AksGbQSt7BgVEpEh84Ct9QOxfF/c+J7ChCPRlUWMGc8jgDihoPZhLFo6X0yO1Mi8H1i979bxmMYm2mLPR4qpBJSz1VC5LU2VG4U12oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEynHDB+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B760B1F00893;
	Fri,  5 Jun 2026 06:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780641373;
	bh=zqGmJjzMejEpgARljDOHmdjjg2pCSrqlRU8G7+4CtNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IEynHDB+FO8ANFo70UpYiVXJ/wawvJeKxVa3LW2OBs4DgybjJjBPsKkbQXTDfaseA
	 VQxgFgkoDGDkaSzzZxil0e9diLWN7CD+CgTixe23sbZMxMmJcfj8wmZUi5tA1EY+PR
	 3yOsUHo6M0H37yFhOwijRkj9M61A5a5HjU2OKLxHF/O8Ga+qmUsGWtZQmdIQ0ZanxS
	 6Ytv9rvJRvmFgdaxtStTN7wG6cB7DU4q+iESXfqw3FxDDM0gKwMS1sivZihcEHT9fK
	 F4hLLCwRH7xblgcD7Zu3kDC4vwb1G6A9KogxF4mcnBoX0LAhKoZ9cOH0MU4UeZ9eZx
	 LcduiwIVOBMmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: Add documentation for SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605063042.91776-4-zmzhu0630@163.com>
References: <20260605063042.91776-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 06:36:12 +0000
Message-Id: <20260605063612.B760B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14730-lists,linux-hwmon=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,silergycorp.com:email,sashiko.dev:url,smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zmzhu0630@163.com,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D845645A5C

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'Hardware Monitoring Kernel Drivers' index list in `Documentati=
on/hwmon/index.rst` is maintained in alphabetical order. The commit incorre=
ctly inserts `sq24860` between `sparx5-temp` and `spd5118`. Alphabetically,=
 'sq' comes after 'sp', so `sq24860` should be placed after `spd5118` and b=
efore `stpddc60`.
--

commit 65caf89dcee60b08d75fdadfaa3541e74096b753
Author: Ziming Zhu <ziming.zhu@silergycorp.com>

hwmon: Add documentation for SQ24860

This commit documents the supported sysfs attributes for the Silergy SQ24860
PMBus hwmon driver.

> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8b655e5d6b68b..1888905cd2349 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -242,6 +242,7 @@ Hardware Monitoring Kernel Drivers
>     smsc47m192
>     smsc47m1
>     sparx5-temp
> +   sq24860
>     spd5118

[Severity: Low]
This isn't a bug, but the Hardware Monitoring Kernel Drivers index list is
typically maintained in alphabetical order.=20

Since sq comes after sp, should sq24860 be placed after spd5118 and before
stpddc60 to maintain this sorting?

>     stpddc60
>     surface_fan

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605063042.9177=
6-1-zmzhu0630@163.com?part=3D3

