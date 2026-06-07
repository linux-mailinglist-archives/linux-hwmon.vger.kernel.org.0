Return-Path: <linux-hwmon+bounces-14807-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RygFARnJWqhHwIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14807-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 14:41:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C47036508E4
	for <lists+linux-hwmon@lfdr.de>; Sun, 07 Jun 2026 14:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JQpKZAUZ;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14807-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14807-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C679B30078AC
	for <lists+linux-hwmon@lfdr.de>; Sun,  7 Jun 2026 12:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6169A23392F;
	Sun,  7 Jun 2026 12:41:36 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71D4071C4
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 12:41:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780836096; cv=none; b=N+8XOw2ANv+kdlcbU1D9Mvn1m1o49Vk09MJh7fU0wBfTw5VbEltRKYC7F2kd9ULZtBtPIK5fqoMhta1oydNU6wWVMw1G3KqbnQ6g5+fsyCCjYLivJpa4jdCMjOwckWD2/zgARnyPGmilaZUojdBgGZdoOonNIcLZHJd5ZT55B94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780836096; c=relaxed/simple;
	bh=OxzhitTKiOo6WOdyvarpEsENyYnsAZfljwBbBRAP+JE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I2Xf/g2Xw+gE9zLp7B3mP+cZxAoTqcf7Hgf2Tnk3habl1dRIWG6IoFT6ojyUCHQizYodWDlpwQ2FuVxBRW3dasellk+VxW+L+LMx6WwjZuDp53EABNMwychOTKK/KL2XOK/4FNql04yB8oaCEzDU+Y36AVZ7tVrT2GQIl3EXlJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQpKZAUZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55C61F00893;
	Sun,  7 Jun 2026 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780836095;
	bh=OxzhitTKiOo6WOdyvarpEsENyYnsAZfljwBbBRAP+JE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JQpKZAUZdmGaLeXVyjGkudtMC/FNj1RNUGQ+vSsyzbnL6D6SZLMWncxCd1IVS+3kr
	 UKhXho3zCT0PpxGwDBhES9rOO+Boh1qICOdABBBxXV669mL1yf3Da6RURQuq+QB2G6
	 Ul3QZmOnzJhVz3wB0U45kJIUBUVcIlhp4zwfxsED78SfpFwI5KvCUtZTLHsxcRJwZq
	 0VALrZ2G6BRjK+AYrkhImJNGTw4RcrYl3AIpHNTI3bCeewCHrIPbz3nSWBNbmFJFGs
	 VzT14o7rnFtobtJavNRwCAo8ERbgZshIrFqmd+ulPYhI0xk8NTeqpPTWp/qBXY7dSz
	 LMdyCHvtkTfDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B850-E GAMING
 WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260607123626.100630-1-eugene.shalygin@gmail.com>
References: <20260607123626.100630-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 12:41:34 +0000
Message-Id: <20260607124134.D55C61F00893@smtp.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:eugene.shalygin@gmail.com,m:linux-hwmon@vger.kernel.org,m:eugeneshalygin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14807-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C47036508E4

> The board has a similar sensor configuration to the
> ROG STRIX B850-I GAMING WIFI, but includes an additional
> T-Sensor header. The patch was provided via GitHub [1].
>=20
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607123626.1006=
30-1-eugene.shalygin@gmail.com?part=3D1


