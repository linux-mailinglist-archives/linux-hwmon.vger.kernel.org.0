Return-Path: <linux-hwmon+bounces-14647-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFK+CitiG2o2BwkAu9opvQ
	(envelope-from <linux-hwmon+bounces-14647-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:18:19 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F89613902
	for <lists+linux-hwmon@lfdr.de>; Sun, 31 May 2026 00:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67E9D30315FD
	for <lists+linux-hwmon@lfdr.de>; Sat, 30 May 2026 22:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13AE261B9E;
	Sat, 30 May 2026 22:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEvUzDwu"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82C2BD0B
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179496; cv=none; b=FefRkM2znxr+6BZ50sG5hFqdQ3+eb0FGLVQO4OhvBeDuhEjwUMCIh0osSi2CTBwQN77cpUoqniGsiDlcBjdiai6QN+g2h63X8e6wGtGlEYMpFerO9Rll18dDKXBoMEpQclFwhg5QJyx9t2e9flbH8KqmdC1NRKVudbpo+rum8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179496; c=relaxed/simple;
	bh=OiHGctjDdgs4Chu+MKpd71trCL5ZZfnrSclb0+Fz0hQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cgj2kVGGEN73Z+FYVzbuniCyoXHuleeCQ0tk7XTqGgoCLViYBk9YLk+VENUezoHn6xqdy4NNjk5sXOFoQncQTgzT5NIudcZ1TndmmTfw9C1/mtRtlB2tBbYX2HPznVbdfoyb5ggDE1fl/nCNTQvenrcNT2VWQ8CzX+pieoiabJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEvUzDwu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FF71F00893;
	Sat, 30 May 2026 22:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780179495;
	bh=OiHGctjDdgs4Chu+MKpd71trCL5ZZfnrSclb0+Fz0hQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WEvUzDwu/Cz5O7osVH51mByjpMkUuxc+Sa4Fguqqb3WMRrZlASvPtD6jSoGt9sN/F
	 k79GxWu6KzooByAbitjYIRB4IR2XsKpM9E5FApo8Mb1995veYznbPyq2UZQe2gwoje
	 fAIPoumneI9cwTkjbNmVNDIyZajN8B9lYrkgHZuN+NBpV045c+mlq7WXcKgBHWDAJv
	 mDqeQSbkv3itS8f8g7Octy7aOB/+ZJSGa3RzFZ4vYXMFuhZ09iIXN96PgC16VvSfrw
	 G34dFRYh93L6lV/UxKxIgt2xZMsY3ikfmXV504CjEKr82wAMWwAfWHc6j/TQsXP4Eb
	 bujIuPimqoITw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] hwmon: f71882fg: Use zero-initialization instead of
 memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-3-manishbaing2789@gmail.com>
References: <20260530221353.159461-3-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:18:15 +0000
Message-Id: <20260530221815.70FF71F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14647-lists,linux-hwmon=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A9F89613902
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
61-1-manishbaing2789@gmail.com?part=3D2


