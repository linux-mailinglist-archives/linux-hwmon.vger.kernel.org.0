Return-Path: <linux-hwmon+bounces-15147-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XOiwHtgkMWp3cgUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15147-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:26:32 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98568E3C9
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 12:26:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T2BoJrQp;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15147-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15147-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E7CA31F22A6
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 10:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBBF42883B;
	Tue, 16 Jun 2026 10:10:04 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2E4279F7;
	Tue, 16 Jun 2026 10:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604604; cv=none; b=KXCCsZQ/00UQrmnx717yOXbOE9OWqBU4e0DK8fnDIFcaZCk+uliPpJSPKDqtxe6/YdMRGXfK+at74dtljyh10tuHiQu/SiSLVXwZy0m9AT3kKpjczIZlgM86a4uk/k5YXzPSVrcN6sDWuNiOFnnGUORMmx1XpbkMp4/fYDpCJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604604; c=relaxed/simple;
	bh=7BOuOW+gx8Zukt1P3EBkLq6Bwvz9gfQYmCoCyoMelJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZxBV1yCL+1SMibWXOPzclVA8o/AG4Novdny5ZNrDJQ8pTJurCq7SnwqM2YOe0DNpNvaNos1qA5sbokgejPMmxG2C3pfOGJhQQ6eY55sPM82yAl7zi7yE99fUYy8xkg/EUmIraQjVpHaKDeBz60E3OpxxlimxOtwOTHItvQd3wkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2BoJrQp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D4D1F00ADF;
	Tue, 16 Jun 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604603;
	bh=7BOuOW+gx8Zukt1P3EBkLq6Bwvz9gfQYmCoCyoMelJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2BoJrQpSnonZxDaDdWu81uAvwmPZqjAw00wkj49eZt6ujR80LGL29k+yznKCZExR
	 Inm0neB7S2ZaTSVr+x8jAzWXqRhm6v9t1eHXM+1xa4iklH9cjhiZre/36bHdeGErC7
	 gdc6l9heBHFWhQkczIJ95LPBH3mAD/HQX9TTaOnUVEXSV0BC20VAe5UTDX8M1AyYVe
	 slcCZu8tRiZHZxeOFL1fT5G60douk6NfV39bnM/fMbG0eyuzMKZePeTMHwOGsLoEdb
	 FlNHimdgKZrMcBPnzIGgPTkv/TmYTxNgtV6al6/MFmpt1GWMisfiivJtjVSJnPBmRY
	 8OOsPIgO/3CRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:10:01 +0000
Message-Id: <20260616101001.C5D4D1F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15147-lists,linux-hwmon=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:linux-hwmon@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,nvidia.com:email,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA98568E3C9

> Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
> (DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
> as modules.
>=20
> The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
> SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
> accessible over the I3C bus through the DesignWare I3C controller present
> on the SoC. Enabling these configs allows monitoring memory module
> temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
> platform and does not use device tree.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D12


