Return-Path: <linux-hwmon+bounces-14993-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oS69L6HMKWogdgMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14993-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 22:44:17 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D866CE39
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 22:44:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UHBl0Yfp;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14993-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14993-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16A01301373F
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 20:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5795B47ECFD;
	Wed, 10 Jun 2026 20:40:56 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8F47DD7E
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:40:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124056; cv=none; b=RgyXS+iuypqj1e3bRfcMFbXi78wIjLxk1Zfm5PyTnJz/6JcL/1dpLzDiNLpnsFBoLU6J1md/y2cbrq2X825z1T8rzFj2N8DYfGC0EIrMZPlUQt6HflDiJL3t/fpy8NaeJJBXFg8tLJtKd2MMGbGCXzVUH4MKbHNvjK9lw7BGWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124056; c=relaxed/simple;
	bh=oewP74Oj9zPKwOUqNWlIOcbmXwUD0yyiopTCxCL4RLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guNDRkktmFUVmehiFNn0KUT6QZv2D5B30dc+sQL7LbokyTmhMl/TJ/crKIobPFed3mvofszZEl5B3wYSPw9cqNGaC4vWbLfFh+BSQ7qUo6pmd1Rwm28dgqMEhYZv/rAe5KihbV4E6ORBwtLpdNaOk+ixzMvnVhGsgJVufMsbJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHBl0Yfp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC3F1F00893;
	Wed, 10 Jun 2026 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124055;
	bh=oewP74Oj9zPKwOUqNWlIOcbmXwUD0yyiopTCxCL4RLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHBl0YfpZHbkhsiBhw0e/sUH45PGdsvzyHrXRX3ZhMPaJxAk2NfxNFLJeGRJbsscO
	 SoyRMWV4NjXe3hSyOjJM6vu0XEvJ7YP+gldj7fgTDZ5cOP/aZGvo8y8N0fxkfoBEzB
	 /zVkpKFTXeimG5CvkWeuTnKuTITnIJT7wEqry0Wrw44uwp1I9gtPya8hgcHGhX+dZG
	 95ZxAgQbFy2pwqLEaHjryjfRz0zRJ1w0A64+FybM68R1qhACqnAI/5ZUhq9I9sI8O9
	 0z4g3ARxJspQ9g+nZ8JSbDgrgYDgTqX1D5Ap5XVuYkC8IJHug5HoocOA6QZlUwnxWV
	 1pRTHrgRIVeuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] platform/wmi: Make wmi_bus_class const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-8-W_Armin@gmx.de>
References: <20260610203453.816254-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:40:54 +0000
Message-Id: <20260610204054.CCC3F1F00893@smtp.kernel.org>
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
	TAGGED_FROM(0.00)[bounces-14993-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,lists.linux.dev:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gmx.de:email,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F2D866CE39

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D7


