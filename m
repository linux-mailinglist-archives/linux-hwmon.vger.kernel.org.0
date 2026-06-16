Return-Path: <linux-hwmon+bounces-15124-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nBaEL6/yMGrwZAUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15124-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:52:31 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE5A68CA7C
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 08:52:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JR5KpHP6;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15124-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15124-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59B913019459
	for <lists+linux-hwmon@lfdr.de>; Tue, 16 Jun 2026 06:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14730EF94;
	Tue, 16 Jun 2026 06:52:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9B1FC7FB;
	Tue, 16 Jun 2026 06:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592747; cv=none; b=ripO2/No4fCrzm6oK9mNGf+SJA+Kb0AQW1PhuagqIX7Y2huHZoY58ylrNrqrDi8nS1oRsGERGbF9/3KljQUxZw4CuNVfXE4LEFywGbR5Yy24ocDGarRajZKyFr6giFcwHFy0+/FA1tMJ46ZESF9WR8g1x3mtyAj+Mo2jAY3iLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592747; c=relaxed/simple;
	bh=iD2NJtVbfaM8feooFnQNDlFyw/5WKvxM7OzfXyNrMpQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g/vg5VT928crp8brA+mMTlBSiPN/y/MWVnRfR7vSojqwpDDxOTfdp4hgvY/U1GXPXM0mxX3QYCwQg6fj/GiydHIT4mmZRWVCWSkIUBonACXmfnGHN3x3xnbmODxVsRjfvhOIUvgAmWvtcwljLg8Jdp3Cbh6M/s9ccwISf9nm9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JR5KpHP6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E451F000E9;
	Tue, 16 Jun 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592746;
	bh=iD2NJtVbfaM8feooFnQNDlFyw/5WKvxM7OzfXyNrMpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JR5KpHP6UuuwifLgkSFxW+wMZ7CUbN2dM4XmnRTF1YTeV78ehG/OQalzIjxaOZazB
	 Mx/Ag7Jscj70WPyD6ZnTk5X3JGzuU5OCeVJqlWtXJZZ1vDSvIij3ryhykdFiv9wBF2
	 PMMlDcwFTTjd5R8J2I7KELXvIPdvBAegq4DflK9bkVal3NOdmiFmQAVGf4/Fx1vZSt
	 9t808M1TlkMcvXJVNE9km53mHVaR4L+KCUn7E3YPG13gWJzABFwPXM2h7II5wLdpsM
	 VqQi3/OhW82o+sH0xohjY+lSCiMmTRAZuT7C8cRN/TQvv7cDrCEZfkmNypGoJGo6/c
	 0UsHnn8ALy/xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] doc: Add ROHM BD12780 and BD12780A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <be64833b78ab8f915fce6209cfab0a458991033b.1781591132.git.mazziesaccount@gmail.com>
References: <be64833b78ab8f915fce6209cfab0a458991033b.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:52:25 +0000
Message-Id: <20260616065226.49E451F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15124-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matti.vaittinen@linux.dev,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DE5A68CA7C

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Add the ROHM BD12780 and the BD12780A to the list of the ICs supported by
> the adm1275 driver.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D2


