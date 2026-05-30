Return-Path: <linux-hwmon+bounces-14648-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CuolO91lG2rgBwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14648-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:34:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB0B613AB1
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DBDF300EF89
	for <lists+linux-hwmon@lfdr.de>; Sat, 30 May 2026 22:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A712F0C45;
	Sat, 30 May 2026 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHCNEswN"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145912367DF
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780180343; cv=none; b=dfST7rsfdtNq9cVQNmg8mlBNEr05MObhp1uVjgtLAyPFK7LF9QuOyNSOkcwTRznnOERywpeisCX5JhQ2ajcP6/isOEsta/x74SCV9rwVa19pU2npdxSOjeRgPlhqYbulV+kKCuOR0x3UMiAOjJ5FTtQni49Fnf8ffwKDbmuvT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780180343; c=relaxed/simple;
	bh=Ot83wU1iyAruw8jTJAcCii7qiezJjXzcFqS2K68lgRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvVkB37fL/KwvqR2KCmh4mWZ21JvUZND3LxqHjjIh6nwaINSRGyzzR5BiLxe7XImusFpl3Y1RZCRMKsN7btc09iRE87icmXoVCXvCu86+abCUVE/fYSuHypr+1dEjqPi+G2mA8+7H/bzsPxKlHb/aIAtH+s3vmvIQ455xtbXXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHCNEswN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327631F00893;
	Sat, 30 May 2026 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780180342;
	bh=Ot83wU1iyAruw8jTJAcCii7qiezJjXzcFqS2K68lgRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHCNEswNRsrp8u+21zjgHVhIgqSxCd1QazrfPx0c+GRPn3OTwBvblz8i6kIvoCECV
	 rIaEwYYJ02hQHLFheN1+FH2VJgWYjNC2jFznBhoetJN66hWHgGVcpBPhEUzGw+MtDH
	 WYuTpDiL7HaMR7CG8uEilbJnve30tYEcJ5QE3vaeLd64Hv8umsMxoFOBrqtEEcUUCU
	 8bM102Xu3GXk5YgW5CcuMnmATukKtt/h75UjkGcK9AgWbAgoCs6SDwZXxjzw6URQCz
	 ObK8bCmauDQPUMTje3TZDAm7Kls18ZuHKPS377BfiuV0ZywKR8XZL+3ez4gSRHSsiH
	 fcRgaWrVtheGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] hwmon: ltc2947-core: Use zero-initialization
 instead of memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-4-manishbaing2789@gmail.com>
References: <20260530221353.159461-4-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:32:21 +0000
Message-Id: <20260530223222.327631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14648-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: 6BB0B613AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Use empty brace initialization (=3D{}) instead of explicit memset()
> to zero-initialize stack memory to simplify the code.
>=20
> No functional change.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530221353.1594=
61-1-manishbaing2789@gmail.com?part=3D3


