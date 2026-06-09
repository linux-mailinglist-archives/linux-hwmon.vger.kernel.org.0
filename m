Return-Path: <linux-hwmon+bounces-14884-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dMy1C1XBJ2pw1gIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14884-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 09:31:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C965D39B
	for <lists+linux-hwmon@lfdr.de>; Tue, 09 Jun 2026 09:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hC+a0w0L;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14884-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14884-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F95D303052D
	for <lists+linux-hwmon@lfdr.de>; Tue,  9 Jun 2026 07:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9009A3D8101;
	Tue,  9 Jun 2026 07:29:02 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6CC3D0BFB;
	Tue,  9 Jun 2026 07:29:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990142; cv=none; b=RMpcfsxkzlSKf0byOZUcRiPHKmjsKGa/UfCV9w6fRcfANQodZlaKTMbwSWe84c15TU8p876fGiJzK0OKQysnD7izPHSh20sl86EKs45jkqUPxwELLTQM+axFgjSW6Wx9xJGqnLXlbsYM1FajIgH2WXbx8q+1NFSjCmfCKT+8LlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990142; c=relaxed/simple;
	bh=K6MV2uLS5lm+4Me4t24fR79hY+O5WdtNRqvbGy0JzzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6+6sQt9jtseQjCi2ZLL4NrVYeza++YwugMPXqugZy3UHRe2FePxMRx21ridI34BmVv9ddvj8q3135vn/JMIS7fPIdLCPelkHEHdNCgkbp9v+LGYqE6pLuAMv6ohdCX2Rsr3jBWBgyEWe8Yyj6FkKvq0yecaAcw7IMTEDGt9BhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hC+a0w0L; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62071F00893;
	Tue,  9 Jun 2026 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990141;
	bh=K6MV2uLS5lm+4Me4t24fR79hY+O5WdtNRqvbGy0JzzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hC+a0w0LARUFxJIhe3bMU6EX4vRWNNCSlNyvCoToF5pq8QevkMuc3tbtXlgRTROks
	 SsnT5F0UyEU3mcaMtPowIGoraLQldOpKs6vviwsIgJpvGPtYXrd58a8tbvvl3X3URX
	 eYTCASGsGGWNrV/TE+1O98b/LWCK+gz90HVp2o6g9kl6xXl8AoDIbR6+lKbFPNpv/K
	 8sorbFgWJNgqGz5OVxgvq5/dBKzvoOt7Ty82bwrV/lQiDzKDfMySGPOrXTzImpvMVW
	 IuwXZRrV273Tw7Ny5pjF4fgKt02eshs3OIdrYhXB461w0UIkqOy8P3pk612VafhB3e
	 98agtSjg9DXNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] hwmon:(pmbus/xdp720) Add support for efuse
 xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609072231.15486-3-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:29:00 +0000
Message-Id: <20260609072900.A62071F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14884-lists,linux-hwmon=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infineon.com:email,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ashishyadav78@gmail.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C45C965D39B

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609072231.1548=
6-1-Ashish.Yadav@infineon.com?part=3D2


