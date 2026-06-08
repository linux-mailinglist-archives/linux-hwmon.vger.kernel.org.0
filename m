Return-Path: <linux-hwmon+bounces-14850-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mzn+Jq5fJmpOVgIAu9opvQ
	(envelope-from <linux-hwmon+bounces-14850-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 08:22:38 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A48A653166
	for <lists+linux-hwmon@lfdr.de>; Mon, 08 Jun 2026 08:22:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nMS6DMA1;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14850-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14850-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 053B2300D9D3
	for <lists+linux-hwmon@lfdr.de>; Mon,  8 Jun 2026 06:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528C538657E;
	Mon,  8 Jun 2026 06:22:32 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97E370AD4;
	Mon,  8 Jun 2026 06:22:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899752; cv=none; b=Nwn0SSpMhRL9to+4iMGd9PrcIUwxGkA2DGmdAhwhv3it4GuCzqR4wsEhKzOp6H6+L9rrLCFKuu7LeYZmrrSKbXy0cUsfLQq1pEA3AxmqSwebJmJ+9BRAjRi7NjBMdxMdCB6bmZURAKtQujywkCJzFS3yOrQ4MRgblkkvVNXR2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899752; c=relaxed/simple;
	bh=LuvTEA0n7iP2nsv9gI+EIdsXrd7VzB5J/PgcsUR+D/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BKSRWS40SGnzhO5k4keieMgGIOioqUucDXkkF1Z5s70nbiKstRILGR8zL3PA+xTvsM0kr7exKYIPPXl4l1OJrpCvcSjyIiBJUxqC8h6/du/CHzq1/Wqc4V8YJzwv4+JunBAz7XJyxcu6XpsVMYbH2mA12nSEvbEkXIzrxQibc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMS6DMA1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96091F00893;
	Mon,  8 Jun 2026 06:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780899751;
	bh=LuvTEA0n7iP2nsv9gI+EIdsXrd7VzB5J/PgcsUR+D/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nMS6DMA1qgNxfL+uUMwx/kVjvdbd2pYOMfgJpNUaZ+g6U2nxVaSkRkE7BKJwYNCwO
	 fPHJ9DbhO7nMrU7HUBCyQxy63aq8GelwTJwlS++8EncKfMnh3seWdk/Ps7VkjN7Zgz
	 MkuNYL3vdDO0mki0u9/+mR5502d94nX20pjYb8cp20T4AkA+xx0eW4e/RcVoepC90S
	 lQ0v1RCqCueuXnBhpp4jla8yBxwOoLEihQyIiLJK29eD+TeBNgVjiVeMxjI7K2Hab8
	 2bwLuuG4boZ2xLUpSzAnMLWaq/oAnZ0NCgCYulrMN/7mfTcIQVOmxrkSW6D9Rao1Hv
	 fjeM0DtFFbi2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608061544.5613-2-Ashish.Yadav@infineon.com>
References: <20260608061544.5613-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 06:22:30 +0000
Message-Id: <20260608062230.B96091F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-14850-lists,linux-hwmon=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infineon.com:email,lists.linux.dev:replyto,sashiko.dev:url];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ashishyadav78@gmail.com,m:linux-hwmon@vger.kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 2A48A653166

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP730 eFuse.
> Rename node to efuse to accurately reflect its hardware function.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608061544.5613=
-1-Ashish.Yadav@infineon.com?part=3D1


