Return-Path: <linux-hwmon+bounces-14976-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7DFNL2GnKWrkbQMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14976-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 20:05:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F3B66C27F
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 20:05:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KqRfQeAC;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14976-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14976-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9EC830DDA0F
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 18:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E50349CE7;
	Wed, 10 Jun 2026 18:03:51 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2F3546E6
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 18:03:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114631; cv=none; b=cPU4RmESD825LYz8szGhO8cAb7lnjUR2PiAEMSsiTCxngvkcTDtQDYB10KSfxaeAaRO7sba3XJcxFR0cmTYB/b9ReS8hAlXAVGI77ff/U93/wRV/OiGMiTJf4AXHG6T7JIBJH2iQAdk3jb7Pbs+J+192GOA3OFNBkWOk4PaxGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114631; c=relaxed/simple;
	bh=8Tet/U6RpdvN4t+by2bKjVQyiOTctQKBP6RsUs1y7Dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulYSGj4OE4bWG0R6u3vCr5YIwzcHzP1uwpyRNH9fRTJ5FATQsf4H000m8tj001IVtoWe2BmGL2UzFUvJL3KFrpQhFwdkCyZpvMWH4w2Y8GWIIdFyrcrhEYw6KKm4M/QiQ/G+vPbfo8ZM74s3btQ1ogcUnx4uwbE/Pt2annuG3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqRfQeAC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044561F00893;
	Wed, 10 Jun 2026 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781114629;
	bh=8Tet/U6RpdvN4t+by2bKjVQyiOTctQKBP6RsUs1y7Dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KqRfQeACyt9Xm1bx8zlR/p60+Pgt08C0WtruNqzV7rsbwoEWzJs0MyQI5IGsxpCc4
	 Pq6WYbeX4srnRHmlpHeWRNeHSS4gHDnz4T3RX7o3VxiTrA70uXnijq17MAeImdSxmI
	 V0mXjTsmhqCO/ZpxfIYI8HquDy99D1fLRfOhRL4x2/sDtD7yVHkzeY08pU7nar8qj+
	 NvL/MMNvr0FXQ1Qy5ntRDKqlB94LhPDirV/ujtgoRYUnPaQ4rHZMTZOj/6WQSnXWDS
	 clKVmLUmDVmk6zd0lncMCOxJRfqBGK8wkA1drqeaiKsLKkYipPLaGr4OgHAmOiB29P
	 hjHCIU9WmKddQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control
 whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610180141.311503-1-W_Armin@gmx.de>
References: <20260610180141.311503-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 18:03:48 +0000
Message-Id: <20260610180349.044561F00893@smtp.kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14976-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:W_Armin@gmx.de,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,gmx.de:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lists.linux.dev:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49F3B66C27F

> A user reported that the Dell Latitude 7530 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
>=20
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610180141.3115=
03-1-W_Armin@gmx.de?part=3D1


