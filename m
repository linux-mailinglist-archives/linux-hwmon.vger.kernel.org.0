Return-Path: <linux-hwmon+bounces-14630-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJKmEPz9GWr80QgAu9opvQ
	(envelope-from <linux-hwmon+bounces-14630-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 22:58:36 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4BB608B85
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 22:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7587D3008D28
	for <lists+linux-hwmon@lfdr.de>; Fri, 29 May 2026 20:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6CB421EED;
	Fri, 29 May 2026 20:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsLoEG8Q"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0D939023A
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088306; cv=none; b=np44wbQ8+X1VVwTJDGVDzVljfnbYCViSX5or4p/IvIVV3rOv+WojKCghKwuuPzIPXtb66VhKe9JQ9mmFYnwfPG1WshuvuK+ILJX6HNKEYYx6FlGDrgmyWWPHTHj8ZRpz+zJwqmNzIL+XPT6Nw26TI5d9f96ntHaScWZ8ERn22GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088306; c=relaxed/simple;
	bh=UkstNP5vOnd6/p8cD2aQZwDVPVsHmfgWGN2fk6KYzDs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1h4/G3yCWzB6EljiPsS8GRiIuNd/HzroMtYzhhnBBA7H1hSSxAi8P1fqQsSIwnpeJ3vJW5g13+OqCNo+xd3n73LUt/j107yHVzzSqQvBvh7odLQtflfcE+Zb8eS9IPO/zKC9b1hj/bud/6MjUTxPON8LHq/FE6j6wz0S1LHkmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsLoEG8Q; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D901F00893;
	Fri, 29 May 2026 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780088305;
	bh=UkstNP5vOnd6/p8cD2aQZwDVPVsHmfgWGN2fk6KYzDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsLoEG8QcAZEa7Y3gmA0yNqi6kc9fod7qNV6oc8WGxp2ZfdkcHssMdthvWiq9uhuk
	 dIb7xkZYOfz5zm2Opo79Ws6O2iLdtVnJp3vl4bNickKxxnj8p3OUpN++MPydkG8ycp
	 CzhV4QzeAxri8OdkmFQbGAcTjEs5YgLUwSqPAsb5CIP8uhf3efi1mFQjr6V7EkFx4A
	 XjtZO4GsIU0C6oqhTMLLfdMSxrAovFAJqUXUtfeIbaMawijsu1ZWTpaVuqFTkHEjdj
	 u/vEle9xDqCg8Xla84hylu2QCvPiZxha6CxT2LRRJeHqDcqx8+GRvRmA13M3tT8ljM
	 fRYOn/Nwabp1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: (cros_ec) Prepare the addition of custom
 groups
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-2-da6792b3830f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 20:58:24 +0000
Message-Id: <20260529205825.20D901F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-14630-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,smtp.kernel.org:mid,lists.linux.dev:replyto,sashiko.dev:url]
X-Rspamd-Queue-Id: 4A4BB608B85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> An upcoming change will add a custom sysfs attribute group.
>=20
> Set up the scaffolding for that.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-cros_ec-hw=
mon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=3D2


