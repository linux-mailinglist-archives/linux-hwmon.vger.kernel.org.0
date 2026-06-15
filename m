Return-Path: <linux-hwmon+bounces-15103-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LK/QKz2jL2pzDwUAu9opvQ
	(envelope-from <linux-hwmon+bounces-15103-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 09:01:17 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D761268400D
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 09:01:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WL27Uq5S;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15103-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15103-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD4243006975
	for <lists+linux-hwmon@lfdr.de>; Mon, 15 Jun 2026 06:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2363B2FDD;
	Mon, 15 Jun 2026 06:56:16 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC33B3C14
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 06:56:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506576; cv=none; b=VhQ428G5IpWtOakS16e9XGBcMmltTo2Cx8v8bZnKeO17vARU/M9Wc/SLtUmcRPyG4cq8hzInxcuST9KGasjPIwfDO5eevXvlPKTkxdTt2KT4BKZryKASIpxomiaWLx/tm7TkYYx3laQ6kMUPRzWOho9LGgG6DrBb3QHJ2ROc9YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506576; c=relaxed/simple;
	bh=uTbPznkvHunmA2wSWKxmue4AC/7PkGLCfIVwrVQW1FQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZQOTEj5RkSzP7QXuCSd5dCQ2TLy6Yerl7g6xf6rZK3IV+UxMwVNobXm4U1lKozzouZM38nErb8L+WdyRtXTHC+k7xMt2qsQlbEZwzX5HVAniG7pNDcJbk3Njx2eq5TeeT3L8YcHaDRvcma+bpKHI7ixwGDoicwIdO48KiX+MB5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL27Uq5S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1EA1F000E9;
	Mon, 15 Jun 2026 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781506574;
	bh=pcEPI4bRWExPLPDtB5HcWHtAFqhDFs1UVEB/qwfPoQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WL27Uq5SwhBZjQ/FH0HVBFQ1gnwUfDv3nSylYhEFSDwVOkR754YL3aetBhrDEuYdb
	 wgLB6s9yVUQ26cJx3pOdoM5SgB/DOKbp3iGSuwxq25sNuP0toWCWObLQGbOeGLbOl1
	 Dsg6Tghnu09m6n+GVVX/DY29Z6ZVo16TfYrA9ETNv9AMd0zBMMTnmEpVLJmX4b4sct
	 hGIjRinCQF5MOHxDRvvYgO5BciaGnyiJmYQP4Pyb3l7ApbpOQiDEvaYunxenGxhazF
	 MH2gGs7rwxVHso2Zd0Pzs0+WFlQfeu+GZHTj0hYuyAPE0PkhqMev6TxbfJwVMmK5Sn
	 mF3mSqejSXawA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627hf) remove VID sysfs files on error and
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260615064732.48113-1-pengpeng@iscas.ac.cn>
References: <20260615064732.48113-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 06:56:14 +0000
Message-Id: <20260615065614.BF1EA1F000E9@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-15103-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-hwmon@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,smtp.kernel.org:mid,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D761268400D

> w83627hf_probe() creates cpu0_vid and vrm with device_create_file() when
> VID information is available.
>=20
> The error path and remove callback only remove the common and optional
> attribute groups.  Those groups do not contain cpu0_vid or vrm, so the
> files can remain after a later probe failure or after device removal
> while their callbacks still expect live driver data.
>=20
> Remove the standalone VID sysfs files from both the probe error path and
> the remove callback.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615064732.4811=
3-1-pengpeng@iscas.ac.cn?part=3D1


