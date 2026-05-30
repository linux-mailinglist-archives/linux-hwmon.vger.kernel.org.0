Return-Path: <linux-hwmon+bounces-14651-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEQQIGFnG2oCCAkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14651-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:40:33 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A996613ADB
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 266473037EFF
	for <lists+linux-hwmon@lfdr.de>; Sat, 30 May 2026 22:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C4F377EBC;
	Sat, 30 May 2026 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZY1YDKYj"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2234B3557F3
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780180813; cv=none; b=gogcJ9HWn4C/RKDmj+eHDta0XiYhKN/N2YlPDMbCHB7CkGWevl/e8tgh2yaCx7JjOmli7Le2OZxqHyfCn1g1W3W3nZ3okUUGjk2L+YwYvo6V345WD/h7Cct8DVYURWMiGA3huAmcGh6/MXFZE0AmN97b25g0velYUCk2oKXYIGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780180813; c=relaxed/simple;
	bh=F+F2YXmXWJ1V6PLtfxI8Jcsmhteygszoddq3I/6oWhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZGr25fzTrs40ASbPow9FKaUpc3EC0FVvoC7IJepKzmN8cQOl9lUhgn0RrDd+0jNDCjSTyTPD7zUSjfe3rOaUItI8WRhLhQlPmKYgTikn8KisXJuehQYbsL7HF8E90hfTte9Qxizkz2ktQ05S3ADaWHtWmKShzVeFm8htnbXY0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZY1YDKYj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A54E1F00893;
	Sat, 30 May 2026 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780180811;
	bh=F+F2YXmXWJ1V6PLtfxI8Jcsmhteygszoddq3I/6oWhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZY1YDKYjy+VoV6vB4JPxy1uEG5t/zYJtJndBx/ETtYEIDGmgZMQ0HMmVnBedmEQBu
	 BxSDQvZb1IrGx/WQA6HXK/Pp/cxu5eq46lTKVu3jsVoGGAHWz4X8s2DJbVlgiHhyn/
	 zRJ5uHsI5+/zAhUOVxTbrOAR9d4qqp5fcNGqHE33wmyQPVFic9TH7veTYu6Udk/GZO
	 xK6oPMViY+3O3OCTtP2kyW8vSeK8zBAJ+QUbKoZniZIUvyqwCcBi83FnIj37V/QNPj
	 gGuiI5ekaUR0bUUZUZZUOuSeTQwWGH0KuwqVGx5I9kz97pzsoRr1K0DkBmiew8X739
	 O02McnSdvAYpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] hwmon: pmbus: adm1266: Use zero-initialization
 instead of memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-7-manishbaing2789@gmail.com>
References: <20260530221353.159461-7-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:40:10 +0000
Message-Id: <20260530224011.9A54E1F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14651-lists,linux-hwmon=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 0A996613ADB
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
61-1-manishbaing2789@gmail.com?part=3D6


