Return-Path: <linux-hwmon+bounces-15862-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nrcWOHKYVGoroAMAu9opvQ
	(envelope-from <linux-hwmon+bounces-15862-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 09:49:06 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CB7485A8
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 09:49:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aEJ84mT2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15862-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15862-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 717CF301DEDC
	for <lists+linux-hwmon@lfdr.de>; Mon, 13 Jul 2026 07:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EB53932DA;
	Mon, 13 Jul 2026 07:47:53 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AE3932CE;
	Mon, 13 Jul 2026 07:47:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928873; cv=none; b=pedhKOudexDuR5+WWqvzBXDBz/0vMWX2pvvz2MqpBsHMCb9kx0cjdLanJU4aE5rB1/Y5fOZgqbAEMBsrogOwoclFw3YJpdoFDGw3kjA+D+ynQUFnzp557n5Vi7Fo19LUoCghUv+2LQGZhr5wMpQI0y+98gJSa4PM7iCvuDHz+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928873; c=relaxed/simple;
	bh=p7j60HNGlQV1622NC0FlOoc/pfLbyzh9GrCDTVfcgc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EfrF/Nl+4OAENYfdNDCIWqAHCV81+pvjsQtqiZBNxRuojRaDyt9GM2EqGxVt1sxJupNXJX4dbMQjbQaxzbGmZjRZJse0hZ4lmz5N74n7AwM+4krcxIRY4n1Yz9txjuPZZ5ugc2d7WIquL4ME89UvNXgUtXFrwIdfgOWn5IQt1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEJ84mT2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A961F000E9;
	Mon, 13 Jul 2026 07:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928871;
	bh=p7j60HNGlQV1622NC0FlOoc/pfLbyzh9GrCDTVfcgc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEJ84mT2p++8/0FKqBXwG55VoP6z2yDsREfuF+DuHWYCzmckhumsJhc6t7P+jN2Ke
	 zTljAfe3QuNm4nDeCCybBR4h1zP/EgVQ5qFnV+YY+LIiUYaW0i0lg8LvvUw31vGcHj
	 BrRu1iEEykOlO+uASiGBvEHZLsbUB7XmG6i++QyYNLaV4fGA0Cd6G5lZSCaft1JuXS
	 rg1d5D1gYKjOt+JASRhb2NBMwSwHSKm8VYPOQDjrgvtj6qpw49dXAoSd8IYDFqA2h0
	 e5CSNYDEw9SSYuxWD9Q+2vShygKPNFKobFf4+MQV96ez+8L15z2k3YVEzFuFeDLnu9
	 QvMOA/IphEUtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: vendor-prefixes: Add GXCAS
 Technology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-2-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 07:47:50 +0000
Message-Id: <20260713074750.C3A961F000E9@smtp.kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zaixiang.xu.dev@gmail.com,m:robh@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:zaixiangxudev@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15862-lists,linux-hwmon=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,smtp.kernel.org:mid,microchip.com:email,vger.kernel.org:from_smtp,lists.linux.dev:replyto,gxcas.com:url,qualcomm.com:email];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
X-Rspamd-Queue-Id: 662CB7485A8

> Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
> The prefix was confirmed from the manufacturer's website:
> https://www.gxcas.com/en/index.html
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713074559.1219=
6-1-zaixiang.xu.dev@gmail.com?part=3D1


