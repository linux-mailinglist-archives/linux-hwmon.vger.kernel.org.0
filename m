Return-Path: <linux-hwmon+bounces-14684-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WJJUHYURIGqjvQAAu9opvQ
	(envelope-from <linux-hwmon+bounces-14684-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:35:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB16371C6
	for <lists+linux-hwmon@lfdr.de>; Wed, 03 Jun 2026 13:35:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=koRQZrNf;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14684-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14684-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEEBF305D03B
	for <lists+linux-hwmon@lfdr.de>; Wed,  3 Jun 2026 11:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61DC44CF2E;
	Wed,  3 Jun 2026 11:35:27 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2133388881;
	Wed,  3 Jun 2026 11:35:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486527; cv=none; b=cVSRPFf6DwbdObabLvoAndPvCZEdhwHHWKE5hzCsJCGb0K5Zlt16orV5cL2mwk0m/wPq3gBIdCDOmC2rYQvcNnqPY58F6Q1I7K+yo7imRPEtw6qTedAmGug+FFXzKXR66xiCZAURvdL1LqWsMDcnF9Ugdg8Gc9wghJiOFcQblsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486527; c=relaxed/simple;
	bh=L+fggEAvnIpbpkWXrZHlhCs7DGtNIhS8gj32wbrU9mw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hvQ0w4DbV/VrWySqn6dQxJIDUSayha3hKYvJ8FP5t28hyxLo7xCohTlKESaqjffBbjx9MhVukYsReEarmku2djX2wPoe42IvKJ+J499DEh1eBey0SbjN/ktAPoUoH3WGs3gqLdjZIoKyTfgBrEjyxXXyt17m1dpYpcM2HGpBwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koRQZrNf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232F61F00898;
	Wed,  3 Jun 2026 11:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780486526;
	bh=+QXiOfQEcvS7oD+1LooOvWTQClhyD757X2KRZLIKvFw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=koRQZrNfVfMw+kTCtYRxZYXN/yRw9AoNmFkpAtzz5DkbN8aF6FprTFLN1jONShNj6
	 7BaRu06PivBBFpdn3vtmwZOWkvk+0Hh5k2pIIdsAStbfy3rRMzGssaL11LxtgYyf+L
	 NdyIY4HQNNIaxOnyo29cA4U6kAwTcOD1FdaNpQA890+BjQ+65JMVgE06Yjh8S89CVM
	 MuWAVJ9xziw0MBbT9xkQC14kgnTqiqaZ6fe7PYNtYu+D/vcVYxGKIAjHhqP4kyiuXB
	 +JRxcpUgzKuxtHBBoik5ngHOUzUUQRih1lOaafboPB9zZODI4pdAS3BzuyVQyDQutj
	 0Uw8r8l96Gy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-binding: hwmon: Add binding for ADT7462
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain Gantois" <romain.gantois@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-adt7462-bindings-v1-1-301304bcf774@bootlin.com>
References: <20260603-adt7462-bindings-v1-1-301304bcf774@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 11:35:25 +0000
Message-Id: <20260603113526.232F61F00898@smtp.kernel.org>
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
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-14684-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email];
	FORGED_RECIPIENTS(0.00)[m:romain.gantois@bootlin.com,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1DB16371C6

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete binding migration: `onnn,adt7462` is not migrated to =
the new schema and remains in `trivial-devices.yaml`.
--

commit 8e3b73cf675c7a9534a713ae61c15469f85f0d06
Author: Kory Maincent <kory.maincent@bootlin.com>

dt-binding: hwmon: Add binding for ADT7462

This commit adds the ADT7462 hwmon Controller device tree bindings
documentation.

> diff --git a/Documentation/devicetree/bindings/hwmon/adt7462.yaml b/Docum=
entation/devicetree/bindings/hwmon/adt7462.yaml
> new file mode 100644
> index 0000000000000..745a371affd65
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adt7462.yaml
[ ... ]
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adt7462

[Severity: Medium]
Should the existing onnn,adt7462 compatible string be migrated into this
new schema?

The ADT7462 device is already documented in trivial-devices.yaml under
the compatible string onnn,adt7462, which is actively used in existing
device trees.

By introducing this new schema without including onnn,adt7462 and without
removing it from trivial-devices.yaml, existing device trees will not
benefit from the detailed schema validation. This also leaves the subsystem
with two conflicting, fragmented representations of the same hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-adt7462-bi=
ndings-v1-0-301304bcf774@bootlin.com?part=3D1

