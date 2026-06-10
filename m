Return-Path: <linux-hwmon+bounces-14931-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BMwMFLS7KGpIIwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14931-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 03:19:48 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B7F6652B7
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 03:19:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Dg7/OPvg";
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14931-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14931-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAA3A300A5B4
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 01:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0EC2248BE;
	Wed, 10 Jun 2026 01:19:43 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF21459FA
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:19:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054383; cv=none; b=phMX/4w30v8KWiIr1Y1V1U5MW9CNmT7qewWCkCPkGcA/V3RjPzOBGgYqYFPogEv02czxTWOLQ4QDMbgTbivY1VBi7jcdrJKXJBuQi2TqlhPlfyUgVO3OZ1D1sgWGSmvIFj6a1js98rwef4c4tB0jOCxrNKkCWGUK3I2wdZrU1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054383; c=relaxed/simple;
	bh=8RdpOuV6FThsL+fj7gSqlpGHTDa7RXpY3GteDngDjus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gnJOdf4UHc1Nkg3PwYv7HBSJ0XETtsJoChYJH+q0YFwX8g61OqwnDgRvAmIwEkuBaaxm76oZk3zyx3f7G00+WIBtfeE+PfOz7FwEdHxyXyoYNts5O5Xi1AjtczINfyVXC6TY8QgXEzRKNb4U1WVg5ZAH2/Ovjw4poReXh0xyGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dg7/OPvg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F631F00893;
	Wed, 10 Jun 2026 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781054382;
	bh=8RdpOuV6FThsL+fj7gSqlpGHTDa7RXpY3GteDngDjus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dg7/OPvgBwUt3vwm5NlPT6CnPVasysvBoLcnRXjwCfrnRkjeZw7xG/UU9EN4GQDMK
	 aE55R2eCViZb8jKmGS2yXq4BollcKo+ak9C+5FyOtrrI1wYb9mh6ICoQSdXp9T2y0F
	 vgkYlb6/l+0MvtR9ZVJKNDYCjsHMgFpYnASniDmagEOAe3BWymoAoy4VT/DzsJVP+i
	 S9pnkgVsKxmzGnnALbuJonRS0aAfLXw5kWptXFmTro5lvFwuqZUlNHoGzR6Ta5jldz
	 2s6rRr0Hp36/Oq1XxgSDwoeMv5N/5wNqTPFHaJlfCtLsECRrP+ojLqLyp6biYKCIKA
	 RPyXv+SsbIvag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support adpm12250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
References: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 01:19:41 +0000
Message-Id: <20260610011942.62F631F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-14931-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lists.linux.dev:replyto,smtp.kernel.org:mid,vger.kernel.org:from_smtp,analog.com:email,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99B7F6652B7

> ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2500W. Uses PMBus.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-dev-adpm12=
250-v1-1-422760bb80da@analog.com?part=3D1


