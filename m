Return-Path: <linux-hwmon+bounces-15366-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8+70G9wqPmoYAwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-15366-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:31:40 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C276CAF5F
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 09:31:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IbWG5EWP;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15366-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15366-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B5A93016295
	for <lists+linux-hwmon@lfdr.de>; Fri, 26 Jun 2026 07:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0813DCDB5;
	Fri, 26 Jun 2026 07:31:19 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3627A92D;
	Fri, 26 Jun 2026 07:31:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459079; cv=none; b=XcFl64ot7IdZ8/lLwXuqq6obkyWLp0RRkQNF4qXCiFQrll0gkN8aeWARGRuOjK86tzImMf5To+vkbdl0UqskIPRfes1707snOrhadsF7bFfktmfNFo5bt7ZREZStjV8NwB6mQ1YJJ+fVE0ATh9ve5RaCfGqYuvikbZT1Kpjnyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459079; c=relaxed/simple;
	bh=mnErBJ5dHE8l9Dw6ytdCj3rhFuTY6mwXKTbQnHcwve4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aPo9aYHQwnF88Ji8nxVS4Z0YzaEyZ8wcD/GCFttjz0R2l7wKUwfa+cVb+PO/jxAlypQ9iGsek59lCHmHSSmHuWEfVzdgnhcfH/yujel8j13Iodl2pgzA//OwuP/Jf0uQgs3wsgWvtGupvuoqTPD+CUmdRlJOBl66ge9lcw4rDA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbWG5EWP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC11B1F000E9;
	Fri, 26 Jun 2026 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459076;
	bh=mH9fvCrWEBJqgWTIzKI3gt+q3Cc5y259u+mGgxaB3ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbWG5EWPR+zLcBFfJoqApSn1JehwRTNwZnOEhiYF/BlpecwaKT1Kxg37K8Kgo5pEt
	 zcoarRU7kmShP9Wd9OjxPItqkZyHX8Hel9psHCle5BjnhUPBkQEg8IJBgmKzZXbSs/
	 l1elXv7l62ncLqxnlRXHSeGDQ2X9E0v+yuZA/EFQsKI214PsLvfL9aACo9lyQyvUgE
	 E5PKXm8Toj2lh5DeXf4UDaQ+YJvIaIcDmHMaK0owQbqFtfWw8M17pzDwDz9sEfgKFV
	 2xxDSnFqgHF8JvI2mFGPmbUqeJ92zcPOXe2iWQN32TxO4PPDhpElpRb8Ryy0MAGqHd
	 hScjrMOwT/TIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/9] hwmon: adm1275: Support module auto-loading
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9eca6831f9fe2d781bb88337397c39b10e36f5c6.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:31:15 +0000
Message-Id: <20260626073115.EC11B1F000E9@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-15366-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto,vger.kernel.org:from_smtp,sashiko.dev:url];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matti.vaittinen@linux.dev,m:devicetree@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:conor+dt@kernel.org,m:robh@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4C276CAF5F

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Populating the i2c_device_id -table is not enough to make the
> driver module automatically load when device-tree node for the
> power-monitor is parsed at boot.
>=20
> Adding the of_device_id tables causes the driver module to be
> automatically load at boot. Testing has been done with rather old Debian
> system.
>=20
> When inspecting the generated module-aliases with the insmod, following
> entries seem to be the difference:
>=20
> alias:          of:N*T*Cadi,adm1075C*
> alias:          of:N*T*Cadi,adm1075
>=20
> I suspect these are required for the module loading to work.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D4


