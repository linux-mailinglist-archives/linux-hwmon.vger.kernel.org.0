Return-Path: <linux-hwmon+bounces-15618-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OFu4AYkLTGpVfQEAu9opvQ
	(envelope-from <linux-hwmon+bounces-15618-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 22:09:45 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749BC715500
	for <lists+linux-hwmon@lfdr.de>; Mon, 06 Jul 2026 22:09:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QaqE0sX6;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15618-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15618-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC5DB3044088
	for <lists+linux-hwmon@lfdr.de>; Mon,  6 Jul 2026 18:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC58D3C9ED9;
	Mon,  6 Jul 2026 18:57:33 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90693C81AD;
	Mon,  6 Jul 2026 18:57:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364253; cv=none; b=g0F8lTt8Rj4BafTJprlxnt9x1W0p/bS8NO2MoFwWIA6WCnHEav0mOAWUzUiFfBx+Pr0fQXKiRw7L/cSO5b7UxcEBXtj7PbsqDCZuLzWkoZFZT1gbc74D8xizq2D26y1/qAuvyt3ZSVsJ/++GzLflrUznkAJVYgak7pfbXOa7Ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364253; c=relaxed/simple;
	bh=kUJBBHlBjJQT3YNthc39e/yWqTIqJKxrwKw39rsK2WM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OdkDj3IBNQdqdR5x15Z+fBMc6NsS8EvNOsDcZKB/i512JXrq+5gESyixvb3Ti317Myfe5tjGaLmaovmnYdZp40Zb0TegdWwP2RzSqOt1fGnergFKV7XBHzhbOtLN60KfNShj7SCNFykhSyiHmDJh3b5WGE1VrihK75maoV+DxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaqE0sX6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2172E1F000E9;
	Mon,  6 Jul 2026 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783364252;
	bh=kUJBBHlBjJQT3YNthc39e/yWqTIqJKxrwKw39rsK2WM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QaqE0sX6F6sY+k18e/7B8/bk6wRFNYFXahL6SwXyjGXMOgwLNkHJfSkjlJ1T+TaN8
	 HrsjlxP+hHeyv7wALKIfohlD1slJtdZzLHRSTyz4ybGg3Wa946iwO/9paLHkdYv3bE
	 m0scGZa/O9XJcytFgJRJHTKiC6srq39VJ+DGZZNU4muGmmCVZnomBsQoYR1ys8Wnhv
	 /vXavk19Mvw2PfrhyfhVdN8JBt1/r6zZ9l+wumRKUcBQAeVGUQxaKG5GrfOgRt/xN7
	 zOJbEMdpR6hMjyW0uACqHeuMjvVIl8ElRvhNhWBWMSR/GOamlFs0MTnvlDE8Fd5jmO
	 5gVV5563TuIJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 18:57:31 +0000
Message-Id: <20260706185732.2172E1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15618-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.linux.dev:replyto,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,smtp.kernel.org:mid];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 749BC715500

> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
> sensor provider by adding the '#thermal-sensor-cells' property.
>=20
> This allows the EC temperature sensors to be referenced from thermal
> zones in the device tree.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706184648.3561=
3-1-daniel.lezcano@oss.qualcomm.com?part=3D1


