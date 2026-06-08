Return-Path: <linux-hwmon+bounces-14871-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /5LaGd7qJmptnAIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14871-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 18:16:30 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A3658961
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 18:16:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CkrzNhS3;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14871-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14871-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 705A831DD9F2
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 15:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B63D45C3;
	Mon,  8 Jun 2026 15:32:14 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327E3D4129;
	Mon,  8 Jun 2026 15:32:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932734; cv=none; b=VV6sdD3Mv1e2qFiiSJqgzhUAI7KFI4Egv9CWPJeu016zLIdSRDL7oLu5NyOSXZF7Y/fS5kVWRejs/kz8oiGr+G/HNBkSFXXrwFcOM3z7Xh/5Iugo4UxnaKgsQoATexfy18uPVRgEyp5tmaZTinwAjwaTJ1fo+d/L3sFT6ad40fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932734; c=relaxed/simple;
	bh=Cr5P6UnVLY0Djq4F+KHqIlP4aLdikcrY7PkYgIUvDwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cB6emYV19Dpt3ybC7TZarPOApvcYVq5fM135P0n9UsTRgClUUPC4vlrq/T37Oxvj6wnBDIqXZZ2zy8/9QMYG//kAzFtOdRuzAe83dT5qrkqjEuDHOpZBpNFfYyWX8MT2MKuvo30zASMaw9yTTG6n3R/Y5Jq8RazK71yjzvPhaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkrzNhS3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3795A1F00893;
	Mon,  8 Jun 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780932733;
	bh=Cr5P6UnVLY0Djq4F+KHqIlP4aLdikcrY7PkYgIUvDwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CkrzNhS30OF/8c5j6VRuq/tnC8Hl3HzPWX6Oz7Cuboz+xPJfcx6gu070Sy8dpV/IU
	 eRSxUqoPt0qrNBU0wHHaTePC/ssA3tyPaWJjmcEIg66LEkq2KogGo52WOtARUfyYTV
	 WryTmdfJ1lD92/CKepQ+S0E50D8kqyMzrLXrMEvxcmwEz7LaeLgwI4EXIrZLjNeuWG
	 X82yXoQVJp+pc1gVYmfhhATg6jWYU1pfo9CQh8Y+iRm7QRA3nYSACczXPCTeoe2bjp
	 lV28YBsFytjlgrObDb+9yPhEDnYEeWq/K2Ef95/hOmbK4vXkUKA6Pvq7t5fdQPmb4K
	 mfbjwJCAjouZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain Gantois" <romain.gantois@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
References: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:32:12 +0000
Message-Id: <20260608153213.3795A1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,smtp.kernel.org:mid,sashiko.dev:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-14871-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:romain.gantois@bootlin.com,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 069A3658961

> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> Add of_match_table to add support of devicetree probing.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> [rgantois: Removed of_match_ptr().]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-adt7462-bi=
ndings-v2-1-272982c40325@bootlin.com?part=3D1


