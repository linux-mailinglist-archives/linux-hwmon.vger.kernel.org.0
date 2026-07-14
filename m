Return-Path: <linux-hwmon+bounces-15880-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JPX6HUHzVWrlwgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-15880-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 10:28:49 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DF75262F
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 10:28:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jrdXMzLm;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15880-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15880-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE89E3080265
	for <lists+linux-hwmon@lfdr.de>; Tue, 14 Jul 2026 08:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAFC3FBB6C;
	Tue, 14 Jul 2026 08:23:47 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3553F39D1;
	Tue, 14 Jul 2026 08:23:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017425; cv=none; b=Suq7zYNwRtPP8JfXnk2Sw+XGiyvhY1C49P4fsyNlP0DRK4Ze1/bts6mGx+sWGOXuRwbXdZQeLeC24FWcc9hHEeg0VF8w2GXW5lju4t0QPka6Dt5IkUNDJBhINVjK/pWPw1F89eDzp8FNR+9Hed3PlpKhtLrPyWpcBuhms/4vTQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017425; c=relaxed/simple;
	bh=Y0Qv4GmyCJwBPyPoOznnbiyGTDCnJfg9OpK6ExuHzPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eep3+6DR3nSU3vtm+j2mCNBNiid3LvTBwgtyTxRTXi+3x/y3XBNPAheYtrU2ZJKymVTrJlz4+AMHf6l/Cu+wu2JRKhoMrTLee+/PH2FLyVdqXRQY29NH/fmIWj8jbUSyLrtf/t8Sr5labkosIbFLEMh2iOi18tvA4HfTQDbpHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrdXMzLm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6C41F000E9;
	Tue, 14 Jul 2026 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784017416;
	bh=Y0Qv4GmyCJwBPyPoOznnbiyGTDCnJfg9OpK6ExuHzPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrdXMzLmrHG5F6EBOMdASjbDqngj6N8RUEE6ESknve7LOvxVo1LyzmYCDVedgkfQm
	 wucsyLBz6UCfI9ZeNDBXbT55Smi7zaEF1620lWyCwiSU+3vitffad318/zZu4VVEf1
	 1P16aGNlPWw3E0ziN//teUa615C6yT/bURuW0+3AVdDHeYWT5tAt3ajNnL0VcYqI8K
	 rzcTEZ0jRzXsznKRs9DQrOXlcqLZCkbndOYO5x5L5gQqZpjjAa2cjfIlnGRmY1uxLZ
	 TKM4toXCEEPrwPMj2PWJiMEMOIu8YUUqXVXb/ijCmqSluDJaobxz+J7SZmRuaBXLPN
	 qawA+kGOZ7I2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: Add vendor prefix for Kandou
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260714-kb9002-upstream-v1-1-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
 <20260714-kb9002-upstream-v1-1-8fd2f0b135d8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:23:35 +0000
Message-Id: <20260714082335.BA6C41F000E9@smtp.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15880-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Andy.Chung@amd.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB4DF75262F

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-kb9002-ups=
tream-v1-0-8fd2f0b135d8@amd.com?part=3D1


